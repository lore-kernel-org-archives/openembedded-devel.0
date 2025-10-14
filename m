Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55D0CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.326.1760475282180778166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jluXLaRL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-279e2554b6fso43359995ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475281; x=1761080081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbBadCOgCowt0UekIjc77ddK4E30Ff5pYfVWp+JuqxU=;
        b=jluXLaRLj6ZHk+hWGDp0+2lEVnvK17AKINOOabU5UksIDUXNNhE80HvJmTw/o60pYT
         AQu5+0NXZHtC3+SZcZWoVniQtVfGWUgdCnR2gnu1HfEzMKlCTYTIxeBpxsAgSo/WCM1x
         w9rsqFCEBt3L2VZDbf/fnY7kmGxM+zUYhRWX8wp4NDhE21QGwtT4/5fkhUGzcxTWcAO2
         Yij0xyTd80XhYXbm+VXjqv3FmvxbcwFLFUo8Bv37jQHsSY6N7NjBP2bf7UBf+xFuWnmF
         LQb0z9T1emrje0t63q5mmYa3lUXrzh+qmJoUxXe0UhH1BtW+8CRZSp7TXtetU2lxZvYp
         jIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475281; x=1761080081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbBadCOgCowt0UekIjc77ddK4E30Ff5pYfVWp+JuqxU=;
        b=LKCKGHEYaN+yi1uFef1tfbdJB27B/ydzL5SHPSzJmC+zTKBfUCet+PWlhUUvCW+gVG
         Dp3y48qSpzI2omJFBDG0Sg5wal4v2KdzP+GnqyJ08649axAKQwhofi5JgNB0AefY8yE3
         faMMdEB3EtAXU/BcYnjO0Odbsu+2zO8wpT2X5VtmS7XPIxtMzbGzZhSTCbZOr3mbOwDP
         lxsJJbMq2Fc0d20D9yAl7ehC5YWGhVlxKLxFhqY1tD2G4PoumwKqkyv1jxx4W/YBePp5
         oCQ3yNV11faa/u1AKopeEy9p9CAwB2YI0Es8m62YpPJhdrGHsJ+joaUjrwkGmXWShOzt
         dANA==
X-Gm-Message-State: AOJu0Yxb/ADnm/px30R2fQ3yfMS4foNkdacbJWR7vw3olcc1wdbeb/fw
	P6n6Wewa8/7lp5dHqxzYkKbu/dO5B4gFmjhkH6+0teGj/qXRYF//vxyNfaa6wg==
X-Gm-Gg: ASbGnctXV3jcCyr6w2CYxkUWDlwYq1RCk27VyGK3FRlTc+buyA0F8MiH9BqIDY4dCd6
	deXqghFavH7GjweVEgnY65sQ3SMDZGaXt9cvAwNH0+G2x4ET0N0IrnAHhafFNZ4Cj5bDOCSfErC
	qCjp9szDC76Lnuk4PYhb1Hy3Y2jWGHzpCri4O49dEJiGsHpLoNmQXbcPiqsyPd6cwe/JSUQ68iJ
	2wIUDmN6ZJaoGnCdv4Mg5Viw2i4/lKJL0iQpwuLArMaFPfCstiqqMH6Jwt9Rr3vh1iCglDK6CPy
	trZeE2yNuWIevDw9vCppmABxZaGa7CHWjqHu3nJAx1kEEgNDTB0pw+ZqM+8TR+5WS+HB3L20vb0
	mlibnchp+dF9iRD5PAdfDQwegCQqjczm0n5W0RPNXHPc6IYL/zZbdnyfTnIdyrdSzOA==
X-Google-Smtp-Source: AGHT+IEwEYFcRK1Fx2jQ2srltj2UqxYKmz0AZq4MB+HmTPtaT+kpCsDGjaiNQKP8A5LMU+IpVZJpfw==
X-Received: by 2002:a17:902:e952:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2902735667emr334807295ad.6.1760475281460;
        Tue, 14 Oct 2025 13:54:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:41 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 14/18] exiv2: patch CVE-2025-55304
Date: Wed, 15 Oct 2025 09:53:57 +1300
Message-ID: <20251014205402.1487867-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120647

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

