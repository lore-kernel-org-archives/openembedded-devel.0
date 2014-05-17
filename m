Return-Path: <elvis.dowson@gmail.com>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 May 2014 07:00:05 UTC
Received: from mail-ee0-f44.google.com (unknown [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3F165F09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 07:00:05 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c41so2033462eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=iKeOr7YhT/RdY0Ddgcyh9wGQ3ael5bcB1TetTNoR2RU=;
	b=KexmJFtQXAkMkvNR/KR+iblIEAqos3n4TG0MumzhanL60t+qR/OTtsDSnWsqrKl8zK
	A8kWZXlM7syjTud69j7fOA5zNbJGBznqkfQA1PKJ1axynbaATgz45zw5O+/r/RaM+lki
	2+nnJrMMs+/dWiz36SPe8ENcdbOSSkMCqWOZXt/XqKZ8vXb9H/eYpmqfKoTo+u79YRbx
	uxAEEwTN+oPru953+KBu1M98n+F1IpeZeFeJbl/fq5foRDtDYf5htov1XNHD1+lHFKv0
	TZ1/yJdehpV4ppduOhM1kAyEDt/z3gBqzMveZVu8p25S6nUoxOncm3/QjHCUniNu+y6s
	J+aA==
X-Received: by 10.14.224.196 with SMTP id x44mr403133eep.111.1400309698537;
	Fri, 16 May 2014 23:54:58 -0700 (PDT)
Received: from [192.168.1.104] ([94.205.109.98])
	by mx.google.com with ESMTPSA id a4sm25380341eep.12.2014.05.16.23.54.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 May 2014 23:54:57 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <5359BE55-EEBA-4942-883D-63D85D335F8F@gmail.com>
Date: Sat, 17 May 2014 10:54:50 +0400
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.2\))
X-Mailer: Apple Mail (2.1878.2)
Subject: [poky]: libusb1_1.0.18.bb: configure: error: "udev support requested but libudev not installed"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 May 2014 07:00:09 -0000
X-Groupsio-MsgNum: 49956
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E872F1ED-20AE-46F9-857A-F4EF1FF63550";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_E872F1ED-20AE-46F9-857A-F4EF1FF63550
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Hi,

The following commit in poky/oe-core master branch, causes a build error =
due to libusb1_1.0.18.bb:=20

configure: error: "udev support requested but libudev not installed=94

commit: =
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D67448158c7ef03=
119a5065bc62cf90e886f5c564

Reverting this commit allows the build to proceed.

Here is the full log:

Build Configuration:
BB_VERSION        =3D "1.23.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.10"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "zc706-zynq7"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.6+snapshot-20140517"
TUNE_FEATURES     =3D " arm armv7a vfp neon zynq"
TARGET_FPU        =3D "vfp-neon"
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "master:874d81a5ebb6395b0d65d0082471287e522d0c47"
meta-xilinx       =3D "master:869cba51d3db7909077ad0f066b784ebfd3b092d"
meta-xilinx-community =3D =
"master:b93b7ccfa7bddbe7f5fb280e24b7ddccd78c09ff"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at =
/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libusb=
1/1.0.18-r0/temp/log.do_configure.13881)
ERROR: Logfile of failure stored in: =
/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libusb=
1/1.0.18-r0/temp/log.do_configure.13881
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', =
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', =
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.14.1
| Copyright (C) 2013 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later =
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|=20
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.14
| NOTE: Executing ACLOCAL=3D"aclocal =
--system-acdir=3D/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-lin=
ux-gnueabi/libusb1/1.0.18-r0/build/aclocal-copy/ =
--automake-acdir=3D/tool/yocto/build/zc706/tmp/sysroots/x86_64-linux/usr/s=
hare/aclocal-1.14" autoreconf --verbose --install --force =
--exclude=3Dautopoint
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal =
--system-acdir=3D/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-lin=
ux-gnueabi/libusb1/1.0.18-r0/build/aclocal-copy/ =
--automake-acdir=3D/tool/yocto/build/zc706/tmp/sysroots/x86_64-linux/usr/s=
hare/aclocal-1.14 --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
| libtoolize: copying file `m4/libtool.m4'
| libtoolize: copying file `m4/ltoptions.m4'
| libtoolize: copying file `m4/ltsugar.m4'
| libtoolize: copying file `m4/ltversion.m4'
| libtoolize: copying file `m4/lt~obsolete.m4'
| autoreconf: running: =
/tool/yocto/build/zc706/tmp/sysroots/x86_64-linux/usr/bin/autoconf =
--force
| autoreconf: running: =
/tool/yocto/build/zc706/tmp/sysroots/x86_64-linux/usr/bin/autoheader =
--force
| autoreconf: running: automake --foreign --add-missing --copy =
--force-missing
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running =
/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libusb=
1/1.0.18-r0/libusb-1.0.18/configure  --build=3Dx86_64-linux 		 =
 --host=3Darm-poky-linux-gnueabi 		  =
--target=3Darm-poky-linux-gnueabi 		  --prefix=3D/usr 		=
  --exec_prefix=3D/usr 		  --bindir=3D/usr/bin 		  =
--sbindir=3D/usr/sbin 		  --libexecdir=3D/usr/lib/libusb1 		=
  --datadir=3D/usr/share 		  --sysconfdir=3D/etc 		 =
 --sharedstatedir=3D/com 		  --localstatedir=3D/var 		=
  --libdir=3D/usr/lib 		  --includedir=3D/usr/include 		 =
 --oldincludedir=3D/usr/include 		  =
--infodir=3D/usr/share/info 		  --mandir=3D/usr/share/man 		=
  --disable-silent-rules 		  --disable-dependency-tracking 	=
  =
--with-libtool-sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 =
--libdir=3D/lib
| configure: loading site script =
/tool/yocto/poky/meta/site/endian-little
| configure: loading site script /tool/yocto/poky/meta/site/arm-common
| configure: loading site script /tool/yocto/poky/meta/site/common-linux
| configure: loading site script /tool/yocto/poky/meta/site/common-glibc
| configure: loading site script /tool/yocto/poky/meta/site/arm-linux
| configure: loading site script /tool/yocto/poky/meta/site/common
| configure: loading site script =
/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7/usr/share/arm-poky-linux-=
gnueabi_config_site.d/eglibc_config
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for arm-poky-linux-gnueabi-strip... =
arm-poky-linux-gnueabi-strip
| checking for a thread-safe mkdir -p... /bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of =
Makefiles... no
| checking whether make supports nested variables... (cached) yes
| checking for arm-poky-linux-gnueabi-gcc... arm-poky-linux-gnueabi-gcc  =
-march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 accepts =
-g... yes
| checking for arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 option to =
accept ISO C89... none needed
| checking whether arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 understands =
-c and -o together... yes
| checking for style of include used by make... GNU
| checking dependency style of arm-poky-linux-gnueabi-gcc  =
-march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-poky-linux-gnueabi
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /bin/grep
| checking for egrep... /bin/grep -E
| checking for fgrep... /bin/grep -F
| checking for ld used by arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7... =
arm-poky-linux-gnueabi-ld =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7
| checking if the linker (arm-poky-linux-gnueabi-ld =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 ) is GNU =
ld... yes
| checking for BSD- or MS-compatible name lister (nm)... =
arm-poky-linux-gnueabi-nm
| checking the name lister (arm-poky-linux-gnueabi-nm) interface... BSD =
nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking whether the shell understands some XSI constructs... yes
| checking whether the shell understands "+=3D"... yes
| checking how to convert x86_64-pc-linux-gnu file names to =
arm-poky-linux-gnueabi format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain =
format... func_convert_file_noop
| checking for arm-poky-linux-gnueabi-ld =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7  option to =
reload object files... -r
| checking for arm-poky-linux-gnueabi-objdump... =
arm-poky-linux-gnueabi-objdump
| checking how to recognize dependent libraries... pass_all
| checking for arm-poky-linux-gnueabi-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for arm-poky-linux-gnueabi-ar... arm-poky-linux-gnueabi-ar
| checking for archiver @FILE support... @
| checking for arm-poky-linux-gnueabi-strip... (cached) =
arm-poky-linux-gnueabi-strip
| checking for arm-poky-linux-gnueabi-ranlib... =
arm-poky-linux-gnueabi-ranlib
| checking command to parse arm-poky-linux-gnueabi-nm output from =
arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb-interwork =
-mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 object... =
ok
| checking for sysroot... =
/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7
| checking for arm-poky-linux-gnueabi-mt... no
| checking for mt... mt
| configure: WARNING: using cross tools not prefixed with host triplet
| checking if mt is a manifest tool... no
| checking how to run the C preprocessor... arm-poky-linux-gnueabi-gcc =
-E --sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7  =
-march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
| checking for ANSI C header files... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for memory.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... (cached) yes
| checking for objdir... .libs
| checking if arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 supports =
-fno-rtti -fno-exceptions... no
| checking for arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 option to =
produce PIC... -fPIC -DPIC
| checking if arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 PIC flag =
-fPIC -DPIC works... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 static flag =
-static works... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 supports -c =
-o file.o... yes
| checking if arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 supports -c =
-o file.o... (cached) yes
| checking whether the arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a =
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 linker =
(arm-poky-linux-gnueabi-ld =
--sysroot=3D/tool/yocto/build/zc706/tmp/sysroots/zc706-zynq7 ) supports =
shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... yes
| checking for arm-poky-linux-gnueabi-windres... no
| checking for windres... no
| checking for inline... inline
| checking operating system... Linux
| checking for library containing clock_gettime... none required
| checking libudev.h usability... no
| checking libudev.h presence... no
| checking for libudev.h... no
| configure: error: "udev support requested but libudev not installed"
| Configure failed. The contents of all config.log files follows to aid =
debugging
| ERROR: oe_runconf failed
| WARNING: =
/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libusb=
1/1.0.18-r0/temp/run.do_configure.13881:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at =
/tool/yocto/build/zc706/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/libusb=
1/1.0.18-r0/temp/log.do_configure.13881)
ERROR: Task 1382 =
(/tool/yocto/poky/meta/recipes-support/libusb/libusb1_1.0.18.bb, =
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1361 tasks of which 4 didn't need to be =
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /tool/yocto/poky/meta/recipes-support/libusb/libusb1_1.0.18.bb, =
do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.


Regards,

Elvis Dowson

--Apple-Mail=_E872F1ED-20AE-46F9-857A-F4EF1FF63550
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQQcBAEBCgAGBQJTdwe6AAoJENajI+UwiZtEG5sf/27kEmWhckY6augn7QIZ4yfd
2NdY4BM+B+eGDY0dwoi3jf4cGS7LcBX0n+Nf9TkaV8lCdnV8TSC5JclOYfiyv3Ss
6+JHmdfYI/V2joEBPftIr+wQ/TfcqOmxLfu5dT5d/ntdEqYzlwPxygOdCsguX1v6
2inEjvjQqgsA8hgEHYHA2LTwWj468yrJqMLWUaYg6VdCdb5e6BfPKc6/hbpaLnNg
ar/1HH1k8AblwHlu16D3BhVLXQ4XjEyBHjpXsr32EWHgWXRv8niCkf2GL9CNL0MI
0Ayd0xvHeAYUy9DVM2aZtYxRG2lgoLcx1rF+2ljlac1oBa6X+Ii+Rn/fqzneeBW3
c2COcmFL+vvDY05gRzVdvjSTNTmNXgaTldtiglEO4uKaqcxh5jdWZ0yTwqJ4hzek
qqM8W/hSqLZLprXLt6DuqvzEN5POVHjMqbMndqbf69rNbynA+RRX6sYPA2Xa+MeZ
AY95VvAzAiSufkjjYL5Mk4qAzekoj00ItQyucsG7RlRnmuFkGaa3IiPiGz6N9Las
378qo+9yZMUWALmBrnqeconmeIFFroDZmT6aNfZ89XOnWJJcKIXl+guNIowr0OaN
md7s9lIjkihX93c3nIR3EEdNsH+B2U5IoOIcCQE78OEvlI6UOVVkNu/4/MJqTdLK
mBSApuUL0ISbdpOwSr+nALfdaPze298Z0Qs+T8pn4OxHBV0UgogXAFDJ4YndA1XG
dPV06BvoP0r92eNRUZL+7nwpEi3UhNHTP4ukfTXlK8XcBeSfeI8nXgdmW/RWSBsu
pd3yOH7O6vTkaMgQdlFxEaplHLwAmeJDsn/z91BIA/MC9myvQweCQz85Z7IC3wTe
YuXh7kiCaqFOhlifnqhNI+oFmG2K4KGbTfUPr/qUCWC5Ge0Vthvc5rsX/uha+KUc
VJKtGNbBePgqXPCTo2K7gVGzTOi9pvjqr+cpsF7mx//w8v0cZuFeTpPFb6n0ZUrt
qVhuS8K81WxYqnpyjpeDdkTNVQlSHkkFThTdYTixKzdYVsj3E/UG3Y3EdwLX4DuI
pfEUyw5ldZk4bEYIYb8kPK1x6g4WbFT5CBrMHpAwPUtnesx/Yp+kK5ilbS4xDwQv
M9a9kUin1jIcq7G1OZk5fSu04zHWRp96bktBvCSZ7YatuU5emzbR6yaCBrOotD19
vJ8UmMLlz3H0uCN0dO6fUNGF0ngdQzpqOEBuNklZXE4mhjA6z+hlFK1cVgDC2SNu
1Ro89sLmgazFg7AA6momfTQbHDmS4h8or9IdqMxw/NQxzBsCvh2DZJ279YJG9KIR
iGZlM1MF8i888AuB1DDtENYfXsrIYYat0fEWLQEqi+SBkoS8I8zGqrnPYCvoco0=
=CC8e
-----END PGP SIGNATURE-----

--Apple-Mail=_E872F1ED-20AE-46F9-857A-F4EF1FF63550--
