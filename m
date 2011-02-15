Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PpBXc-0007Zn-Mz
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 04:25:29 +0100
Received: by wyb40 with SMTP id 40so5235411wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 19:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vBjd2Ptomeh68sjkdveFx954lqA71q+dsmO0F2j1Ppo=;
	b=BxBEinLWjs0I0lufwTUzXC3fMzKFrEiJf1iqr/KnQx27rAwtzmUl5hQ2LONqrX6G+3
	vvAZuV1Icv6J3ZMChuhYzjN/nt/XTVkqEwKny/71wXS/mdQ3JMrwEbzpjrlCNRyqQbI3
	GoydDlWhSKbmt2P7P2xT46pVLZDJXrBHyckl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kLis3IfVu0jtQc5OAkTVPE1O+jKDmVLyQmme4tXxVFZnU3hWwD+87zAKoy4q+lgrkc
	47ta2r2Ezosfgy9zUJUADHJu3cK0k40Cb/DxKW8pcT8YGZT/kJ5T/iQMpwK4gCN5U+M2
	3sWJup5F3O+bSWvL01e5COfz6ZyCFMl1CVznk=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr3980649wel.4.1297740258740; Mon,
	14 Feb 2011 19:24:18 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Mon, 14 Feb 2011 19:24:18 -0800 (PST)
Date: Mon, 14 Feb 2011 22:24:18 -0500
Message-ID: <AANLkTimVR+YQUk-E6Hnv47KounrkSovynNj+26WY+pCe@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for 2011-02-07 to 2011-02-14
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
X-List-Received-Date: Tue, 15 Feb 2011 03:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2011-02-07 to 2011-02-14

AJ ONeal (1):
  nodejs: updated to 0.2.6

Alex Ferguson (4):
  fileselector: Update version from 1.3.1 to 1.3.2
  jlime-extras-ben-nanonote: Update version from 1.0.1 to 1.0.2
  jlime-extras: Update version from 1.0.6 to 1.0.7
  linux-jlime-ben-nanonote: Add support for USB networking

Andreas M=FCller (4):
  clutter-gst add 1.3.4
  clutter: fix broken clutter-gtk
  clutter: get dependency to json-glib to work
  Add a small helper script listing all recipes with QA errors.

Andreas Oberritter (15):
  libdca-0.0.5-3: initial recipe (Debian)
  libmms-0.6: initial recipe
  linux: don't patch unifdef.c if it doesn't exist
  upstart: create directory before installing files into it
  wpa-supplicant-0.7.3: remove unused files
  wpa-supplicant-0.7.3: rename defconfig-gnutls to defconfig
  wpa-supplicant-0.7.3: install only required files for dbus support
  wpa-supplicant-0.7.3: enable madwifi support
  wpa-supplicant-0.7.3: depend on openssl
  busybox: create busybox-inetd package
  utils.bbclass: restore previous implementation of explode_deps()
  package.bbclass: remove superfluous whitespace characters from RDEPENDS
  package_ipk.bbclass: use common function to write relationship fields
  gitpkgv.bbclass: rename git_drop_tag_prefix to fix conflict
  gst-plugins-base-0.10.32: use integer-based resampling without FPU

Bernhard Reutner-Fischer (10):
  fakeroot: add 1.14.5, mv 1.12.4 to obsolete
  packaged-staging.bbclass: improve documentation
  IMAGE_CMD_ext4.xz: rm uncompressed image
  ltp: bump version
  uclibc: handle some more {machine, distro}_features
  kernel.bbclass: simplify "if image" condition
  image.bbclass: only insert feed uris if ONLINE_PACKAGE_MANAGEMENT
  util-linux: honour largefile distro feature
  busybox: 2.4 module support for kernel24 MACHINE_FEATURES
  micro: get preferred binutils from sane-toolchain

Chris Larson (6):
  oe.types: for invalid type, list valid ones
  More sane naming for the variable typing code
  oe.test_types: improve naming/organization
  packaged-staging: add debug info for oe_run failures
  utils: drop exported var env caching for oe_popen
  Revert 6a7f8c in favor of a real fix

Denis 'GNUtoo' Carikli (1):
  xserver-xorg-conf: fix htcdream calibration and Monitor entries

Denys Dmytriyenko (3):
  udev-141: backport the initscript depmod call from recent versions
  udev: also use /proc/devices to invalidate devcache
  insane.bbclass: fix the check for bad RPATH

Enrico Scholz (1):
  cortex-m3: adjusted target cflags

Filip Zyzniewski (18):
  rootfs_deb.bbclass: removed $(( ... )) operator usage.
  apt_0.7.20.2: fixed compilation errors with gcc-4.4.
  apt: remove references to not-built man pages.
  dpkg-native: Fix the admindir location.
  update-alternatives-dpkg: make it work.
  rootfs_deb.bbclass: fix alternatives handling
  base-files: update fstab for jornada7xx
  initscripts: handle busybox version of makedevs properly.
  initscripts: removed jornada7xx specific scripts.
  distro/jlime-2010.1.conf: cleaned up RDEPENDS, beefed up FEATURES.
  dpkg: add perl modules package
  MAINTAINERS: add committer's entry.
  makedevs: increase alternatives priority
  deb packages support: switch from /var/dpkg to /var/lib/dpkg
  image.bbclass: move insert_feed_uris() to rootfs_ipk.bbclass
  package_deb.bbclass: Use PKGV/PKGR variables where applicable.
  package_deb.bbclass: depend on apt, not dpkg.
  package_deb.bbclass: remove double DISTRO_PR from the package version.

Frans Meulenbroeks (2):
  u-boot: added 2010.12 recipe (DEFAULT_PREFERENCE =3D -1)
  kirkwood: move preferred kernel provider to linux

George Alexandru Dorobantu (1):
  libtomcrypt: updated download link

Graeme Gregory (3):
  u-boot : for omapzoom2/3 and gcc 4.5 the -Os optimisation produces a     =
u-b
  linux-omap_2.6.38.bb: add 2.6.38-rc4 version
  omapzoom2/3.conf : switch to linux-omap kernel

Henning Heinold (10):
  directfb: update directfb 1.4 to directfb 1.4.11 and switch to INC_PR sup=
por
  disko: fix legacy staging
  disko: update git version, use INC_PR, re work disko.inc usage
  libsdl: use new .inc for 2.1.14 version
  pulseaudio: fix build for uclibc again and bump PR
  pulseaudio: add version 0.9.22 with DP=3D-1
  libsdl-mixer: fix it the same way as the libsdl recipe and bump PR
  libsdl-directfb: delete unpinned version 1.2.9
  sqlite3: add version 3.7.3, which has a lot of goodies, use DP=3D-1
  sqlite3: add now really latest version 3.7.5 of sqlite

Javier Martin (6):
  Add configuration file for Visstrim_M10 board.
  Add custom fstab and profile for Visstrim_M10 board.
  Add custom init dropbear script and image for Visstrim_M10.
  Add custom opkg settings for Visstrim_M10 board.
  Add custom fw_env.conf for Visstrim_M10 boards.
  Make kernel 2.6.37 selectable for Visstrim_M10 board.

Khem Raj (8):
  gst-rtsp: Upgrade from 0.10.7->0.10.6
  module-init-tools: Add recipe for 3.12
  module-init-tools-cross_3.12.bb: New cross recipe for versions 3.12
  python-dir.bbclass: Add checks for 2.7 and 3.1 as well
  check_0.9.5.bb: Add patch to use quadrigraphs in macro names
  gst-rtsp.inc: Add check to DEPENDS
  python_2.6.6.bb: Fix QA ERRORS due to staging libdir in rpath
  Revert "gst-rtsp.inc: Add check to DEPENDS"

Koen Kooi (9):
  u-boot git: beagleboard: add more expansionboards and rediff patches
  linux-omap 2.6.37: catch up with beagleboardtoys wifi rename
  u-boot git: add missing patch to beagle. Thanks to Steve K for spotting t=
hat
  iw: bump PR for nl2 change
  networkmanager git: update to 0.8.3
  networkmanager git: up DP for angstrom
  linux-omap 2.6.31: remove DP for zoom2
  rfkill: fix install and remove bogus DEPENDS, it's not using libnl nor pk=
gco
  libmms 0.5: move to libmms dir

Marco Cavallini (3):
  fbv_1.0b.bb: added support for new fbv-1.0b-BGR666.patch
  fbv-1.0b-BGR666.patch: patch for support BGR666 @ 24bpp
  packaged-staging.bbclass: partial revert of commit fe706bb9af34ce43e8ec55=
fbf

Martin Jansa (13):
  xserver-xorg: 1.9.3.902 was released as 1.9.4, rename
  xkbcomp: upgrade from 1.2.0 to 1.2.1
  shr-e-gadgets: bump SRCREV
  msmcomm: bump SRCREV for version compatible with current cornucopia rev
  shr-e-gadgets: add path to edje-cc
  eject: use u-a for /usr/bin/volname
  util-linux-ng: use u-a for /sbin/blockdev
  spojegui: fix build without ipkg-build and fix QA issues
  python: upgrade from 2.6.5 to 2.6.6
  python: merge few s/python/${PN}/g from poky
  python: generate-manifest-2.6.py, sort packages when generating output fi=
le
  python: generate-manifest-2.6.py, more s/python/${PN}/g and regenerate it
  python: generate-manifest-2.6.py, update few entries

Michael 'Mickey' Lauer (1):
  fsogsmd: bump; we rely on libgisi / gisicomm now instead of libisi

Mike Westerhof (11):
  slugOS: base-files - add ext4 support, don't assume jffs2 in fstab.
  SlugOS: opkg-collateral.bb - add tmp_dir change for SlugOS as well.     (=
No
  SlugOS: /etc/filesystems - change ordering for compatibility.     (ext3 i=
s b
  SlugOS: turnup - create /var/lib/opkg/tmp directory (for opkg).
  SlugOS: Add SlugOS-specific patch to opkg, switch SlugOS to opkg.     Not=
hin
  SlugOS: initscripts-slugos -- add /var/lib/opkg/tmp to volatiles for Slug=
OS
  SlugOS: slugos-init/files/functions -- fix spurious shell error message
  SlugOS: slugos-init - No longer switch to DHCP if static IP=3D=3D192.168.=
1.77
  SlugOS: tast-slugos -- add kernel-module-ext4 in current dev images.
  SlugOS: slugos.inc -- bump up to SlugOS 5.8
  SlugOS: ucslugc -- switch to use standard opkg.

Otavio Salvador (5):
  slang: fix 2.2.2 URL
  gitpkgv.bbclass: return None if repository does not exist
  libnewt: include latest fixes and allow python removal
  cmake-sdk: add 2.8.2 recipe
  tzcode-native: update to 2011b

Stefan Schmidt (10):
  wpa-supplicant-0.7: Enable the nl80211 driver
  iw: Its compatible with libnl2 as well use it.
  jni-library.bbclass: Override JAVAH for our jni recipes.
  buglabs/repo-feeds: Feed configs for external use
  buglabs/dauber-feeds: Feed config for internal repos
  bug-x11-image: Add X11 buglabs image
  buglabs/jnotify: Add recipe for java notify usage
  bug2v4l2: Fix recipe to atcually work.
  usb-modeswitch: Patch makefile to use portable install options.
  usb-modeswitch-data: Patch makefile to use portable install options.

Steffen Sledz (1):
  testscript.sh: be able to use branches other than testing-next

Tom Rini (5):
  postgresql: Update from 8.4.4 to 8.4.7, drop 8.1.x, 8.2.4
  linux 2.6.28: Add name param to ronetixpatch URL.
  packaged-staging: Don't pass a trailing ' ' to bb.mkdirhier
  u-boot: Make sure we use override HOSTCC for env tools
  linux.inc: Add lzma-native for nokia900

Ulf Samuelsson (10):
  Add support for at91bootstrap-3.0
  Add ALSA support for at91sam9xe
  Add initial pointercal files for at91 boards
  Add X arguments for AT91 boards
  Add Wi-Fi support to at91
  Remove some patches, which was moved by previous linux patch
  make sd-boot default for sam9m10ekes
  Indicate availability of sd-boot for at91sam9g45/m10
  Add basic at91 image with Wi-Fi support
  Add support for user-defined multimedia in rootfs

Yuri Bushmelev (3):
  src_distribute.bbclass: iterate over SRC_URI instead of using urldata
  oestats-client.bbclass: fix bug in oestat_send() code
  tinderclient: Remove it (obsoleted by oestats-client)

chase maupin (1):
  cups: fix desktop file QA issues


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


