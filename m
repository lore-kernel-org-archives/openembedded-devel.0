Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1M7Ak9-0000RF-Ki
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 18:03:44 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 21 May 2009 17:56:04 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 21 May 2009 17:55:39 +0200
Received: from [192.168.1.107] ([79.54.130.51]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 21 May 2009 17:55:39 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A1563B0.4090406@taupro.com>
References: <4A1563B0.4090406@taupro.com>
Date: Thu, 21 May 2009 17:57:22 +0200
Message-Id: <1242921442.27094.26.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 21 May 2009 15:55:39.0695 (UTC)
	FILETIME=[969B5BF0:01C9DA2C]
Subject: Re: Changing a machine def and rebuilding tool chain?
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
X-List-Received-Date: Thu, 21 May 2009 16:03:53 -0000
X-Groupsio-MsgNum: 10590
Content-Type: multipart/mixed; boundary="=-84p+TrRrzNt5/aACoyR2"

--=-84p+TrRrzNt5/aACoyR2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-21 at 09:22 -0500, Jeff Rush wrote:
> I'm working on a machine definition for the old TuxScreen hardware as I
> haven't seen one already defined in the OE metadata.
> 
> Initially I had a:
> 
>    TARGET_CC_ARCH = "-march=armv4t -mtune=strongarm"
> 
> where the TuxScreen CPU is a StrongARM 1100.  After building a
> statically-lined "helloworld" program however, it gives me an instruction
> error when I try to run it on the target hardware.
> 
> Figuring it was my use of "armv4t" I changed it to just "-march=armv4
> -mtune=strongarm".  Doing a:
> 
>   $ bitbake -c clean helloworld
>   $ bitbake helloworld
> 
> produces the exact same binary, so obviously I need to rebuild something
> further upstream in my toolchain.  Does the BitBake system notice that a
> machine definition has changed, or that a TARGET_CC_ARCH has changed and
> rebuild the necessary pieces?  Or do I have to blow it all away and rebuild
> everything whenever something as fundamental as the TARGET_CC_ARCH changes?
> 
> Thanks,
> 
> -Jeff
according to http://www.linuxdevices.com/products/PD5824679728.html you
have a 2.4 kernel.
Did you try with a 2.4 kenrel, if so the problem could be the arm ABI
(binaries are produced for EABI and the kenrel support OABI)
here are more infos on arm ABI:
http://wiki.debian.org/ArmEabiPort

I've attached my config for a 2.4 kenrel and oabi in case you have to
fight against setting openembedded to cross compile to OABI

Unfortunately some variables were printed after the parsing aren't
printed anymore...that could help a lot for debuging theses
problems...maybe you will have to use peek in bitbake -i then...

Denis.


--=-84p+TrRrzNt5/aACoyR2
Content-Disposition: attachment; filename="freepma.conf"
Content-Type: text/plain; name="freepma.conf"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#this is a special version of angstrom for legacy (e.g. kernel 2.4) software
# that means:
#      * no udev
#      * no sysfs
#      * no EABI for ARM

require conf/distro/angstrom-2008.1.conf

TARGET_ARCH = "arm"
TARGET_OS = "linux-uclibc"
#TARGET_OS = "linux"
TARGET_FPU_arm = "hard"
ARM_ABI = "oabi"

#IPKGBUILDCMD = "ipkg-build -c -o 0 -g 0"
TARGET_CC_ARCH = "-march=armv4"
FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -O2"

PACKAGE_ARCHS += " arm-oabi"

PREFERRED_VERSION_linux-libc-headers = "2.4.19"

# We'll have to fill this in as we go.

PREFERRED_VERSION_glibc-initial = "2.5"
PREFERRED_VERSION_glibc = "2.5"
ANGSTROMLIBC = "uclibc"
#ANGSTROMLIBC = "glibc"


PREFERRED_PROVIDER_virtual/libc = "uclibc"
PREFERRED_PROVIDER_virtual/libintl = "gettext"
PREFERRED_PROVIDER_virtual/libiconv = "libiconv"
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibc-libc-for-gcc = "uclibc"

#export CXX=arm-angstrom-linux-uclibc-g++-uc

IPKG_VARIANT = "opkg-nogpg-nocurl"
SRCREV_pn-opkg = "160"



--=-84p+TrRrzNt5/aACoyR2
Content-Disposition: attachment; filename="pma430.conf"
Content-Type: text/plain; name="pma430.conf"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#@TYPE: Machine
#@NAME: PMA430
#@DESCRIPTION: Machine configuration for the PMA430

TARGET_ARCH = "arm"
TARGET_OS = "linux"
TARGET_FPU = "hard"
ARM_ABI = "oabi"

PREFERRED_PROVIDER_virtual/kernel = "linux-pma430"

MACHINE_FEATURES = "kernel24 screen touchscreen hotplug wifi usbhost usbgadget"

require conf/machine/include/tune-arm920t.inc

--=-84p+TrRrzNt5/aACoyR2
Content-Disposition: attachment; filename="pma430.conf"
Content-Type: text/plain; name="pma430.conf"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

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

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/recipes/*/*.bb"
#BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
#BBFILES := "${HOME}/oe/local_recipes/recipes/*/*.bb ${HOME}/oe/org.openembedded.dev/recipes/*/*.bb"
#BBFILES := "${HOME}/oe/org.openembedded.dev/recipes/*/*.bb"
BBFILES="${HOME}/oe/pma430_recipes/recipes/*/*.bb  ${HOME}/oe/local_recipes/recipes/*/*.bb ${HOME}/oe/org.openembedded.dev/recipes/*/*.bb"
BBFILE_COLLECTIONS = "pma430 local upstream"
BBFILE_PATTERN_upstream = "^${HOME}/oe/org.openembedded.dev/recipes/"
BBFILE_PATTERN_local = "^${HOME}/oe/local_recipes/recipes/"
BBFILE_PATTERN_pma430 = "^${HOME}/oe/pma430_recipes/recipes/"
BBFILE_PRIORITY_upstream = "1"
BBFILE_PRIORITY_local = "2"
BBFILE_PRIORITY_pma430 = "3"


#BBFILES := ""
# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balanced.
BBMASK = ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide recipes for toolchain and additional libraries yourself. You also
# have to set PATH in your environment to make sure BitBake finds additional binaries.
# ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Uncomment this if you're building for an arch that uses emulated locale 
# generation under qemu (mainly arm glibc) and have an external gcc 3.x compiler
# that OE recognises. This will mean the gcc-native build is skipped, speeding 
# builds up.
# ASSUME_PROVIDED += "gcc3-native"

# Uncomment this if you are building Linux 2.4 Embedix kernels.
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# Most users do not need this anymore thankfully!
# ASSUME_PROVIDED += "virtual/arm-linux-gcc-2.95"

# Select between multiple alternative providers, if more than one is eligible.
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files.
# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
TMPDIR = ${HOME}/oetmp_pma

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically take care
# of TARGET_ARCH
MACHINE = "pma430"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this 
# TARGET_OS = "linux"
# TARGET_OS = "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they 
# explicitely select specific versions of various recipes.
# Stay away from unversioned distros unless you really know what you are doing
DISTRO = "freepma"

# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale recipes at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on 
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION = "0"
# ASSUME_PROVIDED += "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encoding pairs
# with spaces as separators.
# GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE setting
# supports more than one major kernel version. Currently this is suported by the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION = "2.6"

# Uncomment one of these to build recipes during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are 
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
#IMAGE_FSTYPES = "jffs2 tar"
IMAGE_FSTYPES = "tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG = "yes"

# Uncomment these two if you want BitBake to build images useful for debugging. 
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
# Also note that OE now produces -dbg recipes which contain debugging symbols.
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
# processors. Useful on SMP machines. This may break some recipes - we're
# in the process of marking these so let us know if you find any.
# PARALLEL_MAKE = "-j 4"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
#CVS_TARBALL_STASH = ""

# Uncomment this if you want to install shared libraries directly under their SONAME,
# rather than installing as the full version and symlinking to the SONAME.
# PACKAGE_SNAP_LIB_SYMLINKS = "1"

# EDIT THIS FILE and then remove the line below before using!
#REMOVE_THIS_LINE:="${@bb.fatal('Read the comments in your conf/local.conf')}"

#TO REMOVE:
#PREFERRED_VERSION_libexosip2 = "3.1.0"
#PREFERRED_VERSION_libosip2 = "3.1.0"
#REMOVE_THIS_LINE:="${@bb.fatal('clean the sip mess')}"


#PREFERRED_VERSION_boost = "1.36.0"
#PREFERRED_VERSION_boost-jam-native = "3.1.16"

#ASSUME_PROVIDED += " linux-pma430"
#ASSUME_PROVIDED += " virtual/kernel"

PREFERRED_VERSION_uclibc = "0.9.30.1"
PREFERRED_VERSION_uclibc-initial = "0.9.30.1"
#PREFERRED_VERSION_binutils-cross = "2.18"

#PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
#PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
#PREFERRED_VERSION_gcc-cross = "4.1.2"


--=-84p+TrRrzNt5/aACoyR2--
