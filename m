Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A621F71A91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 23:24:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b22so10133519pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=diCBY/mbDSenKqz5Whdxd5ScHYj4Nvmy0ebadGiFo8c=;
	b=sBNe1/nojcfUTUaHH1MYdCdSs7sB3YV8JPu6LEWDKhtvdLAm0ae4qgZWwPtTk4Dve0
	s14T6CfgSWzP3S9Ov+jd+XoojBpBpXXS/wtXA4EBx74Q2p79lMnaFS9OnxO1k7YkRzEh
	uOUBSV3nMwwo/CvparkC23yiwiI3hxxxeAgoGLPNP9g2qgeX5r/4HsjJlFAuOYkU1ZbU
	R9g9efK8j8gwP0i+byGoVlXu4LwaXdcTtN8g6oxr8ZBskvzq65o+pgSMfDbrIZhNMqHu
	5K/tB/U4Fi8KfQLP27YezXXT8wwIhvapeu6KJIgTMJ3q2p319FzzL2z7STwbD0Kvwp8w
	NMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=diCBY/mbDSenKqz5Whdxd5ScHYj4Nvmy0ebadGiFo8c=;
	b=TNGcEoPgnCZCYDSMnubd5AJUlSFbBkKkGU0nGzdfVWEnm0dPQm76diXDh/lBmLyu18
	lyOzBgCA6fkfonZPcZGtGLpm+R7ZuaVExtfrk0IGE7/KcwrvUceuN/6JrZTMckea+vNh
	q5/5KhpCw3hqiC50+HMLwggcuEzq9E5qSc37GN365QNWXrKnek7uRVMw7jotQmVlTNLJ
	HYlATw1eT0pKs0CWdHShbTLbO62tllKA2OFIAs8RzhB0Mt4orFR5sQ0DSOOoaYNzknug
	xp77EIaHQK8X9FvzEuaGbvH9NCkRgB4HA20vgoC0iSJjrlDSZbJDVhlcopzHFhJabViL
	v3Lw==
X-Gm-Message-State: AIkVDXKfZrqOkTsMJk9v6ovUOCHrFzw1ryzE4zPh8Exw4tjeM3fl9yUh5QhUgXxkoXcBbA==
X-Received: by 10.98.98.66 with SMTP id w63mr25551048pfb.84.1484349889282;
	Fri, 13 Jan 2017 15:24:49 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a25sm31774924pgd.26.2017.01.13.15.24.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 15:24:47 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:24:41 -0800
Message-Id: <1484349881-16952-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] rapidjson: add initial recipe
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
X-List-Received-Date: Fri, 13 Jan 2017 23:24:50 -0000

A fast JSON parser/generator for C++ with both SAX/DOM style API.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../Fix-gcc-strict-overflow-warning.patch          | 30 ++++++++++++++++++++
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 33 ++++++++++++++++++++++
 .../recipes-devtools/rapidjson/rapidjson_1.0.2.bb  | 24 ++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
 create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
new file mode 100644
index 0000000..6ce3933
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
@@ -0,0 +1,30 @@
+From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
+From: Milo Yip <miloyip@gmail.com>
+Date: Wed, 2 Mar 2016 01:01:17 +0800
+Subject: [PATCH] Fix gcc strict-overflow warning
+
+Fix #566 #568
+
+Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ include/rapidjson/internal/dtoa.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/rapidjson/internal/dtoa.h b/include/rapidjson/internal/dtoa.h
+index 2d8d2e4..15571e1 100644
+--- a/include/rapidjson/internal/dtoa.h
++++ b/include/rapidjson/internal/dtoa.h
+@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
+ inline char* Prettify(char* buffer, int length, int k) {
+     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
+ 
+-    if (length <= kk && kk <= 21) {
++    if (0 <= k && kk <= 21) {
+         // 1234e7 -> 12340000000
+         for (int i = length; i < kk; i++)
+             buffer[i] = '0';
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
new file mode 100644
index 0000000..1716428
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
@@ -0,0 +1,33 @@
+From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 19 Dec 2016 01:37:11 -0800
+Subject: [PATCH] remove -march=native from CMAKE_CXX_FLAGS
+
+Not appropriate when cross compiling.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 68139ba..cae7c9b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
+ endif()
+ 
+ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
+ elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
+-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
+ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
+     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
+ endif()
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
new file mode 100644
index 0000000..dd6b896
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
+HOMEPAGE = "http://rapidjson.org/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970cd2"
+
+SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
+           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
+           file://Fix-gcc-strict-overflow-warning.patch \
+"
+
+SRCREV = "3d5848a7cd3367c5cb451c6493165b7745948308"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
+
+# RapidJSON is a header-only C++ library, so the main package will be empty.
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


