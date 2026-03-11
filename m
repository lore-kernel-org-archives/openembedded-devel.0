Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B71112586D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:04:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4236.1773255862754285897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NaQn2xix;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso14735685e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773255861; x=1773860661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp9ZY/TiUDsPOfp2iDvsKEStlUI6ug06cJjJxPVhX0w=;
        b=NaQn2xixYH1C350anuojFOZbNWAG1J/Ew2CkwSUfAofb31cgnZj/NQSSHuUjUhZ2Wi
         OLi9Sz7W1tZO2LOoL0kGgnqxoi85PapLRX2jxZ3wCcaq+C2PXxZKkez/fPQnrGY6bEfp
         rinLG7o6wZIgL0b/iSVuzXxlCv1eZpuBVlEXQv+07zo4+uPlel5CNw7hhHTjHKm79KTr
         9U7/0WguQzWoYNbDMpNKhIWH67M50GoiNn5RxjpgdKDy1i/Izo9kBXSuBb/gjs9vWAWC
         vlqWWXIdLl1aTlxBQBC2TWCHz71UcwBiJbyB1rlSsatkBLSpMsVHK9gXGaaKJxuFkHiI
         8GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255861; x=1773860661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xp9ZY/TiUDsPOfp2iDvsKEStlUI6ug06cJjJxPVhX0w=;
        b=Mg1n/Nl/BW3O34oAZWp+1eNfEhqFI/wk+Bha0p+bJYlBgHJqaa1MWOEzhlS6kGU6jz
         /cUaJAVbJzWU+0Zlm26gQZBDS+c9+mTV4y9UW3yY6FWmYVEUgbPrnF/6SQLkEZ9phMvB
         LIGGOK6IUJN42fuug6HuGBhujWZFbt/ygYP4DaYPLWA+1B3IUscZtHzq7ZChdDesFsgD
         13owmIda7cE0irzsVfd6Rg4Y7jRDBxi3EqKH8iOUHKLr79dNQn82ME9V0Br4lgTVeZbl
         m64kwiOHXLJ6ifMfcMM6yAiMznb6ryDEvqSZO0ZZr+FgOTiu4sD9ZpcaZ3Ij+BLwayoJ
         ljIw==
X-Gm-Message-State: AOJu0YyIM7VTdH8Ux3zpnqMg1uBMJ0hWLPLEy6MMd5HgbGo2sygd7ygL
	MiYMmA5A0zMi0tR3SEIOWBOHit4/VFmNYVhlGWu5Uh4gSU3ZDR2/k0379SK++g==
X-Gm-Gg: ATEYQzypx1HeC8VS1e9Z9sY3Yj/PRtB8cY1MaNegGvQbBoMUT/58f5935suJyiAahvQ
	Yz+sD+57DrfYxKJz8fwNX7IqQhuTPum2MBtmM+O4zdASq90jOQ5ejzazRu1suSXRMnMpFF+EFiI
	lqnzgGOq0Zkj9Bm3qh1ZuqkeMr0uMpLFahkn6wzQlik4R3k511r+pzHmFPp1WxaHB3KDGhRSZ+j
	/a/jEpS23pvsja250e3tBy4tBbrFguebqZOy43RKTh92SohNvbnSuHvgObYiXtThXNvluYEvQhF
	/G/YWJbEpEJytWJDCF2r3KfX6LXZSdTRvVp0wHrRBOIWvcziXb/XUH9/jtkm3f7ByC4XRzgx28v
	KFTx38i7415mHJ6LrhlTkON9Cno/ViSv74Uc6b768azABYCwTWhqPEm7wwlyjlgshi3ZEH5PnQN
	wEVvu8mh+GJaRFWPC74qFl
X-Received: by 2002:a05:600c:c4a4:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4854f583e77mr10067055e9.9.1773255861058;
        Wed, 11 Mar 2026 12:04:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e2537c3sm43135015e9.15.2026.03.11.12.04.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:04:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] imagemagick: patch CVE-2025-69204
Date: Wed, 11 Mar 2026 20:04:18 +0100
Message-ID: <20260311190418.1962798-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311190418.1962798-1-skandigraun@gmail.com>
References: <20260311190418.1962798-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 19:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125090

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-69204

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-69204.patch          | 71 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch
new file mode 100644
index 0000000000..855ed1a12e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch
@@ -0,0 +1,71 @@
+From 7167dbae8306f51d06da940b50c73452f72029f4 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 27 Dec 2025 14:37:23 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-hrh7-j8q2-4qcw
+
+CVE: CVE-2025-69204
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2c08c2311693759153c9aa99a6b2dcb5f985681e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/svg.c | 27 ++++++++++++++++++++++-----
+ 1 file changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/coders/svg.c b/coders/svg.c
+index 6a069745f..09705fc39 100644
+--- a/coders/svg.c
++++ b/coders/svg.c
+@@ -1249,13 +1249,14 @@ static void SVGStartElement(void *context,const xmlChar *name,
+     name);
+   parser=(xmlParserCtxtPtr) context;
+   svg_info=(SVGInfo *) parser->_private;
+-  if (svg_info->n++ > MagickMaxRecursionDepth)
++  if (svg_info->n >= MagickMaxRecursionDepth)
+     {
+       (void) ThrowMagickException(svg_info->exception,GetMagickModule(),
+         DrawError,"VectorGraphicsNestedTooDeeply","`%s'",name);
+       xmlStopParser((xmlParserCtxtPtr) context);
+       return;
+     }
++  svg_info->n++;
+   svg_info->scale=(double *) ResizeQuantumMemory(svg_info->scale,(size_t)
+     svg_info->n+1,sizeof(*svg_info->scale));
+   if (svg_info->scale == (double *) NULL)
+@@ -4721,17 +4722,33 @@ static MagickBooleanType WriteSVGImage(const ImageInfo *image_info,Image *image,
+       }
+       case PathPrimitive:
+       {
+-        int
+-          number_attributes;
++        size_t
++          number_attributes,
++          quantum;
+ 
+         (void) GetNextToken(q,&q,extent,token);
+         number_attributes=1;
+         for (p=token; *p != '\0'; p++)
+           if (isalpha((int) ((unsigned char) *p)) != 0)
+             number_attributes++;
+-        if (i > ((ssize_t) number_points-6*BezierQuantum*number_attributes-1))
++        if ((6*BezierQuantum) >= (MAGICK_SSIZE_MAX/number_attributes))
+           {
+-            number_points+=(size_t) (6*BezierQuantum*number_attributes);
++            (void) ThrowMagickException(exception,GetMagickModule(),
++              ResourceLimitError,"MemoryAllocationFailed","`%s'",
++              image->filename);
++            break;
++          }
++        quantum=(size_t) 6*BezierQuantum*number_attributes;
++        if (number_points >= (MAGICK_SSIZE_MAX-quantum))
++          {
++            (void) ThrowMagickException(exception,GetMagickModule(),
++              ResourceLimitError,"MemoryAllocationFailed","`%s'",
++              image->filename);
++            break;
++          }
++        if (i > (ssize_t) (number_points-quantum-1))
++          {
++            number_points+=(size_t) quantum;
+             primitive_info=(PrimitiveInfo *) ResizeQuantumMemory(primitive_info,
+               number_points,sizeof(*primitive_info));
+             if (primitive_info == (PrimitiveInfo *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 60e206e8f1..ffc26e7169 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-66628.patch \
            file://CVE-2025-68618.patch \
            file://CVE-2025-68950.patch \
+           file://CVE-2025-69204.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

