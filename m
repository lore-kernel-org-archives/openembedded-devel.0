Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id D83466CF40
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:48:39 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 3A8D8A62A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:48:37 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:44 +0200
Message-Id: <1381222066-2737-19-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381222066-2737-1-git-send-email-eric@eukrea.com>
References: <1381222066-2737-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 19/21] qttools-native: update to 5.1.1
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
X-List-Received-Date: Tue, 08 Oct 2013 08:48:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 22 ++++++++++++----------
 ...ols-native_5.1.0.bb => qttools-native_5.1.1.bb} |  4 ++--
 2 files changed, 14 insertions(+), 12 deletions(-)
 rename recipes-qt/qt5/{qttools-5.1.0 => qttools-5.1.1}/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch (90%)
 rename recipes-qt/qt5/{qttools-native_5.1.0.bb => qttools-native_5.1.1.bb} (66%)

diff --git a/recipes-qt/qt5/qttools-5.1.0/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-5.1.1/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
similarity index 90%
rename from recipes-qt/qt5/qttools-5.1.0/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
rename to recipes-qt/qt5/qttools-5.1.1/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index f1b8783..a5f26a3 100644
--- a/recipes-qt/qt5/qttools-5.1.0/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-5.1.1/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 4df58d96ea516358d2762a219c0b196e56c8e89b Mon Sep 17 00:00:00 2001
+From 9337242944c936104db5eee64df804a27fb02bb8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
@@ -15,8 +15,8 @@ Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
  src/designer/src/src.pro  | 16 +++++++++-------
  src/linguist/linguist.pro |  2 +-
  src/src.pro               | 10 ++++++----
- tests/auto/auto.pro       | 20 +++++++++++---------
- 5 files changed, 29 insertions(+), 23 deletions(-)
+ tests/auto/auto.pro       | 22 ++++++++++++----------
+ 5 files changed, 30 insertions(+), 24 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
 index 4955969..8e86419 100644
@@ -103,10 +103,10 @@ index c8756db..d71c4a0 100644
  qtNomakeTools( \
      pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index 074aa34..a744d46 100644
+index eaf440b..1778ad1 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
-@@ -1,13 +1,15 @@
+@@ -1,14 +1,16 @@
  TEMPLATE=subdirs
 -SUBDIRS=\
 -    linguist \
@@ -116,7 +116,8 @@ index 074aa34..a744d46 100644
 -    qhelpgenerator \
 -    qhelpindexmodel \
 -    qhelpprojectdata \
--    cmake
+-    cmake \
+-    installed_cmake
 +!linguistonly {
 +    SUBDIRS=\
 +        linguist \
@@ -126,11 +127,12 @@ index 074aa34..a744d46 100644
 +        qhelpgenerator \
 +        qhelpindexmodel \
 +        qhelpprojectdata \
-+        cmake
++        cmake \
++        installed_cmake
 +}
  
- # These tests don't make sense for cross-compiled builds
- cross_compile:SUBDIRS -= host.pro
+ installed_cmake.depends = cmake
+ 
 -- 
-1.8.3.2
+1.8.3.1
 
diff --git a/recipes-qt/qt5/qttools-native_5.1.0.bb b/recipes-qt/qt5/qttools-native_5.1.1.bb
similarity index 66%
rename from recipes-qt/qt5/qttools-native_5.1.0.bb
rename to recipes-qt/qt5/qttools-native_5.1.1.bb
index 1da72a4..82b8c01 100644
--- a/recipes-qt/qt5/qttools-native_5.1.0.bb
+++ b/recipes-qt/qt5/qttools-native_5.1.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffe
                     file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891 \
 "
 
-SRC_URI[md5sum] = "f3cc602d4b720a847f4ab0953a82d8ef"
-SRC_URI[sha256sum] = "9b9aa948e01bf9d0fc7fa4584ededf9b5b280ee74c334c5790dbc6f9015b3738"
+SRC_URI[md5sum] = "022073d32ff9d408de0182b5d1f01781"
+SRC_URI[sha256sum] = "2b42c6d5feeccffb67e890b86a150bae64dd2ff550be39a3cc449ee0e95462b6"
-- 
1.8.4.rc3


