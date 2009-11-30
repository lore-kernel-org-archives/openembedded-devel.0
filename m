Received: from mail-ew0-f210.google.com ([209.85.219.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NFAkK-0000qQ-1I
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 19:13:15 +0100
Received: by ewy2 with SMTP id 2so1627899ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=6BvRri7itnwfUXADtTold+8U7aHKNa3rYtnb2Kes9g0=;
	b=HV4S+4k3pV/vzLqxIzsUXLzp8QvYjAgHrv866sQs8xEN9jhtLXo63ALDNrxSo2KdFh
	NITNnbE+MIy7/2RvNdxSxwGLQG9GblIQLOISYqbWn/C1CvTamJ1Utm2xK8PlUAuUwlba
	E5nagiQV30pwt4pp+2mPPhClj7TCioLV5eYpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AzW5a2hdmhZGFd/ZrbonIIK+3ghmPKkyf0TIfGAGwnSK4FQ6ObE+HtHJeAnLZhtrNW
	TneoQMbYN/3l8TzM0jOdb1AK3I9YX8/d40uXes+J9cPkuoFU4p2teX/FchEQ1EmFVMQk
	CPMM3q4YgQPAiDsOn2epEIkGMiOPo8JFpyMBM=
MIME-Version: 1.0
Received: by 10.216.93.68 with SMTP id k46mr1576227wef.161.1259604697932; Mon, 
	30 Nov 2009 10:11:37 -0800 (PST)
Date: Mon, 30 Nov 2009 13:11:37 -0500
Message-ID: <f96d234e0911301011n6dfa9cc3n272356a84412f051@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.210
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-11-23 to 2009-11-30
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
X-List-Received-Date: Mon, 30 Nov 2009 18:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-11-23 to 2009-11-30

Andrea Adami (2):
  nandlogical: rework klibc statical recipe pointing to staged mtd headers =
ins
  Revert "palmtop.bbclass: fix QA of plugins wrt packaging of -dbg files"

Benjamin Schieder (2):
  fltkclock, fltkhackdiet, fltkwwpointcal: new fltk apps from Benjamin Schi=
ede
  add package fltkcocktailbar

Cliff Brake (2):
  docs: fix type in Makefile
  usermanual: add entries to .gitignore for ps, etc

David-John Willis (5):
  blueman: Add 1.21
  libpam-base-files: Start to add default config files for libpam
  shadow: Add version 4.1.4.2 and checksum.
  sudo: Add 1.7.2p1 and enable PAM support by default in newer sudo builds.=
 su
  angstrom.inc: Add DISTRO_FEATURES =3D "pam" to Angstrom distro.

Frans Meulenbroeks (3):
  apache2: upgraded to 2.2.14
  linux-kirkwood: added sound driver for openrd-client

Graeme Gregory (3):
  bluez4.inc : remove DISTRO hacks as they arent really needed its ok to ad=
d t
  gcc-4.3.3.inc : replace objc patch with undamaged one from gcc-patches

Henning Heinold (14):
  uclibc: clean up uClibc for the new oe features mainly done Richard Purdi=
e
  libpam: fix building on uClibc
  libvorbis: update to version 1.2.3
  libogg: update to version 1.1.4
  libtheora: update to version 1.1.1
  uclibc: add O_CLOEXEC support needed for newer pulseaudio
  pulseaudio: make compileable under uclibc again
  eina: fix building on uClibc
  mplayer: fix install for micro
  proxy-libintl: fix install for micro and simply stage
  mplayer-common: fix arch and install
  guile-native: simplify the .inc file
  gnome-games: fix sdl in configure.ac
  libsdl-mixer: remove defpref -1 from version 1.2.10 because 1.2.11 is now=
 de

Jeremy Lain=E9 (3):
  sane-backends: remove ${sysconfdir}/sane.d/qcam.conf from conffiles
  sane-backends: add version 1.0.20
  linux.inc: create DEPLOY_DIR_IMAGE in do_devicetree_image

Klaus Kurzmann (14):
  e-wm_svn.bb: split ${sysconfdir}/xdg/menus/applications.menu into it's ow=
n p
  sane-srcrevs-fso.inc: bump fsodeviced and others to get new alsa stuff
  fsodeviced: adjust path in initscript - fsodeviced moved to /usr/sbin
  task-shr-minimal: add e-wm-menu-shr
  sane-srcrevs.inc: bump mokonnect to 112
  sane-srcrevs-fso: bump rev for libframeworkd-glib
  task-shr-feed: add fltkcocktailbar and babiloo-efl
  phoneuid: conform with the recent changes in upstreams Makefiles
  phonefsod: conform with latest autotools configuration changes in upstrea=
m
  task-shr-feed: add make
  sane-srcrevs-fso: bump fsodeviced to get the alsa player ringtone fix
  python-phoneutils_git: fix DEPENDS
  exhibit: fix SRC_URI - exhibit moved to OLD

Koen Kooi (27):
  pixman git: bump SRCREV to 0.17.3 and add support for overlapping blits
  xserver-xorg: use overlapped blts, needs pixman support, hence not defaul=
t
  gcc 4.3.4: add objective-c patch for eabi and add a package for libobjc
  gcc 4.3.3: fix patch and packaging
  gcc 4.3.3: ...and bump PR
  opkg-target,sdk: bump SRCREV
  Angstrom: switch to opkg-nogpg-nocurl per RFC on the angstrom-devel maili=
ngl
  flac: new style staging
  flac 1.1.2: fix for new style staging
  webkit-efl: this is 1.1.11, not 0.1
  eve: eve-themes is mandatory, so add it to RDEPENDS
  angstrom-glibc: switch back to -O2
  linux-omap 2.6.29: add smsc patches and update overo defconfig
  angstrom feed configs: rrecommend opkg-nogpg-nocurl
  angstrom-feed-builder: add more stuff
  angstrom feed sorter: add more boards
  angstrom task gnome: clean up package list a bit
  libpam-base-files: polkit is provided by policykit itself
  pkgconfig bbclass: also sed out bogus includes
  inkscape: add 0.47
  gnome-mplayer: fix typo
  e-wm: stop RRECOMMENDING e-wm-menu e-wm-menu-shr: stop RPROVIDING it
  checksums.ini: add gdm checksum
  gdm: tweak do_install a bit
  linux 2.6.24: add support for smartq5 device (machine.conf will follow la=
ter
  e17: bump SRCREV and start adapting it to new-style staging

Kristoffer Ericson (1):
  Fix so package_tar yet again produces tar packages. This closes bug 5339.=
 Th

Liam Girdwood (1):
  pulseaudio: add version 0.9.21

Mario Domenech Goulart (7):
  chicken-native: removed
  chicken: added support for cross compilation with chicken
  chicken: added support for INC_PR for chicken recipes
  chicken: fixed installation dir
  chicken, chicken-cross: added translator-cross.patch for chicken 4.2.0
  chicken: Added recipes for chicken 4.2.10
  chicken: path and dependencies fixes for chicken recipes

Martin Dietze (8):
  linux-mtx-[12]-2.4.27: support bash4 for oldconfig
  conf/distro/nylon.conf: fixed some broken preferred versions
  e2fsprogs-libs.inc: removed dependency to unsupported util-linux-ng for n=
ylo
  gcc-configure-common.inc: remove objc from the list of supported language=
s f
  mtd-utils.inc: flexible handling of ${mtd_utils} in do_stage and do_insta=
ll
  opkg_svn.bb: added missing dependency to openssl to recipe
  opkg-nogpg_svn.bb: link without `-Wl,--as-needed' for nylon

Martin Jansa (14):
  module-strip.bbclass: fix typo, last PKGDEST should be PKGD too
  kernel.bbclass, linux.inc: move do_deploy task after do_package
  kernel.bbclass: force do_deploy call before do_build
  linux-openmoko: bump PR to get module_strip fix
  task-shr-feed: add new packages fltkclock, fltkhackdiet, fltkwwpointcal
  preferred-shr-versions: remove preferred version of pixmap, increase DEFA=
ULT
  shr.conf: merge minimal.conf to shr.conf directly, remove all preferred-x=
org
  fltk2: switch to build directly from svn, as that old snapshot is not ava=
ila
  shr: use newer classpath and jamvm
  babilo-efl: switch SRCREV -> SRCPV, formal change as bzr returns sortable=
 re
  shr: bump linux-libc-headers to 2.6.31, use EFL_SRCREV from sane-srcrevs
  linux-openmoko-2.6.31: enable NFS and INOTIFY_USER for gta02
  om-gta02: create also ubinized image from ubifs

Michael 'Mickey' Lauer (11):
  libnl2: change includedir to not step over libnl1; also convert to new st=
agi
  sane-toolchain.inc: bump linux-userspace-headers to match with bumped egl=
ibc
  fsogsmd: no longer requires libxml2 nor broadband info
  libfsoframework: add missing dependency on alsa-lib
  vala: add 0.7.8.2 release
  fsodeviced: explicitly enable the rfkill and canberra player plugins
  fsodatad: new recipe; FSO data storage service fsomusicd: new recipe; FSO=
 mu
  fsolocationd: renamed recipe; source was fsogpsd
  fsomusicd: add SRCREV

Otavio Salvador (1):
  Revert "chicken.inc: fix install and compilation issues"

Richard Purdie (1):
  uclibc-initial: Convert to us do_install for staging. 0.9.30.1 is tested =
and

Robert P. J. Day (1):
  usermanual: Update usermanual bitbake references to 1.8.18.

Roger Monk (1):
  Hawkboard: Add Hawkboard machine and kernel

Sebastian Krzyszkowiak (1):
  shr-autorev: add opimd-utils to AUTOREV

Sebastian Spaeth (13):
  navit: Do not set /proc/sys/vm/overcommit in an app launcher, especially =
not
  calc: add v0.0.3 recipe
  initscripts-shr: add glamoFIFOtweak to Xsession.d
  sane-srcrevs.inc: bump 'calc' sane rev to latest release
  initscripts-shr: remove runtime glamo tweak. Has been pushed into andy-tr=
ack
  sane-srcrevs.inc: bump linux-openmoko-shr-devel
  bootchart-lite: Use mkdir rather than install in postinst.
  babiloo-efl: add tar-based recipe in addion to _bzr variant.
  babiloo-efl: don't prefer _bzr version over releases
  task-shr-feed: add babiloo-efl, remove hermining.
  babiloo: upstream changed SRC_URI

Steffen Sledz (2):
  u-boot-2009.03: fix flash layout for hipox machine
  u-boot-2009.03: disable features to fit size requirements for hipox machi=
ne

Steve Sakoman (6):
  flac: disable xmms plugin since it breaks the build
  gdm: update to 2.28.1
  gnome-mplayer: bump SRCREV
  gnome-system-monitor: fix typo
  system-tools-backends: fix packaging
  totem: don't disable python

Thomas Zimmermann (15):
  policykit: fix depends it requires intltool >=3D 0.36.0
  xournal: add version 0.4.5 and include .desktop file from source. Fixes S=
HR
  atd-over-fso: override RPROVIDES, RCONFLICTS and RREPLACE for -dbg and -d=
ev
  task-shr-feed: add transmission to the feed, fixes SHR bug #745
  task-shr-feed: add xf86-input-tslib to the feed, with this TS can be cali=
bra
  obexd: add version 0.19
  babiloo: new recipe
  openttd: add version 0.7.4-RC1 and sound and graphic files from openttdco=
op.
  openttd: correct path for config file
  scummvm: copy config from openmoko to shr
  scummvm: update version to 1.0.0
  neomis: new recipe
  numberx: new recipe
  task-shr-feed: add gtkmm, solves SHR bug #546
  di: new recipe

Bugs fixed:

bug_id resolution        short_desc
3470 FIXED       bitbake doesn't work when using a x86_64 kernel with
a 32bit userspace
1182 FIXED       Kernel modules are not stripped before they are packaged
1904 FIXED       glibc-intermediate build failure (icecc compile farm)
2393 FIXED       meta-toolchain/sdk does not build.
4203 FIXED       gcc-cross-sdk-4.1.2-r11: task do_compile fails if
toolchain target exists
5149 FIXED       e2fsprogs-libs fails to compile for RELEASE
5339 FIXED       package_tar no longer produces packages
4179 FIXED       external toolchain generated by meta-toolchain
depends on the original build location

Bugs opened:

bug_id resolution        short_desc


