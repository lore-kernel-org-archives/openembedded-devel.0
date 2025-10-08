Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE79CCD184
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.2601.1759957157297294567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/oEU2eO;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b463f986f80so48209366b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957156; x=1760561956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FG5EXsQxA19HcClJeYuTG7Vt5NFWyu/DdusSdeCw+BU=;
        b=Y/oEU2eOKLzz07pFcL5/EkkzzghL+MoTV9IBskoKdvgBTIStkw5Wo+g7FvFpu2G6Z6
         yUQhh5fmnbYGObgJ39ZaPQq1KpyFveFYv3VahjlpL9MkEMwOkug6mBR1qzmv+6AYj1h/
         nHKI1Wi2uCK6kX1eed3/vUHq47rp+uI9vSVGFP1V+ru7zEhqRxINzPBRSx1+DUdCiPC0
         vz17ONJu/qoERqdf8x386mVKNC/actCqHnWtFqkZ7hX9WAV2GeScuCPr9t/sHrlpua1J
         WkdZkVvCh/lSxzwjiuzOaTxOfb+CrYWw31TGngXs9VKcAFkqLQ/PPCGTYegATIC1f3+g
         iNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957156; x=1760561956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FG5EXsQxA19HcClJeYuTG7Vt5NFWyu/DdusSdeCw+BU=;
        b=N2BmS2Flf5Ckay5OLkVqJlW/Gtbe+StSfQBLcgB30iad1JiPGCl2Sbp1W8HRP0CWE5
         CPeqgRHUIUY8LRKYvCFF0zoJfvorVQN6w8eJr41cB2qozzLucNlLzV58FK59TgP7InJX
         OaiTrTQFb5I/XXymbR/QgOfvsSV9Odsw9uNjtn0emIrFcS7vcgbTjIJ7zls/RFCQ5o4b
         nLGCIBIwOR0Szq37HFwV2l8HOzSnFAli2bdXE7MT6ht5OM+kdRnAuzCDW8a/Q8+V8fRy
         WaRYPpzcyFOvbGcY/owZHmCjh705/JYD+4h2iH3T6EhCnlkpi0w1rffi5mostTjjXEta
         VMdQ==
X-Gm-Message-State: AOJu0YwkldpRXyei8R8Q6hWqATYyKDaEAI34sRojTJpn748ty1hiqghE
	2VEUoWcO+8eZBbj7ZlKMM1kTvbo/ZftJTrIoY79zKvHzl3EqkP4nDmHNK8pKl/dO
X-Gm-Gg: ASbGncuxS06Gy46j2deTVcpMpdoiFna5gc02oJJ4JrqOCQaR00suhsdOgddh8Gu+Iqe
	UuStgKotlW2vWIelAGVafjEWf2whvUJgmL4zJP/+RXuskjK3/iNBo5SE1fOj1kU09x8sMScrpKK
	Gf3/Z/tYu3onYNln3kLJMkfK6Fo7faK68mYls1S0A8enycwo/os/OoLZohwA+YOhdV3zv95GjIA
	nQ0UAeSFhevrnLEpECMGUtlaO4O4hAPh0Rh+pTE+PACAeusxjuZJ5dHjA0Qak407kAlneWF1a23
	FGZEcKs6OuDCmUJdfjz3japLDZpisSxeQYQYPw9BMmU2xqw4riSJ4KirUJpUZbpYrKsVd3QsH16
	c0NVpKzNl0ahKu1OOrYS2MIX51UI0/BsXPiXe15mch0VX
X-Google-Smtp-Source: AGHT+IG7AQBxvqb9eay2wFMilzvj81nbvbnddrg+8FeWRR6iP6BzMsKwXGbCtrh3L1yfjWBzwwZYfA==
X-Received: by 2002:a17:906:6a14:b0:b3a:7af8:c4a2 with SMTP id a640c23a62f3a-b50a9c5df86mr573806366b.10.1759957155461;
        Wed, 08 Oct 2025 13:59:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 01/11] imagemagick: patch CVE-2025-53014
Date: Wed,  8 Oct 2025 22:59:04 +0200
Message-ID: <20251008205914.598660-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120384

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53014

Pick the patch mentioned in the related Github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-out-of-bounds-read-of-a-single-byte.patch | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-Correct-out-of-bounds-read-of-a-single-byte.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-Correct-out-of-bounds-read-of-a-single-byte.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Correct-out-of-bounds-read-of-a-single-byte.patch
new file mode 100644
index 0000000000..c7efd155b8
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-Correct-out-of-bounds-read-of-a-single-byte.patch
@@ -0,0 +1,25 @@
+From 702a3003f5bcf76ea73d69f4cf8a24da2ef97a4a Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Thu, 26 Jun 2025 23:01:07 +0200
+Subject: [PATCH] Correct out of bounds read of a single byte.
+
+CVE: CVE-2025-53014
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/29d82726c7ec20c07c49ba263bdcea16c2618e03]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/image.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 39d302875..03a5972d0 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1678,7 +1678,7 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+     q=(char *) p+1;
+     if (*q == '%')
+       {
+-        p=q+1;
++        p++;
+         continue;
+       }
+     field_width=0;
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index a892a55844..56f60716ba 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -12,7 +12,9 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 BASE_PV = "${@d.getVar('PV').split('-')[0]}"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+           file://0001-Correct-out-of-bounds-read-of-a-single-byte.patch \
+           "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 
 S = "${WORKDIR}/git"

