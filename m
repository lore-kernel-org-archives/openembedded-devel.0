Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PTlTw-0007uu-1N
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:21:08 +0100
Received: by wwi18 with SMTP id 18so1136459wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 17:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=8B5LY86Y6cOjprVwCTlfbABhva8w22KycG7CGeuKOd8=;
	b=i6XSeP8GRq0OlOvMnl4Ibr03a4OYK2h7SnKOiDAQ1dm11UxAuIvv+YsR2+sK5uUJV6
	ZOueTBo9rU3mbgRCTpxVXa/AX+YmP4rC75htqm59rnUo5dFtEAZoj9W3EVvxhauaix+x
	hnFvtxn0z0hPWiqBGYK9goyQihkVqsVlZyQLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=g949/Qe8X2ZaHTKP0jYIt8hp2TxQyC4eV31u7X0fkxoLxhzmPA8g14ok8VF1u9Cih1
	bOianICAg5ZgmSBFKqrIpWv0UiPf3e9xU9Hzz+jCtUHuax0tpBkAnc5lUuurXHIOw9MI
	M+h20ElcUHQTykabXu3UOw8R5Ju3uuwLUJG1I=
MIME-Version: 1.0
Received: by 10.216.52.206 with SMTP id e56mr1159140wec.19.1292594381558; Fri,
	17 Dec 2010 05:59:41 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Fri, 17 Dec 2010 05:59:41 -0800 (PST)
Date: Fri, 17 Dec 2010 08:59:41 -0500
Message-ID: <AANLkTin32onS1NA+KZoRwaaZHh8RX67VbYsOiPMaaPvb@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for 2010-12-06 to 2010-12-13
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
X-List-Received-Date: Sat, 18 Dec 2010 01:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-12-06 to 2010-12-13

Aeschbacher (1):
  qte: fixed do_configure() for powerpc

Aeschbacher, Fabrice (1):
  libsdl-directfb: fixed qa_configure error

Alex Ferguson (2):
  muffinman-image: Remove IMAGE_DEVICE_TABLES definition.
  jlime-extras: Bump from version 1.0.2 to version 1.0.3.

Andrea Adami (1):
  ohm: bump git SRCREV to 2010-02-11 master

Andreas Oberritter (23):
  mythtv: depend on virtual/libsdl instead of libsdl-x11
  linux-omap-hah: remove unused variable CVS_TARBALL_STASH
  openssl: allow to add configure options through EXTRA_OECONF
  vsftpd-2.0.5: don't run pkg_postinst on host
  efl1: depend on virtual/libsdl instead of libsdl-x11
  libsdl: depend on virtual/libsdl instead of libsdl-x11
  vlc: depend on virtual/libsdl instead of libsdl-x11
  libtheora: depend on virtual/libsdl instead of libsdl-x11
  python: depend on virtual/libsdl instead of libsdl-x11
  nogravity: depend on virtual/libsdl instead of libsdl-x11
  quake: depend on virtual/libsdl instead of libsdl-x11
  ffmpeg: set default license to GPLv2+, because --enable-gpl is used.
  gst-plugins-bad: update EXTRA_OECONF (mjpegtools, sdl)
  oe-stylize: remove trailing newline when printing unknown variable/routin=
e
  gst-plugins-base: update to 0.10.31
  gst-plugins-good: update to 0.10.26
  gstreamer: remove unpinned versions
  gst-plugins-good: remove unpinned versions
  gst-plugins-ugly: remove unpinned versions
  gst-plugins-base: removed unpinned versions
  gst-plugins-bad: remove unpinned versions
  gst-ffmpeg: remove unpinned versions
  gst-plugins-good: remove unpinned versions

Chris Larson (2):
  base: use bb.plain, not print for build_summary
  srctree: create stamps for executed functions

Daniele Ricci (5):
  mokosuite2: bump SRCREV for mokohome removal
  libmokosuite: create theme symlink on install_append
  mokohome: new recipe for mokohome replacement from mokosuite2
  task-shr-feed: add libmokosuite and mokohome
  libfreesmartphone-glib: bump SRCREV and version, now depends on fso-specs

Denys Dmytriyenko (3):
  flac: fix missing gettext dependency, convert to INC_PR
  external-toolchain-csl: license-related cleanup and fixup
  gst-plugins-bad: add dependency on librsvg

Eric B=C3=A9nard (1):
  meta-toolchain: fix directories rights

Frans Meulenbroeks (5):
  cdparanoia: added HOMEPAGE and DESCRIPTION
  libcdaudio: updated LICENSE to LGPLv2+
  removed unused var AUTOTOOLS_STAGE_PKGCONFIG
  initrdscripts/initramfs-uniboot_1.0.bb: DESCRIPTON -> DESCRIPTION

Graham Gower (4):
  debianutils.inc: Fix do_install for DISTRO=3Dmicro.
  gzip_1.4.bb: Fix do_install for DISTRO=3Dmicro.
  task-proper-tools.bb: Exclude some packages if DISTRO_FEATURES lacks ipv6=
.
  autoconf_2.65.bb: Fix build for DISTRO=3Dmicro.

Jayen Ashar (1):
  libQGLViewer: New program

Jeff Lance (2):
  matrix-gui: updating SRC rev to pick up new platforms and matrix code enh=
anc
  matrix-gui: Adding additional platform support

Khem Raj (11):
  binutils_git.bb: Bump SRCREV to latest 2.21 branch
  eglibc_svn.bb/eglibc_2.12.bb/eglibc_2.11.bb: Bump SRCREV
  pw-am.sh: Point to new patchwork address
  binutils_git.bb: Move to master now that 2.21 is released
  binutils-2.21: Add recipes for binutils 2.21 release
  binutils-cross-sdk_2.21.bb,binutils-cross_2.21.bb: Use binutils_2.21.bb i=
nst
  js_1.5.bb: Beat it to respect LDFLAGS
  gcc/gcc-cross/gcc-cross-intermediate: Generate libgcc_s.so as a linker sc=
rip
  sane-toolchain.inc: Prefer libtool version 2.4 with sysroot.
  gcc-4.5.inc/gcc-svn.inc: Dont do the sourcedir move dance.
  binutils_2.21.bb: Fix the build when using libtool 2.4

Klaus Kurzmann (3):
  udev_151.bb: add pre-generated 70-persistent-net.rules for nokia900
  udev_162.bb: add nokia900 rules
  udev_162.bb: actually install rules for nokia900 and bump PR

Klaus Schwarzkopf (28):
  asterisk_1.2.24: Set correct Checksum
  msynctool_0.22: fixed SRC_URI
  picocom_1.3: fixed SRC_URI
  qxmp_1.0: fixed SRC_URI
  redfang: fixed SRC_URI
  ntfs-3g_1.0: fixed SRC_URI
  u2nl_1.3: fixed SRC_URI
  uml-utilities_20040406: fixed SRC_URI
  xfcalendar_4.2.3: fixed SCR_URI
  dasher-gpe_0.0-svn: fixed SRC_URI
  esc-gst_6: fixed SRC_URI
  esc-media_5: fixed SRC_URI
  libbacon_svn: fixed SRC_URI
  gtk2-ssh-askpass_0.3: fixed SRC_URI
  hibernate-script_1.12: fixed SRC_URI
  kanjipad_svn: fixed SRC_URI
  kismet_svn: fixed SRC_URI
  litestream_1.3RC3: fixed SRC_URI
  mathomatic_12.4.2: fixed SRC_URI
  maxima_5.21.1: fixed SRC_URI
  modphp_5.1.6: fixed SRC_URI
  murasaki_0.8.8: fixed SRC_URI
  openal_0.0.8: fixed SRC_URI
  pwlib_1.6.6.4: fixed SRC_URI
  qc-usb-messenger_1.1: fixed SRC_URI
  scsi-idle_2.4.23: fixed SRC_URI
  opie-scummvm_1.0.1: fixed SRC_URI
  sidplay-base_1.0.9: fixed SRC:URI

Koen Kooi (6):
  gvfs: add 1.6.6 which works with a recent glib
  modemmanager: add 0.4 with a patch to fix build against recent glib
  linux-omap 2.6.37rc: bump to rc5
  gstreamer: properly fix gettext problems once and for all
  gstreamer: add 0.31, since gst-plugins-base needs at least that version
  gst-plugins: make inherit gettext actually work

Kristoffer Ericson (1):
  jornada7xx.conf: Add relevant X settings

Maksym Parkachov (2):
  mcpp: fixed crash issue with slice2cpp
  icee: New program ZeroC IceE

Martin Jansa (23):
  cornucopia: bump SRCREV
  e-base: bump EFL_SRCREV for beta3
  recipes: PR bump after EFL SRCREV change resulting to different .so names=
.
  msmcomm: bump SRCREV to compatible version with current cornucopia SRCREV
  eglibc_2.1[12]: remove upstream applied eglibc-make-382 patch
  shr: bump PE after 7bfcf5198dc06e18b20088d1753b299e8fa5ad90 for upgradeab=
le
  matchbox-panel-2: fix build with newer revision for eglibc
  mokosuite2: move older recipes from openmoko-3rdparty also to mokosuite2 =
dir
  mokowm: bump SRCREV
  elmdentica: add elmdentica-themes to RDEPENDS
  fso-specs,libfso-glib: bump SRCREV and PV
  webkit-efl: bump SRCREV and add patch for scrolling issue
  ffphonelog: bump PR after last EFL_SRCREV change
  xorg: new xbacklight, xkbevd, xbitmaps, resourceproto, xproto versions 20=
10-
  bump.preferred-xorg-versions-live.sh: pin also -nativesdk and -sdk versio=
ns
  preferred-xorg-versions-live.inc: regenerate with updated contrib script
  preferred-shr-versions: remove pinned versions which are default now
  preferred-shr-versions.inc: remove P_V_udev to upgrade from 151 to curren=
t d
  mtd-utils-native: remove DEFAULT_PREFERENCE
  edje-viewer,eve,edbus,ethumb: use SRC_URI from e-base.bbclass
  libdrm: add new version 2.4.23
  libdrm: remove old not pinned versions, update libdrm.inc
  qemu-0.13.0: add D_P -1 for now, some people have segfault with it where =
0.1

Matt Thompson (1):
  wxwidgets: added libxinerama to DEPENDS

Michael 'Mickey' Lauer (1):
  fsodeviced: we need the full i2c-dev.h nowadays, so let's depend on i2c-t=
ool

Michael Smith (1):
  iproute2: upgrade to 2.6.35.1

Paul Menzel (6):
  eina: Remove `gnu_source.patch` which was applied upstream.
  inkscape_0.48.0: add `boost` to `DEPENDS`
  midori: add `openssl` to `DEPENDS` and remove trailing whitespace
  gypsy: add `bluez4` to `DEPENDS` instead of `bluez-libs`
  vlc_1.1.4.1: add `lua5.1-native` to `DEPENDS` and `lua5.1` to `RDEPENDS`
  xbmc_svn: add `jasper` to `DEPENDS`

Philip Balister (9):
  uhd : Add support for the USRP-E100.
  gnuradio : Update SRCREV to support current uhd api.
  uhd : Fix packaging for examples and test programs.
  Revert "autoconf.inc: Use 'which' to find m4"
  uhd : Bump SRCREV to pick up latest uhd fixes.
  autoconf : Bump PR after earlier revert.
  i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
  i2c-tools : Bump PR after changes to header file staging.
  i2c-tools : Remove legacy staging.

Roger Monk (3):
  ti-linuxutils: Add 2.26.01.02
  ti-framework-components: Add v2.26.00.01
  ti-codec-engine: Add version 2.26.02.11

Roman I Khimov (1):
  at 3.1.12: fix parallel make fix

Stefan Schmidt (3):
  linux-bug_2.6.27.2: Change SRC_URI to new location.
  u-boot-bug_svn: Change SRC_URI to new location.
  fbprogress_1.1: Change SRC_URI to new location.

Thomas Zimmermann (1):
  libphone-ui-shr: bump SRC_REV for message-list enhancements

Tom Rini (1):
  ust / userspace-rcu: Add recipes


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


