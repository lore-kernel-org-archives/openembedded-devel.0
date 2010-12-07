Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PPyfh-00007W-4E
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 15:37:39 +0100
Received: by ewy8 with SMTP id 8so7531414ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=vOhJ6JdTJZsNSW/Au3+lc1O6Mp3U/CymRFFwimAm3i0=;
	b=Qz+1O1T4kAFt1w/jELcrxZtH5PQwD4U+6kn6itFYKBzAb8iMBXY3u7d4ZQVxyM1I3G
	GuyvIQ1so2DjfP7y9nMHd3YuILaP3zR+lcoWAN2S52rFWXsJTbWoZq028Otc8Y4AjpQc
	u9IjvlVetYt96+Bo8n2AOdgzHiI8AOBO5db80=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=KA6jIOuvbv4lDH37/Gk1Xqt+XfR5ytMBTahKID0dQShQ18rR9gOczh+u5+BIRYF7Kz
	NsUOpNK4uSmeWBBViH77XFSjKnldcP7bP8pNaj1fmgD1ACcIGHyc8WjUEMWIjSLBeQHu
	0eJM9BbvincF6cLulxXeriLsNl9Rvm7qXXvJo=
MIME-Version: 1.0
Received: by 10.216.162.70 with SMTP id x48mr447708wek.4.1291732570613; Tue,
	07 Dec 2010 06:36:10 -0800 (PST)
Received: by 10.216.235.214 with HTTP; Tue, 7 Dec 2010 06:36:10 -0800 (PST)
Date: Tue, 7 Dec 2010 09:36:10 -0500
Message-ID: <AANLkTinwToVev48_ehHomQ+T_1G3ivLNc+EL-a8WVR15@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.44
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,FUZZY_VLIUM,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-11-29 to 2010-12-06
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
X-List-Received-Date: Tue, 07 Dec 2010 14:37:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-11-29 to 2010-12-06

Alex Ferguson (5):
  netsurf: Update recipes, fix_makefile.patch for netsurf.
  fileselector: Update recipe to version 1.3.
  jlime-extras-nanonote: Update recipe to version 1.0.1.
  linux-jlime-ben-nanonote: Update bootsplash for new jlime logo.
  psplash: Update psplash-poky-img.h for new jlime-logo.

Daniele Ricci (2):
  librest: git is now hosted on gnome.org
  libmokosuite: new recipe

Denis 'GNUtoo' Carikli (7):
  xmame: fix runtime endianess issue and bump PR
  xmame: switch to x11 backend(to improve scaling performance on xv-enabled=
 de
  nokia900.conf: migrate to newer linux-nokia900 kernel and bump PR
  libsdl-mixer 1.2.11: wrap the mp3 dependency in enterprise and bump PR
  lightmediascanner: add new 0.4.1.0 version
  enjoy: add new recipe(efl music player)
  enjoy_svn: fix dependencies and bump PR

Denys Dmytriyenko (2):
  font-update-common: explicitly set LICENSE to MIT, as part of OE metadata
  policykit: update LICENSE to LGPLv2+

Eric B=E9nard (6):
  fix busybox' CONFIG_LFS
  fix busybox' CONFIG_LFS
  add task-qt4-x11 and qt4-x11 base & demo images
  qt-demo-init: correctly handle qtdemo for qt4-x11
  qt4x11: set QT_LIBINFIX and QT_DIR_NAME
  busybox-1.18.0: add latest fix

Frans Meulenbroeks (16):
  php: removed --enable-memory-limit configure argument; does not exist any=
 mo
  php: reinstated --without-iconv, this seems to generate configure issues
  mythtv: removed 0.22
  u-boot_git: updated SRC_URI for sheevaplug; moved to newer version
  cwiid: updated & fixed SRC_URI
  mythtv: moved to rev 27202
  mythtv: removed 0.22
  php: reinstated --without-iconv, this seems to generate configure issues
  php: removed --enable-memory-limit configure argument; does not exist any=
 mo
  php: add iconv support
  php: add iconv support
  gmpc/libmpd: update to 0.20.0
  cdparanoia_10.2.bb: fixed LICENSE
  gob2: updated to 2.0.17
  cdparanoia_svn.bb: updated SVN version; fixed LICENSE, added pkgconfig st=
uff
  libcddb: added missing dependency on gettext

Graham Gower (46):
  busybox-config.inc: Fix build when DISTRO_FEATURES lacks "largefile".
  util-linux-ng_2.17.bb: Fix for uClibc when DISTRO_FEATURES lacks "largefi=
le"
  gettext_0.18.bb: Fix build when uclibc lacks large file support.
  libxml2: Fix build when DISTRO_FEATURES lacks "largefile".
  orbit2_2.14.17.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  libdrm_2.4.22.bb: Fix build for uclibc when DISTRO_FEATURES lacks largefi=
le.
  glib-2.0_2.24.1.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  udev_124.bb: Fix build when DISTRO_FEATURES lacks "largefile".
  avahi_0.6.25.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  gnome-vfs_2.24.1.bb: Fix build when DISTRO_FEATURES lacks "largefile".
  sqlite3.inc: Fix build when DISTRO_FEATURES lacks "largefile".
  x264_r2245.bb: Fix build when DISTRO_FEATURES lacks "largefile".
  alsa-utils_1.0.20.bb: Fix build when DISTRO_FEATURES lacks largefile.
  openssl.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6.
  perl_5.8.8.bb, perl_5.10.1.bb: Fix build when DISTRO_FEATURES lacks large=
fil
  openjade_1.3.2.bb: Install catalog with the correct path.
  syslog-ng.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6=
.
  procps.inc: Fix do_install for DISTRO=3Dmicro.
  iputils_20071127.bb: Don't build ipv6 utils if DISTRO_FEATURES lacks ipv6=
.
  e2fsprogs_1.41.9.bb: Fix build for uclibc when DISTRO_FEATURES lacks larg=
efi
  openssl.inc: Use cp -L, busybox cp doesn't support the long option.
  inetutils_1.8.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  fbset_2.1.bb: Use ${sbindir} and ${datadir} instead of hardcoding.
  util-linux-ng.inc, e2fsprogs.inc: Use update-alternatives for uuidd.
  avahi_0.6.25.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  gnome-vfs_2.24.1.bb: Fix build when DISTRO_FEATURES lacks "largefile".
  sqlite3.inc: Fix build when DISTRO_FEATURES lacks "largefile".
  x264_r2245.bb: Fix build when DISTRO_FEATURES lacks "largefile".
  alsa-utils_1.0.20.bb: Fix build when DISTRO_FEATURES lacks largefile.
  openssl.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6.
  perl_5.8.8.bb, perl_5.10.1.bb: Fix build when DISTRO_FEATURES lacks large=
fil
  openjade_1.3.2.bb: Install catalog with the correct path.
  syslog-ng.inc: Fix build when DISTRO_FEATURES lacks largefile and/or ipv6=
.
  procps.inc: Fix do_install for DISTRO=3Dmicro.
  iputils_20071127.bb: Don't build ipv6 utils if DISTRO_FEATURES lacks ipv6=
.
  e2fsprogs_1.41.9.bb: Fix build for uclibc when DISTRO_FEATURES lacks larg=
efi
  openssl.inc: Use cp -L, busybox cp doesn't support the long option.
  inetutils_1.8.bb: Fix build when DISTRO_FEATURES lacks ipv6.
  fbset_2.1.bb: Use ${sbindir} and ${datadir} instead of hardcoding.
  util-linux-ng.inc, e2fsprogs.inc: Use update-alternatives for uuidd.
  bind: Fix for DISTRO=3Dmicro: s|/usr/bin|${bindir}|
  openjade_1.3.2.bb: Create directory before installing a file to that loca=
tio
  automake_1.11.1.bb: Don't try to execute perl.
  bind: Fix for DISTRO=3Dmicro: s|/usr/bin|${bindir}|
  openjade_1.3.2.bb: Create directory before installing a file to that loca=
tio
  automake_1.11.1.bb: Don't try to execute perl.

Khem Raj (11):
  powerpc-common: Cache alignof variables for postgresql
  powerpc-common: Cache alignof variables for postgresql
  eglibc: Move eglibc-static after eglibc-dev in order
  gcc-package-target.inc: Fix the broken libgcc_s.so symlink
  eglibc: Move eglibc-static after eglibc-dev in order
  gcc-package-target.inc: Fix the broken libgcc_s.so symlink
  Merge remote branch 'origin/release-2010.12'
  gcc-4.5: Apply linaro updates and upstream updates
  uclibc_git.bb: Bump SRCREV to latest git
  gcc-4.5: Refresh the lately added patches with quilt
  gcc-4.5.inc: Re-enable linaro/gcc-4.5-linaro-r99419.patch

Klaus Kurzmann (4):
  nokia900.conf: remove SERIAL_CONSOLE because it's causing a respawning ge=
tty
  nokia900.conf: remove SERIAL_CONSOLE because it's causing a respawning ge=
tty
  glib-2.0: add 2.26 with DEFAULT_PREFERENCE =3D "-1" and prefer it for SHR
  enjoy_svn.bb: add missing DEPENDS for the needed gst-plugins

Klaus Schwarzkopf (16):
  dcetest: fixed download link
  dash_0.5.5.1: New download link for patch
  cpusage_0.1: fixed download link
  dgen-sdl_1.23: fixed download url
  dircproxy_1.1.0: fixed download url
  disko_1.6.0: fixed SRC_URI
  dkg_1.6: fixed SRC_URI
  emelfm2_0.0.8: fixed SRC_URI
  frotz: new homepage
  gnome-games_2.30.2: add checksums
  hvsc_45: fixed SRC_URI
  libdessert: fixed SRC_URI
  libgsasl: fixed SRC_URI
  libspf2: fixed SRC_URI
  lvm2: fixed SRC_URI
  mb-applet-tasks: fixed SRC_URI

Koen Kooi (16):
  dropbear: remove 'set -e' from initscript
  gcc 4.3.3, 4.5: bump PR for gcc-package-target.inc fixes
  pixman 0.21.2: updates
  gcc 4.5: comment out patch that doesn't apply
  omap3-sgx-modules: some more for fixes for 2.6.37rc
  linux-omap 2.6.37rc: bump to rc4
  tune-cortexa8: change '-mfloat-abi=3Dhardfp' to '-mfloat-abi=3Dhard'
  powertop: fix CFLAGS in .inc and add a git version
  udev 162: fix libudev packaging
  ti-dsplink 1.65.00.03: add patch to fix build with recent kernels
  ti-local-power-manager: fix build with recent kernels
  ti-linuxutils 2.25.05.11: fix build with recent kernels
  Angstrom next: prefer linux-omap 2.6.37rcX as main kernel for beagle
  bc 1.06: fix segfault when using -l
  angstrom next: prefer glibc 2.26.x
  xorg-proto: move BBCLASSEXTEND to .inc

Kristoffer Ericson (2):
  /conf/machine/ben-nanonote.conf
  /conf/machine/ben-nanonote.conf

Martin Jansa (25):
  libxext-1.2.0: fix native build on some hosts
  e-wm-theme-illume-neo,elementary-theme-neo: bump SRCREV
  evopedia: bump SRCREV
  literki: fix SRCREV, fix few ugly parts
  linux_git: bump SRCREV for 2.6.37-rc4
  usermanual: update info with SRCPV, in recipe SRCREV and remove sane-srcd=
ate
  sane-srcdates.inc: remove from all distro configs as well as file itself
  opkg: move OPKG_SRCREV to opkg.inc directly
  shr: remove EFL_SRCREV from PV
  shr: add more PACKAGE_ARCH =3D all for theme and e-wm recipes
  e-wm,efl: create e-base.bbclass with common settings and EFL_SRCREV
  sane-srcrevs.inc: remove it from distro configs, and file itself
  linux-kexecboot_git: bump SRCREV for 2.6.37-rc4
  kernel.bbclass: put bluez-dtl1-workaround to DEPENDS directly
  module-init-tools: fix multiple runtime providers
  nokia900: build uImage instead of zImage
  nokia900.conf: MACHINE_EXTRA_RRECOMMENDS add needed kernel-modules
  e-base: bump SRCREV
  kernel.bbclass: put bluez-dtl1-workaround to DEPENDS directly
  module-init-tools: fix multiple runtime providers
  nokia900: build uImage instead of zImage
  nokia900.conf: MACHINE_EXTRA_RRECOMMENDS add needed kernel-modules
  exquisite-theme-illume: use e-base
  task-shr-feed: add enjoy and shr-theme-efenniht
  xorg: new versions 2010-12-06, xcalc, xeyex, xf86-video-savage and xserve=
r-x

Melissa Watkins (6):
  linux-davinci: enable UIO support in l138 defconfigs
  linux-davinci_git: Patch omapl138 kernel
  ti-pru-sw-edma-driver: first addition of PRU sw edma driver
  ti-pru-sw-edma-library: first addition of PRU sw edma library
  ti-pru-sw-app-loader: first addition of PRU sw application loader recipe
  ti-pru-sw-example: first addition of PRU sw examples recipe

Pau Espin Pedrol (3):
  e-wm-theme-illume-efenniht: add recipe for efenniht e17 theme.
  elementary-theme-efenniht: add recipe for efenniht elementary theme.
  shr-theme-efenniht: add recipe for efenniht shr theme.

Paul Menzel (2):
  enjoy: Fix commit 1265ac and append to `DEPENDS`.
  enjoy: add `elementary` to `DEPENDS`

Philip Balister (2):
  uhd-firmware : Convert to inc file and update recipe.
  uhd-firmware : fix bad path in require line.

Prabindh Sundareson (1):
  xgxperf: updated to SRCREV 77, fix build failure

Stefan Schmidt (5):
  hostap-daemon: Respect LDFLAGS for GNU_HASH
  contacts: Add 0.12 as latest release.
  alsa-state: Fix stereo configuration asound state for bug20
  hostap-daemon: Respect LDFLAGS for GNU_HASH
  alsa-state: Fix stereo configuration asound state for bug20

Steve Sakoman (1):
  udev: Add recipe for 162

Yuri Bushmelev (7):
  klibc: fix linking for mipsel
  kexec-tools-klibc: switch to using klibc's staged includes
  klibc: bump PR to force rebuild after mipsel fix
  contrib/testing: add testbuilder script
  klibc: fix linking for mipsel
  kexec-tools-klibc: switch to using klibc's staged includes
  klibc: bump PR to force rebuild after mipsel fix





=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5490 FIXED       Build of libxext_1.2.0 native failed

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


