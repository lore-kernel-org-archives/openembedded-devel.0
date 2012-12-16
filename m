Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhm-0005ms-L3
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:12:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705838eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=c7L9EdTongwxWVhvDlSZ0bzmUF8AXFE2ggPtlZlv6cY=;
	b=V6i9+A6gmVMj/KhlO6LWegN4W7qK4GytD/CLoABwE/Zmlbt8ji2MUcxizFYe1bAdxl
	531bmsYjc5zVsTBZgfvG9MB129CtZk57Gx/WgIFNt1S0O2cEy2WoV9RaCp4ic3swApMe
	K84LW2vMxGeNOJbiPn2XPr7wxEbOJllb8OITEdObRfif1RpePZTUlCxh0voUj2iOaL+L
	H20XBJd8IAzUXQGss3f3Und9QwT3/4tuX0mCxZv5j9KNWNXKEdTyZXh5//oEPCr9caZ9
	EAw3Pa7ziM9mBXtBQFmq0136r9xrOSD8hXAuW25DlgWz5YjulxXU/PT1wp9i7DpY4EeU
	hzEQ==
Received: by 10.14.0.71 with SMTP id 47mr33543526eea.19.1355680691235;
	Sun, 16 Dec 2012 09:58:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm23872808eep.15.2012.12.16.09.58.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:43 +0100
Message-Id: <cover.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [meta-oe][PATCH 00/26] [meta-oe] Pending patches from patchwork
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
X-List-Received-Date: Sun, 16 Dec 2012 18:12:51 -0000

Consolidated pull request including some older patches from patchwork.
Modified patches have "MJ: foo" in commit message.

I'll merge this tomorrow unless someone shouts.

The following changes since commit 93f954c334777d542ee3a54634def14fe801f9d5:

  Merge remote-tracking branch 'meta-oe-contrib/jansa/pull' (2012-12-14 19:41:15 +0100)

are available in the git repository at:


  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Jan Luebbe (3):
  proj: add recipe
  geos: add recipe
  libspatialite: add recipe

Marcin Juszkiewicz (8):
  modemmanager: update to 0.6.0.0
  samba: added gnu-configize for AArch64 support
  dialog: added gnu-configize for AArch64 support
  xterm: added gnu-configize for AArch64 support
  florence: added gnome-doc-utils and libnotify to dependencies
  postgresql: disable spinlocks for AArch64
  libgcc: s/virtclass/class/ to make it up-to-date
  gcc-cross-canadian 4.6: fix dependencies to be nativesdk-* not
    *-nativesdk

Marko Lindqvist (5):
  gtk+3: add libxi dependency
  fakeroot: update to upstream version 1.18.4
  lua: update to upstream version 5.1.5
  libsdl-image: update to upstream version 1.2.12
  libsdl-mixer: update to upstream version 1.2.12

Martin Jansa (4):
  udev: remove from meta-oe
  wpa-supplicant, gcc-common-4.6, packagegroup-qte-toolchain-target: use
    correct PRINC form
  lvm2: upgrade to 2.02.97 which is compatible with newer udev
  cryptsetup: import from oe-classic

Paul Eggleton (3):
  meta-oe: Fix erroneous use of "startline" in LIC_FILES_CHKSUM
  meta-networking: Fix erroneous use of "startline" in LIC_FILES_CHKSUM
  libnl: remove

Ross Burton (1):
  python-numpy: add missing runtime dependencies

Ting Liu (1):
  samba: Fix build on Fedora 17

Yauhen Kharuzhy (1):
  krb5: import from OE-Classic

 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |   2 +-
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |   4 +-
 meta-networking/recipes-support/mtr/mtr_0.82.bb    |   2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc  |   2 +-
 .../dont-include-private-glib-headers.patch        |  94 ---------
 ...modemmanager_0.5.bb => modemmanager_0.6.0.0.bb} |  16 +-
 meta-oe/recipes-connectivity/samba/samba.inc       |   7 +-
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |   3 +-
 ...-native_1.12.4.bb => fakeroot-native_1.18.4.bb} |   4 -
 .../fakeroot/fakeroot/configure-libtool.patch      |  20 --
 .../fakeroot/fakeroot/fix-prefix.patch             |  15 --
 .../{fakeroot_1.12.4.bb => fakeroot_1.18.4.bb}     |  21 +-
 ...-generation-it-depends-on-a-working-docto.patch |  45 ----
 meta-oe/recipes-core/udev/udev/cache               |  24 ---
 meta-oe/recipes-core/udev/udev/default             |   4 -
 meta-oe/recipes-core/udev/udev/gtk-doc.make        | 230 ---------------------
 meta-oe/recipes-core/udev/udev/init                |  73 -------
 meta-oe/recipes-core/udev/udev/modprobe.rules      |  17 --
 meta-oe/recipes-core/udev/udev/touchscreen.rules   |  18 --
 meta-oe/recipes-core/udev/udev_173.bb              | 116 -----------
 meta-oe/recipes-core/udev/udev_175.bb              |  91 --------
 meta-oe/recipes-core/udev/udev_182.bb              |  86 --------
 .../lua/lua5.1/bitwise_operators.patch             | 143 ++++++-------
 meta-oe/recipes-devtools/lua/lua5.1/lua5.1.pc      |   2 +-
 .../lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb}       |   9 +-
 .../recipes-devtools/python/python-numpy_1.4.1.bb  |   4 +-
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |   2 +-
 meta-oe/recipes-extended/dialog/dialog.inc         |   1 +
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc      |   2 +-
 .../socketcan/libsocketcan_0.0.8.bb                |   2 +-
 meta-oe/recipes-extended/tmux/tmux_1.6.bb          |   2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_277.bb     |   1 +
 ...bsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb} |  11 +-
 .../libsdl-mixer/libsdl-mixer/configure.patch      |   9 +-
 .../libsdl-mixer/fix-flac-madness.diff             |  28 ---
 ...bsdl-mixer_1.2.11.bb => libsdl-mixer_1.2.12.bb} |  10 +-
 meta-oe/recipes-navigation/geos/geos.inc           |  19 ++
 meta-oe/recipes-navigation/geos/geos_3.3.2.bb      |   7 +
 .../libspatialite/libspatialite.inc                |  16 ++
 .../fix-the-configure-script-and-freexl.patch      | 200 ++++++++++++++++++
 .../libspatialite/libspatialite_3.0.1.bb           |   9 +
 meta-oe/recipes-navigation/proj/proj.inc           |  13 ++
 meta-oe/recipes-navigation/proj/proj_4.7.0.bb      |   7 +
 .../packagegroup-qte-toolchain-target.bbappend     |   2 +-
 .../recipes-support/cryptsetup/cryptsetup_1.1.3.bb |  18 ++
 meta-oe/recipes-support/florence/florence_0.5.1.bb |   2 +-
 meta-oe/recipes-support/libnl/libnl_3.2.9.bb       |  52 -----
 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb       |   7 -
 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb       |   6 +
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb   |   2 +-
 meta-oe/recipes-support/postgresql/postgresql.inc  |   1 +
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   2 +-
 meta/recipes-connectivity/krb5/krb5_1.8.5.bb       |  39 ++++
 .../recipes-devtools/gcc/gcc-common-4.6.inc        |   2 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |   4 +-
 toolchain-layer/recipes-devtools/gcc/libgcc_4.6.bb |   2 +-
 56 files changed, 466 insertions(+), 1064 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager/dont-include-private-glib-headers.patch
 rename meta-oe/recipes-connectivity/networkmanager/{modemmanager_0.5.bb => modemmanager_0.6.0.0.bb} (59%)
 rename meta-oe/recipes-core/fakeroot/{fakeroot-native_1.12.4.bb => fakeroot-native_1.18.4.bb} (67%)
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/configure-libtool.patch
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot/fix-prefix.patch
 rename meta-oe/recipes-core/fakeroot/{fakeroot_1.12.4.bb => fakeroot_1.18.4.bb} (45%)
 delete mode 100644 meta-oe/recipes-core/udev/udev/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
 delete mode 100644 meta-oe/recipes-core/udev/udev/cache
 delete mode 100644 meta-oe/recipes-core/udev/udev/default
 delete mode 100644 meta-oe/recipes-core/udev/udev/gtk-doc.make
 delete mode 100644 meta-oe/recipes-core/udev/udev/init
 delete mode 100644 meta-oe/recipes-core/udev/udev/modprobe.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev/touchscreen.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev_173.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev_175.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev_182.bb
 rename meta-oe/recipes-devtools/lua/{lua5.1_5.1.4.bb => lua5.1_5.1.5.bb} (75%)
 rename meta-oe/recipes-multimedia/libsdl-image/{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb} (75%)
 delete mode 100644 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/fix-flac-madness.diff
 rename meta-oe/recipes-multimedia/libsdl-mixer/{libsdl-mixer_1.2.11.bb => libsdl-mixer_1.2.12.bb} (78%)
 create mode 100644 meta-oe/recipes-navigation/geos/geos.inc
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite.inc
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
 create mode 100644 meta-oe/recipes-navigation/proj/proj.inc
 create mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb
 create mode 100644 meta-oe/recipes-support/cryptsetup/cryptsetup_1.1.3.bb
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.9.bb
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.85.bb
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
 create mode 100644 meta/recipes-connectivity/krb5/krb5_1.8.5.bb

-- 
1.8.0.2



