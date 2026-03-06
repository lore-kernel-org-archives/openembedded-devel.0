Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45866FCB60B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70991.1772809570090104015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhYqxvKf;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so73949085e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809568; x=1773414368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4AIXI2RPhQI+YtD/G/ANsOEkyD86DkXaeiqtiHVYJY=;
        b=MhYqxvKfqb1AkqtTntjDal6aE128HQ7/1xoxBaPJsFfIeIIXczEJzCNDLckotzn7Bp
         Ln9QB2pauwQQ4u14AmePCMVHfBf5z6wdPKUOOO1HKH904yEL+F97VoNncx+2kkx9V4Jv
         KArIiEZwomW2FKmsBdeGZkkv06h6HVS3B5uIOIpKUIqLsYZl2zgrEY57y5IOiKTskN7i
         yx0b1TOLVkx9/FbsJiXhuYl8AVepH3/eLl7wTq5G5be5fdZEEcMopqZ9RlQhF7xvcVOx
         2ZA0Yggty8OtNOnXcXvZ9wJ7tJhgw2s0A4sGiWQ8Fd7wr3qVpf9Ti9uoTqxPmuv1xsuw
         7Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809568; x=1773414368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j4AIXI2RPhQI+YtD/G/ANsOEkyD86DkXaeiqtiHVYJY=;
        b=YotIuoOH1iInC9Zj4/saBuzxwJ2GUV5INe7j92+Cwz8YRLwufYna0iiCIfNtpZ+Z8X
         8pmhVJzfcvjdB1x8WHAOWH0ODE0DLw+hRBdLbx0t7XOIB5dsvZJw84GzNVMFkSMg4Q6n
         OMq7rqeo8yWa2qyGBZnY8C0O0+7l3FwyHdORtiJglZlWrGQR9hXRBrIJjlbKOSZgkTc8
         Ov0luduXvJ6JobVzix+pVz7I6BNn4bdB9AwpseGO0P1bQe0YJBw7zDZznwytJTOvjg5J
         FwaJyPEDsx/7S+nbpQ33C4ZUUVkv2Bv6t4yIWNV8Dsdn3506WbZas21zduotJ0ee22zH
         Vg0g==
X-Gm-Message-State: AOJu0YxrNIkFzmQ5dADgNojVorK/bPeDQDgws9wzE4a2X6wPJnlrOViL
	NeGUJlCz3Ua0vvZJLZSKVcuYHn9VYkzDiIaUcTOeOuIVNqM5bMQEn2UpTN676A==
X-Gm-Gg: ATEYQzx0BKIMnoUCvlw+t0GM/8Nw3+7LsXsuiF4aygp7TuHD0Ym/SkVf0uH2dV3MrlB
	Cfyw4AwBxEQdK4X18RXLdlaGgMPN/X8pqkAG4S9UK5WdYaojQ7EpJ/t1f4zq5pM7TKtrCL819p5
	KyHpLsMy+G2jM5TKhg7XX0MNepIqTs9D9Bx6Fcnrw+S0/HQP+iSVTE3GuWkZaKWIXaoh+XrqOmB
	Qd6O+lxCd+agugxbx5Wu8VMGM22/RhvFSVXNuPRG3DRkxqaNV6ah4Z+oDd1wWvJUhXBz7viLzDP
	4rR8QNJ+Dy/dFRsXBXNCq9nz+TzNDBi5vqMXK3CzJi8DUMcAB/nURsrG85skC2VWUkSdmbXVhaL
	v+KRepikcb2yovTx8If6ZMQeG+suZeOcGvwbnv8X9WAW/wGKeCYpp2olEmqQdp53bC/pR/vEbya
	7QWnEEak4f5pOfNPGZc3oa
X-Received: by 2002:a05:600c:500d:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48526968008mr38368155e9.29.1772809568282;
        Fri, 06 Mar 2026 07:06:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 07/11] imagemagick: patch CVE-2026-25794
Date: Fri,  6 Mar 2026 16:05:58 +0100
Message-ID: <20260306150602.616834-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124911

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25794

Backport the patch that references the relevant Github advisory[1]
in its commit message explicitly.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5cj-9x8h

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25794.patch          | 54 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
new file mode 100644
index 0000000000..8eb9f14d57
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
@@ -0,0 +1,54 @@
+From c4f271dbcbe543b3395f83a1b5416927500c2aa4 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:03:53 +0100
+Subject: [PATCH] Prevent out of bounds heap write in uhdr encoder
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5cj-9x8h)
+
+CVE: CVE-2026-25794
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/uhdr.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/coders/uhdr.c b/coders/uhdr.c
+index fc436595e..101d6a90f 100644
+--- a/coders/uhdr.c
++++ b/coders/uhdr.c
+@@ -618,20 +618,28 @@ static MagickBooleanType WriteUHDRImage(const ImageInfo *image_info,
+   {
+     /* Classify image as hdr/sdr intent basing on depth */
+     int
+-      bpp = image->depth >= hdrIntentMinDepth ? 2 : 1;
+-
+-    int
+-      aligned_width = image->columns + (image->columns & 1);
+-
+-    int
+-      aligned_height = image->rows + (image->rows & 1);
++      bpp;
+ 
+     ssize_t
+-      picSize = aligned_width * aligned_height * bpp * 1.5 /* 2x2 sub-sampling */;
++      aligned_height,
++      aligned_width;
++
++    size_t
++      picSize;
+ 
+     void
+       *crBuffer = NULL, *cbBuffer = NULL, *yBuffer = NULL;
+ 
++    if (((double) image->columns > sqrt(MAGICK_SSIZE_MAX/3.0)) ||
++        ((double) image->rows > sqrt(MAGICK_SSIZE_MAX/3.0)))
++      {
++        (void) ThrowMagickException(exception,GetMagickModule(),ImageError,
++          "WidthOrHeightExceedsLimit","%s",image->filename);
++        goto next_image;
++    }
++    bpp = image->depth >= hdrIntentMinDepth ? 2 : 1;
++    aligned_width = image->columns + (image->columns & 1);
++    picSize = aligned_width * aligned_height * bpp * 1.5 /* 2x2 sub-sampling */;
+     if (IssRGBCompatibleColorspace(image->colorspace) && !IsGrayColorspace(image->colorspace))
+     {
+       if (image->depth >= hdrIntentMinDepth && hdr_ct == UHDR_CT_LINEAR)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 4b5a7fbb14..ab73da952c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-25576.patch \
            file://CVE-2026-25637.patch \
            file://CVE-2026-25638.patch \
+           file://CVE-2026-25794.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

