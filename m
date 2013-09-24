Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB3F60F26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 19:05:05 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id j1so2718238oag.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0SS1PKenvBmQmQc3rN0yDV2yaz44NTTZK+/2c891EHI=;
	b=irrjHy+vCA3HcmmPtvSlKOX9rvy78OTX3J0kafxmEpX/yK6s9MSKMu46BW2degccpo
	0gFKuGBFECYYBQwHBjGNeSq4xGHkKxR1dkJiPgCaeYm6lWNxsbUejhatLGO3QDJvPqJ0
	0lpQWHoh4a/iD4TyfW/LtIvJVrREVR/8Q53l+vw1d4xDudmTofhJnwmU0IaX+VaZxIVE
	5I0XRVxRS5JeDKK4Q5HFAhKJb+U9iAgGJEGqmwQZzVxGmZMmBSwPWx9W58xYt0/A9APG
	hULH9hTJmOnwJAx+VWQOe3UeRBYK7dGNb2/b2jCiXlzTGXqZkWuwlwbQ4QE1RAvM89A/
	ao7g==
X-Gm-Message-State: ALoCoQmOFFNSZgHMaiTDywLRwmN7OG9ZAB+lHfVlb3IPDFAAuBqEYHb7J9mGlkfYTWoECBfr0mc+
X-Received: by 10.182.215.202 with SMTP id ok10mr2644797obc.62.1380049506618; 
	Tue, 24 Sep 2013 12:05:06 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id hs4sm23720141obb.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 12:05:05 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 12:04:56 -0700
Message-Id: <1380049496-22413-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] GeoClue: Created recipe for GeoClue 2.0.0
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
X-List-Received-Date: Tue, 24 Sep 2013 19:05:07 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Geoclue is a D-Bus service that provides location information. The primary
goal of the Geoclue project is to make creating location-aware applications as
simple as possible, while the secondary goal is to ensure that no application
can access location information without explicit permission from user.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 .../geoclue/files/soup-session-fix.patch           | 30 ++++++++++++++++++++
 .../recipes-navigation/geoclue/geoclue_2.0.0.bb    | 32 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
 create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb

diff --git a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
new file mode 100644
index 0000000..70fe3f5
--- /dev/null
+++ b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Upstream-Status: Inappropriate [poky 9.0 has older libsoup]
+
+Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
+
+diff --git a/src/gclue-ipclient.c b/src/gclue-ipclient.c
+index 09add30..1771d5c 100644
+--- a/src/gclue-ipclient.c
++++ b/src/gclue-ipclient.c
+@@ -83,7 +83,7 @@ gclue_ipclient_init (GClueIpclient *ipclient)
+ {
+         ipclient->priv = G_TYPE_INSTANCE_GET_PRIVATE ((ipclient), GCLUE_TYPE_IPCLIENT, GClueIpclientPrivate);
+ 
+-        ipclient->priv->soup_session = soup_session_new ();
++        ipclient->priv->soup_session = soup_session_sync_new ();
+ }
+ 
+ /**
+diff --git a/src/geoip-server/geoip-update.c b/src/geoip-server/geoip-update.c
+index 6cce7b2..ef672ba 100644
+--- a/src/geoip-server/geoip-update.c
++++ b/src/geoip-server/geoip-update.c
+@@ -214,7 +214,7 @@ main (int argc, char **argv)
+                         path = GEOIP_DATABASE_PATH;
+         }
+ 
+-        session = soup_session_new ();
++        session = soup_session_sync_new ();
+ 
+         for (i = 0; i < G_N_ELEMENTS (db_info_map); i++) {
+                 SoupMessage *msg = NULL;
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
new file mode 100644
index 0000000..6793ca9
--- /dev/null
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
@@ -0,0 +1,32 @@
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
+PR = "r0"
+DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4"
+
+inherit autotools pkgconfig gtk-doc
+
+SRC_URI = " \
+  http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${PV}.tar.xz \
+  file://soup-session-fix.patch \
+"
+
+SRC_URI[md5sum] = "401ff99d530b177c62afacef0a33efd9"
+SRC_URI[sha256sum] = "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f01350bceda8c67a1"
+
+EXTRA_OECONF += " \
+  --with-dbus-service-user=root \
+  --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
+"
+
+FILES_${PN} += " \
+  ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
+  ${datadir}/geoclue-2.0/geoclue-interface.xml \
+"
\ No newline at end of file
-- 
1.8.3.1


