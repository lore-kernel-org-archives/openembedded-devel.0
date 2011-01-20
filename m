Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PfzTk-0006nG-RM
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 19:43:30 +0100
Received: by wyb40 with SMTP id 40so931525wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 10:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=U1JsMKvjZWzlM3xlr9mepTG2HHnWSop8JsPGfHqyag8=;
	b=jq8KTKjae+Ry1zS3j47QQLGV1CGqNu9sSlGWfrHoBQBdte0UalzJ8btYqmzIxK5moQ
	u/4HcMv+rMDgklCA7VsveShC4/FBVyG+0H/aKjJ0RMGw8qEMfxwEmsu6AUZu+rUX6+Bv
	kmEfBZJ7Kxm2ZWZZGAQolYgNK5hSAr0JbHVx0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rjUY/IGKKHB1q4yDbYXXlGyuB63fglUn/bcanYAXnv4Ve05S4DQ6dTZzVi0TiQkxMl
	RC5glw+mspcImushCQEtggru0fsCymYipq9BmMIrsdHph2aD/m2QEOmTOuJF6P37T4Nr
	HJ/h+1wun2XSZGB5MAixz+nh2Teh+n79AeKfk=
MIME-Version: 1.0
Received: by 10.216.177.9 with SMTP id c9mr2333521wem.34.1295548967055; Thu,
	20 Jan 2011 10:42:47 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 20 Jan 2011 10:42:47 -0800 (PST)
Date: Thu, 20 Jan 2011 13:42:47 -0500
Message-ID: <AANLkTimt1FsKDbdPn5tKGB_u99vcqKnyCum7LHK55XkX@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for 2011-01-10 to 2011-01-17
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
X-List-Received-Date: Thu, 20 Jan 2011 18:43:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2011-01-10 to 2011-01-17

Ahsan, Noor (1):
  packaged-staging.bbclass: bug fix in ipk file name generation for searchi=
ng

Andrea Adami (7):
  kexecboot: bump to e951750b09eb0e1ba81f1bf71d6108c8d3288f91
  linux-kexecboot: bump PR to follow kexecboot upgrades.
  kexecboot-cfg: show DISTRO and MACHINE in the label.
  kexecboot: increase delay before device detection for Zaurus.
  linux-kexecboot: add c7x0 defconfig for 2.6.37.
  linux-kexecboot: bump PR after kexecboot changes.
  linux-kexecboot: add akita defconfig for 2.6.37.

Andreas Oberritter (3):
  gcc: replace unconditional SRC_URI_append with SRC_URI +=3D
  libcap2: fix build with and without libpam
  unpack.py: add SRC_URI parameter unpack=3D<bool> (default: true)

Bernhard Reutner-Fischer (14):
  patch.bbclass: conditional patch-tool dependency
  gcc-svn: remove unrelated hunk from patch
  xz:  Configure with --enable-small --disable-lzma-links
  autotools.bbclass: pass distro_imposed_configure_flags
  autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
  autotools.bbclass: use grep -q
  busybox: provide postrm for package mdev
  sane-toolchain-uclibc: use -pipe
  sane-toolchain-uclinux-uclibc: use -pipe
  gcc-svn: redo patch: Handle uClibc locale
  gstd: fix typo in RRECOMENDS
  busybox: simplify handling of busybox-static
  busybox: provide -passwd and -shadow packages
  busybox: simplify update-rc.d OPT handling

Chris Larson (12):
  bitbake.conf: fix quote usage in COMBINED_FEATURES
  procinfo-ng: new recipe, version 2.0.304
  cramfs: add cvs version
  rng-tools: dep on argp-standalone for uClibc
  devmem2: add freescale alignment fixup patch
  devmem2: remove comment of word write from fsl patch
  argp-standalone: build shared library also
  devmem2: fix patch
  oe.types: add/update docstrings
  oe.types: allow specifying the number base for integer
  oe.types: add floating point type
  argp-standalone: fix patch

Daniele Ricci (6):
  mokopanel: SRCREV bump
  mokosuite2: SRCREV bump
  libmokosuite: SRCREV bump
  mokomessages: new recipe
  libmokosuite: SRCREV bump
  mokomessages: SRCREV bump

Denis Carikli (2):
  midori_git : remove DEFAULT_PREFERENCE =3D "-1"
  xkeyboard-config_git: remove DEFAULT_PREFERENCE =3D "-1"

Enrico Scholz (1):
  gdbm: use full qualified permissions for chmod operations

Eric BENARD (10):
  linux-libc-headers_2.6.37: fix SRC_URI
  busybox-1.18.1: add latest fixes
  tslib-git: update to git master
  angstrom-2010: prefer busybox-1.18.1
  busybox: remove 1.17.4
  busybox 1.18.1: add latest fix
  mtd-utils: add 1.4.1
  strace 4.5.20: stable since 04/14/2010 so remove DP=3D-1
  busybox: introduce stable version 1.18.2
  angstrom-2010: prefer busybox 1.18.2

Eric B=E9nard (2):
  devmem2 : fix patch
  busybox 1.18.1 : fix patches

Khem Raj (20):
  mesa-7.9.1: Fix build on uclibc
  linux-ixp4xx.inc: Add DEPENDS on zd1211-firmware
  slugos.inc: Use bluez4 as default provider for bluez-libs
  gcc-4.5: Get few more fixes from linaro and upstream gcc-4_5-branch
  eglibc: Configure based on DISTRO_FEATURES_EGLIBC
  ti-linux-driver-examples_git.bb: Remove deprecated usage of 'patch' url p=
ara
  eglibc-options.inc: Account of DISTRO_FEATURES_EGLIBC being not defined.
  gcc-4.5.inc: Disable linaro rev 99456 patch for now
  linux_2.6.37.bb: Add qemuppc to list of supported machines
  run-qemu.sh: Add new commandline arg to specify image
  ltp_20100831.bb: Fix deprecated usage to specify patch in SRC_URI
  bison: Fix build on uclibc
  python: Fix configure tests when using --enable-ipv6
  uclibc-git: Get latest patches for protected symbols
  sane-toolchain-uclibc.inc: Use -O2 for powerpc targets
  tgt_1.0.12.bb: Fix build on uclibc
  uclibc_git.bb: Enable UCLIBC_USE_NETLINK and UCLIBC_SUPPORT_AI_ADDRCONFIG
  uclibc-initial_git.bb: Use install_startfiles to generate startup files
  ucslugc.conf: Bring it forward to use sane-toolchain
  linux-2.6.37: Make QEMU machines all use 2.6.37 as default kernel

Klaus Kurzmann (3):
  cornucopia.inc: bump SRCREV for latest fixes
  fsodeviced_git.bb: remove do_configure_prepend with the now unneeded i2c =
hea
  task-shr-feed: add ttf-droid

Koen Kooi (16):
  ntp: cleanups
  ntp-ssl: fix PACKAGES
  u-boot-sakoman: move to 2010.12
  linux-omap: move to 2.6.37 final
  ti-cgt: add 7.0.4
  linux-omap 2.6.37: check in updated overo patch
  angstrom: sync with meta-angstrom layer
  angstrom next: catch up with .37-rc8 -> .37 linux-omap change
  angstrom-task-gnome: add cron and ntpdate
  lmsensors-apps: update to 3.2.0
  lmsensors-apps: remove 2.10.1 and rename files/ dir
  sensors-applet: update to 2.2.7
  mplayer svn: bump SRCREV, refresh patches
  ffmpeg svn: fix hardfp bug
  hal 0.5.15+git: bump SRCREV to fix a segfault
  pidgin: update to 2.7.9

Lars Michelsen (1):
  Fix building of package live555

Martin Jansa (35):
  linux-2.6.34: remove c7x0 patch from SRC_URI override as that file was re=
mov
  linux-2.6.34: upgrade to longterm 2.6.34.8 and update openmoko and shr pa=
tch
  fso-autorev: drop libeflvala as it's in EFL repository now
  e-base: bump EFL SRCREV a bit again to drop libeflvala patch
  mesa: add new 7.10 version, with D_P -2
  elmdentica: add patch for azy api change from r56034
  boost-1.45.0: force ARM mode for now, thumb makes ld to buffer overflow
  e-wm: bump SRCREV a bit more than EFL_SRCREV is now
  xorg-data: obsolete old versions
  xorg-font: obsolete old versions
  xorg-doc: obsolete old versions
  xorg-proto: obsolete old versions
  xorg-driver: obsolete old versions
  xorg-util: obsolete old versions
  xorg-xserver: obsolete old versions
  xorg-lib: obsolete old versions
  xorg-app: obsolete old versions
  removal: announce old xorg recipes removal
  xorg: new versions 2011-01-11
  xproxymanagementprotocol: drop PROVIDES xproxymngproto and update other r=
eci
  xorg: new versions 2011-01-12
  python-pyrex: move patch used only in python-pyrex to own directory inste=
ad
  tsmd: bump SRCREV as playya requested
  python-native: drop old versions 2.6.1 and 2.6.4, remove unneeded python-=
nat
  linux-2.6.34: drop DRM patches from shr.patch
  fso-specs,libfso-glib,libfreesmartphone-glib: bump SRCREV
  libfreesmartphone-glib: fix SRCREV
  tslib: relax EV_VERSION check as 2.6.37 has slightly newer EV_VERSION, bu=
t w
  freesmartphone: bump cornucopia SRCREV, needed for versions compatible wi=
th
  frameworkd-config-shr: bump SRCREV for new om-gta01 frameworkd.conf
  frameworkd: drop fso-abyss from om-gta0* RDEPENDS and disable ogsmd in de=
fau
  frameworkd: merge frameworkd-config-shr_git.bb to frameworkd_git.bb and c=
lea
  frameworkd: fix init.d script permissions and force frameworkd-config-shr=
 re
  task-shr-feed: fix ttf-droid target package names for RDEPENDS
  frameworkd: install ogsmd configs for machines with enabled ogsmd (not us=
ing

Michael 'Mickey' Lauer (8):
  fsodeviced: i2c-tools no longer a dependency; everything necessary includ=
ed
  dbus-cxx: new recipe; c++ bindings for dbus
  mm-common: add BBCLASSEXTEND
  libsigc++-2.0: add new version 2.2.8; this one features BBCLASSEXTENDS
  dbus-cxx: fix typo in BBCLASSEXTEND
  commoncpp: add version 1.8.1
  sflphone-common: fix SECTION
  vala: add 0.11.4.1

Michael Smith (1):
  fconfig 20080329: upgrade from 20060419

Otavio Salvador (8):
  slang: add 2.2.2
  newt: add 0.52.12
  i586-generic: define udevdir and OLDEST_KERNEL
  dbus: fix init script if $prefix is empty
  hal: use INC_PR
  hal: fix init script if $prefix is empty
  hal: drop git and 0.5.9.1 versions since no distro uses them
  slang: fix 2.2.2 compilation with uclibc

Paul Menzel (4):
  libcap, libcap2: use automatic packaging to fix QA errors
  Convert `libcap_1.10` to new staging system by removing `do_stage()` [1].
  vdr: update to 1.7.16 from 1.7.10
  libsigc++-2.0_2.2.8: add checksums

Simon Busch (2):
  initscripts-shr: add modified version of halt/reboot scripts for palmpre =
mac
  shr-image: we use devtmpfs on palmpre machine - so no dev manager!

Steffen Sledz (2):
  alsa-lib: fix packaging error
  epiphany-2.30.2: unbreak build by disabling CA files

Thomas Zimmermann (8):
  libzrtpcpp: update to 1.5.3 as 1.4.6 doesn't compile anymore
  ccrtp: update to version 1.7.2
  libzrtpcpp: update to 1.6.0 as sources of 1.5.3 were removed today
  ccrtp: update to 1.8.0 as sources of 1.7.2 were removed today
  dbus-c++: update to latest SRCREV
  dbus-c++: add patch to fix the Makefile
  Revert "dbus-c++: add patch to fix the Makefile"
  sflphone-common: add recipe for sflphone (SIP and IAX client) server part

Tom Rini (15):
  autoconf: Really only build in desired SUBDIRS
  ltrace: Rework sysdeps dependencies
  site/powerpc-common: Drop ac_cv_func_dlopen
  apache2: Fix invoking buildconf
  e2fsprogs: Fix chattr update-alternatives location
  linux-jlime-jornada6xx 2.6.25: Move to nonworking
  busybox-static: Look in ${P}:${BPN} before the main busybox
  p2020ds: Setup for xserver-xorg
  mpc8315e-rdb: Setup for xserver-xorg
  linux: Add CONFIG_MODULES to qemu{ppc,sh4,mips64}
  iscsi-target: Update for newer kernels
  uclibc: Enable UCLIBC_USE_NETLINK and UCLIBC_SUPPORT_AI_ADDRCONFIG
  linux: Add CONFIG_MODULES to qemush4/mips64
  kernel,cml1.bbclass: Move menuconfig to cml1
  kernel.bbclass: Drop comment about kernel_do_configure

V=EDctor Manuel J=E1quez Leal (1):
  scons: add EXTRA_OESCONS


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2011-01-10 to 2011-01-17


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


