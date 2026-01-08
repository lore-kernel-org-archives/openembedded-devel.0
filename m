Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF55D185D3
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4008.1767869652382842303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3DEMFLj;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso16559155e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869651; x=1768474451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRDu7GM5+WekuQTT/gUsA2J6HKvWWh/nZu1zHrbsEDY=;
        b=I3DEMFLjRLgZOPo00cMeXYxx+beG1yFDKbCEEaZWvHB/WEUHUbb/8LH/0I017MFWSs
         ca9HCTEtlAka60SmmpZ5ofW1Dn0vccD+/FwMrIkHDEDDp8pDzMSmlS/cf9F2v8I0cteo
         2R+tiiH1CYav6INQEp9zTF5SuquGjoaIzC2n60WtRGZROt8P55iBdFGB2Y3uukXyg87h
         cQr4k2o93DGOvK4v91vi43CDsj7lJmAYv6GByQkE7Z5pOrV49DIGGwiMY7CgaTexWPrQ
         sVY0lpybGs/LcKnvTgLZLFibH79hylFCSZpbtuXCHfJx+VqkpSryQBNG/3F7TzHoW9+9
         PIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869651; x=1768474451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRDu7GM5+WekuQTT/gUsA2J6HKvWWh/nZu1zHrbsEDY=;
        b=k5KTAzqY9H1ghWaeVy9qZ8HOnuly/n4OEy3AGGmXuCo7Q+d6XPMVcZSWbuyy3+0VjX
         Sjn3lLVc6p3pq4HQbYoadryGC34AcIS+NosPz/cBvvv4TYdasAi/a0IN0vON1bCn/hwR
         Tdfbi/0H7YW0RrRtZzHVmvG6/k0OHetrh4jX7Rh9IUTWSjTwg8mNbVwiOmagu/nrjy0E
         7SJSXiEV6X0rOORYwN1anQsOtfCiDMIzMfaVUYbFqIEeaV9uSuEDM7+/yiB5K2xWAQTO
         jS8U7+8tP1bJzsot08QHuPG6qUL7PDQVTJSFw1E6u/T5krLk5vZ3yn27NAlGw6Kf1btd
         a4fw==
X-Gm-Message-State: AOJu0Yy6cguBx2zVilMs2xEWtbjkqRbR3Ls6txEhhDax62gH7eJWH1Er
	pu7e+bRHwhBxKmaYWsiLm0BrsmlaK0AXPJoRr7L9DLC89j3Io1KPYd0PaojRrw==
X-Gm-Gg: AY/fxX4TzkyMvtqlWfNJHS+nwhnvNiIEQxSZgsF3ZSPDm5HA7N6tvdDh13sIH+s0vBm
	ZkACciaNtyF7S1g8JG1QjOuhXmDt36I7xDlatXBfgW1dQgirynzEfqILKQIfoL+B+gvXNjXU6s3
	jkK7tRWlHW8uZh4wmM+ZB77GvqHY/W+GfrEp+ME4xrgG1KonmBQWwzkd75e7lcvMWMlokBE7cfS
	aTQ949IE+xn2s6SO3Zpi0BX2+elXzs+ZFeA4t2lS4PWcjD2eKQsrOBWmBJStM3vBJjZqiabX0kw
	2aeWu/6Go2oRa6ioHu2o5V7hakXiSp77RVDcGFWNu4q+iV+Q67jwrJs0o0dMah8bR31q7rVKk07
	ECF3DBocNUvkT73t0BhoXH2xSzB33blHaag72BXAiQu42aCkU74gAm22RRywXPYVA6lZ2gu84Yp
	FqBQ0wGThT
X-Google-Smtp-Source: AGHT+IF3CBA3xBSyvxj45RtbR12MIS6DY/FxsbH/7W6vNvBEsjU+eD0Y8e6/ePIrMuQXJ1CS7IdS1Q==
X-Received: by 2002:a05:600c:3b05:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-47d84877e51mr72766305e9.13.1767869650698;
        Thu, 08 Jan 2026 02:54:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 11/15] imagemagick: patch CVE-2025-55212
Date: Thu,  8 Jan 2026 11:53:13 +0100
Message-ID: <20260108105317.460246-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123265

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55212

Backport the patch that is mentioned in the NVD advisory.

Notes about the backport:
The original patch deletes two extra lines compared to the backport:
those lines were a previous attempt[1] to solve the same vulnerability,
and the final patch reverted them. Since that patch wasn't part of the
recipe, those deletions were dropped from the backported patch.

The PerceptibleReciprocal function was renamed[2] to MagickSafeReciprocal
after the recipe's revision, but there were no functional changes
in the function's behavior.

[1]: https://github.com/ImageMagick/ImageMagick/commit/43d92bf855155e8e716ecbb50ed94c2ed41ff9f6
[2]: https://github.com/ImageMagick/ImageMagick/commit/7e5d87fe6e9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-55212.patch          | 29 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
new file mode 100644
index 0000000000..40a1b6fc4d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55212.patch
@@ -0,0 +1,29 @@
+From 3cc6cf85fbe2d147c7b3d48e53f4e9f081448ae8 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 17 Aug 2025 14:33:44 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fh55-q5pj-pxgw
+
+CVE: CVE-2025-55212
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/5f0bcf986b8b5e90567750d31a37af502b73f2af]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/resize.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/MagickCore/resize.c b/MagickCore/resize.c
+index ea6e535f4..298662f8a 100644
+--- a/MagickCore/resize.c
++++ b/MagickCore/resize.c
+@@ -4624,8 +4624,9 @@ MagickExport Image *ThumbnailImage(const Image *image,const size_t columns,
+         x_factor,
+         y_factor;
+ 
+-      x_factor=(ssize_t) image->columns/(ssize_t) columns;
+-      y_factor=(ssize_t) image->rows/(ssize_t) rows;
++      x_factor=(ssize_t) (image->columns*PerceptibleReciprocal((double) 
++        columns));
++      y_factor=(ssize_t) (image->rows*PerceptibleReciprocal((double) rows));
+       if ((x_factor > 4) && (y_factor > 4))
+         {
+           thumbnail_image=SampleImage(clone_image,4*columns,4*rows,exception);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 5e9561291c..b299f0d2b6 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-55005.patch \
            file://CVE-2025-55154.patch \
            file://CVE-2025-55160.patch \
+           file://CVE-2025-55212.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

