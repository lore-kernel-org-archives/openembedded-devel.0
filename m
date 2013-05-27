Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id F23C26A4EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2013 23:43:31 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 47D734B0015
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 01:43:28 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2013 01:43:51 +0200
Message-Id: <1369698233-4500-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369698233-4500-1-git-send-email-eric@eukrea.com>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 6/8] qtdeclarative-5.0.2: fix examples compilation
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
X-List-Received-Date: Mon, 27 May 2013 23:43:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../0001-qmltestexample-fix-link.patch             |   34 ++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_5.0.2.bb              |    4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
new file mode 100644
index 0000000..7ed95e4
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -0,0 +1,34 @@
+From e22cb54286083886be5081332de2f64ab0b78b4b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Sun, 26 May 2013 14:26:19 +0200
+Subject: [PATCH] qmltestexample: fix link
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+else we get :
+ld: warning: libQt5Quick.so.5, needed by libQt5QuickTest.so, not found
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+---
+ examples/qmltest/qmltest/qmltest.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
+index b5893c5..1b00e6c 100644
+--- a/examples/qmltest/qmltest/qmltest.pro
++++ b/examples/qmltest/qmltest/qmltest.pro
+@@ -14,7 +14,7 @@ TESTDATA += tst_basic.qml tst_item.qml
+ # This code exists solely for the purpose of building this example
+ # inside the examples/ hierarchy.
+ 
+-QT += qml qmltest
++QT += qml qmltest quick
+ 
+ macx: CONFIG -= app_bundle
+ 
+-- 
+1.8.1.4
+
diff --git a/recipes-qt/qt5/qtdeclarative_5.0.2.bb b/recipes-qt/qt5/qtdeclarative_5.0.2.bb
index 5853c96..e992c15 100644
--- a/recipes-qt/qt5/qtdeclarative_5.0.2.bb
+++ b/recipes-qt/qt5/qtdeclarative_5.0.2.bb
@@ -3,5 +3,9 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += " \
+    file://0001-qmltestexample-fix-link.patch \
+    "
+
 SRC_URI[md5sum] = "55ab45a7a17db5b202b225603a35a37c"
 SRC_URI[sha256sum] = "dcfcc6c0d1913d285dd7b42dd9bc457c304f3e3074a1e0d875fff1e9a8318520"
-- 
1.7.10.4


