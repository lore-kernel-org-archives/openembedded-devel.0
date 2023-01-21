Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69955C38159
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2130.1674324096164790802
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W7cyLWI/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id k18so7977116pll.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzXIIBH41TLotM9db06XUxGEnJHqBuLUJsznNUToQu0=;
        b=W7cyLWI/eAwnKtLGATbMWWFoGwC9QaxH0/EvMXddgygYQVG9/5mbn7hICR5tH6c+is
         SBCQrKLc/bEsxA0F1CKk5rx91mQvxETB+2BOfAptKwTdwuWHa6iSBFB1hDXra3sCOXs+
         6Do6ldtqJOh/BKxTVqT2axDVXTjJPKU/iEbuowyoHcuWj6ehIismtkflm9F5ZemCt75I
         NBQ5Z6BcDELgvRLd9KyHEI73we8rcKYZg+DoTlITYtZ5Qv3wr83MsrHGBsZBRlPi8GxY
         ai/fMLOt3qqnqmCw2ay6oTXucA/8x0zvgm7vRdA5q/yZ5pWoQGAiIE0oCz2lCEkRhYcb
         OadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzXIIBH41TLotM9db06XUxGEnJHqBuLUJsznNUToQu0=;
        b=To3uXar7AZcCbLx24CzeDHRZtiIV/kE90qbMpW4GvNUF4KPvzY96ZimeBXwFLL69jn
         ta7wdeSugH+uYABKxJKjvWDlvjaAnLtmDdF2/W79ZNk1Nl/wX6S57zTdAxPaMeYsBUUC
         dtMFSNlhPBtQ0jelpEa14u2MPxFUxEm5y46cQoaL5jEGOTYDq2J6s8yuIpE+NZypJJrl
         67QSFQLa4/K828C9T14G+V8V18h3lQXM/6MLB0FuMvuwzIyewE0Ue8isrAwoHSaJ1eNS
         iL1zai6nhdboUQtVgZqWA17d4ehw3PGc4piW5xg4yqRT7I4woGz4m86MhNuhoz468YIj
         9WBQ==
X-Gm-Message-State: AFqh2kr8mqhtkcJC87NQjbHVV0sr5qyNIQkPMpMyKwcjyVsGNpJdoZ6K
	n55xVgQP6v4SQE+5vt60pGGw51IQ+BMh7w==
X-Google-Smtp-Source: AMrXdXsZyqkYcoOcgEH9jagFercJFCjMkeZCrM+O7BAi/3cHNeMeIT2pOcPzXomDk/qpmNy9MhHcgg==
X-Received: by 2002:a17:90a:898b:b0:225:c2b4:5742 with SMTP id v11-20020a17090a898b00b00225c2b45742mr44464808pjn.34.1674324104257;
        Sat, 21 Jan 2023 10:01:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 25/30] exiv2: Upgrade to 0.27.6
Date: Sat, 21 Jan 2023 10:01:16 -0800
Message-Id: <20230121180121.1229895-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100692

Drop backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-protection-only-if-compiler-arch-su.patch |  40 ------
 .../exiv2/exiv2/CVE-2021-29457.patch          |  26 ----
 .../exiv2/exiv2/CVE-2021-29458.patch          |  37 ------
 .../exiv2/exiv2/CVE-2021-29463.patch          | 120 ------------------
 .../exiv2/exiv2/CVE-2021-29464.patch          |  72 -----------
 .../exiv2/exiv2/CVE-2021-29470.patch          |  32 -----
 .../exiv2/exiv2/CVE-2021-29473.patch          |  21 ---
 .../exiv2/exiv2/CVE-2021-3482.patch           |  54 --------
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  30 -----
 meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb |  19 +++
 10 files changed, 19 insertions(+), 432 deletions(-)
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
deleted file mode 100644
index 96146a1957..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 04d5f4805a86302a0e135a28d58a6c1ff6a68d52 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Thu, 30 Jul 2020 23:03:51 +0200
-Subject: [PATCH] Use compiler -fcf-protection only if compiler/arch supports
- it
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-There have been some PRs they were either rejected or some general suggestion
-for more flags suggested. So
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- cmake/compilerFlags.cmake | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
-index 12caf42..455525e 100644
---- a/cmake/compilerFlags.cmake
-+++ b/cmake/compilerFlags.cmake
-@@ -26,7 +26,12 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
-         # This fails under Fedora, MinGW GCC 8.3.0 and CYGWIN/MSYS 9.3.0
-         if (NOT (MINGW OR CMAKE_HOST_SOLARIS OR CYGWIN OR MSYS) )
-             if (COMPILER_IS_GCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
--                add_compile_options(-fstack-clash-protection -fcf-protection)
-+                # Gcc does support -fcf-protection on few arches only
-+                CHECK_CXX_COMPILER_FLAG(-fcf-protection COMPILER_SUPPORTS_FCF_PROTECTION)
-+                if (COMPILER_SUPPORTS_FCF_PROTECTION)
-+                    add_compile_options(-fcf-protection)
-+                endif()
-+                add_compile_options(-fstack-clash-protection)
-             endif()
- 
-             if( (COMPILER_IS_GCC   AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0) # Not in GCC 4.8
--- 
-2.21.3
-
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
deleted file mode 100644
index e5d069487c..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 13e5a3e02339b746abcaee6408893ca2fd8e289d Mon Sep 17 00:00:00 2001
-From: Pydera <pydera@mailbox.org>
-Date: Thu, 8 Apr 2021 17:36:16 +0200
-Subject: [PATCH] Fix out of buffer access in #1529
-
----
- src/jp2image.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index 88ab9b2d6..12025f966 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -776,9 +776,10 @@ static void boxes_check(size_t b,size_t m)
- #endif
-                 box.length = (uint32_t) (io_->size() - io_->tell() + 8);
-             }
--            if (box.length == 1)
-+            if (box.length < 8)
-             {
--                // FIXME. Special case. the real box size is given in another place.
-+                // box is broken, so there is nothing we can do here
-+                throw Error(kerCorruptedMetadata);
-             }
- 
-             // Read whole box : Box header + Box data (not fixed size - can be null).
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
deleted file mode 100644
index 285f6fe4ce..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29458.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9b7a19f957af53304655ed1efe32253a1b11a8d0 Mon Sep 17 00:00:00 2001
-From: Kevin Backhouse <kevinbackhouse@github.com>
-Date: Fri, 9 Apr 2021 13:37:48 +0100
-Subject: [PATCH] Fix integer overflow.
----
- src/crwimage_int.cpp | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
-index aefaf22..2e3e507 100644
---- a/src/crwimage_int.cpp
-+++ b/src/crwimage_int.cpp
-@@ -559,7 +559,7 @@ namespace Exiv2 {
-     void CiffComponent::setValue(DataBuf buf)
-     {
-         if (isAllocated_) {
--            delete pData_;
-+            delete[] pData_;
-             pData_ = 0;
-             size_ = 0;
-         }
-@@ -1167,7 +1167,11 @@ namespace Exiv2 {
-                                                  pCrwMapping->crwDir_);
-         if (edX != edEnd || edY != edEnd || edO != edEnd) {
-             uint32_t size = 28;
--            if (cc && cc->size() > size) size = cc->size();
-+            if (cc) {
-+              if (cc->size() < size)
-+                throw Error(kerCorruptedMetadata);
-+              size = cc->size();
-+            }
-             DataBuf buf(size);
-             std::memset(buf.pData_, 0x0, buf.size_);
-             if (cc) std::memcpy(buf.pData_ + 8, cc->pData() + 8, cc->size() - 8);
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
deleted file mode 100644
index 5ab64a7d3e..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b04d4b Mon Sep 17 00:00:00 2001
-From: Kevin Backhouse <kevinbackhouse@github.com>
-Date: Mon, 19 Apr 2021 18:06:00 +0100
-Subject: [PATCH] Improve bound checking in WebPImage::doWriteMetadata()
-
----
- src/webpimage.cpp | 41 ++++++++++++++++++++++++++++++-----------
- 1 file changed, 30 insertions(+), 11 deletions(-)
-
-diff --git a/src/webpimage.cpp b/src/webpimage.cpp
-index 4ddec544c..fee110bca 100644
---- a/src/webpimage.cpp
-+++ b/src/webpimage.cpp
-@@ -145,7 +145,7 @@ namespace Exiv2 {
-         DataBuf chunkId(WEBP_TAG_SIZE+1);
-         chunkId.pData_ [WEBP_TAG_SIZE] = '\0';
- 
--        io_->read(data, WEBP_TAG_SIZE * 3);
-+        readOrThrow(*io_, data, WEBP_TAG_SIZE * 3, Exiv2::kerCorruptedMetadata);
-         uint64_t filesize = Exiv2::getULong(data + WEBP_TAG_SIZE, littleEndian);
- 
-         /* Set up header */
-@@ -185,13 +185,20 @@ namespace Exiv2 {
-          case we have any exif or xmp data, also check
-          for any chunks with alpha frame/layer set */
-         while ( !io_->eof() && (uint64_t) io_->tell() < filesize) {
--            io_->read(chunkId.pData_, WEBP_TAG_SIZE);
--            io_->read(size_buff, WEBP_TAG_SIZE);
--            long size = Exiv2::getULong(size_buff, littleEndian);
-+            readOrThrow(*io_, chunkId.pData_, WEBP_TAG_SIZE, Exiv2::kerCorruptedMetadata);
-+            readOrThrow(*io_, size_buff, WEBP_TAG_SIZE, Exiv2::kerCorruptedMetadata);
-+            const uint32_t size_u32 = Exiv2::getULong(size_buff, littleEndian);
-+
-+            // Check that `size_u32` is safe to cast to `long`.
-+            enforce(size_u32 <= static_cast<size_t>(std::numeric_limits<unsigned int>::max()),
-+                    Exiv2::kerCorruptedMetadata);
-+            const long size = static_cast<long>(size_u32);
-             DataBuf payload(size);
--            io_->read(payload.pData_, payload.size_);
--            byte c;
--            if ( payload.size_ % 2 ) io_->read(&c,1);
-+            readOrThrow(*io_, payload.pData_, payload.size_, Exiv2::kerCorruptedMetadata);
-+            if ( payload.size_ % 2 ) {
-+              byte c;
-+              readOrThrow(*io_, &c, 1, Exiv2::kerCorruptedMetadata);
-+            }
- 
-             /* Chunk with information about features
-              used in the file. */
-@@ -199,6 +206,7 @@ namespace Exiv2 {
-                 has_vp8x = true;
-             }
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8X) && !has_size) {
-+                enforce(size >= 10, Exiv2::kerCorruptedMetadata);
-                 has_size = true;
-                 byte size_buf[WEBP_TAG_SIZE];
- 
-@@ -227,6 +235,7 @@ namespace Exiv2 {
-             }
- #endif
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8) && !has_size) {
-+                enforce(size >= 10, Exiv2::kerCorruptedMetadata);
-                 has_size = true;
-                 byte size_buf[2];
- 
-@@ -244,11 +253,13 @@ namespace Exiv2 {
- 
-             /* Chunk with with lossless image data. */
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8L) && !has_alpha) {
-+                enforce(size >= 5, Exiv2::kerCorruptedMetadata);
-                 if ((payload.pData_[4] & WEBP_VP8X_ALPHA_BIT) == WEBP_VP8X_ALPHA_BIT) {
-                     has_alpha = true;
-                 }
-             }
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8L) && !has_size) {
-+                enforce(size >= 5, Exiv2::kerCorruptedMetadata);
-                 has_size = true;
-                 byte size_buf_w[2];
-                 byte size_buf_h[3];
-@@ -276,11 +287,13 @@ namespace Exiv2 {
- 
-             /* Chunk with animation frame. */
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_ANMF) && !has_alpha) {
-+                enforce(size >= 6, Exiv2::kerCorruptedMetadata);
-                 if ((payload.pData_[5] & 0x2) == 0x2) {
-                     has_alpha = true;
-                 }
-             }
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_ANMF) && !has_size) {
-+                enforce(size >= 12, Exiv2::kerCorruptedMetadata);
-                 has_size = true;
-                 byte size_buf[WEBP_TAG_SIZE];
- 
-@@ -309,16 +322,22 @@ namespace Exiv2 {
- 
-         io_->seek(12, BasicIo::beg);
-         while ( !io_->eof() && (uint64_t) io_->tell() < filesize) {
--            io_->read(chunkId.pData_, 4);
--            io_->read(size_buff, 4);
-+            readOrThrow(*io_, chunkId.pData_, 4, Exiv2::kerCorruptedMetadata);
-+            readOrThrow(*io_, size_buff, 4, Exiv2::kerCorruptedMetadata);
-+
-+            const uint32_t size_u32 = Exiv2::getULong(size_buff, littleEndian);
- 
--            long size = Exiv2::getULong(size_buff, littleEndian);
-+            // Check that `size_u32` is safe to cast to `long`.
-+            enforce(size_u32 <= static_cast<size_t>(std::numeric_limits<unsigned int>::max()),
-+                    Exiv2::kerCorruptedMetadata);
-+            const long size = static_cast<long>(size_u32);
- 
-             DataBuf payload(size);
--            io_->read(payload.pData_, size);
-+            readOrThrow(*io_, payload.pData_, size, Exiv2::kerCorruptedMetadata);
-             if ( io_->tell() % 2 ) io_->seek(+1,BasicIo::cur); // skip pad
- 
-             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8X)) {
-+                enforce(size >= 1, Exiv2::kerCorruptedMetadata);
-                 if (has_icc){
-                     payload.pData_[0] |= WEBP_VP8X_ICC_BIT;
-                 } else {
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
deleted file mode 100644
index f0c482450c..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 61734d8842cb9cc59437463e3bac54d6231d9487 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Tue, 18 May 2021 10:52:54 +0900
-Subject: [PATCH] modify
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/jp2image.cpp | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index 52723a4..0ac4f50 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -643,11 +643,11 @@ static void boxes_check(size_t b,size_t m)
-     void Jp2Image::encodeJp2Header(const DataBuf& boxBuf,DataBuf& outBuf)
-     {
-         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
--        int     outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
--        int      inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
-+        long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
-+        long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
-         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
--        int32_t       length = getLong((byte*)&pBox->length, bigEndian);
--        int32_t       count  = sizeof (Jp2BoxHeader);
-+        uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
-+        uint32_t      count  = sizeof (Jp2BoxHeader);
-         char*         p      = (char*) boxBuf.pData_;
-         bool          bWroteColor = false ;
- 
-@@ -664,6 +664,7 @@ static void boxes_check(size_t b,size_t m)
- #ifdef EXIV2_DEBUG_MESSAGES
-                 std::cout << "Jp2Image::encodeJp2Header subbox: "<< toAscii(subBox.type) << " length = " << subBox.length << std::endl;
- #endif
-+                enforce(subBox.length <= length - count, Exiv2::kerCorruptedMetadata);
-                 count        += subBox.length;
-                 newBox.type   = subBox.type;
-             } else {
-@@ -672,12 +673,13 @@ static void boxes_check(size_t b,size_t m)
-                 count = length;
-             }
- 
--            int32_t newlen = subBox.length;
-+            uint32_t newlen = subBox.length;
-             if ( newBox.type == kJp2BoxTypeColorHeader ) {
-                 bWroteColor = true ;
-                 if ( ! iccProfileDefined() ) {
-                     const char* pad   = "\x01\x00\x00\x00\x00\x00\x10\x00\x00\x05\x1cuuid";
-                     uint32_t    psize = 15;
-+                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
-                     ul2Data((byte*)&newBox.length,psize      ,bigEndian);
-                     ul2Data((byte*)&newBox.type  ,newBox.type,bigEndian);
-                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox));
-@@ -686,6 +688,7 @@ static void boxes_check(size_t b,size_t m)
-                 } else {
-                     const char* pad   = "\0x02\x00\x00";
-                     uint32_t    psize = 3;
-+                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
-                     ul2Data((byte*)&newBox.length,psize+iccProfile_.size_,bigEndian);
-                     ul2Data((byte*)&newBox.type,newBox.type,bigEndian);
-                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox)  );
-@@ -694,6 +697,7 @@ static void boxes_check(size_t b,size_t m)
-                     newlen = psize + iccProfile_.size_;
-                 }
-             } else {
-+                enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
-                 ::memcpy(output.pData_+outlen,boxBuf.pData_+inlen,subBox.length);
-             }
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
deleted file mode 100644
index eedf9d79aa..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6628a69c036df2aa036290e6cd71767c159c79ed Mon Sep 17 00:00:00 2001
-From: Kevin Backhouse <kevinbackhouse@github.com>
-Date: Wed, 21 Apr 2021 12:06:04 +0100
-Subject: [PATCH] Add more bounds checks in Jp2Image::encodeJp2Header
----
- src/jp2image.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index b424225..349a9f0 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -645,13 +645,16 @@ static void boxes_check(size_t b,size_t m)
-         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
-         long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
-         long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
-+        enforce(sizeof(Jp2BoxHeader) <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
-         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
-         uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
-+        enforce(length <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
-         uint32_t      count  = sizeof (Jp2BoxHeader);
-         char*         p      = (char*) boxBuf.pData_;
-         bool          bWroteColor = false ;
- 
-         while ( count < length || !bWroteColor ) {
-+            enforce(sizeof(Jp2BoxHeader) <= length - count, Exiv2::kerCorruptedMetadata);
-             Jp2BoxHeader* pSubBox = (Jp2BoxHeader*) (p+count) ;
- 
-             // copy data.  pointer could be into a memory mapped file which we will decode!
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
deleted file mode 100644
index 4afedf8e59..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From e6a0982f7cd9282052b6e3485a458d60629ffa0b Mon Sep 17 00:00:00 2001
-From: Kevin Backhouse <kevinbackhouse@github.com>
-Date: Fri, 23 Apr 2021 11:44:44 +0100
-Subject: [PATCH] Add bounds check in Jp2Image::doWriteMetadata().
-
----
- src/jp2image.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index 1694fed27..ca8c9ddbb 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -908,6 +908,7 @@ static void boxes_check(size_t b,size_t m)
- 
-                 case kJp2BoxTypeUuid:
-                 {
-+                    enforce(boxBuf.size_ >= 24, Exiv2::kerCorruptedMetadata);
-                     if(memcmp(boxBuf.pData_ + 8, kJp2UuidExif, 16) == 0)
-                     {
- #ifdef EXIV2_DEBUG_MESSAGES
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
deleted file mode 100644
index e7c5e1b656..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 22ea582c6b74ada30bec3a6b15de3c3e52f2b4da Mon Sep 17 00:00:00 2001
-From: Robin Mills <robin@clanmills.com>
-Date: Mon, 5 Apr 2021 20:33:25 +0100
-Subject: [PATCH] fix_1522_jp2image_exif_asan
-
----
- src/jp2image.cpp | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/jp2image.cpp b/src/jp2image.cpp
-index eb31cea4a..88ab9b2d6 100644
---- a/src/jp2image.cpp
-+++ b/src/jp2image.cpp
-@@ -28,6 +28,7 @@
- #include "image.hpp"
- #include "image_int.hpp"
- #include "basicio.hpp"
-+#include "enforce.hpp"
- #include "error.hpp"
- #include "futils.hpp"
- #include "types.hpp"
-@@ -353,7 +354,7 @@ static void boxes_check(size_t b,size_t m)
-                             if (io_->error()) throw Error(kerFailedToReadImageData);
-                             if (bufRead != rawData.size_) throw Error(kerInputDataReadFailed);
- 
--                            if (rawData.size_ > 0)
-+                            if (rawData.size_ > 8) // "II*\0long"
-                             {
-                                 // Find the position of Exif header in bytes array.
-                                 long pos = (     (rawData.pData_[0]      == rawData.pData_[1])
-@@ -497,6 +498,7 @@ static void boxes_check(size_t b,size_t m)
-                 position   = io_->tell();
-                 box.length = getLong((byte*)&box.length, bigEndian);
-                 box.type = getLong((byte*)&box.type, bigEndian);
-+                enforce(box.length <= io_->size()-io_->tell() , Exiv2::kerCorruptedMetadata);
- 
-                 if (bPrint) {
-                     out << Internal::stringFormat("%8ld | %8ld | ", (size_t)(position - sizeof(box)),
-@@ -581,12 +583,13 @@ static void boxes_check(size_t b,size_t m)
-                                 throw Error(kerInputDataReadFailed);
- 
-                             if (bPrint) {
--                                out << Internal::binaryToString(makeSlice(rawData, 0, 40));
-+                                out << Internal::binaryToString(
-+                                        makeSlice(rawData, 0, rawData.size_>40?40:rawData.size_));
-                                 out.flush();
-                             }
-                             lf(out, bLF);
- 
--                            if (bIsExif && bRecursive && rawData.size_ > 0) {
-+                            if (bIsExif && bRecursive && rawData.size_ > 8) { // "II*\0long"
-                                 if ((rawData.pData_[0] == rawData.pData_[1]) &&
-                                     (rawData.pData_[0] == 'I' || rawData.pData_[0] == 'M')) {
-                                     BasicIo::AutoPtr p = BasicIo::AutoPtr(new MemIo(rawData.pData_, rawData.size_));
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
deleted file mode 100644
index 1380638ba7..0000000000
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
-
-DEPENDS = "zlib expat"
-
-SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
-SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
-
-# Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
-inherit dos2unix
-SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
-            file://CVE-2021-29457.patch \
-            file://CVE-2021-29458.patch \
-            file://CVE-2021-29463.patch \
-            file://CVE-2021-29464.patch \
-            file://CVE-2021-29470.patch \
-            file://CVE-2021-29473.patch \
-            file://CVE-2021-3482.patch"
-
-S = "${WORKDIR}/${BPN}-${PV}-Source"
-
-inherit cmake gettext
-
-do_install:append:class-target() {
-    # reproducibility: remove build host path
-    sed -i ${D}${libdir}/cmake/exiv2/exiv2Config.cmake \
-        -e 's:${STAGING_DIR_HOST}::g'
-}
-
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb
new file mode 100644
index 0000000000..6ccd9fb266
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = "zlib expat"
+
+SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
+SRC_URI[sha256sum] = "4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6"
+# Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
+# inherit dos2unix
+S = "${WORKDIR}/${BP}-Source"
+
+inherit cmake gettext
+
+do_install:append:class-target() {
+    # reproducibility: remove build host path
+    sed -i ${D}${libdir}/cmake/exiv2/exiv2Config.cmake \
+        -e 's:${STAGING_DIR_HOST}::g'
+}
-- 
2.39.1


