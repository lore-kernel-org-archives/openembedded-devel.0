Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202B9CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3492.1760484802679125835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3GRUAoN;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33082aed31dso6173218a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484802; x=1761089602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbBadCOgCowt0UekIjc77ddK4E30Ff5pYfVWp+JuqxU=;
        b=l3GRUAoNB+phd91xABp0w7EmnI+w6Qc9JIXV/Mt3H7UzFcJES4syI0rfGq8xLtw9M9
         4pb1PXcHtP+3ecj8VNinRxR9XbZGbnNhWluqhXE9PBPTKKv92jr4of1CHEymJ3Ts+QbK
         KFUXPisgU3aFDPDjm89SZpdlliF80SpGQ9AImkcGHXoleSXfzlfAmM00d0Vi2G+Pon1s
         dxTneF+VGQGrIw/XJku3Hcwe9hk8LUImlh1DgIhKiEMLvkSQyJttMga+XbNiHe2DQhRN
         BPwenZWAIIOCUE4urXnFUrHz0mwButiEw1LPYUtqZuQl/veQdsP8dA1ddqdccsB4Am7F
         iuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484802; x=1761089602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbBadCOgCowt0UekIjc77ddK4E30Ff5pYfVWp+JuqxU=;
        b=ZdjXq15OnYgkKysYv/BZEIQbjyjOPH057FTkJvTcjdsJYpU6oAgZTkL6sbwbP9IH/R
         DATc/dUuJ3pEAfc0jXw53YHHSO07yroxcw47rH+25Yu/8me1LlJ9cuh9gy/NDYyxYYjp
         wTOTk9ssH4hBNqvId2IzzfUbFcvxZWCR73WXL6wjOLa8CkUIjV+RU6qyBC2/n9J2r6Ev
         annkytYYHj6DEjMJvPeZMVmwlL/TU7NS8gHsaxaYqzoZhY3hV8kFIgcB+jP002JKagDl
         mkh4s+agjwAnX3+SIeT3/N3V7qmf3OZJamPrm84VnAL4aYfy8MQcHPqXNA+B6jLd8jfT
         QPQQ==
X-Gm-Message-State: AOJu0YwjXLSzCP++8zlELllVG2l90G+hf/4fschsPp/lJeuWvD32m3Ql
	/nn/KLOZp+YfSNaM87rbuf9rvK2tAHlWiDTdunZJexv/F5isZTTNsHe385BYtw==
X-Gm-Gg: ASbGnctVIkoSvFGZJrkPLCf7z94AatuGoadze2PEhI3OW4wUhbp1/lPEc45cxGzuR91
	79QAnXKXYxuAl76sTrnHGCyXTyhrVWug5xpD0McjcWTjyG0d+9feEk62mMSLt0Wp70cgjGg2ECy
	lJWrC3Ozpps9JwUIMA2k0SMVf1lL2LzBeOS6kDUaVmj6ifh0TDBK/qcUe3Ubl8wwFGPbMFPkr8g
	c/byCjLOOp+gOTh7zP3FABCSiBmEOTjds39/fwyekXnIuW+h/5X69zm+3MiE9h09HYFgM4fZbIw
	i2z11eZMEloVH+PGDid8WS2wB+UlspZ1NHCqVx1i6uIEhDCD6YMapn/XB/ovBY8xT0PNgIPbGON
	g4n7Q+1y00XDeBkTLlKw2cmlLXgWgt10vXN+n2zvyVsYGPMwJh43laihzv+hAwBOBmw==
X-Google-Smtp-Source: AGHT+IGuIsFtkYjPH3qEcKm/Z0CuSiIvGF8KITq4jVuXuc8WdoeiswHHWCFOOiXfHviKHiKyo3yypg==
X-Received: by 2002:a17:90b:1e0a:b0:334:cb89:bde6 with SMTP id 98e67ed59e1d1-33b51105dcemr33248849a91.4.1760484801897;
        Tue, 14 Oct 2025 16:33:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:21 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 14/18] exiv2: patch CVE-2025-55304
Date: Wed, 15 Oct 2025 12:32:25 +1300
Message-ID: <20251014233233.304125-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120673

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55304

Backport patch mentioned in the details of the vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit f47fdfd73090c996f4edf9c7921bc07bbdffd908)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ppendIccProfile-to-fix-quadratic-per.patch | 96 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch
new file mode 100644
index 0000000000..a0399c539b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch
@@ -0,0 +1,96 @@
+From 14a862213873b3f81941721a5972853fd269ca63 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 15 Aug 2025 12:08:49 +0100
+Subject: [PATCH] Add new method appendIccProfile to fix quadratic performance
+ issue.
+
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/3345/commits/e5bf22e0cebeabeb2ffd40678344467a271be12d]
+CVE: CVE-2025-55304
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/exiv2/image.hpp | 10 ++++++++++
+ src/image.cpp           | 29 +++++++++++++++++++++--------
+ src/jpgimage.cpp        |  7 +------
+ 3 files changed, 32 insertions(+), 14 deletions(-)
+
+diff --git a/include/exiv2/image.hpp b/include/exiv2/image.hpp
+index 629a8a4fd..072016013 100644
+--- a/include/exiv2/image.hpp
++++ b/include/exiv2/image.hpp
+@@ -191,6 +191,16 @@ class EXIV2API Image {
+     @param bTestValid - tests that iccProfile contains credible data
+    */
+   virtual void setIccProfile(DataBuf&& iccProfile, bool bTestValid = true);
++  /*!
++    @brief Append more bytes to the iccProfile.
++    @param iccProfile DataBuf containing profile (binary)
++    @param bTestValid - tests that iccProfile contains credible data
++   */
++  virtual void appendIccProfile(const uint8_t* bytes, size_t size, bool bTestValid);
++  /*!
++    @brief Throw an exception if the size at the beginning of the iccProfile isn't correct.
++   */
++  virtual void checkIccProfile();
+   /*!
+     @brief Erase iccProfile. the profile is not removed from
+         the actual image until the writeMetadata() method is called.
+diff --git a/src/image.cpp b/src/image.cpp
+index f06660cf7..eb6b3eb0a 100644
+--- a/src/image.cpp
++++ b/src/image.cpp
+@@ -625,16 +625,29 @@ void Image::setComment(const std::string& comment) {
+ }
+ 
+ void Image::setIccProfile(Exiv2::DataBuf&& iccProfile, bool bTestValid) {
++  iccProfile_ = std::move(iccProfile);
+   if (bTestValid) {
+-    if (iccProfile.size() < sizeof(long)) {
+-      throw Error(ErrorCode::kerInvalidIccProfile);
+-    }
+-    const size_t size = iccProfile.read_uint32(0, bigEndian);
+-    if (size != iccProfile.size()) {
+-      throw Error(ErrorCode::kerInvalidIccProfile);
+-    }
++    checkIccProfile();
++  }
++}
++
++void Image::appendIccProfile(const uint8_t* bytes, size_t size, bool bTestValid) {
++  const size_t start = iccProfile_.size();
++  iccProfile_.resize(Safe::add(start, size));
++  memcpy(iccProfile_.data(start), bytes, size);
++  if (bTestValid) {
++    checkIccProfile();
++  }
++}
++
++void Image::checkIccProfile() {
++  if (iccProfile_.size() < sizeof(long)) {
++    throw Error(ErrorCode::kerInvalidIccProfile);
++  }
++  const size_t size = iccProfile_.read_uint32(0, bigEndian);
++  if (size != iccProfile_.size()) {
++    throw Error(ErrorCode::kerInvalidIccProfile);
+   }
+-  iccProfile_ = std::move(iccProfile);
+ }
+ 
+ void Image::clearIccProfile() {
+diff --git a/src/jpgimage.cpp b/src/jpgimage.cpp
+index 34187dc63..2c29135ae 100644
+--- a/src/jpgimage.cpp
++++ b/src/jpgimage.cpp
+@@ -268,12 +268,7 @@ void JpegBase::readMetadata() {
+         icc_size = s;
+       }
+ 
+-      DataBuf profile(Safe::add(iccProfile_.size(), icc_size));
+-      if (!iccProfile_.empty()) {
+-        std::copy(iccProfile_.begin(), iccProfile_.end(), profile.begin());
+-      }
+-      std::copy_n(buf.c_data(2 + 14), icc_size, profile.data() + iccProfile_.size());
+-      setIccProfile(std::move(profile), chunk == chunks);
++      appendIccProfile(buf.c_data(2 + 14), icc_size, chunk == chunks);
+     } else if (pixelHeight_ == 0 && inRange2(marker, sof0_, sof3_, sof5_, sof15_)) {
+       // We hit a SOFn (start-of-frame) marker
+       if (size < 8) {
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 947d13208d..db32398b4f 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "zlib expat brotli libinih"
 SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://0001-Revert-fix-copy-constructors.patch \
            file://0001-CVE-2025-54080-fix.patch \
+           file://0001-Add-new-method-appendIccProfile-to-fix-quadratic-per.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

