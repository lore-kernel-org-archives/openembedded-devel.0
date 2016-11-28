Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB0271B44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:58:17 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id g23so210256866wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BB5ADvzwp/sNIQVAtKc/OgvO/kHdlXhlK9lCi/BDSmg=;
	b=coyjopa0uGkJPm+6DT/7QiphJ4s57ka+bZaEDLsKIu07Dt5blT2C440zbYRYZk3K5S
	13nNreEXa5GdwmmuBLudUXw9BebRHvOWVTx2hS9+0Hr47vMQ6ly/GaHrDdgOZvE96MtB
	yo59gifVBnz0wYATmkfQwXmRLwyQramWUQ1zHabkbeDY1LvdTwaWaInlvwo175GQ+V3N
	h5aW4Vw0+Z3HFepGoqqVoglTz1wts+nwZF6jy5SdYS+FBy1O++3RFJpaol/krgyjmbaG
	x9L3B6svCDpI3c78rlfrVC/inIQwHoTa3Hv8+oFi1PdbPoYsHnFPIlWqqQkMDVFM6TGQ
	D2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BB5ADvzwp/sNIQVAtKc/OgvO/kHdlXhlK9lCi/BDSmg=;
	b=dR7qRJ/p7ZqpF1Yubp5OqsYlt6c5m+GvaqObMkv19RX+Vn033nKuB1mSBN2rcDK90V
	rTcVWWIjsa2Y0JBXeCGliUjRfOF8NXZ2P+KC2LGxVtUi0xY3PpBrEjhkR+cZ5xfWuqCC
	ot0CjqAaCGPFDyks5qbSCsKR98NZs6s7u87kad4xRkRWuBg+xrLjMrkB5YV9Dx7zWb1F
	/x6eC5jyg7YX51X/jZqQGr3gBAp2bGttYbc4UDom+Kd2k4PtW9vqBNzrNh+GBgh2rZy4
	BtEw5AhSJ60famKcWifpaURwZaGX3MteWsm6cd0b+CoXHe3qEqbwPDco6xzPlNg5Wu5C
	cH3Q==
X-Gm-Message-State: AKaTC03I8OD9u+KEkIpKSYs1HaignxVczxrOLRKuO+buU4e80pgxTtWmlufFvqXZfe9N3Oci
X-Received: by 10.28.182.4 with SMTP id g4mr21337351wmf.15.1480348697946;
	Mon, 28 Nov 2016 07:58:17 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	g73sm29606457wme.16.2016.11.28.07.58.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:58:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:58:13 +0000
Message-Id: <1480348693-17897-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V2] meta-gnome: add explicit gnome-common dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 15:58:19 -0000

gnome-common is deprecated and gnomebase.bbclass will soon stop depending on it,
so add gnome-common to DEPENDS for the recipes that still use it.

gxim previously wasn't really using the gnome-common macros so now the build
fails with compiler errors, so pass the flag to turn off fatal warnings as gxim
appears to be dead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc                          | 2 +-
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb                       | 2 +-
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                         | 2 +-
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb         | 2 +-
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb      | 2 +-
 .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb  | 3 +--
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                 | 2 +-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb        | 3 +--
 meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb                   | 2 +-
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                   | 2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb             | 2 +-
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb                | 3 +--
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb                 | 2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb                      | 2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb                     | 2 +-
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb                      | 2 +-
 17 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 60a8597..ce34957 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11/gnome/libs"
-DEPENDS = "glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus dbus-glib"
+DEPENDS = "gnome-common-native glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus dbus-glib"
 
 inherit gnomebase gtk-doc lib_package
 
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index 1164768..5b31bb8 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native"
+DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
 PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index a6c68d3..175b832 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native gnome-common-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index fe3e572..be62b37 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 SECTION = "x11/gnome"
 
-DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native \
+DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native gnome-common-native \
     ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)} \
 "
 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index c1a47e0..17950fc 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
 SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
 GNOME_COMPRESS_TYPE="bz2"
 
-DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification intltool-native"
+DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification intltool-native gnome-common-native"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs --disable-gnome-about"
 
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2f427e7..19ade62 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "GNOME disk utility"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
 
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native libgnome-keyring"
+DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 libatasmart gnome-doc-utils intltool-native gnome-common-native libgnome-keyring"
 
 PR = "r4"
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 55778f7..d5fab62 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
 PR = "r2"
 
-DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib librsvg intltool-native"
+DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib librsvg intltool-native gnome-common-native"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
@@ -29,4 +29,3 @@ FILES_${PN} += "${datadir}/icons \
 
 FILES_${PN}-doc += "${datadir}/omf \
                     ${datadir}/gnome/help "
-
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 1c78474..3ec6466 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://daemon/vfs-daemon.c;endline=21;md5=5f2c61553fb16abb07fc9498ca03fe1f \
                     file://modules/cdda-cddb.h;endline=22;md5=20ed324ca64907c366ecd7f22b8e0c54"
 
-DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib intltool-native"
+DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib intltool-native gnome-common-native"
 RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
 # Some legacy packages will require gnome-mime-data to be installed, but use of
 # it is deprecated.
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index ebd2955..66f04ae 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ libxml2 intltool-native"
+DEPENDS = "gtk+ libxml2 intltool-native gnome-common-native"
 
 PNAME = "gtksourceview"
 
@@ -27,4 +27,3 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
-
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
index 6ec6d46..c2157df 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.16.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
 
-DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
+DEPENDS = "gnome-common-native libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
 
 inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc vala gobject-introspection
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 40caa7b..0055ba4 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94
 SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch"
 GNOME_COMPRESS_TYPE="bz2"
 
-DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound intltool-native"
+DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound intltool-native gnome-common-native"
 
 EXTRA_OECONF += "--disable-gtk-doc"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index a0f0b51..41a89ce 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -8,7 +8,7 @@ inherit gnomebase gtk-doc
 # intltool to provide IT_PROG_INTLTOOL
 # configure: line 12654: syntax error near unexpected token `0.35.0'
 # configure: line 12654: `IT_PROG_INTLTOOL(0.35.0)'
-DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native"
+DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native gnome-common-native"
 
 SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
 SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index f357657..e5914e0 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "gconf gtk+ glib-2.0 libxklavier intltool-native"
+DEPENDS = "gconf gtk+ glib-2.0 libxklavier intltool-native gnome-common-native"
 
 inherit gnome
 
@@ -16,4 +16,3 @@ do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
-
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index 94b00c1..c4801a9 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SECTION = "x11/gnome/libs"
-DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring intltool-native"
+DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring intltool-native gnome-common-native"
 
 inherit gnome
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
index 602d513..f5e2f1d 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
 
 SECTION = "libs"
 
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native"
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
 
 inherit autotools pkgconfig gnome gconf gobject-introspection
 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index d273e6c..fa3915b 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native gtk+ gdk-pixbuf-native libxres"
+DEPENDS = "intltool-native gnome-common-native gtk+ gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 1d5ae95..2e002f3 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -19,7 +19,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-EXTRA_OECONF = " --disable-static --disable-rebuilds"
+EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
 DEPENDS += "gtk+ glib-2.0 ruby-native intltool-native gnome-common-native"
 
 inherit autotools pkgconfig gettext
-- 
2.8.1


