#!/bin/bash

cat ./env_openmpi.conf >> /etc/profile
source /etc/profile

cd /opt/cscloud/
mkdir openmpi
cd openmpi
wget http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.3.tar.gz
tar zxvf openmpi-1.8.3.tar.gz

cd openmpi-1.8.3
./configure --prefix=/opt/cscloud/openmpi  2>&1 | tee install1.log  

make all 2>&1 | tee make.log  
make install 2>&1 | tee install2.log  

#mpiexec -np 2 ./examples/hell_f90
