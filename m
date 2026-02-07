Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0124BEE0AC3
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2670.1770460443080016574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXLJKYtB;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so44653635e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460441; x=1771065241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bfKLCWJpPfeVrR5hOx9NT+dhIEP+a56Mv88loEaXfQ=;
        b=YXLJKYtBds+zmcY7erESzcZoLom4EepZu78zpXBsHH+HQJGPOUJKmzFqY2K1/kdJPl
         XKkIlVc5Y9Hw4fMAk7ILXiaWra+gYTX8UVFVi/3PlBxVXLH1huifXGsq3I5jTP7CYdbx
         SxH8ad+mLZZ5fVKpcTkj6BElnTHacgrDQdJLrjFNZM8bhPDQn6aSSO0AarXoYT9za3d4
         YzpbJznn30UAJ/rYnVba/jzK+VmR99RA375EdWy9ow1Ogw1SgXdA5FVPZd0m1obI+cKC
         bWr5nEEnu1hWs+H9zgSWOSTAIWFW8e5YKwJ9KkN5nqkJLhDGqzOm1/gKuKLLjd0jGrPM
         C69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460441; x=1771065241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bfKLCWJpPfeVrR5hOx9NT+dhIEP+a56Mv88loEaXfQ=;
        b=hiJwjhV/kdF04fs7QY+bRUzzI4jqZSRJkxatqB/fSvVEXtaqt4niC/HagU9FH13s8X
         TjXYLaDkpYySjVBYtoKGomP4D8b3O97N9Piv82y8uGCemimuIgZ8CHIj8cFU6leqTrFg
         cUWYAfvn458zdIS/Wg5d8RnZcrE2jQqSGhDodhqF+SF5p3UnHybjTFngS57xzMyRoBCr
         9sszCrO0KK1X+SwK5TEr3vGiMaWHX90LKvFGTfPyUNaXzRwTVv26Kj+d1Lx6EtHameu6
         pXMZm30Sqw+kz7JI7GYmUr+xI3CAShAmj1a3BuQRNvy8Jvs0GhmiqLl9M+Y28vhBw0YO
         5GlA==
X-Gm-Message-State: AOJu0YwP2AiLqgbsxNClhmgmq7itNGn8FMP/ZGRidKvsnCtV8/fmMrW+
	p5MRn8395qu1w7zUtVFyAcn+FmIwJvvCzqjSNBqidw6Kt8vnjTVWumOpRGMOkA==
X-Gm-Gg: AZuq6aKx9+D/NmWsfMyBPvpg15Zr0H1pkDrO0G8EqVp8UX3Fs4IbG3EHTzhMa4u0LEc
	/20KFPjRlB90DSeOETjFxXbjPUgk5EsI0DqULgtTX+QqAK1csuLitlMXGPcsttVZPNeAaeHimsX
	AXDPUkyNncSte2KLkwgU4ffgLEtiiVr86s0T69pmY/3UHSyyXNYs5toSe4rzDG+nz7NQqVW0roi
	qABcmkwBJfQRpSqdYB8/VCTrwHW9M63IWJwdDg6P0fthRboxGwPjTqp50PsWFUCsIrDgFGkOUCH
	8WM4pBV+gL4UkNnorgnSB5G+qqWx3JKlDCAkBpPcu+l5ALfGwYJGcSgxp4mXLld8/knoVGiPwkT
	ZUo5KseJM6nac5ffVKur0B2auhFMP0Le5URWr90FNvfj3asBmgeboZxEb4w4MiVmHXsL32OZdzn
	btsppMuyKx
X-Received: by 2002:a05:600c:6217:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-483202310a5mr75726075e9.19.1770460441082;
        Sat, 07 Feb 2026 02:34:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 01/15] imagemagick: patch CVE-2025-66628
Date: Sat,  7 Feb 2026 11:33:43 +0100
Message-ID: <20260207103359.4177243-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124242

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-66628

Pick the patch that refers to the relevant github advisory[1]
explicitly in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hjr-v6g4-3fm8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-66628.patch          | 27 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
new file mode 100644
index 0000000000..7894d12ab6
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-66628.patch
@@ -0,0 +1,27 @@
+From 3853a72088f6a72fe3d7405655d8f9cbed605e75 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Tue, 2 Dec 2025 22:49:12 +0100
+Subject: [PATCH] Added extra check to avoid an overflow on 32-bit machines
+ (GHSA-6hjr-v6g4-3fm8)
+
+CVE: CVE-2025-66628
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/bdae0681ad1e572defe62df85834218f01e6d670]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/tim.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/coders/tim.c b/coders/tim.c
+index 4c094ac5f..fcfd9266f 100644
+--- a/coders/tim.c
++++ b/coders/tim.c
+@@ -231,7 +231,8 @@ static Image *ReadTIMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+     (void) ReadBlobLSBShort(image);
+     width=ReadBlobLSBShort(image);
+     height=ReadBlobLSBShort(image);
+-    image_size=2*width*height;
++    if (HeapOverflowSanityCheckGetSize(2*width,height,&image_size) != MagickFalse)
++      ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (image_size > GetBlobSize(image))
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
+     bytes_per_line=width*2;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 99632967c2..40e57b7f1d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-57807.patch \
            file://CVE-2025-62171.patch \
            file://CVE-2025-65955.patch \
+           file://CVE-2025-66628.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

