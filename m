Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E50627FA21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCK5QdczJm
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373885;
	bh=DamsDklbIYT/K7dlteXIUZvwCzTTGWnxoWdAQYKHjqU=;
	h=From:To:Subject:Date:From;
	b=d0Q8wv2vzV9NaPEQ3F7GVRDG8Y3yhXjmhbJyjU6QHQfTgWdipxM9pfTn5l6LQd/E+
	8/cW5iD9S8ev4qB/RuUhx6599ZKz1hkYTMk2kwdM6xu/5MGKGtb7i6QirpERVRcNF/
	K5Ck3UNqFjsC+DrxbKCYz2HW4y39UgQdQ732PjYtAL4Q9fNUEl4yIjQ22rUrCzc4oi
	8bmDk2LNLTH/FmbNct7a8BR8jhDEwx8yNCoXIRwAo5mHeEvFc0KI5C3B8kfwd/LP8V
	6+y6kKY3L3EzBkHpzolWbbyHRzodD6sYJsCbSGy9wNMr4StSZRk9T0Sc1mKGqGm1YE
	eZos+owHykHKchKAPG3dFDNVw142S2XFfFTXOeWxifPcTEUVQcq5lrpU66gRB5B92y
	hBCSF7fAg9nHRl7/lBDnRGPNP6fKT5oFV3/ayd7Ab1mfP7l/hEYdq07Lp/2WjglvUQ
	aNt9fHNYi0e0YmsEW3PMILRRx5bkICimM7ZNL4Y5mcn17iqdbpm1yGWRxOIJbSodYL
	/oBZ5Hx5/fF6bULjm+8U2Us5ioBd25LNLMsYHbKkzdrq7z5/5ffmqBsOcaJG/+4Owo
	Obu9pgIk5xR8Dpt8wsAtziTAsKIf605fNmtrk9HVXHjEQy17o2CZ1f/+Vk+1zeRkzD
	Smqc7FoxXVO1mveHbz/gdFCs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:17 +0200
Message-Id: <20191029183123.1868-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] doxygen: Upgrade 1.8.15 -> 1.8.16
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:26 -0000

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../doxygen/doxygen/0001-Fix-6906.patch       | 94 -------------------
 .../{doxygen_1.8.15.bb => doxygen_1.8.16.bb}  |  6 +-
 2 files changed, 3 insertions(+), 97 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.15.bb => doxygen_1.8.16.bb} (71%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch b/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
deleted file mode 100644
index bbebc4dc7..000000000
--- a/meta-oe/recipes-devtools/doxygen/doxygen/0001-Fix-6906.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 81b213b98f51ec3eed5774f6f797c074ac35db3e Mon Sep 17 00:00:00 2001
-From: Ton van den Heuvel <tonvandenheuvel@gmail.com>
-Date: Mon, 6 May 2019 15:17:28 +0200
-Subject: [PATCH] Fix #6906
-
-Generate configvalues.h only as a dependency for the VHDL parser. Fixes
-a problem in combination with Ninja v1.9.0 because of duplicate rules
-for generating configvalues.h.
-
-Upstream-Status: Backport
-Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
----
- addon/doxyapp/CMakeLists.txt   |  8 --------
- addon/doxyparse/CMakeLists.txt |  8 --------
- src/CMakeLists.txt             |  4 ++++
- vhdlparser/CMakeLists.txt      | 12 +++---------
- 4 files changed, 7 insertions(+), 25 deletions(-)
-
-diff --git a/addon/doxyapp/CMakeLists.txt b/addon/doxyapp/CMakeLists.txt
-index a7377112..0aaf4655 100644
---- a/addon/doxyapp/CMakeLists.txt
-+++ b/addon/doxyapp/CMakeLists.txt
-@@ -1,11 +1,3 @@
--# configvalues.h
--add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
--    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
--    OUTPUT ${GENERATED_SRC}/configvalues.h
--)
--set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
--
- find_package(Iconv)
- 
- include_directories(
-diff --git a/addon/doxyparse/CMakeLists.txt b/addon/doxyparse/CMakeLists.txt
-index ff198fb4..1620c72e 100644
---- a/addon/doxyparse/CMakeLists.txt
-+++ b/addon/doxyparse/CMakeLists.txt
-@@ -1,11 +1,3 @@
--# configvalues.h
--add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
--    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
--    OUTPUT ${GENERATED_SRC}/configvalues.h
--)
--set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
--
- find_package(Iconv)
- 
- include_directories(
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 92a302ab..37a21ff6 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -43,6 +43,10 @@ add_custom_command(
-     OUTPUT ${GENERATED_SRC}/configvalues.h
- )
- set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
-+add_custom_target(
-+    generate_configvalues_header
-+    DEPENDS ${GENERATED_SRC}/configvalues.h
-+)
- 
- # configvalues.cpp
- add_custom_command(
-diff --git a/vhdlparser/CMakeLists.txt b/vhdlparser/CMakeLists.txt
-index 71e97df5..f89008c5 100644
---- a/vhdlparser/CMakeLists.txt
-+++ b/vhdlparser/CMakeLists.txt
-@@ -1,14 +1,5 @@
--# configvalues.h
--add_custom_command(
--    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/src/configgen.py -maph ${CMAKE_SOURCE_DIR}/src/config.xml > ${GENERATED_SRC}/configvalues.h
--    DEPENDS ${CMAKE_SOURCE_DIR}/src/config.xml ${CMAKE_SOURCE_DIR}/src/configgen.py
--    OUTPUT ${GENERATED_SRC}/configvalues.h
--)
--set_source_files_properties(${GENERATED_SRC}/configvalues.h PROPERTIES GENERATED 1)
--
- include_directories(${CMAKE_SOURCE_DIR}/src ${CMAKE_SOURCE_DIR}/qtools ${GENERATED_SRC})
- add_library(vhdlparser STATIC
--${GENERATED_SRC}/configvalues.h
- CharStream.cc
- ParseException.cc
- Token.cc
-@@ -17,3 +8,6 @@ VhdlParser.cc
- VhdlParserTokenManager.cc
- VhdlParserIF.cpp
- )
-+add_dependencies(vhdlparser
-+    generate_configvalues_header
-+)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb
similarity index 71%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb
index b49fbd4d0..4df994c75 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.15.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb
@@ -8,9 +8,9 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
-           file://0001-Fix-6906.patch"
-SRC_URI[md5sum] = "2c98c73eba392d334f5bbaf15e09bae3"
-SRC_URI[sha256sum] = "bd9c0ec462b6a9b5b41ede97bede5458e0d7bb40d4cfa27f6f622eb33c59245d"
+"
+SRC_URI[md5sum] = "3ec5f8bfda38a05845161fbbd5d8b439"
+SRC_URI[sha256sum] = "ff981fb6f5db4af9deb1dd0c0d9325e0f9ba807d17bd5750636595cf16da3c82"
 
 inherit cmake python3native
 
-- 
2.17.1


