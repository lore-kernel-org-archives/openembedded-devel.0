Received: from [128.178.50.19] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1Gh1Sy-0008UA-6w
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 11:12:32 +0100
Received: (qmail 16129 invoked by uid 107); 6 Nov 2006 10:11:14 -0000
Received: from mailav2.epfl.ch (128.178.50.191)
	by smtp0.epfl.ch with SMTP; 6 Nov 2006 10:11:14 -0000
Received: from (unknown [128.178.50.19]) by MAILAV2.epfl.ch with smtp
	id 60c2_226c391e_6d7f_11db_bb96_00114337c797;
	Mon, 06 Nov 2006 11:11:13 +0100
Received: from mailbox2.epfl.ch (128.178.50.104)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Mon, 06 Nov 2006 11:11:14 +0100
Received: from lsa1pc7.epfl.ch (lsa1pc7.epfl.ch [128.178.145.53])
	(authenticated bits=0)
	by mailbox2.epfl.ch (8.12.11/8.12.11) with ESMTP id kA6ABD1j002976
	for <openembedded-devel@openembedded.org>;
	Mon, 6 Nov 2006 11:11:14 +0100 (MET)
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@openembedded.org
Date: Mon, 6 Nov 2006 11:11:13 +0100
User-Agent: KMail/1.9.5
Organization: EPFL STI-IPR-LSRO1
MIME-Version: 1.0
Message-Id: <200611061111.13491.valentin.longchamp@epfl.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Problem in building compiler
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
X-List-Received-Date: Mon, 06 Nov 2006 10:12:32 -0000
X-Groupsio-MsgNum: 696
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_BpwTFjkwnhewEV0"

--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I'm new to openembedded. I'm working on a robotics research project where we 
are designing a small mobile robot called Marxbot (which is aimed for 
research). The robot embeds an iMX31 custom board. Now I would like to build 
a Linux distro for this robot.

I have used until now LTIB which is the tool proposed by Freescale. However, 
openembedded looks much more complete and clean, since it allows me to 
generate the cross-compiler using the same tool (and not crosstool and LTIB 
as until now).

I have taken Angstrom as a basis for my config files, modifying them to 
something that suits my needs (I haven't changed everything yet, it's only a 
first try, much will change). I have chosen Angstrom, because it seems be arm 
EABI aware, and I need this also to be able to work with Freescale kernel 
patches.

However the build fails for the glibc-intermediate. First, one question about 
the different toolchains that are built. I don't really understand very well 
what are all the different ones: I see cross is aimed for cross-compiling, 
then a native compiler (to be run on the target is built). But what 
does "intermediate" stands for ? What is its goal ?

Now, for my current build problem, the attached error.log file contains the 
error.

Anyone has an idea, according to my config files regarding the cross-compiler, 
of what is wrong here ?

Thank you very much

Valentin Longchamp

--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii";
  name="local.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="local.conf"

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
DL_DIR = "${HOME}/downloads"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
# BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
BBFILES := "${HOME}/EPFL/iMXBoard/linux/openembedded/org.openembedded.dev/packages/*/*.bb"

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
MACHINE = "mx31board"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
TARGET_OS = "linux"
# TARGET_OS = "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although they no longer contain version number in the (file-)name
# familiar-unstable and openzaurus-unstable are so called "versioned"
# distros, i.e. they explicitely select specific versions of various
# packages.
# Stay away from unversioned distros unless you really know what you are doing
DISTRO = "marxbot"

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
INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are jffs2, tar, cramfs and ext2
IMAGE_FSTYPES = "jffs2 tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
BBDEBUG = "yes"

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

--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii";
  name="marxbot.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="marxbot.conf"

#@--------------------------------------------------------------------
#@TYPE: Distribution
#@NAME: Angstrom <http://www.angstrom-distribution.org>
#@DESCRIPTION: The Linux Distribution for Kernel 2.6 based devices
#@MAINTAINER: Valentin Longchamp <valentin.longchamp@epfl.ch>
#@--------------------------------------------------------------------

#DISTRO_VERSION = "2006.9"
DISTRO_VERSION = "test-${DATE}"
DISTRO_REVISION = "2"

require conf/distro/include/marxbot.inc
require conf/distro/include/sane-srcdates.inc

DISTRO_TYPE = "debug"
#DISTRO_TYPE = "release"

#FEED_URIS += " \
#		no-arch##${ANGSTROM_URI}/unstable/feed/all \
#		base##${ANGSTROM_URI}/unstable/feed/${TARGET_ARCH}/base \
#		perl##${ANGSTROM_URI}/unstable/feed/${TARGET_ARCH}/perl \
#		python##${ANGSTROM_URI}/unstable/feed/${TARGET_ARCH}/python \
#		debug##${ANGSTROM_URI}/unstable/feed/${TARGET_ARCH}/debug \
#		${MACHINE}##${ANGSTROM_URI}/unstable/feed/${TARGET_ARCH}/machine/${MACHINE}"
#        base##${ANGSTROM_URI}/releases/${DISTRO_VERSION}/feed/${TARGET_ARCH}/base \
#        ${MACHINE}##${ANGSTROM_URI}/releases/${DISTRO_VERSION}/feed/${TARGET_ARCH}/machine/${MACHINE} \
#        updates##${ANGSTROM_URI}/releases/${DISTRO_VERSION}/feed/${TARGET_ARCH}/updates"

#SRCDATE = "20060630"
#SRCDATE_handhelds-pxa-2.6 = "20060622"
#PREFERRED_VERSION_handhelds-pxa-2.6 = "2.6.16-hh5"
#PREFERRED_VERSION_handhelds-pxa-2.6_htcuniversal = "2.6.17-hh1+cvs${SRCDATE}"

PREFERRED_PROVIDER_hostap-modules_ipaq-pxa270 = "hostap-modules"


SRCDATE_gconf-dbus = "20060719"
SRCDATE_gnome-vfs-dbus = "20060803"

PREFERRED_VERSION_qemu-native = "0.8.2"

CVS_TARBALL_STASH = "\
http://ewi546.ewi.utwente.nl/mirror/www.openzaurus.org/official/unstable/3.5.4/sources/ \
http://www.oesources.org/source/current/"

# Opie
#use 1337 mt version of opie to have a webbrowser
PALMTOP_USE_MULTITHREADED_QT = "yes"
QTE_VERSION = "2.3.10"
#OPIE_VERSION = "1.2.2"
#require conf/distro/include/preferred-opie-versions.inc

#Make sure we use 2.6 on machines with a 2.4/2.6 selector
KERNEL = "kernel26"
MACHINE_KERNEL_VERSION = "2.6"

PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"

PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}g++:gcc-cross"

# Virtuals:
PREFERRED_PROVIDER_virtual/db ?= "db"
PREFERRED_PROVIDER_virtual/db-native ?= "db-native"

# Others:
PREFERRED_PROVIDER_tslib ?= "tslib"
PREFERRED_PROVIDER_tslib-conf ?= "tslib"
PREFERRED_PROVIDER_libgpewidget ?= "libgpewidget"
PREFERRED_PROVIDER_ntp = "ntp"
PREFERRED_PROVIDER_hotplug = "udev"
PREFERRED_PROVIDER_libxss = "libxss"

#EABI stuff
#PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc = "glibc-intermediate"
PREFERRED_PROVIDER_virtual/arm-marxbot-linux-gnueabi-libc-for-gcc = "glibc-intermediate"
#PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc = "glibc-intermediate"

#shouldn't that be uclibc-initial????
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc = "uclibc-initial"

#use EABI toolchain
PREFERRED_VERSION_gcc ?= "4.1.1"
PREFERRED_VERSION_gcc-cross ?= "4.1.1"
PREFERRED_VERSION_gcc-cross-initial ?= "4.1.1"
PREFERRED_VERSION_binutils ?= "2.17"
PREFERRED_VERSION_binutils-cross ?= "2.17"
PREFERRED_VERSION_linux-libc-headers ?= "2.6.15.99"
PREFERRED_VERSION_glibc ?= "2.4"
PREFERRED_VERSION_glibc-initial ?= "2.4"
PREFERRED_VERSION_glibc-intermediate ?= "2.4"

# To use an EABI compatible version 3 series gcc, either uncomment 
# the lines below or set them in local.conf: 
#
# PREFERRED_VERSION_gcc-cross = "3.4.4+csl-arm-2005q3"
# PREFERRED_VERSION_gcc-cross-initial = "3.4.4+csl-arm-2005q3"


# Busybox <1.1.0 doesn't have EABI support
PREFERRED_VERSION_busybox = "1.2.1"

PREFERRED_VERSION_dbus ?= "0.92"


# do some task-base stuff here

# We want to ship extra debug utils in the rootfs when doing a debug build 
DEBUG_APPS ?= ""
DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "tslib-tests tslib-calibrate gdb strace procps",d)}'

#this should go away soon
EXTRA_STUFF ?= ""


# Angstrom want to ship some extra stuff. This should be moved into task-base eventually
DISTRO_EXTRA_RDEPENDS = "\
    update-modules module-init-tools modutils-initscripts \
    sysvinit initscripts sysvinit-pidof \
    psplash \
    netbase dropbear \
    angstrom-version \
    ipkg ipkg-collateral \
    util-linux-mount util-linux-umount \
    ${EXTRA_STUFF} \
    ${DEBUG_APPS} \
    "


--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii";
  name="marxbot.inc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="marxbot.inc"

#@TYPE: Distribution
#@NAME: Angstrom 
#@DESCRIPTION: Distribution configuration for Angstrom

DISTRO = "marxbot"
DISTRO_NAME = "Marxbot"

TARGET_VENDOR = "-marxbot"
MACHINE_TASK_PROVIDER = "task-base"

# Can be "glibc" and "uclibc"
MARXBOT_MODE ?= "glibc"

DEPLOY_DIR = "${TMPDIR}/deploy/${MARXBOT_MODE}"
require conf/distro/include/marxbot-${MARXBOT_MODE}.inc

#Use this variable in feeds and other parts that need a URI
ANGSTROM_URI = "http://www.angstrom-distribution.org"

#Set the default maintainer to angstrom-dev
MAINTAINER = "Valentin Longchamp <valentin.longchamp@epfl.ch>"

#use ipkg package format with debian style naming
#use multimachine buildrules 
INHERIT += "package_ipk debian multimachine"

#Generate locales on the buildsystem instead of on the target. Speeds up first boot, set to "1" to enable
#PREFERRED_PROVIDER_qemu-native = "qemu-native"
ENABLE_BINARY_LOCALE_GENERATION ?= "0"

#ARM EABI is softfloat by default, but let's make sure :)
#make it overridable for platforms with FPU, like ep93xx or i.mx31
TARGET_FPU_arm ?= "soft"

#Name the generated images in a sane way
IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
DEPLOY_DIR_IMAGE = ${DEPLOY_DIR}/images/${MACHINE}

# Angstrom *always* has some form of release config, so error out if someone thinks he knows better 
DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION if you really want to build an unversioned distro')}"

# We want images supporting the following features (for task-base)
DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 irda pcmcia usbgadget usbhost"

--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii";
  name="marxbot-glibc.inc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="marxbot-glibc.inc"

# glibc:
#fix some iconv issues, needs to be adjusted when doing uclibc builds
PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
PREFERRED_PROVIDER_virtual/libintl ?= "glibc"

TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1)=='arm']}"

#mess with compiler flags to use -Os instead of -O2
#Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
BUILD_OPTIMIZATION = "-Os"
CXXFLAGS += "-fvisibility-inlines-hidden"


--Boundary-00=_BpwTFjkwnhewEV0
Content-Type: text/plain;
  charset="us-ascii";
  name="mx31board.conf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mx31board.conf"

#@TYPE: Machine
#@Name: MarxBot MX31 board
#@DESCRIPTION: Machine configuration for MX31 custom board

TARGET_ARCH = "arm"
TARGET_FPU_arm = "hard"

GUI_MACHINE_CLASS = "smallscreen"
IPKG_EXTRA_ARCHS = "armv6"

PREFERRED_PROVIDER_virtual/kernel = "${MACHINE}-kernel"

include conf/machine/include/tune-arm1136jf-s.conf

# used by sysvinit_2
SERIAL_CONSOLE = "115200 ttymxc0"

# used by opie-collections.inc
ROOT_FLASH_SIZE = "32"

--Boundary-00=_BpwTFjkwnhewEV0--
