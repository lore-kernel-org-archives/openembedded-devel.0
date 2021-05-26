Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.6297.1622029978351273119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LmP4/sDo;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id q16so484022pls.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wvQwfR3CA9oe6gqiFyq7cVBBVbxr9OBsiA7bkXKMsIc=;
        b=LmP4/sDoxDHOLJ71pMIwsAp+WJ2r3HkHwKv9Oie5UX2XvQ8mb2zZrqhYmCegCL1yIa
         i97Vo2njHQjhJPXqv4b3xCKas+t9Sk+5OSs3aG7uvqBb0f3zkibnLnXa9z+hmXihKIv+
         91qOaWSF+SVep2AF4MDm0GgW5llXKiBYxsi7cFmbApYdOO9SJsTWhfVq5qvv1sQidYUs
         HzoCP5/fuhocIVPRuJpdJVYbbYFUhBGIYW2TAJd/PIlbgwnLdruD7gOdelnBQBRIxt4N
         UrDlVpiZoD5nUQXH21N/QL1UxVsg1z3/0DjioMYaISWHMk/aMq8DGrOql8A7JFjqBoRl
         A2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wvQwfR3CA9oe6gqiFyq7cVBBVbxr9OBsiA7bkXKMsIc=;
        b=Pd8fGl6dwDK87GJDpDrIy9OsTn5FcFTuOArijRdVi7cbjxAp6jUzl8GKaPBqHr9r0q
         fPVITSm0Pn3B+o6Brkjgve4seKiPAftwzP+rjOuiwot/HdwPbf+9Q755r6f5AsQOjZ5s
         tlg+bUeTGHOWXITiqszC/scOZw7kY74S2iNkA+dytLyCN7HP55F/lB4iDlTJ0y6XORas
         MENI9Oll+OSrSjWbmwk63CPzNDhUWlyx7ii8LF/HDvRtXD6SYJeHxfVY3rM7J/ktfWFL
         h/KaTq0Uo5aHFo5MDu9FrvSs9gjhtL6sY+Ef5xhL9NGLRYS/LQpDT3iotCZnlmnk8GGu
         dGUw==
X-Gm-Message-State: AOAM532fNViLhiaX7fzhajOBtWb/WCB/FLibRZgpKLjZDVGSudyEBBjv
	XBM9RL8H1bkzzw0KSQkgpTZgBjvxQG3MCA==
X-Google-Smtp-Source: ABdhPJw4MNlwIUtEP7VG1NbijvCKQk6vEnkmAcbx603Op3R4eT84xlQFgdUOFO+JKfsYWz+03dSuiQ==
X-Received: by 2002:a17:90a:46cc:: with SMTP id x12mr3641297pjg.52.1622029977684;
        Wed, 26 May 2021 04:52:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:57 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 10/23] exiv2: Fix CVE-2021-29463
Date: Wed, 26 May 2021 04:52:25 -0700
Message-Id: <0e8fcf0e774e17ea72785d5d95356bc6ee9133ee.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

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

