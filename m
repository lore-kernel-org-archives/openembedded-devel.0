Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <damwid@gmail.com>) id 1IiISt-0007GD-B1
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 01:38:23 +0200
Received: by wa-out-1112.google.com with SMTP id v27so3134873wah
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Oct 2007 16:31:33 -0700 (PDT)
Received: by 10.114.197.1 with SMTP id u1mr9258533waf.1192589568258;
	Tue, 16 Oct 2007 19:52:48 -0700 (PDT)
Received: from ?192.168.1.3? ( [123.116.97.152])
	by mx.google.com with ESMTPS id m6sm8026038wag.2007.10.16.19.52.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Oct 2007 19:52:47 -0700 (PDT)
Message-ID: <471578FA.2020105@gmail.com>
Date: Wed, 17 Oct 2007 10:52:42 +0800
From: DAMWID <damwid@gmail.com>
User-Agent: Thunderbird 1.5.0.13 (X11/20070824)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: gmp-native do_configure failed
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
X-List-Received-Date: Wed, 17 Oct 2007 23:38:23 -0000
Content-Type: multipart/mixed; boundary="------------040408050100030209070002"

--------------040408050100030209070002
Content-Type: text/plain; charset=GB18030; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Today I tried to build a angstrom minimal-image for my pxa27x board, but 
the build failed when configure gmp-native, the following is the error log:

NOTE: package gmp-native-4.2.1: started
NOTE: package gmp-native-4.2.1-r2: task do_patch: started
NOTE: Applying patch 'configure.patch'
NOTE: Applying patch 'amd64.patch'
NOTE: Applying patch 'sh4-asmfix.patch'
NOTE: Applying patch 'x86-fat.diff'
NOTE: package gmp-native-4.2.1-r2: task do_patch: completed
NOTE: package gmp-native-4.2.1: completed
NOTE: Running task 108 of 654 (ID: 300, 
/work/openembedded/org.openembedded.dev/packages/gmp/gmp-native_4.2.1.bb, 
do_configure)
NOTE: package gmp-native-4.2.1: started
NOTE: package gmp-native-4.2.1-r2: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows 
(/work/openembedded/build_pxa27x/tmp/work/i686-xscale-linux/gmp-native-4.2.1-r2/temp/log.do_configure.17599)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.
| AUTOV is 1.9
| NOTE: Executing autoreconf --verbose --install --force 
--exclude=autopoint -I 
/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal-1.9 -I 
/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I 
/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal-1.9 -I 
/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal --force
| autoreconf: configure.in: tracing
| autoreconf: running: libtoolize --copy --force
| Using `AC_PROG_RANLIB' is rendered obsolete by `AC_PROG_LIBTOOL'
| autoreconf: running: 
/opt/arm-xscale-linux-gnueabi/i686-linux/bin/autoconf 
--include=/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal-1.9 
--include=/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal --force 
--warnings=cross
| autoreconf: running: 
/opt/arm-xscale-linux-gnueabi/i686-linux/bin/autoheader 
--include=/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal-1.9 
--include=/opt/arm-xscale-linux-gnueabi/i686-linux/share/aclocal --force 
--warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy 
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running 
/work/openembedded/build_pxa27x/tmp/work/i686-xscale-linux/gmp-native-4.2.1-r2/gmp-4.2.1/configure                  
--build=i686-linux       --host=i686-linux                
--target=i686-xscale-linux              
--prefix=/opt/arm-xscale-linux-gnueabi                  
--exec_prefix=/opt/arm-xscale-linux-gnueabi/i686-linux                    
--bindir=/opt/arm-xscale-linux-gnueabi/i686-linux/bin                   
--sbindir=/opt/arm-xscale-linux-gnueabi/i686-linux/bin                    
--libexecdir=/opt/arm-xscale-linux-gnueabi/i686-linux/libexec                   
--datadir=/opt/arm-xscale-linux-gnueabi/i686-linux/share                  
--sysconfdir=/opt/arm-xscale-linux-gnueabi/etc                  
--sharedstatedir=/opt/arm-xscale-linux-gnueabi/com                
--localstatedir=/opt/arm-xscale-linux-gnueabi/var               
--libdir=/opt/arm-xscale-linux-gnueabi/i686-linux/lib                   
--includedir=/opt/arm-xscale-linux-gnueabi/i686-linux/include                     
--oldincludedir=/opt/arm-xscale-linux-gnueabi/i686-linux/include         
--infodir=/opt/arm-xscale-linux-gnueabi/i686-linux/share/info                    
--mandir=/opt/arm-xscale-linux-gnueabi/i686-linux/share/man               
...
| configure: error: --target is not appropriate for GMP
| Use --build=CPU-VENDOR-OS if you need to specify your CPU and/or system
| explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
| manual for more on this).
| FATAL: oe_runconf failed
NOTE: Task failed: 
/work/openembedded/build_pxa27x/tmp/work/i686-xscale-linux/gmp-native-4.2.1-r2/temp/log.do_configure.17599
NOTE: package gmp-native-4.2.1-r2: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gmp-native-4.2.1: failed
ERROR: Build of 
/work/openembedded/org.openembedded.dev/packages/gmp/gmp-native_4.2.1.bb 
do_configure failed
ERROR: Task 300 
(/work/openembedded/org.openembedded.dev/packages/gmp/gmp-native_4.2.1.bb, 
do_configure) failed
NOTE: Tasks Summary: Attempted 107 tasks of which 0 didn't need to be 
rerun and 1 failed.
ERROR: 
'/work/openembedded/org.openembedded.dev/packages/gmp/gmp-native_4.2.1.bb' 
failed

I googled this problem and found this is a bug already be fixed years 
ago. Maybe this is a problem of my build environment, my host distro is 
ubuntu-7.04, with gcc-4.1 and gcc-3.4 installed, the default is gcc-4.1, 
all other development related packages(autoconf, automake, libtool, 
etc.) have been installed with the lastest version. But I successfully 
built angstrom-*-image in this environment before with the same attached 
local.conf.

Anyone can help me?

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

CROSS_DIR = "/opt/arm-xscale-linux-gnueabi"
STAGING_DIR = "/opt/arm-xscale-linux-gnueabi"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
BBFILES := "/work/openembedded/org.openembedded.dev/packages/*/*.bb /work/openembedded/build_pxa27x/packages/*/*.bb"

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
# PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
# PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-qpe"
# PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
# PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
# PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

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
# TARGET_OS = "linux-gnueabi"

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
# ENABLE_BINARY_LOCALE_GENERATION = "0"
# ASSUME_PROVIDED += "qemu-native"

GLIBC_GENERATE_LOCALES = "en_US.UTF-8 zh_CN.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE setting
# supports more than one major kernel version. Currently this is suported by the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION = "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are jffs2, tar, cramfs and ext2
IMAGE_FSTYPES = "jffs2 cramfs tar.gz"

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
# CVS_TARBALL_STASH = "http://www.oesources.org/source/current/"

# EDIT THIS FILE and then remove the line below before using!
# REMOVE_THIS_LINE:="${@oe.fatal('Read the comments in your conf/local.conf')}"

# Some machine specific configure
TARGET_VENDOR_spitz = "-xscale"

ERASEBLOCKSIZE_spitz = "0x20000"
EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=${ERASEBLOCKSIZE} --pad --faketime -n" 
IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2.bin ${EXTRA_IMAGECMD}"

ANGSTROM_EXTRA_INSTALL = "mplayer mencoder mtd-utils"

--------------040408050100030209070002--
