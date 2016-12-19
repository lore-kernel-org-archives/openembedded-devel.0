Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 055D077330
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:56:41 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so24397821wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XFDfA50H/PxdUjMlofW470m1b86c89CuptYZoOPrSEE=;
	b=qvg6+gvO1z/BX2WTswOL2Ie+HTLCmwGWjubMXK0nl/6bniQXNqebvVuw93Gea6zcCP
	JFXxqA6fJBnprU3s9nXP2gZNpYCIA2W2+JLNOMjEainB4ZzkCFGH3kzmAUsvXM5jFTFV
	bIE2S625H1GuWILwVanIfLaFRn6haAR5c7BpMqklRM4CE8BGYJWJFPrSQbP467ZIiom6
	M65YaN/5DGZV7Aldnho3NkGxn8KXIHBXtqKJRgnQU0O7BB9gfRMhhZYMnmatPNC0QT/j
	uM0K2luwHaOC5mw6Er32RbftUErGo8lAHxtvKcx9vxpoCGn/8zQVltySVctci4B8OfCr
	Dyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XFDfA50H/PxdUjMlofW470m1b86c89CuptYZoOPrSEE=;
	b=BFIUX253mWCile07PgN0RbLRfP/+YWsQdFvkoJGMJz6k49tm23sy5qMrML8iZi0bon
	sYYuCYgXDJZmzlOIg1P4yhqvK82pOpUYpb1i8XwXJvS2IwmpXM9sf5YYjVUTPhkC47YK
	xxaGljOpVRGXJ6nImBvRe6lNkqVu8A/l3ftOwi9HTkyrA1M+AP6WqXhrsnji0VMi1w+V
	42c632qDZB1y7Va/Xrh4mz1tPjRn6ov9/JiwHhtvJEx7WatJ/S4BaBdaouEqt8tMYxW+
	wTRdJnEBX3A9t1gfNrqZphzKMyJvxeUiMSUKIeCBrPhomd6qPgAgVVrdSSZWqgIOB2SG
	+tlQ==
X-Gm-Message-State: AIkVDXIbRKOEKEegoVeSQLtMIdi+FH+LDj319gEwz4ph24OqqXCFylAoap52gkJii335JA==
X-Received: by 10.194.86.165 with SMTP id q5mr14303608wjz.178.1482166602453;
	Mon, 19 Dec 2016 08:56:42 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id
	cl10sm21440622wjb.4.2016.12.19.08.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 08:56:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 08:56:33 -0800
Message-Id: <1482166593-14228-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 16:56:42 -0000

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
index 0000000..1a9abc8
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
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF"
+
+# RapidJSON is a header-only C++ library, so the main package will be empty.
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


