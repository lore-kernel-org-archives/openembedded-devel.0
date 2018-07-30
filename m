Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2D62774A25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 16:12:38 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id a4-v6so8552562lff.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pvsBTZAfj64LueYP40yE3AKR8PVq+z/mf5OKArBAcA8=;
	b=vY/8IHb3iahAUc9/FQWnGiJbWPNSnTF31H+tPqjaT9klVwGtjG4ye/Fkt+OnkA/SIj
	V4KY1xmJYpyKFm/r+gpjek/WF99kVn9IWt/DO3bZo1U9vGh8k43w/PDf91o06hQToSHy
	yyVZNRfeKoYTaLZOB5/9pcHBQFbP0ghHB2CFy7daersT6fiET8p1q4t/cTwtNv5UH7cU
	lNqqw9UW5vTFxOznrp+dcWsMOIc/OGhnGpyIvmyTw/n8bOY5HD4sBTiQ5mv4Yk/C/dJL
	ynxeOX7+h/95w2MRBEBLuF2O13UZo5/eQL6TxOa2B65g2eIArU7q4fHK1YSL/AAp3IQ9
	B6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pvsBTZAfj64LueYP40yE3AKR8PVq+z/mf5OKArBAcA8=;
	b=SckAjwg1LQC0Gz6oJsy8ElolQvfQ/svJiQQdy0lU7AtDfcjAciKw2Qs6ZOihEPdGsp
	gpzlPncQILIxwOfoUhNbb4gpvWqYuUpeWs+gAw/K7I2nl74AaQkzn2N3Jtp/PAcBKgf8
	Xb9HUQn9b2+d7gB/KWZoQNCROkfH7rVtLeppFkDfxNOxRhRzOlZ9bk1z62VNTh+Ib6V0
	pYuaWO4bA2e28oLxKNjXN8zg/EMPmL3gxBc0M6PtEcnkPAgQlNR+xVGCfKdbsAb5k0Tc
	JToMuxrezlXkcYvFdP2QZ86UchLWj+H0sPcv9pCUUCCJ9aER0gzcyrPqTUO6dCaed5g2
	HxZw==
X-Gm-Message-State: AOUpUlG1I5XEsvCkX8LkxAEpih8ico9d3A0QtFSmFa5VQOHC2zFpuTVN
	wwm1czljeq9kXs8TSm8mIjuDYey2NSM=
X-Google-Smtp-Source: AAOMgpfOad+tFzXifIf9QPRvXasmWy7+B9733U0To+IMs83q9pg4DWq0GRPuEGtNfqpHU9QGeLTeBQ==
X-Received: by 2002:a19:6902:: with SMTP id
	e2-v6mr10212061lfc.70.1532967159092; 
	Mon, 30 Jul 2018 09:12:39 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:958b:9f8c:39d7:b97d])
	by smtp.gmail.com with ESMTPSA id
	97-v6sm1615382lfw.13.2018.07.30.09.12.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 09:12:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2018 18:12:23 +0200
Message-Id: <20180730161223.9299-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe][PATCH] Revert "glibmm: Upgrade to 2.56.0"
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
X-List-Received-Date: Mon, 30 Jul 2018 16:12:39 -0000

sumo branch of poky contains glib v2.54 which makes compilation of this
package fail due to nonexistent functions in the library used by the
C++ bindings.

This reverts commit acfba081bbe49fd9dccbf12be6535d5342c6d747.
---
 .../0001-Glib-Threads-Private-Fix-gobj.patch  | 40 +++++++++++++++++++
 .../{glibmm_2.56.0.bb => glibmm_2.54.1.bb}    |  5 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.56.0.bb => glibmm_2.54.1.bb} (86%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
new file mode 100644
index 000000000..7899022f1
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
@@ -0,0 +1,40 @@
+From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
+From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
+Date: Wed, 20 Dec 2017 20:00:32 +0100
+Subject: [PATCH] Glib::Threads::Private: Fix gobj()
+
+Bug 791711
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d57ae9572b7d74aa385a30313eceae7f2d3fce]
+ glib/glibmm/threads.h | 2 +-
+ glib/src/threads.hg   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
+index f7e2b82a..2c0cbe8c 100644
+--- a/glib/glibmm/threads.h
++++ b/glib/glibmm/threads.h
+@@ -657,7 +657,7 @@ public:
+    */
+   inline void replace(T* data);
+ 
+-  GPrivate* gobj() { return gobject_; }
++  GPrivate* gobj() { return &gobject_; }
+ 
+ private:
+   GPrivate gobject_;
+diff --git a/glib/src/threads.hg b/glib/src/threads.hg
+index 86d7a17b..c82a6130 100644
+--- a/glib/src/threads.hg
++++ b/glib/src/threads.hg
+@@ -628,7 +628,7 @@ public:
+    */
+   inline void replace(T* data);
+ 
+-  GPrivate* gobj() { return gobject_; }
++  GPrivate* gobj() { return &gobject_; }
+ 
+ private:
+   GPrivate gobject_;
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
similarity index 86%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
index 2f048d2f6..4706432ab 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
@@ -13,9 +13,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
+    file://0001-Glib-Threads-Private-Fix-gobj.patch \
 "
-SRC_URI[md5sum] = "5aa7a60084fe3e01d746c96f4a115302"
-SRC_URI[sha256sum] = "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9"
+SRC_URI[md5sum] = "dee5ebe309f5976c3dacfcf5c43a062b"
+SRC_URI[sha256sum] = "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.17.1


