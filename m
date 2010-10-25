Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PARX7-0006hH-9o
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 20:12:35 +0200
Received: by ewy2 with SMTP id 2so1729617ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=uHMD3HZrOdOczkLz6QvfKnyUj4ZqqoebaIPxYEZg1T4=;
	b=B7Hi5l+Mrqr0dcptoPqDr83jySDLFnmNF6M0P9FF06d0CKm3xB35O7dX4UJoFuIGTA
	o5a4bDM0QqM83/khJMtm0qI6blLFN7aJ8E+OqT35Ks67cxNpn4DvmTzagMtdr+7z3whB
	1y7WqsG6s32evyd18cb+bMeooC83mBubMYJMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=hGRses7Pe5iqTe1DzYZpUkib3veaM9qgYTEn8EkgVD1aPctwrUlv698uVD750ELD5+
	9UEo7CqJnfrWnmoMpgdTjSpsMlK1+W4JMuTT5nct3IsAKCo5Gp0v2G3G7iYUhvoXKgu3
	nBNPQmOQuoRCtXXPSTtGAmyzTNl6XXZtTM0hg=
MIME-Version: 1.0
Received: by 10.216.16.85 with SMTP id g63mr663470weg.114.1288030309085; Mon,
	25 Oct 2010 11:11:49 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Mon, 25 Oct 2010 11:11:49 -0700 (PDT)
Date: Mon, 25 Oct 2010 14:11:49 -0400
Message-ID: <AANLkTimj3A7cmJ-DFwXGQv6BquQUs9jNa9JbCB4NiG2S@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog for 2010-10-18 to 2010-10-25
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
X-List-Received-Date: Mon, 25 Oct 2010 18:12:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-10-18 to 2010-10-25

Anatoly Shipitsin (4):
  remove upstart_0.3.8.bb
  Add rc init files for upstart sysvcompat
  update upstart.inc for fix upstart-sysvcompat
  change upstart-0.3.11.bb to compatible with new upstart.inc

Andrea Adami (19):
  sharprom-compatible: remove unmaintained distro.
  amsdelta-oe.conf: no need to specify preferred-gpe-versions-2.8
  preferred-gpe-versions: remove now unused files.
  zaurus-utils: apply oe-stylize
  kexecboot: split kexecboot-klibc recipe and oe-stylize
  kexec-tools: explicit packaging of kexec and kdump
  initramfs-kexecboot-klibc-image: klibc variant of initramfs-kexecboot-ima=
ge
  linux-kexecboot: set INITRAMFS_IMAGE =3D "initramfs-kexecboot-klibc-image=
"
  sharprom-toolchain: remove now obsoleted/unbuildable toolchain
  sharp-binary-only: remove unused libs/utils for Zaurus
  opie-notes: add preferred version to older inc files like done in .git.
  linux-kexecboot: add 2.6.36 defconfig for c7x0 machine
  linux-kexecboot: synchronize defconfigs for c7x0 and spitz/akita
  linux-kexecboot_git: bump SRCREV to 20101022
  linux-kexecboot_git: fix git srcrev - move to 2.6.37 core
  linux-kexecboot_2.6.24: remove NET from tosa defconfig
  kexecboot: bump git revision to 3e2ea676a39f22160a4a0e55a78b77867bf58dbb
  linux-kexecboot: bump PR to follow kexecboot changes
  linux-kexecboot: readd forgotten kernel logo (needs to be explicitely set=
)

Andreas Mueller (3):
  clutter-gtk: Bump to 0.10.8
  clutter: remove COMPATIBLE_MACHINE
  libchamplain: DEPENDS: add clutter-gtk & sort entries alphabetical

Andreas Oberritter (9):
  directfb-1.4.6: fix packaging
  libsdl-directfb: update to 1.2.14
  libsigc++-1.2.5: convert to new style staging
  automake-1.11.1: omit compilation of pyc files on install
  dvdauthor-0.6.18: initial recipe
  libdvbsi++-0.3.4: initial recipe
  libdvdread: add recipe for version 4.1.3-10 from debian
  libdvdnav: add recipe for version 4.1.3-7 from debian
  libid3tag: patch libid3tag.pc.in into source tree, update recipe

Ash Charles (1):
  linux-gumstix-2.6.15 & gumstix_2.6.5-gnalm1: removed outdated recipes

Ben Gardiner (1):
  distro, toolchain-external: override TARGET_VENDOR with TOOLCHAIN_VENDOR

Chase Maupin (1):
  qt4: replace underscore with dash in library name

Chris Larson (22):
  quilt-native: remove '?' url in _append_build-darwin..
  coreutils-6.0: apply patch for USE_STATVFS
  diffstat: fetch from upstream
  expat: use INC_PR, set acpaths
  expat: set acpaths=3D, not =3D+
  patch.bbclass: avoid traceback for CmdError at resolve
  oe.patch: fix 'd' references
  oe.process: allow passing input into run()
  oe.patch: use oe.process
  oe.patch: don't use dry-run for 'patch'
  oe_libinstall: handle .dylib
  mpfr: update from p3 to p4 patchset
  Various fixes for cp argument portability
  bin/{cp,sed}: Add shell script wrappers for portability
  Use shell wrappers for i386-darwin
  readline-5.2: fix for darwin builds
  openssl: kill version script for darwin
  conf/build: darwin fixups - COMMAND_MODE, -m32, PATH
  oe.patch: use --quiltrc=3D instead of --quiltrc
  oe.patch: fall back to '-' for quiltrc
  libvpx: use the git repository to fetch
  lzma: use oe.process.run

Daniele Ricci (2):
  shr-splash-theme-openmoko: OM2009 SHR splash theme
  tash-shr-feed: add shr-splash-theme-openmoko

David Kozub (1):
  ++dfb: Add a patch to allow compilation with DirectFB 1.4.

Denys Dmytriyenko (3):
  gst-plugins-good: add 0.10.25
  gst-plugins-ugly: add 0.10.16
  toolchain-external: fix circular recursion if TOOLCHAIN_VENDOR is not def=
ine

Eduardo Lima (Etrunko) (12):
  evas: tweak configure options
  epdf: remove ewl/epsilon detection, fix build
  ethumb: add recipe
  elementary: add ethumb as dependency
  task-efl: Add ethumb and elementary to RDEPENDS
  ecore_svn: fix GL configure option
  expedite_svn: depend on Evas GL engine
  task-e-x11,task-angstrom-e: remove entrance
  task-e-x11,task-angstrom-e: add expedite and elementary tests
  eeze: add new recipe
  e-wm: depend on eeze
  eve: update DESCRIPTION and add elementary to DEPENDS

Eric BENARD (1):
  base.bbclass: depend on mercurial-native if SRC_URI contains hg://

Fabiano Fidencio (1):
  ethumb: disable docs in ethumb's recipe and add libexif in DEPENDS

Frans Meulenbroeks (64):
  xmlrpc-c_1.06.41.bb: new recipe
  mythplugins: added sed script to enable lighty modules
  nios2.inc: added missing definitions for TARGET_CC_ARCH BASE_PACKAGE_ARCH=
 FE
  lighttpd_1.4.28.bb: added checksums
  xmlrpc-c: add inherit binconfig
  libtorrent: added xmlrpc support
  transmission_2.04.bb: added checksums
  gsmd.inc: remove useless RDEPENDS_append =3D ""
  directfb_2.18: remove useless LDFLAGS_append =3D ""
  avahi.inc: remove RDEPENDS_append =3D ""
  mono-native: remove useless SRC_URI +=3D ""
  mono-mcs-intermediate: remove useless SRC_URI +=3D ""
  kaffe-gtk_1.1.5.bb: remove useless EXTRA_OECONF +=3D ""
  kaffe-gtk_cvs.bb: remove useless EXTRA_OECONF +=3D ""
  wv/wv_1.2.4.bb: removed unneeded EXTRA_OECONF
  libvorbis: moved EXTRA_OECONF from inc to individual recipes
  prismstumbler/prismstumbler_0.7.2.bb: removed unneeded EXTRA_OECONF
  atftp/atftp_0.7.bb: removed unneeded EXTRA_OECONF
  freesmartphone/fsoinitd_git.bb: removed unneeded EXTRA_OECONF
  openmoko-projects/enlazar_svn.bb: removed unneeded EXTRA_OECONF
  wvdial/wvdial_1.60.bb: removed unneeded EXTRA_OEMAKE
  wvdial/wvdial_1.56.bb: removed unneeded EXTRA_OEMAKE
  tinylogin/tinylogin_1.4.bb: removed unneeded EXTRA_OEMAKE
  man-pages/man-pages_2.41.bb: removed unneeded EXTRA_OEMAKE
  man-pages/man-pages_3.21.bb: removed unneeded EXTRA_OEMAKE
  mysql/mysql-native_4.1.22.bb: removed unneeded EXTRA_OEMAKE
  mysql/mysql5-native_5.1.40.bb: removed unneeded EXTRA_OEMAKE
  netkit-ftp/netkit-ftp_0.17.bb: removed unneeded EXTRA_OEMAKE
  gsoap/gsoap-native_2.7.13.bb: removed unneeded EXTRA_OEMAKE
  bootmenu/bootmenu_0.6.bb: removed unneeded EXTRA_OEMAKE
  bootmenu/bootmenu_0.7.bb: removed unneeded EXTRA_OEMAKE
  fbida/fbida_2.07.bb: removed unneeded EXTRA_OEMAKE
  fontconfig/fontconfig-native_2.6.0.bb: removed unneeded EXTRA_OEMAKE
  ifupdown/ifupdown-ubuntu_0.6.8.bb: removed unneeded EXTRA_OEMAKE
  netkit-rpc/netkit-rpc_0.17.bb: removed unneeded EXTRA_OEMAKE
  netkit-tftp/netkit-tftp_0.17.bb: removed unneeded EXTRA_OEMAKE
  netkit-tftp/netkit-tftpd_0.17.bb: removed unneeded EXTRA_OEMAKE
  lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE
  ifupdown/ifupdown_0.6.10.bb: removed unneeded EXTRA_OEMAKE
  linux/ipod_2.4.24-ipod0.bb: removed unneeded EXTRA_OEMAKE
  perl recipes: updated license from Artistic|GPLv1 to Artistic|GPLv1+
  Revert "linux/ipod_2.4.24-ipod0.bb: removed unneeded EXTRA_OEMAKE"
  Revert "ifupdown/ifupdown_0.6.10.bb: removed unneeded EXTRA_OEMAKE"
  Revert "lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE"
  Revert "netkit-tftp/netkit-tftpd_0.17.bb: removed unneeded EXTRA_OEMAKE"
  Revert "netkit-tftp/netkit-tftp_0.17.bb: removed unneeded EXTRA_OEMAKE"
  Revert "netkit-rpc/netkit-rpc_0.17.bb: removed unneeded EXTRA_OEMAKE"
  Revert "ifupdown/ifupdown-ubuntu_0.6.8.bb: removed unneeded EXTRA_OEMAKE"
  Revert "fontconfig/fontconfig-native_2.6.0.bb: removed unneeded EXTRA_OEM=
AKE
  Revert "fbida/fbida_2.07.bb: removed unneeded EXTRA_OEMAKE"
  Revert "bootmenu/bootmenu_0.7.bb: removed unneeded EXTRA_OEMAKE"
  Revert "bootmenu/bootmenu_0.6.bb: removed unneeded EXTRA_OEMAKE"
  Revert "gsoap/gsoap-native_2.7.13.bb: removed unneeded EXTRA_OEMAKE"
  Revert "netkit-ftp/netkit-ftp_0.17.bb: removed unneeded EXTRA_OEMAKE"
  Revert "mysql/mysql5-native_5.1.40.bb: removed unneeded EXTRA_OEMAKE"
  Revert "mysql/mysql-native_4.1.22.bb: removed unneeded EXTRA_OEMAKE"
  Revert "man-pages/man-pages_3.21.bb: removed unneeded EXTRA_OEMAKE"
  Revert "man-pages/man-pages_2.41.bb: removed unneeded EXTRA_OEMAKE"
  Revert "tinylogin/tinylogin_1.4.bb: removed unneeded EXTRA_OEMAKE"
  Revert "wvdial/wvdial_1.56.bb: removed unneeded EXTRA_OEMAKE"
  Revert "wvdial/wvdial_1.60.bb: removed unneeded EXTRA_OEMAKE"
  libevent_1.4.14b-stable.bb: removed DP =3D "-1"; bumped PR
  transmission_2.04.bb: removed DP =3D "-1"; bumped PR
  utils.bbclass: remove tests for checksums.ini

Graham Gower (2):
  xoscope_1.12.bb: Fix build failure when comedilib has already been staged=
.
  nail_11.21.bb: Fix build failure due to dumbness in a configure-like scri=
pt.

Henning Heinold (2):
  dietlibc: move do_stage to do_install
  libsdl-directfb: use the options of our patched autoreconf, to prevent au=
toh

Jaap de Jong (1):
  cacao: Fix path for cacaoh source in do_install

Jason Kridner (2):
  openssl: add i386-darwin to known buildhosts
  quilt-native: disable getopt for darwin buildhosts

Khem Raj (16):
  opie.bbclass: Define OPIE_SRCREV and OPIE_GIT_PV if not already defined
  autotools.bbclass: Move --with-sysroot to CONFIGUREOPTS
  gcc-configure-target.inc: Filter out --with-sysroot
  binutils.inc: Filter out --with-sysroot for target binutils
  binutils.inc: Dont filter out all --with-sysroot strings
  gcc-4.5.inc: Backport gcc trunk svn revision 165495 to fix ICE on udev
  binutils.inc: Use anon python to grok CONFIGUREOPTS
  qpe-libgaim_1.5.0.bb: Add new location of glib-2.0 headers to compiler in=
clu
  fluxbox_1.1.1.bb: Delete duplicate fbrun.1 occurance from man_MANS
  libtool: Rename --with-sysroot to --with-libtool-sysroot
  openldap_2.4.23.bb: Fetch ltmain.sh from the new location in staging
  autotools.bbclass: Use --with-libtool-sysroot instead of --with-sysroot
  binutils: Update libtool macros to reflect --with-sysroot -> --with-libto=
ol-
  gcc-configure-target.inc: --with-sysroot -> --with-libtool-sysroot rename=
 me
  autotools.bbclass: Specify a value of sysroot instead of asking the compi=
ler
  autotools.bbclass: Use STAGING_DIR_HOST for libtool sysroot

Koen Kooi (14):
  image bbclass: fix install_linguas usage on shared buildservers
  module bbclass: add KERNEL_DIR for ubunutu style modules
  tiwlan-wl1271: add kernel drivers and loaders for the wifi portion of a w=
l12
  gnome-games: update 2.30.x to 2.30.2 and add 2.32.0
  pango: add 1.28.3
  qt4: move QtDeclarative to qt4.inc
  angstrom next: switch to pango 1.28.3
  angstrom feed sorter: optimize duplicate finder and add toggle for update=
r
  binutils: bump INC_PR to force rebuild
  conf/machine: first batch of preferred_version removal: gcc/glibc/binutil=
s
  omap machines: remove preferred versions from machine files, the recipes =
alr
  mpfr: remove 'PATCHES' file so it can build on case insensitive filesyste=
ms
  ti-dmai: bump SRCREV for omapl138
  gstreamer-ti: bump PR for dmai change

Mario Schuknecht (1):
  linux-2.6.24: hipox machine fixed memzero.S

Martin Jansa (54):
  libxsettings-client: don't overwrite do_install from autotools, append to=
 it
  linux-openmoko-2.6.34: add tslib patch from qtmoko
  xserver-xorg-conf: use tslib instead of evdev for om-gta02
  angstrom-jalimo: update preferred version of icedtea6-native as 1.7.3 is =
no
  fso-image: remove obsoleted openmoko stuff
  meta-angstrom-2007: remove openmoko-browser2 which was moved to obsoleted
  angstrom/sort.sh: remove om-3d7k as it was canceled long time ago
  angstrom/build-feeds: remove openmoko targets
  libmokoui2, openmoko-apps: move to obsolete as libmokoui2 doesn't build f=
or
  openmoko: obsolete tasks and images, openmoko as distribution was obsolet=
ed
  openmoko: obsolete old openmoko classes and recipes using those
  om-3d7k: remove machine definition, because it was canceled long time ago
  linux-openmoko: obsolete 2.6.24 and 2.6.28
  openmoko: remove openmoko directories used from FILESPATH as openmoko dis=
tri
  openmoko: move initscripts, psplash, alsa-scenarios also to obsolete
  settingsgui: move both versions to obsolete, nobody have it in task/image=
s n
  removal: add entry for removing obsoleted openmoko recipes
  insane-srcrevs: remove AUTOREV for obsolete openmoko recipes
  talloc: add recipe for talloc, needed by new mesa releases
  mesa: add 7.9 release
  mesa-7.8.2: remove D_P_shr as we want 7.9 now
  linux-openmoko-2.6.34: add patch from qtmoko for resume_reason
  mesa-7.9: add talloc dependency
  libxml2: enable debug module (default is on)
  xserver-xorg_git: bump SRCREV
  libice: add 1.0.7
  linux-openmoko-2.6.34: add patch for jitter less ts
  linux(-kexecboot): add recipe for 2.6.36 version + spitz defconfig
  diffstat: fix PR
  cornucopia: bump SRCREV for fixed build of fsogsmd on pre
  msmcomm: bump SRCREV
  lvm2: add patch for build with newer eglibc, drop empty do_stage()
  shr-specs: remove old staging
  bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
  elementary: package also edje modules
  evas: enable image-loader-gif
  EFL: bump SRCREV a bit more
  task-shr-(minimal): move iliwi from full task to minimal task
  poppler_0.12.3: add lcms dependency
  exquisite: don't put initscripts to RDEPENDS
  gsmd: don't put initscripts to RDEPENDS
  ompower: don't put initscripts to RDEPENDS
  libvpx_0.9.2: fix S/SRC_URI after ebaa5e020bfa0a95c49f17a103b731c324e8da2=
0
  psplash: don't put initscripts to RDEPENDS
  task-shr-minimal: add ca-certificates
  udev_15*: fix FILES_libudev
  xorg: new versions for 20101025
  eeze: bump PR for libudev fix
  e-wm: bump PR for libudev fix
  mesa-dri_7.9: bump PR for libudev fix
  sjf2410-linux-native: drop empty do_stage()
  dfu-util: drop unneeded do_stage from native recipe
  sjf2410-linux-native: drop empty do_stage()
  ecore: fix undefined _Ecore_File_Event by using newer SRCREV then EFL_SRC=
REV

Michael 'Mickey' Lauer (1):
  ttf-ubuntu-font-family: new recipe; ubuntu font family     NOTE: only San=
s f

Michael Smith (5):
  package.bbclass: copy dotfiles in root D to PKGD
  gcc 4.3.3: backport -print-sysroot for libtool
  gcc 4.3.4: backport -print-sysroot for libtool
  jack: temporarily use Angstrom source mirror
  xdelta 3.0z: add

Paul Eggleton (18):
  Build development versions of Opie from git instead of CVS.     Note that=
 th
  preferred-opie-git-versions: add opie-notes and opie-taskbar-images
  libqpe-opie: add unbreak-logging-2.patch which applies against current gi=
t v
  opie-networksettings: do not apply wireless.patch for git version
  opie-packagemanager: ensure libopkg is used for git version
  opie-taskbar: fix server-pro-cvs.patch to apply against current git
  opie-taskbar: apply force-firstuse-calibrate.patch against git version
  opie-textedit: fix git version for move of text editor to "Applications" =
tab
  task-opie: add opie-notes to task-opie-base-pim and move opie-textedit to=
 ta
  Bump Opie git revision
  opie-recorder: add dependency on libopiemm2
  opie-taskbar: install /etc/opie_sysevents.conf
  opie-vmemo: add dependency on libopiemm2
  task-opie: bump PR for previous change
  Bump Opie git revision
  opie-mediaplayer2: remove reference to OPIE_CVS_PV and default OPIE_GIT_P=
V i
  conf/distro/include: Remove preferred-opie-cvs-versions.inc.
  conf/distro/include: remove obsolete preferred-opie-versions.inc

Paul Menzel (2):
  gedit_2.30.0: Set `LICENSE` to GPLv2+ for real.
  usermanual: update to new style staging

Petr =C5=A0tetiar (8):
  oestats-client.bbclass: send USERDISTRO value
  ts72xx: update machine config
  linux-2.6.34: ts72xx - update the kernel patchset and defconfig
  busybox: add ts72xx hwclock-default file and modify hwclock.sh
  lua-filesystem: use standard prefix for Lua libraries
  lua-rs232: use standard prefix for Lua libraries
  lua5.1: link to libpthread when using uclibc
  lua5.1: use standard prefix for Lua libraries

Philip Balister (3):
  vim: Add new package vim-vimrc that installs a vimrc that makes me happy.
  gnuradio: Drop DEPENDS on sdcc now that we use uhd for usrp interfaces/
  task-sdk-gnuradio-native: Stop build failures due to missing packages.

Roger Monk (2):
  egl: Add tu816x as combatible SOC_FAMILY
  u-boot: Add TI 2010.06 PSP 4.00.00.07

Sean Cross (2):
  linux-imx-git: Fix compile error by making rotary coder a builtin
  live555: Add version 20101015 and remove older versions

Simon Busch (17):
  preferred-shr-versions: choose git version of tslib as default
  tslib: adjust various recipe settings for the palmpre machine
  read-tokens: add initial git version
  tsmd: add initial recipe
  netbase: powerup usb0 interface automatically on palmpre machine
  tslib: add patch for git version to compile cy8mrln plugin
  initscripts-shr: remove unused usb-gadget script for palmpre machine
  tellbootie: add initial git version
  palmpre-audio-scripts: add initial version
  tslib: fix typo in palmpre machine ts.conf file and switch to raw module
  linux-palmpre: bump git SRCREV for devtmpfs support
  linux-palmpre: enable devtmpfs per default but do not auto mount it
  initscripts-shr: add mountdevtmpfs init script for palmpre machine
  xserver-xorg-conf: switch from plain tslib access to evdev for touchscree=
n o
  palmpre: add some utilities to MACHINE_EXTRA_RDEPEND
  tslib: bump git SRCREV and update include-cy8mrln-header.patch accordingl=
y
  tslib: update ts.conf for palmpre machine

Tasslehoff Kjappfot (1):
  log4cxx 0.10.0 recipe


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


