Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0906FD24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 21:58:39 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so9220098wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cRY/iPqZdrN5ccCcPIQ5JM/p3YWWoO1JvQTQlr1Ac2g=;
	b=NNf9PbQ78eP1ewZkXKZkYjbK7GSKBZxaz2D4xScYbSpFENLcu7omPaFIoYiaOm6kS4
	Uc05zjSwTSYhAtnPqhU/Su9KLaJ3SPm3ehEOsAlTj+GJi187MTz/udhOKV4E3DLWVguh
	2EZP8yDoT8H3InHNjuWKxH2aqBA8rPR0dWah3eQ6Ab2cdIKVMsERDZVmeGdkAfookt6k
	yjw3zthy1WtXtxuSq909aYcllCjye5P8DMeycjKfEHX6ptaLQV2rCVrRnZmgqHlZsnMB
	wK41gGb5hItkLBgRtkmBttI/D9fL6iR1VRUGLp73xrh0wlirGjCvPbZSL/b30rA0A2E8
	HI2g==
X-Received: by 10.194.216.136 with SMTP id oq8mr691183wjc.33.1403128719861;
	Wed, 18 Jun 2014 14:58:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z7sm7988948eeo.42.2014.06.18.14.58.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 14:58:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jun 2014 23:58:37 +0200
Message-Id: <1403128717-4481-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][meta-gnome][PATCH] tracker: move from meta-oe to meta-gnome
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
X-List-Received-Date: Wed, 18 Jun 2014 21:58:45 -0000

* it rdepends on gvfs which is available only in meta-gnome and nothing
  in meta-oe depends on tracker

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/tracker/files/90tracker        |  0
 .../tracker/files/tracker-dbus.service             |  0
 .../tracker/files/tracker-miner-fs.service         |  0
 .../tracker/files/tracker-store.service            |  0
 ...-Fix-missing-gobject-introspection-checks.patch |  0
 .../enable-sqlite-crosscompile.patch               |  0
 .../fix-removable-media-detection.patch            |  0
 .../recipes-support/tracker/tracker_0.14.2.bb      |  0
 .../recipes-support/tracker/tracker_0.14.2.bb.rej  | 36 ----------------------
 9 files changed, 36 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/files/90tracker (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/files/tracker-dbus.service (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/files/tracker-miner-fs.service (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/files/tracker-store.service (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/tracker/tracker_0.14.2.bb (100%)
 delete mode 100644 meta-oe/recipes-support/tracker/tracker_0.14.2.bb.rej

diff --git a/meta-oe/recipes-support/tracker/files/90tracker b/meta-gnome/recipes-support/tracker/files/90tracker
similarity index 100%
rename from meta-oe/recipes-support/tracker/files/90tracker
rename to meta-gnome/recipes-support/tracker/files/90tracker
diff --git a/meta-oe/recipes-support/tracker/files/tracker-dbus.service b/meta-gnome/recipes-support/tracker/files/tracker-dbus.service
similarity index 100%
rename from meta-oe/recipes-support/tracker/files/tracker-dbus.service
rename to meta-gnome/recipes-support/tracker/files/tracker-dbus.service
diff --git a/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service b/meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
similarity index 100%
rename from meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
rename to meta-gnome/recipes-support/tracker/files/tracker-miner-fs.service
diff --git a/meta-oe/recipes-support/tracker/files/tracker-store.service b/meta-gnome/recipes-support/tracker/files/tracker-store.service
similarity index 100%
rename from meta-oe/recipes-support/tracker/files/tracker-store.service
rename to meta-gnome/recipes-support/tracker/files/tracker-store.service
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch b/meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
similarity index 100%
rename from meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
rename to meta-gnome/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch b/meta-gnome/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
similarity index 100%
rename from meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
rename to meta-gnome/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch b/meta-gnome/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
similarity index 100%
rename from meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
rename to meta-gnome/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
similarity index 100%
rename from meta-oe/recipes-support/tracker/tracker_0.14.2.bb
rename to meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb.rej b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb.rej
deleted file mode 100644
index d044829..0000000
--- a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb.rej
+++ /dev/null
@@ -1,36 +0,0 @@
---- meta-oe/recipes-support/tracker/tracker_0.14.2.bb
-+++ meta-oe/recipes-support/tracker/tracker_0.14.2.bb
-@@ -13,7 +13,7 @@
- SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
-            file://0005-Fix-missing-gobject-introspection-checks.patch \
-            file://enable-sqlite-crosscompile.patch \
--	   file://fix-removable-media-detection.patch \
-+           file://fix-removable-media-detection.patch \
-            file://90tracker \
-            file://tracker-store.service \
-            file://tracker-miner-fs.service \
-@@ -32,14 +32,17 @@
- LEAD_SONAME = "libtrackerclient.so.0"
- 
- do_install_append() {
--   cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
--#  install -d ${D}/${sysconfdir}/X11/Xsession.d/
--#  install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
-+	cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
-+	#  install -d ${D}/${sysconfdir}/X11/Xsession.d/
-+	#  install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
- 
--    install -d ${D}${systemd_unitdir}/system
--    install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
--    install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
--    install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
-+	install -d ${D}${systemd_unitdir}/system
-+	install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
-+	install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
-+	install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
-+	sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
-+		-e 's,@BASE_BINDIR@,${base_bindir},g' \
-+		${D}${systemd_unitdir}/system/*.service
- }
- 
- PACKAGES =+ "${PN}-tests ${PN}-vala ${PN}-nautilus-extension"
-- 
2.0.0


