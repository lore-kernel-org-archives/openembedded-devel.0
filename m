Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2E522609BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 09:19:08 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so4600965wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BT8lUyi6mMxWkdeylKBTFIYT419aSL6g/wayPkNqWBU=;
	b=I6gXW2cMzAd5LXrDQLtzAuefOjVHi56kO2WqF41ZSNNxzVoMWxCi0x5P7BhfbOUS7H
	4jmh2UPwHfx0JXHCwCueHB5xucsOv2u01ysipzORyKZKy+SGsYo3Hze3qtbKlEwb4YQQ
	zBYq2z+lHjyq5to6Q6hFeNkaqlXD35rJOBMOB5DL+mkChFEh9HnY8sTWyLPZw4uv7uWr
	okHhP5Te3bKSdXSoZd2BFkNnZ15IejuLJgdgyt0RNo+k4dBb28SVJJL4bw6Uwnhvkm01
	rCLdx1kII92XgxkOB5dysMO+0f0SqdEhMRkJSgCPdGMJH2YJ9RxJBqP6xflQv0pL5THh
	rJKQ==
X-Received: by 10.194.62.110 with SMTP id x14mr1296409wjr.15.1403342349535;
	Sat, 21 Jun 2014 02:19:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hc4sm21161899wjc.38.2014.06.21.02.19.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 02:19:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jun 2014 11:18:58 +0200
Message-Id: <1403342349-11180-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-oe][PATCH 01/12] recipes: add missing dependency on intltool-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jun 2014 09:19:15 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

* These recipes all require intltool-native to build but were missing
  a dependency on it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb       | 2 +-
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb          | 2 +-
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                  | 2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb                            | 2 +-
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb                     | 2 +-
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb                   | 2 +-
 meta-gnome/recipes-gnome/pimlico/contacts.inc                           | 2 +-
 meta-gnome/recipes-gnome/pimlico/dates.inc                              | 2 +-
 meta-gnome/recipes-gnome/pimlico/tasks.inc                              | 2 +-
 meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb                   | 2 +-
 meta-oe/recipes-support/devicekit/devicekit-power_014.bb                | 2 +-
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb                          | 2 +-
 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb              | 2 +-
 meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb                           | 2 +-
 meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb                          | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index bd5d945..7e6c340 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native"
 
 PR = "r4"
 
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 64308dd..860851d 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -17,7 +17,7 @@ inherit autotools gnome gtk-doc pkgconfig gsettings
 
 SRC_URI += "file://egg-asn1x.patch"
 
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
 RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
 
 EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 7823cec..6988b3a 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://daemon/vfs-daemon.c;endline=21;md5=5f2c61553fb16abb07fc9498ca03fe1f \
                     file://modules/cdda-cddb.h;endline=22;md5=20ed324ca64907c366ecd7f22b8e0c54"
 
-DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
+DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib intltool-native"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
index d637399..131c849 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf libgphoto2"
+DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf libgphoto2 intltool-native"
 # optional: obexftp libcdio libimobiledevice 
 
 PR = "${INC_PR}.0"
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index 2affacc..6cf1e3f 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
 
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native"
 
 inherit gnomebase pkgconfig autotools-brokensep gettext
 
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index e0b8b93..fc0a977 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
-DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop"
+DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
 PR = "r1"
 
 inherit gnomebase update-alternatives
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
index 665efa3..6535bbf 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
+++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
 SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ evolution-data-server"
+DEPENDS = "glib-2.0 gtk+ evolution-data-server intltool-native"
 RDEPENDS_${PN} = "libedata-book"
 
 inherit autotools pkgconfig
diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
index 9b078e1..12d2f83 100644
--- a/meta-gnome/recipes-gnome/pimlico/dates.inc
+++ b/meta-gnome/recipes-gnome/pimlico/dates.inc
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+"
 
 SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server"
+DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server intltool-native"
 RDEPENDS_${PN} = "libedata-cal"
 
 inherit autotools gettext pkgconfig gtk-icon-cache
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recipes-gnome/pimlico/tasks.inc
index 44f036d..f8217dc 100644
--- a/meta-gnome/recipes-gnome/pimlico/tasks.inc
+++ b/meta-gnome/recipes-gnome/pimlico/tasks.inc
@@ -5,6 +5,6 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2 & GPLv2+"
 
 SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ evolution-data-server"
+DEPENDS = "glib-2.0 gtk+ evolution-data-server intltool-native"
 
 inherit autotools pkgconfig gtk-icon-cache
diff --git a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
index df5c9a3..c6017c7 100644
--- a/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNOME Authentication Agent for PolicyKit"
 DESCRIPTION = "PolicyKit-gnome provides an Authentication Agent for PolicyKit that integrates well with the GNOME desktop environment"
 HOMEPAGE = "http://www.packagekit.org/"
 BUGTRACKER = "http://bugzilla.gnome.org/"
-DEPENDS = "polkit dbus-glib gconf gtk+"
+DEPENDS = "polkit dbus-glib gconf gtk+ intltool-native"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
                     file://src/main.c;beginline=1;endline=20;md5=aba145d1802f2329ba561e3e48ecb795"
diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
index 9484887..0c1245f 100644
--- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
+++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
@@ -2,7 +2,7 @@ SUMMARY = "Devicekit power"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=756cf97871f77233638937da21b025d3"
 
-DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit"
+DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intltool-native"
 
 SRC_URI = "http://upower.freedesktop.org/releases/DeviceKit-power-${PV}.tar.gz;name=archive"
 SRC_URI[archive.md5sum] = "935d37f1e14b3c8a1d6dabcd9a38d3ca"
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 32f0c11..2138e7d 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 intltool-native"
 # optional dependencies: device-mapper parted
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 6e102c3..78af9b6 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A lightweight Terminal Emulator based on libvte, written in Vala"
 SECTION = "x11/applications"
-DEPENDS = "vte"
+DEPENDS = "vte intltool-native"
 SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
index cfc1131..7eea2f9 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION="Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
-DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
+DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util intltool-native"
 PR = "r1"
 
 inherit xfce
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index bb8c337..1355359 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Xfce configuration daemon and utilities"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "dbus-glib libxfce4util perl"
+DEPENDS = "dbus-glib libxfce4util perl intltool-native"
 
 inherit xfce
 
-- 
2.0.0


