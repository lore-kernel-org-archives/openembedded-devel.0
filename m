Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C5ACFD2F3
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.973.1763839897558248288
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIzZNcsZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779d47be12so24228655e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839896; x=1764444696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StLfLuX08/2cDqZqAV6fFzXvVLMg4V2SdfX1NHqu8Kw=;
        b=UIzZNcsZ6rRSig8MHCqDEUL0cJajFDhwjEf0xbkHu7Ut6rrmd/VgfILTluiYnDlh79
         Bi+4N8qmLCTymmT938JnDW0fU2g/JJmrbU0M8sne7KtAAbi3pYfX3N98Ubr+iD5UquCd
         vd2gj5L7lssyKCUAAoLBqoTk27atnUG3pu/KY+cxOyWmFh0s0QGcftXax4+rzKvifq2K
         N7lWHex22b7OkgABnOwwme//FU5q69XbdsnNgrWjgmAjjO/oar6aIxCNvTRoD6u9XN4E
         2dQAeICL1a4hkFl91IEnTc6t3syDKZx8qAMax8q5cawtBr6GXphY3z9kdklO1BM9R6TS
         WQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839896; x=1764444696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StLfLuX08/2cDqZqAV6fFzXvVLMg4V2SdfX1NHqu8Kw=;
        b=uhZ5KCzRGcA4Xbarjy2kg36FcEo/iKu73QV2lH1AjkfP03GKoxX2pc5Jcz0wheMX3E
         hLCo6RV0ODwfo3WaQknroAnhTL1AdaNy4hP7V0G8TGTgK/F6/u5z4r/cuoRHCy7JWkWO
         hOOXraoDUVT1qrei8PY8mTKmk8DKmqdPdC9dgDCoqH97apcyAi01dBUDlzWsIx808ZS3
         D7spx6CMt7LjbvRoB7P+3pb6Qr55kHsbEh/q9Z0te1xEaEvK9Ag0ZfqmoZDg+rB3/XEM
         K319Nlk0RYbcKpIa4saycLBsPW95TVvHIIgVlD+3ErvTmFrQENsKldK1/ZnzbR/yL2If
         /lvQ==
X-Gm-Message-State: AOJu0YxMiM2PpLqBDqJMjIdnqB4OQjBhG4qXEsHevA+c2PI8mL1JmuU7
	A93jQuokRv3Fctgs298QkNVYjdtH+EuHPcT0NRmtBHdjzjV4derMefzULj5zkSak
X-Gm-Gg: ASbGnctRgKQk2FVmJtoeUcKT8AilZCsSTC2WXZcdIF9WI7PekOLcFQS3X4woNArjHPP
	DSFVIGV9VY7Wd77m7rE6OQcF4V8Z1O2ih9Ya3bsgcaGmsw4MldqJQxIBuDpF20zMxKt1dtV3pu2
	/+keIGys1tW/4JMTB9UovLOFaa3H5oYQ2Akmly6bKgRRS6FlBG3XxbzrkCtwnp24W3STfGxu+cv
	cOeKKuKtNFZnVgnHcEQph0QRg+0qfpNHRfcKoS0ZdPpJ6mfJVUvigDgD6BY1p0Sbke00q48GgQT
	YDPo5IU2eabLUJmVOPxYRmtBxh3lKe8Nmv5HSutsfTfLFj5CUTLF3oKn/ktn4Yyd3aFyVGhV3ik
	wl8FYFF5eZH7XZM48O7Udw/lM8+qfQB5x6YcA2Lys63ihbJVdneNC4Iuhm6ArltB7DDN5DlrKcT
	mky8vPYuAi
X-Google-Smtp-Source: AGHT+IGUaAd3mhAzL6hqiPw/v7fTaTEhnB/EXdkXasvwaKnER/cTNNWVj4JfxbzO5Tj7Gmz8I2nuJA==
X-Received: by 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-477c017512dmr59739455e9.2.1763839895812;
        Sat, 22 Nov 2025 11:31:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/10] exiv2: patch CVE-2021-34335
Date: Sat, 22 Nov 2025 20:31:28 +0100
Message-ID: <20251122193128.1703871-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121988

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-34335

Pick the patches from the PR mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-34335-1.patch        | 43 ++++++++++++++
 .../exiv2/exiv2/CVE-2021-34335-2.patch        | 57 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch
new file mode 100644
index 0000000000..055a7c5db0
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-1.patch
@@ -0,0 +1,43 @@
+From bde41fcab99f5def735bc4b0b8515f211eda98c0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 29 Jun 2021 23:32:59 +0100
+Subject: [PATCH] Prevent divide-by-zero crash.
+
+CVE: CVE-2021-34335
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1750/commits/f2d6d24ed74b2c5dbbbdc25bafd42ce9357978f8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/minoltamn_int.cpp | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/src/minoltamn_int.cpp b/src/minoltamn_int.cpp
+index f5c0b41..77521fc 100644
+--- a/src/minoltamn_int.cpp
++++ b/src/minoltamn_int.cpp
+@@ -2179,16 +2179,20 @@ namespace Exiv2 {
+ 
+             if ( model == "ILCE-6000" && maxAperture == F1_8 ) try {
+                 long    focalLength = getKeyLong  ("Exif.Photo.FocalLength"      ,metadata);
+-                long    focalL35mm  = getKeyLong  ("Exif.Photo.FocalLengthIn35mmFilm",metadata);
+-                long    focalRatio  = (focalL35mm*100)/focalLength;
+-                if ( inRange(focalRatio,145,155) ) index = 2 ;
++                if (focalLength > 0) {
++                  long    focalL35mm  = getKeyLong  ("Exif.Photo.FocalLengthIn35mmFilm",metadata);
++                  long    focalRatio  = (focalL35mm*100)/focalLength;
++                  if ( inRange(focalRatio,145,155) ) index = 2 ;
++                }
+             } catch (...) {}
+ 
+             if ( model == "ILCE-6000" && maxApertures.find(maxAperture) != maxApertures.end() ) try {
+                 long    focalLength = getKeyLong  ("Exif.Photo.FocalLength"      ,metadata);
+-                long    focalL35mm  = getKeyLong  ("Exif.Photo.FocalLengthIn35mmFilm",metadata);
+-                long    focalRatio  = (focalL35mm*100)/focalLength;
+-                if ( inRange(focalRatio,145,155) ) index = 3 ;
++                if (focalLength > 0) {
++                  long    focalL35mm  = getKeyLong  ("Exif.Photo.FocalLengthIn35mmFilm",metadata);
++                  long    focalRatio  = (focalL35mm*100)/focalLength;
++                  if ( inRange(focalRatio,145,155) ) index = 3 ;
++                }
+             } catch (...) {}
+ 
+             if ( index > 0 ) {
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch
new file mode 100644
index 0000000000..35d1e79d01
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34335-2.patch
@@ -0,0 +1,57 @@
+From fb3bfc509905b20cbde061ff3ec8be9d8a04e7c3 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 30 Jun 2021 11:57:46 +0100
+Subject: [PATCH] Defensive coding to avoid 0x80000000/0xFFFFFFFF FPE.
+
+CVE: CVE-2021-34335
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1750/commits/2d8d44e47b1500030e5b249bffbaf1e80aa74815]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ include/exiv2/value.hpp | 6 +++---
+ src/tags_int.cpp        | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/exiv2/value.hpp b/include/exiv2/value.hpp
+index 7ca57f3..f726f8c 100644
+--- a/include/exiv2/value.hpp
++++ b/include/exiv2/value.hpp
+@@ -1569,7 +1569,7 @@ namespace Exiv2 {
+     {
+         value_.clear();
+         long ts = TypeInfo::typeSize(typeId());
+-        if (ts != 0)
++        if (ts > 0)
+             if (len % ts != 0) len = (len / ts) * ts;
+         for (long i = 0; i < len; i += ts) {
+             value_.push_back(getValue<T>(buf + i, byteOrder));
+@@ -1653,7 +1653,7 @@ namespace Exiv2 {
+     template<>
+     inline long ValueType<Rational>::toLong(long n) const
+     {
+-        ok_ = (value_[n].second != 0 && INT_MIN < value_[n].first && value_[n].first < INT_MAX );
++        ok_ = (value_[n].second > 0 && INT_MIN < value_[n].first && value_[n].first < INT_MAX );
+         if (!ok_) return 0;
+         return value_[n].first / value_[n].second;
+     }
+@@ -1661,7 +1661,7 @@ namespace Exiv2 {
+     template<>
+     inline long ValueType<URational>::toLong(long n) const
+     {
+-        ok_ = (value_[n].second != 0 && value_[n].first < LARGE_INT);
++        ok_ = (value_[n].second > 0 && value_[n].first < LARGE_INT);
+         if (!ok_) return 0;
+         return value_[n].first / value_[n].second;
+     }
+diff --git a/src/tags_int.cpp b/src/tags_int.cpp
+index 6f76a87..df05522 100644
+--- a/src/tags_int.cpp
++++ b/src/tags_int.cpp
+@@ -2228,7 +2228,7 @@ namespace Exiv2 {
+     std::ostream& printLong(std::ostream& os, const Value& value, const ExifData*)
+     {
+         Rational r = value.toRational();
+-        if (r.second != 0) return os << static_cast<long>(r.first) / r.second;
++        if (r.second > 0) return os << static_cast<long>(r.first) / r.second;
+         return os << "(" << value << ")";
+     } // printLong
+ 
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 339ce221dd..1c1c05dfaa 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -20,6 +20,8 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-34334-2.patch \
            file://CVE-2021-34334-3.patch \
            file://CVE-2021-34334-4.patch \
+           file://CVE-2021-34335-1.patch \
+           file://CVE-2021-34335-2.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

