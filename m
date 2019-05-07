Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 894237D71B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 14:39:54 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k8so14558695lja.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6Ewn0PNHD3KDoZXtq1gqz9nDrKj7y7MYVHaaIYWudNE=;
	b=l05VXv0jL4rvGhsdCbNw/RdZrSqIxDBr2cZuLMUz1WsMt09gGFrecsPSZTzmnSBlBR
	r5HPFRrs3ZVTL6AElO9lVY0wD8KKMOaDDit/9DO8jJkiKS6qMX7fjfiRZmoXs9vQIMFY
	IP5EZI341CijaymCvLPRYc0izdgFlQ7mZKyrKqImmSs3zBqJ/OGiE4WI/8JGzxwMSJWB
	HPoDqRGVtZ69tWcIQlPP0fhSRCnIO3LK9GCPWe1jfU9Rj8exkU4Zfuvd3wZssLCfMQ18
	UdOimgT8sHZPCUdToyLvENeZn60I+aqtLwlHI2MxXL3b+A5lfSoeM71lTD2HNJGb66mc
	+OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6Ewn0PNHD3KDoZXtq1gqz9nDrKj7y7MYVHaaIYWudNE=;
	b=OZOqioUI8iPtDzde/c6/7kHlaSZAP4hZUDNJgVXuwinR5ruF87yXPn0LLlUErz0Iam
	wFx3omA3hUgHF+wYFw/osAWTmwV8oWIxkMU9YUyBvS7dTWu61urneTPRbc49zzYa2YuF
	Rcl0HdIShe0uI5vBxc2bp/muS8sUyuVfYjbJOAfWDhadLH2WDH5UkbudtF/kHmKoEe7k
	6cAnSzUv8byOc7hL/r29LU4SO5tLlXhDYswJH9HU/uazIIUvrgpbEAtSzV5hA5fqkzk0
	BINFWkp0mSsoSwia3ZOIyBOYziFXA1yvBxuinLGMkS7ZZlNLfSLS//fX1xIrCxdq5xMU
	rMeg==
X-Gm-Message-State: APjAAAVgMv3fz4suL2/ZNGwYmNPNZzdEYcWif1POvUHqCS3VkMChiePc
	7VqNCS9ZgaZGLIbW8dVnoSCB6JsYOYY=
X-Google-Smtp-Source: APXvYqxeBec/XBJZjhohS78KPwneC10f0n0zHF8JtSvW5L5qMfcALHOs/PuA7XqdADhc+dWzOXP31Q==
X-Received: by 2002:a2e:82cb:: with SMTP id n11mr17631097ljh.183.1557239994555;
	Tue, 07 May 2019 07:39:54 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z17sm3233002lja.26.2019.05.07.07.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 07:39:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2019 16:39:52 +0200
Message-Id: <20190507143952.6148-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] doxygen: replace ninja 1.9.0 fix with official one
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
X-List-Received-Date: Tue, 07 May 2019 14:39:54 -0000

This patch that fixes doxygen build with ninja 1.9.0 was accedpted by
the project and threfore more preferred.

https://github.com/doxygen/doxygen/pull/6965

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../doxygen/doxygen/0001-Fix-6906.patch       | 94 +++++++++++++++++++
 .../doxygen/doxygen_1.8.15.bb                 |  8 +-
 2 files changed, 96 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
new file mode 100644
index 000000000..bbebc4dc7
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
index 2435b587d..b49fbd4d0 100644
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
2.17.1


