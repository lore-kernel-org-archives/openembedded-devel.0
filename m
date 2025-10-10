Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA00ACAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:13:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.1035.1760069606006584415
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ik57baLK;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781206cce18so1777807b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069605; x=1760674405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiMsL6+euZ+ETJKyXdClFeNRB7FUnN48tKL8UvngLac=;
        b=ik57baLKO01P3zRtK/lSUJPNsZoH3AoMIWaBdP2pdpateYFn33BaF3RnuGutKDuB48
         YezKQNivTVkUGsukXgM7tKPOtuHrZvrd3esBB6QGz/02uQqKZeBbTSQXWZOtxgL7EMcY
         jTcaEFkgWhVal7tdXULgc561RQUrkl7kXJtNTYlv+jm219A+Hck44WdEyEUIIYWBRLEq
         N1eAN/xIBdrzkqGZ9V4vKWWVDKmyYE4VMBDG00eII/BylZHoi5T15L6tPDsFKrUVFno6
         Vzuy3+p/nvUwW44Qod7Hsl7KWp1yTIEPfb22eQ7p/tQvUmhtwOy8tGx7iMhefA9tnz2Z
         zw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069605; x=1760674405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiMsL6+euZ+ETJKyXdClFeNRB7FUnN48tKL8UvngLac=;
        b=ewAdIceJit3Of7Pxh+ZBHbTXzjXIuZPwFXm3EOgQ3hejZcjtWnkQs44jOPgKY4x7o1
         yvefBIgRJ1iJa1hEEi/iZQWQhUNNxRyvYPiD43nhJv2qkCoUToLnzVS/Rt8Lmro9b40+
         VLlFtxEOmeaafJAtMCxfi3guXNVDdhCMxwoYnERa5fpPfpQhxAMJV6JVbUr6+8Psa+e5
         N8otftdj2c/eqGH/pTVp5GSeqPhWtugrEKnvIY7eMKSv6dp+6QIzgUl8dkZQsYPBCNsr
         RnFiYL5jcNJxQOIBoK9u/MuIIjQ5nucJ4pyk5h23GjwVjh4fm8TtrH8xADVRwmukghy2
         W8Tg==
X-Gm-Message-State: AOJu0YxIqqsVFEJK7QY6l2oj+k9QITwKdDgZ6KWFjRbgRdRSWBO+8RpN
	hgWA+o6MUOvlqm7GU2v0eMoe18m372pvKSlwumJKrD+91faDONwXEzl9Jldb1g==
X-Gm-Gg: ASbGncvgDCaMHCekUJ8u8sRIg5pVwYW9T/uHv4cXsfGTj2OzQ1Z8i14w2T73fQxIvgX
	v86kvQ1NBli39Rc6bHzpR+AXH+gKDZK2zcNrqO0LiON34r1zhr74MHRouCfddm7FUB5Hz21P48K
	4F6CYyJP6S7E4qV3HX8sIWTbxoC5M1qsNzLNaWy1Iupu28QzOvI1FIgScoDv0u5leTE+b/+ukGO
	tVXsyoPtq0kQw7zW968KJoV0pfpd6gV3Si4luc4K/JxFSNw8QRN3utwgXp1ZTEzRWhsHnEXw664
	0XHfWaAvVMD7INn+OkSK1rjmZtBeGhHm9Ah8dpsRYGW6lQT6VyyWxO6/tGPud+5werKJAEA6zGD
	VYCAu4PG2+z7f/VCt2rOkmdQEVQaXGi7mHGX83mUd3KAgqu+qqmSErEg=
X-Google-Smtp-Source: AGHT+IF4ZYFD4Sz/1U2RJEc6tAoJ8R29Jdzt5X6Vuk4y/8C4WrypgRAcQ3gXdlfG9CbRjEt5kn7uWQ==
X-Received: by 2002:aa7:9285:0:b0:77f:1016:d47f with SMTP id d2e1a72fcca58-7923084dffemr12124755b3a.8.1760069605048;
        Thu, 09 Oct 2025 21:13:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm1360354b3a.24.2025.10.09.21.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:13:24 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 2/3] exiv2: patch CVE-2025-55304
Date: Fri, 10 Oct 2025 17:13:10 +1300
Message-ID: <20251010041311.55847-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010041311.55847-1-ankur.tyagi85@gmail.com>
References: <20251010041311.55847-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120467

Details https://nvd.nist.gov/vuln/detail/CVE-2025-55304

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exiv2/exiv2/0002-CVE-2025-55304.patch     | 104 ++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0002-CVE-2025-55304.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0002-CVE-2025-55304.patch b/meta-oe/recipes-support/exiv2/exiv2/0002-CVE-2025-55304.patch
new file mode 100644
index 0000000000..514481001f
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0002-CVE-2025-55304.patch
@@ -0,0 +1,104 @@
+From 4ca5526c8805cae7d7bdd7e9590f4e7b0ab622d0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 15 Aug 2025 12:08:49 +0100
+Subject: [PATCH] CVE-2025-55304
+
+Add new method appendIccProfile to fix quadratic performance issue.
+
+CVE: CVE-2025-55304
+Upstream-Status: Backport
+ - [https://github.com/Exiv2/exiv2/commit/e5bf22e0cebeabeb2ffd40678344467a271be12d]
+ - [https://github.com/Exiv2/exiv2/commit/b7f153f0c0c2d61f97de9de474b57b1176214225]
+
+(cherry picked from commit e5bf22e0cebeabeb2ffd40678344467a271be12d)
+
+(cherry picked from commit b7f153f0c0c2d61f97de9de474b57b1176214225)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ include/exiv2/image.hpp | 11 +++++++++++
+ src/image.cpp           | 29 +++++++++++++++++++++--------
+ src/jpgimage.cpp        |  7 +------
+ 3 files changed, 33 insertions(+), 14 deletions(-)
+
+diff --git a/include/exiv2/image.hpp b/include/exiv2/image.hpp
+index 629a8a4fd..8925fa800 100644
+--- a/include/exiv2/image.hpp
++++ b/include/exiv2/image.hpp
+@@ -191,6 +191,17 @@ class EXIV2API Image {
+     @param bTestValid - tests that iccProfile contains credible data
+    */
+   virtual void setIccProfile(DataBuf&& iccProfile, bool bTestValid = true);
++  /*!
++    @brief Append more bytes to the iccProfile.
++    @param bytes array of bytes to append
++    @param size number of bytes to append
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
index 4986415a6b..93715fe9fa 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "zlib expat brotli libinih"
 SRC_URI = " \
     git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
     file://0001-CVE-2025-26623.patch \
+    file://0002-CVE-2025-55304.patch \
 "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

