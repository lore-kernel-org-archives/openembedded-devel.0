Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1Hqg6E-0006Jr-RV
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2007 03:57:15 +0200
Received: by an-out-0708.google.com with SMTP id b33so3660ana
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2007 18:56:18 -0700 (PDT)
Received: by 10.100.143.11 with SMTP id q11mr49447and.1179885378550;
	Tue, 22 May 2007 18:56:18 -0700 (PDT)
Received: by 10.100.11.6 with HTTP; Tue, 22 May 2007 18:56:18 -0700 (PDT)
Message-ID: <ae36f8040705221856p1ec52709y284a370bbc1af3ee@mail.gmail.com>
Date: Tue, 22 May 2007 22:56:18 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: problems cross-compilinx xserver-xorg
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
X-List-Received-Date: Wed, 23 May 2007 01:57:16 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi I'm trying to bitbake xserver-xorg (cvs version) and I received the
following results:

NOTE: xserver-xorg-6.8.1+cvs20070523-cvs://anoncvs.freedesktop.org/cvs/xorg=
has
no section, not checking URI
NOTE: xserver-xorg-6.8.1+cvs20070523-file://imake-staging.patch has no
section, not checking URI
NOTE: xserver-xorg-6.8.1+cvs20070523-file://dri.patch has no section, not
checking URI
NOTE: package xserver-xorg-6.8.1+cvs20070523-r3: task do_fetch: completed
NOTE: package xserver-xorg-6.8.1+cvs20070523-r3: task do_unpack: started
NOTE: Unpacking
/home/lvcargnini/puc/instramed/openembedded/build/sources/xc_anoncvs.freede=
sktop.org__20070523.tar.gz
to
/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-linux/xserver-
xorg-6.8.1+cvs20070523-r3/
NOTE: package xserver-xorg-6.8.1+cvs20070523-r3: task do_unpack: completed
NOTE: package xserver-xorg-6.8.1+cvs20070523-r3: task do_patch: started
NOTE: Applying patch 'imake-staging.patch'
NOTE: Task failed: Command Error: exit status: 127  Output:
sh: quilt: command not found
NOTE: package xserver-xorg-6.8.1+cvs20070523-r3: task do_patch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package xserver-xorg-6.8.1+cvs20070523: failed
ERROR: Build of 'xserver-xorg' failed
Build statistics:
  Attempted builds: 1
  Failed builds: 1
someone please could help me ?
my local.conf:

(enterprise:~/puc/instramed/openembedded) lvcargnini% cat
build/conf/local.conf
#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on
the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
#
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you.
If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).
Your
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources int=
o
DL_DIR =3D "/home/lvcargnini/puc/instramed/openembedded/build/sources"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES =3D
"/path/to/openembedded/packages/*/*.bb"
BBFILES :=3D
"/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis
balanced.
BBMASK =3D ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You als=
o
# have to set PATH in your environment to make sure BitBake finds additiona=
l
binaries.
# Note: You will definitely need to say:
#     ASSUME_PROVIDED +=3D "virtual/arm-linux-gcc-2.95"
# to build any of two Linux 2.4 Embedix kernels,
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}gcc virtual/libc"
ASSUME_PROVIDED +=3D "/opt/eldk/usr/bin"
# Select between multiple alternative providers, if more than one is
eligible.
PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D "
virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files=
.
# Note that a full build of everything in OpenEmbedded will take GigaBytes
of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR =3D /usr/local/projects/oetmp
TMPDIR=3D/home/lvcargnini/puc/instramed/openembedded/tmp
# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically tak=
e
care
# of TARGET_ARCH
# MACHINE =3D "c7x0"
MACHINE =3D "omap5912osk"
# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH =3D "arm"
TARGET_ARCH =3D "arm"
# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you
want
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this
# TARGET_OS =3D "linux"
# TARGET_OS =3D "linux-uclibc"
TARGET_OS =3D "linux"
# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are
doing
# DISTRO =3D "generic"
DISTRO =3D "generic"
# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION =3D "0"
# ASSUME_PROVIDED +=3D "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encodingpair=
s
# with spaces as separators.
# GLIBC_GENERATE_LOCALES =3D "en_GB.UTF-8 de_DE.UTF-8"
GLIBC_GENERATE_LOCALES =3D "en en_GB fr it de pt_BR"
# Uncomment this to select a particular major kernel version if the MACHINE
setting
# supports more than one major kernel version. Currently this is suported b=
y
the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION =3D "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT =3D "package_ipk"
INHERIT =3D "package_tar"

# Add the required image file system types below. Valid are jffs2, tar,
cramfs and ext2
IMAGE_FSTYPES =3D "jffs2 tar cramfs"

# Uncomment this to disable the parse cache (not recommended).
# CACHE =3D ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG =3D "yes"
BBDEBUG =3D "yes
# Uncomment these two if you want BitBake to build images useful for
debugging.
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
# Also note that OE now produces -dbg packages which contain debugging
symbols.
# DEBUG_BUILD =3D "1"
# INHIBIT_PACKAGE_STRIP =3D "1"

# Uncomment these to build a package such that you can use gprof to profile
it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION =3D "-pg"
# SELECTED_OPTIMIZATION =3D "${PROFILE_OPTIMIZATION}"
# LDFLAGS =3D+ "-pg"

# Uncomment this to enable parallel make.
# This allows make to spawn mutliple processes to take advantage of multipl=
e

# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
# PARALLEL_MAKE =3D "-j 4"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS =3D "yes"

--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

