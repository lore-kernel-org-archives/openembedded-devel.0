Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SOXZb-0002fu-0J
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 19:06:11 +0200
Received: by wgbdr1 with SMTP id dr1so1800793wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:x-priority:subject:date:to:message-id
	:mime-version:x-mailer;
	bh=K5JAsXTwIxUA6IL2SCSkskv1nhDxgGa6P2hyQKa/OwI=;
	b=UxgoXWuCsy1w4xEvZ2zUvktDpQvFsctIq8lfjCfq2VRw4XChfylC6sb/r5YqWzFKLS
	0UsSaUCfJc/yMdSQRZd6kt6ONSgd8rdDc499eMe97ab4sxjPJFlRHX4z4JZ6AYZxXXGC
	TRBJhYJacGgbS/qtzqWROo7fnVZl4FGsGCUNoFyPjv2Vika3W5TyGICHw6jBNJt1UpP7
	ilmC7vi5pbcZTf4cgyJZdNlTrOAwnHH/sF9THPSZLjIihVUOjE2lKXldz6ilK+89CmMn
	T3JGKMPFOwrB/Vj/ROY54fn6g2HkybPdJdU0vmrpKYYtj+N/cw2/nRp3SRNDZq9BX5md
	RgEQ==
Received: by 10.180.77.4 with SMTP id o4mr22540219wiw.17.1335718590086;
	Sun, 29 Apr 2012 09:56:30 -0700 (PDT)
Received: from [192.168.1.33] (29.Red-83-60-182.dynamicIP.rima-tde.net.
	[83.60.182.29])
	by mx.google.com with ESMTPS id ff9sm22089262wib.2.2012.04.29.09.56.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 09:56:28 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
X-Priority: 1
Date: Sun, 29 Apr 2012 18:56:23 +0200
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Message-Id: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
Subject: gcc-4.4.1 assembler error: offset out of range
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2012 17:06:11 -0000
X-Groupsio-MsgNum: 38448
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_5355BE65-5FF6-429E-A210-A2D085128488"

--Apple-Mail=_5355BE65-5FF6-429E-A210-A2D085128488
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
     I get a whole bunch of assembler errors, when I try to build using gc=
c-4.4.1 or higher. My overo-oe build environment builds fine with the gcc-4=
.3.3 compiler, but if I switch to gcc-4.4.1, by modifying my local.conf fil=
e as follows:

#
# Specify the version of gcc that you want to build.
PREFERRED_VERSION_gcc =3D "4.4.1"
PREFERRED_VERSION_gcc-cross =3D "4.4.1"
PREFERRED_VERSION_gcc-cross-initial =3D "4.4.1"
PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.1"

I get a whole bunch of errors while attempting to bitbake gcc:

| arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/too=
l/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optim=
izations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -=
Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -=
Wold-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wn=
o-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H =
-I. -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-l=
inux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/=
include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libd=
ecnumber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.=
1-r13.1/gcc-4.4.1/gcc/builtins.c -o builtins.o
| /tmp/ccC0NmMi.s: Assembler messages:
| /tmp/ccC0NmMi.s:36309: Error: offset out of range
| /tmp/ccC0NmMi.s:36310: Error: offset out of range
| /tmp/ccC0NmMi.s:36345: Error: offset out of range
| /tmp/ccC0NmMi.s:36346: Error: offset out of range
| /tmp/ccC0NmMi.s:36381: Error: offset out of range
| /tmp/ccC0NmMi.s:36382: Error: offset out of range
| /tmp/ccC0NmMi.s:36416: Error: offset out of range
| /tmp/ccC0NmMi.s:36417: Error: offset out of range
| make[2]: *** [insn-output.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linu=
x-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-an=
gstrom-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linu=
x-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-an=
gstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gcc-4.4.1-r13.1: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.4.1.=
bb do_compile failed
ERROR: Task 13 (/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.4.1.=
bb, do_compile) failed with 256
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.4.1.bb' fail=
ed
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/gcc/gcc_4.4.1.bb' fail=
ed

I have attached the compile log file below. How can I get past these assem=
bler errors?

Best regards,

Elvis Dowson




--Apple-Mail=_5355BE65-5FF6-429E-A210-A2D085128488
Content-Disposition: attachment;
	filename=log.do_compile.32192
Content-Type: application/octet-stream;
	name="log.do_compile.32192"
Content-Transfer-Encoding: quoted-printable

NOTE: make -j 6 ARCH_FLAGS_FOR_TARGET=3D-march=3Darmv7-a -mtune=3Dcortex-a8=
 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/to=
ol/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
make[1]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi'
mkdir -p -- ./intl
mkdir -p -- ./fixincludes
mkdir -p -- ./libiberty
mkdir -p -- ./libdecnumber
mkdir -p -- build-x86_64-linux/libiberty
mkdir -p -- build-x86_64-linux/fixincludes
Configuring in build-x86_64-linux/libiberty
Configuring in ./intl
Configuring in ./libdecnumber
Configuring in ./libiberty
Configuring in ./fixincludes
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/end=
ian-little
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/end=
ian-little
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
configure: creating cache ../config.cache
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/end=
ian-little
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-linux
configure: loading cache ../config.cache
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: creating cache ./config.cache
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: creating cache ./config.cache
configure: creating cache ./config.cache
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=3D5000000
checking whether make sets $(MAKE)... checking whether make sets $(MAKE)...=
 checking build system type... checking whether to enable maintainer-specif=
ic portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=3D5000000
yes
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
yes
checking for a BSD-compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
checking whether NLS is requested... no
checking for msgfmt... checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... arm-angstrom-linux-gnueabi
checking for perl... checking for perl... perl
perl
checking target system type... arm-angstrom-linux-gnueabi
checking for C compiler default output file name... checking for x86_64-lin=
ux-gcc... gcc=20
checking build system type... checking build system type... arm-angstrom-li=
nux-gnueabi
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
x86_64-pc-linux-gnu
checking for C compiler default output file name... checking host system ty=
pe... checking host system type... arm-angstrom-linux-gnueabi
x86_64-pc-linux-gnu
checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-ar
checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueab=
i-ranlib
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc=20
/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
checking for gmsgfmt... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr/bin/ms=
gfmt
checking for xgettext... checking for C compiler default output file name..=
. /tool/overo-oe/tmp/sysroots/x86_64-linux/usr/bin/xgettext
checking for msgmerge... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr/bin/m=
sgmerge
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... checking for C compiler default outpu=
t file name...=20

checking for suffix of object files... checking for suffix of object files.=
.. a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...=20
checking for suffix of object files...=20
checking for suffix of object files... o
o
checking whether we are using the GNU C compiler... checking whether we are=
 using the GNU C compiler... o
checking whether we are using the GNU C compiler... o
checking whether we are using the GNU C compiler... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... none needed
none needed
none needed
none needed
checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueab=
i-ranlib
checking for aclocal... checking for a sed that does not truncate output...=
 checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
/bin/sed
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -W... checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mt=
une=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-th=
umb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi s=
upports -W... checking build system type... x86_64-pc-linux-gnu
checking host system type... yes
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wall... checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a =
-mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno=
-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i supports -Wall... arm-angstrom-linux-gnueabi
checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueab=
i-ranlib
checking for library containing strerror... 64
checking for _LARGE_FILES value needed for large files... a.out
checking whether the C compiler works... yes
yes
yes
checking whether we are cross compiling... no
checking for suffix of executables... checking for C compiler default outpu=
t file name... checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darm=
v7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork=
 -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-g=
nueabi supports -Wwrite-strings... checking whether arm-angstrom-linux-gnue=
abi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoft=
fp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/arm=
v7a-angstrom-linux-gnueabi supports -Wwrite-strings... no
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
yes
none required
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wstrict-prototypes... checking whether arm-angstrom-linux-gnueabi-gcc -ma=
rch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-=
interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstro=
m-linux-gnueabi supports -Wstrict-prototypes... a.out
checking whether the C compiler works...=20
yes
checking for suffix of object files... checking whether we are cross compil=
ing... no
checking for suffix of executables... checking whether arm-angstrom-linux-g=
nueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Ds=
oftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi supports -W... checking for egrep... grep -E
checking for ANSI C header files... yes
o
checking whether we are using the GNU C compiler... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-prototypes... checking whether arm-angstrom-linux-gnueabi-gcc -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi supports -Wmissing-prototypes...=20
checking for suffix of object files... yes
yes
checking whether gcc  accepts -g... checking whether arm-angstrom-linux-gnu=
eabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsof=
tfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/ar=
mv7a-angstrom-linux-gnueabi supports -Wall... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wold-style-definition... yes
o
checking whether we are using the GNU C compiler... checking whether arm-an=
gstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -=
mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports -Wold-style-definition=
... yes
checking for gcc  option to accept ANSI C... yes
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wwrite-strings... checking whether arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-int=
erwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-l=
inux-gnueabi supports -Wmissing-format-attribute... yes
yes
checking whether gcc  accepts -g... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-format-attribute... checking for an ANSI C-conforming const... y=
es
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wno-overlength-strings... yes
checking for gcc  option to accept ANSI C... checking whether arm-angstrom-=
linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-=
abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sy=
sroots/armv7a-angstrom-linux-gnueabi supports -Wc++-compat... yes
checking for inline... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wcast-qual... yes
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -pedantic -Wno-long-long... checking whether arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-an=
gstrom-linux-gnueabi supports -Wstrict-prototypes... inline
checking for sys/types.h... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -pedantic -Wno-long-long... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -pedantic ... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking for egrep... grep -E
checking for ANSI C header files... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi and cc u=
nderstand -c and -o together... checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/types.h... yes
checking for an ANSI C-conforming const... yes
yes
checking for sys/stat.h... checking for sys/stat.h... yes
checking for inline... yes
yes
checking for stdlib.h... inline
checking whether byte ordering is bigendian... (cached) no
yes
checking for a BSD-compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
checking for sys/stat.h... checking for stdlib.h... yes
yes
yes
checking for string.h... checking for stdlib.h... checking for sys/file.h..=
. yes
yes
checking for sys/param.h... yes
yes
checking for memory.h... checking for string.h... checking for memory.h... =
yes
checking for limits.h... yes
yes
checking for stdlib.h... yes
checking for memory.h... checking for strings.h... yes
checking for strings.h... yes
checking for malloc.h... yes
checking for string.h... yes
yes
checking for strings.h... yes
yes
checking for inttypes.h... checking for unistd.h... checking for inttypes.h=
... yes
checking for strings.h... yes
checking for inttypes.h... none needed
none needed
yes
yes
yes
checking for sys/time.h... checking for stdint.h... checking for stdint.h..=
. checking for a sed that does not truncate output... checking for special =
C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... /bin/sed
yes
checking whether gcc  supports -W... checking for time.h... yes
yes
no
checking for _LARGE_FILES value needed for large files... checking for sys/=
resource.h... checking for stdint.h... yes
yes
checking whether gcc  supports -Wall... yes
checking for unistd.h... checking for unistd.h... yes
checking for sys/stat.h... yes
no
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking whether gcc  supports -Wwrite-strings... yes
checking for sys/mman.h... yes
checking for unistd.h... yes
yes
yes
yes
checking whether gcc  supports -W... checking for fcntl.h... checking stdde=
f.h usability... checking whether gcc  supports -Wstrict-prototypes... chec=
king ctype.h usability... yes
checking for alloca.h... yes
yes
checking whether gcc  supports -Wall... checking whether gcc  supports -Wmi=
ssing-prototypes... yes
yes
checking for off_t... checking for sys/pstat.h... yes
checking stddef.h presence... yes
checking ctype.h presence... yes
yes
checking for stddef.h... yes
yes
no
checking whether gcc  supports -Wwrite-strings... checking whether gcc  sup=
ports -Wold-style-definition... checking for sys/sysmp.h... yes
checking for ctype.h... checking for stdlib.h... yes
(cached) yes
checking stddef.h usability... checking for strings.h... (cached) yes
no
checking for sys/sysinfo.h... checking for unistd.h... (cached) yes
yes
checking fcntl.h usability... yes
checking whether gcc  supports -Wc++-compat... yes
checking for size_t... checking whether gcc  supports -Wmissing-format-attr=
ibute... yes
checking for machine/hal_sysinfo.h... yes
checking stddef.h presence... yes
checking whether gcc  supports -Wstrict-prototypes... no
yes
checking for sys/table.h... checking whether gcc  supports -Wno-overlength-=
strings... yes
checking for stddef.h... yes
checking for string.h... yes
(cached) checking fcntl.h presence... yes
no
checking for sys/sysctl.h... yes
checking for working alloca.h... checking stdio.h usability... yes
checking whether gcc  supports -pedantic ... yes
checking for fcntl.h... yes
yes
checking whether gcc  supports -pedantic -Wno-long-long... checking sys/fil=
e.h usability... yes
checking for sys/systemcfg.h... yes
checking whether gcc  and cc understand -c and -o together... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
no
checking for stdint.h... yes
yes
checking stdio.h presence... checking for alloca... yes
yes
checking for stdio.h... yes
yes
checking sys/file.h presence... checking for egrep... checking for stdio_ex=
t.h... grep -E
checking for ANSI C header files... looking for a compliant stdint.h in std=
int.h, checking for uintmax_t... yes
checking for sys/file.h... yes
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for sys/stat=
.h... (cached) yes
checking for clearerr_unlocked... yes
checking for stdlib.h... (cached) yes
checking for uintptr_t... yes
checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
yes
checking for an ANSI C-conforming const... yes
checking for working mmap... (cached) yes
checking whether time.h and sys/time.h may both be included... checking whe=
ther we are using the GNU C Library 2.1 or newer... yes
checking whether integer division by zero raises SIGFPE... guessing no
yes
checking for int_least32_t... checking for inttypes.h... yes
yes
checking for inline... checking for feof_unlocked... yes
checking whether errno must be declared... yes
checking for int_fast32_t... yes
checking for stdint.h... inline
checking whether byte ordering is bigendian... no
checking for egrep... yes
grep -E
yes
checking for ANSI C header files... checking for uint64_t... yes
checking for unsigned long long... yes
checking for sys/types.h... checking for ferror_unlocked... yes
checking what to include in gstdint.h... stdint.h (already complete)
yes
checking for an ANSI C-conforming const... checking for sys/stat.h... yes
yes
checking for inttypes.h... checking for sys/types.h... no
checking for a BSD-compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
yes
checking for sys/file.h... checking for fflush_unlocked... yes
yes
checking for off_t... checking for sys/stat.h... (cached) yes
yes
checking for stdlib.h... (cached) yes
yes
checking for sys/param.h... checking whether the inttypes.h PRIxNN macros a=
re broken... yes
checking for string.h... (cached) yes
checking for stdlib.h... checking for memory.h... yes
checking for limits.h... yes
yes
checking for strings.h... (cached) no
yes
checking for ld used by GCC... yes
checking for int... yes
checking for fgetc_unlocked... checking for inttypes.h... checking for stdl=
ib.h... yes
arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7=
a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... checking for=
 string.h... yes
yes
checking for stdint.h... (cached) yes
checking for malloc.h... checking for unistd.h... (cached) yes
checking for shared library run path origin... yes
done
checking for int... yes
checking size of int... (cached) 4
checking for long... checking argz.h usability... yes
yes
yes
checking for string.h... checking for memory.h... checking for fgets_unlock=
ed... yes
checking for unistd.h... yes
checking size of int... (cached) 4
checking for uintptr_t... yes
yes
checking argz.h presence... yes
checking size of long... (cached) 4
checking for ANSI C header files... (cached) yes
checking for strings.h... yes
yes
checking for argz.h... yes
checking build system type... checking for fileno_unlocked... yes
checking limits.h usability... checking for sys/time.h... x86_64-pc-linux-g=
nu
checking host system type... yes
yes
checking for strings.h... yes
checking for a 64-bit type... checking for time.h... arm-angstrom-linux-gnu=
eabi
checking target system type... yes
yes
checking limits.h presence... checking for sys/resource.h... yes
arm-angstrom-linux-gnueabi
checking for fprintf_unlocked... checking for decimal floating point... dpd
checking whether byte ordering is bigendian... uint64_t
(cached) no
checking for pid_t... yes
yes
checking for limits.h... yes
checking for sys/stat.h... yes
checking locale.h usability... updating cache ./config.cache
checking for inttypes.h... configure: creating ./config.status
yes
checking for sys/mman.h... no
yes
yes
checking for fputc_unlocked... yes
checking locale.h presence... checking for fcntl.h... checking for library =
containing strerror... yes
yes
checking for locale.h... yes
checking for stdint.h... checking nl_types.h usability... checking for allo=
ca.h... yes
yes
checking for sys/pstat.h... none required
checking for fputs_unlocked... checking for asprintf... yes
no
checking for sys/sysmp.h... checking for unistd.h... yes
checking nl_types.h presence... no
yes
checking for nl_types.h... checking for sys/sysinfo.h... yes
checking malloc.h usability... config.status: creating Makefile
yes
checking for machine/hal_sysinfo.h... yes
yes
checking for atexit... checking for fread_unlocked... no
checking for sys/table.h... no
yes
checking malloc.h presence... checking for sys/sysctl.h... yes
checking for malloc.h... yes
yes
checking stddef.h usability... checking for sys/systemcfg.h... yes
yes
checking for fwrite_unlocked... checking for basename... no
checking for stdint.h... yes
checking for stdio_ext.h... yes
yes
checking stddef.h presence... checking stddef.h usability... yes
yes
checking for stddef.h... yes
yes
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for getchar_=
unlocked... checking for stdlib.h... (cached) checking for bcmp... yes
checking for string.h... (cached) yes
checking for unistd.h... (cached) yes
config.status: creating config.h
checking sys/param.h usability... yes
checking stddef.h presence... yes
yes
yes
checking for stddef.h... yes
checking for getc_unlocked... checking for bcopy... checking for stdlib.h..=
. (cached) yes
checking for strings.h... (cached) yes
yes
checking sys/param.h presence... checking for unistd.h... (cached) yes
checking fcntl.h usability... yes
checking for sys/param.h... yes
yes
checking whether time.h and sys/time.h may both be included... checking for=
 feof_unlocked... yes
yes
checking for putchar_unlocked... yes
checking whether errno must be declared... checking for bsearch... yes
checking fcntl.h presence... config.status: executing gstdint.h commands
yes
checking for fcntl.h... yes
yes
checking sys/file.h usability... checking for fgets_unlocked... yes
checking for putc_unlocked... yes
checking for bzero... yes
yes
checking sys/file.h presence... checking for getc_unlocked... yes
yes
checking for sys/file.h... checking whether abort is declared... yes
checking for sys/stat.h... (cached) yes
yes
checking for clearerr_unlocked... checking for calloc... yes
checking for getcwd... yes
checking whether asprintf is declared... yes
checking for clock... no
checking whether basename is declared... yes
checking for getegid... yes
checking for ffs... no
checking whether errno is declared... yes
checking for feof_unlocked... yes
checking for geteuid... no
checking whether vasprintf is declared... yes
yes
checking for getcwd... checking for ferror_unlocked... no
checking whether clearerr_unlocked is declared... yes
checking for getgid... yes
yes
checking for fflush_unlocked... checking for getpagesize... (cached) yes
yes
checking for gettimeofday... checking whether feof_unlocked is declared... =
yes
checking for getuid... yes
checking for fgetc_unlocked... yes
checking whether ferror_unlocked is declared... yes
yes
checking for index... checking for mempcpy... yes
checking for fgets_unlocked... yes
checking whether fflush_unlocked is declared... yes
yes
checking for insque... checking for munmap... yes
checking for fileno_unlocked... yes
checking whether fgetc_unlocked is declared... yes
checking for putenv... yes
checking for memchr... yes
no
checking for egrep... grep -E
checking for ANSI C header files... checking for fprintf_unlocked... yes
checking whether fgets_unlocked is declared... yes
checking for setenv... yes
checking for memcmp... no
checking whether fileno_unlocked is declared... yes
checking for setlocale... yes
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/libdecnumber'
source=3D'/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libdecnumber/decNumber.c' object=3D'decNumber.o' libtool=3Dn=
o arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber -=
I.  -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -=
ggdb2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wo=
ld-style-definition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-l=
ong-long  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1=
-r13.1/gcc-4.4.1/libdecnumber -I.  -c /tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber/decNumber.c
yes
checking for memcpy... (cached) checking whether fprintf_unlocked is declar=
ed... yes
yes
checking for memmove... checking for sys/types.h... yes
checking for sys/stat.h... (cached) yes
yes
no
checking whether fputc_unlocked is declared... checking for stpcpy... check=
ing for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for memory.h... yes
checking for mempcpy... yes
checking for strings.h... (cached) yes
checking for inttypes.h... yes
checking whether fputs_unlocked is declared... yes
checking for strcasecmp... yes
checking for stdint.h... (cached) yes
checking for unistd.h... (cached) yes
yes
checking for int... checking for memset... no
checking whether fread_unlocked is declared... yes
checking for strdup... yes
checking whether fwrite_unlocked is declared... yes
yes
checking size of int... checking for mkstemps... yes
checking for strtoul... no
yes
checking whether getchar_unlocked is declared... checking for putenv... no
4
checking for uintptr_t... checking for fputc_unlocked... yes
yes
checking for tsearch... checking whether getc_unlocked is declared... yes
checking for random... yes
yes
checking for a 64-bit type... checking for fputs_unlocked... yes
yes
checking whether putchar_unlocked is declared... checking for __argz_count.=
.. uint64_t
checking for pid_t... yes
checking for rename... yes
checking for fread_unlocked... yes
checking whether putc_unlocked is declared... yes
checking for __argz_stringify... yes
yes
checking for rindex... checking for library containing strerror... yes
checking for fwrite_unlocked... yes
checking for an ANSI C-conforming const... yes
yes
checking for __argz_next... none required
checking for asprintf... checking for setenv... yes
checking sys/mman.h usability... yes
checking for getchar_unlocked... yes
yes
checking sys/mman.h presence... yes
checking for __fsetlocking... yes
checking for atexit... checking for snprintf... yes
checking for sys/mman.h... yes
checking for mmap... yes
checking for getc_unlocked... yes
yes
yes
yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... checking for sigsetmask... checking for ico=
nv... checking for basename... yes
checking for putchar_unlocked... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
yes
checking for iconv declaration... yes
yes
checking for stpcpy... updating cache ./config.cache
configure: creating ./config.status
checking for bcmp... yes
checking for putc_unlocked... yes
yes
yes
checking whether abort is declared... checking for bcopy... checking for st=
pncpy... yes
checking for bsearch... yes
yes
checking whether asprintf is declared... checking for strcasecmp... no
checking whether basename is declared... yes
yes
checking for bzero... checking for strchr... no
checking whether errno is declared... yes
checking for calloc... yes
checking for strdup... no
checking whether vasprintf is declared... yes
checking for clock... yes
checking for strncasecmp... no
checking whether clearerr_unlocked is declared... yes
checking for ffs... yes
yes
checking whether feof_unlocked is declared... checking for strndup...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
yes
checking for nl_langinfo and CODESET... config.status: creating Makefile
checking for getcwd... yes
checking whether ferror_unlocked is declared... yes
checking for strrchr... yes
yes
checking for LC_MESSAGES... checking for getpagesize... config.status: crea=
ting mkheaders.almost
yes
checking whether fflush_unlocked is declared... yes
checking for strstr... yes
yes
checking for bison... bison
checking version of bison... config.status: creating config.h
checking for gettimeofday... yes
checking whether fgetc_unlocked is declared... yes
checking for strtod... yes
checking for index... 2.4.3, ok
checking whether NLS is requested... no
checking whether to use NLS... no
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
updating cache ./config.cache
configure: creating ./config.status
yes
checking whether fgets_unlocked is declared... yes
yes
checking for strtol... checking for insque... no
checking whether fileno_unlocked is declared... yes
yes
checking for memchr... checking for strtoul... source=3D'/tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber/=
decContext.c' object=3D'decContext.o' libtool=3Dno arm-angstrom-linux-gnuea=
bi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftf=
p -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv=
7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber -I.  -fexpensive-optimizatio=
ns -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-stri=
ngs -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissi=
ng-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I/tool/overo-oe/=
tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumb=
er -I.  -c /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-=
r13.1/gcc-4.4.1/libdecnumber/decContext.c
yes
checking whether fprintf_unlocked is declared... yes
config.status: creating Makefile
yes
checking for memcmp... checking for strverscmp... config.status: creating c=
onfig.intl
no
checking whether fputc_unlocked is declared... config.status: creating conf=
ig.h
yes
checking for memcpy... yes
checking for tmpnam... source=3D'/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber/dpd/decimal32.c' object=
=3D'decimal32.o' libtool=3Dno arm-angstrom-linux-gnueabi-gcc -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/libdecnumber -I.  -fexpensive-optimizations -frename-registers=
 -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstrict-prototyp=
es -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute -=
Wcast-qual -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angst=
rom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber -I.  -c /tool/over=
o-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libde=
cnumber/dpd/decimal32.c
config.status: executing default-1 commands
yes
checking whether fputs_unlocked is declared... yes
checking for memmove... yes
checking for vasprintf... no
checking whether fread_unlocked is declared... yes
checking for mempcpy... yes
mkdir -p -- ./gcc
Configuring in ./gcc
checking for vfprintf... yes
checking whether fwrite_unlocked is declared... yes
source=3D'/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libdecnumber/dpd/decimal64.c' object=3D'decimal64.o' libtool=
=3Dno arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/t=
ool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/t=
mp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumbe=
r -I.  -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O=
2 -ggdb2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes =
-Wold-style-definition -Wmissing-format-attribute -Wcast-qual -pedantic -Wn=
o-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/libdecnumber -I.  -c /tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber/dpd/decimal64.c
checking for memset... yes
checking for vprintf... yes
checking whether getchar_unlocked is declared... yes
checking for mkstemps... yes
checking for vsnprintf... yes
checking whether getc_unlocked is declared... yes
checking for putenv... yes
checking for vsprintf... yes
checking whether putchar_unlocked is declared... yes
checking for random... yes
source=3D'/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libdecnumber/dpd/decimal128.c' object=3D'decimal128.o' libto=
ol=3Dno arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D=
/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe=
/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnum=
ber -I.  -fexpensive-optimizations -frename-registers -fomit-frame-pointer =
-O2 -ggdb2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototype=
s -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -pedantic -=
Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/libdecnumber -I.  -c /tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libdecnumber/dpd/decimal128=
.c
checking for waitpid... yes
checking whether putc_unlocked is declared... yes
checking for rename... configure: loading site script /tool/overo-oe/org.op=
enembedded.dev/site/endian-little
yes
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
checking whether alloca needs Cray hooks... configure: loading site script =
/tool/overo-oe/org.openembedded.dev/site/common-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: creating cache ./config.cache
no
checking stack direction for C alloca... 0
yes
checking for an ANSI C-conforming const... checking for unistd.h... (cached=
) yes
checking for vfork.h... yes
checking for rindex... no
checking for fork... yes
checking sys/mman.h usability... checking build system type... x86_64-pc-li=
nux-gnu
checking host system type... yes
yes
yes
checking sys/mman.h presence... checking for setenv... arm-angstrom-linux-g=
nueabi
checking for vfork... checking target system type... yes
checking for sys/mman.h... yes
checking for mmap... arm-angstrom-linux-gnueabi
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/intl'
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
yes
checking for snprintf... yes
checking for C compiler default output file name... checking for working fo=
rk... cross
configure: WARNING: result yes guessed because of cross compilation
checking for working vfork... (cached) yes
yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... checking for _doprnt... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for sigsetmask... no
checking for sys_errlist... updating cache ../config.cache
configure: creating ./config.status

checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
yes
checking for sys_nerr... checking for stpcpy... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking for sys_siglist... yes
yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... checking for stpncpy... config.status: creating Makefile
config.status: creating mkheaders.almost
yes
none needed
checking for external symbol _system_configuration... yes
config.status: creating config.h
checking for strcasecmp... checking whether arm-angstrom-linux-gnueabi-gcc =
-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthu=
mb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angs=
trom-linux-gnueabi and cc understand -c and -o together... no
checking for getrusage... yes
checking for strchr... yes
checking for on_exit... yes
yes
checking for arm-angstrom-linux-gnueabi-gnatbind... no
checking for arm-angstrom-linux-gnueabi-gnatmake... no
checking whether compiler driver understands Ada... checking for strdup... =
no
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
yes
checking for psignal... checking for egrep... grep -E
checking for ANSI C header files... yes
checking for strncasecmp... yes
checking for strerror... (cached) yes
yes
yes
checking for strsignal... checking for sys/types.h... checking for strndup.=
.. yes
checking for sys/stat.h... yes
yes
rm -f libdecnumber.a
arm-angstrom-linux-gnueabi-ar cru libdecnumber.a decNumber.o decContext.o d=
ecimal32.o decimal64.o decimal128.o=20
checking for strrchr... checking for sysconf... arm-angstrom-linux-gnueabi-=
ranlib libdecnumber.a
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/libdecnumber'
yes
checking for stdlib.h... yes
yes
checking for strstr... checking for times... yes
checking for string.h... yes
yes
checking for strtod... checking for sbrk... yes
checking for memory.h... yes
checking for strtol... yes
checking for gettimeofday... (cached) yes
yes
checking for realpath... checking for strings.h... yes
checking for strtoul... yes
checking for inttypes.h... yes
checking for canonicalize_file_name... yes
yes
checking for stdint.h... checking for strverscmp... yes
checking for pstat_getstatic... yes
checking for unistd.h... yes
checking for tmpnam... no
checking for pstat_getdynamic... yes
checking minix/config.h usability... yes
checking for vasprintf... no
checking for sysmp... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for vfprintf... no
checking for getsysinfo... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
yes
checking for vprintf... no
checking for inline... checking for table... inline
checking for void *... yes
no
checking for vsnprintf... checking for sysctl... yes
checking size of void *... (cached) 4
checking for short... yes
checking for vsprintf... yes
checking for wait3... yes
checking size of short... (cached) 2
checking for int... yes
checking for waitpid... yes
yes
checking size of int... (cached) 4
checking for long... checking for wait4... yes
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... yes
checking size of long... (cached) 4
checking for long long... yes
checking for __fsetlocking... -1
yes
checking for unistd.h... (cached) checking for long long... (cached) yes
checking size of long long... (cached) 8
yes
checking for __int64... checking for vfork.h... yes
checking whether basename is declared... no
checking for fork... no
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -W... no
checking whether ffs is declared... yes
yes
checking for vfork... checking whether arm-angstrom-linux-gnueabi-gcc -marc=
h=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-in=
terwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-=
linux-gnueabi supports -Wall... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wwrite-strings... yes
checking whether asprintf is declared... yes
checking for working fork... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wstrict-prototypes... no
checking whether vasprintf is declared... yes
checking for working vfork... (cached) yes
checking for _doprnt... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-prototypes... no
checking whether snprintf is declared... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wcast-qual... no
checking for sys_errlist... yes
yes
checking whether vsnprintf is declared... checking whether arm-angstrom-lin=
ux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=
=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysro=
ots/armv7a-angstrom-linux-gnueabi supports -Wold-style-definition... yes
checking for sys_nerr... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wc++-compat... yes
checking whether calloc is declared... yes
yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-format-attribute... checking for sys_siglist... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings... y=
es
checking whether getenv is declared... yes
checking for external symbol _system_configuration... yes
checking valgrind.h usability... no
checking for getrusage... yes
checking whether getopt is declared... no
checking valgrind.h presence... no
checking for valgrind.h... no
configure: WARNING: decimal float is not supported for this target
yes
configure: WARNING: fixed-point is not supported for this target
checking for on_exit... checking whether make sets $(MAKE)... yes
checking whether malloc is declared... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... yes
checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueab=
i-ranlib
checking for a BSD compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
checking for cmp's capabilities... yes
checking for psignal... yes
checking whether realloc is declared... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo --split-size=3D5000000
checking for modern makeinfo... yes
checking for recent Pod::Man... yes
checking for strerror... yes
checking whether sbrk is declared... yes
checking for strsignal... yes
checking whether strverscmp is declared... yes
checking for flex... flex
checking for bison... bison
checking for nm... arm-angstrom-linux-gnueabi-nm
checking for ar... arm-angstrom-linux-gnueabi-ar
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking for sysconf... no
checking whether canonicalize_file_name must be declared... yes
checking whether string.h and strings.h may both be included... yes
yes
checking for times... checking for stdlib.h... (cached) yes
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for unistd.h=
... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... (cached) yes
checking for working strncmp... no
yes
yes
updating cache ./config.cache
checking for limits.h... checking for sbrk... configure: creating ./config.=
status
yes
checking for stddef.h... yes
checking for string.h... (cached) yes
yes
checking for strings.h... (cached) yes
checking for gettimeofday... (cached) yes
checking for stdlib.h... (cached) yes
checking for realpath... checking for time.h... yes
checking for iconv.h... yes
yes
checking for fcntl.h... checking for canonicalize_file_name... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... yes
yes
config.status: creating Makefile
checking for pstat_getstatic... checking for sys/time.h... yes
checking for sys/mman.h... yes
no
checking for sys/resource.h... checking for pstat_getdynamic... config.stat=
us: creating testsuite/Makefile
yes
checking for sys/param.h... config.status: creating config.h
yes
no
checking for sys/times.h... checking for sysmp... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... config.status: executing default commands
no
checking for getsysinfo... no
checking for malloc.h... yes
checking for langinfo.h... yes
no
checking for table... checking for ldfcn.h... no
checking for locale.h... mkdir -p -- ./libcpp
Configuring in ./libcpp
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/libiberty'
if [ x"-fPIC" !=3D x ] && [ ! -d pic ]; then \
	  mkdir pic; \
	else true; fi
yes
touch stamp-picdir
rm -f needed-list; touch needed-list; \
	for f in atexit calloc memchr memcmp memcpy memmove memset rename strchr s=
trerror strncmp strrchr strstr strtol strtoul tmpnam vfprintf vprintf vfork=
 waitpid bcmp bcopy bzero; do \
	  for g in ./mkstemps.o ./strncmp.o ; do \
	    case "$g" in \
	      *$f*) echo $g >> needed-list ;; \
	    esac; \
	  done; \
	done
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o =
./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o=
 ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lba=
sename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objall=
oc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pe=
x-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./st=
rerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmall=
oc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
no
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/safe-ctype.c -o pic/safe-ct=
ype.o; \
	else true; fi
checking for wchar.h... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strncmp.c -o pic/strncmp.o;=
 \
	else true; fi
checking for sysctl... yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/regex.c -o pic/regex.o; \
	else true; fi
yes
checking for wait3... checking for thread.h... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename=
-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libiberty/strncmp.c -o strncmp.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/safe-ctype.c -o safe-ctype.o
no
checking for pthread.h... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cplus-dem.c -o pic/cplus-de=
m.o; \
	else true; fi
yes
checking for CHAR_BIT... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demangle.c -o pic/cp-dem=
angle.o; \
	else true; fi
yes
checking for wait4... yes
checking whether byte ordering is bigendian... (cached) no
checking for collect2 libraries... yes
checking for __fsetlocking... yes
checking whether basename is declared... no
checking whether ffs is declared... configure: loading site script /tool/ov=
ero-oe/org.openembedded.dev/site/endian-little
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-common
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon-glibc
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/arm=
-linux
configure: loading site script /tool/overo-oe/org.openembedded.dev/site/com=
mon
configure: creating cache ./config.cache
none required
checking for library containing exc_resume... checking build system type...=
 yes
checking whether asprintf is declared... x86_64-pc-linux-gnu
checking host system type... arm-angstrom-linux-gnueabi
no
checking for library containing ldexp... checking target system type... no
checking whether vasprintf is declared... arm-angstrom-linux-gnueabi
checking whether make sets $(MAKE)... yes
checking for a BSD-compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi
none required
checking for inttypes.h... no
checking whether snprintf is declared... checking for C compiler default ou=
tput file name... yes
checking for times... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... yes
checking whether vsnprintf is declared...=20
checking for suffix of object files... yes
checking for clock... o
checking whether we are using the GNU C compiler... yes
checking whether calloc is declared... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi accepts =
-g... yes
checking for kill... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to ac=
cept ANSI C... yes
checking whether getenv is declared... yes
none needed
checking for getrlimit... yes
checking whether getopt is declared... checking for arm-angstrom-linux-gnue=
abi-ranlib... arm-angstrom-linux-gnueabi-ranlib
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -W... yes
checking for setrlimit... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wall... yes
checking whether malloc is declared... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wwrite-strings... yes
checking for atoll... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wstrict-prototypes... yes
checking whether realloc is declared... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-prototypes... yes
checking for atoq... yes
yes
checking whether sbrk is declared... checking whether arm-angstrom-linux-gn=
ueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dso=
ftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/a=
rmv7a-angstrom-linux-gnueabi supports -Wold-style-definition... arm-angstro=
m-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloa=
t-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/=
sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optim=
izations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/ov=
ero-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/lib=
iberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototype=
s -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.=
1-r13.1/gcc-4.4.1/libiberty/cp-demangle.c -o cp-demangle.o
no
checking for sysconf... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -Wmissing-format-attribute... yes
checking whether strverscmp is declared... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports=
 -pedantic -Wno-long-long... yes
checking for strsignal... no
yes
checking whether canonicalize_file_name must be declared... checking depend=
ency style of arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcort=
ex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysr=
oot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi... yes
checking for stdlib.h... (cached) yes
yes
checking for getrusage... checking for unistd.h... (cached) yes
checking for getpagesize... (cached) yes
checking for working mmap... yes
gcc3
checking whether time.h and sys/time.h may both be included... checking for=
 nl_langinfo... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dco=
rtex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sy=
sroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE=
_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc+=
+-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cplus-dem.c -o cplus=
-dem.o
yes
checking whether string.h and strings.h may both be included... yes
checking for gettimeofday... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking for egrep... yes
grep -E
checking for ANSI C header files... checking for mbstowcs... yes
checking for working strncmp... yes
yes
checking for wcswidth... checking for sys/types.h... yes
yes
checking for sys/stat.h... yes
updating cache ../config.cache
configure: creating ./config.status
checking for mmap... yes
checking for stdlib.h... yes
checking for mincore... yes
checking for string.h... yes
checking for setlocale... yes
config.status: creating Makefile
checking for memory.h... config.status: creating testsuite/Makefile
yes
checking for clearerr_unlocked... config.status: creating config.h
yes
checking for strings.h... yes
config.status: executing default commands
checking for feof_unlocked... yes
checking for inttypes.h... yes
checking for ferror_unlocked... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/md5.c -o pic/md5.o; \
	else true; fi
yes
checking for stdint.h... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-t=
humb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi =
-c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-fram=
e-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-str=
ings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/regex.c -o =
regex.o
yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sha1.c -o pic/sha1.o; \
	else true; fi
checking for fflush_unlocked... yes
checking for unistd.h... yes
checking for fgetc_unlocked... yes
checking iconv.h usability... yes
yes
checking iconv.h presence... checking for fgets_unlocked... yes
checking for iconv.h... yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/md5.c -o md5.o
checking locale.h usability... yes
checking for fileno_unlocked... yes
checking locale.h presence... yes
checking for locale.h... yes
checking fcntl.h usability... yes
checking for fprintf_unlocked... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
no
checking for fputc_unlocked... checking limits.h usability... arm-angstrom-=
linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-=
abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sy=
sroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimiz=
ations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/over=
o-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libib=
erty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes =
-pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-=
r13.1/gcc-4.4.1/libiberty/sha1.c -o sha1.o
yes
checking limits.h presence... yes
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/build-x86_64-linux/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
	  mkdir pic; \
	else true; fi
touch stamp-picdir
checking for fputs_unlocked... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/safe-ctype.=
c -o pic/safe-ctype.o; \
	else true; fi
yes
checking for limits.h... gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include =
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool=
/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/=
libiberty/safe-ctype.c -o safe-ctype.o
yes
checking stddef.h usability... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/alloca.c -o pic/alloca.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sort.c -o p=
ic/sort.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sort.c -o sort.=
o
yes
checking for fread_unlocked... yes
checking stddef.h presence... yes
checking for stddef.h... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-t=
humb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi =
-c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-fram=
e-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-str=
ings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/alloca.c -o=
 alloca.o
yes
checking for stdlib.h... (cached) yes
checking for strings.h... (cached) yes
checking for string.h... (cached) yes
checking sys/file.h usability... yes
checking for fwrite_unlocked... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/argv.c -o pic/argv.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/spaces.c -o=
 pic/spaces.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/spaces.c -o spa=
ces.o
yes
checking sys/file.h presence... yes
yes
checking for sys/file.h... yes
checking for getchar_unlocked... checking for unistd.h... (cached) if [ x""=
 !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/splay-tree.=
c -o pic/splay-tree.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/splay-tree.c -o=
 splay-tree.o
checking for an ANSI C-conforming const... yes
checking for inline... yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/choose-temp.c -o pic/choose=
-temp.o; \
	else true; fi
checking for getc_unlocked... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit=
-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrit=
e-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/argv.c=
 -o argv.o
inline
checking for obstacks... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-t=
humb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi =
-c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-fram=
e-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-str=
ings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/choose-temp=
.c -o choose-temp.o
yes
checking for putchar_unlocked... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/concat.c -o pic/concat.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strerror.c =
-o pic/strerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strerror.c -o s=
trerror.o
yes
checking for off_t... yes
checking for putc_unlocked... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demint.c -o pic/cp-demin=
t.o; \
	else true; fi
yes
checking for size_t... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtu=
ne=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thu=
mb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c=
 -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-frame-=
pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnu=
eabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strin=
gs -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/concat.c -o c=
oncat.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strsignal.c=
 -o pic/strsignal.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strsignal.c -o =
strsignal.o
yes
checking whether mbstowcs works... yes
checking for ssize_t... yes
checking for ssize_t... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mt=
une=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-th=
umb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -=
c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-frame=
-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/arm=
v7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demint.c =
-o cp-demint.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/dyn-string.c -o pic/dyn-str=
ing.o; \
	else true; fi
yes
checking for caddr_t... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/unlink-if-o=
rdinary.c -o pic/unlink-if-ordinary.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/unlink-if-ordin=
ary.c -o unlink-if-ordinary.o
yes
checking whether struct tm is in sys/time.h or time.h... if [ x"-fPIC" !=3D=
 x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fdmatch.c -o pic/fdmatch.o;=
 \
	else true; fi
yes
checking for uid_t in sys/types.h... (cached) {ac_cv_type_uid_t=3Dyes}
checking type of array argument to getgroups... time.h
checking for int... gid_t
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xatexit.c -=
o pic/xatexit.o; \
	else true; fi
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo=
-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../i=
nclude  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic=
  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc=
-4.4.1/libiberty/xatexit.c -o xatexit.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fdmatch.c -o fdmatch.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xexit.c -o =
pic/xexit.o; \
	else true; fi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/dyn-string.c -o dyn-string.o
yes
checking size of int... gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/=
sysroots/x86_64-linux/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/arm=
v7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/=
overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/l=
ibiberty/xexit.c -o xexit.o
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
(cached) 4
checking for long... checking for pid_t... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fibheap.c -o pic/fibheap.o;=
 \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmalloc.c -=
o pic/xmalloc.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmalloc.c -o xm=
alloc.o
yes
checking size of long... (cached) 4
yes
checking for unistd.h... (cached) checking for clearerr_unlocked... yes
checking for vfork.h... no
checking for fork... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmemdup.c -=
o pic/xmemdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmemdup.c -o xm=
emdup.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrdup.c -=
o pic/xstrdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrdup.c -o xs=
trdup.o
yes
checking for feof_unlocked... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit=
-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrit=
e-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fibhea=
p.c -o fibheap.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrerror.c=
 -o pic/xstrerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrerror.c -o =
xstrerror.o
yes
checking for vfork... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrndup.c =
-o pic/xstrndup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrndup.c -o x=
strndup.o
rm -f needed-list; touch needed-list; \
	for f in atexit calloc memchr memcmp memcpy memmove memset rename strchr s=
trerror strncmp strrchr strstr strtol strtoul tmpnam vfprintf vprintf vfork=
 waitpid bcmp bcopy bzero; do \
	  for g in  ; do \
	    case "$g" in \
	      *$f*) echo $g >> needed-list ;; \
	    esac; \
	  done; \
	done
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o =
./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o=
 ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lba=
sename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objall=
oc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pe=
x-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./st=
rerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmall=
oc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
yes
make[3]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/build-x86_64-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/build-x86_64-linux/libiberty/testsuite'
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/regex.c -o =
pic/regex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/regex.c -o rege=
x.o
checking for ferror_unlocked... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cplus-dem.c=
 -o pic/cplus-dem.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cplus-dem.c -o =
cplus-dem.o
yes
checking for working fork... cross
configure: WARNING: result yes guessed because of cross compilation
checking for working vfork... (cached) yes
checking for ld used by GCC... yes
arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7=
a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... yes
checking for shared library run path origin... checking for fflush_unlocked=
... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/filename_cmp.c -o pic/filen=
ame_cmp.o; \
	else true; fi
done
checking for iconv... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtun=
e=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thum=
b --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c =
-DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7=
a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/filename_cmp.c=
 -o filename_cmp.o
yes
checking for fgetc_unlocked... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/floatformat.c -o pic/floatf=
ormat.o; \
	else true; fi
yes
checking for iconv declaration... yes

         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
checking for fgets_unlocked... checking for LC_MESSAGES... yes
checking for nl_langinfo and CODESET... yes
checking for fileno_unlocked... arm-angstrom-linux-gnueabi-gcc -march=3Darm=
v7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork=
 -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-g=
nueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fom=
it-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-=
linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwr=
ite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/floa=
tformat.c -o floatformat.o
yes
checking whether getenv is declared... yes
checking for fprintf_unlocked... no
checking for fputc_unlocked... yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fnmatch.c -o pic/fnmatch.o;=
 \
	else true; fi
checking whether atol is declared... arm-angstrom-linux-gnueabi-gcc -march=
=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-int=
erwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-l=
inux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-register=
s -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wal=
l -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-o=
e/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libibert=
y/fnmatch.c -o fnmatch.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fopen_unlocked.c -o pic/fop=
en_unlocked.o; \
	else true; fi
yes
yes
checking whether asprintf is declared... checking for fputs_unlocked... arm=
-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneo=
n -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo=
-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensi=
ve-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I=
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-p=
rototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fopen_unlocked.c -o fopen_unlocked.o
yes
yes
checking whether sbrk is declared... checking for fread_unlocked... if [ x"=
-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt.c -o pic/getopt.o; \
	else true; fi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt.c -o getopt.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt1.c -o pic/getopt1.o;=
 \
	else true; fi
yes
yes
checking whether abort is declared... checking for fwrite_unlocked... if [ =
x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getpwd.c -o pic/getpwd.o; \
	else true; fi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt1.c -o getopt1.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getruntime.c -o pic/getrunt=
ime.o; \
	else true; fi
yes
checking whether atof is declared... yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getpwd.c -o getpwd.o
checking for getchar_unlocked... arm-angstrom-linux-gnueabi-gcc -march=3Dar=
mv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwor=
k -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-=
gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fo=
mit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom=
-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Ww=
rite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/get=
runtime.c -o getruntime.o
yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hashtab.c -o pic/hashtab.o;=
 \
	else true; fi
checking whether getcwd is declared... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hex.c -o pic/hex.o; \
	else true; fi
yes
checking for getc_unlocked... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7=
-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -=
mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit=
-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrit=
e-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hex.c =
-o hex.o
yes
checking whether getwd is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demangle=
.c -o pic/cp-demangle.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demangle.c -=
o cp-demangle.o
yes
checking for putchar_unlocked... yes
checking whether strsignal is declared... yes
checking for putc_unlocked... yes
yes
checking whether strstr is declared... checking whether abort is declared..=
. arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hashtab.c -o hashtab.o
yes
checking whether strverscmp is declared... yes
checking whether asprintf is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/md5.c -o pi=
c/md5.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/md5.c -o md5.o
no
checking whether basename is declared... yes
checking whether errno is declared... no
checking whether errno is declared... no
checking whether getopt is declared... yes
checking whether snprintf is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sha1.c -o p=
ic/sha1.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sha1.c -o sha1.=
o
yes
checking whether clearerr_unlocked is declared... if [ x"-fPIC" !=3D x ]; t=
hen \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lbasename.c -o pic/lbasenam=
e.o; \
	else true; fi
yes
checking whether vsnprintf is declared... arm-angstrom-linux-gnueabi-gcc -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-regi=
sters -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W =
-Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool/ove=
ro-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libi=
berty/lbasename.c -o lbasename.o
yes
checking whether feof_unlocked is declared... if [ x"-fPIC" !=3D x ]; then =
\
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lrealpath.c -o pic/lrealpat=
h.o; \
	else true; fi
yes
checking whether vasprintf is declared... yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lrealpath.c -o lrealpath.o
checking whether ferror_unlocked is declared... yes
checking whether malloc is declared... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-relative-prefix.c -o p=
ic/make-relative-prefix.o; \
	else true; fi
yes
checking whether fflush_unlocked is declared... yes
checking whether realloc is declared... yes
checking whether fgetc_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/alloca.c -o=
 pic/alloca.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/alloca.c -o all=
oca.o
yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-relative-prefix.c -o make-relat=
ive-prefix.o
checking whether calloc is declared... yes
checking whether fgets_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/argv.c -o p=
ic/argv.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/argv.c -o argv.=
o
no
checking whether fileno_unlocked is declared... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/choose-temp=
.c -o pic/choose-temp.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/choose-temp.c -=
o choose-temp.o
checking whether free is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/concat.c -o=
 pic/concat.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/concat.c -o con=
cat.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demint.c=
 -o pic/cp-demint.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/cp-demint.c -o =
cp-demint.o
yes
checking whether fprintf_unlocked is declared... if [ x"-fPIC" !=3D x ]; th=
en \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-temp-file.c -o pic/mak=
e-temp-file.o; \
	else true; fi
yes
checking whether basename is declared... no
checking whether fputc_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/dyn-string.=
c -o pic/dyn-string.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/dyn-string.c -o=
 dyn-string.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fdmatch.c -=
o pic/fdmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fdmatch.c -o fd=
match.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fibheap.c -=
o pic/fibheap.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fibheap.c -o fi=
bheap.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-temp-file.c -o make-temp-file.o
yes
checking whether getopt is declared... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/filename_cm=
p.c -o pic/filename_cmp.o; \
	else true; fi
checking whether fputs_unlocked is declared... gcc  -c -DHAVE_CONFIG_H -isy=
stem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g  -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-proto=
types -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/libiberty/filename_cmp.c -o filename_cmp.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/floatformat=
.c -o pic/floatformat.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/floatformat.c -=
o floatformat.o
no
checking whether clock is declared... no
checking whether fread_unlocked is declared... if [ x"-fPIC" !=3D x ]; then=
 \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/objalloc.c -o pic/objalloc.=
o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fnmatch.c -=
o pic/fnmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fnmatch.c -o fn=
match.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fopen_unloc=
ked.c -o pic/fopen_unlocked.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt.c -o=
 pic/getopt.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/fopen_unlocked.=
c -o fopen_unlocked.o
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt.c -o get=
opt.o
yes
checking whether fwrite_unlocked is declared... yes
checking whether getpagesize is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt1.c -=
o pic/getopt1.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getopt1.c -o ge=
topt1.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getpwd.c -o=
 pic/getpwd.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getpwd.c -o get=
pwd.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getruntime.=
c -o pic/getruntime.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/getruntime.c -o=
 getruntime.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/objalloc.c -o objalloc.o
yes
checking whether getchar_unlocked is declared... yes
checking whether clearerr_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hashtab.c -=
o pic/hashtab.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hashtab.c -o ha=
shtab.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/obstack.c -o pic/obstack.o;=
 \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hex.c -o pi=
c/hex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/hex.c -o hex.o
yes
checking whether getc_unlocked is declared... arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-an=
gstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename-=
registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include =
 -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /tool=
/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/=
libiberty/obstack.c -o obstack.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/partition.c -o pic/partitio=
n.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lbasename.c=
 -o pic/lbasename.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lbasename.c -o =
lbasename.o
yes
checking whether feof_unlocked is declared... if [ x"-fPIC" !=3D x ]; then =
\
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pexecute.c -o pic/pexecute.=
o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lrealpath.c=
 -o pic/lrealpath.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/lrealpath.c -o =
lrealpath.o
yes
checking whether putchar_unlocked is declared... arm-angstrom-linux-gnueabi=
-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp =
-mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a=
-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frena=
me-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../inclu=
de  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /t=
ool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4=
.1/libiberty/pexecute.c -o pexecute.o
yes
checking whether ferror_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-relati=
ve-prefix.c -o pic/make-relative-prefix.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-relative-p=
refix.c -o make-relative-prefix.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/partition.c -o partition.o
yes
checking whether putc_unlocked is declared... if [ x"-fPIC" !=3D x ]; then =
\
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/physmem.c -o pic/physmem.o;=
 \
	else true; fi
yes
checking whether fflush_unlocked is declared... arm-angstrom-linux-gnueabi-=
gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -=
mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-=
angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/libiberty/physmem.c -o physmem.o
yes
checking whether vasprintf is declared... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-common.c -o pic/pex-com=
mon.o; \
	else true; fi
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-one.c -o pic/pex-one.o;=
 \
	else true; fi
no
checking for working alloca.h... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-temp-f=
ile.c -o pic/make-temp-file.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/make-temp-file.=
c -o make-temp-file.o
yes
checking whether fgetc_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/objalloc.c =
-o pic/objalloc.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/objalloc.c -o o=
bjalloc.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-one.c -o pex-one.o
yes
checking for alloca... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-unix.c -o pic/pex-unix.=
o; \
	else true; fi
yes
checking whether fgets_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/obstack.c -=
o pic/obstack.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/partition.c=
 -o pic/partition.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/obstack.c -o ob=
stack.o
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/partition.c -o =
partition.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pexecute.c =
-o pic/pexecute.o; \
	else true; fi
checking for ANSI C header files... (cached) yes
checking for nl_langinfo and CODESET... gcc  -c -DHAVE_CONFIG_H -isystem/to=
ol/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g  -I. -I/tool/overo=
-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libibe=
rty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -=
pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libiberty/pexecute.c -o pexecute.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-common.c -o pex-common.o
yes
checking whether fileno_unlocked is declared... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/physmem.c -=
o pic/physmem.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/physmem.c -o ph=
ysmem.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-common.=
c -o pic/pex-common.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-common.c -o=
 pex-common.o
yes
checking whether NLS is requested... no
checking for uchar... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtun=
e=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thum=
b --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c =
-DHAVE_CONFIG_H -fexpensive-optimizations -frename-registers -fomit-frame-p=
ointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-string=
s -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7=
a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-unix.c -o =
pex-unix.o

checking for ld used by GCC... yes
checking whether fprintf_unlocked is declared... arm-angstrom-linux-gnueabi=
-ld --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... yes
checking for shared library run path origin... if [ x"-fPIC" !=3D x ]; then=
 \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/sort.c -o pic/sort.o; \
	else true; fi
done
checking for iconv... no
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/spaces.c -o pic/spaces.o; \
	else true; fi
checking whether fputc_unlocked is declared... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename=
-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libiberty/sort.c -o sort.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/spaces.c -o spaces.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/splay-tree.c -o pic/splay-t=
ree.o; \
	else true; fi
yes
checking for iconv declaration... if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strerror.c -o pic/strerror.=
o; \
	else true; fi
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strsignal.c -o pic/strsigna=
l.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-one.c -=
o pic/pex-one.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-one.c -o pe=
x-one.o
checking whether fputs_unlocked is declared...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux=
/usr/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-stri=
ngs -Wc++-compat -Wstrict-prototypes -pedantic   /tool/overo-oe/tmp/work/ar=
mv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-unix.c =
-o pic/pex-unix.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/include -O2 -g  -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings=
 -Wc++-compat -Wstrict-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/pex-unix.c -o p=
ex-unix.o
updating cache ./config.cache
configure: creating ./config.status
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/strerror.c -o strerror.o
yes
checking whether fread_unlocked is declared... arm-angstrom-linux-gnueabi-g=
cc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpensive-optimizations -frename=
-registers -fomit-frame-pointer -O2 -ggdb2  -I. -I/tool/overo-oe/tmp/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/../include=
  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libiberty/strsignal.c -o strsignal.o
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c: In function 'pex_child_error':
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:343: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:344: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:345: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:346: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:347: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:348: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:349: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libiberty/pex-unix.c:350: warning: ignoring return value of 'write', d=
eclared with attribute warn_unused_result
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/splay-tree.c -o splay-tree.o
yes
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/unlink-if-ordinary.c -o pic=
/unlink-if-ordinary.o; \
	else true; fi
checking whether fwrite_unlocked is declared... if [ x"-fPIC" !=3D x ]; the=
n \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xatexit.c -o pic/xatexit.o;=
 \
	else true; fi
rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
	  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./ar=
gv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./=
fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o .=
/getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbase=
name.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc=
.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-=
one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./stre=
rror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc=
.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o =20
ranlib ./libiberty.a
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/unlink-if-ordinary.c -o unlink-if-or=
dinary.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xatexit.c -o xatexit.o
yes
if [ x"" !=3D x ]; then \
	  cd pic; \
	  ar rc ./libiberty.a \
	    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o =
./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o=
 ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lba=
sename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objall=
oc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pe=
x-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./st=
rerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmall=
oc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ; \
	  ranlib ./libiberty.a; \
	  cd ..; \
	else true; fi
checking whether getchar_unlocked is declared... config.status: creating Ma=
kefile
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/build-x86_64-linux/libiberty'
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xexit.c -o pic/xexit.o; \
	else true; fi
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmalloc.c -o pic/xmalloc.o;=
 \
	else true; fi
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmemdup.c -o pic/xmemdup.o;=
 \
	else true; fi
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/build-x86_64-linux/fixincludes'
gcc  -c -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/fixincludes/../include /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/fixincl.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xexit.c -o xexit.o
config.status: creating config.h
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmemdup.c -o xmemdup.o
yes
checking whether getc_unlocked is declared... if [ x"-fPIC" !=3D x ]; then =
\
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrdup.c -o pic/xstrdup.o;=
 \
	else true; fi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xmalloc.c -o xmalloc.o
gcc  -c -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/fixincludes/../include /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/fixtests.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrdup.c -o xstrdup.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrerror.c -o pic/xstrerro=
r.o; \
	else true; fi
yes
checking whether putchar_unlocked is declared... config.status: executing d=
epdir commands
mkdir -p -- .deps
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrndup.c -o pic/xstrndup.=
o; \
	else true; fi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrerror.c -o xstrerror.o
gcc  -c -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/fixincludes/../include /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/fixfixes.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/xstrndup.c -o xstrndup.o
if [ x"-fPIC" !=3D x ]; then \
	  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wst=
rict-prototypes -pedantic  -fPIC /tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/mkstemps.c -o pic/mkstemps.=
o; \
	else true; fi
yes
checking whether putc_unlocked is declared... gcc  -c -isystem/tool/overo-o=
e/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Ws=
trict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-form=
at-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONF=
IG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-=
r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../include /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/fixincludes/server.c
gcc  -c -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/fixincludes/../include /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/procopen.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -DHAVE_CONFIG_H -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2  -I.=
 -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/libiberty/mkstemps.c -o mkstemps.o
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/fixincludes/server.c: In function 'server_setup':
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/fixincludes/server.c:195: warning: ignoring return value of 'getcwd', =
declared with attribute warn_unused_result
yes
checking whether getrlimit is declared... gcc  -c -isystem/tool/overo-oe/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H=
 -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/armv7a-angst=
rom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../include /tool/ov=
ero-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fix=
includes/fixlib.c
gcc  -c -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angs=
trom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/fixincludes/../include /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/fixopts.c
make[3]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/libiberty/testsuite'
rm -f ./libiberty.a pic/./libiberty.a
arm-angstrom-linux-gnueabi-ar rc ./libiberty.a \
	  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./ar=
gv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./=
fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o .=
/getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbase=
name.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc=
.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-=
one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./stre=
rror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc=
.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./mkstemps.o ./strnc=
mp.o
arm-angstrom-linux-gnueabi-ranlib ./libiberty.a
if [ x"-fPIC" !=3D x ]; then \
	  cd pic; \
	  arm-angstrom-linux-gnueabi-ar rc ./libiberty.a \
	    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./sha1.o ./alloca.o ./=
argv.o ./choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o =
./fibheap.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o=
 ./getopt.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lba=
sename.o ./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objall=
oc.o ./obstack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pe=
x-one.o ./pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./st=
rerror.o ./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmall=
oc.o ./xmemdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ./mkstemps.o ./str=
ncmp.o; \
	  arm-angstrom-linux-gnueabi-ranlib ./libiberty.a; \
	  cd ..; \
	else true; fi
yes
checking whether setrlimit is declared... make[2]: Leaving directory `/tool=
/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/=
build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/libiberty'
srcdir=3D"/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/fixincludes" /bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom=
-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/mkfixinc.sh arm-angstr=
om-linux-gnueabi
sed -e 's/@gcc_version@/4.4.1/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/fixincludes'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/fixincl.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/fixtests.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/fixfixes.c
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/libcpp'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o charset.o -MT charset.o -MMD -MP -MF .deps=
/charset.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.=
1-r13.1/gcc-4.4.1/libcpp/charset.c
gcc  -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include -O2 -g -L=
/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/over=
o-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/sysroo=
ts/x86_64-linux/usr/lib -Wl,-O1 -o fixincl fixincl.o fixtests.o fixfixes.o =
server.o procopen.o fixlib.o fixopts.o ../libiberty/libiberty.a
yes
checking whether getrusage is declared... echo timestamp > full-stamp
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/build-x86_64-linux/fixincludes'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/server.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/procopen.c
yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/fixlib.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c -fexpensive-optimizati=
ons -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-str=
ings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmiss=
ing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DH=
AVE_CONFIG_H -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/fixincludes -I../include -I/tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes/../incl=
ude /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/fixincludes/fixopts.c
checking whether ldgetname is declared... srcdir=3D"/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/fixincludes" /bin/=
sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/fixincludes/mkfixinc.sh arm-angstrom-linux-gnueabi
no
sed -e 's/@gcc_version@/4.4.1/' < mkheaders.almost > mkheadersT
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o directives.o -MT directives.o -MMD -MP -MF=
 .deps/directives.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/directives.c
checking whether times is declared... mv -f mkheadersT mkheaders
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o directives-only.o -MT directives-only.o -M=
MD -MP -MF .deps/directives-only.Tpo /tool/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/directives-only.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o errors.o -MT errors.o -MMD -MP -MF .deps/e=
rrors.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libcpp/errors.c
yes
checking whether sigaltstack is declared... arm-angstrom-linux-gnueabi-gcc =
-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthu=
mb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angs=
trom-linux-gnueabi -fexpensive-optimizations -frename-registers -fomit-fram=
e-pointer -O2 -ggdb2 -Wl,-O1 -Wl,--hash-style=3Dgnu -o fixincl fixincl.o fi=
xtests.o fixfixes.o server.o procopen.o fixlib.o fixopts.o ../libiberty/lib=
iberty.a
yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o expr.o -MT expr.o -MMD -MP -MF .deps/expr.=
Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/libcpp/expr.c
checking for struct tms... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a =
-mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno=
-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/=
gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueab=
i/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../include -I/tool/overo-oe/tmp/work/arm=
v7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpe=
nsive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W -=
Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-d=
efinition -Wmissing-format-attribute -pedantic -Wno-long-long  -I/tool/over=
o-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcp=
p -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -c -o files.o -MT fil=
es.o -MMD -MP -MF .deps/files.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-l=
inux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/files.c
echo timestamp > full-stamp
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/fixincludes'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o identifiers.o -MT identifiers.o -MMD -MP -=
MF .deps/identifiers.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/identifiers.c
yes
checking for clock_t... echo "#define LOCALEDIR \"/usr/share/locale\"" > lo=
caledir.new
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/libcpp/../move-if-change localedir.new localedir.h
echo timestamp > localedir.hs
yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o lex.o -MT lex.o -MMD -MP -MF .deps/lex.Tpo=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/libcpp/lex.c
checking for .preinit_array/.init_array/.fini_array support... no
checking if mkdir takes one argument... no
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o line-map.o -MT line-map.o -MMD -MP -MF .de=
ps/line-map.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/libcpp/line-map.c
For  real value is=20
For  real value is=20
Using `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/config/arm/arm.c' for machine-specific logic.
Using `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/config/arm/arm.md' as machine description file.
Using the following target machine macro files:
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/dbxelf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/elfos.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/linux.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/elf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-gas.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-elf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/bpabi.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-eabi.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/aout.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/arm.h
Using host-linux.o for host machine hooks.
checking for __cxa_atexit... arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-=
a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -m=
no-thumb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnue=
abi  -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../include -I/tool/overo-oe/tmp/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fex=
pensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -W=
 -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style=
-definition -Wmissing-format-attribute -pedantic -Wno-long-long  -I/tool/ov=
ero-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/lib=
cpp -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-=
linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -c -o macro.o -MT m=
acro.o -MMD -MP -MF .deps/macro.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom=
-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/macro.c
yes
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o mkdeps.o -MT mkdeps.o -MMD -MP -MF .deps/m=
kdeps.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libcpp/mkdeps.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o pch.o -MT pch.o -MMD -MP -MF .deps/pch.Tpo=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/libcpp/pch.c
configure: creating cache ./other.cache
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o symtab.o -MT symtab.o -MMD -MP -MF .deps/s=
ymtab.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r=
13.1/gcc-4.4.1/libcpp/symtab.c
checking build system type... x86_64-pc-linux-gnu
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o traditional.o -MT traditional.o -MMD -MP -=
MF .deps/traditional.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnue=
abi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/traditional.c
checking host system type... x86_64-pc-linux-gnu
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o makedepend.o -MT makedepend.o -MMD -MP -MF=
 .deps/makedepend.Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi=
/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/makedepend.c
checking target system type... arm-angstrom-linux-gnueabi
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -I/tool/overo-oe/tmp/wor=
k/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/libcpp/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/include  -fexpensive-optimizations -frenam=
e-registers -fomit-frame-pointer -O2 -ggdb2 -W -Wall -Wwrite-strings -Wstri=
ct-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-=
attribute -pedantic -Wno-long-long  -I/tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp -I. -I/tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/libcpp/../incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/libcpp/include  -c -o init.o -MT init.o -MMD -MP -MF .deps/init.=
Tpo /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/g=
cc-4.4.1/libcpp/init.c
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for x86_64-linux-gcc... gcc=20
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc  accepts -g... yes
checking for gcc  option to accept ANSI C... rm -f libcpp.a
arm-angstrom-linux-gnueabi-ar cru libcpp.a charset.o directives.o directive=
s-only.o errors.o expr.o files.o identifiers.o init.o lex.o line-map.o macr=
o.o mkdeps.o pch.o symtab.o traditional.o
arm-angstrom-linux-gnueabi-ranlib libcpp.a
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb2 -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -o makedepend \
	  makedepend.o libcpp.a ../libiberty/libiberty.a \
	  =20
none needed
checking whether gcc  and cc understand -c and -o together... make[2]: Leav=
ing directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnu=
eabi/libcpp'
yes
checking for x86_64-linux-gnatbind... no
checking for x86_64-linux-gnatmake... no
checking whether compiler driver understands Ada... no
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking for inline... inline
checking for void *... yes
checking size of void *... 8
checking for short... yes
checking size of short... 2
checking for int... yes
checking size of int... 4
checking for long... yes
checking size of long... 8
checking for long long... yes
checking for long long... (cached) yes
checking size of long long... 8
checking for __int64... no
checking whether gcc  supports -W... yes
checking whether gcc  supports -Wall... yes
checking whether gcc  supports -Wwrite-strings... yes
checking whether gcc  supports -Wstrict-prototypes... yes
checking whether gcc  supports -Wmissing-prototypes... yes
checking whether gcc  supports -Wcast-qual... yes
checking whether gcc  supports -Wold-style-definition... yes
checking whether gcc  supports -Wc++-compat... yes
checking whether gcc  supports -Wmissing-format-attribute... yes
checking whether gcc  supports -pedantic -Wno-long-long -Wno-variadic-macro=
s -Wno-overlength-strings... yes
checking valgrind.h usability... no
checking valgrind.h presence... no
checking for valgrind.h... no
configure: WARNING: decimal float is not supported for this target
configure: WARNING: fixed-point is not supported for this target
checking whether make sets $(MAKE)... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... yes
checking for x86_64-linux-ranlib... arm-angstrom-linux-gnueabi-ranlib
checking for a BSD compatible install... /tool/overo-oe/org.openembedded.de=
v/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo --split-size=3D5000000
checking for modern makeinfo... yes
checking for recent Pod::Man... yes
checking for flex... flex
checking for bison... bison
checking for nm... arm-angstrom-linux-gnueabi-nm
checking for ar... arm-angstrom-linux-gnueabi-ar
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking whether string.h and strings.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for limits.h... yes
checking for stddef.h... yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for time.h... yes
checking for iconv.h... yes
checking for fcntl.h... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... yes
checking for sys/time.h... yes
checking for sys/mman.h... yes
checking for sys/resource.h... yes
checking for sys/param.h... yes
checking for sys/times.h... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... no
checking for malloc.h... yes
checking for langinfo.h... yes
checking for ldfcn.h... no
checking for locale.h... yes
checking for wchar.h... yes
checking for thread.h... no
checking for pthread.h... yes
checking for CHAR_BIT... yes
checking whether byte ordering is bigendian... no
checking for collect2 libraries... none required
checking for library containing exc_resume... no
checking for library containing ldexp... none required
checking for inttypes.h... yes
checking for times... yes
checking for clock... yes
checking for kill... yes
checking for getrlimit... yes
checking for setrlimit... yes
checking for atoll... yes
checking for atoq... no
checking for sysconf... yes
checking for strsignal... yes
checking for getrusage... yes
checking for nl_langinfo... yes
checking for gettimeofday... yes
checking for mbstowcs... yes
checking for wcswidth... yes
checking for mmap... yes
checking for mincore... yes
checking for setlocale... yes
checking for clearerr_unlocked... yes
checking for feof_unlocked... yes
checking for ferror_unlocked... yes
checking for fflush_unlocked... yes
checking for fgetc_unlocked... yes
checking for fgets_unlocked... yes
checking for fileno_unlocked... yes
checking for fprintf_unlocked... no
checking for fputc_unlocked... yes
checking for fputs_unlocked... yes
checking for fread_unlocked... yes
checking for fwrite_unlocked... yes
checking for getchar_unlocked... yes
checking for getc_unlocked... yes
checking for putchar_unlocked... yes
checking for putc_unlocked... yes
checking whether mbstowcs works... yes
checking for ssize_t... yes
checking for caddr_t... yes
checking for uid_t in sys/types.h... yes
checking type of array argument to getgroups... gid_t
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking for pid_t... yes
checking for unistd.h... (cached) yes
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking for ld used by GCC... arm-angstrom-linux-gnueabi-ld --sysroot=3D/t=
ool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... yes
checking for shared library run path origin... done
checking for iconv... yes
checking for iconv declaration...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... yes
checking for nl_langinfo and CODESET... yes
checking whether getenv is declared... yes
checking whether atol is declared... yes
checking whether asprintf is declared... yes
checking whether sbrk is declared... yes
checking whether abort is declared... yes
checking whether atof is declared... yes
checking whether getcwd is declared... yes
checking whether getwd is declared... yes
checking whether strsignal is declared... yes
checking whether strstr is declared... yes
checking whether strverscmp is declared... yes
checking whether errno is declared... yes
checking whether snprintf is declared... yes
checking whether vsnprintf is declared... yes
checking whether vasprintf is declared... yes
checking whether malloc is declared... yes
checking whether realloc is declared... yes
checking whether calloc is declared... yes
checking whether free is declared... yes
checking whether basename is declared... yes
checking whether getopt is declared... no
checking whether clock is declared... yes
checking whether getpagesize is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking whether fileno_unlocked is declared... yes
checking whether fprintf_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether fread_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
checking whether putchar_unlocked is declared... yes
checking whether putc_unlocked is declared... yes
checking whether getrlimit is declared... yes
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
For  real value is=20
For  real value is=20
Using `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/config/arm/arm.c' for machine-specific logic.
Using `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/config/arm/arm.md' as machine description file.
Using the following target machine macro files:
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/dbxelf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/elfos.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/linux.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/elf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-gas.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-elf.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/bpabi.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/linux-eabi.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/aout.h
	/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/config/arm/arm.h
Using host-linux.o for host machine hooks.
checking whether NLS is requested... no
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... grep -F
checking for ld used by gcc ... arm-angstrom-linux-gnueabi-ld --sysroot=3D/=
tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... arm-angstrom-linux-g=
nueabi-nm
checking the name lister (arm-angstrom-linux-gnueabi-nm) interface... BSD n=
m
checking whether ln -s works... yes
checking the maximum length of command line arguments... 345876451382054092=
5
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/s=
ysroots/armv7a-angstrom-linux-gnueabi option to reload object files... -r
checking for x86_64-linux-objdump... arm-angstrom-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for x86_64-linux-ar... (cached) arm-angstrom-linux-gnueabi-ar
checking for x86_64-linux-strip... arm-angstrom-linux-gnueabi-strip
checking for x86_64-linux-ranlib... (cached) arm-angstrom-linux-gnueabi-ran=
lib
checking command to parse arm-angstrom-linux-gnueabi-nm output from gcc  ob=
ject... failed
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc  supports -fno-rtti -fno-exceptions... no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... yes
checking if gcc  static flag -static works... yes
checking if gcc  supports -c -o file.o... yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (arm-angstrom-linux-gnueabi-ld --sysroot=
=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -m elf_x86_64)=
 supports shared libraries... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... unsupported
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking what assembler to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/=
usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstro=
m-linux-gnueabi/bin/as
checking what linker to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr=
/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-l=
inux-gnueabi/bin/ld
checking what nm to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr/arm=
v7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-linux=
-gnueabi/bin/nm
checking what objdump to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-=
linux-gnueabi/bin/objdump
checking for readelf... /usr/bin/readelf
checking what readelf to use... /usr/bin/readelf
checking assembler for .balign and .p2align... yes
checking assembler for .p2align with maximum skip... yes
checking assembler for .literal16... no
checking assembler for working .subsection -1... yes
checking assembler for .weak... yes
checking assembler for .weakref... yes
checking assembler for .nsubspa comdat... no
checking assembler for .hidden... yes
checking linker for .hidden support... yes
checking linker read-only and read-write section mixing... read-write
checking assembler for .sleb128 and .uleb128... yes
checking assembler for cfi directives... yes
checking assembler for working cfi advance... no
checking assembler for cfi personality directive... yes
checking assembler for eh_frame optimization... no
checking assembler for section merging support... yes
checking assembler for COMDAT group support... no
checking assembler for COMDAT group support... yes
checking assembler for thread-local storage support... yes
checking linker -Bstatic/-Bdynamic option... yes
checking assembler for dwarf2 debug_line support... yes
checking assembler for buggy dwarf2 .file directive... no
checking assembler for --gdwarf2 option... yes
checking assembler for --gstabs option... yes
checking assembler for --debug-prefix-map option... yes
checking assembler for .lcomm with alignment... no
checking assembler for tolerance to line number 0... yes
checking linker PT_GNU_EH_FRAME support... yes
checking linker position independent executable support... yes
checking linker EH-compatible garbage collection of sections... no
checking linker --as-needed support... yes
checking linker --sysroot support... yes
checking __stack_chk_fail in target C library... no
Using ggc-page for garbage collection.
checking whether to enable maintainer-specific portions of Makefiles... no
Links are now set up to build a cross-compiler
 from x86_64-pc-linux-gnu to arm-angstrom-linux-gnueabi.
updating cache ./other.cache
configure: creating ./config.status
config.status: creating as
config.status: creating collect-ld
config.status: creating nm
config.status: creating Makefile
config.status: creating gccbug
config.status: creating ada/gcc-interface/Makefile
config.status: creating ada/Makefile
config.status: creating auto-host.h
config.status: executing default commands
checking whether NLS is requested... no
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... grep -F
checking for ld used by arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mt=
une=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-th=
umb --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi..=
. arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/sysroots/arm=
v7a-angstrom-linux-gnueabi
checking if the linker (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... arm-angstrom-linux-g=
nueabi-nm
checking the name lister (arm-angstrom-linux-gnueabi-nm) interface... BSD n=
m
checking whether ln -s works... yes
checking the maximum length of command line arguments... 345876451382054092=
5
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/s=
ysroots/armv7a-angstrom-linux-gnueabi option to reload object files... -r
checking for arm-angstrom-linux-gnueabi-objdump... arm-angstrom-linux-gnuea=
bi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-angstrom-linux-gnueabi-ar... (cached) arm-angstrom-linux-g=
nueabi-ar
checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-gnueabi=
-strip
checking for arm-angstrom-linux-gnueabi-ranlib... (cached) arm-angstrom-lin=
ux-gnueabi-ranlib
checking command to parse arm-angstrom-linux-gnueabi-nm output from arm-ang=
strom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -m=
float-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/overo-oe/=
tmp/sysroots/armv7a-angstrom-linux-gnueabi object... ok
checking for dlfcn.h... yes
checking for objdir... .libs
checking if arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports -fno=
-rtti -fno-exceptions... no
checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcorte=
x-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysro=
ot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi option to pr=
oduce PIC... -fPIC -DPIC
checking if arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi PIC flag -fPI=
C -DPIC works... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi static flag -=
static works... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports -c -=
o file.o... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex=
-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroo=
t=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi supports -c -=
o file.o... (cached) yes
checking whether the arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=
=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=
 --sysroot=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi link=
er (arm-angstrom-linux-gnueabi-ld --sysroot=3D/tool/overo-oe/tmp/sysroots/a=
rmv7a-angstrom-linux-gnueabi) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking what assembler to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/=
usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstro=
m-linux-gnueabi/bin/as
checking what linker to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr=
/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-l=
inux-gnueabi/bin/ld
checking what nm to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/usr/arm=
v7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-linux=
-gnueabi/bin/nm
checking what objdump to use... /tool/overo-oe/tmp/sysroots/x86_64-linux/us=
r/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.1/../../../../arm-angstrom-=
linux-gnueabi/bin/objdump
checking for readelf... /usr/bin/readelf
checking what readelf to use... /usr/bin/readelf
checking assembler for .balign and .p2align... yes
checking assembler for .p2align with maximum skip... yes
checking assembler for .literal16... no
checking assembler for working .subsection -1... yes
checking assembler for .weak... yes
checking assembler for .weakref... yes
checking assembler for .nsubspa comdat... no
checking assembler for .hidden... yes
checking linker for .hidden support... yes
checking linker read-only and read-write section mixing... read-write
checking assembler for .sleb128 and .uleb128... yes
checking assembler for cfi directives... yes
checking assembler for working cfi advance... no
checking assembler for cfi personality directive... yes
checking assembler for eh_frame optimization... no
checking assembler for section merging support... yes
checking assembler for COMDAT group support... no
checking assembler for COMDAT group support... yes
checking assembler for thread-local storage support... yes
checking linker -Bstatic/-Bdynamic option... yes
checking assembler for dwarf2 debug_line support... yes
checking assembler for buggy dwarf2 .file directive... no
checking assembler for --gdwarf2 option... yes
checking assembler for --gstabs option... yes
checking assembler for --debug-prefix-map option... yes
checking assembler for .lcomm with alignment... no
checking assembler for tolerance to line number 0... yes
checking linker PT_GNU_EH_FRAME support... yes
checking linker position independent executable support... yes
checking linker EH-compatible garbage collection of sections... no
checking linker --as-needed support... yes
checking linker --sysroot support... yes
checking __stack_chk_fail in target C library... no
Using ggc-page for garbage collection.
checking whether to enable maintainer-specific portions of Makefiles... no
Links are now set up to build (on x86_64-pc-linux-gnu) a native compiler
 for arm-angstrom-linux-gnueabi.
updating cache ./config.cache
configure: creating ./config.status
config.status: creating as
config.status: creating collect-ld
config.status: creating nm
config.status: creating Makefile
config.status: creating gccbug
config.status: creating ada/gcc-interface/Makefile
config.status: creating ada/Makefile
config.status: creating auto-host.h
config.status: executing default commands
make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angs=
trom-linux-gnueabi/gcc'
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"" \
	/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/mkconfig.sh config.h
TARGET_CPU_DEFAULT=3D"TARGET_CPU_generic" \
	HEADERS=3D"options.h config/dbxelf.h config/elfos.h config/linux.h config/=
arm/elf.h config/arm/linux-gas.h config/arm/linux-elf.h config/arm/bpabi.h =
config/arm/linux-eabi.h config/arm/aout.h config/arm/arm.h defaults.h" DEFI=
NES=3D"UCLIBC_DEFAULT=3D0" \
	/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/mkconfig.sh tm.h
gawk -f /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/opt-gather.awk /tool/overo-oe/tmp/work/armv7a-angstrom-lin=
ux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/ada/gcc-interface/lang.opt /tool/o=
vero-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gc=
c/fortran/lang.opt /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/gcc/java/lang.opt /tool/overo-oe/tmp/work/armv7a-an=
gstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/c.opt /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/common.op=
t /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc=
-4.4.1/gcc/config/arm/arm.opt /tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/config/linux.opt > tmp-optionlist
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-build.h ansidecl.h" DEFINES=3D"" \
	/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/mkconfig.sh bconfig.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-gi.list gtyp-input.list
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"config/arm/arm-protos.h tm-preds.h" DEFINES=3D"" \
	/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/mkconfig.sh tm_p.h
rm -f tmp-all-tree.def
echo timestamp > s-gtyp-input
echo '#include "tree.def"' > tmp-all-tree.def
if test no =3D yes \
	   || test -n ""; then \
	  /bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-=
r13.1/gcc-4.4.1/gcc/genmultilib \
	    "" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "no" \
	    > tmp-mlib.h; \
	else \
	  /bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-=
r13.1/gcc-4.4.1/gcc/genmultilib '' '' '' '' '' '' '' no \
	    > tmp-mlib.h; \
	fi
lsf=3D"/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/cp/lang-specs.h /tool/overo-oe/tmp/work/armv7a-angstrom-lin=
ux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/objc/lang-specs.h"; for f in $lsf;=
 do \
	    echo "#include \"$f\""; \
	done | sed 's|/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/||' > tmp-specs.h
echo 'END_OF_BASE_TREE_CODES' >> tmp-all-tree.def
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-specs.h specs.h
echo '#ifdef __ARM_ARCH_6M__' > addsf3.c
echo '#ifdef __ARM_ARCH_6M__' > divsf3.c
echo '#include "c-common.def"' >> tmp-all-tree.def
echo '#include "config/soft-fp/addsf3.c"' >> addsf3.c
echo '#include "config/soft-fp/divsf3.c"' >> divsf3.c
echo timestamp > s-specs
ltf=3D"/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.=
1/gcc-4.4.1/gcc/ada/gcc-interface/ada-tree.def /tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/cp/cp-tree.def /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/java/java-tree.def /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnuea=
bi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/objc/objc-tree.def"; for f in $ltf; do \
	  echo "#include \"$f\""; \
	done | sed 's|/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/||' >> tmp-all-tree.def
echo '#endif' >> addsf3.c
echo '#endif' >> divsf3.c
echo '#ifdef __ARM_ARCH_6M__' > eqsf2.c
echo '#ifdef __ARM_ARCH_6M__' > gesf2.c
echo '#ifdef __ARM_ARCH_6M__' > lesf2.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-all-tree.def all-tree.def
echo '#include "config/soft-fp/eqsf2.c"' >> eqsf2.c
echo '#include "config/soft-fp/gesf2.c"' >> gesf2.c
echo '#include "config/soft-fp/lesf2.c"' >> lesf2.c
echo '#endif' >> eqsf2.c
echo '#endif' >> gesf2.c
echo '#endif' >> lesf2.c
echo timestamp > s-alltree
echo '#ifdef __ARM_ARCH_6M__' > mulsf3.c
echo '#ifdef __ARM_ARCH_6M__' > negsf2.c
echo '#ifdef __ARM_ARCH_6M__' > subsf3.c
echo '#ifdef __ARM_ARCH_6M__' > unordsf2.c
echo '#include "config/soft-fp/mulsf3.c"' >> mulsf3.c
echo '#include "config/soft-fp/negsf2.c"' >> negsf2.c
echo '#include "config/soft-fp/subsf3.c"' >> subsf3.c
echo '#include "config/soft-fp/unordsf2.c"' >> unordsf2.c
echo '#endif' >> mulsf3.c
echo '#endif' >> negsf2.c
echo '#endif' >> subsf3.c
echo '#ifdef __ARM_ARCH_6M__' > fixsfsi.c
echo '#ifdef __ARM_ARCH_6M__' > floatsisf.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-mlib.h multilib.h
echo '#endif' >> unordsf2.c
echo '#include "config/soft-fp/fixsfsi.c"' >> fixsfsi.c
echo '#include "config/soft-fp/floatsisf.c"' >> floatsisf.c
echo '#ifdef __ARM_ARCH_6M__' > floatunsisf.c
echo '#endif' >> fixsfsi.c
echo '#ifdef __ARM_ARCH_6M__' > adddf3.c
echo '#endif' >> floatsisf.c
echo '#include "config/soft-fp/floatunsisf.c"' >> floatunsisf.c
echo timestamp > s-mlib
echo '#ifdef __ARM_ARCH_6M__' > divdf3.c
echo '#include "config/soft-fp/adddf3.c"' >> adddf3.c
echo '#endif' >> floatunsisf.c
echo '#ifdef __ARM_ARCH_6M__' > eqdf2.c
echo '#include "config/soft-fp/divdf3.c"' >> divdf3.c
echo '#ifdef __ARM_ARCH_6M__' > gedf2.c
echo '#endif' >> adddf3.c
echo '#include "config/soft-fp/eqdf2.c"' >> eqdf2.c
echo '#endif' >> divdf3.c
echo '#include "config/soft-fp/gedf2.c"' >> gedf2.c
echo '#ifdef __ARM_ARCH_6M__' > ledf2.c
echo '#ifdef __ARM_ARCH_6M__' > muldf3.c
echo '#endif' >> eqdf2.c
echo '#ifdef __ARM_ARCH_6M__' > negdf2.c
echo '#endif' >> gedf2.c
echo '#include "config/soft-fp/ledf2.c"' >> ledf2.c
echo '#include "config/soft-fp/muldf3.c"' >> muldf3.c
echo '#ifdef __ARM_ARCH_6M__' > subdf3.c
echo '#endif' >> ledf2.c
echo '#include "config/soft-fp/negdf2.c"' >> negdf2.c
echo '#endif' >> muldf3.c
echo '#ifdef __ARM_ARCH_6M__' > unorddf2.c
echo '#include "config/soft-fp/subdf3.c"' >> subdf3.c
echo '#ifdef __ARM_ARCH_6M__' > fixdfsi.c
echo '#endif' >> negdf2.c
echo '#ifdef __ARM_ARCH_6M__' > floatsidf.c
echo '#include "config/soft-fp/unorddf2.c"' >> unorddf2.c
echo '#endif' >> subdf3.c
echo '#include "config/soft-fp/fixdfsi.c"' >> fixdfsi.c
echo '#include "config/soft-fp/floatsidf.c"' >> floatsidf.c
echo '#ifdef __ARM_ARCH_6M__' > floatunsidf.c
echo '#endif' >> unorddf2.c
echo '#ifdef __ARM_ARCH_6M__' > extendsfdf2.c
echo '#endif' >> fixdfsi.c
echo '#endif' >> floatsidf.c
echo '#include "config/soft-fp/floatunsidf.c"' >> floatunsidf.c
echo '#ifdef __ARM_ARCH_6M__' > truncdfsf2.c
echo '#include "config/soft-fp/extendsfdf2.c"' >> extendsfdf2.c
echo '#endif' >> floatunsidf.c
echo '#include "config/soft-fp/truncdfsf2.c"' >> truncdfsf2.c
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"USED_FOR_TARGET " \
	/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/mkconfig.sh tconfig.h
echo '#endif' >> extendsfdf2.c
echo '#endif' >> truncdfsf2.c
cp /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/gcc/config/arm/sfp-machine.h sfp-machine.h
(echo "@set version-GCC 4.4.1"; \
	 if [ "" =3D "experimental" ]; \
	 then echo "@set DEVELOPMENT"; \
	 else echo "@clear DEVELOPMENT"; \
	 fi) > gcc-vers.texiT
echo @set srcdir /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc >> gcc-vers.texiT
echo timestamp > gpl.pod
if [ -n "(GCC) " ]; then \
	  echo "@set VERSION_PACKAGE (GCC) " >> gcc-vers.texiT; \
	fi
perl /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/=
gcc-4.4.1/gcc/../contrib/texi2pod.pl /tool/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/include/gpl_v3.texi > gpl=
.pod
echo "@set BUGURL @uref{http://gcc.gnu.org/bugs.html}" >> gcc-vers.texiT; \
	mv -f gcc-vers.texiT gcc-vers.texi
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genchecksum.o /tool/overo-oe/t=
mp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genchec=
ksum.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/errors.c -o errors.o
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/doc \
			-I /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/doc/include -o doc/cpp.info /tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/cpp.texi; \
	fi
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/doc \
			-I /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/doc/include -o doc/gcc.info /tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/gcc.texi; \
	fi
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/doc \
			-I /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/doc/include -o doc/gccint.info /tool/overo-oe/tmp/work/armv7=
a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/gccint.texi; \
	fi
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I /too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/doc \
			-I /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/doc/include -o doc/gccinstall.info /tool/overo-oe/tmp/work/a=
rmv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/install.texi=
; \
	fi
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-=
4.4.1/gcc/doc \
			-I /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/doc/include -o doc/cppinternals.info /tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/doc/cppinterna=
ls.texi; \
	fi
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-optionlist optionlist
echo timestamp > doc/gpl.7
echo timestamp > s-options
(pod2man --center=3D"GNU" --release=3D"gcc-4.4.1" --section=3D7 gpl.pod > d=
oc/gpl.7.T$$ && \
		mv -f doc/gpl.7.T$$ doc/gpl.7) || \
		(rm -f doc/gpl.7.T$$ && exit 1)
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genmodes.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genmodes.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/errors.o /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/errors.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gengenrtl.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gengenrtl=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gengtype.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gengtype.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gengtype-lex.o /tool/overo-oe/=
tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gengty=
pe-lex.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gengtype-parse.o /tool/overo-o=
e/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/geng=
type-parse.c
gawk -f /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/opt-functions.awk -f /tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/optc-gen.awk \
	       -v header_name=3D"config.h system.h coretypes.h tm.h" < optionlist =
> options.c
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genche=
cksum \
	    build/genchecksum.o ../build-x86_64-linux/libiberty/libiberty.a
gawk -f /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/opt-functions.awk -f /tool/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/opth-gen.awk \
	       < optionlist > tmp-options.h
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genmod=
es \
	    build/genmodes.o build/errors.o ../build-x86_64-linux/libiberty/libibe=
rty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gengen=
rtl \
	    build/gengenrtl.o build/errors.o ../build-x86_64-linux/libiberty/libib=
erty.a
build/genmodes -m > tmp-min-modes.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-min-modes.c min-insn-modes.c
echo timestamp > s-modes-m
build/genmodes > tmp-modes.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-modes.c insn-modes.c
echo timestamp > s-modes
build/gengenrtl > tmp-genrtl.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-genrtl.c genrtl.c
build/genmodes -h > tmp-modes.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-modes.h insn-modes.h
echo timestamp > s-genrtl
build/gengenrtl -h > tmp-genrtl.h
echo timestamp > s-modes-h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-genrtl.h genrtl.h
echo timestamp > s-genrtl-h
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/min-insn-modes.o min-insn-mode=
s.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-options.h options.h
echo timestamp > s-options-h
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genconstants.o /tool/overo-oe/=
tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gencon=
stants.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/read-rtl.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/read-rtl.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gensupport.o /tool/overo-oe/tm=
p/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gensuppo=
rt.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/print-rtl.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/print-rtl=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genmddeps.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genmddeps=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genflags.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genflags.c
gcc  -c -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inclu=
de -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/tool/=
overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/g=
cc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp/s=
ysroots/x86_64-linux/usr/include  -o build/genconditions.o /tool/overo-oe/t=
mp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gencond=
itions.c
gcc  -c -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inclu=
de -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/tool/=
overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/g=
cc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp/s=
ysroots/x86_64-linux/usr/include  -o build/genpreds.o /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genpreds.c
gcc  -c -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inclu=
de -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/tool/=
overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/g=
cc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp/s=
ysroots/x86_64-linux/usr/include  -o build/gencheck.o /tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gencheck.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genattr.o /tool/overo-oe/tmp/w=
ork/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genattr.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gencodes.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gencodes.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genconfig.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genconfig=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genautomata.o /tool/overo-oe/t=
mp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genauto=
mata.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genemit.o /tool/overo-oe/tmp/w=
ork/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genemit.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genextract.o /tool/overo-oe/tm=
p/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genextra=
ct.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genopinit.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genopinit=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genoutput.o /tool/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genoutput=
.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genpeep.o /tool/overo-oe/tmp/w=
ork/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genpeep.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genrecog.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genrecog.c
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gengty=
pe \
	    build/gengtype.o build/gengtype-lex.o build/gengtype-parse.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include =
-O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath=
,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencheck=
 \
	    build/gencheck.o ../build-x86_64-linux/libiberty/libiberty.a
build/gengtype /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc gtyp-input.list
build/gencheck > tmp-check.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-check.h tree-check.h
echo timestamp > s-check
echo timestamp > s-gtype
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/rtl.o /tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/rtl.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/ggc-none.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/ggc-none.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/vec.o /tool/overo-oe/tmp/work/=
armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/vec.c
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/genattrtab.o /tool/overo-oe/tm=
p/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/genattrt=
ab.c
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencon=
stants \
	    build/genconstants.o build/rtl.o build/read-rtl.o build/ggc-none.o bui=
ld/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/=
errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genmdd=
eps \
	    build/genmddeps.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genfla=
gs \
	    build/genflags.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include =
-O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath=
,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencondi=
tions \
	    build/genconditions.o build/rtl.o build/read-rtl.o build/ggc-none.o bu=
ild/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build=
/errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/include =
-O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath=
,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genpreds=
 \
	    build/genpreds.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genatt=
r \
	    build/genattr.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencod=
es \
	    build/gencodes.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencon=
fig \
	    build/genconfig.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genaut=
omata \
	    build/genautomata.o build/rtl.o build/read-rtl.o build/ggc-none.o buil=
d/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/e=
rrors.o ../build-x86_64-linux/libiberty/libiberty.a -lm
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genemi=
t \
	    build/genemit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genext=
ract \
	    build/genextract.o build/rtl.o build/read-rtl.o build/ggc-none.o build=
/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/er=
rors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genopi=
nit \
	    build/genopinit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genout=
put \
	    build/genoutput.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genpee=
p \
	    build/genpeep.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genrec=
og \
	    build/genrecog.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
build/genmddeps /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md > tmp-mddeps
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-mddeps mddeps.mk
echo timestamp > s-mddeps
build/genconstants /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  > tmp-constants.h
build/genconditions /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/g=
cc-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md > tmp-condmd.c
build/genpreds -h /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md > tmp-preds.h
build/genpreds -c /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md > tmp-constrs.h
build/genpreds /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md > tmp-preds.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-preds.h tm-preds.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-condmd.c build/gencondmd.c
echo timestamp > s-preds-h
echo timestamp > s-conditions
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-constrs.h tm-constrs.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-constants.h insn-constants.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-preds.c insn-preds.c
echo timestamp > s-constrs-h
echo timestamp > s-constants
echo timestamp > s-preds
gcc  -c -DIN_GCC -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inclu=
de -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-ang=
strom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/tool/=
overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/g=
cc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv7a=
-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/to=
ol/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.=
1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp/s=
ysroots/x86_64-linux/usr/include  -o build/gencondmd.o build/gencondmd.c
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencon=
dmd \
	    build/gencondmd.o ../build-x86_64-linux/libiberty/libiberty.a
build/gencondmd > tmp-cond.md
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-cond.md insn-conditions.md
echo timestamp > s-condmd
build/genflags /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-flags.h
build/genattr /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4=
.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-attr.h
build/gencodes /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-codes.h
build/genconfig /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-config.h
build/genautomata /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-automata.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-attr.h insn-attr.h
echo timestamp > s-attr
build/genemit /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4=
.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-emit.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-config.h insn-config.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-codes.h insn-codes.h
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-flags.h insn-flags.h
echo timestamp > s-codes
echo timestamp > s-config
echo timestamp > s-flags
build/genextract /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-extract.c
build/genopinit /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-opinit.c
build/genoutput /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4=
.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-output.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-emit.c insn-emit.c
echo timestamp > s-emit
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/gcc/config/arm/arm.md:1242: trailing whitespace in output template
/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4=
.4.1/gcc/config/arm/arm.md:1242: trailing whitespace in output template
build/genpeep /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4=
.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-peep.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-extract.c insn-extract.c
echo timestamp > s-extract
build/genrecog /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.=
4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-recog.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-opinit.c insn-opinit.c
echo timestamp > s-opinit
gcc  -c -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DGENERATOR_FILE -I. -Ibuild -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/wo=
rk/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/build -I/too=
l/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1=
/gcc/../include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/include -I/tool/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/=
tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.=
4.1/gcc/../libdecnumber/dpd -I../libdecnumber    -isystem/tool/overo-oe/tmp=
/sysroots/x86_64-linux/usr/include  -o build/gcov-iov.o /tool/overo-oe/tmp/=
work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/gcov-iov.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-peep.c insn-peep.c
echo timestamp > s-peep
(SHLIB_LINK=3D'arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcor=
tex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sys=
root=3D/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -march=3Da=
rmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwo=
rk -mno-thumb -isystem/tool/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include -O2  -g -Os -DIN_GCC   -W -Wall -Wwrite-strings -Wstrict-p=
rototypes -Wmissing-prototypes -Wcast-qual -Wold-style-definition  -isystem=
 ./include  -fPIC -Wno-missing-prototypes -g -DHAVE_GTHR_DEFAULT -DIN_LIBGC=
C2 -D__GCC_FLOAT_NOT_NEEDED  -shared -nodefaultlibs -Wl,--soname=3D@shlib_b=
ase_name@.so.1 -Wl,--version-script=3D@shlib_map_file@ -o @multilib_dir@/@s=
hlib_base_name@.so.1.tmp @multilib_flags@ @shlib_objs@ @libgcc_libm@ -lc &&=
 rm -f @multilib_dir@/@shlib_base_name@.so && if [ -f @multilib_dir@/@shlib=
_base_name@.so.1 ]; then mv -f @multilib_dir@/@shlib_base_name@.so.1 @multi=
lib_dir@/@shlib_base_name@.so.1.backup; else true; fi && mv @multilib_dir@/=
@shlib_base_name@.so.1.tmp @multilib_dir@/@shlib_base_name@.so.1 && ln -s @=
shlib_base_name@.so.1 @multilib_dir@/@shlib_base_name@.so'; \
	arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool=
/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimi=
zations -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -W=
all -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -W=
old-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno=
-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -=
I. -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/g=
cc-4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/w=
ork/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/i=
nclude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom=
-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libde=
cnumber     -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PRE=
FIX=3D\"/usr/lib/gcc/\" -DSTANDARD_LIBEXEC_PREFIX=3D\"/usr/libexec/gcc/\" -=
DDEFAULT_TARGET_VERSION=3D\"4.4.1\" -DDEFAULT_TARGET_MACHINE=3D\"arm-angstr=
om-linux-gnueabi\" -DSTANDARD_BINDIR_PREFIX=3D\"/usr/bin/\" -DTOOLDIR_BASE_=
PREFIX=3D\"../../../../\"  `test "X${SHLIB_LINK}" =3D "X" || test "yes" !=
=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` \
		-I. -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1=
-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueab=
i/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom=
-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tm=
p/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcp=
p/include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1=
-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angst=
rom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../li=
bdecnumber    /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4=
.1-r13.1/gcc-4.4.1/gcc/cp/g++spec.c)
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 build/gcov-iov.=
o -o build/gcov-iov
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-recog.c insn-recog.c
build/gcov-iov '4.4.1' '' \
	    > tmp-gcov-iov.h
echo timestamp > s-recog
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-gcov-iov.h gcov-iov.h
echo timestamp > s-iov
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/gcov.c -o gcov.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/gcov-dump.c -o gcov-dump.o
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-output.c insn-output.c
echo timestamp > s-output
gcc  -DIN_GCC   -isystem/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DGENERATOR_FILE -L/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpa=
th,/tool/overo-oe/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genatt=
rtab \
	    build/genattrtab.o build/rtl.o build/read-rtl.o build/ggc-none.o build=
/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/er=
rors.o ../build-x86_64-linux/libiberty/libiberty.a
build/genattrtab /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm.md \
	  insn-conditions.md > tmp-attrtab.c
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-attrtab.c insn-attrtab.c
echo timestamp > s-attrtab
/bin/sh /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13=
.1/gcc-4.4.1/gcc/../move-if-change tmp-automata.c insn-automata.c
echo timestamp > s-automata
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-lang.c -o c-lang.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/stub-objc.c -o stub-objc.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/attribs.c -o attribs.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-errors.c -o c-errors.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-lex.c -o c-lex.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-pragma.c -o c-pragma.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-decl.c -o c-decl.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-typeck.c -o c-typeck.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-convert.c -o c-convert.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-aux-info.c -o c-aux-info.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-common.c -o c-common.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     \
		/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc=
-4.4.1/gcc/c-opts.c -o c-opts.o=20
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-format.c -o c-format.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-semantics.c -o c-semantics.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-ppoutput.c -o c-ppoutput.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     -DBASEVER=3D"\"4.4.1\"" \
		/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc=
-4.4.1/gcc/c-cppbuiltin.c -o c-cppbuiltin.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-objc-common.c -o c-objc-common.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-dump.c -o c-dump.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     \
	  -DHOST_MACHINE=3D\"arm-angstrom-linux-gnueabi\" -DTARGET_MACHINE=3D\"arm=
-angstrom-linux-gnueabi\" \
	  /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gc=
c-4.4.1/gcc/c-pch.c -o c-pch.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-parser.c -o c-parser.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     -I. -I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/over=
o-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/.=
./libcpp/include -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7=
a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd =
-I../libdecnumber    /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/=
gcc-4.4.1-r13.1/gcc-4.4.1/gcc/config/arm/arm-c.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-gimplify.c -o c-gimplify.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/tree-mudflap.c -o tree-mudflap.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-pretty-print.c -o c-pretty-print.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/c-omp.c -o c-omp.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/dummy-checksum.c -o dummy-checksum.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/main.c -o main.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-attrtab.c -o insn-attrtab.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-automata.c -o insn-automata.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-emit.c -o insn-emit.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-extract.c -o insn-extract.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-modes.c -o insn-modes.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-opinit.c -o insn-opinit.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-output.c -o insn-output.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-peep.c -o insn-peep.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-preds.c -o insn-preds.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     insn-recog.c -o insn-recog.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/ggc-page.c -o ggc-page.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/alias.c -o alias.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/alloc-pool.c -o alloc-pool.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/auto-inc-dec.c -o auto-inc-dec.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/bb-reorder.c -o bb-reorder.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/bitmap.c -o bitmap.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/bt-load.c -o bt-load.o
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/tool/ov=
ero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -fexpensive-optimizat=
ions -frename-registers -fomit-frame-pointer -O2 -ggdb2 -DIN_GCC   -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wcast-qual -Wold=
-style-definition -Wc++-compat -Wmissing-format-attribute -pedantic -Wno-lo=
ng-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -I. =
-I. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
4.4.1-r13.1/gcc-4.4.1/gcc/. -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux=
-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../include -I/tool/overo-oe/tmp/work=
/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libcpp/incl=
ude -I/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r13.1=
/gcc-4.4.1/gcc/../libdecnumber -I/tool/overo-oe/tmp/work/armv7a-angstrom-li=
nux-gnueabi/gcc-4.4.1-r13.1/gcc-4.4.1/gcc/../libdecnumber/dpd -I../libdecnu=
mber     /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-4.4.1-r1=
3.1/gcc-4.4.1/gcc/builtins.c -o builtins.o
/tmp/ccC0NmMi.s: Assembler messages:
/tmp/ccC0NmMi.s:36309: Error: offset out of range
/tmp/ccC0NmMi.s:36310: Error: offset out of range
/tmp/ccC0NmMi.s:36345: Error: offset out of range
/tmp/ccC0NmMi.s:36346: Error: offset out of range
/tmp/ccC0NmMi.s:36381: Error: offset out of range
/tmp/ccC0NmMi.s:36382: Error: offset out of range
/tmp/ccC0NmMi.s:36416: Error: offset out of range
/tmp/ccC0NmMi.s:36417: Error: offset out of range
make[2]: *** [insn-output.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.4.1-r13.1/gcc-4.4.1/build.arm-angstrom-linux-gnueabi.arm-angst=
rom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

--Apple-Mail=_5355BE65-5FF6-429E-A210-A2D085128488--
