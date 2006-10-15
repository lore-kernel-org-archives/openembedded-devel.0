Received: from [150.65.5.23] (helo=mailproxy-in2.jaist.ac.jp)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <zrelli@mlserv.jaist.ac.jp>) id 1GZ6X8-0001Jf-Nb
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 16:00:11 +0200
Received: from localhost (localhost [127.0.0.1]) by mailproxy-in2.jaist.ac.jp
	(JAIST-MAIL) with SMTP id <0J76001D0JX2CO@mailproxy-in2.jaist.ac.jp>
	for openembedded-devel@lists.openembedded.org; Sun,
	15 Oct 2006 22:53:26 +0900 (JST)
Received: from mlserv.jaist.ac.jp (mlserv.jaist.ac.jp [150.65.38.6])
	by mailproxy-in2.jaist.ac.jp (JAIST-MAIL)
	with ESMTP id <0J7600BFPJWXAL@mailproxy-in2.jaist.ac.jp> for
	openembedded-devel@lists.openembedded.org; Sun,
	15 Oct 2006 22:53:21 +0900 (JST)
Received: by mlserv.jaist.ac.jp (Postfix, from userid 15136)
	id 6BF6816916; Sun, 15 Oct 2006 22:53:21 +0900 (JST)
Date: Sun, 15 Oct 2006 22:53:21 +0900
From: Saber Zrelli <zrelli@jaist.ac.jp>
To: openembedded-devel@lists.openembedded.org
Message-id: <20061015135321.GA23309@mlserv.jaist.ac.jp>
Organization: Japan Advanced Institute of Science and Technology
MIME-version: 1.0
User-Agent: Mutt/1.5.10i
Subject: gcc-cross-3.4.4-r4 fails with (c7x0/openzaurus 5.3.4.1)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 14:00:12 -0000
X-Groupsio-MsgNum: 585
Content-type: multipart/mixed; boundary="PEIAKu/WMn1b1Hv9"
Content-disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=euc-jp
Content-Disposition: inline

Hello,

I am new to OE but I am planning to used quiet often from now on.

I faced some problems during my first attempt to install and try OE.

I use Linux Ubuntu 6.06 as host OS and the oz534x branch with the
following local.conf file :

------------

DL_DIR = "${HOME}/sources"
BBFILES := "/OE/org.openembedded.oz354x/packages/*/*.bb"
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-qpe"
MACHINE = "c7x0"
TARGET_ARCH = "arm"
TARGET_OS = "linux"
DISTRO = "openzaurus-3.5.4.1"
IMAGE_FSTYPES = "jffs2 tar"
BBINCLUDELOGS = "yes"
CVS_TARBALL_STASH = "http://www.oesources.org/source/current/"

------------


The 'bitbake nano' command produces the following error :

--------------

... ...

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "4066c7c3f3a6beeb7dda33113e22f24901e84170"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "c7x0"
DISTRO         = "openzaurus"
DISTRO_VERSION = "3.5.4.1"
TARGET_FPU     = "soft"

... ...


| checking for main in -lm... configure: error: Link tests are not allowed after  GCC_NO_EXECUTABLES.
| make: *** [configure-target-libstdc++-v3] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /OE/build/tmp/work/gcc-cross-3.4.4-r4/temp/log.do_compile.175 05
NOTE: package gcc-cross-3.4.4-r4: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gcc-cross-3.4.4: failed
ERROR: Build of nano failed

-----------------


The log file is attached to this e-mail.


Many thanks for any hints and solutions,


Regards,
Saber.




--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=euc-jp
Content-Disposition: attachment; filename="log.do_compile.17505"

NOTE: make ARCH_FLAGS_FOR_TARGET=
make[1]: Entering directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/libiberty'
make[2]: Entering directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/libiberty/testsuite'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/libiberty/testsuite'
make[1]: Leaving directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/libiberty'
make[1]: Entering directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/intl'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/intl'
make[1]: Entering directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
make \
	  CFLAGS="-I/OE/build/tmp/staging/i686-linux/include -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic -Wno-long-long  " \
	  CONFIG_H="tconfig.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/../include/ansidecl.h" TM_H="tm.h      /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/dbxelf.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/elfos.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/linux.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/arm/elf.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/arm/linux-gas.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/arm/linux-elf.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/arm/aout.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/config/arm/arm.h /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/defaults.h insn-constants.h insn-flags.h" \
	  INCLUDES="-I. -I. -I/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc -I/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/. -I/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/../include " \
	  MAKEOVERRIDES= \
	  -f libgcc.mk all
make[2]: Entering directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
for d in libgcc; do \
	  if [ -d $d ]; then true; else /bin/sh /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/gcc/mkinstalldirs $d; fi; \
	done
if [ -f stmp-dirs ]; then true; else touch stmp-dirs; fi
make[2]: Leaving directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
make[1]: Leaving directory `/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc'
Checking multilib configuration...
multilib.out is unchanged
Configuring in arm-linux/libstdc++-v3
configure: loading cache ./config.cache
checking build system type... (cached) i686-pc-linux-gnu
checking host system type... (cached) arm-unknown-linux-gnu
checking target system type... (cached) arm-unknown-linux-gnu
checking for a BSD-compatible install... (cached) /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... (cached) gawk
checking whether make sets $(MAKE)... (cached) yes
checking for arm-linux-strip... (cached) strip
checking for arm-linux-gcc... (cached)  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include
checking for suffix of object files... (cached) o
checking whether we are using the GNU C compiler... (cached) yes
checking whether  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include accepts -g... (cached) yes
checking for  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include option to accept ANSI C... (cached) none needed
checking for arm-linux-g++... (cached)  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -shared-libgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -nostdinc++ -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src/.libs -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include
checking whether we are using the GNU C++ compiler... (cached) yes
checking whether  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -shared-libgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -nostdinc++ -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src/.libs -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include accepts -g... (cached) yes
checking for GCC version number... 3.4.4
checking whether ln -s works... yes
checking for arm-linux-as... (cached) /OE/build/tmp/cross/arm-linux/bin/as
checking for arm-linux-ar... (cached) arm-linux-ar
checking for arm-linux-ranlib... (cached) arm-linux-ranlib
checking whether to enable maintainer-specific portions of Makefiles... no
configure: CPU config directory is cpu/generic
configure: OS config directory is os/gnu-linux
checking for ld used by GCC... (cached) /OE/build/tmp/cross/arm-linux/bin/ld
checking if the linker (/OE/build/tmp/cross/arm-linux/bin/ld) is GNU ld... (cached) yes
checking for /OE/build/tmp/cross/arm-linux/bin/ld option to reload object files... (cached) -r
checking for BSD-compatible nm... (cached) /OE/build/tmp/cross/arm-linux/bin/nm
checking how to recognise dependant libraries... (cached) file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )
checking for arm-linux-file... (cached) /usr/bin/file
checking for arm-linux-ranlib... (cached) arm-linux-ranlib
checking for arm-linux-strip... (cached) strip
updating cache ./config.cache
loading cache ./config.cache within ltconfig
checking whether -lc should be explicitly linked in... (cached) no
checking for objdir... .libs
checking for /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc option to produce PIC...  -fPIC -DPIC
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc PIC flag  -fPIC -DPIC works... (cached) yes
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc static flag -static works... (cached) yes
finding the maximum length of command line arguments... (cached) 49153
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc supports -c -o file.o... (cached) yes
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc supports -fno-rtti -fno-exceptions ... no
checking whether the linker (/OE/build/tmp/cross/arm-linux/bin/ld) supports shared libraries... yes
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking command to parse /OE/build/tmp/cross/arm-linux/bin/nm output... failed
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
creating libtool
updating cache ./config.cache
configure: loading cache ./config.cache
checking how to run the C++ preprocessor...  /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc -shared-libgcc -B/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/ -nostdinc++ -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src -L/OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/arm-linux/libstdc++-v3/src/.libs -B/OE/build/tmp/cross/arm-linux/bin/ -B/OE/build/tmp/cross/arm-linux/lib/ -isystem /OE/build/tmp/cross/arm-linux/include -isystem /OE/build/tmp/cross/arm-linux/sys-include -E
loading cache ./config.cache within ltconfig
checking host system type... arm-unknown-linux-gnu
checking build system type... i686-pc-linux-gnu
checking for objdir... .libs
checking for /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc option to produce PIC... -fPIC -DPIC
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc PIC flag -fPIC -DPIC works... yes
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc static flag -static works... yes
finding the maximum length of command line arguments... (cached) 49153
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc supports -c -o file.o... (cached) yes
checking if /OE/build/tmp/work/gcc-cross-3.4.4-r4/gcc-3.4.4/build.i686-linux.arm-linux/gcc/xgcc supports -fno-rtti -fno-exceptions ... yes
checking whether the linker (/OE/build/tmp/cross/arm-linux/bin/ld) supports shared libraries... 
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking command to parse /OE/build/tmp/cross/arm-linux/bin/nm output... failed
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
appending configuration tag "CXX" to libtool
checking for exception model to use... sjlj
checking for enabled PCH... yes
checking for compiler with PCH support... yes
checking for underlying I/O to use... stdio
checking how to run the C preprocessor... gcc -E
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
checking for C locale to use... generic
checking for std::allocator base class to use... new
configure: "C" header strategy set to c_std
checking for ISO C99 support in <math.h>... yes
checking for ISO C99 support in <stdio.h>... yes
checking for lldiv_t declaration... yes
checking for ISO C99 support in <stdlib.h>... yes
checking for additional ISO C99 support in <wchar.h>... yes
checking for enabled ISO C99 support... yes
checking for thread model used by GCC... posix
configure: Debug build flags set to -g3 -O0
checking for additional debug build... no
checking for extra compiler flags for building... 
configure: WARNING: No native atomic operations are provided for this platform.
configure: WARNING: They will be faked using a mutex.
configure: WARNING: Performance of certain classes will degrade as a result.
checking nan.h usability... no
checking nan.h presence... no
checking for nan.h... no
checking ieeefp.h usability... no
checking ieeefp.h presence... no
checking for ieeefp.h... no
checking endian.h usability... yes
checking endian.h presence... yes
checking for endian.h... yes
checking sys/isa_defs.h usability... no
checking sys/isa_defs.h presence... no
checking for sys/isa_defs.h... no
checking machine/endian.h usability... no
checking machine/endian.h presence... no
checking for machine/endian.h... no
checking machine/param.h usability... no
checking machine/param.h presence... no
checking for machine/param.h... no
checking sys/machine.h usability... no
checking sys/machine.h presence... no
checking for sys/machine.h... no
checking for sys/types.h... (cached) yes
checking fp.h usability... no
checking fp.h presence... no
checking for fp.h... no
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking for endian.h... (cached) yes
checking for inttypes.h... (cached) yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking for float.h... (cached) yes
checking for stdint.h... (cached) yes
checking for main in -lm... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
make: *** [configure-target-libstdc++-v3] Error 1
FATAL: oe_runmake failed

--PEIAKu/WMn1b1Hv9--
