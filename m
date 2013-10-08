Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id D09206A441
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 04:35:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUC003TQ22SKVK4@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 23:35:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DECF22002D; Tue,
	08 Oct 2013 00:35:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 08 Oct 2013 00:35:14 -0400
Message-id: <1381206914-8836-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] qtwebkit-examples: enable building and packaging of examples by default
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
X-List-Received-Date: Tue, 08 Oct 2013 04:35:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Note: binaries will go into ${PN}-examples, which is qtwebkit-examples-examples

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
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
1.8.3.2


