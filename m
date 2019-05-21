Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB7DF7E146
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:00 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h17so7854621pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dnRl4qFbrdyjfOxl9S3jXO1FvCiv+twr6mol1xlKu0I=;
	b=g7bl0bRVkSMn6gU/mgMnVHFkGDEtD/TPCGrLGUPOcHAaMCIIRl4N93kmGOVi0QTZh1
	RjzbcrHwSZCd4EI552CvQ6xTijecsh9/ADzfzGk9L/vjbiZxC2HjlC8/D6He5DD/HyNv
	v7W7IZIrj8jlTqjGYxQb8i0CwgHVvaL5lS8pkjTzKfFAlpby3pKvw1iag1JBUJjlZutY
	5y5CBeW+JOyXLMjwCPbSB346Wtl33wkB72rF+FqqopAVaRwSLo5ahzz+y9HSjB6Eg2o7
	buexmGcalQQqxM5gUe2cVvBdeZ5kl3tiV80qd17QJe6yrqF8z6yfxssuZzOo+aeTs5HH
	rTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dnRl4qFbrdyjfOxl9S3jXO1FvCiv+twr6mol1xlKu0I=;
	b=Jn5tm8b054JKObiP9MJ/lp47fHHEe3XR46IsyN0aSqMiaz5e+sc+WpvBjDuy4sl4TL
	lFjtJDFikdSj3t5vEgBnxm+xJikqJCfvw9BKNmNbsE7ERKE6tzFbVxNfjOD8YOuSPy2A
	9mg26G2LzLRzy2/1bHoJMhNZXeo4uQYIFQ/c6bdtRz9igRG5xClhbOUbr8YZHUPEQGZi
	shR5Z5fGNSp2UIEfNheLAH5wfd5QOedkPh4zNI/Z5y1Tp3nO/ET4MNzr9OKqr7pEWGvj
	V/KFw2r8RMwRBR7ZW+tMlBxwSwfSWDojcGDt6sCz+e/Z6BtzicH2WAXAbkHJl7sHHCbq
	UQog==
X-Gm-Message-State: APjAAAVWFpnpwVFa0V8Ya9jnJWhiMKFIwFLaHDVH0BLJwpFJyaDTRpGQ
	HEEFNeKyC1zlu7Yv63sEaPmGL3oo
X-Google-Smtp-Source: APXvYqwT1ba2fStK2fb3HyZiynf4DDozn2PZoicjib9ltWSviesFUQZY9nCa2MOAgRrDQqDcARf7ww==
X-Received: by 2002:a63:7c6:: with SMTP id 189mr79296614pgh.247.1558411021660; 
	Mon, 20 May 2019 20:57:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:29 -0700
Message-Id: <2adbb65ea56280372160f490e5758a919103055b.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 29/34] doxygen: replace ninja 1.9.0 fix with official one
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
X-List-Received-Date: Tue, 21 May 2019 03:57:00 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

This patch that fixes doxygen build with ninja 1.9.0 was accedpted by
the project and threfore more preferred.

https://github.com/doxygen/doxygen/pull/6965

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../doxygen/doxygen/0001-Fix-6906.patch            | 94 ++++++++++++++++++++++
 meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb |  8 +-
 2 files changed, 96 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
new file mode 100644
index 0000000..bbebc4d
--- /dev/null
+++ b/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
@@ -0,0 +1,94 @@
+From 81b213b98f51ec3eed5774f6f797c074ac35db3e Mon Sep 17 00:00:00 2001
+From: Ton van den Heuvel <tonvandenheuvel@gmail.com>
+Date: Mon, 6 May 2019 15:17:28 +0200
+Subject: [PATCH] Fix #6906
+
+Generate configvalues.h only as a dependency for the VHDL parser. Fixes
+a problem in combination with Ninja v1.9.0 because of duplicate rules
+for generating configvalues.h.
+
+Upstream-Status: Backport
+Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
+---
+ addon/doxyapp/CMakeLists.txt   |  8 --------
+ addon/doxyparse/CMakeLists.txt |  8 --------
+ src/CMakeLists.txt             |  4 ++++
+ vhdlparser/CMakeLists.txt      | 12 +++---------
+ 4 files changed, 7 insertions(+), 25 deletions(-)
+
+diff --git a/addon/doxyapp/CMakeLists.txt b/addon/doxyapp/CMakeLists.txt
+index a7377112..0aaf4655 100644
+--- a/addon/doxyapp/CMakeLists.txt
++++ b/addon/doxyapp/CMakeLists.txt
+@@ -1,11 +1,3 @@
+-# configvalues.h
+-add_custom_command(
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
+-    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    OUTPUT ${GENERATED_SRC}/configvalues.h
+-)
+-set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
+-
+ find_package(Iconv)
+ 
+ include_directories(
+diff --git a/addon/doxyparse/CMakeLists.txt b/addon/doxyparse/CMakeLists.txt
+index ff198fb4..1620c72e 100644
+--- a/addon/doxyparse/CMakeLists.txt
++++ b/addon/doxyparse/CMakeLists.txt
+@@ -1,11 +1,3 @@
+-# configvalues.h
+-add_custom_command(
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
+-    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    OUTPUT ${GENERATED_SRC}/configvalues.h
+-)
+-set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
+-
+ find_package(Iconv)
+ 
+ include_directories(
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 92a302ab..37a21ff6 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -43,6 +43,10 @@ add_custom_command(
+     OUTPUT ${GENERATED_SRC}/configvalues.h
+ )
+ set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
++add_custom_target(
++    generate_configvalues_header
++    DEPENDS ${GENERATED_SRC}/configvalues.h
++)
+ 
+ # configvalues.cpp
+ add_custom_command(
+diff --git a/vhdlparser/CMakeLists.txt b/vhdlparser/CMakeLists.txt
+index 71e97df5..f89008c5 100644
+--- a/vhdlparser/CMakeLists.txt
++++ b/vhdlparser/CMakeLists.txt
+@@ -1,14 +1,5 @@
+-# configvalues.h
+-add_custom_command(
+-    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
+-    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
+-    OUTPUT ${GENERATED_SRC}/configvalues.h
+-)
+-set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
+-
+ include_directories(${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/qtools ${GENERATED_SRC})
+ add_library(vhdlparser STATIC
+-${GENERATED_SRC}/configvalues.h
+ CharStream.cc
+ ParseException.cc
+ Token.cc
+@@ -17,3 +8,6 @@ VhdlParser.cc
+ VhdlParserTokenManager.cc
+ VhdlParserIF.cpp
+ )
++add_dependencies(vhdlparser
++    generate_configvalues_header
++)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
index 2435b58..b49fbd4 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
@@ -7,15 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
-           file://0001-build-don-t-look-for-Iconv.patch"
+           file://0001-build-don-t-look-for-Iconv.patch \
+           file://0001-Fix-6906.patch"
 SRC_URI[md5sum] = "2c98c73eba392d334f5bbaf15e09bae3"
 SRC_URI[sha256sum] = "bd9c0ec462b6a9b5b41ede97bede5458e0d7bb40d4cfa27f6f622eb33c59245d"
 
 inherit cmake python3native
 
-# Avoid the following error:
-#   ninja: error: build.ninja:1948: multiple rules generate
-#   generated_src/configvalues.h [-w dupbuild=err]
-EXTRA_OECMAKE_BUILD += "-w dupbuild=warn"
-
 BBCLASSEXTEND = "native"
-- 
2.7.4


