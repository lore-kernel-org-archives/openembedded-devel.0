Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A210854D7
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:48 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9896.1773824981569410720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEA/ltHS;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c6e85f76efeso354522a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824980; x=1774429780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdliWSd5xp7Chvat2iJaoXs8kLfO0UCp90RM25I+rF0=;
        b=OEA/ltHSmLIizThpBignW/pGGQ2JYzH0ySiCt46qL9aEDSeUrZ7zLbJ2+r6XJBCG9w
         eehsK8QwP4+YbVcZuPwLWfQ3Jp7KDI4KQLlPpgDuyWG0xAHUDHBhwRB8Bc+/84JruHXc
         zxnQjHE6qtY+ghRR+CinUHmsZieB4PIb2zPfL/Whq4EGeFxqTucY98WmQthEy2YIvkq8
         VdYiMOgKg0uPTkjQfyt4YlUbUTGk8HrTmEmNsx8Sna19OY5QsPpqzXJhFQLvhWhAgL04
         33wDJOE0mdXI0OA7whwTCRIvqkp8AssUDS4Cmbt0bxKfh8RNPEHo68qoXaTKiinceeuZ
         EWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824980; x=1774429780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdliWSd5xp7Chvat2iJaoXs8kLfO0UCp90RM25I+rF0=;
        b=qzNozWowXUxzt6Xr7+buqkvwzIwaQw3b21u2dSB/rLXtEdvjmDgG7mfhdMos9x7bmh
         +upPQpnHnKkTAqY7UhT9n6vqbB/Coo0ObyMxmnupltgpAuGyNqBV2w66BIeICqMmRpid
         x0/EsWttukPOoiqN4GaYJGB48+v8EpeV/Ab0YHju+E6FhHIqu/r8AwhhOpUJs27zebIE
         UQKtpzKrThbLvBkTh4DSMuHwLbNKZD2vRSuexqJ3NGw8Ku4JFMGMPLTupZncqepgDqm4
         SfK1QmtvGnz2uDtERVxrKw/fOA7rf27pswvYiaXSq2khgzcv5yQjMZXps/Ht1k1Suv4t
         3z2Q==
X-Gm-Message-State: AOJu0YwyzWta9/dDKDIj8pC8fENjuz5scfk2ETJx3QZyHFkjEMpw3Rfz
	QfdkpyxsbUBmbuajy5u+jFZzxdF7BNEFpEkjdyvUTz6jCLE4a7Nfkj4vDKoBKQ==
X-Gm-Gg: ATEYQzyhiGdieyXLLP6MGTqIgKosoMZ2pOlczHhcrMKAo0uZEut+gKJ/849Z8oQFTE7
	Y15lgBMdGo8yye9902OJRPSdsyDC/cd0w0BS+ZHWfxu5WaeXaL67eOtpWRoESZNfrRVc/xDW0YW
	1RgR+EDQGU+31qYytdUvcp5rmc+GcyuewzRCEsDWxKuAIFlu+rqv8Iv4rt4IOwrzdu3gAbDXzJQ
	+u5Rb677Lx6k39UhfJcBESD1H/Ywv9dHS6do/rgSQIVaMdJ3CUaHj4n2S8dxJFWkA+AVmS8rWIz
	jMtvSBgcTtbISzcoZot5sU9TD5lFJNyXE8shBwh9Y4tgDd77CtNyBlCn7YpTEwTpikTsdzvILHh
	PrCPeD8vyXy4mzJgUz2KDDW7yOp+fvsgMxbFByiYkk0saFo77ti7xkmqJ+42TULLc5vRkB42+tU
	qKO8B6H5UZXNAiMEK3O/5n+9yXhSveqcQm4/lP7hsvVgw=
X-Received: by 2002:a05:6a00:138a:b0:827:2b42:10ea with SMTP id d2e1a72fcca58-82a6ac781d2mr1873601b3a.1.1773824980550;
        Wed, 18 Mar 2026 02:09:40 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:40 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 5/6] imagemagick: Fix CVE-2026-23874
Date: Wed, 18 Mar 2026 14:43:37 +0530
Message-Id: <20260318091338.483937-5-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
References: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125358

Reference: https://github.com/ImageMagick/ImageMagick/commit/2a09644b10a5b146e0a7c63b778bd74a112ebec3

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2026-23874.patch    | 36 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch
new file mode 100644
index 0000000000..1700f6c06a
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2026-23874.patch
@@ -0,0 +1,36 @@
+From 2a09644b10a5b146e0a7c63b778bd74a112ebec3 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@...>
+Date: Thu, 15 Jan 2026 17:50:19 -0500
+
+Subject: [PATCH] imagemagick: Fix CVE-2026-23874
+CVE: CVE-2026-23874
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2a09644b10a5b146e0a7c63b778bd74a112ebec3]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/coders/msl.c b/coders/msl.c
+index 0e8f632..7ace1b3 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -7416,9 +7416,19 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+ 
+           /* process */
+           {
+-            *msl_info->image_info[n]->magick='\0';
+-            (void) WriteImage(msl_info->image_info[n], msl_info->image[n],
+-              msl_info->exception);
++	    (void) CopyMagickString(msl_info->image_info[n]->filename,
++              msl_info->image[n]->filename,MagickPathExtent);
++            (void) SetImageInfo(msl_info->image_info[n],1,exception);
++            if (LocaleCompare(msl_info->image_info[n]->magick,"msl") != 0)
++              {
++                *msl_info->image_info[n]->magick='\0';
++                (void) WriteImage(msl_info->image_info[n],msl_info->image[n],
++                  msl_info->exception);
++              }
++            else
++              (void) ThrowMagickException(msl_info->exception,GetMagickModule(),
++                FileOpenError,"UnableToWriteFile","`%s'",
++                msl_info->image[n]->filename);
+             break;
+           }
+         }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index e235b9eb89..a2e08afc1a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2025-66628.patch \
     file://CVE-2025-68618.patch \
     file://CVE-2026-22770.patch \
+    file://CVE-2026-23874.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


