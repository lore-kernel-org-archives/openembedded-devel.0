Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 066C871C54
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 04:14:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u18so988899pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YBNPVB2MBLsDcV3s1x4OzFsK30K3PHo3+I1/dzeljxc=;
	b=nkK6Sx1IzyiIHN8UH/SsQkjlc6GnF4XDf1jswteOGnjy0XkNHOcBOFtZ6GvfvTb1ON
	kcostUynAhASpCqEiiHJrB6hJ53OzIYnlLnorLbLtFwTsXlm0bJsG20zMX91Xc+FC00L
	0UKx6FREGj5V9cXSh4QENGu871Ca7FbzI/oyPmZI0gW/ymG1L2LFcwsG/qJAmBscUnK0
	7nnuyOusNJhMtOmnsXJJX8ihuqg3M/LWvV5C6Pa6B0w4RziNhqmy1nbXqvganS1vbUBz
	Dss16dvn2opuEj3+vZLEfquV0zwBP0A6kL09xRszOLhXqlsKimiKNGcl6VFs86/oKRqm
	OHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YBNPVB2MBLsDcV3s1x4OzFsK30K3PHo3+I1/dzeljxc=;
	b=dyqK4g4oUBf2Gkn6Oay9DDTcbuWiWFsprFxW1//abNKAxNzeG3UoQerMzeSb7sDTp1
	GL5WXtQyOkNGy8Grx56eo+MweQqO3gImjuUmv6xnWq9SyE8DA6lbzvTE3luhDlOEoSfi
	+HCsq35EWgd81GldIRW5RxRhHOP484V1xK2SDQZabZ8EKZs2IxAuCe3oXW46CUGcPx9X
	GuSj+WH5nJe3qfd1A6g+jvP8Cai0t+xZH6Kxk8UJ+ceTH22H3up/fdZvwei9V8tOVHTY
	hLAXdLShW9oGcHSYhkZ7eCAa/6bu+2Xv2BA/Vd2XwHwji7ZrMm8H7FArAHfi+huLkm4k
	mr0Q==
X-Gm-Message-State: AHPjjUgnvTo5l0VRUJNlBbQuwJLB7ewHlJxrolJ9+y/y6YTuyScqXYzs
	UJcBqSW2p4QTh2Pr2IbPa2saBQ==
X-Google-Smtp-Source: AOwi7QDuDgN+jEC6pBRewucJRp4sAWFPuvL5oeqyLkvE3GwlXPXzfGL48UKWEw/yKceSshquUzZvGw==
X-Received: by 10.98.236.150 with SMTP id e22mr820985pfm.203.1505880880907;
	Tue, 19 Sep 2017 21:14:40 -0700 (PDT)
Received: from localhost.localdomain (c-73-158-54-208.hsd1.ca.comcast.net.
	[73.158.54.208]) by smtp.gmail.com with ESMTPSA id
	w12sm5277628pfk.83.2017.09.19.21.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 21:14:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 21:14:27 -0700
Message-Id: <20170920041429.8047-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/3] flatbuffers: Fix build with clang on big-endian machines
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
X-List-Received-Date: Wed, 20 Sep 2017 04:14:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Move-EndianSwap-template-to-flatbuffers-.patch | 113 +++++++++++++++++++++
 ..._builtin_bswap16-when-building-with-clang.patch |  30 ++++++
 .../flatbuffers/flatbuffers_1.7.1.bb               |   6 +-
 3 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch

diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch b/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
new file mode 100644
index 000000000..d736f012b
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/files/0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch
@@ -0,0 +1,113 @@
+From a614d8e20fa9e4fd16b699d581ddac2956c120f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Sep 2017 10:04:02 -0700
+Subject: [PATCH 1/2] flatbuffers: Move EndianSwap template to
+ flatbuffers/base.h
+
+Clang complains
+call to function 'EndianSwap' that is neither visible in the template definition nor found by argument-dependent lookup
+     return EndianSwap(t);
+
+This seems to be due to limitation of two-phase lookup of dependent names in template definitions
+
+Its not being found using associated namespaces therefore
+it has to be made visible at the template definition site as well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ include/flatbuffers/base.h        | 33 +++++++++++++++++++++++++++++++++
+ include/flatbuffers/flatbuffers.h | 32 --------------------------------
+ 2 files changed, 33 insertions(+), 32 deletions(-)
+
+diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
+index f051755..c73fb2d 100644
+--- a/include/flatbuffers/base.h
++++ b/include/flatbuffers/base.h
+@@ -150,6 +150,39 @@ typedef uintmax_t largest_scalar_t;
+ // We support aligning the contents of buffers up to this size.
+ #define FLATBUFFERS_MAX_ALIGNMENT 16
+ 
++template<typename T> T EndianSwap(T t) {
++  #if defined(_MSC_VER)
++    #define FLATBUFFERS_BYTESWAP16 _byteswap_ushort
++    #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
++    #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
++  #else
++    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
++      // __builtin_bswap16 was missing prior to GCC 4.8.
++      #define FLATBUFFERS_BYTESWAP16(x) \
++        static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
++    #else
++      #define FLATBUFFERS_BYTESWAP16 __builtin_bswap16
++    #endif
++    #define FLATBUFFERS_BYTESWAP32 __builtin_bswap32
++    #define FLATBUFFERS_BYTESWAP64 __builtin_bswap64
++  #endif
++  if (sizeof(T) == 1) {   // Compile-time if-then's.
++    return t;
++  } else if (sizeof(T) == 2) {
++    auto r = FLATBUFFERS_BYTESWAP16(*reinterpret_cast<uint16_t *>(&t));
++    return *reinterpret_cast<T *>(&r);
++  } else if (sizeof(T) == 4) {
++    auto r = FLATBUFFERS_BYTESWAP32(*reinterpret_cast<uint32_t *>(&t));
++    return *reinterpret_cast<T *>(&r);
++  } else if (sizeof(T) == 8) {
++    auto r = FLATBUFFERS_BYTESWAP64(*reinterpret_cast<uint64_t *>(&t));
++    return *reinterpret_cast<T *>(&r);
++  } else {
++    assert(0);
++  }
++}
++
++
+ template<typename T> T EndianScalar(T t) {
+   #if FLATBUFFERS_LITTLEENDIAN
+     return t;
+diff --git a/include/flatbuffers/flatbuffers.h b/include/flatbuffers/flatbuffers.h
+index 9216cf4..f749dcb 100644
+--- a/include/flatbuffers/flatbuffers.h
++++ b/include/flatbuffers/flatbuffers.h
+@@ -37,38 +37,6 @@ inline void EndianCheck() {
+   (void)endiantest;
+ }
+ 
+-template<typename T> T EndianSwap(T t) {
+-  #if defined(_MSC_VER)
+-    #define FLATBUFFERS_BYTESWAP16 _byteswap_ushort
+-    #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
+-    #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
+-  #else
+-    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
+-      // __builtin_bswap16 was missing prior to GCC 4.8.
+-      #define FLATBUFFERS_BYTESWAP16(x) \
+-        static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
+-    #else
+-      #define FLATBUFFERS_BYTESWAP16 __builtin_bswap16
+-    #endif
+-    #define FLATBUFFERS_BYTESWAP32 __builtin_bswap32
+-    #define FLATBUFFERS_BYTESWAP64 __builtin_bswap64
+-  #endif
+-  if (sizeof(T) == 1) {   // Compile-time if-then's.
+-    return t;
+-  } else if (sizeof(T) == 2) {
+-    auto r = FLATBUFFERS_BYTESWAP16(*reinterpret_cast<uint16_t *>(&t));
+-    return *reinterpret_cast<T *>(&r);
+-  } else if (sizeof(T) == 4) {
+-    auto r = FLATBUFFERS_BYTESWAP32(*reinterpret_cast<uint32_t *>(&t));
+-    return *reinterpret_cast<T *>(&r);
+-  } else if (sizeof(T) == 8) {
+-    auto r = FLATBUFFERS_BYTESWAP64(*reinterpret_cast<uint64_t *>(&t));
+-    return *reinterpret_cast<T *>(&r);
+-  } else {
+-    assert(0);
+-  }
+-}
+-
+ template<typename T> FLATBUFFERS_CONSTEXPR size_t AlignOf() {
+   #ifdef _MSC_VER
+     return __alignof(T);
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch b/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch
new file mode 100644
index 000000000..460159f27
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/files/0002-use-__builtin_bswap16-when-building-with-clang.patch
@@ -0,0 +1,30 @@
+From 626fe5e043de25e970ebdf061b88c646fa689113 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Sep 2017 10:09:31 -0700
+Subject: [PATCH 2/2] use __builtin_bswap16 when building with clang
+
+clang pretends to be gcc 4.2.0 and therefore the code does
+not use __builtin_bswap16 but tries to synthesize it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+ include/flatbuffers/base.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/flatbuffers/base.h b/include/flatbuffers/base.h
+index c73fb2d..13e8fac 100644
+--- a/include/flatbuffers/base.h
++++ b/include/flatbuffers/base.h
+@@ -156,7 +156,7 @@ template<typename T> T EndianSwap(T t) {
+     #define FLATBUFFERS_BYTESWAP32 _byteswap_ulong
+     #define FLATBUFFERS_BYTESWAP64 _byteswap_uint64
+   #else
+-    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408
++    #if defined(__GNUC__) && __GNUC__ * 100 + __GNUC_MINOR__ < 408 && !defined(__clang__)
+       // __builtin_bswap16 was missing prior to GCC 4.8.
+       #define FLATBUFFERS_BYTESWAP16(x) \
+         static_cast<uint16_t>(__builtin_bswap32(static_cast<uint32_t>(x) << 16))
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
index be0bef21d..a8df44485 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
@@ -13,8 +13,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
 SRCREV = "25a15950f5a24d7217689739ed8f6dac64912d62"
 
 SRC_URI = "git://github.com/google/flatbuffers.git \
-    file://0001-correct-version-for-so-lib.patch \
-"
+           file://0001-correct-version-for-so-lib.patch \
+           file://0001-flatbuffers-Move-EndianSwap-template-to-flatbuffers-.patch \
+           file://0002-use-__builtin_bswap16-when-building-with-clang.patch \
+           "
 
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11"
-- 
2.14.1


