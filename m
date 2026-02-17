Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2A4E6814D
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:01:44 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8210.1771318897104649975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 01:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K32birwV;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8249cb73792so4193890b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 01:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771318896; x=1771923696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLAPBKNe3oEWZaBScj6TmLJUG3vpckt5DissXCo6SOo=;
        b=K32birwVl5YuDfJmfPPHaIle0J4Up0ZTV4WZ+HiCcDICl13ZWE6tqn2fZxIbD2xBsz
         wgLnRc9wNXzPz6nMzGpFpcGRdih5giysdt5iT67ODdIZp1qOYHhicq+r60we9F/3dwMi
         XsXnQOL6+/CFGjchWYxH+d8bGLf7+cCcEg0f7cXiWDjPTUP/ZBQ2ORr0aLzXxJKBlJF/
         1kpWwnwT4rd5VDgAYaeiGhAGhRsxPvh50LRzrQjkAFzjYhIl/vwTFAZsHN6pur7IL6x+
         3QKhwsk1ShqulZ7MBdGZgHs6aHz9h4IcPbsz7odziTTDphfl5EbXeHS5bVZQmrXVgu09
         6xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771318896; x=1771923696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLAPBKNe3oEWZaBScj6TmLJUG3vpckt5DissXCo6SOo=;
        b=ivCqjPSZP1ieOvKSRcS55dfgiREVYOFdLFW/FXE3WpT+uJ3QATdvjc9ZkwLfyXlLM3
         Xt3FatN9fLRGNBr3CR96IorL1+5rSv/SDDkJO/+5VoPtmfyN5FH1sv+gT7cgyq/xbOY/
         UhI9vZRZ2Mujzczjn2fLC8sNc8hwAsA3/q+vf0WwBWvPaE8vtwyChJ6lU/phx3/7fTHJ
         ptiAc5kzgqoQZ7KJPsTOmKP58B4Qe1G8sn+eJU5URmBy7I4waxoUwjU7vNx0eeTW/bIW
         0LvjGU5Vpg80VEPt/ZGOVsmVSRpjXDYR7ZdjYoiNHeLYlv07R7LU9+FvVwJv+PeDA4Nf
         mjng==
X-Gm-Message-State: AOJu0Yxem+G6PiP7h9VAkvoUdIYVeYgiOpbtrwwjDCNjg95VHNqq2z6k
	MqDUsIQ6lr5/EGYOoeRm1xyhLc+G3vbMU6uE9LLFAn1lZa1lqgkkqe0iQsXayg==
X-Gm-Gg: AZuq6aJLlePKlLAV65/LXjKIgoUvZEtZsT5dZCCzsEH1o2joq66N4mYcFlGqdepwJxB
	YN+RHCHA5PW1BuAdvkzr42Kqj4CaK0p2+Tqldc6SovH4vHewyAdjSJ7ybRejXDTSAmarNjfE9f8
	+g/8CDNbW6PYAqYz0dGz/8y9cIPNZZ50kg/GmsM43thBs1LI0r+XdqAGJwn9pZr1l6dWe5L5Rr9
	aX5gWYzReQB7RXjgoyKzf/nJabsORQk55/jtUUZkUfHx+PqvUSTK0g/fAt+NTXNunrWeaApAKxp
	UTLX5okHwk6sbOKGyM6XF2b/FCsKmtKXsv5BuxzU00qvt/qexRxd3vfBw7++SmOnsmDi/yxMNRP
	MmD9WAj6h5U8sG+dE8cpPpG4sgnMqQTUUguhfCNHbFXCDcEwu0oK7TRX1zi/iz1b990pDxs0+K/
	CcN6Hy3weUsmHmfYIoTRSeqFRYc+VScJJx5RZogNjw
X-Received: by 2002:a05:6300:6702:b0:38d:e87c:48d5 with SMTP id adf61e73a8af0-3948394f471mr9390897637.21.1771318896196;
        Tue, 17 Feb 2026 01:01:36 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332facfsm9171274a12.32.2026.02.17.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:01:35 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scartgap][PATCH 3/4] imagemagick: Fix CVE-2026-23876
Date: Tue, 17 Feb 2026 14:30:18 +0530
Message-Id: <20260217090019.1076725-3-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
References: <20260217090019.1076725-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 09:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124443

Fix CVE-2026-23876 with patch provided by NVD advisory.

Link: https://nvd.nist.gov/vuln/detail/CVE-2026-23876

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-23876.patch          | 67 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23876.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23876.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23876.patch
new file mode 100644
index 0000000000..d25038e513
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-23876.patch
@@ -0,0 +1,67 @@
+From 2fae24192b78fdfdd27d766fd21d90aeac6ea8b8 Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sun, 18 Jan 2026 17:54:12 +0100
+Subject: [PATCH] Added overflow checks to prevent an out of bounds write
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-r49w-jqq3-3gx8)
+
+CVE: CVE-2026-23876
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2fae24192b78fdfdd27d766fd21d90aeac6ea8b8]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ coders/xbm.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/coders/xbm.c b/coders/xbm.c
+index a7a798ea168..d6cd5780d44 100644
+--- a/coders/xbm.c
++++ b/coders/xbm.c
+@@ -197,6 +197,10 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   short int
+     hex_digits[256];
+ 
++  size_t
++    bytes_per_line,
++    length;
++
+   ssize_t
+     i,
+     x,
+@@ -209,8 +213,6 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   unsigned int
+     bit,
+     byte,
+-    bytes_per_line,
+-    length,
+     padding,
+     version;
+ 
+@@ -345,15 +347,15 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
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
+@@ -366,7 +368,7 @@ static Image *ReadXBMImage(const ImageInfo *image_info,ExceptionInfo *exception)
+         *p++=(unsigned char) (c >> 8);
+     }
+   else
+-    for (i=0; i < (ssize_t) (bytes_per_line*image->rows); i++)
++    for (i=0; i < (ssize_t) length; i++)
+     {
+       c=XBMInteger(image,hex_digits);
+       if (c < 0)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 0a1d34e313..abad1fe5d1 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-65955.patch \
            file://CVE-2026-22770.patch \
            file://CVE-2026-23874.patch \
+           file://CVE-2026-23876.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


