Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 06A176CF4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:46 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id E6E69A623D;
	Tue,  8 Oct 2013 10:48:43 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:46 +0200
Message-Id: <1381222066-2737-21-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][PATCH v2 21/21] qtwebkit-examples: enable building and packaging of examples by default
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denys@ti.com>

Note: binaries will go into ${PN}-examples, which is qtwebkit-examples-examples

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/qt5/qtwebkit-examples.inc               |  4 +++
 ...amples-enable-building-examples-by-defaul.patch | 29 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch

diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index e8fa3e7..38b2a7c 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -4,4 +4,8 @@ LICENSE = "BSD & LGPLv2+"
 LIC_FILES_CHKSUM = "file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
                     file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=223;md5=13ffb472fefe4bdf6464954a22251f35"
 
+SRC_URI += " \
+    file://0001-qtwebkit-examples-enable-building-examples-by-defaul.patch \
+"
+
 DEPENDS += "qtwebkit"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
new file mode 100644
index 0000000..34d9622
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -0,0 +1,29 @@
+From 50ab1eaf41445459422ef1fd4070ee158ea55d1c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 8 Oct 2013 00:18:10 -0400
+Subject: [PATCH] qtwebkit-examples: enable building examples by default
+
+Examples are provided in sources, but the build for them is not enabled by
+default. Since example binaries are packaged separately to ${PN}-examples,
+having them built by default makes more sense.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ qtwebkit-examples.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/qtwebkit-examples.pro b/qtwebkit-examples.pro
+index 3fcecf1..2da8a36 100644
+--- a/qtwebkit-examples.pro
++++ b/qtwebkit-examples.pro
+@@ -2,4 +2,4 @@ requires(qtHaveModule(webkit))
+ 
+ load(qt_parts)
+ 
+-SUBDIRS += doc
++SUBDIRS += doc examples
+-- 
+1.8.3.2
+
-- 
1.8.4.rc3


