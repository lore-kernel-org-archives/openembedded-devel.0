Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A596FC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:30:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.15976.1702024204282061864
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=McOz8aYX;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c2718a768so18470625e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 00:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702024202; x=1702629002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITBsReXXhy6FMABzTtFmZ0LuSdSeQ+LdR2In4GpwFGw=;
        b=McOz8aYXkUdjd4EQIEAov3AnGldWWDu+p89Ba1K1FnnsdcosEetBqAT5HLpP6XGQ2q
         Yu5a4tvi4kQGCY9hGE3Te+I+G7phaDKg4a1QscU2rFUwRhnYUByE6x3psBvjk6owKxQF
         H676vb6nCJssKK5lFoImDiPBqYsXvAUoUJ2rUcvgqkmKcQct9KjCXaoWr3MiPmFgABAS
         yPE8EM9+qWi0ThHJ/Q5nsa51yAyy8ZwN06Ao3/3M8xmejZi6sL79y772cwP9Q1pDIQqO
         yJI9Q7TDG4aZZqOF1b80ZcAjY9QzhXtqDUOEWOdjX1braEaH2tbFpQoWK9WiE4sVFsqf
         Pe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702024202; x=1702629002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITBsReXXhy6FMABzTtFmZ0LuSdSeQ+LdR2In4GpwFGw=;
        b=TX7ytFYpv89drSMtHRUAg+897dZ/N2/t4Glxk5uUkDhZ/cSHs/AWEQaQZnztnSUa8j
         8+seO21iX7Um8ckF5Cmgm11uJcdN2qnNt16HdlVcqMAhCBxBLNA3q4el8tA7FgiWQ246
         vyT2Q2rCzwRGqr1blVFNyqUAIthiOSjlguo6CEr3bVxNP0QVkIur6ZLMBi4+ygS/lr+E
         aVJnGaY7DRLxby8T45V3ldHBhLd7TuACNqHOn3uMxYDezeYLhlzZPoWfJMW4Tb/Kq3V+
         Qa+7QK7j465IRdFRKrujkOto9v4ECJTJ0GJ73Z0A3umcvVFx11p6io01ITrjQBtltCcq
         ufcg==
X-Gm-Message-State: AOJu0Yz3eM7rk3sbBD4aWPbT6dJMvxEOsFrFCz1p5j7phGMpThh40jjS
	ONbO3E4mExNeTuzx3BlgxJIuC472oMaQ3Q==
X-Google-Smtp-Source: AGHT+IFw25udYO4E+Hf4HhCSQKjqwBYvxyiehPd6XY1ALggZn0qC5wWaGeAQ9O+Pi2A4TeAet/mAjg==
X-Received: by 2002:a05:600c:458b:b0:40b:5e22:962 with SMTP id r11-20020a05600c458b00b0040b5e220962mr2559769wmo.81.1702024201983;
        Fri, 08 Dec 2023 00:30:01 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id az27-20020a05600c601b00b0040c34e763ecsm732208wmb.44.2023.12.08.00.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 00:30:01 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] snappy: upgrade 1.1.9 -> 1.1.10
Date: Fri,  8 Dec 2023 11:29:52 +0300
Message-Id: <20231208082952.248187-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 08:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107304

* 0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch removed because fixed in the new version
* Added fix-build-on-32bit-arm.patch to fix arm build

Changelog:

* Performance improvements
* Compilation fixes for various environments

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch | 71 -------------------
 .../snappy/fix-build-on-32bit-arm.patch       | 33 +++++++++
 .../{snappy_1.1.9.bb => snappy_1.1.10.bb}     |  8 +--
 3 files changed, 37 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
 create mode 100644 meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
 rename meta-oe/recipes-extended/snappy/{snappy_1.1.9.bb => snappy_1.1.10.bb} (86%)

diff --git a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch b/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
deleted file mode 100644
index 27357d88a..000000000
--- a/meta-oe/recipes-extended/snappy/snappy/0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 4728803cc8687431449c8c9fbfabb1da04943400 Mon Sep 17 00:00:00 2001
-From: "Georgi D. Sotirov" <gdsotirov@gmail.com>
-Date: Wed, 5 May 2021 14:16:46 +0300
-Subject: [PATCH] Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-
-Add inline with SNAPPY_ATTRIBUTE_ALWAYS_INLINE on AdvanceToNextTag to
-fix the following compilation errors and a warning with GCC:
-
-[  2%] Building CXX object CMakeFiles/snappy.dir/snappy.cc.o
-/usr/bin/c++   -DHAVE_CONFIG_H -Dsnappy_EXPORTS
--I/tmp/snappy-1.1.9/build -I/tmp/snappy-1.1.9  -O3
--march=i586 -mtune=i686 -Wall -Wextra -fno-exceptions -fno-rtti -O3
--DNDEBUG -fPIC   -std=c++11 -o CMakeFiles/snappy.dir/snappy.cc.o -c
-/tmp/snappy-1.1.9/snappy.cc
-/tmp/snappy-1.1.9/snappy.cc:1017:8: warning: always_inline
-function might not be inlinable [-Wattributes]
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc: In function 'std::pair<const
-unsigned char*, int> snappy::DecompressBranchless(const uint8_t*, const
-uint8_t*, ptrdiff_t, T, ptrdiff_t) [with T = char*; uint8_t = unsigned
-char; ptrdiff_t = int]':
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-/tmp/snappy-1.1.9/snappy.cc:1017:8: error: inlining failed in
-call to always_inline 'size_t snappy::AdvanceToNextTag(const uint8_t**,
-size_t*)': function body can be overwritten at link time
- size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-        ^
-/tmp/snappy-1.1.9/snappy.cc:1097:53: error: called from here
-         size_t tag_type = AdvanceToNextTag(&ip, &tag);
-                                                     ^
-CMakeFiles/snappy.dir/build.make:137: recipe for target
-'CMakeFiles/snappy.dir/snappy.cc.o' failed
-
-Just like with other functions using SNAPPY_ATTRIBUTE_ALWAYS_INLINE
-macro (i.e. __attribute__((always_inline)) ) it is necessary to use C++
-inline specifier.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/google/snappy/pull/128]
----
- snappy.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/snappy.cc b/snappy.cc
-index 79dc0e8..51157be 100644
---- a/snappy.cc
-+++ b/snappy.cc
-@@ -1014,7 +1014,7 @@ void MemMove(ptrdiff_t dst, const void* src, size_t size) {
- }
- 
- SNAPPY_ATTRIBUTE_ALWAYS_INLINE
--size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-+inline size_t AdvanceToNextTag(const uint8_t** ip_p, size_t* tag) {
-   const uint8_t*& ip = *ip_p;
-   // This section is crucial for the throughput of the decompression loop.
-   // The latency of an iteration is fundamentally constrained by the
diff --git a/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch b/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
new file mode 100644
index 000000000..b6ab149e1
--- /dev/null
+++ b/meta-oe/recipes-extended/snappy/snappy/fix-build-on-32bit-arm.patch
@@ -0,0 +1,33 @@
+From ecb3bcc283ce740a34d6342cbcda569f3193ade9 Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Mon, 1 May 2023 11:14:32 -0400
+Subject: [PATCH] Specifically check for NEON for ARMv8 CPUs.
+
+The actual NEON implementation uses instructions that are not
+supported on 32-bit CPUs.  Make the CMake test reflect this so that
+ARMv7 builds succeed again.
+
+Upstream-Status: Submitted [https://github.com/google/snappy/pull/169]
+
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 85afe58e..e8775859 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -207,9 +207,9 @@ int main() {
+ check_cxx_source_compiles("
+ #include <arm_neon.h>
+ int main() {
+-  uint8_t val = 3, dup[8];
++  uint8_t val = 3;
+   uint8x16_t v = vld1q_dup_u8(&val);
+-  vst1q_u8(dup, v);
++  val = vmaxvq_u8(v);
+   return 0;
+ }" SNAPPY_HAVE_NEON)
+ 
diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
similarity index 86%
rename from meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
index 9e0e43ce8..bc3bc3aa4 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.10.bb
@@ -11,11 +11,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
 SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main \
-    file://0001-Add-inline-with-SNAPPY_ATTRIBUTE_ALWAYS_INLINE.patch \
-"
-SRCREV = "2b63814b15a2aaae54b7943f0cd935892fae628f"
-S = "${WORKDIR}/git"
+	   file://fix-build-on-32bit-arm.patch"
+
+SRCREV = "dc05e026488865bc69313a68bcc03ef2e4ea8e83"
 
+S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-- 
2.25.1


