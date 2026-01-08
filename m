Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47169D185CC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4010.1767869661662529955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQPKIPEL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so22571605e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869660; x=1768474460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqnklwuLb2Qx5GAWKh5m65A/3PtD9H8oRBb5yUqlJ6g=;
        b=RQPKIPELF1r7xNy/CiAZAE9Tf3Cq3HIv0A3v2bevMDq54sM1iBYneYusYjJlqk7U+N
         40HNU4B/EaNr+znVwlhLRALsoZtSwZRgpDEJnXlD4/iT2ACowKtZ0WlEoqAzYVfux5C0
         fqjfjMP4CVlvZS4oUqdCm31dRWl3YTJCQXysDCr9+nI4KKZmbmMYNim5dxmK2ZEif4D6
         PHBwkbPx/9k35ft5KE5IZVJ8uoVar1eM2QNJsx57qVHD1XohGYd4TKLu7oI1hD+oQVsn
         2VDWwmIrqhH5QwGJ9JEPRLllnSNfnDC96TnepxZm+VvIZM2ZJoPYKJM5xqDASQP+Okxg
         lI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869660; x=1768474460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zqnklwuLb2Qx5GAWKh5m65A/3PtD9H8oRBb5yUqlJ6g=;
        b=RbU77M+CjC1nrLNNlPtmgp5d4oWrWOrEi8KWa9XYuPPh36wUiz5ryhT6mvrvECp5Hr
         VofAgOfl7KwOjsED24b5n8Wdlp4MXajzNi6pxiPhqS/bU/lep8c5aqUxH7kb93E30KoL
         KacFFvL1ftldU6OFQ+G0omIAUdco06mit5gANdid8PMTb/XpcFxIaAL9PRYAMeHvAKbo
         pehEj+upTwTBYvZvckSPxbkeXKZYPr4obKSYgGxykZ8sb9QVDogs2o0CGr4v9Bm0C6AX
         dd5JZvBRwy+A/skadRLFMCjt9IOaRC4bmCtPvJD8po+lhb3OatXeOhviSYu7jET71mpP
         Ak9w==
X-Gm-Message-State: AOJu0Yw8D6Quzn6Klf4ldPZ/yNZJTqN8w8vCQMFlpaf+3tsyfD4f70Az
	GsfFo9yh6bx34/Fk4WyC8rGzMRHw1dPGaq3OkLlt+6w6yCndZPhkCy/tlxM7Fg==
X-Gm-Gg: AY/fxX5QRULhBtV4TlfQmCxe/lI9BzdzcxZsVzlXE1p3sQJFXsTcEy0UBAgMuYEFg5y
	+RByDXCDRicSSNm+JD4s28e0am3jW4KyNgyQbBHFPiOWZHc7iktUzQk2V8CmA/M0cZ6nf2CasP/
	iD6wegdMU7psDMC+iHoUQdTdF7rwaUOTi5l4u+cJI4wTmfcwZQIEXmEa/wSfESOHWVvVgNMQXXF
	qQx8HBpsVYIWe9syTVPEDpjrfnskXVxZR9XnIjyT8pTLilWCzIM+MMg8z1SZF4h3Wmqtm9FxsKV
	ECUoz9zY+70R03EBJv7J7rATxcGAELgBwFE3FC5iHlP91M5/vTmBkyD4XdFWQJtQ5ul8w9ZBPBI
	fHyckkUmD1CLeSak+f9R5OBhnfX2VY8CCwzodUW7/jFHFrPlZARJX2/Vo43CU7d9TNPH9/COdqh
	g4hdRNdjWWsboyMTSIF58=
X-Google-Smtp-Source: AGHT+IEyVmwRHgYuC0nbXQMzM8TWKEmqNf47Jmp+rtYfxPxCd2QKYChDf80VDU7MJnQk8bRXbjGakA==
X-Received: by 2002:a05:600c:190e:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47d84b4099amr71060375e9.33.1767869659922;
        Thu, 08 Jan 2026 02:54:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 13/15] imagemagick: patch CVE-2025-57807
Date: Thu,  8 Jan 2026 11:53:15 +0100
Message-ID: <20260108105317.460246-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123267

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57807

Backport the patch that's mentioned in the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-57807.patch          | 45 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
new file mode 100644
index 0000000000..e3476e6c02
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57807.patch
@@ -0,0 +1,45 @@
+From c3c9b87cfde14c543c98aa2358da8d4e915715fd Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 24 Aug 2025 12:32:18 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-23hg-53q6-hqfg
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 14a9d1eefa..7e40784005 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-55160.patch \
            file://CVE-2025-55212.patch \
            file://CVE-2025-57803.patch \
+           file://CVE-2025-57807.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

