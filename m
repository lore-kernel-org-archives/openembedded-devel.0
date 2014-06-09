Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8607565EDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 12:35:00 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id sa20so6388533veb.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2014 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding:organization;
	bh=8X7KMMW5XS64ArqVTilwl32sqcdbO7ZoGvFEb1fLsL8=;
	b=pqCnHDRuQvnF8EowoGAI8ccW46Deg216Dt5ArjVuLusmdEuC/PuMbhTPN5/pBlv1jM
	MdK+Aec3IoPLZziz1+DFWrKLq9v3Cln/hTjX+fUHeNHkibmntSoQUSNZJ8hV1tyuigMo
	lcBhhWx2ZIr3cZeUSIaA+rT7ZAkufffb1wHZJZPH+DvhsTpHxCKo2siIL93Ky7gMfow2
	n2CqvlseKnCIZJl65dBD1WPYks87Gt03Mu5BKwnEk2IHgDIXx2nN0DDfIzpD+wRtvHke
	txb5MFdaEzlM2WpW0gYK/GlpdAMINS7VckpZxD3SeHzqpBLL30bOKeKEuvBzVUXObBI0
	uxKQ==
X-Received: by 10.220.94.146 with SMTP id z18mr23868939vcm.40.1402317301542;
	Mon, 09 Jun 2014 05:35:01 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id w7sm22643082vel.5.2014.06.09.05.34.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 05:34:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 319791B955411; Mon,  9 Jun 2014 09:34:56 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon,  9 Jun 2014 09:34:55 -0300
Message-Id: <1402317295-5120-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc4
In-Reply-To: <1402317295-5120-1-git-send-email-otavio@ossystems.com.br>
References: <1402317295-5120-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 3/3] tufao: Add recipe
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
X-List-Received-Date: Mon, 09 Jun 2014 12:35:03 -0000
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
2.0.0.rc4


