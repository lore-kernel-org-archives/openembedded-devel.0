Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39AD7774F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jun 2016 10:37:02 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <8c01a78d-fd75-d1ce-aa0e-c618f12da265@embed.me.uk>
Date: Fri, 3 Jun 2016 11:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
Subject: opencv 3.1 gcc 6 compile errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2016 10:37:06 -0000
X-Groupsio-MsgNum: 61708
Content-Type: multipart/mixed; boundary="------------D0AD343409D6AC50C3020AB9"

--------------D0AD343409D6AC50C3020AB9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm hitting compile errors with opencv 3.1 and gcc6. I've been playing 
with disabling/enabling different options to try get round the issues 
but it's too widespread.

There is a patch upstream [1] which says it fixes the issues but it 
doesn't seem to help.

I've attached the build log without the patch, and the build log with 
the patch, if anyone has ideas then please shout up.

Cheers,
Jack.

[1] 
https://github.com/Itseez/opencv/pull/6541/commits/a0fdc91a14f07de25d858037940fcd3ba859b4e2

--------------D0AD343409D6AC50C3020AB9
Content-Type: text/x-log;
 name="opencv.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="opencv.log"

DEBUG: Executing shell function do_compile
NOTE: make -j 8
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -H=
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/git -B/home/jack/work/test/build/tmp-gl=
ibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-=
r0/build --check-build-system CMakeFiles/Makefile.cmake 0
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E=
 cmake_progress_start /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/progress.marks
make -f CMakeFiles/Makefile2 all
make[1]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f 3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make 3rdparty/openexr/=
CMakeFiles/IlmImf.dir/depend
make -f modules/core/CMakeFiles/opencv_core_pch_dephelp.dir/build.make modu=
les/core/CMakeFiles/opencv_core_pch_dephelp.dir/depend
make -f modules/core/CMakeFiles/opencv_test_core_pch_dephelp.dir/build.make=
 modules/core/CMakeFiles/opencv_test_core_pch_dephelp.dir/depend
make -f modules/core/CMakeFiles/opencv_perf_core_pch_dephelp.dir/build.make=
 modules/core/CMakeFiles/opencv_perf_core_pch_dephelp.dir/depend
make -f modules/imgproc/CMakeFiles/opencv_imgproc_pch_dephelp.dir/build.mak=
e modules/imgproc/CMakeFiles/opencv_imgproc_pch_dephelp.dir/depend
make -f modules/videoio/CMakeFiles/opencv_videoio_pch_dephelp.dir/build.mak=
e modules/videoio/CMakeFiles/opencv_videoio_pch_dephelp.dir/depend
make -f modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/build=
.make modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/depend
make -f modules/ts/CMakeFiles/opencv_ts_pch_dephelp.dir/build.make modules/=
ts/CMakeFiles/opencv_ts_pch_dephelp.dir/depend
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Generating opencv_core_pch_dephelp.cxx
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/3rdparty/openexr /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/=
jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv=
/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr /home/jack/work/test/b=
uild/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+=
92387b1ef8-r0/build/3rdparty/openexr/CMakeFiles/IlmImf.dir/DependInfo.cmake=
 --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#includ=
e\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/src/precomp.hpp\"=
 > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_core_pch_d=
ephelp.cxx
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Generating opencv_test_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#includ=
e\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/test/test_precomp=
.hpp\" > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux=
-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_test=
_core_pch_dephelp.cxx
[  0%] Generating opencv_perf_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#includ=
e\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/perf/perf_precomp=
.hpp\" > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux=
-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_perf=
_core_pch_dephelp.cxx
[  0%] Generating opencv_imgproc_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#inc=
lude\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-=
gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgproc/src/precomp=
.hpp\" > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux=
-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc/opencv_i=
mgproc_pch_dephelp.cxx
[  0%] Generating opencv_videoio_pch_dephelp.cxx
[  0%] Generating opencv_ts_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#inc=
lude\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-=
gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/videoio/src/precomp=
.hpp\" > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux=
-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio/opencv_v=
ideoio_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#include\=
 \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/ts/src/precomp.hpp\" > /=
home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/o=
pencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/opencv_ts_pch_dephelp.c=
xx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/o=
pencv_core_pch_dephelp.cxx
[  0%] Generating opencv_imgcodecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \#i=
nclude\ \"/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linu=
x-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgcodecs/src/pre=
comp.hpp\" > /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs/op=
encv_imgcodecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/o=
pencv_perf_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ testf=
unction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/openc=
v_ts_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/o=
pencv_test_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ =
testfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/vid=
eoio/opencv_videoio_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/ope=
ncv_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int=
\ testfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/i=
mgcodecs/opencv_imgcodecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/ope=
ncv_perf_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ =
testfunction\(\)\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/img=
proc/opencv_imgproc_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_core_pch_dephelp=
.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ =
testfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-ne=
on-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/video=
io/opencv_videoio_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ testf=
unction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/opencv_=
ts_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ tes=
tfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/ope=
ncv_test_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/opencv_ts_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio/opencv_videoio_pc=
h_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int=
\ testfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/img=
codecs/opencv_imgcodecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_test_core_pch_de=
phelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \ \ =
\return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/open=
cv_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \=
 \ \return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoi=
o/opencv_videoio_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \ \ \r=
eturn\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-=
linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/opencv_t=
s_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_perf_core_pch_de=
phelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo int\ =
testfunction\(\) >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-ne=
on-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgpr=
oc/opencv_imgproc_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >=
> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs/opencv_imgcod=
ecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \ \ =
\return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/open=
cv_test_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_core_pch_dephelp=
.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts/opencv_ts_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \ \ =
\return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/open=
cv_perf_core_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo { >> =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc/opencv_imgproc_pc=
h_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio/opencv_videoio_pc=
h_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_test_core_pch_de=
phelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \=
 \ \ \return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgc=
odecs/opencv_imgcodecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/videoio /home/jack/work/test/build/tmp-glibc/work/cortexa=
9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/j=
ack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio /home/jack/work/test/bui=
ld/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92=
387b1ef8-r0/build/modules/videoio/CMakeFiles/opencv_videoio_pch_dephelp.dir=
/DependInfo.cmake --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/opencv_perf_core_pch_de=
phelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/ts /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/jack/w=
ork/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+g=
itAUTOINC+92387b1ef8-r0/build/modules/ts /home/jack/work/test/build/tmp-gli=
bc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r=
0/build/modules/ts/CMakeFiles/opencv_ts_pch_dephelp.dir/DependInfo.cmake --=
color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/jack=
/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1=
+gitAUTOINC+92387b1ef8-r0/build/modules/core /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/build/modules/core/CMakeFiles/opencv_core_pch_dephelp.dir/DependInfo.=
cmake --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/jack=
/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1=
+gitAUTOINC+92387b1ef8-r0/build/modules/core /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/build/modules/core/CMakeFiles/opencv_test_core_pch_dephelp.dir/Depend=
Info.cmake --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >=
> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs/opencv_imgcod=
ecs_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/jack=
/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1=
+gitAUTOINC+92387b1ef8-r0/build/modules/core /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/build/modules/core/CMakeFiles/opencv_perf_core_pch_dephelp.dir/Depend=
Info.cmake --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo \ \ \=
 \ \return\ 0\; >> /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgpro=
c/opencv_imgproc_pch_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/imgcodecs /home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs /home/jack/work/test=
/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOIN=
C+92387b1ef8-r0/build/modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dep=
help.dir/DependInfo.cmake --color=3D
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E echo } >> =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc/opencv_imgproc_pc=
h_dephelp.cxx
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/imgproc /home/jack/work/test/build/tmp-glibc/work/cortexa=
9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/j=
ack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc /home/jack/work/test/bui=
ld/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92=
387b1ef8-r0/build/modules/imgproc/CMakeFiles/opencv_imgproc_pch_dephelp.dir=
/DependInfo.cmake --color=3D
Scanning dependencies of target opencv_perf_core_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/core/CMakeFiles/opencv_perf_core_pch_dephelp.dir/build.make=
 modules/core/CMakeFiles/opencv_perf_core_pch_dephelp.dir/build
Scanning dependencies of target opencv_ts_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/ts/CMakeFiles/opencv_ts_pch_dephelp.dir/build.make modules/=
ts/CMakeFiles/opencv_ts_pch_dephelp.dir/build
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
Scanning dependencies of target opencv_videoio_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/videoio/CMakeFiles/opencv_videoio_pch_dephelp.dir/build.mak=
e modules/videoio/CMakeFiles/opencv_videoio_pch_dephelp.dir/build
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object modules/core/CMakeFiles/opencv_perf_core_pch_dep=
help.dir/opencv_perf_core_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -D__OPENCV_BUILD=3D1 -isystem /home/jack/work/tes=
t/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOI=
NC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/tmp-glibc/sysroo=
ts/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/ts/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/include=
 -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgcodecs/include -I/hom=
e/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgproc/include -I/home/jack/wo=
rk/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gi=
tAUTOINC+92387b1ef8-r0/git/modules/videoio/include -I/home/jack/work/test/b=
uild/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+=
92387b1ef8-r0/git/modules/highgui/include -I/home/jack/work/test/build/tmp-=
glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef=
8-r0/git/modules/core/perf  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-ab=
i=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/includ=
e   --sysroot=3D/home/jack/work/test/build/tmp-glibc/sysroots/test  -O2 -pi=
pe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUT=
OINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1+gitAUTOINC+92387b1ef8-r0 -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linu=
x=3D -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/tes=
t=3D  -fvisibility-inlines-hidden   -fsigned-char -W -Wall -Werror=3Dreturn=
-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3Dsequence-point=
 -Wformat -Werror=3Dformat-security -Wmissing-declarations -Wundef -Winit-s=
elf -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowing -Wno-delete-non-vi=
rtual-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffuncti=
on-sections -fvisibility=3Dhidden -fvisibility-inlines-hidden -DNDEBUG  -DN=
DEBUG   -o CMakeFiles/opencv_perf_core_pch_dephelp.dir/opencv_perf_core_pch=
_dephelp.cxx.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/op=
encv_perf_core_pch_dephelp.cxx
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
Scanning dependencies of target opencv_test_core_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/core/CMakeFiles/opencv_test_core_pch_dephelp.dir/build.make=
 modules/core/CMakeFiles/opencv_test_core_pch_dephelp.dir/build
[  0%] Building CXX object modules/videoio/CMakeFiles/opencv_videoio_pch_de=
phelp.dir/opencv_videoio_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueab=
i/arm-oe-linux-gnueabi-g++   -DVIDEOIO_EXPORTS -D__OPENCV_BUILD=3D1 -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/b=
uild/tmp-glibc/sysroots/test/usr/include/eigen3 -isystem /home/jack/work/te=
st/build/tmp-glibc/sysroots/test/usr/include/gstreamer-1.0 -isystem /home/j=
ack/work/test/build/tmp-glibc/sysroots/test/usr/lib/gstreamer-1.0/include -=
isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/glib=
-2.0 -isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/lib/gl=
ib-2.0/include -isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/=
usr/include/gphoto2 -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/video=
io/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/videoio/src -I=
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio -I/home/jack/work=
/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitA=
UTOINC+92387b1ef8-r0/git/modules/core/include -I/home/jack/work/test/build/=
tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387=
b1ef8-r0/git/modules/imgproc/include -I/home/jack/work/test/build/tmp-glibc=
/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/=
git/modules/imgcodecs/include  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat=
-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/test/build/tmp-glibc/work/c=
ortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/inc=
lude   --sysroot=3D/home/jack/work/test/build/tmp-glibc/sysroots/test  -O2 =
-pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1+gitAUTOINC+92387b1ef8-r0 =
-fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-l=
inux=3D -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/=
test=3D  -fvisibility-inlines-hidden   -fsigned-char -W -Wall -Werror=3Dret=
urn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3Dsequence-po=
int -Wformat -Werror=3Dformat-security -Wmissing-declarations -Wundef -Wini=
t-self -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowing -Wno-delete-non=
-virtual-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffun=
ction-sections -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-depre=
cated-declarations -DNDEBUG  -DNDEBUG   -o CMakeFiles/opencv_videoio_pch_de=
phelp.dir/opencv_videoio_pch_dephelp.cxx.o -c /home/jack/work/test/build/tm=
p-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1=
ef8-r0/build/modules/videoio/opencv_videoio_pch_dephelp.cxx
Scanning dependencies of target opencv_imgproc_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/imgproc/CMakeFiles/opencv_imgproc_pch_dephelp.dir/build.mak=
e modules/imgproc/CMakeFiles/opencv_imgproc_pch_dephelp.dir/build
[  0%] Building CXX object modules/ts/CMakeFiles/opencv_ts_pch_dephelp.dir/=
opencv_ts_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm=
-oe-linux-gnueabi-g++   -D__OPENCV_BUILD=3D1 -isystem /home/jack/work/test/=
build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC=
+92387b1ef8-r0/build -isystem /home/jack/work/test/build/tmp-glibc/sysroots=
/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/=
ts/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/ts/src -I/home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts -I/home/jack/work/test/buil=
d/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+923=
87b1ef8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/=
work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/g=
it/modules/imgproc/include -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/imgcodecs/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/video=
io/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/highgui/includ=
e  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a=
9 -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnue=
abi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jac=
k/work/test/build/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-=
debug-types -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr=
/src/debug/opencv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/j=
ack/work/test/build/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=
=3D/home/jack/work/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inli=
nes-hidden   -fsigned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-vir=
tual-dtor -Werror=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dfor=
mat-security -Wmissing-declarations  -Winit-self -Wpointer-arith -Wshadow -=
Wsign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-=
option -pthread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhid=
den -fvisibility-inlines-hidden -Wno-undef -DNDEBUG  -DNDEBUG   -o CMakeFil=
es/opencv_ts_pch_dephelp.dir/opencv_ts_pch_dephelp.cxx.o -c /home/jack/work=
/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitA=
UTOINC+92387b1ef8-r0/build/modules/ts/opencv_ts_pch_dephelp.cxx
Scanning dependencies of target opencv_imgcodecs_pch_dephelp
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/build=
.make modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/build
Scanning dependencies of target opencv_core_pch_dephelp
[  0%] Building CXX object modules/core/CMakeFiles/opencv_test_core_pch_dep=
help.dir/opencv_test_core_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -D__OPENCV_BUILD=3D1 -isystem /home/jack/work/tes=
t/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOI=
NC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/tmp-glibc/sysroo=
ts/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/ts/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/include=
 -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgcodecs/include -I/hom=
e/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/videoio/include -I/home/jack/wo=
rk/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gi=
tAUTOINC+92387b1ef8-r0/git/modules/imgproc/include -I/home/jack/work/test/b=
uild/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+=
92387b1ef8-r0/git/modules/highgui/include -I/home/jack/work/test/build/tmp-=
glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef=
8-r0/git/modules/core/test  -march=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-ab=
i=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/includ=
e   --sysroot=3D/home/jack/work/test/build/tmp-glibc/sysroots/test  -O2 -pi=
pe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUT=
OINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1+gitAUTOINC+92387b1ef8-r0 -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linu=
x=3D -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/sysroots/tes=
t=3D  -fvisibility-inlines-hidden   -fsigned-char -W -Wall -Werror=3Dreturn=
-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3Dsequence-point=
 -Wformat -Werror=3Dformat-security -Wmissing-declarations -Wundef -Winit-s=
elf -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowing -Wno-delete-non-vi=
rtual-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffuncti=
on-sections -fvisibility=3Dhidden -fvisibility-inlines-hidden -DNDEBUG  -DN=
DEBUG   -o CMakeFiles/opencv_test_core_pch_dephelp.dir/opencv_test_core_pch=
_dephelp.cxx.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/op=
encv_test_core_pch_dephelp.cxx
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/core/CMakeFiles/opencv_core_pch_dephelp.dir/build.make modu=
les/core/CMakeFiles/opencv_core_pch_dephelp.dir/build
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object modules/imgproc/CMakeFiles/opencv_imgproc_pch_de=
phelp.dir/opencv_imgproc_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueab=
i/arm-oe-linux-gnueabi-g++   -D__OPENCV_BUILD=3D1 -isystem /home/jack/work/=
test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAU=
TOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/tmp-glibc/sys=
roots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp-glibc/work/c=
ortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mod=
ules/imgproc/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgp=
roc/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linu=
x-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc -I/home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/include  -march=3Darmv7-a -=
marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/t=
est/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUT=
OINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/tmp=
-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-p=
refix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-li=
nux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1=
+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/build/t=
mp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/test=
/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigned-c=
har -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Dadd=
ress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmissing-=
declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wno=
-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pthread =
-fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisibility=
-inlines-hidden -DNDEBUG  -DNDEBUG   -o CMakeFiles/opencv_imgproc_pch_dephe=
lp.dir/opencv_imgproc_pch_dephelp.cxx.o -c /home/jack/work/test/build/tmp-g=
libc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8=
-r0/build/modules/imgproc/opencv_imgproc_pch_dephelp.cxx
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pc=
h_dephelp.dir/opencv_imgcodecs_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs && /home/jac=
k/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnue=
abi/arm-oe-linux-gnueabi-g++   -DHAVE_WEBP -DIMGCODECS_EXPORTS -D__OPENCV_B=
UILD=3D1 -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/=
jack/work/test/build/tmp-glibc/sysroots/test/usr/include/eigen3 -isystem /h=
ome/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isystem /home/jac=
k/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.=
1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /home/jack/wo=
rk/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gi=
tAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home/jack/work/=
test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAU=
TOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf -I/home/jack/work/test/buil=
d/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+923=
87b1ef8-r0/git/modules/imgcodecs/include -I/home/jack/work/test/build/tmp-g=
libc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8=
-r0/git/modules/imgcodecs/src -I/home/jack/work/test/build/tmp-glibc/work/c=
ortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/m=
odules/imgcodecs -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neo=
n-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/inc=
lude -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-g=
nueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgproc/include  -ma=
rch=3Darmv7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work=
/test/build/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-=
types -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/d=
ebug/opencv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/wo=
rk/test/build/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home=
/jack/work/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidd=
en   -fsigned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dto=
r -Werror=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-secu=
rity -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -W=
sign-promo -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-o=
ption -pthread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidd=
en -fvisibility-inlines-hidden -Wno-deprecated-declarations -DNDEBUG  -DNDE=
BUG   -o CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/opencv_imgcodecs_pch_d=
ephelp.cxx.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgcodecs=
/opencv_imgcodecs_pch_dephelp.cxx
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core_pch_dephelp.=
dir/opencv_core_pch_dephelp.cxx.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -D__OPENCV_BUILD=3D1 -isystem /home/jack/work/tes=
t/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOI=
NC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/tmp-glibc/sysroo=
ts/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/core/include -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/src -=
I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi=
/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/home/jack/work/t=
est/build/tmp-glibc/sysroots/test/usr/include  -march=3Darmv7-a -marm -mfpu=
=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/test/build/=
tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387=
b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/tmp-glibc/sys=
roots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=
=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1+gitAUTOI=
NC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/=
sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/test/build/tm=
p-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigned-char -W -W=
all -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Wer=
ror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmissing-declarati=
ons -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowin=
g -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pthread -fomit-fr=
ame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisibility-inlines-=
hidden -DNDEBUG  -DNDEBUG   -o CMakeFiles/opencv_core_pch_dephelp.dir/openc=
v_core_pch_dephelp.cxx.o -c /home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modul=
es/core/opencv_core_pch_dephelp.cxx
Scanning dependencies of target IlmImf
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f 3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make 3rdparty/openexr/=
CMakeFiles/IlmImf.dir/build
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/stl_algo.h:59:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/algorithm:62,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
include/opencv2/core/base.hpp:53,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
include/opencv2/core.hpp:54,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgco=
decs/include/opencv2/imgcodecs.hpp:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/imgco=
decs/src/precomp.hpp:45,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/img=
codecs/opencv_imgcodecs_pch_dephelp.cxx:1:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir/build.make:74=
: recipe for target 'modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_deph=
elp.dir/opencv_imgcodecs_pch_dephelp.cxx.o' failed
make[2]: *** [modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir=
/opencv_imgcodecs_pch_dephelp.cxx.o] Error 1
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
CMakeFiles/Makefile2:5564: recipe for target 'modules/imgcodecs/CMakeFiles/=
opencv_imgcodecs_pch_dephelp.dir/all' failed
make[1]: *** [modules/imgcodecs/CMakeFiles/opencv_imgcodecs_pch_dephelp.dir=
/all] Error 2
make[1]: *** Waiting for unfinished jobs....
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexTh=
rowErrnoExc.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/Iex/Ie=
xThrowErrnoExc.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/op=
enexr/Iex/IexThrowErrnoExc.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/Half/half=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/Half/h=
alf.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half/=
half.cpp
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexBaseExc.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexThrowErrnoExc.h:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexThrowErrnoExc.cpp:44:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:89: recipe for target '3r=
dparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexThrowErrnoExc.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexThrowErrnoExc.c=
pp.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/locale_classes.h:40,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/ios_base.h:41,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ios:42,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ostream:38,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/iostream:39,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Half/half.h:88,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Half/half.cpp:48:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:65: recipe for target '3r=
dparty/openexr/CMakeFiles/IlmImf.dir/Half/half.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/Half/half.cpp.o] Error=
 1
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
CMakeFiles/Makefile2:303: recipe for target '3rdparty/openexr/CMakeFiles/Il=
mImf.dir/all' failed
make[1]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/all] Error 2
[  0%] Linking CXX static library ../../lib/libopencv_perf_core_pch_dephelp=
.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles/op=
encv_perf_core_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_sc=
ript CMakeFiles/opencv_perf_core_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_perf_core_pch_dephelp.a  CMa=
keFiles/opencv_perf_core_pch_dephelp.dir/opencv_perf_core_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_perf_core_pch_=
dephelp.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_perf_core_pch_dephelp
[  0%] Linking CXX static library ../../lib/libopencv_videoio_pch_dephelp.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles=
/opencv_videoio_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/videoio && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link=
_script CMakeFiles/opencv_videoio_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_videoio_pch_dephelp.a  CMake=
Files/opencv_videoio_pch_dephelp.dir/opencv_videoio_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_videoio_pch_de=
phelp.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_videoio_pch_dephelp
[  0%] Linking CXX static library ../../lib/libopencv_core_pch_dephelp.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles/op=
encv_core_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_sc=
ript CMakeFiles/opencv_core_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_core_pch_dephelp.a  CMakeFil=
es/opencv_core_pch_dephelp.dir/opencv_core_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_core_pch_dephe=
lp.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_core_pch_dephelp
[  0%] Linking CXX static library ../../lib/libopencv_imgproc_pch_dephelp.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles=
/opencv_imgproc_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/imgproc && /home/jack/=
work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link=
_script CMakeFiles/opencv_imgproc_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_imgproc_pch_dephelp.a  CMake=
Files/opencv_imgproc_pch_dephelp.dir/opencv_imgproc_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_imgproc_pch_de=
phelp.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_imgproc_pch_dephelp
[  0%] Linking CXX static library ../../lib/libopencv_ts_pch_dephelp.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles/open=
cv_ts_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/ts && /home/jack/work/=
test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_scri=
pt CMakeFiles/opencv_ts_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_ts_pch_dephelp.a  CMakeFiles=
/opencv_ts_pch_dephelp.dir/opencv_ts_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_ts_pch_dephelp=
.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_ts_pch_dephelp
[  0%] Linking CXX static library ../../lib/libopencv_test_core_pch_dephelp=
.a
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -P CMakeFiles/op=
encv_test_core_pch_dephelp.dir/cmake_clean_target.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_sc=
ript CMakeFiles/opencv_test_core_pch_dephelp.dir/link.txt --verbose=3D1
arm-oe-linux-gnueabi-ar qc ../../lib/libopencv_test_core_pch_dephelp.a  CMa=
keFiles/opencv_test_core_pch_dephelp.dir/opencv_test_core_pch_dephelp.cxx.o
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-ranlib ../../lib/libopencv_test_core_pch_=
dephelp.a
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Built target opencv_test_core_pch_dephelp
make[1]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
Makefile:163: recipe for target 'all' failed
make: *** [all] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at /home/jack/work/=
test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAU=
TOINC+92387b1ef8-r0/temp/log.do_compile.28541)

--------------D0AD343409D6AC50C3020AB9
Content-Type: text/x-log;
 name="opencv-gcc6patch.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="opencv-gcc6patch.log"

DEBUG: Executing shell function do_compile
NOTE: make -j 8
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -H=
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/git -B/home/jack/work/test/build/tmp-gl=
ibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-=
r0/build --check-build-system CMakeFiles/Makefile.cmake 0
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E=
 cmake_progress_start /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles =
/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/=
opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/CMakeFiles/progress.marks
make -f CMakeFiles/Makefile2 all
make[1]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f 3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make 3rdparty/openexr/=
CMakeFiles/IlmImf.dir/depend
make -f modules/core/CMakeFiles/opencv_core.dir/build.make modules/core/CMa=
keFiles/opencv_core.dir/depend
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/3rdparty/openexr /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/=
jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv=
/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr /home/jack/work/test/b=
uild/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+=
92387b1ef8-r0/build/3rdparty/openexr/CMakeFiles/IlmImf.dir/DependInfo.cmake=
 --color=3D
[  0%] Generating opencl_kernels_core.cpp, opencl_kernels_core.hpp
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -DMODULE_NAME=3D=
core -DCL_DIR=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/src/op=
encl -DOUTPUT=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core/open=
cl_kernels_core.cpp -P /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/cmake/cl2cpp=
.cmake
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build && /home/jack/work/test/build/=
tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_depends "Unix Makefi=
les" /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnu=
eabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build /home/jack=
/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1=
+gitAUTOINC+92387b1ef8-r0/build/modules/core /home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/build/modules/core/CMakeFiles/opencv_core.dir/DependInfo.cmake --colo=
r=3D
Scanning dependencies of target IlmImf
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f 3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make 3rdparty/openexr/=
CMakeFiles/IlmImf.dir/build
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/Half/half=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/Half/h=
alf.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-l=
inux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half/=
half.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexBa=
seExc.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/Iex/Ie=
xBaseExc.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/=
Iex/IexBaseExc.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexTh=
rowErrnoExc.cpp.o
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread=
/IlmThreadPosix.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/IlmThr=
ead/IlmThreadPosix.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdpart=
y/openexr/IlmThread/IlmThreadPosix.cpp
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/Iex/Ie=
xThrowErrnoExc.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/op=
enexr/Iex/IexThrowErrnoExc.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread=
/IlmThreadPool.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/IlmThr=
ead/IlmThreadPool.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty=
/openexr/IlmThread/IlmThreadPool.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread=
/IlmThreadMutex.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/IlmThr=
ead/IlmThreadMutex.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdpart=
y/openexr/IlmThread/IlmThreadMutex.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread=
/IlmThreadSemaphorePosix.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/IlmThr=
ead/IlmThreadSemaphorePosix.cpp.o -c /home/jack/work/test/build/tmp-glibc/w=
ork/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/gi=
t/3rdparty/openexr/IlmThread/IlmThreadSemaphorePosix.cpp
[  0%] Building CXX object 3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread=
/IlmThread.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr && /home/jack=
/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnuea=
bi/arm-oe-linux-gnueabi-g++    -isystem /home/jack/work/test/build/tmp-glib=
c/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=
/build -isystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-o=
e-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/3rdparty/openexr =
-isystem /home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include -is=
ystem /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gn=
ueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Half -isyste=
m /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueab=
i/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Iex -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmThread -isystem /h=
ome/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/op=
encv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/Imath -isystem /home=
/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/openc=
v/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/openexr/IlmImf  -march=3Darmv7-=
a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/wor=
k/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+git=
AUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/=
tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebu=
g-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe=
-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/=
3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/buil=
d/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/t=
est/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigne=
d-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3D=
address -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security   -Wini=
t-self -Wpointer-arith  -Wsign-promo -Wno-narrowing -Wno-delete-non-virtual=
-dtor -fdiagnostics-show-option -pthread -fomit-frame-pointer -ffunction-se=
ctions -fvisibility=3Dhidden -fvisibility-inlines-hidden -Wno-shadow -Wno-u=
nused -Wno-sign-compare -Wno-undef -Wno-missing-declarations -Wno-uninitial=
ized -Wno-switch -Wno-parentheses -Wno-array-bounds -Wno-extra -Wno-depreca=
ted-declarations -fPIC -DNDEBUG  -DNDEBUG   -o CMakeFiles/IlmImf.dir/IlmThr=
ead/IlmThread.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/ope=
nexr/IlmThread/IlmThread.cpp
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/locale_classes.h:40,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/ios_base.h:41,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ios:42,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/istream:38,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/sstream:38,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexMacros.h:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/Iex.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/IlmThread/IlmThreadPosix.cpp:47:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/locale_classes.h:40,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/ios_base.h:41,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ios:42,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ostream:38,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/iostream:39,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Half/half.h:88,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Half/half.cpp:48:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:65: recipe for target '3r=
dparty/openexr/CMakeFiles/IlmImf.dir/Half/half.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/Half/half.cpp.o] Error=
 1
make[2]: *** Waiting for unfinished jobs....
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:137: recipe for target '3=
rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadPosix.cpp.o' faile=
d
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadPos=
ix.cpp.o] Error 1
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexBaseExc.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexThrowErrnoExc.h:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexThrowErrnoExc.cpp:44:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexBaseExc.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexBaseExc.cpp:43:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:89: recipe for target '3r=
dparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexThrowErrnoExc.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexThrowErrnoExc.c=
pp.o] Error 1
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/locale_classes.h:40,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/ios_base.h:41,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ios:42,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/istream:38,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/sstream:38,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexMacros.h:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/Iex.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/IlmThread/IlmThreadPool.cpp:45:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:113: recipe for target '3=
rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexBaseExc.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/Iex/IexBaseExc.cpp.o] =
Error 1
In file included from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ext/string_conversions.h:41:0,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/basic_string.h:5402,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/string:52,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/locale_classes.h:40,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/bits/ios_base.h:41,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/ios:42,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/istream:38,
                 from /home/jack/work/test/build/tmp-glibc/sysroots/test/us=
r/include/c++/6.1.1/sstream:38,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/IexMacros.h:46,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/Iex/Iex.h:48,
                 from /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/3rdparty/open=
exr/IlmThread/IlmThreadSemaphorePosix.cpp:47:
/home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include/c++/6.1.1/cs=
tdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
                         ^
compilation terminated.
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:209: recipe for target '3=
rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadPool.cpp.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadPoo=
l.cpp.o] Error 1
3rdparty/openexr/CMakeFiles/IlmImf.dir/build.make:185: recipe for target '3=
rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadSemaphorePosix.cpp=
.o' failed
make[2]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/IlmThread/IlmThreadSem=
aphorePosix.cpp.o] Error 1
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
CMakeFiles/Makefile2:303: recipe for target '3rdparty/openexr/CMakeFiles/Il=
mImf.dir/all' failed
make[1]: *** [3rdparty/openexr/CMakeFiles/IlmImf.dir/all] Error 2
make[1]: *** Waiting for unfinished jobs....
Scanning dependencies of target opencv_core
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
make -f modules/core/CMakeFiles/opencv_core.dir/build.make modules/core/CMa=
keFiles/opencv_core.dir/build
make[2]: Entering directory '/home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/arit=
hm.cpp.o
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/open=
gl.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/arithm.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/arithm.cpp
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/opengl.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/opengl.cpp
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/matm=
ul.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/matmul.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/matmul.cpp
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/comm=
and_line_parser.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/command_line_parser.cpp.o -c /home/jack/work/test/build/tmp-glibc/w=
ork/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/gi=
t/modules/core/src/command_line_parser.cpp
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/math=
funcs.cpp.o
[  0%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/dire=
ctx.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/mathfuncs.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/=
core/src/mathfuncs.cpp
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/directx.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9=
hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/co=
re/src/directx.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/para=
llel.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/parallel.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa=
9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/c=
ore/src/parallel.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/spli=
t.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/split.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/split.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/glob=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/glob.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
src/glob.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/tabl=
es.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/tables.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/tables.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/allo=
c.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/alloc.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/alloc.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/type=
s.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/types.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/types.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/arra=
y.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/array.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/array.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/gl_c=
ore_3_1.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/gl_core_3_1.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/core/src/gl_core_3_1.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/cuda=
_stream.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/cuda_stream.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/core/src/cuda_stream.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/ocl.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/ocl.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/ocl.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/data=
structs.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/datastructs.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/core/src/datastructs.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/va_i=
ntel.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/va_intel.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa=
9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/c=
ore/src/va_intel.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/umat=
rix.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/umatrix.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9=
hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/co=
re/src/umatrix.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/rand=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/rand.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
src/rand.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/para=
llel_pthreads.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/parallel_pthreads.cpp.o -c /home/jack/work/test/build/tmp-glibc/wor=
k/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/=
modules/core/src/parallel_pthreads.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/syst=
em.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/system.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/system.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/cuda=
_gpu_mat.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/cuda_gpu_mat.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cor=
texa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modul=
es/core/src/cuda_gpu_mat.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/pca.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/pca.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/pca.cpp
[  1%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/conv=
ert.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/convert.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9=
hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/co=
re/src/convert.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/dxt.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/dxt.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/dxt.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/down=
hill_simplex.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/downhill_simplex.cpp.o -c /home/jack/work/test/build/tmp-glibc/work=
/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/m=
odules/core/src/downhill_simplex.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/lapa=
ck.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/lapack.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/lapack.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/cuda=
_host_mem.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/cuda_host_mem.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/co=
rtexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modu=
les/core/src/cuda_host_mem.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/open=
cl/runtime/opencl_clamdblas.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/opencl/runtime/opencl_clamdblas.cpp.o -c /home/jack/work/test/build=
/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+9238=
7b1ef8-r0/git/modules/core/src/opencl/runtime/opencl_clamdblas.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/open=
cl/runtime/opencl_clamdfft.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/opencl/runtime/opencl_clamdfft.cpp.o -c /home/jack/work/test/build/=
tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387=
b1ef8-r0/git/modules/core/src/opencl/runtime/opencl_clamdfft.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/open=
cl/runtime/opencl_core.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/opencl/runtime/opencl_core.cpp.o -c /home/jack/work/test/build/tmp-=
glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef=
8-r0/git/modules/core/src/opencl/runtime/opencl_core.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/cuda=
_info.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/cuda_info.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/=
core/src/cuda_info.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/copy=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/copy.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
src/copy.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/matr=
ix.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/matrix.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/matrix.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/lpso=
lver.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/lpsolver.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa=
9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/c=
ore/src/lpsolver.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/kmea=
ns.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/kmeans.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9h=
f-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/cor=
e/src/kmeans.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/matr=
ix_decomp.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/matrix_decomp.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/co=
rtexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modu=
les/core/src/matrix_decomp.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/pers=
istence.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/persistence.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cort=
exa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/module=
s/core/src/persistence.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/conj=
ugate_gradient.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/conjugate_gradient.cpp.o -c /home/jack/work/test/build/tmp-glibc/wo=
rk/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git=
/modules/core/src/conjugate_gradient.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/stat=
.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/stat.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-=
neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/=
src/stat.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/merg=
e.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/merge.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/merge.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/algo=
rithm.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/algorithm.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortex=
a9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/=
core/src/algorithm.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/lda.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/lda.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/lda.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/stl.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/stl.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/stl.cpp
[  2%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/math=
funcs_core.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/mathfuncs_core.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/c=
ortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mod=
ules/core/src/mathfuncs_core.cpp
[  3%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/out.=
cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/out.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-n=
eon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core/s=
rc/out.cpp
[  3%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/src/mato=
p.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/src/matop.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/cortexa9hf=
-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/modules/core=
/src/matop.cpp
[  3%] Building CXX object modules/core/CMakeFiles/opencv_core.dir/opencl_k=
ernels_core.cpp.o
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/a=
rm-oe-linux-gnueabi-g++   -DCVAPI_EXPORTS -D__OPENCV_BUILD=3D1 -isystem /ho=
me/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/ope=
ncv/3.1+gitAUTOINC+92387b1ef8-r0/build -isystem /home/jack/work/test/build/=
tmp-glibc/sysroots/test/usr/include/eigen3 -I/home/jack/work/test/build/tmp=
-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1e=
f8-r0/git/modules/core/include -I/home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/git/mo=
dules/core/src -I/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-=
oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core -I/=
home/jack/work/test/build/tmp-glibc/sysroots/test/usr/include  -march=3Darm=
v7-a -marm -mfpu=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/=
work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+=
gitAUTOINC+92387b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/bui=
ld/tmp-glibc/sysroots/test  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon=
-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/b=
uild/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/wor=
k/test/build/tmp-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsi=
gned-char -W -Wall -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=
=3Daddress -Werror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmi=
ssing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-prom=
o -Wno-narrowing -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pt=
hread -fomit-frame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisi=
bility-inlines-hidden -DNDEBUG  -DNDEBUG -fPIC   -o CMakeFiles/opencv_core.=
dir/opencl_kernels_core.cpp.o -c /home/jack/work/test/build/tmp-glibc/work/=
cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/=
modules/core/opencl_kernels_core.cpp
[  3%] Linking CXX shared library ../../lib/libopencv_core.so
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_link_sc=
ript CMakeFiles/opencv_core.dir/link.txt --verbose=3D1
/home/jack/work/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-oe-l=
inux-gnueabi/arm-oe-linux-gnueabi-g++  -fPIC  -march=3Darmv7-a -marm -mfpu=
=3Dneon  -mfloat-abi=3Dhard -mcpu=3Dcortex-a9 -I/home/jack/work/test/build/=
tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387=
b1ef8-r0/git/include   --sysroot=3D/home/jack/work/test/build/tmp-glibc/sys=
roots/test  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=
=3D/home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0=3D/usr/src/debug/opencv/3.1+gitAUTOI=
NC+92387b1ef8-r0 -fdebug-prefix-map=3D/home/jack/work/test/build/tmp-glibc/=
sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/home/jack/work/test/build/tm=
p-glibc/sysroots/test=3D  -fvisibility-inlines-hidden   -fsigned-char -W -W=
all -Werror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Wer=
ror=3Dsequence-point -Wformat -Werror=3Dformat-security -Wmissing-declarati=
ons -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wno-narrowin=
g -Wno-delete-non-virtual-dtor -fdiagnostics-show-option -pthread -fomit-fr=
ame-pointer -ffunction-sections -fvisibility=3Dhidden -fvisibility-inlines-=
hidden -DNDEBUG  -DNDEBUG  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -=
shared -Wl,-soname,libopencv_core.so.3.1 -o ../../lib/libopencv_core.so.3.1=
.0 CMakeFiles/opencv_core.dir/src/arithm.cpp.o CMakeFiles/opencv_core.dir/s=
rc/opengl.cpp.o CMakeFiles/opencv_core.dir/src/command_line_parser.cpp.o CM=
akeFiles/opencv_core.dir/src/matmul.cpp.o CMakeFiles/opencv_core.dir/src/di=
rectx.cpp.o CMakeFiles/opencv_core.dir/src/parallel.cpp.o CMakeFiles/opencv=
_core.dir/src/mathfuncs.cpp.o CMakeFiles/opencv_core.dir/src/split.cpp.o CM=
akeFiles/opencv_core.dir/src/glob.cpp.o CMakeFiles/opencv_core.dir/src/tabl=
es.cpp.o CMakeFiles/opencv_core.dir/src/alloc.cpp.o CMakeFiles/opencv_core.=
dir/src/types.cpp.o CMakeFiles/opencv_core.dir/src/array.cpp.o CMakeFiles/o=
pencv_core.dir/src/gl_core_3_1.cpp.o CMakeFiles/opencv_core.dir/src/cuda_st=
ream.cpp.o CMakeFiles/opencv_core.dir/src/ocl.cpp.o CMakeFiles/opencv_core.=
dir/src/datastructs.cpp.o CMakeFiles/opencv_core.dir/src/va_intel.cpp.o CMa=
keFiles/opencv_core.dir/src/umatrix.cpp.o CMakeFiles/opencv_core.dir/src/ra=
nd.cpp.o CMakeFiles/opencv_core.dir/src/parallel_pthreads.cpp.o CMakeFiles/=
opencv_core.dir/src/system.cpp.o CMakeFiles/opencv_core.dir/src/cuda_gpu_ma=
t.cpp.o CMakeFiles/opencv_core.dir/src/pca.cpp.o CMakeFiles/opencv_core.dir=
/src/convert.cpp.o CMakeFiles/opencv_core.dir/src/dxt.cpp.o CMakeFiles/open=
cv_core.dir/src/downhill_simplex.cpp.o CMakeFiles/opencv_core.dir/src/lapac=
k.cpp.o CMakeFiles/opencv_core.dir/src/cuda_host_mem.cpp.o CMakeFiles/openc=
v_core.dir/src/opencl/runtime/opencl_clamdblas.cpp.o CMakeFiles/opencv_core=
.dir/src/opencl/runtime/opencl_clamdfft.cpp.o CMakeFiles/opencv_core.dir/sr=
c/opencl/runtime/opencl_core.cpp.o CMakeFiles/opencv_core.dir/src/cuda_info=
.cpp.o CMakeFiles/opencv_core.dir/src/copy.cpp.o CMakeFiles/opencv_core.dir=
/src/matrix.cpp.o CMakeFiles/opencv_core.dir/src/lpsolver.cpp.o CMakeFiles/=
opencv_core.dir/src/kmeans.cpp.o CMakeFiles/opencv_core.dir/src/matrix_deco=
mp.cpp.o CMakeFiles/opencv_core.dir/src/persistence.cpp.o CMakeFiles/opencv=
_core.dir/src/conjugate_gradient.cpp.o CMakeFiles/opencv_core.dir/src/stat.=
cpp.o CMakeFiles/opencv_core.dir/src/merge.cpp.o CMakeFiles/opencv_core.dir=
/src/algorithm.cpp.o CMakeFiles/opencv_core.dir/src/lda.cpp.o CMakeFiles/op=
encv_core.dir/src/stl.cpp.o CMakeFiles/opencv_core.dir/src/mathfuncs_core.c=
pp.o CMakeFiles/opencv_core.dir/src/out.cpp.o CMakeFiles/opencv_core.dir/sr=
c/matop.cpp.o CMakeFiles/opencv_core.dir/opencl_kernels_core.cpp.o -lz -ldl=
 -lm -lpthread -lrt -ltbb=20
cd /home/jack/work/test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnuea=
bi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build/modules/core && /home/jack/wor=
k/test/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/cmake -E cmake_symlink=
_library ../../lib/libopencv_core.so.3.1.0 ../../lib/libopencv_core.so.3.1 =
../../lib/libopencv_core.so
make[2]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
[  3%] Built target opencv_core
make[1]: Leaving directory '/home/jack/work/test/build/tmp-glibc/work/corte=
xa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAUTOINC+92387b1ef8-r0/build'
Makefile:163: recipe for target 'all' failed
make: *** [all] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at /home/jack/work/=
test/build/tmp-glibc/work/cortexa9hf-neon-oe-linux-gnueabi/opencv/3.1+gitAU=
TOINC+92387b1ef8-r0/temp/log.do_compile.2290)

--------------D0AD343409D6AC50C3020AB9--
