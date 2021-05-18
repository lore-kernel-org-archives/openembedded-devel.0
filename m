Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web10.5583.1621325037355320634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eCrJItBa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325034; i=@fujitsu.com;
	bh=YRZYl7Vqtj7DnwlckK24k7b8PzdokodRbtlHKARnIOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eCrJItBa7vqhTIKNI37F4sXNocGYotrMr5aGHxvaG8yASByNbiqE8Mvjtaeozi6hB
	 gL/JwSprYFfTuZrbD8ZeZQ3kwq7uyQmDBuht3XxlgWsdF0xPtm5POSbMRCt0Fs4gwm
	 4EqBZlDs+4DxeSAoeTRKv5aWB6XAn5nLEED8Ney3Q8jGoE0CdK+iwG6LfU4fywFX+f
	 PtkHOApkizgtQPFpCSso/mmnCxOo+PfMZSPEUkfclNJ2NS5jCO8T5BYLeQG95JmQaE
	 I03hMtlkz77VmGDLKs7oHf6dWrRoWMnVqEyamD63/aV3+LbFqO4vF2SKf+JxY2oFrb
	 OGZpfc9/ioj/w==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 66/C4-14259-AE473A06; Tue, 18 May 2021 08:03:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MRqvuqZHG
  Cwa7vfBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/n//ZChZYVsw585ypgfGgVhcjF4eQwGwm
  iZlP+5khnBOMElv+nGDsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAVuLv0
  jNAcQ4OFgFVoEFg5bwCThJ7F51lArElBBQkpjx8D9bKKeAscXb3KzBbCKhmxdPVLBD1ghInZz
  5hgRgvIXHwxQtmiF5FidmXm1kg7AqJ14cvMU9g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11TXSNDEz1Eqt0k/RSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGZUshydgfj
  l9cf9A4xSnIwKYnymt1flCDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgje2aHGCkGBRanpqRVpmD
  jA6YNISHDxKIrwchUBp3uKCxNzizHSI1ClGXY53PxcvYhZiycvPS5US500tBioSACnKKM2DGw
  GL1EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnVQabwZOaVwG16BXQEE9AR/xsXgRxRkoi
  Qkmpg8lkh8FZ7a9ARMcY9F/btS/q685yD3OaKkq6vBQmnKh/p/5xj/kX9aEbY36KyTkfl3+IX
  O0xWvDk94T678639y6aUXlJT5HbUj1m9e77nsY8dCeJau7Z4i15ZEKTyZNO1TR1uChkHFx3PT
  Yyf+jj8QItWwqSZFpYXopZnmcltrFMVSSiYNNF9QvvLhK+nGyddqHd8tD5ho8LMoj8/Uupnyx
  nOlf4+ybhMY3uTQN2LYIMvigxe08N9Vu1uY7SQfdnkYlK144rittTzGnudHRfyfGZX3H43cZ3
  HpU/Z96/ZbuKeMOfilo8e7vseaOaWSp1iakuayT9n1XWj138WaHnoKs39eORKWljEkkkO9kcP
  NSixFGckGmoxFxUnAgBVd/J9TwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-245.messagelabs.com!1621325033!90598!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30876 invoked from network); 18 May 2021 08:03:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:03:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I83mrk006904
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:03:53 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:03:51 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 3/7] exiv2: Fix CVE-2021-29463
Date: Tue, 18 May 2021 16:03:30 +0800
Message-ID: <1621325014-16286-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
References: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29463

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b04d4b]
      CVE: CVE-2021-29463

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29463.patch          | 120 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   3 +-
 2 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29463.patch
new file mode 100644
index 000000000..5ab64a7d3
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
index 1dc909eeb..fb8d12619 100644
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
2.25.1

