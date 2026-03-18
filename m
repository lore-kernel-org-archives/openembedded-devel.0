Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D4510854D9
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9877.1773824985695425438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NH1o5ikF;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7382963b67so368780a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824985; x=1774429785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAVzRmgkFRGIl65vz6d+C1H85YHlGG3WapmGalx7+4M=;
        b=NH1o5ikFvNS1fLYCfxaDILUGracYzZDQzGY/h5a8tpjJyB9GAvRRHl1l/YY74qTBwq
         6wX/IEmgu/O6eGDQXzO6/ODj86gOa39pJec5wKE1HyYsLL+Rcx5m24gmr7t0RPCzqz97
         foDXpxJiDF9Ma/ZjBpKsWHV0NoIntER80NHGJPkxltNNIO2b/LTVSlttekM0c+Jx5pOL
         OW/ofIlOZdNXgmAP6p3+XJkVTEmVxWVeKvZFqS7RyJkk7qGoUMTnVaYqdGCM5Fbf5DFH
         EwL7+8yaRtyCOevmoly/WfQmGpgX0alXrN9q+Ql9R7tFQuOwLSeUt1TWySXen8Ds8sc7
         TqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824985; x=1774429785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAVzRmgkFRGIl65vz6d+C1H85YHlGG3WapmGalx7+4M=;
        b=fXWfNatOJHoH8mEAYTl6YY+27UkEem/OjQrrK5VYu0FwH+ttqmtadrfoa8142HDCp+
         RNNhhv4NnLr6YGJ+Vzt9mUNvfmRGfcVFfQMmCyakYYWEoKDiF6SCLP+BEJTlairgUXQs
         pXyhNwv62AnfipQpW5xz2oQ/w/vEW/sWieuNv8k0V0eTUZt491Vrqeh9lI6VwczepeQO
         vk6mM7vcDllLQd5nhkPjsF2PvaY9koI5Cv8jDxA2zbQfbKltAEzpmbsnQS9p6AL42J35
         uzFsMSIZBObNgU3lepco4MuO6GPa93o+8gD+oxpLYqBKfT4FlHvQ8xungz2SEyKw1Rec
         a83A==
X-Gm-Message-State: AOJu0YwPb/P2VoISwIwScG/6z5a7W/alsj0y+VSO+hzrnG7mxTppp1iw
	q+kS3XowQN8+tekCrGtIZ54g/nQ/1T26TAqjo9Dosdg+0e8eFT78ew4ZtEU4Zg==
X-Gm-Gg: ATEYQzzu5ZeZ40JvzNrsikP7y6mo1H6ENdZKBo7W31+7ayG0m/uq2DIAAQK77OvYnjU
	NuUdKhPvSDRXbNj2G+k7l6uI/Z6bPomeZZELAwm+s54Tfd8P2Y3qy1YnHHj4gyO+b8q7Dqr885a
	381sFrwDPQwjtiPvAqcSOlxUO78PlqC9H1qUMKZJJIO6rcYXEmrFLrCO8T8kgclfJHfNZCCh8kT
	kQaM4rX63rg/Bk8M4GguB2/px9TkImn3KFLBAfJfQNMHqOrK4RbN26l8xqZRuP+iQ6pQVj6W9I8
	TH5g2c/DmWZdtpXBqlvRj5dElRf9jmfGsigHflQ0mCjGwRLFZNU37YftHSni2iXTlerVa6BmNT6
	ExAZsUkloj5viLwpt0JHTbKWIyKHjc6C9px3rdAs6Zb1P9NgFdua0TS+7IF/mgaFcOVVkYTGZAB
	iUA1h79+oq3WPPfel8VhMI1XaSTBsupzmuYkFJZUb1Kxg=
X-Received: by 2002:a05:6a00:2eaa:b0:823:1077:2e88 with SMTP id d2e1a72fcca58-82a6aee61f9mr1699957b3a.6.1773824984517;
        Wed, 18 Mar 2026 02:09:44 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:44 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 6/6] imagemagick: Fix CVE-2026-23876
Date: Wed, 18 Mar 2026 14:43:38 +0530
Message-Id: <20260318091338.483937-6-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
References: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125359

Reference: https://github.com/ImageMagick/ImageMagick/commit/2fae24192b78fdfdd27d766fd21d90aeac6ea8b8

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2026-23876.patch    | 63 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch
new file mode 100644
index 0000000000..40d82c9481
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2026-23876.patch
@@ -0,0 +1,63 @@
+From 2fae24192b78fdfdd27d766fd21d90aeac6ea8b8 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 18 Jan 2026 17:54:12 +0100
+
+Subject: [PATCH] imagemagick: Fix CVE-2026-23876
+CVE: CVE-2026-23876
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2fae24192b78fdfdd27d766fd21d90aeac6ea8b8]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/coders/xbm.c b/coders/xbm.c
+index b036d5e..2d6bc9c 100644
+--- a/coders/xbm.c
++++ b/coders/xbm.c
+@@ -200,6 +200,10 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   short int
+     hex_digits[256];
+ 
++  size_t
++    bytes_per_line,
++    length;
++
+   ssize_t
+     y;
+ 
+@@ -209,8 +213,6 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   unsigned int
+     bit,
+     byte,
+-    bytes_per_line,
+-    length,
+     padding,
+     version;
+ 
+@@ -340,15 +342,15 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   if (((image->columns % 16) != 0) && ((image->columns % 16) < 9) &&
+       (version == 10))
+     padding=1;
+-  bytes_per_line=(unsigned int) (image->columns+7)/8+padding;
+-  length=(unsigned int) image->rows;
+-  data=(unsigned char *) AcquireQuantumMemory(length,bytes_per_line*
+-    sizeof(*data));
++  bytes_per_line=(image->columns+7)/8+padding;
++  if (HeapOverflowSanityCheckGetSize(bytes_per_line,image->rows,&length) != MagickFalse)
++    ThrowReaderException(CorruptImageError,"ImproperImageHeader");
++  data=(unsigned char *) AcquireQuantumMemory(length,sizeof(*data));
+   if (data == (unsigned char *) NULL)
+     ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+   p=data;
+   if (version == 10)
+-    for (i=0; i < (ssize_t) (bytes_per_line*image->rows); (i+=2))
++    for (i=0; i < (ssize_t) length; i+=2)
+     {
+       c=XBMInteger(image,hex_digits);
+       if (c < 0)
+@@ -361,7 +363,7 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+         *p++=(unsigned char) (c >> 8);
+     }
+   else
+-    for (i=0; i < (ssize_t) (bytes_per_line*image->rows); i++)
++    for (i=0; i < (ssize_t) length; i++)
+     {
+       c=XBMInteger(image,hex_digits);
+       if (c < 0)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index a2e08afc1a..9bc857b715 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -53,6 +53,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2025-68618.patch \
     file://CVE-2026-22770.patch \
     file://CVE-2026-23874.patch \
+    file://CVE-2026-23876.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


