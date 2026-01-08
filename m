Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3343AD185CC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:53:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4002.1767869624601831968
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dF0/4Egb;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so21186185e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869623; x=1768474423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=linxga3dhkfwn+exszfhQnLEa3t1gc5dTEm/i4mJeuk=;
        b=dF0/4EgbiwDnL1UDetchQosHcTm+aDWUc4dMWz6F+fcHFL8LC+YrUG8hhowqhOhJag
         TXn804BLE9SVNzUjWyvLuOMxlQ5bTphUe5F1j4qTAqBcNunmjZqyq9ySo9A+c+s7LO3H
         2P37mmShpIM0Xbu+VkiQtM+td8qI1lt3QLaJl6qyUpR6/gXyt2ye1f0H1kTTEl9s2vwh
         T7zSjGtDaacZnO70Mrm7jkqNJDaXpUTtI1CSPiIX5B0KWjPsUs5w5tiqtt4CtatKsikY
         DqPypLjp6jAEq7IRu/E8pqeyAbnj9J/FKKknLuSJ7G5Byb92WIgdMDBaJuGa06Y5qlhn
         sEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869623; x=1768474423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=linxga3dhkfwn+exszfhQnLEa3t1gc5dTEm/i4mJeuk=;
        b=gxGQxsdAP6KK56dxo3Z9LMrKLe7U3UUPYL1EzAObSUo6CpMbOMdyf56l5FMvzTmUUF
         RDMYQEvpdh3vRSrw2+EdZrb5/5A6XXnY7Mi2ig+0W3xJWR5Z70NbTVt0mEH0auAgwv8B
         Ex5AZy+U1Fw5YfU7UxneXerxyQxhdk02vejf4eZskjjkU1Mh5AHaA28Fv2ScsKf4HtIZ
         0Q4yCL3WG5b0SKWbxR9UNzheykhbcAJOezjlTMYO3EjQcaCm+7rJjfruuVn0rPd9FK3y
         IEzCXnKS43LFRnL3W3M5gOiY45ENsyOUu0DSl+KRwvoh+PsSxfUSW4zBFIHviJ8hkB9c
         Q+bg==
X-Gm-Message-State: AOJu0Yy68tBk3SaDbXAZHn/FbbTZ+QzyPkoOWXRH5L1ObDDwn1FvW/AY
	fka6XUzCQCC07AeDwtFpZi31KJStTbtbxLBWYhkoJkbi0uCGJ5yb/SRVi4RU8g==
X-Gm-Gg: AY/fxX6rqaOXR+qUX37q7cggzWE9v36YkIrPGCH0oSplbqBO680PCuLE0xrNnPWwEQF
	cpV7oKMkMdu+wkGTMGiOEyYZsBe/qS9e57hO7xxioRLXxVPm4y1qezABLajpQ0CdekSZeFvY4TO
	4huc/f5e76SPI427r+f+sY9QDvcfa66xcF3GtNVTjSL4OlEcNLaVO7fkJgbsw5/wF0Hc63xr1Ig
	Qg8f4vOzjPc+vGK2I8a1WpofUBm82jz954ykhnBAvGWL9vkXaQx68y29Im/r3e8HE1sceHyHDIe
	zqEz3wzbXr5gQADz6LM9Il7XnCN3xNmwd44/n6TIM/kgxSqylnAE56sl31J6bHIx8RmHkMHEVou
	1xNxnbN8BOAhH20fo1HaKN9LhWXe4oNFPWMJ0keD7xZOwinn3qYjD5+UNNGYvjGizQvOsxJVH7D
	pMAuKbd0wK
X-Google-Smtp-Source: AGHT+IEtueJsz2j9uENf9BQFpBF+CH3keKbzfLT4/7O9oOTu4Mjj2k+fhes8uWJ6Jgm9BKF8h53OkA==
X-Received: by 2002:a05:600c:83c7:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d84b52e31mr64694495e9.36.1767869622706;
        Thu, 08 Jan 2026 02:53:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 04/15] imagemagick: patch CVE-2025-53015
Date: Thu,  8 Jan 2026 11:53:06 +0100
Message-ID: <20260108105317.460246-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123258

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53015

Backport the patches marked as a solution at the bottom of the relevant
github advisory[1].

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vmhh-8rxq-fp9g

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-53015.patch          | 51 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
new file mode 100644
index 0000000000..26ab56ebab
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-53015.patch
@@ -0,0 +1,51 @@
+From dee67b151cf3f25bde758d1fac9a42626715b3e5 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 2 May 2025 18:33:17 +0200
+Subject: [PATCH] Added extra checks to make sure we don't get stuck in the
+ while loop.
+
+Added missing return.
+
+CVE: CVE-2025-53015
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/229fa96a988a21d78318bbca61245a6ed1ee33a0 and https://github.com/ImageMagick/ImageMagick/commit/38631605e6ab744548a561797472cf8648bcfe26]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image-private.h |  1 +
+ MagickCore/profile.c       | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index 4ce71c32c..11dca1072 100644
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
+index 7eea1d32f..a68e54f14 100644
+--- a/MagickCore/profile.c
++++ b/MagickCore/profile.c
+@@ -2571,6 +2571,18 @@ static void GetXmpNumeratorAndDenominator(double value,
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
++      return;
++    }
+   *numerator=1;
+   df=1.0;
+   while(fabs(df - value) > MagickEpsilon)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index cc77468731..47ab5ead4c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -13,6 +13,7 @@ BASE_PV := "${PV}"
 PV .= "-47"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
            file://CVE-2025-53014.patch \
+           file://CVE-2025-53015.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

