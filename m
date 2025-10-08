Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9295CCCD18A
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2606.1759957164223725015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVCGwljI;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso513504a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957162; x=1760561962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e474LXv3NFUpa1mVCfuQES46zze1emlzUsMkNHqlIuI=;
        b=fVCGwljITA2YAZ/t+dn9/w0h+FZdhwfTLG/wIOvBjOML0intuDFv2XELP6oyj7Kxwp
         45gr3hJuLwcfCUOs+e74VH9Icq0i1iBSOLrXmya8SVr9qOeI2/zNnOoEkr7B545mgfrW
         1Imt9T0ik7Gk4oGB6Z/jCMErOhCC07LWUMU1JQaa8MZruge39kAmflmGuvV+I2tbqtkx
         wtc2u/hyLbPxkxpgjvqdKnw5LCCiKqeSAMr2DfBPq6W5yDv19fIxPVh4QbZQV0GsPQXM
         RS73vTE0NsbxqRvYNNnh41kgM/6mhsfkUgSuqTVTzkrc0KFrCeykcK9YPI8HNZmUtyiz
         z6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957162; x=1760561962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e474LXv3NFUpa1mVCfuQES46zze1emlzUsMkNHqlIuI=;
        b=grcnEI6/k3uGGUYPAkkG9M75tLkTASamibtvJHwP8CwJFzrjDLghrgZKB8+/8qNVJA
         rJL3m5VuGsJAC5puamH/mT6l1ILi7OHm6GQ2tDyRwPQToSClvFW0iGattzOmTgHJ9rL6
         FpwZeKST2FYyBHQ5AxTw2/lA6lArBWuQxlUH7kOAczMleBhF2w0wi0rGW4oyjLQrsJwn
         YCtFi9aONHdepQWC98Z43KkW4nZp5yZuqsOfcDvetorvymUb753kdHbAKEK/4HOcaceA
         25UtdFE5kxGfnj1UNd019uTj+rm74GIzoWd8J7YVQWO3ec88e8yHYImAu/CqMestZlOR
         0TRA==
X-Gm-Message-State: AOJu0Yz4ceHJUqeuSO7SpsEQ7QZInxaH2zZgsC3adnvH6/7/Un4qlezQ
	EkSwIlMs6QcUVpUIFGn9gHgnMWke2VH92/tFWhrmZ1LoNx8Wf3VXZjYWcKgSWMdZ
X-Gm-Gg: ASbGncscJxuoZ9/t01p/bREB2bCe6IaUbptTNW6nxP8TxTlDtokTczml2Mw//CPI79U
	TwUwzaPuirllmRuVS3LsvFUbOFzygENkrkl4lZC7p4ko6niBy72IlYhOrYxnB5URNerlh4bAhH1
	vjxsMlVUblV5MA20KylTgrk1tJRWFF32iKsskc5s/v/2Z1CRzLYqTUpHA8vVuqoT8X2XPmL5jER
	+nyDYg9eEdrXNOrtgdXGL2HIgRk/icfnZOIYGFeFcBViDFd/BpcJCYMtSbDwXjsmuiS2XoJ257y
	btGdiWlPnL8Rgvm7Log3lsbNnk5OwbTteYFde6NSDYPMPlEieLL0DtjSr3hhEJGNHYapkcaYfFS
	TtA6oz5c6feqrOmMfZzcip21EOJIcRcR4fDanfVYd8Jat
X-Google-Smtp-Source: AGHT+IF64sydwvBc53Z1eqvri5NTZAsxEd3WE59vTDTA6DwOvRiDr4MZkue1QNJuKaylwYsZolnuhA==
X-Received: by 2002:a17:907:db15:b0:b3d:b251:cded with SMTP id a640c23a62f3a-b50aa393ba1mr621702366b.16.1759957162508;
        Wed, 08 Oct 2025 13:59:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 11/11] imagemagick: patch CVE-2025-57807
Date: Wed,  8 Oct 2025 22:59:14 +0200
Message-ID: <20251008205914.598660-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120394

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57807

Pick the commit mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-57807.patch     | 46 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57807.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57807.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57807.patch
new file mode 100644
index 0000000000..6178e31e1c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57807.patch
@@ -0,0 +1,46 @@
+From f8e4069153330021aefa6fc7c6c09df2444de021 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 24 Aug 2025 12:32:18 -0400
+Subject: [PATCH] CVE-2025-57807
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-23hg-53q6-hqfg
+
+CVE: CVE-2025-57807
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/077a417a19a5ea8c85559b602754a5b928eef23e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/blob.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/MagickCore/blob.c b/MagickCore/blob.c
+index d00b0ac57..5ee81a68b 100644
+--- a/MagickCore/blob.c
++++ b/MagickCore/blob.c
+@@ -1630,7 +1630,7 @@ static inline ssize_t WriteBlobStream(Image *image,const size_t length,
+   extent=(MagickSizeType) (blob_info->offset+(MagickOffsetType) length);
+   if (extent >= blob_info->extent)
+     {
+-      extent=blob_info->extent+blob_info->quantum+length;
++      extent+=blob_info->quantum+length;
+       blob_info->quantum<<=1;
+       if (SetBlobExtent(image,extent) == MagickFalse)
+         return(0);
+@@ -5912,12 +5912,15 @@ MagickExport ssize_t WriteBlob(Image *image,const size_t length,
+     }
+     case BlobStream:
+     {
+-      if ((blob_info->offset+(MagickOffsetType) length) >=
+-          (MagickOffsetType) blob_info->extent)
++      MagickSizeType
++        extent;
++
++      extent=(MagickSizeType) (blob_info->offset+(MagickOffsetType) length);
++      if (extent >= blob_info->extent)
+         {
+           if (blob_info->mapped != MagickFalse)
+             return(0);
+-          blob_info->extent+=length+blob_info->quantum;
++          blob_info->extent=extent+blob_info->quantum+length;
+           blob_info->quantum<<=1;
+           blob_info->data=(unsigned char *) ResizeQuantumMemory(
+             blob_info->data,blob_info->extent+1,sizeof(*blob_info->data));
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 8f6e816060..6e101f061f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-CVE-2025-55160.patch \
            file://0001-CVE-2025-55212.patch \
            file://0001-CVE-2025-57803.patch \
+           file://0001-CVE-2025-57807.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

