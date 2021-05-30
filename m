Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.34929.1622399676766562616
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RIFhthfW;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id t9so2934389pgn.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wvQwfR3CA9oe6gqiFyq7cVBBVbxr9OBsiA7bkXKMsIc=;
        b=RIFhthfW4MmaQlkAxR/WdoaH2IsYCLjoNxdrgYPmLR0VFZYq28notcwDMsGi/Fux2i
         QOsmTfLAuVFMBc1GcPDYU8uTT6gnXWLs9wGrPdnG7vtKXPXUJqUvfTvZPdN1Dzet2zay
         VzgkuSN/12gf+DvrXmZ1QOHAafl9z3v4cqYsiohmK4Vtniy01FSG3MJKeZXKbKLuQnDy
         QzcVosdqXp0tSgBsKfN2x6AOehzsZx7+JDyHJq1zGH88HNXdMHichqjRMD9FuBGuhFcg
         809aqNDRRkf/KAZCfRKJ1UfKbcY7btRLaUP4gRT5e4Qtk1W4x3DrjWZ3MXzChloVQ3xQ
         kwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wvQwfR3CA9oe6gqiFyq7cVBBVbxr9OBsiA7bkXKMsIc=;
        b=hLNyOogwRSWeStVamA3h+7n9mU1kSnBR4kpdvXyZ2qm5e2rY+BaNx/IiF6fiQbEJBR
         Ot3Dhxy55L/Wq0etvM7er0lvNR0VJu52QjHyL5oSPwtkSF4BKxaCyUg/gXcumsVGU/7l
         8AcwTyydu9mECc9NUvLq655+fHrNDI21J9451O7PJvMT1jarXi90BkzfvzCLyQK+DOns
         b4Rjs3e5Vz3mgcpjOrmjYY61LUaE4Frr9h3FEqpWQDDRiKH6NKunNbIp2xGdiBVmi17K
         C/0i22PbluX8qxinUn/mWz0DuhnWyj/VqOz4AWDkriNnFbU3zBf/UOOb66FI9g8I02hm
         qYgQ==
X-Gm-Message-State: AOAM531D/8Y+01LKrFxl3WWm1ZmdE3BEXlALXKmF13HXu/XWC2wPPuKa
	e2usz/YRlYLANVu00WYxVZf7L5GYsBjNUA==
X-Google-Smtp-Source: ABdhPJxS03/NcwA2RvVqp3EL8rSRsXNKx2UVm2ZCufea8rdOxqiqWTTHbPnFDDNd7KgoAln36ixNsg==
X-Received: by 2002:a63:ae01:: with SMTP id q1mr18619770pgf.216.1622399676045;
        Sun, 30 May 2021 11:34:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/12] exiv2: Fix CVE-2021-29463
Date: Sun, 30 May 2021 11:34:13 -0700
Message-Id: <f38ed30c08e5d5b2ef6c6cc9bce2304506dddc83.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29463

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b04d4b]
      CVE: CVE-2021-29463

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8e63ac6c86852a12408c2415be073c71420758ff)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29463.patch          | 120 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   3 +-
 2 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
new file mode 100644
index 0000000000..5ab64a7d3e
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
@@ -0,0 +1,120 @@
+From 783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b04d4b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Mon, 19 Apr 2021 18:06:00 +0100
+Subject: [PATCH] Improve bound checking in WebPImage::doWriteMetadata()
+
+---
+ src/webpimage.cpp | 41 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
+
+diff --git a/src/webpimage.cpp b/src/webpimage.cpp
+index 4ddec544c..fee110bca 100644
+--- a/src/webpimage.cpp
++++ b/src/webpimage.cpp
+@@ -145,7 +145,7 @@ namespace Exiv2 {
+         DataBuf chunkId(WEBP_TAG_SIZE+1);
+         chunkId.pData_ [WEBP_TAG_SIZE] = '\0';
+ 
+-        io_->read(data, WEBP_TAG_SIZE * 3);
++        readOrThrow(*io_, data, WEBP_TAG_SIZE * 3, Exiv2::kerCorruptedMetadata);
+         uint64_t filesize = Exiv2::getULong(data + WEBP_TAG_SIZE, littleEndian);
+ 
+         /* Set up header */
+@@ -185,13 +185,20 @@ namespace Exiv2 {
+          case we have any exif or xmp data, also check
+          for any chunks with alpha frame/layer set */
+         while ( !io_->eof() && (uint64_t) io_->tell() < filesize) {
+-            io_->read(chunkId.pData_, WEBP_TAG_SIZE);
+-            io_->read(size_buff, WEBP_TAG_SIZE);
+-            long size = Exiv2::getULong(size_buff, littleEndian);
++            readOrThrow(*io_, chunkId.pData_, WEBP_TAG_SIZE, Exiv2::kerCorruptedMetadata);
++            readOrThrow(*io_, size_buff, WEBP_TAG_SIZE, Exiv2::kerCorruptedMetadata);
++            const uint32_t size_u32 = Exiv2::getULong(size_buff, littleEndian);
++
++            // Check that `size_u32` is safe to cast to `long`.
++            enforce(size_u32 <= static_cast<size_t>(std::numeric_limits<unsigned int>::max()),
++                    Exiv2::kerCorruptedMetadata);
++            const long size = static_cast<long>(size_u32);
+             DataBuf payload(size);
+-            io_->read(payload.pData_, payload.size_);
+-            byte c;
+-            if ( payload.size_ % 2 ) io_->read(&c,1);
++            readOrThrow(*io_, payload.pData_, payload.size_, Exiv2::kerCorruptedMetadata);
++            if ( payload.size_ % 2 ) {
++              byte c;
++              readOrThrow(*io_, &c, 1, Exiv2::kerCorruptedMetadata);
++            }
+ 
+             /* Chunk with information about features
+              used in the file. */
+@@ -199,6 +206,7 @@ namespace Exiv2 {
+                 has_vp8x = true;
+             }
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8X) && !has_size) {
++                enforce(size >= 10, Exiv2::kerCorruptedMetadata);
+                 has_size = true;
+                 byte size_buf[WEBP_TAG_SIZE];
+ 
+@@ -227,6 +235,7 @@ namespace Exiv2 {
+             }
+ #endif
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8) && !has_size) {
++                enforce(size >= 10, Exiv2::kerCorruptedMetadata);
+                 has_size = true;
+                 byte size_buf[2];
+ 
+@@ -244,11 +253,13 @@ namespace Exiv2 {
+ 
+             /* Chunk with with lossless image data. */
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8L) && !has_alpha) {
++                enforce(size >= 5, Exiv2::kerCorruptedMetadata);
+                 if ((payload.pData_[4] & WEBP_VP8X_ALPHA_BIT) == WEBP_VP8X_ALPHA_BIT) {
+                     has_alpha = true;
+                 }
+             }
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8L) && !has_size) {
++                enforce(size >= 5, Exiv2::kerCorruptedMetadata);
+                 has_size = true;
+                 byte size_buf_w[2];
+                 byte size_buf_h[3];
+@@ -276,11 +287,13 @@ namespace Exiv2 {
+ 
+             /* Chunk with animation frame. */
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_ANMF) && !has_alpha) {
++                enforce(size >= 6, Exiv2::kerCorruptedMetadata);
+                 if ((payload.pData_[5] & 0x2) == 0x2) {
+                     has_alpha = true;
+                 }
+             }
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_ANMF) && !has_size) {
++                enforce(size >= 12, Exiv2::kerCorruptedMetadata);
+                 has_size = true;
+                 byte size_buf[WEBP_TAG_SIZE];
+ 
+@@ -309,16 +322,22 @@ namespace Exiv2 {
+ 
+         io_->seek(12, BasicIo::beg);
+         while ( !io_->eof() && (uint64_t) io_->tell() < filesize) {
+-            io_->read(chunkId.pData_, 4);
+-            io_->read(size_buff, 4);
++            readOrThrow(*io_, chunkId.pData_, 4, Exiv2::kerCorruptedMetadata);
++            readOrThrow(*io_, size_buff, 4, Exiv2::kerCorruptedMetadata);
++
++            const uint32_t size_u32 = Exiv2::getULong(size_buff, littleEndian);
+ 
+-            long size = Exiv2::getULong(size_buff, littleEndian);
++            // Check that `size_u32` is safe to cast to `long`.
++            enforce(size_u32 <= static_cast<size_t>(std::numeric_limits<unsigned int>::max()),
++                    Exiv2::kerCorruptedMetadata);
++            const long size = static_cast<long>(size_u32);
+ 
+             DataBuf payload(size);
+-            io_->read(payload.pData_, size);
++            readOrThrow(*io_, payload.pData_, size, Exiv2::kerCorruptedMetadata);
+             if ( io_->tell() % 2 ) io_->seek(+1,BasicIo::cur); // skip pad
+ 
+             if (equalsWebPTag(chunkId, WEBP_CHUNK_HEADER_VP8X)) {
++                enforce(size >= 1, Exiv2::kerCorruptedMetadata);
+                 if (has_icc){
+                     payload.pData_[0] |= WEBP_VP8X_ICC_BIT;
+                 } else {
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 1dc909eeb0..fb8d126198 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -11,7 +11,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 inherit dos2unix
 SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
             file://CVE-2021-29457.patch \
-            file://CVE-2021-29458.patch"
+            file://CVE-2021-29458.patch \
+            file://CVE-2021-29463.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.17.1

