Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8D016EC7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:47:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s26AlEVd023098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Mar 2014 02:47:14 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.170.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Thu, 6 Mar 2014 02:47:13 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 6 Mar 2014 12:46:40 +0200
Message-ID: <1394102800-29549-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [128.224.170.197]
Subject: [meta-qt5][dora][PATCH] qtwayland: Fix Project ERROR: Module v8 has no public API
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
X-List-Received-Date: Thu, 06 Mar 2014 10:47:14 -0000
Content-Type: text/plain

From: "florin.sarbu" <florin.sarbu@windriver.com>

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 .../fix.missing.v8.public.api.patch                | 30 ++++++++++++++++++++++
 .../qtwayland-git/fix.missing.v8.public.api.patch  | 30 ++++++++++++++++++++++
 recipes-qt/qt5/qtwayland.inc                       |  1 +
 3 files changed, 61 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
 create mode 100644 recipes-qt/qt5/qtwayland-git/fix.missing.v8.public.api.patch

diff --git a/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
new file mode 100644
index 0000000..6bbbaa1
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-5.1.0+git/fix.missing.v8.public.api.patch
@@ -0,0 +1,30 @@
+From b455f5acaec811b70ae3eb896c08a634909cb9d1 Mon Sep 17 00:00:00 2001
+From: Carsten Munk <carsten.munk@jollamobile.com>
+Date: Wed, 17 Jul 2013 07:28:04 +0000
+Subject: [PATCH] Fix Project ERROR: Module v8 has no public API. make[1]: ***
+ [sub-qml-compositor-make_first] Error 3
+
+Cherry-picked from:
+https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c08a634909cb9d1
+
+Signed-off-by: Carsten Munk <carsten.munk@jollamobile.com>
+---
+ qtwayland/examples/qml-compositor/qml-compositor.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/qml-compositor/qml-compositor.pro b/examples/qml-compositor/qml-compositor.pro
+index 0bc0b02..e397002 100644
+--- a/examples/qml-compositor/qml-compositor.pro
++++ b/examples/qml-compositor/qml-compositor.pro
+@@ -2,7 +2,7 @@ DEFINES += QT_COMPOSITOR_QUICK
+ 
+ LIBS += -L ../../lib
+ 
+-QT += quick qml v8
++QT += quick qml
+ QT += quick-private
+ 
+ QT += compositor
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtwayland-git/fix.missing.v8.public.api.patch b/recipes-qt/qt5/qtwayland-git/fix.missing.v8.public.api.patch
new file mode 100644
index 0000000..6bbbaa1
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-git/fix.missing.v8.public.api.patch
@@ -0,0 +1,30 @@
+From b455f5acaec811b70ae3eb896c08a634909cb9d1 Mon Sep 17 00:00:00 2001
+From: Carsten Munk <carsten.munk@jollamobile.com>
+Date: Wed, 17 Jul 2013 07:28:04 +0000
+Subject: [PATCH] Fix Project ERROR: Module v8 has no public API. make[1]: ***
+ [sub-qml-compositor-make_first] Error 3
+
+Cherry-picked from:
+https://github.com/kvahlman/qtwayland/commit/b455f5acaec811b70ae3eb896c08a634909cb9d1
+
+Signed-off-by: Carsten Munk <carsten.munk@jollamobile.com>
+---
+ qtwayland/examples/qml-compositor/qml-compositor.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/qml-compositor/qml-compositor.pro b/examples/qml-compositor/qml-compositor.pro
+index 0bc0b02..e397002 100644
+--- a/examples/qml-compositor/qml-compositor.pro
++++ b/examples/qml-compositor/qml-compositor.pro
+@@ -2,7 +2,7 @@ DEFINES += QT_COMPOSITOR_QUICK
+ 
+ LIBS += -L ../../lib
+ 
+-QT += quick qml v8
++QT += quick qml
+ QT += quick-private
+ 
+ QT += compositor
+-- 
+1.8.4
+
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index 40dd803..2d5d6af 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0001-xcbcommon-should-not-be-a-mandatory-dependency.patch \
     file://0002-Temporarily-patching-this-out-as-Qt5.0.0-does-not-ha.patch \
     file://0003-eglCreateImageKHR-requires-the-context-to-be-NULL.patch \
+    file://fix.missing.v8.public.api.patch \
 "
 
 QT_WAYLAND_CONFIG ?= "wayland-compositor"
-- 
1.8.3.1


