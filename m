Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5122EFCB611
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71236.1772809570612841314
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVERd1te;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837634de51so40782455e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809569; x=1773414369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl+iFb2O3oN4MN0XnYUGgswLpd5/P1b9CYYYPaiXGXg=;
        b=fVERd1tegWr5S/RX4bY6iCAOSwshTv6Gh3FXnPeTrvDzIsUB2IToQyxcBOd0OKL+T9
         1bNr/IPUNvAdIpFZOvpkgNLBdtCbtt0JXm4gPUtEA620RBZEz91uHM8axH2ky6asb6gh
         YdUok7lxRS2NYc5y0pNMBtrVMxa9WiePIZ+p+7xXgrACX9DVtiAoNX1W2SCbogV31xsx
         TyOp7rUFVijyLQVddQEloUUNrZ5kjMusD2OVo7XMn3HQ3hz5yvoPN/7EZA5XwAqqb8Lp
         Sxspj/x6OaPRYWiCKB1sLvg6fdJat1Qv/WZzRzrtfQzPqv7uHnw/WV0oZdyYnCZiy0JP
         gvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809569; x=1773414369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rl+iFb2O3oN4MN0XnYUGgswLpd5/P1b9CYYYPaiXGXg=;
        b=NHb4ltax61JdwSgypb7Jqn5MX/a5W4M+5B6Bi7zfhAMRFI7OHu6+gLUpzaMYEopsTH
         YX2+9gHCYXWt/fNpxlL8fuUdZsHLZnQmT2As4T0MqB1juTRh3CXKFBKhZMZdLruM8Rcc
         GZu8YAp/1UmCIWtN4Ftroi3H83uFpJHg8CD0VxOp6gal4Niy7zRuTLUgtTzcbmJ2UYvX
         DjgbppAfj0+3AmVBi8i+Qe8fZkWfH/TNtMyNVbRY6KHsN7tL0vWOvJQiB9gAL3rmvdXJ
         G1ZRG8wViaBicGw/DoDpVhCSToC5yMPL1NzYJBHRmNNhowIENpOB5zwEjCWDtEL5KCz1
         gtSw==
X-Gm-Message-State: AOJu0Yy5XqFMLr08BnNKUzSAU2MY1INlBnUxyPLbMqe16WN7iXwutb+y
	qOq0DV2d+fRCtqY1EbTdES5Npk022PkSPlVbCber0z1juWIJZu1tzB6YUFUN8A==
X-Gm-Gg: ATEYQzxtpDKni8BYrX8wWI3CbPHhtjdXb9kAfOAdEM7uwveZ5PKRDEN/+PNWBRMk/1y
	kb3kxg4D5PxVYL3Vbs1m5G106xF7hRQLi5nfAc5PHlC+13dlteAiw/p476e+l3U+i5rhNM7nd56
	+ZPEPiSIV0Ce6MU0KyWtUChQ1ecVVjjCd7oe/RgotDzzgPHNxSH53ubsiDIFCtBP+aO7rPcNsqU
	/W+hpkY+wGI3nyQP8IMc4koMbAfIYsTOgvi1+eNQ/rHmznKnwCwztTb8fMfVu3DzMtRtWVZedla
	kDRm9EKUeeueVYez7novgFS92B9rVIrJ/tP6TFaZec/pYSN9Ew47dKfgu9/8XX8I7dcqjvwB//a
	g6XkSKAZ9LXwi99oZ7Ctaf8EZvQGsS4l9pwTmBQSd8xDaD+EW6aEa+IQihBmBmnSLIXcWVFNcx/
	ZdnlPnnz4umZxF6j0rUri+Nzf3WKNDzdc=
X-Received: by 2002:a05:600c:b86:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48526969908mr38172365e9.28.1772809568956;
        Fri, 06 Mar 2026 07:06:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 08/11] imagemagick: patch CVE-2026-25795
Date: Fri,  6 Mar 2026 16:05:59 +0100
Message-ID: <20260306150602.616834-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124912

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25795

Backport the commit the references the related Github advisory[1]
explicitly in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p33r-fqw2-rqmm
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25795.patch          | 28 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
new file mode 100644
index 0000000000..8ff74a43a6
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
@@ -0,0 +1,28 @@
+From 1a9ce954971581375f746fda76c73fc94c0b5535 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:16:10 +0100
+Subject: [PATCH] Fixed NULL pointer dereference in ReadSFWImage
+ (GHSA-p33r-fqw2-rqmm)
+
+CVE: CVE-2026-25795
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2616fca106dcada45536eb4df5dc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/sfw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/sfw.c b/coders/sfw.c
+index f7ab1ef10..cc5fcedc6 100644
+--- a/coders/sfw.c
++++ b/coders/sfw.c
+@@ -317,9 +317,9 @@ static Image *ReadSFWImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   if ((unique_file == -1) || (file == (FILE *) NULL))
+     {
+       buffer=(unsigned char *) RelinquishMagickMemory(buffer);
+-      read_info=DestroyImageInfo(read_info);
+       (void) CopyMagickString(image->filename,read_info->filename,
+         MagickPathExtent);
++      read_info=DestroyImageInfo(read_info);
+       ThrowFileException(exception,FileOpenError,"UnableToCreateTemporaryFile",
+         image->filename);
+       image=DestroyImageList(image);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index ab73da952c..8c1e8eb926 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-25637.patch \
            file://CVE-2026-25638.patch \
            file://CVE-2026-25794.patch \
+           file://CVE-2026-25795.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

