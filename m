Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id AC19C609AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Jul 2014 03:21:33 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hy10so2788755vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jul 2014 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:organization;
	bh=/nmz9EBLj+o1tTj4uJqnGkk1KocSATp+YZxK/3sDhxY=;
	b=BTrE3Ic2yWv+YgDkH5zE41r4q9iOm7wxr128lsY/k67/3Xcbuc9J9wPTtlfbchK/Xp
	yUXhVbfPuwYUBL0DFB7jtKdPQuWTXnvZ66fhL/rCKDgGZ/LC7vqbz45pd63GJFiRjgkw
	7V9oxW0ySYssCf0SGotkKLjXAB6WBTAHpPaWE0MZIxwoYnctPrgti208QEYTMsHRnYak
	NV68Bzc1lLyPoKY9zenuo4gHr8nVUDhywsfUeomd/2hBw4R7KrMIOUzf/u/sDi/hIxjo
	8F3lie2VlVpOZH1sfL+9ecQWO6xWc28qGzG6ABtarsuGdgGVDcC5aRB+tc7UQ2LoPFFc
	n9Ig==
X-Received: by 10.58.229.162 with SMTP id sr2mr18619601vec.15.1404616894304;
	Sat, 05 Jul 2014 20:21:34 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	sw14sm32002387vdb.6.2014.07.05.20.21.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Jul 2014 20:21:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EA5CB1BD04CD4; Sun,  6 Jul 2014 00:21:29 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  6 Jul 2014 00:21:28 -0300
Message-Id: <1404616888-12675-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH] tufao: Add recipe
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
X-List-Received-Date: Sun, 06 Jul 2014 03:21:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tufão is an asynchronous web framework for C++ built on top of Qt
inspired in Node.js.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...kspecs-and-CMake-module-install-directori.patch | 42 ++++++++++++++++++++++
 recipes-qt/tufao/tufao_1.2.1.bb                    | 31 ++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 recipes-qt/tufao/tufao/build-Fix-mkspecs-and-CMake-module-install-directori.patch
 create mode 100644 recipes-qt/tufao/tufao_1.2.1.bb

diff --git a/recipes-qt/tufao/tufao/build-Fix-mkspecs-and-CMake-module-install-directori.patch b/recipes-qt/tufao/tufao/build-Fix-mkspecs-and-CMake-module-install-directori.patch
new file mode 100644
index 0000000..a6da1ae
--- /dev/null
+++ b/recipes-qt/tufao/tufao/build-Fix-mkspecs-and-CMake-module-install-directori.patch
@@ -0,0 +1,42 @@
+From 878c5a2a47d620f36dd281d4b0eb6677a8a1fbd4 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 7 Jun 2014 18:13:14 -0300
+Subject: [PATCH] build: Fix mkspecs and CMake module install directories
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Inapropriate [configuration]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ CMakeLists.txt     | 2 +-
+ pkg/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d78fedf..1f4db6b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -27,7 +27,7 @@ endfunction(QUERY_QMAKE)
+ query_qmake(QT_INSTALL_PLUGINS QT_PLUGINS_DIR)
+ query_qmake(QT_HOST_DATA QT_DATA_DIR)
+ 
+-set(QT_MKSPECS_DIR ${QT_DATA_DIR}/mkspecs)
++set(QT_MKSPECS_DIR ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs)
+ 
+ # Configure options
+ option(GENERATE_DOC
+diff --git a/pkg/CMakeLists.txt b/pkg/CMakeLists.txt
+index 25891a5..a87fedd 100644
+--- a/pkg/CMakeLists.txt
++++ b/pkg/CMakeLists.txt
+@@ -19,6 +19,6 @@ if(PKG_CONFIG_FOUND)
+     )
+ endif(PKG_CONFIG_FOUND)
+ install(FILES "${CMAKE_CURRENT_BINARY_DIR}/FindTufao${TUFAO_VERSION_MAJOR}.cmake"
+-    DESTINATION "${CMAKE_ROOT}/Modules"
++    DESTINATION "${libdir}/cmake"
+     COMPONENT development
+ )
+-- 
+2.0.0.rc4
+
diff --git a/recipes-qt/tufao/tufao_1.2.1.bb b/recipes-qt/tufao/tufao_1.2.1.bb
new file mode 100644
index 0000000..34b28b7
--- /dev/null
+++ b/recipes-qt/tufao/tufao_1.2.1.bb
@@ -0,0 +1,31 @@
+SUMMARY = "An asynchronous web framework for C++ built on top of Qt"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+DEPENDS = "qtbase"
+
+SRCREV = "a4832b4c941b5ff3f5fab23adcff39e6ad6cb4e5"
+SRC_URI = "git://github.com/vinipsmaker/tufao.git;protocol=http \
+           file://build-Fix-mkspecs-and-CMake-module-install-directori.patch"
+
+# This includes bugfixes from 1.x branch
+PV_append = "+${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake_qt5
+
+PACKAGES += "${PN}-mkspecs"
+
+FILES_${PN}-mkspecs = "\
+    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs \
+"
+
+FILES_${PN}-dev += " \
+    ${OE_QMAKE_PATH_LIBS}/lib*${SOLIBSDEV} \
+    ${OE_QMAKE_PATH_LIBS}/pkgconfig \
+    ${OE_QMAKE_PATH_LIBS}/cmake/* \
+    ${OE_QMAKE_PATH_LIBS}/*.prl \
+    ${OE_QMAKE_PATH_LIBS}/*.la \
+    ${OE_QMAKE_PATH_DATA}/* \
+    ${OE_QMAKE_PATH_HEADERS}/* \
+"
-- 
2.0.0


