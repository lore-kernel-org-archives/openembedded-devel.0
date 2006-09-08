Received: from [203.110.30.194] (helo=hatchet.fphcare.co.nz)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Craig.Smith@fphcare.co.nz>) id 1GLp2D-00019l-Fe
	for openembedded-devel@openembedded.org; Sat, 09 Sep 2006 00:41:18 +0200
Received: from fphcare.fphcare.co.nz (Not Verified[10.204.0.1]) by
	hatchet.fphcare.co.nz with NetIQ MailMarshal (v5.5.6.7)
	id <B000468862>; Sat, 09 Sep 2006 10:38:19 +1200
Received: from hygeia.fphcare.com (hygeia.fp.co.nz [10.201.10.27])
	by fphcare.fphcare.co.nz (8.11.0/8.11.0) with ESMTP id k88Mit003854
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 9 Sep 2006 10:44:55 +1200
Received: by hygeia.fphcare.com with Internet Mail Service (5.5.2653.19)
	id <Q4G72NFQ>; Sat, 9 Sep 2006 10:35:11 +1200
Message-ID: <EE5127548F9C1544883EB39F5DA061F112DFD0@hennessy.fphcare.com>
From: Craig Smith <Craig.Smith@fphcare.co.nz>
To: openembedded-devel@openembedded.org
Date: Sat, 9 Sep 2006 10:37:29 +1200 
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2653.19)
Subject: compile problem on gentoo amd64 platform.
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
X-List-Received-Date: Fri, 08 Sep 2006 22:41:18 -0000
Content-Type: text/plain

Hi, I'm having a strange problem with qemu when I try to compile openzaurus
(nano, although it doesn't seem to matter which package).  A similar problem
happens both with the 354x and dev branches, I have attached the output from
bitbake.
I'm hoping someone will be able to shed some light on this for me, I have
followed the instructions in the openzaurus wiki as best I can figure.
FYI, I run Gentoo on amd64, and have installed all the required software
listed in the wiki (except Psyco as it is not available for amd64)

The interesting bit seems to be:

/usr/lib/gcc/x86_64-pc-linux-gnu/3.4.6/../../../../x86_64-pc-linux-gnu/bin/l
d:
skipping incompatible /lib64/libz.so when searching for /lib64/libz.so



# bitbake nano
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
to increase performance.
NOTE: Using cache in '/mnt/main/oz/tmp/cache'
NOTE: Handling BitBake files: \ (2636/2636) [100 %]
NOTE: Parsing finished. 0 cached, 2600 parsed, 36 skipped, 0 masked.

NOTE: build 200609090907: started

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "43d7839d96f8198b4422e163810fc8508fc97907"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "akita"
DISTRO         = "openzaurus"
DISTRO_VERSION = "3.5.4.1"
TARGET_FPU     = "soft"

NOTE: package quilt-native-0.39: started
NOTE: package quilt-native-0.39-r0: task do_fetch: started
NOTE: package quilt-native-0.39-r0: task do_fetch: completed
NOTE: package quilt-native-0.39-r0: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/quilt-0.39.tar.gz to
/mnt/main/oz/tmp/work/quilt-native-0.39-r0/
NOTE: package quilt-native-0.39-r0: task do_unpack: completed
NOTE: package quilt-native-0.39-r0: task do_patch: started
NOTE: Applying patch 'install.patch'
NOTE: Applying patch 'nostrip.patch'
NOTE: package quilt-native-0.39-r0: task do_patch: completed
NOTE: package quilt-native-0.39-r0: task do_configure: started
NOTE: package quilt-native-0.39-r0: task do_configure: completed
NOTE: package quilt-native-0.39-r0: task do_compile: started
NOTE: package quilt-native-0.39-r0: task do_compile: completed
NOTE: package quilt-native-0.39-r0: task do_populate_staging: started
NOTE: package quilt-native-0.39-r0: task do_populate_staging: completed
NOTE: package quilt-native-0.39-r0: task do_package: started
NOTE: package quilt-native-0.39-r0: task do_package: completed
NOTE: package quilt-native-0.39-r0: task do_build: started
NOTE: package quilt-native-0.39-r0: task do_build: completed
NOTE: package quilt-native-0.39: completed
NOTE: package gnu-config-native-0.1cvs20050701: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_fetch: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_fetch: completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_unpack: started
NOTE: Unpacking
/mnt/main/oz/sources/config_cvs.savannah.gnu.org__20050701.tar.gz to
/mnt/main/oz/tmp/work/gnu-config-native-0.1cvs20050701-r4/
NOTE: Unpacking
/mnt/main/oz/org.openembedded.oz354x/packages/gnu-config/gnu-config/gnu-conf
igize.in
to /mnt/main/oz/tmp/work/gnu-config-native-0.1cvs20050701-r4/
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_unpack: completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_patch: started
NOTE: Applying patch 'config-guess-uclibc.patch'
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_patch: completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_configure:
started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_configure:
completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_compile: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_compile:
completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task
do_populate_staging: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task
do_populate_staging: completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_package: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_package:
completed
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_build: started
NOTE: package gnu-config-native-0.1cvs20050701-r4: task do_build: completed
NOTE: package gnu-config-native-0.1cvs20050701: completed
NOTE: package m4-native-1.4.2: started
NOTE: package m4-native-1.4.2-r0: task do_fetch: started
NOTE: package m4-native-1.4.2-r0: task do_fetch: completed
NOTE: package m4-native-1.4.2-r0: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/m4-1.4.2.tar.gz to
/mnt/main/oz/tmp/work/m4-native-1.4.2-r0/
NOTE: package m4-native-1.4.2-r0: task do_unpack: completed
NOTE: package m4-native-1.4.2-r0: task do_patch: started
NOTE: Applying patch 'make.patch'
NOTE: package m4-native-1.4.2-r0: task do_patch: completed
NOTE: package m4-native-1.4.2-r0: task do_configure: started
NOTE: package m4-native-1.4.2-r0: task do_configure: completed
NOTE: package m4-native-1.4.2-r0: task do_compile: started
NOTE: package m4-native-1.4.2-r0: task do_compile: completed
NOTE: package m4-native-1.4.2-r0: task do_populate_staging: started
NOTE: package m4-native-1.4.2-r0: task do_populate_staging: completed
NOTE: package m4-native-1.4.2-r0: task do_package: started
NOTE: package m4-native-1.4.2-r0: task do_package: completed
NOTE: package m4-native-1.4.2-r0: task do_build: started
NOTE: package m4-native-1.4.2-r0: task do_build: completed
NOTE: package m4-native-1.4.2: completed
NOTE: package autoconf-native-2.59: started
NOTE: package autoconf-native-2.59-r3: task do_fetch: started
NOTE: package autoconf-native-2.59-r3: task do_fetch: completed
NOTE: package autoconf-native-2.59-r3: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/autoconf-2.59.tar.bz2 to
/mnt/main/oz/tmp/work/autoconf-native-2.59-r3/
NOTE: package autoconf-native-2.59-r3: task do_unpack: completed
NOTE: package autoconf-native-2.59-r3: task do_patch: started
NOTE: Applying patch 'program_prefix.patch'
NOTE: Applying patch 'autoreconf-include.patch'
NOTE: Applying patch 'autoreconf-exclude.patch'
NOTE: Applying patch 'autoreconf-foreign.patch'
NOTE: Applying patch 'autoreconf-gnuconfigize.patch'
NOTE: Applying patch 'autoconf259-update-configscripts.patch'
NOTE: Applying patch 'autoheader-nonfatal-warnings.patch'
NOTE: Applying patch 'sizeof_types.patch'
NOTE: package autoconf-native-2.59-r3: task do_patch: completed
NOTE: package autoconf-native-2.59-r3: task do_configure: started
NOTE: package autoconf-native-2.59-r3: task do_configure: completed
NOTE: package autoconf-native-2.59-r3: task do_compile: started
NOTE: package autoconf-native-2.59-r3: task do_compile: completed
NOTE: package autoconf-native-2.59-r3: task do_populate_staging: started
NOTE: package autoconf-native-2.59-r3: task do_populate_staging: completed
NOTE: package autoconf-native-2.59-r3: task do_package: started
NOTE: package autoconf-native-2.59-r3: task do_package: completed
NOTE: package autoconf-native-2.59-r3: task do_build: started
NOTE: package autoconf-native-2.59-r3: task do_build: completed
NOTE: package autoconf-native-2.59: completed
NOTE: package automake-native-1.9.3: started
NOTE: package automake-native-1.9.3-r5: task do_fetch: started
NOTE: package automake-native-1.9.3-r5: task do_fetch: completed
NOTE: package automake-native-1.9.3-r5: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/automake-1.9.3.tar.bz2 to
/mnt/main/oz/tmp/work/automake-native-1.9.3-r5/
NOTE: package automake-native-1.9.3-r5: task do_unpack: completed
NOTE: package automake-native-1.9.3-r5: task do_patch: started
NOTE: package automake-native-1.9.3-r5: task do_patch: completed
NOTE: package automake-native-1.9.3-r5: task do_configure: started
NOTE: package automake-native-1.9.3-r5: task do_configure: completed
NOTE: package automake-native-1.9.3-r5: task do_compile: started
NOTE: package automake-native-1.9.3-r5: task do_compile: completed
NOTE: package automake-native-1.9.3-r5: task do_populate_staging: started
NOTE: package automake-native-1.9.3-r5: task do_populate_staging: completed
NOTE: package automake-native-1.9.3-r5: task do_package: started
NOTE: package automake-native-1.9.3-r5: task do_package: completed
NOTE: package automake-native-1.9.3-r5: task do_build: started
NOTE: package automake-native-1.9.3-r5: task do_build: completed
NOTE: package automake-native-1.9.3: completed
NOTE: package libtool-native-1.5.10: started
NOTE: package libtool-native-1.5.10-r3: task do_fetch: started
NOTE: package libtool-native-1.5.10-r3: task do_fetch: completed
NOTE: package libtool-native-1.5.10-r3: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/libtool-1.5.10.tar.gz to
/mnt/main/oz/tmp/work/libtool-native-1.5.10-r3/
NOTE: package libtool-native-1.5.10-r3: task do_unpack: completed
NOTE: package libtool-native-1.5.10-r3: task do_patch: started
NOTE: Applying patch 'autotools.patch'
NOTE: Applying patch 'uclibc.patch'
NOTE: Applying patch '3figures.patch'
NOTE: Applying patch 'libdir-la.patch'
NOTE: Applying patch 'prefix.patch'
NOTE: Applying patch 'tag.patch'
NOTE: Applying patch 'install-path-check.patch'
NOTE: package libtool-native-1.5.10-r3: task do_patch: completed
NOTE: package libtool-native-1.5.10-r3: task do_configure: started
NOTE: package libtool-native-1.5.10-r3: task do_configure: completed
NOTE: package libtool-native-1.5.10-r3: task do_compile: started
NOTE: package libtool-native-1.5.10-r3: task do_compile: completed
NOTE: package libtool-native-1.5.10-r3: task do_populate_staging: started
NOTE: package libtool-native-1.5.10-r3: task do_populate_staging: completed
NOTE: package libtool-native-1.5.10-r3: task do_package: started
NOTE: package libtool-native-1.5.10-r3: task do_package: completed
NOTE: package libtool-native-1.5.10-r3: task do_build: started
NOTE: package libtool-native-1.5.10-r3: task do_build: completed
NOTE: package libtool-native-1.5.10: completed
NOTE: package ipkg-utils-native-1.6cvs20060102: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_fetch: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_fetch: completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_unpack: started
NOTE: Unpacking
/mnt/main/oz/sources/ipkg-utils_anoncvs.handhelds.org__20060102.tar.gz
to /mnt/main/oz/tmp/work/ipkg-utils-native-1.6cvs20060102-r6/
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_unpack: completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_patch: started
NOTE: Applying patch 'index_speedup.patch'
NOTE: Applying patch 'ipkg-utils-fix.patch'
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_patch: completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_configure:
started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_configure:
completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_compile: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_compile:
completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task
do_populate_staging: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task
do_populate_staging: completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_package: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_package:
completed
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_build: started
NOTE: package ipkg-utils-native-1.6cvs20060102-r6: task do_build: completed
NOTE: package ipkg-utils-native-1.6cvs20060102: completed
NOTE: package gettext-native-0.14.1: started
NOTE: package gettext-native-0.14.1-r3: task do_fetch: started
NOTE: package gettext-native-0.14.1-r3: task do_fetch: completed
NOTE: package gettext-native-0.14.1-r3: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/gettext-0.14.1.tar.gz to
/mnt/main/oz/tmp/work/gettext-native-0.14.1-r3/
NOTE: package gettext-native-0.14.1-r3: task do_unpack: completed
NOTE: package gettext-native-0.14.1-r3: task do_patch: started
NOTE: Applying patch 'gettext-vpath.patch'
NOTE: Applying patch 'fixchicken.patch'
NOTE: package gettext-native-0.14.1-r3: task do_patch: completed
NOTE: package gettext-native-0.14.1-r3: task do_configure: started
NOTE: package gettext-native-0.14.1-r3: task do_configure: completed
NOTE: package gettext-native-0.14.1-r3: task do_compile: started
NOTE: package gettext-native-0.14.1-r3: task do_compile: completed
NOTE: package gettext-native-0.14.1-r3: task do_populate_staging: started
NOTE: package gettext-native-0.14.1-r3: task do_populate_staging: completed
NOTE: package gettext-native-0.14.1-r3: task do_package: started
NOTE: package gettext-native-0.14.1-r3: task do_package: completed
NOTE: package gettext-native-0.14.1-r3: task do_build: started
NOTE: package gettext-native-0.14.1-r3: task do_build: completed
NOTE: package gettext-native-0.14.1: completed
NOTE: package flex-native-2.5.31: started
NOTE: package flex-native-2.5.31-r2: task do_fetch: started
NOTE: package flex-native-2.5.31-r2: task do_fetch: completed
NOTE: package flex-native-2.5.31-r2: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/flex-2.5.31.tar.bz2 to
/mnt/main/oz/tmp/work/flex-native-2.5.31-r2/
NOTE: package flex-native-2.5.31-r2: task do_unpack: completed
NOTE: package flex-native-2.5.31-r2: task do_patch: started
NOTE: Applying patch 'fix-gen.patch'
NOTE: package flex-native-2.5.31-r2: task do_patch: completed
NOTE: package flex-native-2.5.31-r2: task do_configure: started
NOTE: package flex-native-2.5.31-r2: task do_configure: completed
NOTE: package flex-native-2.5.31-r2: task do_compile: started
NOTE: package flex-native-2.5.31-r2: task do_compile: completed
NOTE: package flex-native-2.5.31-r2: task do_populate_staging: started
NOTE: package flex-native-2.5.31-r2: task do_populate_staging: completed
NOTE: package flex-native-2.5.31-r2: task do_package: started
NOTE: package flex-native-2.5.31-r2: task do_package: completed
NOTE: package flex-native-2.5.31-r2: task do_build: started
NOTE: package flex-native-2.5.31-r2: task do_build: completed
NOTE: package flex-native-2.5.31: completed
NOTE: package bison-native-2.0: started
NOTE: package bison-native-2.0-r2: task do_fetch: started
NOTE: package bison-native-2.0-r2: task do_fetch: completed
NOTE: package bison-native-2.0-r2: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/bison-2.0.tar.gz to
/mnt/main/oz/tmp/work/bison-native-2.0-r2/
NOTE: package bison-native-2.0-r2: task do_unpack: completed
NOTE: package bison-native-2.0-r2: task do_patch: started
NOTE: Applying patch 'm4.patch'
NOTE: package bison-native-2.0-r2: task do_patch: completed
NOTE: package bison-native-2.0-r2: task do_configure: started
NOTE: package bison-native-2.0-r2: task do_configure: completed
NOTE: package bison-native-2.0-r2: task do_compile: started
NOTE: package bison-native-2.0-r2: task do_compile: completed
NOTE: package bison-native-2.0-r2: task do_populate_staging: started
NOTE: package bison-native-2.0-r2: task do_populate_staging: completed
NOTE: package bison-native-2.0-r2: task do_package: started
NOTE: package bison-native-2.0-r2: task do_package: completed
NOTE: package bison-native-2.0-r2: task do_build: started
NOTE: package bison-native-2.0-r2: task do_build: completed
NOTE: package bison-native-2.0: completed
NOTE: package binutils-cross-2.15.94.0.1: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_fetch: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_fetch: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/binutils-2.15.94.0.1.tar.bz2 to
/mnt/main/oz/tmp/work/binutils-cross-2.15.94.0.1-r1/
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_unpack: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_patch: started
NOTE: Applying patch 'ld_makefile.patch'
NOTE: Applying patch 'better_file_error.patch'
NOTE: Applying patch 'signed_char_fix.patch'
NOTE: Applying patch 'binutils-100_cflags_for_build.patch'
NOTE: Applying patch 'binutils-2.15.91.0.1-uclibc-100-conf.patch'
NOTE: Applying patch 'binutils-2.15.90.0.3-uclibc-200-build_modules.patch'
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_patch: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_configure: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_configure: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_compile: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_compile: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_populate_staging:
started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_populate_staging:
completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_package: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_package: completed
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_build: started
NOTE: package binutils-cross-2.15.94.0.1-r1: task do_build: completed
NOTE: package binutils-cross-2.15.94.0.1: completed
NOTE: package gcc-cross-initial-3.4.4: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_fetch: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_fetch: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/gcc-3.4.4.tar.bz2 to
/mnt/main/oz/tmp/work/gcc-cross-initial-3.4.4-r4/
NOTE: package gcc-cross-initial-3.4.4-r4: task do_unpack: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_patch: started
NOTE: Applying patch 'gcc34-reverse-compare.patch'
NOTE: Applying patch 'gcc34-arm-ldm.patch'
NOTE: Applying patch 'gcc34-arm-ldm-peephole.patch'
NOTE: Applying patch 'gcc34-arm-tune.patch'
NOTE: Applying patch 'gcc-3.4.1-uclibc-100-conf.patch'
NOTE: Applying patch 'gcc-3.4.1-uclibc-200-locale.patch'
NOTE: Applying patch 'gcc-3.4.0-arm-lib1asm.patch'
NOTE: Applying patch 'gcc-3.4.0-arm-nolibfloat.patch'
NOTE: Applying patch 'gcc-3.4.0-arm-bigendian.patch'
NOTE: Applying patch 'gcc-3.4.0-arm-bigendian-uclibc.patch'
NOTE: Applying patch 'GCC3.4.0VisibilityPatch.diff'
NOTE: Applying patch '15342.patch'
NOTE: Applying patch 'always-fixincperm.patch'
NOTE: Applying patch 'gcc34-configure.in.patch'
NOTE: Applying patch 'gcc34-thumb-support.patch'
NOTE: package gcc-cross-initial-3.4.4-r4: task do_patch: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_configure: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_configure: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_compile: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_compile: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_populate_staging: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_populate_staging:
completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_package: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_package: completed
NOTE: package gcc-cross-initial-3.4.4-r4: task do_build: started
NOTE: package gcc-cross-initial-3.4.4-r4: task do_build: completed
NOTE: package gcc-cross-initial-3.4.4: completed
NOTE: package linux-libc-headers-2.6.11.1: started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_fetch: started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_fetch: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/linux-libc-headers-2.6.11.1.tar.bz2
to /mnt/main/oz/tmp/work/linux-libc-headers-2.6.11.1-r1/
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_unpack: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_patch: started
NOTE: Applying patch 'keyboard.patch'
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_patch: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_configure: started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_configure: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_compile: started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_compile: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_populate_staging:
started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_populate_staging:
completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_package: started
NOTE: Not creating empty archive for linux-libc-headers-2.6.11.1-r1
NOTE: Not creating empty archive for linux-libc-headers-doc-2.6.11.1-r1
Packaged contents of linux-libc-headers-dev into
/mnt/main/oz/tmp/deploy/ipk/linux-libc-headers-dev_2.6.11.1-r1_arm.ipk
NOTE: Not creating empty archive for linux-libc-headers-locale-2.6.11.1-r1
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_package: completed
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_build: started
NOTE: package linux-libc-headers-2.6.11.1-r1: task do_build: completed
NOTE: package linux-libc-headers-2.6.11.1: completed
NOTE: package qemu-native-0.8.1: started
NOTE: package qemu-native-0.8.1-r1: task do_fetch: started
NOTE: package qemu-native-0.8.1-r1: task do_fetch: completed
NOTE: package qemu-native-0.8.1-r1: task do_unpack: started
NOTE: Unpacking /mnt/main/oz/sources/qemu-0.8.1.tar.gz to
/mnt/main/oz/tmp/work/qemu-native-0.8.1-r1/
NOTE: package qemu-native-0.8.1-r1: task do_unpack: completed
NOTE: package qemu-native-0.8.1-r1: task do_patch: started
NOTE: package qemu-native-0.8.1-r1: task do_patch: completed
NOTE: package qemu-native-0.8.1-r1: task do_configure: started
NOTE: package qemu-native-0.8.1-r1: task do_configure: completed
NOTE: package qemu-native-0.8.1-r1: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/mnt/main/oz/tmp/work/qemu-native-0.8.1-r1/temp/log.do_compile.1764)
| NOTE: make
| gcc -Wall -O2 -g -fno-strict-aliasing -I. -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -o dyngen dyngen.c
| gcc32 -DQEMU_TOOL -Wall -O2 -g -fno-strict-aliasing -I. -g
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -o qemu-img
qemu-img.c block.c block-cow.c block-qcow.c aes.c block-vmdk.c
block-cloop.c block-dmg.c block-bochs.c block-vpc.c block-vvfat.c -lz
|
/usr/lib/gcc/x86_64-pc-linux-gnu/3.4.6/../../../../x86_64-pc-linux-gnu/bin/l
d:
skipping incompatible /lib64/libz.so when searching for /lib64/libz.so
|
/usr/lib/gcc/x86_64-pc-linux-gnu/3.4.6/../../../../x86_64-pc-linux-gnu/bin/l
d:
cannot find /lib64/libz.so
| collect2: ld returned 1 exit status
| make: *** [qemu-img] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/mnt/main/oz/tmp/work/qemu-native-0.8.1-r1/temp/log.do_compile.1764
NOTE: package qemu-native-0.8.1-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package qemu-native-0.8.1: failed
ERROR: Build of nano failed

____________________________________________________________

This e-mail and any attachments may contain confidential information. If you
are not the intended recipient (or have received this e-mail in error)
please notify the sender immediately and destroy this e-mail. Any
unauthorized copying, disclosure or distribution of the material in this 
e-mail is strictly forbidden.


