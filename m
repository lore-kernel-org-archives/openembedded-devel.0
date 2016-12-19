Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 78058731F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:01:34 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so23278145wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 04:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DcP2fp2jk0qxuBxP/C0q2RUT0C00HCLORONboWTfTVU=;
	b=V+gv2AgUczk0vwr1PNc8+ivMY6zwZD2ySXnyRFXx6qKSYRUA8FgtSiMUmvVOOlC84h
	xeMi739oY/3NR3kGDj/cnoWKGh9/Pmjvh2X2Wqy8A9dwgAqy6TAM5siddkMzLSWVltkx
	PwFXfpl83UAX9nSLU8949wMUYzC3uaIeniYrloP8oAXe38TA2QAHO1WxnIqussywU0kE
	R6mXjqFaZRrhcSbviR2nzDrOGhB/kn+JsqnIAMZk0WkHR7kwk0B/UCVxrk2MnvAz/ahr
	2yjXrMcoDl2VJoWoGiDmS6sjTJmrgr2Rv4F9XzD6CU+VSBPEoppNYcSewEO7CcSRbd0T
	PJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DcP2fp2jk0qxuBxP/C0q2RUT0C00HCLORONboWTfTVU=;
	b=MxT5WmNvfbWvBZDpRaVCAYxwxV3wTp6AKLgpgBqoWAArhdJ/3BCVCLNcfRo0H006Ys
	zGsiKnfX1ycSLs+bWTfqYcceNPuKtGZJIdRtFKTB0iq/XOxGy3zEAzN66y5RX8Vunl0V
	V0r8WRi0JWrHMY3IenRfJ+nTTKYU2ipitLYwkcTJM0+oJrjaZdz7bmGzzpXbUHXkqb4V
	E4W8bFVLB+kr4yMD4h0OZh5lY4evDs130v4mXq68MRozKSZEpcNWd3ItvV0DA4gtgUC4
	YVd0WLVGom/NLDpTAVpSoTDJ+rT/KgrGCUGi4Fqlbjjn9fL8DN6Thm/is1cssGSQcN32
	GCpw==
X-Gm-Message-State: AIkVDXL9Da28eUX4eHUFNDjdIdbxhjLTDb+csB9GiCLRC0Qr/XuKl1jS8+M5ZhA/XCrFWQ==
X-Received: by 10.194.65.74 with SMTP id v10mr15475025wjs.168.1482148895940;
	Mon, 19 Dec 2016 04:01:35 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id
	w197sm16898299wmd.11.2016.12.19.04.01.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Dec 2016 04:01:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 04:01:28 -0800
Message-Id: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 12:01:35 -0000

A fast JSON parser/generator for C++ with both SAX/DOM style API.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../Fix-gcc-strict-overflow-warning.patch          | 30 ++++++++++++++++++++
 .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 33 ++++++++++++++++++++++
 .../recipes-devtools/rapidjson/rapidjson_1.0.2.bb  | 23 +++++++++++++++
 3 files changed, 86 insertions(+)
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
index 0000000..1dcd8e0
--- /dev/null
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
+HOMEPAGE = "http://rapidjson.org/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970cd2"
+
+SRC_URI = "https://github.com/miloyip/rapidjson/archive/v${PV}.tar.gz \
+           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
+           file://Fix-gcc-strict-overflow-warning.patch \
+"
+
+SRC_URI[md5sum] = "97cc60d01282a968474c97f60714828c"
+SRC_URI[sha256sum] = "c3711ed2b3c76a5565ee9f0128bb4ec6753dbcc23450b713842df8f236d08666"
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


