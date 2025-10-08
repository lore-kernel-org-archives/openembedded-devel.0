Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC08CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:19 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.2618.1759957157989050899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Po1mf7eY;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso457612a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957156; x=1760561956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UK2KWD91EXtWHGPErN7wSJ8AC241uBSp648TVGK7GEQ=;
        b=Po1mf7eYs/MEUznUMkf/CVXV+lmArcbsX//BR+TXOpjk9UsZZzHUn4qtENyNxF+itH
         w5HEU2oLhIDtECiFUH8WxQ7somtFRyqZ75VyngFGvguqh0v5FdShzX+l37OzRL3XWTjk
         YQI2QwCYPRptQrRLXM+cUmjtYXfWUzXcQpw1jFQJZjm9TBWxF9RN5JxTUQWZKkYHWIvx
         KTX/OiVC+Q2vJv+eRFXrq//qTRDkZ0WDO0XLFHY0y85eHcP/7bnYfG0yDnWd13AL+t/T
         mXlfuPu72oJ8k9LR7rdiaF1QsRSRXnJRVHXQRkUDiSNjrGpFYTulFwYDGy0eILjNmqsl
         iJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957156; x=1760561956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK2KWD91EXtWHGPErN7wSJ8AC241uBSp648TVGK7GEQ=;
        b=sZOqVCDOPMBAWFWaN8kA4koRPlfbKtMjxGx0eQJ09M43zml/HKc9wwTCdbXPi1lezH
         8yiPkOx4S1gH5hfqPO9ujVJyPe0FPGe3jU7HPGQNZoHOJgA9YN5EbAaz96hzYAW0NuSF
         tTs6/mllYw1tSgYBSyD5uqwIHF3okIaPW8HF/maO5q6UruEoQeNPZQoShyeRr+TY8qrW
         AC0BoxO/Q65ZyxAXIVsFhy52YjmeKI6J/EL2ZrhcQfhOHkAzDQUt0V6gsJS3r4zTKn7L
         62cCjgQegDEUURptV5tAc4np39WpYN5ACTihiGLVlkjJznlgmBPHSTKivI4c0h0JONnR
         blWA==
X-Gm-Message-State: AOJu0Yw85wf2f25cCeykJMM+MZfpOAEhYrSzfG/P3BL2OQMgoMkEWWVd
	uhqyB9UcTa0Vti+YFJM0P8THd+jXMhQhLaV6GKhVgbpCnoa5LwXcl5+V39eKZyzg
X-Gm-Gg: ASbGncttWz3ycJCEASgijFQcS2ePIhpJDe0tNAnpSC4pHIOLKgTow0ewsgfloS1WD+U
	q81XdrtsMKo/0JvS4DxeO9QuqMtvMuiNHxPtdG9boVaLRyKYkLTCrVnXG4NslBWU2MSWKFCXgp3
	PtsMCX0bXNTUZO06YAirXbxf/CTco4FfBpriX6+PMm7l9WKJz6cSZcyg5nm+8UBrEYTWaMbMgpe
	k35OmmpFB6lGz9Nq+qefanJBvlTP4waz5AOf5BFqRM2pN6/ea2E5IWW7hYaIA53HJCbw+ZvSIgR
	ZZv/2xvHliBzINHaUdGRWPWri83F5bhtQ9PcEVs1bWF4j87YXFho+ZnQ2Q1oXwMk+oFO6Jdn7SH
	NsEZHZSg90WVNZuxR8C29JVYoe/JUR6Ng9TLrjt5IaBdb
X-Google-Smtp-Source: AGHT+IFYQ0+TiM2z7C5FXC9UhfBDDL6Kq/wzz7W/3fVh1OyIHa2SHbvCluTVNRPtTT39YuYyPGdFgQ==
X-Received: by 2002:a17:906:6a25:b0:b3c:717a:71fd with SMTP id a640c23a62f3a-b50ac5d07fdmr560352766b.62.1759957156176;
        Wed, 08 Oct 2025 13:59:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 02/11] imagemagick: patch CVE-2025-53015
Date: Wed,  8 Oct 2025 22:59:05 +0200
Message-ID: <20251008205914.598660-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120385

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53015

Pick the patches that are mentioned in the relevant github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ks-to-make-sure-we-don-t-get-stuck-i.patch | 48 +++++++++++++++++++
 .../0002-Added-missing-return.patch           | 24 ++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0002-Added-missing-return.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch
new file mode 100644
index 0000000000..6c15f43134
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch
@@ -0,0 +1,48 @@
+From aae092a403bc79933c081c6be1be1315cb231de9 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 2 May 2025 18:33:17 +0200
+Subject: [PATCH] Added extra checks to make sure we don't get stuck in the
+ while loop.
+
+CVE: CVE-2025-53015
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/229fa96a988a21d78318bbca61245a6ed1ee33a0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image-private.h |  1 +
+ MagickCore/profile.c       | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index aa48b3cb5..a7cd99ccb 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -52,6 +52,7 @@ extern "C" {
+ #define MAGICK_SIZE_MAX  (SIZE_MAX)
+ #define MAGICK_SSIZE_MAX  (SSIZE_MAX)
+ #define MAGICK_SSIZE_MIN  (-SSIZE_MAX-1)
++#define MAGICK_ULONG_MAX  (ULONG_MAX)
+ #define MatteColor  "#bdbdbd"  /* gray */
+ #define MatteColorRGBA  ScaleShortToQuantum(0xbdbd),\
+   ScaleShortToQuantum(0xbdbd),ScaleShortToQuantum(0xbdbd),OpaqueAlpha
+diff --git a/MagickCore/profile.c b/MagickCore/profile.c
+index 7eea1d32f..85c180118 100644
+--- a/MagickCore/profile.c
++++ b/MagickCore/profile.c
+@@ -2571,6 +2571,17 @@ static void GetXmpNumeratorAndDenominator(double value,
+   *denominator=1;
+   if (value <= MagickEpsilon)
+     return;
++  if (value > (double) MAGICK_ULONG_MAX)
++    {
++      *numerator = MAGICK_ULONG_MAX;
++      *denominator = 1;
++      return;
++    }
++  if (floor(value) == value)
++    {
++      *numerator = (unsigned long) value;
++      *denominator = 1;
++    }
+   *numerator=1;
+   df=1.0;
+   while(fabs(df - value) > MagickEpsilon)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0002-Added-missing-return.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0002-Added-missing-return.patch
new file mode 100644
index 0000000000..def4fc881f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0002-Added-missing-return.patch
@@ -0,0 +1,24 @@
+From a574c6ffa818e91772a3bd37649f552b62cd416e Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Mon, 12 May 2025 22:23:48 +0200
+Subject: [PATCH] Added missing return.
+
+CVE: CVE-2025-53015
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/38631605e6ab744548a561797472cf8648bcfe26]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/profile.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/MagickCore/profile.c b/MagickCore/profile.c
+index 85c180118..a68e54f14 100644
+--- a/MagickCore/profile.c
++++ b/MagickCore/profile.c
+@@ -2581,6 +2581,7 @@ static void GetXmpNumeratorAndDenominator(double value,
+     {
+       *numerator = (unsigned long) value;
+       *denominator = 1;
++      return;
+     }
+   *numerator=1;
+   df=1.0;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 56f60716ba..64e81170bf 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -14,6 +14,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
            file://0001-Correct-out-of-bounds-read-of-a-single-byte.patch \
+           file://0001-Added-extra-checks-to-make-sure-we-don-t-get-stuck-i.patch \
+           file://0002-Added-missing-return.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

