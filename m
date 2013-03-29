Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULemp-0007LL-Rv
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:16:28 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so312657dad.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:subject:message-id:date:to
	:mime-version:x-mailer;
	bh=4XdJ490SZsEEfZ8xa2inIKiwgdmJw+VL2rB27yEXjFc=;
	b=0XkUIi0ErES0y9h3dvsaIOmCtyrhf5rQZKqYH9VMSChOf//S2xh2wj7FvlVdHvIV1t
	MpVWJXKPfU9F0RUV6NZce7DnVqsBGsNCdjTsxTIv+mayFqaJhhYkRDKJ94K4iysQf4Ue
	mTMvVcTS+jdB43C+F4lmslzaZgUzcXkGtWvh9TSL7rsrYvm2Ferbd6HjlYyT9BqAFc6Q
	jiLmd28f9iA6ymc+qmIoYHsbfSDsqzghF55wYPoDLCjHSJitAMkwHLKP908Dtej/9ed6
	hbhRpdohi3KUsSStbMP5JGOSQ3bYmorID3u+eE05Oz9X33ZHH2XNvwTgEl7jZNdSYhnJ
	OApg==
X-Received: by 10.68.91.66 with SMTP id cc2mr5371754pbb.51.1364583562446;
	Fri, 29 Mar 2013 11:59:22 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id t5sm3747983pbi.10.2013.03.29.11.59.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 11:59:21 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <6E712F28-A9BB-4BA6-B2AF-37FC86A9CD67@gmail.com>
Date: Fri, 29 Mar 2013 22:59:15 +0400
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: microblazeel-nf: binutils-cross_2.23.1.bb, do_configure: ERROR: oe_runconf failed
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
X-List-Received-Date: Fri, 29 Mar 2013 19:16:28 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I'm trying to build gcc-4.8 from openembeded-core-contrib, and I =
get an error while trying to configure binutils-cross.=20

It seems to happen at

configure:2331: checking target system type
configure:2340: error: /bin/sh =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/config.sub microblazeel-poky-linux failed

What should I do to fix this error?

I've pasted the contents of the entire configure log below.

DEBUG: Executing python function sysroot_cleansstate
DEBUG: Python function sysroot_cleansstate finished
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', =
'bit-64', 'x86_64-linux', 'common']
DEBUG: Executing shell function autotools_preconfigure
DEBUG: Shell function autotools_preconfigure finished
DEBUG: Executing shell function do_configure
configure.ac:33: error: Please use exactly Autoconf 2.64 instead of =
2.69.
config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is expanded from...
configure.ac:33: the top level
autom4te: m4 failed with exit status: 1
NOTE: Running =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/configure  --build=3Dx86_64-linux 		 =
 --host=3Dx86_64-linux 		  --target=3Dmicroblazeel-poky-linux 		=
  --prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr 		=
  --exec_prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr 		=
  =
--bindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microb=
lazeel-nf-poky-linux 		  =
--sbindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/micro=
blazeel-nf-poky-linux 		  =
--libexecdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexe=
c/microblazeel-nf-poky-linux 		  =
--datadir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share 		=
  --sysconfdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/etc 		=
  --sharedstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/com =
		  =
--localstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/var 		=
  =
--libdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/microb=
lazeel-nf-poky-linux 		  =
--includedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/includ=
e 		  =
--oldincludedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/inc=
lude 		  =
--infodir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/inf=
o 		  =
--mandir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/man =
		  --disable-silent-rules 		  =
--disable-dependency-tracking 		  =
--with-libtool-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux =
--program-prefix=3Dmicroblazeel-poky-linux-                 =
--disable-werror 		--enable-plugins 		         =
        --enable-64-bit-bfd =
--with-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/spartan-6-sp601-micro=
blazeel-softfloat                 --disable-install-libbfd               =
  --enable-poison-system-directories                  --disable-nls=20
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... Invalid configuration =
`microblazeel-poky-linux': machine `microblazeel-poky' not recognized
configure: error: /bin/sh =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/config.sub microblazeel-poky-linux failed
Configure failed. The contents of all config.log files follows to aid =
debugging
=
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/build.x86_64-linux.microblazeel-poky-linux/confi=
g.log
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by configure, which was
generated by GNU Autoconf 2.64.  Invocation command line was

  $ =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/configure --build=3Dx86_64-linux =
--host=3Dx86_64-linux --target=3Dmicroblazeel-poky-linux =
--prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr =
--exec_prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr =
--bindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microb=
lazeel-nf-poky-linux =
--sbindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/micro=
blazeel-nf-poky-linux =
--libexecdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexe=
c/microblazeel-nf-poky-linux =
--datadir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share =
--sysconfdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/etc =
--sharedstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/com =
--localstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/var =
--libdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/microb=
lazeel-nf-poky-linux =
--includedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/includ=
e =
--oldincludedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/inc=
lude =
--infodir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/inf=
o =
--mandir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/man =
--disable-silent-rules --disable-dependency-tracking =
--with-libtool-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux =
--program-prefix=3Dmicroblazeel-poky-linux- --disable-werror =
--enable-plugins --enable-64-bit-bfd =
--with-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/spartan-6-sp601-micro=
blazeel-softfloat --disable-install-libbfd =
--enable-poison-system-directories --disable-nls

## --------- ##
## Platform. ##
## --------- ##

hostname =3D titan
uname -m =3D x86_64
uname -r =3D 3.5.0-26-generic
uname -s =3D Linux
uname -v =3D #42-Ubuntu SMP Fri Mar 8 23:18:20 UTC 2013

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /tool/yocto/poky/scripts
PATH: =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-nf-p=
oky-linux
PATH: =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/tool/yocto/poky/build/tmp=
/sysroots/x86_64-linux/usr/bin/microblazeel-nf-poky-linux/crossscripts
PATH: /tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/sbin
PATH: /tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin
PATH: /tool/yocto/poky/build/tmp/sysroots/x86_64-linux/sbin
PATH: /tool/yocto/poky/build/tmp/sysroots/x86_64-linux//bin
PATH: /tool/yocto/poky/scripts
PATH: /tool/yocto/poky/bitbake/bin/
PATH: /usr/lib/lightdm/lightdm
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games
PATH: /usr/local/games
PATH: /tool/bluespec/bin
PATH: =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-p=
oky-linux-gnueabi
PATH: /project/u-boot-xilinx-arm/tools
PATH: /project/linux-xilinx/arch/arm/boot
PATH: /tool/script


## ----------- ##
## Core tests. ##
## ----------- ##

configure:2237: checking build system type
configure:2251: result: x86_64-pc-linux-gnu
configure:2298: checking host system type
configure:2311: result: x86_64-pc-linux-gnu
configure:2331: checking target system type
configure:2340: error: /bin/sh =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/binutils-2.23.1/config.sub microblazeel-poky-linux failed

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_build=3Dx86_64-pc-linux-gnu
ac_cv_env_AR_FOR_TARGET_set=3Dset
ac_cv_env_AR_FOR_TARGET_value=3Dmicroblazeel-poky-linux-ar
ac_cv_env_AR_set=3Dset
ac_cv_env_AR_value=3Dar
ac_cv_env_AS_FOR_TARGET_set=3Dset
ac_cv_env_AS_FOR_TARGET_value=3Dmicroblazeel-poky-linux-as
ac_cv_env_AS_set=3Dset
ac_cv_env_AS_value=3Das
ac_cv_env_CCC_set=3D
ac_cv_env_CCC_value=3D
ac_cv_env_CC_FOR_TARGET_set=3D
ac_cv_env_CC_FOR_TARGET_value=3D
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3Dgcc
ac_cv_env_CFLAGS_set=3Dset
=
ac_cv_env_CFLAGS_value=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe'
ac_cv_env_CPPFLAGS_set=3Dset
=
ac_cv_env_CPPFLAGS_value=3D-isystem/tool/yocto/poky/build/tmp/sysroots/x86=
_64-linux/usr/include
ac_cv_env_CXXFLAGS_set=3Dset
=
ac_cv_env_CXXFLAGS_value=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe'
ac_cv_env_CXX_FOR_TARGET_set=3D
ac_cv_env_CXX_FOR_TARGET_value=3D
ac_cv_env_CXX_set=3Dset
ac_cv_env_CXX_value=3Dg++
ac_cv_env_DLLTOOL_FOR_TARGET_set=3D
ac_cv_env_DLLTOOL_FOR_TARGET_value=3D
ac_cv_env_DLLTOOL_set=3D
ac_cv_env_DLLTOOL_value=3D
ac_cv_env_GCC_FOR_TARGET_set=3D
ac_cv_env_GCC_FOR_TARGET_value=3D
ac_cv_env_GCJ_FOR_TARGET_set=3D
ac_cv_env_GCJ_FOR_TARGET_value=3D
ac_cv_env_GFORTRAN_FOR_TARGET_set=3D
ac_cv_env_GFORTRAN_FOR_TARGET_value=3D
ac_cv_env_GOC_FOR_TARGET_set=3D
ac_cv_env_GOC_FOR_TARGET_value=3D
ac_cv_env_LDFLAGS_set=3Dset
=
ac_cv_env_LDFLAGS_value=3D'-L/tool/yocto/poky/build/tmp/sysroots/x86_64-li=
nux/usr/lib -L/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
ac_cv_env_LD_FOR_TARGET_set=3Dset
ac_cv_env_LD_FOR_TARGET_value=3Dmicroblazeel-poky-linux-ld
ac_cv_env_LD_set=3Dset
ac_cv_env_LD_value=3Dld
ac_cv_env_LIBS_set=3D
ac_cv_env_LIBS_value=3D
ac_cv_env_LIPO_FOR_TARGET_set=3D
ac_cv_env_LIPO_FOR_TARGET_value=3D
ac_cv_env_LIPO_set=3D
ac_cv_env_LIPO_value=3D
ac_cv_env_NM_FOR_TARGET_set=3Dset
ac_cv_env_NM_FOR_TARGET_value=3Dmicroblazeel-poky-linux-nm
ac_cv_env_NM_set=3Dset
ac_cv_env_NM_value=3Dnm
ac_cv_env_OBJCOPY_set=3Dset
ac_cv_env_OBJCOPY_value=3Dobjcopy
ac_cv_env_OBJDUMP_FOR_TARGET_set=3D
ac_cv_env_OBJDUMP_FOR_TARGET_value=3D
ac_cv_env_OBJDUMP_set=3Dset
ac_cv_env_OBJDUMP_value=3Dobjdump
ac_cv_env_RANLIB_FOR_TARGET_set=3Dset
ac_cv_env_RANLIB_FOR_TARGET_value=3Dmicroblazeel-poky-linux-ranlib
ac_cv_env_RANLIB_set=3Dset
ac_cv_env_RANLIB_value=3Dranlib
ac_cv_env_READELF_FOR_TARGET_set=3D
ac_cv_env_READELF_FOR_TARGET_value=3D
ac_cv_env_READELF_set=3D
ac_cv_env_READELF_value=3D
ac_cv_env_STRIP_FOR_TARGET_set=3D
ac_cv_env_STRIP_FOR_TARGET_value=3D
ac_cv_env_STRIP_set=3Dset
ac_cv_env_STRIP_value=3Dstrip
ac_cv_env_WINDMC_FOR_TARGET_set=3D
ac_cv_env_WINDMC_FOR_TARGET_value=3D
ac_cv_env_WINDMC_set=3D
ac_cv_env_WINDMC_value=3D
ac_cv_env_WINDRES_FOR_TARGET_set=3D
ac_cv_env_WINDRES_FOR_TARGET_value=3D
ac_cv_env_WINDRES_set=3D
ac_cv_env_WINDRES_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Dx86_64-linux
ac_cv_env_build_configargs_set=3D
ac_cv_env_build_configargs_value=3D
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Dx86_64-linux
ac_cv_env_host_configargs_set=3D
ac_cv_env_host_configargs_value=3D
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Dmicroblazeel-poky-linux
ac_cv_env_target_configargs_set=3D
ac_cv_env_target_configargs_value=3D
ac_cv_host=3Dx86_64-pc-linux-gnu
ac_cv_target=3D
=
lt_cv_sys_lib_dlsearch_path_spec=3D'/tool/yocto/poky/build/tmp/sysroots/x8=
6_64-linux/usr/lib/microblazeel-nf-poky-linux =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib'

## ----------------- ##
## Output variables. ##
## ----------------- ##

AR=3D'ar'
AR_FOR_BUILD=3D''
AR_FOR_TARGET=3D'microblazeel-poky-linux-ar'
AS=3D'as'
AS_FOR_BUILD=3D''
AS_FOR_TARGET=3D'microblazeel-poky-linux-as'
AWK=3D''
BISON=3D''
BUILD_CONFIG=3D''
CC=3D'gcc'
CC_FOR_BUILD=3D'LD_LIBRARY_PATH=3D gcc'
CC_FOR_TARGET=3D''
=
CFLAGS=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -pipe'
=
CFLAGS_FOR_BUILD=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include -O2 -pipe'
CFLAGS_FOR_TARGET=3D''
COMPILER_AS_FOR_TARGET=3D''
COMPILER_LD_FOR_TARGET=3D''
COMPILER_NM_FOR_TARGET=3D''
CONFIGURE_GDB_TK=3D''
=
CPPFLAGS=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/i=
nclude'
CXX=3D'g++'
=
CXXFLAGS=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -pipe'
=
CXXFLAGS_FOR_BUILD=3D'-isystem/tool/yocto/poky/build/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -fpermissive'
CXXFLAGS_FOR_TARGET=3D''
CXX_FOR_BUILD=3D'g++'
CXX_FOR_TARGET=3D''
DEBUG_PREFIX_CFLAGS_FOR_TARGET=3D''
DEFS=3D''
DLLTOOL=3D''
DLLTOOL_FOR_BUILD=3D''
DLLTOOL_FOR_TARGET=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EXEEXT=3D''
EXPECT=3D''
EXTRA_CONFIGARGS_LIBJAVA=3D''
FLAGS_FOR_TARGET=3D''
FLEX=3D''
GCC_FOR_TARGET=3D''
GCC_SHLIB_SUBDIR=3D''
GCJ_FOR_BUILD=3D''
GCJ_FOR_TARGET=3D''
GDB_TK=3D''
GFORTRAN_FOR_BUILD=3D''
GFORTRAN_FOR_TARGET=3D''
GNATBIND=3D''
GNATMAKE=3D''
GOC_FOR_BUILD=3D''
GOC_FOR_TARGET=3D''
INSTALL_DATA=3D''
INSTALL_GDB_TK=3D''
INSTALL_PROGRAM=3D''
INSTALL_SCRIPT=3D''
LD=3D'ld'
LDFLAGS=3D'-L/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-L/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
=
LDFLAGS_FOR_BUILD=3D'-L/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/us=
r/lib -L/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath-link,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib =
-Wl,-rpath,/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
LDFLAGS_FOR_TARGET=3D''
LD_FOR_BUILD=3D'ld'
LD_FOR_TARGET=3D'microblazeel-poky-linux-ld'
LEX=3D''
LIBOBJS=3D''
LIBS=3D''
LIPO=3D''
LIPO_FOR_TARGET=3D''
LN=3D''
LN_S=3D''
LTLIBOBJS=3D''
M4=3D''
MAINT=3D''
MAINTAINER_MODE_FALSE=3D''
MAINTAINER_MODE_TRUE=3D''
MAKEINFO=3D''
NM=3D'nm'
NM_FOR_BUILD=3D''
NM_FOR_TARGET=3D'microblazeel-poky-linux-nm'
OBJCOPY=3D'objcopy'
OBJDUMP=3D'objdump'
OBJDUMP_FOR_TARGET=3D''
OBJEXT=3D''
PACKAGE_BUGREPORT=3D''
PACKAGE_NAME=3D''
PACKAGE_STRING=3D''
PACKAGE_TARNAME=3D''
PACKAGE_URL=3D''
PACKAGE_VERSION=3D''
PATH_SEPARATOR=3D':'
POSTSTAGE1_CONFIGURE_FLAGS=3D''
RANLIB=3D'ranlib'
RANLIB_FOR_BUILD=3D''
RANLIB_FOR_TARGET=3D'microblazeel-poky-linux-ranlib'
RAW_CXX_FOR_TARGET=3D''
READELF=3D''
READELF_FOR_TARGET=3D''
RPATH_ENVVAR=3D''
RUNTEST=3D''
SED=3D''
SHELL=3D'/bin/sh'
STRIP=3D'strip'
STRIP_FOR_TARGET=3D''
SYSROOT_CFLAGS_FOR_TARGET=3D''
=
TOPLEVEL_CONFIGURE_ARGUMENTS=3D'/tool/yocto/poky/build/tmp/work/microblaze=
el-nf-poky-linux/binutils-cross/2.23.1-r3/binutils-2.23.1/configure =
--build=3Dx86_64-linux --host=3Dx86_64-linux =
--target=3Dmicroblazeel-poky-linux =
--prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr =
--exec_prefix=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr =
--bindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microb=
lazeel-nf-poky-linux =
--sbindir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/micro=
blazeel-nf-poky-linux =
--libexecdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexe=
c/microblazeel-nf-poky-linux =
--datadir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share =
--sysconfdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/etc =
--sharedstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/com =
--localstatedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/var =
--libdir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/microb=
lazeel-nf-poky-linux =
--includedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/includ=
e =
--oldincludedir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/inc=
lude =
--infodir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/inf=
o =
--mandir=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/man =
--disable-silent-rules --disable-dependency-tracking =
--with-libtool-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/x86_64-linux =
--program-prefix=3Dmicroblazeel-poky-linux- --disable-werror =
--enable-plugins --enable-64-bit-bfd =
--with-sysroot=3D/tool/yocto/poky/build/tmp/sysroots/spartan-6-sp601-micro=
blazeel-softfloat --disable-install-libbfd =
--enable-poison-system-directories --disable-nls'
WINDMC=3D''
WINDMC_FOR_BUILD=3D''
WINDMC_FOR_TARGET=3D''
WINDRES=3D''
WINDRES_FOR_BUILD=3D''
WINDRES_FOR_TARGET=3D''
YACC=3D''
ac_ct_CC=3D''
ac_ct_CXX=3D''
=
bindir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microbl=
azeel-nf-poky-linux'
build=3D'x86_64-pc-linux-gnu'
build_alias=3D'x86_64-linux'
build_configargs=3D''
build_configdirs=3D''
build_cpu=3D'x86_64'
build_libsubdir=3D''
build_noncanonical=3D'x86_64-linux'
build_os=3D'linux-gnu'
build_subdir=3D''
build_tooldir=3D''
build_vendor=3D'pc'
clooginc=3D''
clooglibs=3D''
compare_exclusions=3D''
configdirs=3D''
datadir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share'
datarootdir=3D'${prefix}/share'
do_compare=3D''
docdir=3D'${datarootdir}/doc/${PACKAGE}'
dvidir=3D'${docdir}'
exec_prefix=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr'
extra_host_libiberty_configure_flags=3D''
extra_mpc_gmp_configure_flags=3D''
extra_mpc_mpfr_configure_flags=3D''
extra_mpfr_configure_flags=3D''
gmpinc=3D''
gmplibs=3D''
host=3D'x86_64-pc-linux-gnu'
host_alias=3D'x86_64-linux'
host_configargs=3D''
host_cpu=3D'x86_64'
host_noncanonical=3D'x86_64-linux'
host_os=3D'linux-gnu'
host_subdir=3D''
host_vendor=3D'pc'
htmldir=3D'${docdir}'
=
includedir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/include=
'
=
infodir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/info=
'
=
libdir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/lib/microbl=
azeel-nf-poky-linux'
=
libexecdir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexec=
/microblazeel-nf-poky-linux'
localedir=3D'${datarootdir}/locale'
localstatedir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/var'
mandir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/share/man'
=
oldincludedir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/incl=
ude'
pdfdir=3D'${docdir}'
poststage1_ldflags=3D''
poststage1_libs=3D''
pplinc=3D''
ppllibs=3D''
prefix=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
=
sbindir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microb=
lazeel-nf-poky-linux'
sharedstatedir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/com'
stage1_cflags=3D''
stage1_checking=3D''
stage1_languages=3D''
stage1_ldflags=3D''
stage1_libs=3D''
stage2_werror_flag=3D''
sysconfdir=3D'/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/etc'
target=3D'microblazeel-poky-linux'
target_alias=3D'microblazeel-poky-linux'
target_configargs=3D''
target_configdirs=3D''
target_cpu=3D''
target_noncanonical=3D'microblazeel-poky-linux'
target_os=3D''
target_subdir=3D''
target_vendor=3D''
tooldir=3D''

## ------------------- ##
## File substitutions. ##
## ------------------- ##

alphaieee_frag=3D''
host_makefile_frag=3D''
ospace_frag=3D''
serialization_dependencies=3D''
target_makefile_frag=3D''

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#define PACKAGE_STRING ""
#define PACKAGE_BUGREPORT ""
#define PACKAGE_URL ""

configure: exit 1
ERROR: oe_runconf failed
ERROR: Function failed: do_configure (see =
/tool/yocto/poky/build/tmp/work/microblazeel-nf-poky-linux/binutils-cross/=
2.23.1-r3/temp/log.do_configure.19373 for further information)

Best regards,

Elvis Dowson=

