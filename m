Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <damwid@gmail.com>) id 1Hp1Gs-0001BL-FJ
	for openembedded-devel@openembedded.org; Fri, 18 May 2007 14:09:22 +0200
Received: by py-out-1112.google.com with SMTP id a78so1103125pyh
	for <openembedded-devel@openembedded.org>;
	Fri, 18 May 2007 05:08:53 -0700 (PDT)
Received: by 10.35.126.2 with SMTP id d2mr2680746pyn.1179490132246;
	Fri, 18 May 2007 05:08:52 -0700 (PDT)
Received: from ?192.168.1.3? ( [123.112.59.7])
	by mx.google.com with ESMTP id w29sm6422331pyg.2007.05.18.05.08.48;
	Fri, 18 May 2007 05:08:51 -0700 (PDT)
Message-ID: <464D9748.9000908@gmail.com>
Date: Fri, 18 May 2007 20:08:40 +0800
From: DAMWID <damwid@gmail.com>
User-Agent: Thunderbird 1.5.0.10 (X11/20070403)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: oe build failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2007 12:09:22 -0000
Content-Type: multipart/mixed; boundary="------------040002020402030706050104"

--------------040002020402030706050104
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit

Hi all,

I use OE to build rootfs for PXA270 board, but failed when compile
glibc, the following is error log:

[...]
| make[2]: Entering directory
`/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/libc/resource'
| ccache arm-linux-gnueabi-gcc -march=armv5te -mtune=xscale
../ports/sysdeps/unix/sysv/linux/arm/getrlimit.c -c -std=gnu99 -O2 -Wall
-Winline -Wstrict-prototypes -Wwrite-strings -fexpensive-optimizations
-frename-registers
-isystem/opt/arm-linux-gnueabi/arm-linux-gnueabi/include
-fomit-frame-pointer -I../include -I.
-I/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi/resource
-I.. -I../libio
-I/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi
-I../ports/sysdeps/arm/elf
-I../ports/sysdeps/unix/sysv/linux/arm/linuxthreads
-I../ports/sysdeps/unix/sysv/linux/arm
-I../ports/sysdeps/unix/sysv/linux -I../ports/sysdeps/unix/sysv
-I../ports/sysdeps/unix/arm -I../ports/sysdeps/unix
-I../ports/sysdeps/arm/linuxthreads -I../ports/sysdeps/arm
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754/dbl-64 -I../linuxthreads/sysdeps/unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../sysdeps/pthread
-I../linuxthreads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix
-I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common
-I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv
-I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/ieee754
-I../sysdeps/generic/elf -I../sysdeps/generic -nostdinc -isystem
/opt/arm-linux-gnueabi/lib/gcc/arm-linux-gnueabi/4.1.1/include -isystem
/opt/arm-linux-gnueabi/arm-linux-gnueabi/include -D_LIBC_REENTRANT
-include ../include/libc-symbols.h -o
/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi/resource/getrlimit.o
-MD -MP -MF
/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi/resource/getrlimit.o.dt
-MT
/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi/resource/getrlimit.o
| In file included from ../ports/sysdeps/unix/sysv/linux/arm/getrlimit.c:1:
| ../sysdeps/unix/sysv/linux/i386/getrlimit.c: In function
'__new_getrlimit':
| ../sysdeps/unix/sysv/linux/i386/getrlimit.c:65: error:
'__NR_getrlimit' undeclared (first use in this function)
| ../sysdeps/unix/sysv/linux/i386/getrlimit.c:65: error: (Each
undeclared identifier is reported only once
| ../sysdeps/unix/sysv/linux/i386/getrlimit.c:65: error: for each
function it appears in.)
| make[2]: ***
[/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/build-arm-linux-gnueabi/resource/getrlimit.o]
Error 1
| make[2]: Leaving directory
`/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/libc/resource'
| make[1]: *** [resource/subdir_lib] Error 2
| make[1]: Leaving directory
`/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/libc'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/work/bulvder/oe/build/tmp/work/armv5te-linux-gnueabi/glibc-2.3.5+cvs20050627-r13/temp/log.do_compile.17022
NOTE: package glibc-2.3.5+cvs20050627-r13: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-2.3.5+cvs20050627: failed

Does anyone know what is the problem? Attachment is my local.conf.

Thanks,
Damwid

#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
# 
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you.  If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).  Your
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources into
DL_DIR = "${HOME}/sources"

CROSS_DIR = "/opt/arm-linux-gnueabi"
STAGING_DIR = "/opt/arm-linux-gnueabi"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
BBFILES := "/work/bulvder/oe/org.openembedded.dev/packages/*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balanced.
BBMASK = ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You also
# have to set PATH in your environment to make sure BitBake finds additional binaries.
# Note: You will definitely need to say:
#     ASSUME_PROVIDED += "virtual/arm-linux-gcc-2.95"
# to build any of two Linux 2.4 Embedix kernels,
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Select between multiple alternative providers, if more than one is eligible.
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-qpe"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files.
# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR = /usr/local/projects/oetmp

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded.
#MACHINE = "mainstone"
MACHINE = "spitz"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
# TARGET_OS = "linux"
# TARGET_OS = "linux-uclibc"
TARGET_OS = "linux-gnueabi"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although they no longer contain version number in the (file-)name
# familiar-unstable and openzaurus-unstable are so called "versioned"
# distros, i.e. they explicitely select specific versions of various
# packages.
# Stay away from unversioned distros unless you really know what you are doing
# DISTRO = "openzaurus-unstable"
DISTRO = "angstrom-2007.1"

# So far, angstrom.conf and familiar.conf set ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on 
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED
ENABLE_BINARY_LOCALE_GENERATION = "0"
# ASSUME_PROVIDED += "qemu-native"

# Uncomment this to select a particular major kernel version if the MACHINE setting
# supports more than one major kernel version. Currently this is suported by the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION = "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are jffs2, tar, cramfs and ext2
IMAGE_FSTYPES = "jffs2 tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG = "yes"

# Uncomment these two if you want BitBake to build images useful for debugging. 
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined
# DEBUG_BUILD = "1"
# INHIBIT_PACKAGE_STRIP = "1"

# Uncomment these to build a package such that you can use gprof to profile it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION = "-pg"
# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
# LDFLAGS =+ "-pg"

# Uncomment this to enable parallel make.
# This allows make to spawn mutliple processes to take advantage of multiple 
# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
# PARALLEL_MAKE = "-j 4"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
CVS_TARBALL_STASH = "http://www.oesources.org/source/current/"

# EDIT THIS FILE and then remove the line below before using!
# REMOVE_THIS_LINE:="${@oe.fatal('Read the comments in your conf/local.conf')}"

--------------040002020402030706050104--
