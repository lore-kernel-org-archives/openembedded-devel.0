Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OUoRl-0001an-KP
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 00:14:44 +0200
Received: by wwb39 with SMTP id 39so1265045wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 15:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=enIIVehCP0dzW/ZSPcGfUh6pla5Ur32Vw4tqvZg6nfw=;
	b=eQLm5g2NhKfYMSGlxc5QuZzQLnPFpJN7bVfaZcufbaw4QP+xVXY66A9hFQKdXpspmE
	AmYiBfQpRYJcINu9rpawcdi0oyFryyxvtDufmdJd3KxZ8MNc4XxAr6UU5XrarMRBq11F
	6GrKgq0BMk7RAac374ugF5KU34zZeVaMnPMu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=spKM+Ol+bJspN1lUVuOLz7TXdvFHiaTOzXgIgbjivqQRBUbTAPcwKZgkv0qD5CIZ8b
	cdHCC0gTBLPdUxb15aqN/JYWXzvKIHCjHAQ4XoA+Y77JPZ+YXIN0/VTRY5JfBn+Ldjn4
	2A2VqElt7DSsKffLOgPAc9aRHRn8jYnVSuoTA=
MIME-Version: 1.0
Received: by 10.227.136.16 with SMTP id p16mr806986wbt.225.1278108365758; Fri, 
	02 Jul 2010 15:06:05 -0700 (PDT)
Received: by 10.216.5.20 with HTTP; Fri, 2 Jul 2010 15:06:05 -0700 (PDT)
Date: Fri, 2 Jul 2010 18:06:05 -0400
Message-ID: <AANLkTilCzId-HGA61t1UUdcB-UlFws4mwz_PLBsMSQUR@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-06-21 to 2010-06-28
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
X-List-Received-Date: Fri, 02 Jul 2010 22:15:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-06-21 to 2010-06-28

Andrea Adami (7):
  device_table-minimal: create /dev/input before adding input events.
  kexecboot_git: bump to ac70f55e2b49f23963a8f057330eb47836a01c2f
  kexecboot-cfg: add INITRD boot entry in boot.cfg.
  linux_2.6.34: update c7x0, akita and spitz defconfigs.
  linux-kexecboot: add pending patch for c7x0 to 2.6.32
  linux-kexecboot: add pending patch for c7x0 to 2.6.34
  linux: add pending patch for c7x0 to 2.6.34

Chris Larson (3):
  package_ipk: Fix syntax error - incorrect usage of bb.data.expand
  Rename base_dep_prepend and autotools_dep_prepend
  cpan_build.bbclass: rename cpan_build_dep_prepend

Denys Dmytriyenko (1):
  matrix-tui: depend on libxml2

Dmitry Eremin-Solenikov (1):
  opie-taskbar-images: unbreak for non-default extensions

Frans Meulenbroeks (5):
  linux-libc-headers: use kernel-arch.bbclass
  kernel-arch.bbclass: added nios2
  siteinfo.bblass: added nios2-linux and nios2-linux-uclibc
  instane.bbclass: added nios2
  busybox-1.13.2: add __nios2__ conditional

Henning Heinold (2):
  classpath-native: update the ecj-patch
  fastjar: apply fix for CVE-2010-0831

Khem Raj (6):
  gcc-4.5: Fix the bswapsi libgcc infinite loop at -Os
  gpm-1.99.7: Add recipe.
  uclibc_git.bb: Bump SRCREV
  eglibc_svn, eglibc_2.12: Bump SRCREV
  gcc-4.5.inc: Bump SRCREV
  file_5.04.bb: Add zlib-native dependency to file-native

Klaus Kurzmann (1):
  tangogps.inc: add missing dep for libsoup-2.4

Koen Kooi (29):
  gcc-cross-sdk 4.5: sync configure options with cross version.
  pixman 0.18.2: add 2 more neon patches
  opencv: bump SRCREV and fix compat header
  gst-opencv: bump SRCREV, fix versioning
  gecko-mediaplayer svn: bump PR
  firefox: add 3.6.4
  ffmpeg svn: bump SRCREV past 0.6 release, enable vpx
  gst-ffmpeg: add 0.10.10, bump PR for 0.10.8
  mplayer: add webm patches
  omapfbplay: bump PR
  opkg: bump SRCREV to fix -force-reinstall
  efl: bump SRCREV
  libwnck-native: change dep from csource-native to gtk+-native, this makes it
  libatasmart: convert to new style staging
  parted 1.8.8: 'fix' configure, it builds again now
  binutils-cross-sdk cvs: fix PV
  u-boot git: remove ramdisk and user button patches that don't work on revB a
  binutils-cross-sdk: add 2.20.1
  orc: add 0.4.5, rumoured to have a neon backend
  libdrm.inc: fix packaging regression that cause ${PN} to go from libdrm2 to
  mesa-common: bump PR for libdrm change
  angstrom: pin xorg to 1.7.4 till the 1.8.x/mesa 7.8 combo gets more testing
  linux-omap-psp 2.6.32: add WIP camera drivers for the beagleboard xM
  linux-omap-psp 2.6.32: disable mt9t111 module, it causes non-xM boards to ha
  freondemo-media-files: add sha256sum as well
  qt4: move xmlpatterns to 4.7 build, it breaks 4.6.x
  libdrm: temporarely disable radeon for angstrom
  ti-dsplib: fix up broken seperators in header
  libxcb: bump PR

Kristoffer Ericson (1):
  conf/distro/jlime-2010.1.conf:

Lynn Lin (1):
  apt-native: fix gcc-4.4 compile error

Martin Jansa (132):
  unixbench: add make to RRECOMMENDS
  xorg: bump packages 2010-06-22
  xf86-video-glamo: add patch removing alloc calls deprecated in xserver 1.9 R
  xf86-input-(evdev,keyboard,mouse,tslib): bump PR of drivers used in SHR for
  xserver-xorg: move from 1.9 RC1 to RC3
  mplayer_git: bump SRCREV and enable vpx like mplayer_svn does
  pixman_0.18.2: increase D_P also for shr
  xorg-lib-common: use BPN instead of PN as default XORG_PN
  libx11: add -fforward-propagate also to newer 1.3.[34] versions
  libfontenc: convert to BBCLASSEXTEND
  libice: convert to BBCLASSEXTEND
  libsm: convert to BBCLASSEXTEND
  libxcursor: convert to BBCLASSEXTEND
  pango: drop PACKAGES_DYNAMIC for virtclass-native to hide multiple providers
  evas-native: drop PACKAGES_DYNAMIC to hide multiple providers errors
  xserver-xorg: add /usr/share/X11/xorg.conf.d to xserver-xorg package
  util-macros: add BBCLASSEXTEND sdk, because some packages were already depen
  libx11-native: add provide virtual/libx11-native
  distros: add PREFERRED_PROVIDER_virtual/libx11-native
  xtrans: remove unused abstract_socket_fix.patch
  libxfixes: convert to BBCLASSEXTEND
  libxkbfile: convert to BBCLASSEXTEND
  libxt: convert to BBCLASSEXTEND
  libxfont: convert to BBCLASSEXTEND
  libxext: convert to BBCLASSEXTEND
  libxdmcp: convert to BBCLASSEXTEND
  libxau: convert to BBCLASSEXTEND
  libxrender convert to BBCLASSEXTEND
  libxrandr convert to BBCLASSEXTEND
  xtrans convert to BBCLASSEXTEND
  libxfont: remove original PROVIDES it's not used anywhere and is broken with
  libice: remove original PROVIDES it's not used anywhere and is broken with B
  liblbxutil: remove original PROVIDES it's not used anywhere and is broken wi
  libxaw: remove original PROVIDES it's not used anywhere and is broken with B
  libxcomposite: remove original PROVIDES it's not used anywhere and is broken
  libxdamage: remove original PROVIDES it's not used anywhere and is broken wi
  libxft: remove original PROVIDES it's not used anywhere and is broken with B
  libxinerama: remove original PROVIDES it's not used anywhere and is broken w
  libxkbui: remove original PROVIDES it's not used anywhere and is broken with
  libxscrnsaver: remove original PROVIDES it's not used anywhere and is broken
  libxtst: remove original PROVIDES it's not used anywhere and is broken with
  libxxf86misc: remove original PROVIDES it's not used anywhere and is broken
  libxmu: remove original PROVIDES it's not used anywhere and is broken with B
  libxext: remove PROVIDES_virtclass-sdk
  xorg-lib: use INC_PR
  xorg-lib: oe-stylize
  recipes: use libxt/libxft/libxdmcp/libxscrnsaver/liblbxutil/libxau/libxext i
  libjson: add svn versions with patch needed for elmdentica
  om-gta02: prefer kernel 2.6.32
  xserver-xorg-conf: update om-gta02 config for 2.6.32 and newer kernel (evdev
  fsodeviced: make alsa states for 2.6.31 default
  frameworkd: add patches for 2.6.31+ on om-gta02
  fsogsmd: add patches for 2.6.31+ on om-gta02
  libphoneui: update alsa control names for 2.6.31+
  shr: use gcc-4.5.0 instead of gcc-4.4.4
  shr: inherit couple of usefull classes: recipe_sanity, insane, devshell and
  shr-images: removed udev, use shadow as login manager
  shr: prefer qt-4.7.0-beta1
  xorg-lib: use nativesdk instead of sdk
  util-macros: use nativesdk
  xorg-proto: add nativesdk to BBCLASSEXTEND
  xorg-proto: remove XORG_PN, it was now used only in DESCRIPTION where BPN is
  kbproto: convert to BBCLASSEXTENDS
  mesa: remove old 6.0 and 6.4 recipes which are not using any include file
  preferred-om-2008-versions: remove pinned version of mesa/mesa-dri
  mesa: remove old releases 6.5.2, 7.0.2 using mesa-mesa.inc
  mesa-dri: remove old 7.0.3 and 6.5.2 relase using mesa-common-old.inc
  mesa: remove 7.4 release, which is not pinned in any distro/include config
  mesa: move 7.8 release to latest minor 7.8.2
  mesa: move common definitions to include file, change SRC_URI to freedesktop
  htcdream: don't set PREFERRED_PROVIDER_virtual/libgl to mesa-dri
  mesa: switch to new staging
  gvim: use libxt directly
  mozilla.bbclass: use libxt directly
  gcc-package-sdk: skip stripping *.py files
  testlab: from opkg info grep only +- 7 lines around package with status inst
  libx11: convert to BBCLASSEXTEND
  libx11,diet-x11: use INC_PR
  libx11,diet-x11: oe-stylize
  xserver-xorg: remove D_P -1 from 1.8 versions, because mesa is now new enoug
  dvb-apps: rename evtest to dvb-evtest to workaround conflict with standalone
  initscripts-shr: RCONFLICTS is enough and installed version is controlled by
  shr: drop unused DISTRO_* definitions
  tangogps: add 0.99.4 version and drop older 0.99.x
  linux-openmoko-2.6.34: move defconfig to OE tree
  linux-openmoko-2.6.34: bump SRCREV, rebase patches
  initscripts-shr: workaround missing ttySAC* nodes with devtmpfs
  qt4: enable xmlpatterns (needed for navit-gui-qml), fix missing lib with xml
  libdrm: add kms package and remove override from LEAD_SONAME
  mesa: another PR bump for libdrm change
  libxcb: convert to new staging, use INC_PR, add libxcb-dri2 package, drop ol
  mesa: reaad and convert 7.4 release
  xserver-xorg_1.8.99.903,xf86-video-fbdev,xf86-video-glamo,glamo-dri-tests: P
  xf86-video-glamo: bump SRCREV, remove applied patch
  qt-4.7.0-beta1: upstream tarball was changed, regenerate checksums
  xorg-app-common: use BPN instead of XORG_PN
  mkfontdir: convert to BBCLASSEXTENDS
  mkfontscale: convert to BBCLASSEXTENDS
  mkfontdir: convert to BBCLASSEXTENDS
  xkbcomp: convert to BBCLASSEXTENDS
  bdftopcf: convert to BBCLASSEXTENDS
  xcursorgen: convert to BBCLASSEXTENDS
  xorg-app: remove extra DEPENDS on virtual/libx11, which is already set in xo
  xorg-app: remove useless empty #DESCRIPTION comment
  xorg-app: oe-stylize
  xorg-driver: remove useless empty #DESCRIPTION and #DEPENDS comment
  xorg-driver: oe-stylize
  xorg-driver: use BPN instead of XORG_PN
  fixesproto: convert to BBCLASSEXTENDS
  fontcacheproto: convert to BBCLASSEXTENDS
  fontsproto: convert to BBCLASSEXTENDS
  renderproto: convert to BBCLASSEXTENDS
  randrproto: convert to BBCLASSEXTENDS
  xorg-proto: remove now unused xorg-proto-native.inc
  xorg-proto: use INC_PR
  xorg-proto: oe-stylize
  xserver-xorg: drop --disable-glx-tls, glx-use-tls.bbclass should enable/disa
  linux-openmoko-2.6.32: remove changes accidentally pushed in 26f948fd5998390
  linux-openmoko-2.6.32: add patch with possible WS fix
  libdrm: add 2.4.21, use the same PE as libdrm_git had
  xorg: bump versions xorg-sgml-doctools xf86-video-intel libxfont util-macros
  xorg-sgml-doctools: fix sgml path in FILES
  xorg-doc-common: use BPN instead of XORG_PN
  xorg-doc-common: convert to new staging
  xorg-doc: use INC_PR
  xorg-doc: oe-stylize
  emacs-x11-23.1: add patch to build it with newer cpp
  gnuchess: fix fatal QA issue GNU_HASH and minor QA issues
  ipkg-utils: respect LDFLAGS, fix QA GNU_HASH error
  shr: remove P_V for boost 1.40.0 -> prefer newer boost 1.41.0
  fbreader: add 0.12.10
  pingus: Workaround QA issue GNU HASH

Michael 'Mickey' Lauer (1):
  vala-dbus-binding-tool: bump

Philip Balister (1):
  task-sdk-gnuradio-native : Add a SDK for building GNU Radio natively on devi

Robert Schuster (6):
  cacao.inc: Make libjvm.so a private lib.
  jamvm.inc: Make libjvm.so a private lib.
  qt4-tools-native.inc: Pulled -static configure argument into a variable (for
  swt-gtk.inc: Support SWT 3.6, remove legacy staging support.     swt3.6-gtk
  libecj-bootstrap 3.5: Removed (was not stable for openjdk builds).     libec
  qt4-tools-native: Revert change to add part of the configure flag into a var

Stefan Schmidt (2):
  shadow: Disable email checking completely
  libecj-bootstrap_3.4.bb: Fix SRC_URI for new location

Steffen Sledz (1):
  udev/mount.sh: use lazy umount

Steve Sakoman (1):
  xserver-xorg: remove dependency on xorg-minimal-fonts

Tom Rini (1):
  packaged-staging.bbclass: Change PSTAGE_PKGARCH to something dynamic

Vitus Jensen (1):
  libusb1_1.0.8: new recipe


=====================================================
OE weekly changelog for holger/staging-branch, 2010-06-21 to 2010-06-28


=====================================================
Bugs fixed:
bug_id resolution        short_desc
5435 FIXED       machine htcleo: gcc version etc.

Bugs opened:
bug_id resolution        short_desc


