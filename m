Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2894065D8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:51:51 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so2998452eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=y1zhNECctLqaskvStE9iZHAhI7F9ln7tIqHvXmaebj4=;
	b=tCeZGds2IhUYUGf5pBjlov1qdPKRD5qrB1/CAP6PK/BD/zDt5GRosBp09QUWyiIdEH
	JEz+hZ1ZLpFtmM8w8uylt0q6PJFKeAPYG3N3yp/1f77+zbxga3Rckzytq2Hknr5Tggpm
	iQ+hlL2qEwYXe3hgKsiILXmWekXtAXbetzNGskZJIx3xz6weZlcBSZomWGrv62kjlWVq
	/Pol7ikkQsyEftcbhhFVvg74Z6noNPhuXaAvJRxY+dlZgXWYY6NbkwBZ6/T49rkXSUTB
	h5cwJEMoAaVTaavDNc5whf6EqQqFAuQcGcqV9OoWJ7/6q7jIlwqrDuBXMwiit8NXbIwU
	Ao2Q==
X-Received: by 10.14.176.1 with SMTP id a1mr39388917eem.52.1398005512146;
	Sun, 20 Apr 2014 07:51:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm95195383eef.15.2014.04.20.07.51.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:51:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Apr 2014 16:51:55 +0200
Message-Id: <1398005515-3350-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] cmake: remove .bbappends, resolved in oe-core
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
X-List-Received-Date: Sun, 20 Apr 2014 14:51:54 -0000

* it's included in daisy and master branches
  http://git.openembedded.org/openembedded-core/commit/?h=daisy&id=4f2dee0d8c2c3f60cb8f8021343e973cae31fc50

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cmake/cmake-native_2.8.12.2.bbappend             | 20 --------------------
 recipes-devtools/cmake/cmake_2.8.12.2.bbappend       | 20 --------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
 delete mode 100644 recipes-devtools/cmake/cmake_2.8.12.2.bbappend

diff --git a/recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend b/recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
deleted file mode 100644
index ebacf72..0000000
--- a/recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
-# and possibly missing qmake binary (qtbase-native can be removed from sysroot
-# e.g. in order to upgrade it, even when there is target qtbase)
-
-#| -- Performing Test run_pic_test - Success
-#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
-#|   The imported target "Qt5::Core" references the file
-#|
-#|      "/qmake"
-#|
-#|   but this file does not exist.  Possible reasons include:
-
-do_configure_prepend() {
-    sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-    sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
-    sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
-}
diff --git a/recipes-devtools/cmake/cmake_2.8.12.2.bbappend b/recipes-devtools/cmake/cmake_2.8.12.2.bbappend
deleted file mode 100644
index ebacf72..0000000
--- a/recipes-devtools/cmake/cmake_2.8.12.2.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
-# and possibly missing qmake binary (qtbase-native can be removed from sysroot
-# e.g. in order to upgrade it, even when there is target qtbase)
-
-#| -- Performing Test run_pic_test - Success
-#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
-#|   The imported target "Qt5::Core" references the file
-#|
-#|      "/qmake"
-#|
-#|   but this file does not exist.  Possible reasons include:
-
-do_configure_prepend() {
-    sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
-    sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
-    sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
-    sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
-}
-- 
1.9.1


