Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61872731E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:12:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b187so12867543wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O0i1aMDL8HT5RRCmNMAocHZsXrZkO2QOnii5jl/kAU8=;
	b=wl2mHb6szXy6TgQV8u/n8dXb6tPBtEDoqVBPmlGoNSK25lA0KJwo0ZsCNZfKEAfi3M
	7NdaVh2Y6K2hUUISaxb/T5YC6dpzESIlTe8TAVDjeXk7SSH9r1kNL7upmPhRbbHwVHjd
	qTh4HFJSeVBCASrIBmA9k/EjE0eDyP9DBs6XZvjP8gKbLRZO1clc+J0QbaXaKP5S7+Px
	7nItSdeMUWIOEsENVJoAHJO5yhbxRbmBzgbt0UpOUdUzLqMxLNdCJTsGBPzj+I4pdEhZ
	9DBlmJ9uBBiuu6BUOg5jOnn/p16YkxMMQxAa1ikB9NXumq3X1mwkUtITjGCnDBI1W7aW
	cVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O0i1aMDL8HT5RRCmNMAocHZsXrZkO2QOnii5jl/kAU8=;
	b=TkJS4ge7ERaDycwce/GbpqsUTPFRNsrdtlRh9aiezSMY4CY1gUSwCpuwcNS1Umz4sC
	nN9Q9Y8xhv1VCmx1JdQLFCHPiTP2Ua1eBhNWtwWZ82jvrOJeBKTipI/TyybGdqxgJklJ
	eK5XEeLh4LV+0Ylhwh8BdmVD3u0qPj1GUMmmqFW1C6yhP7L7ZtWcsjecW+jmJszmNmvr
	WKE2EiZUfFaeXhhN4VH0vXATrmH/zRrwuL+ieE4yBsdS4YGDLtvEshqaGMKomblVu6En
	Z6AMu/NWnxzss2q1bn9Ui/PV1cEe7IUgOiKLVEY6cLNh+edjmYEa+eiH8epAgwSJ9+Aq
	J25g==
X-Gm-Message-State: AE9vXwPYAw1ZyKQ3681wdV34lcXsCFRd2f/7U7rzvmUNT8JhdfaU0kZksK2okOZZsQgQsQ==
X-Received: by 10.194.187.175 with SMTP id ft15mr13500814wjc.66.1473675166326; 
	Mon, 12 Sep 2016 03:12:46 -0700 (PDT)
Received: from zeelaptop.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	ce6sm17139004wjc.27.2016.09.12.03.12.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 03:12:45 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Sep 2016 12:12:40 +0200
Message-Id: <1473675160-13440-1-git-send-email-zeenix@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>
Subject: [meta-oe] [PATCH v2] geoclue: Update to 2.4.4
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
X-List-Received-Date: Mon, 12 Sep 2016 10:12:46 -0000

From: Zeeshan Ali <zeeshan.ali@pelagicore.com>

Also drop redundant and now unusable patch.

Signed-off-by: Zeeshan Ali <zeeshan.ali@pelagicore.com>
---
 .../geoclue/files/soup-session-fix.patch           | 30 ------------
 .../recipes-navigation/geoclue/geoclue_2.0.0.bb    | 33 --------------
 .../recipes-navigation/geoclue/geoclue_2.4.4.bb    | 53 ++++++++++++++++++++++
 3 files changed, 53 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
 delete mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
 create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb

diff --git a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
deleted file mode 100644
index 70fe3f5..0000000
--- a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Upstream-Status: Inappropriate [poky 9.0 has older libsoup]
-
-Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
-
-diff --git a/src/gclue-ipclient.c b/src/gclue-ipclient.c
-index 09add30..1771d5c 100644
---- a/src/gclue-ipclient.c
-+++ b/src/gclue-ipclient.c
-@@ -83,7 +83,7 @@ gclue_ipclient_init (GClueIpclient *ipclient)
- {
-         ipclient->priv = G_TYPE_INSTANCE_GET_PRIVATE ((ipclient), GCLUE_TYPE_IPCLIENT, GClueIpclientPrivate);
- 
--        ipclient->priv->soup_session = soup_session_new ();
-+        ipclient->priv->soup_session = soup_session_sync_new ();
- }
- 
- /**
-diff --git a/src/geoip-server/geoip-update.c b/src/geoip-server/geoip-update.c
-index 6cce7b2..ef672ba 100644
---- a/src/geoip-server/geoip-update.c
-+++ b/src/geoip-server/geoip-update.c
-@@ -214,7 +214,7 @@ main (int argc, char **argv)
-                         path = GEOIP_DATABASE_PATH;
-         }
- 
--        session = soup_session_new ();
-+        session = soup_session_sync_new ();
- 
-         for (i = 0; i < G_N_ELEMENTS (db_info_map); i++) {
-                 SoupMessage *msg = NULL;
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
deleted file mode 100644
index 90e8533..0000000
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "The Geolocation Service"
-DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
-The primary goal of the Geoclue project is to make creating location-aware applications \
-as simple as possible, while the secondary goal is to ensure that no application \
-can access location information without explicit permission from user."
-LICENSE = "GPLv2.0+"
-SECTION = "console/network"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
-
-DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4 intltool-native"
-
-inherit autotools pkgconfig gtk-doc
-
-SRC_URI = " \
-    http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${PV}.tar.xz \
-    file://soup-session-fix.patch \
-"
-
-SRC_URI[md5sum] = "401ff99d530b177c62afacef0a33efd9"
-SRC_URI[sha256sum] = "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f01350bceda8c67a1"
-
-PACKAGECONFIG[geoip] = "--enable-geoip-server,--disable-geoip-server,geoip"
-
-EXTRA_OECONF += " \
-    --with-dbus-service-user=root \
-    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
-"
-
-FILES_${PN} += " \
-    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
-    ${datadir}/geoclue-2.0/geoclue-interface.xml \
-"
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
new file mode 100644
index 0000000..3170d44
--- /dev/null
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
@@ -0,0 +1,53 @@
+SUMMARY = "The Geolocation Service"
+DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
+The primary goal of the Geoclue project is to make creating location-aware applications \
+as simple as possible, while the secondary goal is to ensure that no application \
+can access location information without explicit permission from user."
+LICENSE = "GPLv2.0+"
+SECTION = "console/network"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
+
+DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
+
+inherit autotools pkgconfig gtk-doc
+
+SRC_URI = " \
+    http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV}.tar.xz \
+"
+
+SRC_URI[md5sum] = "d2a5b05f4bad032673fe23afbce27926"
+SRC_URI[sha256sum] = "9c43fb9d0c12067ea64400500abb0640194947d4c2c55e38545afe5d9c5c315c"
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# Without this line, package is delcared a library and named libgeoclue*
+AUTO_LIBNAME_PKGS = ""
+
+PACKAGECONFIG ??= "3g modem-gps cdma nmea lib"
+PACKAGECONFIG[3g] = "--enable-3g-source,--disable-3g-source,modemmanager"
+PACKAGECONFIG[modem-gps] = "--enable-modem-gps-source,--disable-modem-gps-source,modemmanager"
+PACKAGECONFIG[cdma] = "--enable-cdma-source,--disable-cdma-source,modemmanager"
+PACKAGECONFIG[nmea] = "--enable-nmea-source,--disable-nmea-source,avahi"
+PACKAGECONFIG[lib] = "--enable-libgeoclue,--disable-libgeoclue,gobject-introspection"
+
+EXTRA_OECONF += " \
+    --with-dbus-service-user=root \
+    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
+    --enable-demo-agent=no \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/system-services \
+    ${libdir} \
+    ${systemd_unitdir} \
+    ${prefix}/libexec \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/dbus-1/interfaces \
+    ${datadir}/gir-1.0 \
+"
-- 
2.7.4


