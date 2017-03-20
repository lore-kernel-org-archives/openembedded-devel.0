Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDF271D7F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r137so11754427pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cONmyZwCwvtqXAJNyxXqJAzKAcn31a+b88V6RiS8H4k=;
	b=lmwU9fHuXkgBZPg9ASn0a7qIqeCZ7JpT4zluVloggfGBlckO+lfBoGF72VNacn6hHh
	CcNzSGbN1tUEqoWYVaoZkMp+LxYSvQOYRa7Y4P17Y+M1xoCy+Qb39JivKVjdRR8n/Ndo
	OaaO9SIHxIOlc/XmDwamYPgEONQw3+JnWzuXYwxS3m3zs6Zwo1XKP2MoYfVpY0Vmow1a
	m9R/4SSzTwTOMTnTtq6gzya9oazbmQhn+2Pm8ZdKqYoGJwGcoO45av73kyHvxX2TysJs
	uJ4aRKdUCSgxv5P18Y/1ZUnmH18ffw3NvP7/Zsjbf2C9PhFyFIhF2LUodJp6ROGcoF97
	qRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cONmyZwCwvtqXAJNyxXqJAzKAcn31a+b88V6RiS8H4k=;
	b=BxNWgzhKCKeR+G898bxmyee6NhUc1RyxbZHaH2IIqwgYMbYmXnbUljLGYIGJU9yAl6
	ScbM/zoIxq0TYYmEPB74A42bPl0dUUkgCDHkH9O3qGhTwPQ9RpnbBklLUbBJ8vyI/Wbm
	2BWNr0UlkaYKhpwqZb6N2/XdMRRnB3D/CpbW9GIzuWFSyQjm/dHs81x4Jugtv8UXgimR
	XqoEVusAu3fweljOovnlllsdqEtJNg35fuAVw0xrE9RRjslxIfX8uej4tveAmy1EOi1i
	hbFeeA2/ZOmLLy1wRYjgTH7chwAvEMqmDtCbycWtOUXfNXD7gjAhrhMKuaPUAiz+P/ph
	tHDA==
X-Gm-Message-State: AFeK/H22jCEBQgkTWUFNs2VBQCfsgH9ifKfrqZE2Y+b9zT9BW5nWZND8z+9fY1DJBkT5pQ==
X-Received: by 10.84.208.227 with SMTP id c32mr36918216plj.71.1489987927269;
	Sun, 19 Mar 2017 22:32:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:38 -0700
Message-Id: <20170320053152.29352-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 02/16] rapidjson: Update to 1.1.0 + git
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:06 -0000

Drop backports
Adjust the license checksums to match the changes to file especially

https://github.com/miloyip/rapidjson/commit/b4b1a39937fbd168ef72ea477f90f626773d56fc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../Fix-gcc-strict-overflow-warning.patch          | 30 ----------------
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 41 +++++++++++++---------
 .../{rapidjson_1.0.2.bb => rapidjson_git.bb}       |  9 ++---
 3 files changed, 29 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
 rename meta-oe/recipes-devtools/rapidjson/{rapidjson_1.0.2.bb => rapidjson_git.bb} (73%)

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
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
similarity index 73%
rename from meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
rename to meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index dd6b89698..4cded0720 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -2,20 +2,21 @@ SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
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
+SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
+
+PV = "1.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-- 
2.12.0


