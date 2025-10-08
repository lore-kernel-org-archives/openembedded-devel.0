Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA61CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:48:04 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.657.1759934881592870127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7YBKGem;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso6430957a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934880; x=1760539680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3PAiq/r0jiWU4EcaWLleSY2WgTXeqKMzsjNCmzyK2k=;
        b=e7YBKGemvCrg81GybZN98aTE5NfAN5w4FplpcSA4gu1FEPy050ruI2vyYBFhAT0m04
         Ild6ofq0MgFTrEkZIAWs78tryBgOcAK1+B1JaHCkyHA2CQVBQuVgtawCRkOVYTeOl348
         YxzypSpcjx5df6A2e8GbYNWxXSAR4mltUVzNoetHz/OlwpokwH5f7+6Ex0FGwVwBY84r
         0vwijS2lF0t+PBfdxs7CNEi3USFUd+IbRbirc4dvJA0Kq8Q9Pp88eSCwLOqMmjddCxbs
         TWTKqZgQo2iicsawvBnFjO4dGMCaybplEiQqDHc10R8dDcuaXlK+desf/Thqv6Zc8mYd
         kbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934880; x=1760539680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3PAiq/r0jiWU4EcaWLleSY2WgTXeqKMzsjNCmzyK2k=;
        b=r3y1l8gFB2Io2+SDX03qqIx79cDwh1tp+9I8qS0/yo4gv4S2PsjFim4BKwhCWTuHVu
         Yp9lPrcwzt5cVsyH151rZw6cl3jSMes+0ifdQPFmOp6/630qUbfY7yE3s2jITkMpxFxR
         9hW4bUudYZHZn36JnHlkzSg9pkrPtN9uyl3RJ6uOSDt7DFtEo8ySZhdV5Wky+GfEPWeI
         3sQDm8kZN1KGJU1Vqkep/a+uvtRu5+Ot+vuLu14+jPtmh7qYsgIo7et9bnbPpV5J8Qxk
         fEkUUa0jvusGukzIHbFAIpD0pp0zgnA0Ha6lxuElytPLYvjf3wMdHIhBRrn4hSYc+3c5
         XAcw==
X-Gm-Message-State: AOJu0Yyn9dAkrM9eh35+dVczCo3xl0XAE82mgmBmlq9tsfPbtzuIPduJ
	cmH0Nzr6lJdRIznKZhJe1IAVOhbojtaKyjX2CRXcya+oKpL2LW7aTurBCnW+f14a
X-Gm-Gg: ASbGncvjtE1Om9J0PwvBNMAWW2nd952Kr8ZW6GAHQt3BBiAgS8MrSsMA0kEEhCy6PIs
	6vmUkwsLKUhykA7JhG+P+PZELfD7+8Fvbs3utG1Y5z3gS+VXljcPL7j1jJQzniTfXfvFo+cydle
	+udv6JVjMhh8W2oRWLeb/rd6t6dPJw+i4efQQhUzddzo7zAQxZjbpLeu7vVzA1XbuHe/JIbURaj
	DLYPpAsfaLOsBDaMqlbuh0/NbesfZmVlUpzOUUtwK+m6aGYwdcr68YUPiuGIBQwD+y7WBqKVcmN
	UxjeoB225AA2ecOzLb6lDeMORVhXSBgKARNhXIWMxer/zCRjoJSgVldlN8CzgZO6I+xjWNYBzYw
	MUr0o3N+IoG8Ff0b9no3peQ3zCuh9em17J1Ev0Mrdf4Bx
X-Google-Smtp-Source: AGHT+IFZ7QLOlDQIIL6bEI6PLXgkHPb2nNZ6q5uEEnoj++79J+M6PfR+a2IjN+9OSpSw0zEr2Mg6qQ==
X-Received: by 2002:a17:907:3e0e:b0:b45:27e0:7f35 with SMTP id a640c23a62f3a-b50ac7d4807mr437792766b.46.1759934879844;
        Wed, 08 Oct 2025 07:47:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83e3dsm1637724366b.29.2025.10.08.07.47.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:47:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/3] exiv2: patch CVE-2025-55304
Date: Wed,  8 Oct 2025 16:47:57 +0200
Message-ID: <20251008144757.411347-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008144757.411347-1-skandigraun@gmail.com>
References: <20251008144757.411347-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 14:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120368

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55304

Backport patch mentioned in the details of the vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

