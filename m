Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9B07278685
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:27:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D2ROJo026824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 19:27:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 12 Jul 2018 19:27:23 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Jul 2018 19:27:23 -0700
Message-ID: <20180713022723.103117-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] glibmm: Upgrade to 2.56.0
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
X-List-Received-Date: Fri, 13 Jul 2018 02:27:23 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Remove the backported patch 0001-Glib-Threads-Private-Fix-gobj.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-Glib-Threads-Private-Fix-gobj.patch  | 40 -------------------
 .../{glibmm_2.54.1.bb => glibmm_2.56.0.bb}    |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.54.1.bb => glibmm_2.56.0.bb} (86%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch b/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
deleted file mode 100644
index 7899022f1..000000000
--- a/meta-oe/recipes-core/glib-2.0/glibmm/0001-Glib-Threads-Private-Fix-gobj.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 838fe84c2ddcc9af51c34f751defbf3dd0ba8a06 Mon Sep 17 00:00:00 2001
-From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
-Date: Wed, 20 Dec 2017 20:00:32 +0100
-Subject: [PATCH] Glib::Threads::Private: Fix gobj()
-
-Bug 791711
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Backport [https://github.com/GNOME/glibmm/commit/37d57ae9572b7d74aa385a30313eceae7f2d3fce]
- glib/glibmm/threads.h | 2 +-
- glib/src/threads.hg   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/glib/glibmm/threads.h b/glib/glibmm/threads.h
-index f7e2b82a..2c0cbe8c 100644
---- a/glib/glibmm/threads.h
-+++ b/glib/glibmm/threads.h
-@@ -657,7 +657,7 @@ public:
-    */
-   inline void replace(T* data);
- 
--  GPrivate* gobj() { return gobject_; }
-+  GPrivate* gobj() { return &gobject_; }
- 
- private:
-   GPrivate gobject_;
-diff --git a/glib/src/threads.hg b/glib/src/threads.hg
-index 86d7a17b..c82a6130 100644
---- a/glib/src/threads.hg
-+++ b/glib/src/threads.hg
-@@ -628,7 +628,7 @@ public:
-    */
-   inline void replace(T* data);
- 
--  GPrivate* gobj() { return gobject_; }
-+  GPrivate* gobj() { return &gobject_; }
- 
- private:
-   GPrivate gobject_;
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
similarity index 86%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
index 4706432ab..2f048d2f6 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.56.0.bb
@@ -13,10 +13,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
-    file://0001-Glib-Threads-Private-Fix-gobj.patch \
 "
-SRC_URI[md5sum] = "dee5ebe309f5976c3dacfcf5c43a062b"
-SRC_URI[sha256sum] = "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a"
+SRC_URI[md5sum] = "5aa7a60084fe3e01d746c96f4a115302"
+SRC_URI[sha256sum] = "6e74fcba0d245451c58fc8a196e9d103789bc510e1eee1a9b1e816c5209e79a9"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.17.1


