g++ -std=c++17  -Wall -Wno-unknown-pragmas -O3 \
    -DFPGA_DEVICE -DC_KERNEL -DHW_SIM \
    -Isrc/rapid_json \
    -I/opt/xilinx/xrt/include \
    -I/home/x4/Software/Xilinx/Vitis_HLS/2022.2/include \
    -Isrc -c src/host.cpp \
    -o src/host.o 

g++ -std=c++17  -Wall -Wno-unknown-pragmas -O3 \
    -DFPGA_DEVICE -DC_KERNEL -DHW_SIM \
    -Isrc/rapid_json \
    -I/opt/xilinx/xrt/include \
    -I/home/x4/Software/Xilinx/Vitis_HLS/2022.2/include \
    -Isrc -c src/xcl2.cpp \
    -o src/xcl2.o

g++ -o src/bin/test.real.out \
    src/host.o src/xcl2.o \
    -L/opt/xilinx/xrt/lib \
    -lxilinxopencl -lpthread -lrt -lstdc++ -luuid -lxrt_core
