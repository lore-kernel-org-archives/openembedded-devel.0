Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1MsHbO-00056W-Fe
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 16:53:25 +0200
Received: by fg-out-1718.google.com with SMTP id e21so667600fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=RUx37W97QZG1cR3haUtPl5UZAgKBW8me4aSjnQiiXQI=;
	b=IDwcF+s2VcmZaxUA1TmEFX9GkS//pzSY2wJ1Ol1XIj6d/EWFvYYlbpA0zQezEu4SYO
	wFmBvmJoygHMcmxpTiImq3v9Fj3YoGG/aq7x1040AqASATp/XgBllATdzrkiSyt0BvHc
	4k+Cx7hrb5MrN44E7aIHebbq65tAjjEJulkVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	b=SgsgsN843FB8DKgcaKHcInEcLh9Gq8lh8MvpsYLZ6bbG1OnMe+FjtgIBuL3EYpAGzG
	njEZIA/lEyVbvFQ0SFWc3VSIMtw4RwyrmGoXmEay9+vAV770OLEYlrQeHjZF0SnVvQVr
	wXZ4QnXbdQMtTPAQvSUpGJpCI6XP9UJ3Bt1jU=
Received: by 10.86.16.9 with SMTP id 9mr3425517fgp.8.1254149562151;
	Mon, 28 Sep 2009 07:52:42 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([212.98.167.157])
	by mx.google.com with ESMTPS id l12sm345627fgb.9.2009.09.28.07.52.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 28 Sep 2009 07:52:41 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Sep 2009 17:52:05 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200909281752.11487.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: udev problems on angstrom-2008.1
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
X-List-Received-Date: Mon, 28 Sep 2009 14:53:25 -0000
X-Groupsio-MsgNum: 13240
Content-Type: multipart/signed; boundary="nextPart1725860.FIa2O3cQcV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1725860.FIa2O3cQcV
Content-Type: multipart/mixed;
  boundary="Boundary-01=_V2MwK1/pnG62kud"
Content-Transfer-Encoding: 7bit

--Boundary-01=_V2MwK1/pnG62kud
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi, I'm experiencing problems with image for rx1950 PDA (s3c2442-based PDA=
=20
with 32M of RAM) built by openembedded.
=46or some reason, udev doesn't work, and complains about lack of free spac=
e on=20
/dev (which is tmpfs) like this:

udevd-event[1918]: mknod(/dev/vcS, 020660, (7,0) failed: No space left on=20
device.

I'm using oe buildsystem from git, last git commit is:
commit 9c38c208143bda93bb3362de4d4c2a00b4c8c8ea
Merge: cdc32dd e5d715b
Author: Graeme Gregory <dp@xora.org.uk>
Date:   Mon Sep 28 10:10:46 2009 +0100

    Merge branch 'org.openembedded.dev' of=20
git+ssh://git@git.openembedded.org/openembedded into org.openembedded.dev

local.conf is in attachment. Any suggestions?

Regards,
Vasily

--Boundary-01=_V2MwK1/pnG62kud
Content-Type: text/plain;
  charset="UTF-8";
  name="local.conf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="local.conf"

#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on =
the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
#=20
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you. =
 If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).  Yo=
ur
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources int=
o
DL_DIR =3D "/home/distfiles"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES =3D "/path/to/o=
penembedded/packages/*/*.bb"
BBFILES :=3D "/home/anarsoul/work/openembedded/openembedded/recipes/*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balance=
d.
BBMASK =3D ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You als=
o
# have to set PATH in your environment to make sure BitBake finds additiona=
l binaries.
# ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Uncomment this if you're building for an arch that uses emulated locale=
=20
# generation under qemu (mainly arm glibc) and have an external gcc 3.x com=
piler
# that OE recognises. This will mean the gcc-native build is skipped, speed=
ing=20
# builds up.
# ASSUME_PROVIDED +=3D "gcc3-native"

# Uncomment this if you are building Linux 2.4 Embedix kernels.
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# Most users do not need this anymore thankfully!
# ASSUME_PROVIDED +=3D "virtual/arm-linux-gcc-2.95"

# Select between multiple alternative providers, if more than one is eligib=
le.
PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-in=
itial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cro=
ss-intermediate"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files=
.
# Note that a full build of everything in OpenEmbedded will take GigaBytes =
of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR =3D /usr/local/projects/oetmp

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically tak=
e care
# of TARGET_ARCH
MACHINE =3D "rx1950"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH =3D "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you w=
ant
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this=20
# TARGET_OS =3D "linux"
# TARGET_OS =3D "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they=20
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are do=
ing
DISTRO =3D "angstrom-2008.1"

# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on=20
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION =3D "0"
# ASSUME_PROVIDED +=3D "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encoding pai=
rs
# with spaces as separators.
GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 ru_RU.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE=
 setting
# supports more than one major kernel version. Currently this is suported b=
y the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION =3D "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT =3D "package_ipk"
# INHERIT =3D "package_tar"
INHERIT +=3D "rm_work"

# Add the required image file system types below. Valid are=20
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
IMAGE_FSTYPES =3D "jffs2 tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE =3D ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG =3D "yes"

# Uncomment these two if you want BitBake to build images useful for debugg=
ing.=20
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
# Also note that OE now produces -dbg packages which contain debugging symb=
ols.
# DEBUG_BUILD =3D "1"
# INHIBIT_PACKAGE_STRIP =3D "1"

# Uncomment these to build a package such that you can use gprof to profile=
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
e=20
# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
PARALLEL_MAKE =3D "-j4"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS =3D "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from C=
VS.
#CVS_TARBALL_STASH =3D ""

# Uncomment this if you want to install shared libraries directly under the=
ir SONAME,
# rather than installing as the full version and symlinking to the SONAME.
# PACKAGE_SNAP_LIB_SYMLINKS =3D "1"
MACHINE_EXTRA_RDEPENDS =3D "tslib"

--Boundary-01=_V2MwK1/pnG62kud--

--nextPart1725860.FIa2O3cQcV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrAzZsACgkQRM6pQpltKE5pOwCdFh9efQXSKRe9KWrr/+yhB/p/
lyIAoMHdgicg474QCryXryjXwkwjDNJ+
=+jBF
-----END PGP SIGNATURE-----

--nextPart1725860.FIa2O3cQcV--
