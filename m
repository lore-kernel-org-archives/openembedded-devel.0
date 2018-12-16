Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7534A7BE60
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2018 13:38:11 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y56so8542723edd.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2018 05:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BA2oWCYNhxrBfqnhKJO2g6UeRx81Shz0DE/ghRW7E9A=;
	b=TT35YP9o0JxX9dk3ZLOsxpWipU+k3MZ/St+0rpTAwJaIOEf7IZL2fCZDbMSpKCZPvp
	aAlm09CXfE9cRuTwOkmZHJ6jMGb0W8DCqyp0QRxz+peTNSdnyAoAiprEakuPoZaIY5pa
	HcGgXSJb3zMoQpAFgldopaPDn28kI6IZtQIugtaZN0wooYVsxqClqnwLKu/GptNH+a6/
	gSGrzfrra26u+w4LJSSDEvrlJoJ+ZBg5OsQRzAZjezBPDhwiyxeUi4O9znR515Tq/m+H
	ZspdZJJ02/lp2JFZW8w14ka9QtTLa2gLGxkqaspIwVZiQvqaWC3UIz7qwkuSTz3nI56C
	1aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BA2oWCYNhxrBfqnhKJO2g6UeRx81Shz0DE/ghRW7E9A=;
	b=exazcQYXS3LLLh9TuGu3Zk14zAO/GeF26M7GZFGiPYeu1Y0oVyCgcM1/LcemQahNr9
	87Dc0u5t/1gK/oU0GgCwYlzTScPe2Aw+4H/rtcbIgSr/MzpqexvIAhjZTUsS9xO+fUZl
	JYXFxhB4U+7MYsD8HPf0VhVmZV/ttQY120BKzTJVA1YDshJ9WJdnF5xSR3VRnoio3X0q
	6eLgQ7a7oNrFyjg2Vp85aKzGsdLp7n/DKbXoInisae4zLQnm1/Caz8Vlh6yucaLvEV1E
	2Kembh/FsqsDjKhez5yJw2cJwKruN7sHllYgfMKPwT7sIklmsf6r4b0/6wQ4KgumEE+N
	x5kg==
X-Gm-Message-State: AA+aEWYXYsWsLZVU8XosvD7/AmV3m9QSVpdxyqd5PnoHywNdaiLMofGT
	WZFiYN5NQQaCtjCVUQn/CZs3+uEt
X-Google-Smtp-Source: AFSGD/V0h8hODrdnjix/JEoNjW/0MnMm1tv5X7DLq20uUSlXFtLUjDiXFHk2/g2wyeBLEK3XqBtsyg==
X-Received: by 2002:a17:906:46c7:: with SMTP id
	k7-v6mr7373022ejs.71.1544967491315; 
	Sun, 16 Dec 2018 05:38:11 -0800 (PST)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	g13-v6sm1494979ejr.1.2018.12.16.05.38.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Dec 2018 05:38:10 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2018 14:38:01 +0100
Message-Id: <20181216133801.56483-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] flatbuffers: update to 1.10.0
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
X-List-Received-Date: Sun, 16 Dec 2018 13:38:11 -0000

From: Adrian Freihofer <adrian.freihofer@scs.ch>

This is in fact an update from 1.7.1 to 1.10.0. (The git hash
of the 1.9.0 recipe referred flatbuffers release 1.7.1.)

This patch is obsolete, a similar fix has been applied upstream:
- 0001-correct-version-for-so-lib.patch
These two patches have been applied upstream:
- 0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
- 0002-use-__builtin_bswap16-when-building-with-clang.patch

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 .../0001-correct-version-for-so-lib.patch     |  26 ----
 ...-EndianSwap-template-to-flatbuffers-.patch | 113 ------------------
 ...tin_bswap16-when-building-with-clang.patch |  30 -----
 ...buffers_1.9.0.bb => flatbuffers_1.10.0.bb} |  13 +-
 4 files changed, 5 insertions(+), 177 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
 delete mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
 delete mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.9.0.bb => flatbuffers_1.10.0.bb} (61%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch b/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
deleted file mode 100644
index a7a42f981..000000000
--- a/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8b44dc65d98d50b462843ac9dab6fe3fc25abe36 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Fri, 12 May 2017 13:54:49 +0200
-Subject: [PATCH] correct version for so lib
-
-Upstream-Status: Pending
-
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3670afe..f4fcd2c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -172,6 +172,7 @@ endif()
- if(FLATBUFFERS_BUILD_SHAREDLIB)
-   add_library(flatbuffers_shared SHARED ${FlatBuffers_Library_SRCS})
-   set_target_properties(flatbuffers_shared PROPERTIES OUTPUT_NAME flatbuffers)
-+  set_target_properties(flatbuffers_shared PROPERTIES VERSION "${PV}")
- endif()
- 
- function(compile_flatbuffers_schema_to_cpp SRC_FBS)
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch b/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
deleted file mode 100644
index d736f012b..000000000
--- a/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From a614d8e20fa9e4fd16b699d581ddac2956c120f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Sep 2017 10:04:02 -0700
-Subject: [PATCH 1/2] flatbuffers: Move EndianSwap template to
- flatbuffers/base.h
-
-Clang complains
-call to function 'EndianSwap' that is neither visible in the template definition nor found by argument-dependent lookup
-     return EndianSwap(t);
-
-This seems to be due to limitation of two-phase lookup of dependent names in template definitions
-
-Its not being found using associated namespaces therefore
-it has to be made visible at the template definition site as well
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- include/flatbuffers/base.h        | 33 +++++++++++++++++++++++++++++++++
- include/flatbuffers/flatbuffers.h | 32 --------------------------------
- 2 files changed, 33 insertions(+), 32 deletions(-)
-
-diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
-index f051755..c73fb2d 100644
---- a/include/flatbuffers/base.h
-+++ b/include/flatbuffers/base.h
-@@ -150,6 +150,39 @@ typedef uintmax_t largest_scalar_t;
- // We support aligning the contents of buffers up to this size.
- #define FLATBUFFERS_MAX_ALIGNMENT 16
- 
-+template<typename T> T EndianSwap(T t) {
-+  #if defined(_MSC_VER)
-+    #define FLATBUFFERS_BYTESWAP16 _byteswap_ushort
-+    #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
-+    #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
-+  #else
-+    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
-+      // __builtin_bswap16 was missing prior to GCC 4.8.
-+      #define FLATBUFFERS_BYTESWAP16(x) \
-+        static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
-+    #else
-+      #define FLATBUFFERS_BYTESWAP16 __builtin_bswap16
-+    #endif
-+    #define FLATBUFFERS_BYTESWAP32 __builtin_bswap32
-+    #define FLATBUFFERS_BYTESWAP64 __builtin_bswap64
-+  #endif
-+  if (sizeof(T) == 1) {   // Compile-time if-then's.
-+    return t;
-+  } else if (sizeof(T) == 2) {
-+    auto r = FLATBUFFERS_BYTESWAP16(*reinterpret_cast<uint16_t *>(&t));
-+    return *reinterpret_cast<T *>(&r);
-+  } else if (sizeof(T) == 4) {
-+    auto r = FLATBUFFERS_BYTESWAP32(*reinterpret_cast<uint32_t *>(&t));
-+    return *reinterpret_cast<T *>(&r);
-+  } else if (sizeof(T) == 8) {
-+    auto r = FLATBUFFERS_BYTESWAP64(*reinterpret_cast<uint64_t *>(&t));
-+    return *reinterpret_cast<T *>(&r);
-+  } else {
-+    assert(0);
-+  }
-+}
-+
-+
- template<typename T> T EndianScalar(T t) {
-   #if FLATBUFFERS_LITTLEENDIAN
-     return t;
-diff --git a/include/flatbuffers/flatbuffers.h b/include/flatbuffers/flatbuffers.h
-index 9216cf4..f749dcb 100644
---- a/include/flatbuffers/flatbuffers.h
-+++ b/include/flatbuffers/flatbuffers.h
-@@ -37,38 +37,6 @@ inline void EndianCheck() {
-   (void)endiantest;
- }
- 
--template<typename T> T EndianSwap(T t) {
--  #if defined(_MSC_VER)
--    #define FLATBUFFERS_BYTESWAP16 _byteswap_ushort
--    #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
--    #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
--  #else
--    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
--      // __builtin_bswap16 was missing prior to GCC 4.8.
--      #define FLATBUFFERS_BYTESWAP16(x) \
--        static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
--    #else
--      #define FLATBUFFERS_BYTESWAP16 __builtin_bswap16
--    #endif
--    #define FLATBUFFERS_BYTESWAP32 __builtin_bswap32
--    #define FLATBUFFERS_BYTESWAP64 __builtin_bswap64
--  #endif
--  if (sizeof(T) == 1) {   // Compile-time if-then's.
--    return t;
--  } else if (sizeof(T) == 2) {
--    auto r = FLATBUFFERS_BYTESWAP16(*reinterpret_cast<uint16_t *>(&t));
--    return *reinterpret_cast<T *>(&r);
--  } else if (sizeof(T) == 4) {
--    auto r = FLATBUFFERS_BYTESWAP32(*reinterpret_cast<uint32_t *>(&t));
--    return *reinterpret_cast<T *>(&r);
--  } else if (sizeof(T) == 8) {
--    auto r = FLATBUFFERS_BYTESWAP64(*reinterpret_cast<uint64_t *>(&t));
--    return *reinterpret_cast<T *>(&r);
--  } else {
--    assert(0);
--  }
--}
--
- template<typename T> FLATBUFFERS_CONSTEXPR size_t AlignOf() {
-   #ifdef _MSC_VER
-     return __alignof(T);
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch b/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch
deleted file mode 100644
index 460159f27..000000000
--- a/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 626fe5e043de25e970ebdf061b88c646fa689113 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Sep 2017 10:09:31 -0700
-Subject: [PATCH 2/2] use __builtin_bswap16 when building with clang
-
-clang pretends to be gcc 4.2.0 and therefore the code does
-not use __builtin_bswap16 but tries to synthesize it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
- include/flatbuffers/base.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
-index c73fb2d..13e8fac 100644
---- a/include/flatbuffers/base.h
-+++ b/include/flatbuffers/base.h
-@@ -156,7 +156,7 @@ template<typename T> T EndianSwap(T t) {
-     #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
-     #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
-   #else
--    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
-+    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408 && !defined(__clang__)
-       // __builtin_bswap16 was missing prior to GCC 4.8.
-       #define FLATBUFFERS_BYTESWAP16(x) \
-         static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.9.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
similarity index 61%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.9.0.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
index a8df44485..452e1e65a 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.9.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
@@ -10,22 +10,19 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
 
-SRCREV = "25a15950f5a24d7217689739ed8f6dac64912d62"
+SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
 
-SRC_URI = "git://github.com/google/flatbuffers.git \
-           file://0001-correct-version-for-so-lib.patch \
-           file://0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch \
-           file://0002-use-__builtin_bswap16-when-building-with-clang.patch \
-           "
+SRC_URI = "git://github.com/google/flatbuffers.git"
 
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11"
 BUILD_CXXFLAGS += "-std=c++11"
 
+# BUILD_TYPE=Release is required, otherwise flatc is not installed
 EXTRA_OECMAKE += "\
-    -DFLATBUFFERS_BUILD_TESTS=OFF \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DFLATBUFFERS_BUILD_TESTS=OFF \    
     -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
-    -DPV=${PV} \
 "
 
 inherit cmake
-- 
2.17.1


