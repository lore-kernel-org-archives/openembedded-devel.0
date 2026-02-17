Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504FEE63F29
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 06:52:34 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7077.1771311150466058159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 22:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJ5Y2OYd;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c62239decbeso1496596a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 22:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771311150; x=1771915950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLAPBKNe3oEWZaBScj6TmLJUG3vpckt5DissXCo6SOo=;
        b=QJ5Y2OYdhaHVCpNUWZv0PQyYxZFShAe3/gPTEomxE/PtiMTpl1bzBUa9DPLVFljZR2
         j9MdTIGUeZppncyYzsl9XZDgDgqfLKSpHMzYAArum7Dt3V2uc82f9cwLTBTr4CkylSb/
         JVY3RdImu5BsV3Ii/EpxRhpZWuWo1Wt6ZTDDEzPE92OVjUytl3CuUmrmNBW/ehSDz4Oa
         5llDqzs22EHbrydxcZzkjDeWixG+1Ohy4mlenFihSlKGQNF/xuJUtAuboaxX9dGRmFLg
         WPk9SzPZgGlI7Zm0v4PX4tpdyhYtm5epnYxKXidVstg+lPi+I3OnR9HB7QF44JgJko9A
         bIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771311150; x=1771915950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLAPBKNe3oEWZaBScj6TmLJUG3vpckt5DissXCo6SOo=;
        b=s9jQIyNSh5hwqul6DsxJyyPpWTKK8mnISCdRnNL+GddfO+JilhnsPfDgl5Q/TySpIR
         JIrP2+zEz5gHYPcTJdiX6zbGzzpd/mkQb4A4/kueyC1SLAmHG+8OTQU7rwvHzwrXBAzd
         KNO9X4e5AFTdcKHngG1DHvrQc+vC5/ifwSOCY4jT+l5owAVZq2AWgQewOTUIt8nK1lhR
         +ftt6jYiG76OuL8Q2zKhnLUUM8Z5UvYXI19kFwr5w4SmdkLDtYLWEunz1xwAdnpylK/f
         qZ+ybty+lMY/uO4uOYL4KFIjHFlYVSIVaaI8+nMcGemja1TGY5eQQ7AomYPYMk+pvl9W
         yBzA==
X-Gm-Message-State: AOJu0YxjcOmRf7EhtqjrvZpJFhr3A2zkWQnC5uPzPAKwEsCD8XQnqO3d
	rfeLYKfgJaqaPSxtRr8D3Mbxsz+Z7HqVPO/bsCm51c63LXCTB/lhsKN69iyxNA==
X-Gm-Gg: AZuq6aInw0f9shzZQx68STjeGbN/uUTNpSC9WEDhN1A5Fv7l8qyhkVUB5el6MFGxAR5
	RNXYweC2L7UTwvYlh7/D0O03XH7w6qjkAJ4DranL4edwNWL2LO4T7D6N9fDqkELlDZfdCfKaaUC
	VJzqWTlt2/0XxnkWxXYR3iEOiVSJRQuJWjaSdR201Vq5KXYZc2Ov6joyzfOL50NWjXawcrYS04U
	E/A9QNIdS0WmZqn2jq9NnwufDUv+W8WhHXe3cE3elJlExW2UAaLrsFKhEyNdQgVvv+WmiZGj/P9
	OpchJGfowDGhv9QzurKJu4AQlpGQdFa6NlqObJ3C3ETypCWuUBpFp0dT23WYz0LzuIyyIoz3fuL
	z1R74M8xql8RvU5sV5CdJDqU4CTN+gDwoZ/QT9+CkYz2ubYclG6U/2B4Ia7Akx+/uD9zwUUwYXQ
	5HSt/xsfrczNhmdNZdN4yFFUemYFDzHg==
X-Received: by 2002:a17:902:ce89:b0:2a9:47ff:1020 with SMTP id d9443c01a7336-2ad17408287mr96645405ad.8.1771311149608;
        Mon, 16 Feb 2026 22:52:29 -0800 (PST)
Received: from L-12443L.kpit.com ([106.51.47.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a61cf8asm131561585ad.0.2026.02.16.22.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 22:52:29 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [OE-core][scartgap][PATCH 3/4] imagemagick: Fix CVE-2026-23876
Date: Tue, 17 Feb 2026 12:21:22 +0530
Message-Id: <20260217065123.1001038-3-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
References: <20260217065123.1001038-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 06:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124437

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


