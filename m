Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P2pRh-0003xH-PS
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 20:07:33 +0200
Received: by ewy7 with SMTP id 7so2035108ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 11:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=aHGb0VuRfhCTTgaH2yePZG22B5mmCT9fy6eeb3rkqrA=;
	b=ZqpdoehcahyDpMUejHec3iRZTHwo/Ju0BQWloxO/iVQvR/XyezQAyuG5LVpyB5yMR5
	0x3frwo9KoN7iinWqn5dgVaq3neECQR6JXQvmaC+5qS6iEaKx2TnUR1uNGoqhaFBaLz0
	GihAE4amoRU0iL9br+frHoTWK5U1IYjhSLY00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=HHO/aJx/nWsnlEl2LIikXUhAHLUQunCY5G5nipzoSxvufJoeK+k8VAEERDtz+fg1He
	143lmaBdlkKTJ3U8LrKU2dLJm/85gTAPZ8sgUCZwLFHbKO1KR05ugsyO1/zuk5V19woc
	8mdoJU59NteNxYReNq/iSix3zprB/u9BS6BB4=
MIME-Version: 1.0
Received: by 10.216.238.37 with SMTP id z37mr5606001weq.26.1286215632189; Mon,
	04 Oct 2010 11:07:12 -0700 (PDT)
Received: by 10.216.45.149 with HTTP; Mon, 4 Oct 2010 11:07:12 -0700 (PDT)
Date: Mon, 4 Oct 2010 14:07:12 -0400
Message-ID: <AANLkTikjgMA3j0YYCKGwOaXLg7CvWygy+UO3b4qs9XPZ@mail.gmail.com>
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
Subject: OE weekly changelog for 2010-09-27 to 2010-10-04
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
X-List-Received-Date: Mon, 04 Oct 2010 18:07:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2010-09-27 to 2010-10-04

Alex Bennee (1):
  recode: Fix configure step.

Andrea Adami (6):
  linux-kexecboot: move recipes in /linux
  linux-kexecboot_2.6.35: update to latest stable patchset (7)
  linux-kexecboot_git: add initial c7x0 defconfig
  kernels-2.4-embedix: move unsupported recipes to obsolete
  opensimpad-kernels: move unmaintained recipes to obsolete
  sharp-binary-only: obsolete sharp-camera-support and sharp-sdmmc-support

Andreas Oberritter (4):
  cdparanoia: create libcdparanoia packages
  libcddb-1.3.2: initial recipe
  cdrkit: update from 1.1.9 to 1.1.10
  libcdio-0.82: reduce package size, add dependencies, move recipe

Brijesh Singh (10):
  ti-codec-engine_2.26.01.09: add new codec engine version.
  ti-dvtb: add new recipe to build DVTB (Digital Video Test Bench)
  ti-c6accel_1.00.00.04: add new recipe
  ti-c6accel_1.01.00.01: add new c6accel version.
  ti-codecs-dm365_4.00.00.00: add new recipe for dm365 codecs
  gstreamer-ti: update loadmodules.sh
  ti-codecs-dm365_4.00.00.00: update SRC_URI to use latest dm365 codecs
  ti-dmai_2.20.00.06: add updated version of dmai recipe for DM365
  ti-dmai_svn.bb: bump up svn rev
  ti-codecs-omapl138_4.00.00.00: add new recipe for omapl138 codec

Chase Maupin (6):
  ti-linux-driver-examples: add driver examples recipe
  matrix-gui-common: make versioned recipes
  matrix-gui-e: make versioned recipes
  matrix-gui: make versioned recipes
  matrix-tui: create versioned matrix-tui recipe
  am-benchmarks: update to latest version

Chris Larson (11):
  utils.bbclass: add wrapper script generator
  u-boot-mkimage-sdk: unbork build
  create_wrapper: check syntax of arguments
  gtk+-native: generate wrappers for relocation
  gtk-icon-cache: don't use RDEPENDS, use RDEPENDS_${PN}
  cairo-native: fix DEPENDS
  sqlite3-native: use BBCLASSEXTEND
  Revert gtk+-native wrapper commit temporarily
  create_wrapper: wrappers are more useful if they pass args *coughs*
  gtk+-native: generate wrappers for relocation [v2]
  Revert "gtk+-native: generate wrappers for relocation [v2]"

Denys Dmytriyenko (2):
  base.bbclass: not use bb.fetch.urldata in do_unpack() for traversing SRC_URI
  omap3-sgx-modules: update SRC_URI with public link

Dmitry Eremin-Solenikov (8):
  t1lib: update to 5.1.2
  fortune-mod: update to 1.99.1-4 and drop host-only tools
  libqpe-opie: copy double_name.patch from opie-mediaplayer1
  opie-taskbar-images: add prerm script removing alternatives
  recode: use debian orig.tar.gz instead of gnu  one
  gpm: fix compilation due to missing struct ucred
  gdb-cross-sdk: fix compilation on non-arm platforms

Enrico Scholz (1):
  oe.path: added 'recurse' argument to remove()

Fahad Usman (15):
  python-pyrex_0.9.8.5.bb: merged native and non-native recipes
  python-epydoc_3.0.1.bb: merged native and non-native recipes
  python-setuptools: mergerd native and target
  docbook-dsssl-stylesheets-native_1.79.bb: converted to new style staging
  qmake-native_1.07a.bb: Converted to new style staging
  nkf_2.07.bb: merged native and non-native recipes
  classpath-tools-native.bb: Converted to new style staging
  gconf-native_2.6.1.bb: Converted to new style staging
  opie-lrelease-native: Converted to new style staging
  pad-native: converted to new style staging
  pngcrush_1.7.9: merged native and non-native recipes
  docbook-sgml-dtd-native: converted to new style staging
  cacaoh-native: Removed legacy style staging
  glib-1.2: merged native and non-native recipes
  omniorb_4.1.4: merged native and non-native recipes

Frans Meulenbroeks (59):
  udev : moved unused files to obsolete dir
  unionfs : moved unused files to obsolete dir
  wpa-supplicant : moved unused files to obsolete dir
  wt : moved unused files to obsolete dir
  wireless-tools : moved unused files to obsolete dir
  wifi-radar: moved files dir to more specific wifi-radar
  Revert "wpa-supplicant : moved unused files to obsolete dir"
  kernel.bbclass: avoid NOTE messages for files that are staged but not packag
  wpa-supplicant : moved unused files to obsolete dir
  modphp : moved unused files to obsolete dir
  mdadm : moved unused files to obsolete dir
  monotone : moved unused files to obsolete dir
  mpfr : moved unused files to obsolete dir
  mpfr-canadian: fixed patching by adding FILESPATHPKG
  musicbrainz : moved unused files to obsolete dir
  mysql : moved unused files to obsolete dir
  musicpd : moved unused files to obsolete dir
  linux-uml: removed
  linux.inc: create image/boot dir in do_devicetree_image
  monotone-6: cleaned old versions
  schroedinger : moved unused files to obsolete dir
  schroedinger: moved files dir to more appropriate schroedinger
  rp-pppoe: removed version 3.5
  rp-pppoe : moved unused files to obsolete dir
  maemo : moved unused files to obsolete dir
  mamona : moved unused files to obsolete dir
  maemo-mapper/ : moved unused files to obsolete dir
  matchbox-panel : moved unused files to obsolete dir
  kismet : moved unused files to obsolete dir
  konqueror : moved unused files to obsolete dir
  hal : moved unused files to obsolete dir
  hostap : moved unused files to obsolete dir
  tgt: upgraded to 1.0.9
  tgt: remove 1.0.0
  cdrkit: files dir renamed to cdrkit
  libcdio: added INC_PR, bumped INC_PR
  mplayer : moved unused files to obsolete dir
  cacao : moved unused files to obsolete dir
  bluez : moved unused files to obsolete dir
  cumulus : moved unused files to obsolete dir
  dpkg : moved unused files to obsolete dir
  gpsdrive : moved unused files to obsolete dir
  gstreamer : moved unused files to obsolete dir
  gpe-edit : moved unused files to obsolete dir
  networkmanager : moved unused files to obsolete dir
  wlan-ng : moved unused files to obsolete dir
  kernel.bbclass: set kerneldir
  sane : moved unused files to obsolete dir
  sdcc : moved unused files to obsolete dir
  sdlperl : moved unused files to obsolete dir
  socketcan : moved unused files to obsolete dir
  sqlite : moved unused files to obsolete dir
  squashfs-tools : moved unused files to obsolete dir
  strace : moved unused files to obsolete dir
  swt : moved unused files to obsolete dir
  sylpheed : moved unused files to obsolete dir
  sysfsutils : moved unused files to obsolete dir
  squashfs-tools_3.3: removed recipe
  mythplugins: fix include directive for lighty

Graham Gower (4):
  firefox_3.6.8.bb: Add mipsel support.
  gdb: Don't clobber files installed by binutils.
  gtk+_2.20.1.bb: Fix build with --disable-xkb.
  imlib_1.9.15, qiv_1.9: move to obsolete.

Holger Hans Peter Freyther (20):
  qt-4.7.0: Fork the mkspec used in previous Qt versions
  qt-4.7.0: Update the spec files for Qt 4.7
  qt-4.7.0: Use qmake feature to link with -rpath-link.
  qt4-tools-native_4.7.0.bb: Use the mkspec files from qt-4.7.0
  qt-4.7.0.inc: Pick the linux.conf/g++.conf from the right directory
  qt4: Package the declarative debug packages into qt4-examples-dbg
  qt-4.7.0.inc: Unpack the qte.sh to fix the qt4-embedded do_install
  qt-4.7.0: Remove patches that cover up errors.
  qt4: Bump INC_PR to force a rebuild with the mkspec changes
  qt4-tools-sdk: Add a Qt 4.7.0 version, create a .inc file for reuse.
  meta-toolchain-neuros: Remove recipe, meta-toolchain-qte is a better replace
  uicmoc4: qt4-tools is the replacement.
  qt4-tools-native: Build the tools as -embedded to avoid X11 deps
  task-qte-toolchain-target: The QtAssistantClient is deprecated and removed i
  qt4-tools-native: Add -no-freetype to the build
  qt4-tools-sdk.inc: Switch over to INC_PR
  qt4-toolsd-sdk.inc: Move to -embedded, disable more features
  qt4-tools-native.inc: Add more -no options to disable dependencies
  task-qte-toolchain-target: Attempt to install QtDeclarative

Jesse Gilles (1):
  ruby: remove 1.8.5

Khem Raj (35):
  native.bbclass,package.bbclass,bitbake.conf: Make provisions for system libd
  insane.bbclass: Recognise mips64 and mips64el
  siteinfo.bbclass, site/: Add mips64/mips64el to siteinfo data
  distros: Disable gnu-style hash for mips64/mips64el
  kernel-arch.bbclass: Add logic to account for mips64/mips64el in map_kernel_
  conf/machine: Add qemumips64 machine configuration and tune file.
  binutils-cross.inc: Enable 64-bit bfd when configured for mips64/mips64el
  gcc-4.5: Add support to build for mips64
  eglibc-2.12: Configure for 64-bit mips
  linux_2.6.35.bb: Add config for qemumips64
  run-qemu.sh: Add new target mips64 and mips64el
  netbase: Add interface information for qemumips64 and qemumips64el
  sane-toolchain.inc: Make gcc 4.5 & eglibc 2.12 as default sane versions
  quilt-native: Use the quilt.quiltrc from sysroot instead of /etc
  quilt-0.48: Use cp instead of mv for backing up patches.
  gcc-4.5: Import Linaro patches
  gcc: Make use of INC_PR consistently.
  gcc-4.5: Fix wrong instruction generation for vmovl pattern
  gcc: Separate recipes for linaro gcc are redundant, remove
  eglibc: Fix eglibc-dev aliases and locales
  nylon-feed.bb: Use RDEPENDS instead of DEPENDS
  prismstumbler_0.7.3+0.7.4pre1.bb: Add patch to replace gps_query call
  libcdio: Upgrade to 0.82 release
  cluster-glue_1.0.5.bb: Fix build warnings found with gcc 4.5
  libbedic_1.1.bb: Include cstdio to get calloc definition
  libxcomp_3.3.0-3.bb: Fix compilation errors and dont pass -Wnested-externs t
  pjproject-1.0_1.0.3.bb: Remove in favor of new 1.5 version
  ca-certificates: Rename which updates SRC_URI to fetchable tar.
  libspiff_0.8.2.bb: Fix C++ files to compile with gcc 4.5
  chicken: Fix cross and target builds and move 4.4.0 to 4.6.0 release
  free42-vga_1.4.41.bb: Fix compilation issues.
  mcnavi: Upgrade to 0.2.13
  klimt_0.6.2: Add recipe
  gcc-4.5.inc: Specify location of native libelf
  gcc-cross_4.5.bb: Specify location of native libelf

Klaus Kurzmann (3):
  mokosuite2: bump SRCREV
  mokowm: bump SRCREV

Koen Kooi (14):
  angstrom-codec-engine-latest-preferred-versions: bump cgt to .17
  ti-codecs-omapl138 4.00.00.00: update SRCREV to integrate c6accel
  ti-c6accell: fix COMPATIBLE_MACHINE
  lingles-omap3: fix COMPATIBLE_MACHINE
  ti recipes: fix omapl13x overrides
  docbook-sgml-dtd-native.inc: attempt to fix build error caused by missing sg
  angstrom feed sorter: add am389x-evm and c6a816x-evm
  pixman 0.19.4: add 3 more NEON patches
  libcdio: remove deprecated field, fix DEPENDS     libcddb: fix DEPENDS
  libcdio: fix SONAME damage caused by b672b28ba6a29e2715c91fcbbda8b2776b6f110
  gst-plugins: bump PR for cdio commit
  gvfs: bump PR for cdio change
  libv4l: add 0.8.1, delete old version     v4l-utils: add combined libs/utils
  module_strip bbclass: inherit class to get the kernel version method

Marco Cavallini (1):
  kaeilos-2010.conf: set PREFERRED_VERSION_eglibc to 2.11

Martin Jansa (24):
  linux-openmoko-2.6.32: upgrade to 2.6.32.23 and add 3 patches from qtmoko
  zhone: bump SRCREV
  SHR: drop preferred version for eglibc and gcc
  initscripts-shr: drop ttySACx workarround and better ROOT_HOME detection
  libpthread-stubs: add .inc file, INC_PR, native and nativesdk BBCLASSEXTEND
  xcb-proto: add native and nativesdk BBCLASSEXTEND
  libxcb: add native and nativesdk BBCLASSEXTEND
  xorg: add new recipes for versions from 2010-09-28
  libx11: add 1.3.6 and 1.3.99.902, remove 1.3.5, change keysymdef_include_pat
  linux(-kexecboot)_git: bump SRCREV for 2.6.36-rc6
  kbd: upgrade from 1.12 to 1.15.2, add native version
  frameworkd: limit oeventsd workaround for buggy kernel only to 2.6.32
  cornucopia: bump SRCREV for new alsa state files for 2.6.34
  libfsotransport: enable palmpre-hsuart for all
  fso-specs,libfso-glib: bump SRCREV
  moko(suite,wm,wm-inf-ecore): bump SRCREV and remove AUTOREV from shr-autorev
  lib(frameworkd,freesmartphone)-glib: bump SRCREV
  evopedia: upgrade to new version using Qt
  libfreesmartphone-glib: bump SRCREV a bit
  mokowm: bump SRCREV a bit
  task-openmoko-pim: remove dates2 tasks2 contacts2, because those are unfetch
  paroli: move to nonworking, paroli seems unmaintained for a while
  mokosuite2: bump SRCREV a bit more
  om-gta0*: add qi qi-ubi to EXTRA_IMAGEDEPENDS, remove them from task-shr-fee

Nobuhiro Iwamatsu (1):
  machine/sh7785lcr: Add new machine for Renesas SH7785 reference board

Noor Ahsan (11):
  sip-native: Run oe-stylize.py script on the recipe and modified the the reci
  sip-native: Convert to new style staging, remove do_stage()
  libsdl-native: Convert to new style staging, remove do_stage
  tk: Run oe-stylize.py script and change the recipe accordingly
  tcl: Run oe-stylize.py script and modify the recipe accordingly
  tcl: Merged native and target packages using BBCLASSEXTEND
  tk: Merge target and native packages using BBCLASSEXTEND
  fribidi: Extended recipe to build native package, add BBCLASSEXTEND
  sqlite: Merge target and native recipe using BBCLASSEXTEND, Remove native re
  uicmoc-native: Convert to new style staging, Remove do_stage
  sqlite3: Extend target recipe to native recipe using BBCLASSEXTEND

Pierluigi Passaro (1):
  mysql5: adopt to new style sysroot

Prabindh Sundareson (1):
  xgxperf: Updated to SRCREV 75

Roger Monk (19):
  ti-recipes: Switch remaining buildable ti recipes to use KERNEL_PR
  ti-c6accel: add missing patch
  ti-c6accel: switch to MACHINE_KERNEL_PR
  gstreamer-ti: sync with arago
  gstreamer-ti: activate omapdmaifbsink plugin for omap3
  ti-paths: sync with arago by removing the 'packages' from LINK_INSTALL_DIR
  ti-dmai: sync with arago
  ti-codecs-dm355: sync with arago
  ti-codecs-dm365: sync with arago
  qt-embedded-widgets-demo: import from arago
  ti-dvsdk-demos: sync SRC_URI with arago
  angstrom-codec-engine-latest-preferred-versions: bump CE to 2.26.01.09
  angstrom: move to CE latest
  gstreamer-ti: various fixes
  libgles-omap3: add 4.00.00.01 release
  alsa-state: add state file for da850-omal138-evm
  u-boot 2010.03: add PSP 04.00.00.05 release in preparation for ti816x suppor
  linux-omap3 2.6.34: add PSP 04.00.00.06 release in preparation for ti816x su
  am389x-evm, c6a816x-evm: add first set of ti816x based machines

Roman I Khimov (1):
  iw: fix build

Scott Garman (1):
  grep: update 2.6.3 to 2.7

Steffen Sledz (2):
  ubifs-v2.6.24: avoid kernel error if ubifs superblock read fails
  epiphany-2.30.2: unbreak build by adding ca-certificates dependencies

Thilo Fromm (3):
  wvstreams-4.6: Remove dbus support (breaks build)
  qemu-0.12.5: add ncurses, gnutls dependencies
  vim-7.2: provide correct VIMGUI option (unbreaks build)

Tom Rini (27):
  tzdata: bump version to 2010m
  tzcode-native: bump version to 2010m
  sysvinit: Add mountpoint to u-a
  util-linux-ng: Make cal and script use u-a
  apache2-native: Convert from legacy staging
  dcopidl2cpp-native: Convert from legacy staging
  htmldoc-native: Switch to BBCLASSEXTEND, drop legacy staging
  libffi-native: Convert from legacy staging
  mysql5-native: Convert from legacy staging, disable pstaging
  liblocale-gettext-perl: Switch to BBCLASSEXTEND
  inetutils: Add hostname to u-a.
  glib-1.2: Rework DEPENDS updates
  htmldoc: Rework DEPENDS updates
  omniorb: Rework DEPENDS updates
  python-epydoc: Rework DEPENDS updates
  python-pyrex: Rework DEPENDS updates
  python-setuptools: Rework DEPENDS updates
  tcl/tcl-native: Fix building when tclsh isn't on the system
  eglibc/glibc: Kill off (again) zoneinfo
  u-boot-mkimage: Add sdk to BBCLASSEXTEND
  inetutils: hostname should be in /bin
  openswan: getline rename, from Gentoo
  bonnie++: Use BPN not PN in SRC_URI
  inetutils: Make sure ${base_bindir} exists
  Bonnie++: One more PN -> BPN
  ipsec-tools: Fix build with gcc 4.4+
  insane.bbclass: Skip '.pc' in qa_configure

Vaudano Luca (1):
  estardict: add new version 0.4

Vladimir Sorokin (5):
  xl2tpd: build with kernel headers, update version to 1.2.6
  groff-1.20: disable parallel make
  corosync: fix init script
  pacemaker: packaging fixes, move some files between packages
  cluster-glue: packaging fixes, move some files between packages

Yann Dirson (1):
  gnugo_3.8: Add new recipe.


-- 
=================
http://bec-systems.com


