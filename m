Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72E2773109
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 77so9356944pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7UpWB+r5IbwhLwCkoW6uovKGyd3qnGjxeX6SKfxPfcE=;
	b=KJUejnra54LuD8kyt2I1FKIxG9/fqe7OsmBjQpf01azkdHJqVfpG+Fe1RiUwwx6keD
	zm/c01YUCm+FOfMNE2GHEFtd14eqnhX+gjtZqkAGeFCnQ/6x7sKEJX9tLxJDh4xE5aIr
	0tPmzfda3uUYNod4eKZRZCkuMRpsItOoBTKAZgVntetTlO/ouVkWUVec/u6pi/c1W1c/
	TbvlGDhsLWiy0WEmJorHUN97S1bI8U/X93DnfQ7Is8X6qimHYHX5f7FdpdHQY/+tCyOx
	DyocIwQVCtkITVyT8h2iaH3u2MUNEyvHUWfJnT1gj/v68aVdf7inKzHVHWn/2pMCXyPw
	ZVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7UpWB+r5IbwhLwCkoW6uovKGyd3qnGjxeX6SKfxPfcE=;
	b=reg8Lxm9T9hXZY+c6zx1JDovJ0kcZ2e/Tntg5QGeAVJn7axtNHjUAbipYz7pXkGY2s
	PDxlnQ0RzHdCRuYF0gWgMFcXKPLbPm6ygtnGXRIitm2tBOhWHaXMuWdA44TAaTGkmteg
	S+iZ/9LTpPcP8rfuvylu5VAaq+6BVN8kYvWpONbF79FQ/FoqtdPw7XxYCdrm7EOCrFCd
	gLldAsvhRhaJe4Mh7Uv/nN/fmv16RUCyMIN5cR05iXhyem9tGCZle/9cbf4MpPVzqQhA
	pjOnJEAhVaTwn/8dbISOoFRJ0IkMHO+VdPI2BajSYBq3mFZatDjigStriQU97d7HXVTb
	bedw==
X-Gm-Message-State: AMke39kP4C59AbxVyBawoxq5o934vupDwanAeEpdZknJNWIPDpoDf05MiYh9aqhXzerwVQ==
X-Received: by 10.84.146.140 with SMTP id g12mr32304702pla.70.1488870849637;
	Mon, 06 Mar 2017 23:14:09 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:46 -0800
Message-Id: <20170307071349.16444-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/14] rapidjson: Update to 1.1.0 + git
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:08 -0000

Drop backports
Adjust the license checksums to match the changes to file especially

https://github.com/miloyip/rapidjson/commit/b4b1a39937fbd168ef72ea477f90f626773d56fc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../Fix-gcc-strict-overflow-warning.patch          | 30 ----------------
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 41 +++++++++++++---------
 .../{rapidjson_1.0.2.bb => rapidjson_1.1.0.bb}     |  7 ++--
 3 files changed, 28 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
 rename meta-oe/recipes-devtools/rapidjson/{rapidjson_1.0.2.bb => rapidjson_1.1.0.bb} (74%)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
deleted file mode 100644
index 6ce3933ce..000000000
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
-From: Milo Yip <miloyip@gmail.com>
-Date: Wed, 2 Mar 2016 01:01:17 +0800
-Subject: [PATCH] Fix gcc strict-overflow warning
-
-Fix #566 #568
-
-Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- include/rapidjson/internal/dtoa.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/rapidjson/internal/dtoa.h b/include/rapidjson/internal/dtoa.h
-index 2d8d2e4..15571e1 100644
---- a/include/rapidjson/internal/dtoa.h
-+++ b/include/rapidjson/internal/dtoa.h
-@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
- inline char* Prettify(char* buffer, int length, int k) {
-     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
- 
--    if (length <= kk && kk <= 21) {
-+    if (0 <= k && kk <= 21) {
-         // 1234e7 -> 12340000000
-         for (int i = length; i < kk; i++)
-             buffer[i] = '0';
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
index 17164283c..cf3e16ea5 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
@@ -12,22 +12,29 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 68139ba..cae7c9b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
- endif()
+Index: git/CMakeLists.txt
+===================================================================
+--- git.orig/CMakeLists.txt
++++ git/CMakeLists.txt
+@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
  
  if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
- elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
--    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
-+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
- elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
-     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
- endif()
--- 
-1.9.1
-
+     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
+-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+     else()
+       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
+-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+     endif()
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
+     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wsign-conversion)
+@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
+       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
+     else()
+       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
+-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+     endif()
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-missing-field-initializers")
+     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wimplicit-fallthrough -Weverything)
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.0.bb
similarity index 74%
rename from meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
rename to meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.0.bb
index dd6b89698..402c93921 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.1.0.bb
@@ -2,14 +2,15 @@ SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
 HOMEPAGE = "http://rapidjson.org/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970cd2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
 SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
            file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
-           file://Fix-gcc-strict-overflow-warning.patch \
 "
 
-SRCREV = "3d5848a7cd3367c5cb451c6493165b7745948308"
+SRCREV = "ecf3d64293d84666534a23523814df6323c6bfe5"
+
+PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.12.0


