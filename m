Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JZoP6-0003qC-4b
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 15:29:53 +0100
X-ASG-Debug-ID: 1205418318-788e008f0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id A02A41E448
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 09:25:18 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id zI2CBgpdhqui8UZO for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 09:25:18 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Eureka! AVR32 ld-uClibc.so segfault solved
Date: Thu, 13 Mar 2008 09:25:13 -0500
User-Agent: KMail/1.9.7
References: <200803121450.09688.geoffrey@pager.net>
	<19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
	<47D8E882.1030106@linuxdevelopment.de>
In-Reply-To: <47D8E882.1030106@linuxdevelopment.de>
MIME-Version: 1.0
Message-Id: <200803130925.14362.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1205418318
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
X-SA-Exim-Connect-IP: 209.253.16.26
X-SA-Exim-Mail-From: geoffrey@pager.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Thu, 13 Mar 2008 14:30:28 -0000
X-Groupsio-MsgNum: 4633
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KlT2H32KDWRxlGk"

--Boundary-00=_KlT2H32KDWRxlGk
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 13 March 2008 03:40:34 am Robert W=F6rle wrote:
> Dear Geoffrey , Dear all
>
> I dont get it.
> My chain stops at this stage below trying to find external-toolchain
> under /usr/local/angstrom/
>
> Can you hint me over this

Don't know enough about BitBake / OE to really comment on the problem=20
directly.  I'm not trying to use an external toolchain.  I decided I'd rath=
er=20
fix the toolchain in OE than try to use an external toolchain.

I'm attaching my local.conf file for the AT32STK1000 board.  Of course, unt=
il=20
I get the rest of my toolchain patches submitted, it may not help you out t=
oo=20
much.  I think with what's currently in org.openembedded.dev, it will at=20
least build a file system that'll boot until it gets to init, and then=20
segfault.

Watch out for the PRJROOT variable I used in it.  I have a script I source=
=20
when I start working on my project that sets this environment variable.

=2D--
Geoffrey
 =20

--Boundary-00=_KlT2H32KDWRxlGk
Content-Type: text/plain;
  charset="iso-8859-1";
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
#DL_DIR = "${HOME}/sources"
DL_DIR = "${PRJROOT}/sources"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/packages/*/*.bb"
BBFILES = "${PRJROOT}/org.openembedded.dev/packages/*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balanced.
BBMASK = ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You also
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
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

#PREFERRED_PROVIDER_virtual/avr32-angstrom-linux-uclibc-libc-for-gcc = "uclibc"
PREFERRED_VERSION_linux = "2.6.23"


# Uncomment this to specify where BitBake should create its temporary files.
# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR = /usr/local/projects/oetmp

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically take care
# of TARGET_ARCH
# MACHINE = "c7x0"
MACHINE = "at32stk1000"
#MACHINE = "atngw100"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this 
# TARGET_OS = "linux"
TARGET_OS = "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they 
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are doing
DISTRO = "angstrom-2008.1"

# Only uClibc supports the AVR32, so we must get a uClibc based Angstrom
ANGSTROM_MODE = "uclibc"



# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
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

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are 
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
IMAGE_FSTYPES = "ext3 jffs2 tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
BBDEBUG = "yes"

# Uncomment these two if you want BitBake to build images useful for debugging. 
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
# Also note that OE now produces -dbg packages which contain debugging symbols.
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
PARALLEL_MAKE = "-j 3"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
#CVS_TARBALL_STASH = ""

# EDIT THIS FILE and then remove the line below before using!
#REMOVE_THIS_LINE:="${@bb.fatal('Read the comments in your conf/local.conf')}"

--Boundary-00=_KlT2H32KDWRxlGk--
