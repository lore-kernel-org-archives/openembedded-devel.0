Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1P8D2h-0003FU-U0
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 16:19:58 +0200
Received: by wwd20 with SMTP id 20so49848wwd.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=l/PmTgmagSWZB40xeaO35B/dwyxxoFnfAj1ba9vhI6Y=;
	b=BP6LZambXZV2cRZgCe6F4SU3BUdKbXtWlR+0wjFcSSz1C78NwnexbZ4bNDHKVMgmLo
	ljFTbAmC31Exnhu9vEd4CX+UF52agy68ZvAyMYzrzcPllUPAl6/ysa719HDjB+thLUb0
	DT4Ru4DgiLi4iW8VPZvU02gzCmKAJBO66YweM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=QG3XYbtTxp6UQ3czR8JCRVYmb2Nl1dm1DuGip6v7TRN7RCXBAdTKn7zYVTKOCXRLMY
	S70zlTrs4riT2ngotGtn6z75oRIdABX2KZQRea6NZXzH9rOo8sGqNKl4Gd2PFpUPuOpr
	W6zNpo7iVt80ZdAxJao58PveZpSDvuJp1zZto=
MIME-Version: 1.0
Received: by 10.227.135.203 with SMTP id o11mr6101043wbt.162.1287497960973;
	Tue, 19 Oct 2010 07:19:20 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Tue, 19 Oct 2010 07:19:20 -0700 (PDT)
Date: Tue, 19 Oct 2010 10:19:20 -0400
Message-ID: <AANLkTik49kkPmjkakEDrsA0nCxiq-DYUy_6ZO5JKnYOv@mail.gmail.com>
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
Subject: OE weekly changelog 2010-10-11 to 2010-10-18
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
X-List-Received-Date: Tue, 19 Oct 2010 14:19:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-10-11 to 2010-10-18

Andrea Adami (11):
  preferred-gpe-versions: remove unused/unpinned versions
  libqtaux: remove superfluous do_stage()
  libgpepimc: convert to new-style staging
  libxsettings: convert to new-style staging. Bump PR.
  libxsettings-client: convert to new-style staging
  libopietooth: convert to new-style staging. Bump PR.
  opie-networksettings: convert to new-style staging. Bump PR.
  opie-pickboard: convert to new-style staging. Bump PR.
  opie-libqresync: convert to new style staging.
  opie-taskbar: move to new style staging. Bump PR.
  libqpe-opie: remove superfluous do_stage (). Bump PR.

Andreas Mueller (2):
  gedit: add `enchant` to `DEPENDS`
  gedit: add `gnome-doc-utils-native` to `DEPENDS`

Andreas Oberritter (3):
  utils.bbclass: add name to SRC_URI[{md5, sha256}sum]
  cdtextinfo: initial recipe
  cdfs-2.6.27: initial recipe

Brijesh Singh (2):
  gstreamer-ti_svn: various updates
  ti-dm365mm-module: use external URL to fetch the component

Chase Maupin (6):
  matrix-gui-common: use INC_PR in versioned recipes
  matrix-gui-e: use INC_PR in versioned recipes
  matrix-gui: use INC_PR in versioned recipes
  matrix-tui: use INC_PR in versioned recipe
  Fix Angstrom OVERRIDES settings
  Fix class OVERRIDES order

Chris Larson (18):
  cups14: add missing deps on libpng, jpeg
  gnome-bluetooth-2.30.0: add missing x11, xi deps
  u-boot: ensure deploy runs before package_stage
  oe.process: pull some common bits over
  oe.process: subclass Popen
  oe.unpack: use oe.process
  gitver: allow tag adjustment via GIT_TAGADJUST
  bitbake.conf: fix pkg-config relocation issue
  gitver: drop 'v' tag prefix where appropriate
  gitver: add missing import
  utils.bbclass: add missing import of oe.process
  bitbake.conf: add HOSTNAME variable
  utils: fix popen->Popen reference
  image.bbclass: use un-renamed packages in RDEPENDS
  bitbake.conf: resurrect unexported PKG_CONFIG_DIR for installs
  Reverse the order of OVERRIDES
  utils, oe.utils: add 'uniq' function
  bitbake.conf: sanitize FILESPATH

Daniele Ricci (1):
  mokosuite2: bump SRCREV, many bugs fixed and a test version of mokomessag=
es

Denis 'GNUtoo' Carikli (2):
  android-rpc_git: fix libgee link failure
  linux-bug: fix installation

Frans Meulenbroeks (16):
  gcc : moved unused files to obsolete dir
  gdb : moved unused files to obsolete dir
  git : moved unused files to obsolete dir
  gkdial : moved unused files to obsolete dir
  glib-2.0 : moved unused files to obsolete dir
  gmp : moved unused files to obsolete dir
  gnuradio : moved unused files to obsolete dir
  gputty : moved unused files to obsolete dir
  gypsy : moved unused files to obsolete dir
  openjade : moved unused files to obsolete dir
  libxine : moved unused files to obsolete dir
  Revert "openjade : moved unused files to obsolete dir"
  u-boot_git: added dont-inline-weak-symbols patch for hawkboard
  gnutls_2.10.1: remove the libtool-m4-macros
  python-twisted: removed 2.5.0 version
  php: version 5.2.13 removed --without-iconv

Graham Gower (6):
  galago: move to obsolete.
  prboom_2.5.0.bb: fix compilation failure due to undefined references.
  ion: move to obsolete.
  lua, lua-gtk2: move to obsolete.
  dsniff_2.3.bb: fix buildability.
  mbmerlin_0.8.1-2.bb: Don't overwrite a file staged by libx11.

Henning Heinold (6):
  icedtea6-native: update to version 1.7.5
  openjdk: update to version 1.8.2, because of security issues
  directfb: update to version 1.4.6
  disko: update to version 1.7.0
  oe.unpack: fix subdir-feature
  libsdl-ttf: fix version 2.0.10 by removing the libtool-m4-macros

Jesse Gilles (2):
  ruby: fix socket extension compile
  ruby: update SRC_URI in ruby.inc

Justus Winter (2):
  inkspill: add recipe for nice little game written by Al Sweigart.
  dns2tcp: add recipe for dns2tcp-{client, server}

Khem Raj (16):
  openjade_1.3.2.bb: Add missing patch to native build.
  curl_7.21.1.bb: DEPENDS for native and sdk recipes needs to be tuned
  libtool: Abstact more common things to libtool.inc
  binutils-cross-sdk.inc: Do not install ${D}${infodir}/dir
  eglibc_2.12/eglibc_svn: Update to latest svn tip
  gnuradio: Fix build with libtool 2.4
  distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library s=
ear
  gcc-cross-intermediate.inc: Move libgcc from cross dir to target sysroot
  gcc-package-cross.inc: Edit the libdir enties in libstdc++.la and libsupc=
++.
  libtool-2.4: Append lt_sysroot to libdir
  curl: Fix build for native BBLASSEXTEND
  libgee.inc: Use libtool macros from installed libtool
  openldap_2.4.23.bb: Fix build when using libtool 2.4
  openjade_1.3.2.bb: Update configury to make it autreconf'able
  gcc-cross4.inc: We dont support multilib so empty out the with-libdir-lis=
t f
  lirc: Add recipes for 0.8.7 release

Koen Kooi (61):
  kernel bbclass: split do_compile into do_compile and do_compile_modules
  kernel bbclass: make 'kernel-modules' meta-package use RRECOMMENDS to ple=
ase
  multi-kernel: adapt to kernel_do_compile_kernelmodules change in kernel.b=
bcl
  linux-omap: add 2.6.36rc7, only for beagleboard at the moment
  omap3.inc: set TARGET_ARCH to arm
  omap4430-panda: work around image depends
  u-boot-sakoman: fix build
  linux-sakoman 2.6.35: fix build
  linux-sakoman: remove autorev and non OE machines
  x-load-sakoman: remove autorev
  u-boot-sakoman: remove autorev
  linux.inc: add knob to turn off cortex a8 fixups     linux-sakoman 2.6.35=
: u
  x-load-sakoman: fix typo
  dosbox: add 0.74
  angstrom-next: switch to a newer pulseaudio
  padevchooser: bump PR for pulseaudio change
  paprefs: bump PR for pulseaudio change
  pavucontrol: add 0.9.10
  bluez4: add 4.75, fix alsa packaging
  obexd: add 0.34
  linux-davinci: add 2.6.31+2.6.32-rc2-psp03.01.00.37
  libcanberra: update to 0.26
  ti-dmai svn: bump SRCREV for omap3 and dm365
  linux-davinci 2.6.32rc2: fix typo in name and switch dm365 to use this re=
cip
  ti-dmai svn: bump dm365 SRCREV after kernel change
  angstrom-next: switch to udev 154
  linux-omap 2.6.36rc: move SRCREV forward
  ti-codecs-omap3530: add version 4 with c6accel support
  angstrom-codec-engine-latest-preferred-versions: use version 4 of omap353=
0 c
  gstreamer-ti: bump PR for omap3 codec changes
  libwnck: add 2.30.5
  libwnck 2.30.5: add missing dep on gobject-introspection-native
  imagemagick: enable libtoolize
  mikmod: remove hack to work around powerpc toolchain bugs from 3 years ag=
o
  mikmod: libtool 2.4 fix 2/2: sed out -L/usr/lib from gcc cmdline
  totem-pl-parser 2.30.0: fix build with libtool 2.4 sysroot
  omap3-sgx-modules: make patch apply with all versions of patch
  gnome bbclass: disable introspection
  atk 1.30.0: bump PR for introspection change
  gnome-bluetooth 2.30.0: bump PR for introspection change
  gstreamer: bump PR for introspection change
  epiphany: fix EXTRA_OECONF
  xst: bump PR for pkgconfig changes in bitbake.conf
  python-pygobject: forcefully disable introspection
  angstrom-version: make lsb_release work with GNOME
  linux-omap4: add 2.5.35.3 from ubuntu git
  omap4-sgx-modules: add L24.9
  x-load-rsalveti: add x-load 1.41 built from Salveti's tree
  omap4430-panda: update machine config to match latest MLO and linux provi=
der
  angstrom-led-config: add pandaboard support
  ti-dmai: pass c6accel location to makefile
  system-tools-backends: update to 2.10.1 and make it work with libtool 2.4
  gnome-screensaver: add 2.30.2
  imagemagick: add missing lcms dependency
  angstrom next: bump DISTRO_PR for overrides and filespath changes
  ti-staging: expand staging hack to pkgconfig as well
  gnome-icon-theme: add 2.31.0
  ti-c6run: add 0.94.04.05
  recipes/ti: fix permissions
  gtk+ 2.20.1: disable introspection
  gnutls: don't fail on missing files we try to rm

Martin Jansa (25):
  mokojeweled: bump SRCREV
  mokosuite2: bump SRCREV
  dbus: move initscript and patches shared by all dbus versions to shared d=
bus
  dbus: add recipe for git version
  task-shr-feed: add ffphonelog and inkspill
  vala-terminal: bump SRCREV for new vala detection
  python-numeric: add newer version 24.2
  python-setuptools: add newer version 06c11
  libsdl-ttf: add newer version 2.0.10
  iliwi: add missing libgee DEPENDS
  ffalarms: fix build with newer vala
  libsdl-ttf_2.0.10: add DEFAULT_PREFERENCE -1 as it doesn't build with def=
aul
  directfb_1.4.6: update mkdfiff.patch to fix building with newer eglibc
  SHR: prefer libtool 2.4
  EFL: bump SRCREV a bit more
  SHR: use newer python-pycairo
  xorg-font-common: use BPN instead of XORG_PN
  font-util_1.1.1: replace -native recipe with BBCLASSEXTEND
  font-util: add version 1.2.0
  xserver-xorg: move from 1.9.0.901 to 1.9.0.902
  shr: bump DISTRO_PR after gcc changes
  linux(-kexecboot)_git: bump SRCREV for 2.6.36-rc8
  task-shr-feed: add dns2tcp
  libgee_0.6.0: add gobject-introspection-native to DEPENDS again
  pixman: drop D_P -1 for 0.18.4 and 0.19.4 versions

Michael Smith (2):
  package.bbclass: copy dotfiles in root D to PKGD
  Revert "package.bbclass: copy dotfiles in root D to PKGD"

Paul Menzel (3):
  gedit: sort `DEPENDS` alphabetically
  gedit: GPLv2+ is the correct the `LICENSE`.
  glib-2.0_2.24.1: fix `error: Could not find a glib-genmarshal in your PAT=
H`

Philip Balister (3):
  uhd: Add recipe for Ettus Research Universal Hardware Driver.
  gnuradio: Update GNU Radio recipe. Clean up configuration settings.
  gnuradio: Remove old recipes. I promise to deal with all user fall out pr=
omp

Scott Garman (1):
  cpio: update 2.5 to 2.11

Sean Cross (2):
  c-ares: Fix configure.ac
  libsamplerate: Fix checksums to match downloaded file

Simon Busch (2):
  libgee: define common INC_PR and use it in all specific version recipes
  libgee: remove unnecessary dependency on gobject-introspection

Steve Sakoman (5):
  x-load: Add recipe to build from sakoman.com x-load repository
  u-boot: Add recipe to build from sakoman.com u-boot repository
  linux: Add recipe to build from sakoman.com linux repository
  omap3-sgx-modules: Fix to build for recent linux-omap kernels
  machine conf: Add Panda

Tasslehoff Kjappfot (1):
  apr-util_1.3.4: Build without Postgres support

Thomas Zimmermann (4):
  obexd_0.34.bb: remove fso patch
  obexd_0.34.bb: DEPEND on libical
  efm-{nav, path, pathbar}: add new recipes
  notification: add new recipe

Tim Harvey (1):
  gdb-cross-sdk.inc: Do not run autoreconf

Tom Rini (15):
  samba: Drop name=3Dsrc from checksums
  samba, samba-ads: Update to 3.5.6 for security fixes
  freetype: Add 2.4.3
  motorola-ezx-base.inc: Add iwmmxt to PACKAGE_EXTRA_ARCHS
  gdb-cros-sdk.inc: Update our DEPENDS list
  tiff: Update to 4.0.0beta6
  udev 141/151/154: Fix update-rc.d logic for udev-cache
  zlib.inc: autotools.bbclass handles libtool depends
  gdb-cross/cross-sdk: Fixup DEPENDS further
  gdb-cross-sdk.inc: We must use do_configure_append
  freetype: Drop old recipes
  .gitignore: Add .pyo files, expand contrib mask
  gdb (all): Add bison-native to DEPENDS
  openswan: Update to 2.6.29
  cups14: Drop legacy bits, correct libusb dep

Ulf Samuelsson (5):
  Use common files for AT91SAM9 configuration
  Add AT91SAM9 linux-2.6.30 from www.linux4sam.org
  Add u-boot-2009.11 support for AT91SAM9
  Add X-Windows support for AT91SAM9G45 LCD controller
  Add X11 images with more multimedia support (mplayer etc.)

Vitus Jensen (2):
  htmldoc-gui_1.9.x: remove, there is no GUI code in developer snapshots
  htmldoc_1.8.27:: merge native and non-native recipes

=C5=81ukasz Pankowski (2):
  ffphonelog: new recipe from SHR
  ffalarms: bump SRCREV, remove patch applied upstream


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


