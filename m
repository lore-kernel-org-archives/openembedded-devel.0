Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Nh3iq-00032i-H6
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 17:23:02 +0100
Received: by ewy4 with SMTP id 4so440302ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 08:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=2VF6uL00yr+9mDvZiv3vMqMcHKXYHtcOBpjf0oucMEU=;
	b=wmYOfmwRts5syq3/yAt5jLPKXNHbKECM6C1QHjVNY969Y+tvRows4ByN/AK0Vqq9oc
	LtRa4mg6qdV5hGGrxCEgcJULlQqC0rHipwJdb4VKvjC3CkAE/qwsBaaKFLrwJ094727J
	qaGmqw2FLvloImUhxvnph/K/esGwbIqP5HizE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xFjyn/zwfuugNIcsV47Z5y/UtEEk35mV7ZbfUUmNrvEHnVqibdbzrGWIiFmHseg/Ic
	zrTdMPUX7257YrHBzKrgT0YoONN4jqY4VzOJqC3WAn/tUkyx34oHMlcnoW1qyqpn+jlS
	rC+6EEQUo2C0aEflCacfrLi+0Qgfv5wCboLM8=
MIME-Version: 1.0
Received: by 10.216.176.143 with SMTP id b15mr3163209wem.155.1266250818495; 
	Mon, 15 Feb 2010 08:20:18 -0800 (PST)
Date: Mon, 15 Feb 2010 11:20:18 -0500
Message-ID: <f96d234e1002150820x53f95006gd05cf2230f36d49c@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2010-02-08 to 2010-02-15
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
X-List-Received-Date: Mon, 15 Feb 2010 16:23:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog 2010-02-08 to 2010-02-15

Andrea Adami (5):
  linux-kexecboot_2.6.32+2.6.33-rc6: minor defconfig cleanings for Zaurus
  zaurus-kernels: move the kernel size check to linux-kexecboot.inc.
  initramfs-kexecboot.inc: remove RDEPENDS_kernel-base = "kernel-image"
  initramfs-kexecboot-image: remove deprecated device-table.
  kexecboot.inc: add more comments. Minor cleanings.

Antonio Ospite (1):
  meta-toolchain: Run rmdir only if empty dirs are actually found.

Benjamin Schieder (2):
  fltkspacetrader: update to revision 95
  fltkspacetrader: version 1.0-stable has been tagged. SHR use it with AUTOREV

Bernhard Reutner-Fischer (16):
  quilt: use builtin date routines
  flex: remove version specifics from generic inc
  busybox: trim superfluous trailing whitespace from .inc file
  git: remove version specifics from generic inc
  uclibc-git: Typo fix in comments.
  binutils-2.20: Forward port binutils-x86_64_i386_biarch.patch to 2.20
  task-base.bb: use uniform test for set
  local.conf.sample: Document proxy setup.
  gmp: use GNU_MIRROR in SRC_URI
  base.bbclass: handle xz compressed files and tarballs
  class_pkgconfig.xml: Fix Typo.
  gmp: set SRC_URI name
  busybox: use .tar.bz2
  busybox: remove orphaned patch checksums
  busybox: some more !getopt_long fixes in hwclock.sh
  autoconf: set SRC_URI name

David-John Willis (1):
  xf86-input-tslib 0.0.6: Add patch for XOrg 1.7.4 to fix crashes on XGetPoint

Denis 'Gnutoo' Carikli (13):
  empathy 2.28.2: added libunique dependency to make it configure(now: compila
  entrance: rebased config.db
  entrance: run autopoint in order to cope with lacking ./config.rpath
  eee701 machine config: fix to use xorg instead of kdrive
  e-image-core: change hardcoded kdrive to the correct variables
  bug.conf: added screen resolution
  wesnoth 1.6.5: package the low campaign in its own package
  bug.conf : depends on kernel-modules
  wesnoth: only compile tiny GUI when screen is smaller than 800x480(smallgui)
  task-base : bump PR because bug.conf changed(details below)
  autotools.bbclass: fix issue with native and sed
  illume-image: comment additional phone functionality(zhone already commented
  Revert "wesnoth: only compile tiny GUI when screen is smaller than 800x480(s

Frans Meulenbroeks (11):
  perl*: fixed URI
  wt: removed do_stage
  wt3: build outside the source tree
  wt3: added recipe for 3.1.0a
  linux-kirkwood: made utf8 the default NLS
  lirc: removed old style staging
  linux-2.6.32 eee701 added CONFIG_DRM_I915_KMS=y
  linux-2.6.32i eee701 fixed intelfb driver.
  xfce46-image added some missing packages
  linux_2.6.32:  eee701:  removed fb devices from defconfig

Graeme Gregory (12):
  u-boot_git.bb : add actual omapzoom2 u-boot from TI tree.
  x-load_git.bb : add support for omapzoom2 in x-load
  linux-omap-zoomsync_2.6.31.bb : update the defconfig and add a logo
  linux-omap_2.6.29.bb : default kernel for the omapzoom as well
  gconf_2.26.2.bb : add --enable-gtk to ensure consistant packages
  omapzoom.conf : this is an omap3 device using same kernel as most others
  omap3-mkcard.sh : make fdisk parsing a little more robust
  omap3-mkcard.bb : add a recipe for mkcard.sh so we can install on targets

Guo Hongruan (1):
  u-boot: remove 'inline' from functions with weak attribute.

Henning Heinold (1):
  gpsd: update to version 2.39

Henry von Tresckow (1):
  initramfs-kexecboot-image : Unset FEED_DEPLOYDIR_BASE_URI to allow builds wi

Khem Raj (4):
  u-boot_git.bb: Do not apply u-boot-remove-inline-of-weak-functions.patch to
  uclibc-git: Add UCLIBC_HAS_NFTW to config file.
  uclibc-nptl: Bump SRCREV to latest tip
  gcc-svn: Bump SRCREV.

Klaus Kurzmann (5):
  sane-srcrevs.inc: bump rev for pyphonelog to a revision which should build a
  sane-srcrevs-fso.inc: bump rev of libframeworkd-glib
  sane-srcrevs-fso.inc: bump rev of libframeworkd-glib
  openssh: allow empty passwords in sshd_config for SHR because users insist o
  sane-srcrevs-fso.inc: bump rev of libframeworkd-glib

Koen Kooi (12):
  xinput-calibrator: run through oe-stylize and recipe sanity
  shadow: run pwconv and grpconv in postinst
  Revert "u-boot_git.bb: Do not apply u-boot-remove-inline-of-weak-functions.p
  sane-srcrevs: bump opkg native to r521 to get better error messages and conf
  angstrom-uboot-scripts: add more samples
  angstrom: prefer usbutils 0.86
  perl 5.8.8: add missing checksums
  attr: add 2.4.44 acl: add 2.2.49 udev: add 151
  linux.inc: extend UDEV_GE_141 config munging logic to match official udev gu
  qmake2: convert native and sdk to use BBCLASS_EXTEND and new-style staging
  angstrom: prefer udev 151
  gnome-doc-utils: skip generation of docs to avoid weird python error

Marcin Juszkiewicz (20):
  nokia900: use zImage kernels
  linux 2.6.28: fix nokia900 build
  gcc csl 2007q3: import header hack from Poky to get glibc 2.5 built
  glibc 2.5: do not use asm/page.h header (taken from glibc 2.6.1)
  maemo5-compat: added from Jalimo repository
  maemo5-compat: make it work and update toolchain to about same as SDK uses
  glib-2.0: added 2.20.3 for maemo5-compat distro
  glib-2.0: handle Maemo5-compat in same way as chinook-compat
  checksums.ini: added some new entries
  freetype: added 2.3.9
  file: added 5.04 (WIP)
  glib-2.0 2.20.3: added forgotten patches
  glib-2.0: added checksums for 2.20.3
  libpng: added 1.2.37 for Maemo5-compat
  checksums.ini: another set of checksums
  linux 2.6.27: update to latest stable
  linux 2.6.32: update to latest stable
  check-kernel-updates: simple shell script to check for versions of stable ke
  maemo5-compat: changed some versions
  linux 2.6.20: refreshed NHK-15 patches to build after stable update

Marco Cavallini (2):
  MAINTAINERS: little update to my profile
  ronetix-pm9263/xorg.conf: Disabled mouse in configuration

Marcos Amorim (1):
  Perl-native: Fix URI

Martin Jansa (29):
  babiloo-efl: move older versions to obsolete
  linux-openmoko-2.6.32: upgrade to 2.6.32.8, drop applied patch
  zhone: remove unneeded dependencies, update rev
  task-shr-feed: drop omview
  libeflvala: SRCREV->SRCPV is safe with svn recipes
  linux-openmoko-2.6.32: bump revision and update gdrm-2.6.32 patches
  xorg: add name=archive to SRC_URI in include files
  shr: use gcc-4.4.3 instead of 4.4.2
  task-shr-feed: add glamo-dri-tests only for om-gta02
  linux-openmoko-2.6.32: bump revision and update gdrm-2.6.32 patches
  preferred-shr-versions: use newer poppler (needed by epdf)
  sane-srcrevs: bump EFL, needed for libeflvala (moved to EFL repository in 46
  EFL: some packages were moved from trunk/OLD to OLD, update SRC_URI
  epsilon: add ecore_data to compile latest epsilon
  python-gst: update python-path.patch
  vala.bbclass: dont put config.vapi to staging
  xorg: add latest xorg packages for 2010-02-10 and xserver-xorg git recipe
  xorg-xserver_git: remove AC_CHECK_FILE check
  om-gta02: install only really important kernel-modules
  shr: add bluetooth to DISTRO_FEATURES to get bluetooth modules, remove pci,
  EFL: bump SRCREV a bit, remove applied patch
  shr-image: move some stuff from task-shr-minimal to task-shr, drop unneeded
  task-shr: catch up with upstream renaming
  task-shr-feed: add older mickeyterm to feed, newer mterm2 should be installe
  task-cli-tools-python, illume-image, fso-image-nox: catch up with upstream r
  sane-srcrevs-fso: bump libframeworkd-glib, needed by newer libphone-ui
  task-cli-tools-python: use older python based cli tools as task name suggest
  sane-srcrevs-fso: bump mterm2 (missing config.vapi)
  sane-srcrevs, fso-autorev: mickeydbus was renamed to mdbus

Michael 'Mickey' Lauer (7):
  vala: 0.7.10 -> 0.7.10.1
  vala: 0.7.10.1 -> 0.7.10.2
  libeflvala: has moved from FSO git to EFL svn
  freesmartphone: rename mickeydbus(2) to mdbus(2), fso-term is now called mte
  fso2-console-image: catch up with upstream renaming
  vala: 0.7.10.2 -> 0.7.10.3

Mike Westerhof (1):
  slugos.conf: add PREFERRED_PROVIDER for update-alternatives fixes build fail

Phil Blundell (1):
  sanity: correct misleading message about location of TMPDIR

Robert Schuster (4):
  swt-gtk.inc: Properly give OE's LDFLAGS to makefile. swt3.3-gtk: Increased P
  swt3.3-gtk 3.3.1: Removed. swt3.4-gtk-hildon 3.4: Removed swt3.4-gtk 3.4: Re
  swt-gtk.inc: Removed need for specifying SWTVERSION, now done programmatical
  swt3.5-gtk 3.5.1: Added new version.

Ruud Althuizen (2):
  linux-ea3250: New recipe
  ea3250.conf: New machine config

Sebastian Krzyszkowiak (1):
  webkit-efl: don't include error page in package

Stanislav Brabec (4):
  libx11: Apply keysymdef_include.patch referring to target staging only for l
  gtk+-native: Added missing DEPENDS, don't build print backend that would req
  smartmontools: Updated to version 5.39.1.
  wwwoffle: Updated to version 2.9f.

Stefan Schmidt (2):
  tzdata_2010b: Add newest tzdata

Steffen Sledz (4):
  subversion-1.6.5: missing dependency to sqlite3 added
  busybox: use machine specific hwclock.sh for hipox
  udev-141: we don't like persistent net interface rules at hipox machine
  netbase: machine specific interface config for hipox

Thomas Zimmermann (5):
  evopedia: new recipe
  e-wm: fix flaunch in illume (SHR Bug: #821)
  task-shr-feed: add mpd (solves SHR bug: #946)
  evopedia: update to 0.3.0-rc3
  vagalume: update 0.8.2 to 0.8.3

Tom Rini (1):
  task-sdk-bare: Drop locale stuff, bump PR

Vaudano Luca (1):
  babiloo-efl: add final version 2.0.9-10

Bugs fixed:

bug_id resolution        short_desc
5322 FIXED       rt3070 kernel module misses driver file (unusable)


