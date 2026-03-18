Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634A410854D4
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 09:09:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9872.1773824971573739717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 02:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6QYl3eI;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8244105fa96so423607b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773824970; x=1774429770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1Evr/TQcnfY1y3yWQFlmVAN21cmqgH8yCAMYAl4a/w=;
        b=e6QYl3eIJ5ttzpkApranPIWVdM7rQns3Nw0m7+gTueI9vGaXYYNUiXFmf6DTRzpkG1
         eGdBJfyTcGjPDpI8G4xcfuSlw0+KUtjiYVXG3ZY+Lf/ZTbB26MkoABtHcSQQhzq+juuI
         OLlL8lZRZTA9RVdIxBYXq/NQiDuwB/2TDaGNlTtU+xrvHAaqEm6Q0vqcWtArUuHAuaka
         2di36cR0a2v2ddv4DHscBQxBfjATMuJ012iGQQ28Af/saB+NzfbytT/vjmq4IBRc73iK
         Ag/OW3I0f8IZ6+jXFHPyU7HdOMlH6ra3jMYpxJXX1Jln55twtI8R2KyA9qenImy9Euu0
         1oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824970; x=1774429770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1Evr/TQcnfY1y3yWQFlmVAN21cmqgH8yCAMYAl4a/w=;
        b=StRg41fPkNt+UVnMMGr2L/Qdv6LmxoUkZHqz/PAz1vt2tyKkH4q9ba7hcWbyz1s0bB
         onZyMwb3beByIqXRHN6ej0442RmkG+QKhN+EYfY4l5em0OyqIHIBJ+2TtUBxflVKY3EA
         mW47v4upfLlY/zTr1Sma863IABRW2EI0+TCftrOjVOBT3BMRzMgBRf4RHQd2YZLLSY9T
         k3xxZFr/tiBhJZh5z5OFuoLZuJ+6emYcQDXNgjGgi+S7xAgt0zBYoCaSYkP/d/SfNNiT
         6en4OvabHbjP+I6V7g/ZzWFN/d+3AAJbxMvwqOhx/LL58NJ1fjHq1LVH/POOQO7PmamY
         aUhQ==
X-Gm-Message-State: AOJu0YxgVtcKPfdxHSzkitP8uTRTYitDwCP4CeWb2TQNYXIMBFrvyTqm
	iwXS48jfSjMraB5e52WAQCHHD53DrJvdVkaEqf1I+WhUDRBl/4lg4H5xGsZAWw==
X-Gm-Gg: ATEYQzwzdFBLZVzeBjepqG8aLdTdArkG6tGxiQyDlW6uRqVQMuaQOhmhxjkP8JQldFz
	4E3wsjTMoPGhelgvy8xCol61pth3WfX3K7R4ELlKbwMnUlI8KT03Oh5xEHT5u9vdMugW9/iVimN
	BNm0ssiWOlyMqU90vhSUIrg1auw3AIYsmvEYMg4YrFrYGtdWD8gZi6UzpClkifKFiYsLAGwG1FA
	fUNXZ3etzy67H1Fp6t0r3Obt6eZ3EIBvBV+6y2GbiF97M4tRUOm0YQB2VaARtbC0hDvY4jF/zoX
	tkIufjRDVkV/zVAjHp9ddVP1VXnMoK4QwE1BM6Q991vgwCjtgAbhzFD0/x7nwxmnmUiVBtwYjY5
	kcngty8PQfyfkf1iDFxYwOyWzEyxh1voshziYo4BFGWv+wC5WipPralogD1V8Hqb+rj5CW0K8AN
	zQO83y2LhIT/KG1u46Tp2cQfr4kFEdtJelVbDCQNszkB2P/YVkmhZqQw==
X-Received: by 2002:a05:6a00:a213:b0:81e:fd4c:fb39 with SMTP id d2e1a72fcca58-82a6aec2c5dmr1792822b3a.4.1773824970562;
        Wed, 18 Mar 2026 02:09:30 -0700 (PDT)
Received: from LL-3324L.kpit.com ([122.167.115.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm2590361b3a.59.2026.03.18.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:09:30 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
X-Google-Original-From: Nitin Wankhade <nitin.wankhade@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Nitin Wankhade <nitin.wankhade333@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/6] imagemagick: Fix CVE-2025-68618
Date: Wed, 18 Mar 2026 14:43:35 +0530
Message-Id: <20260318091338.483937-3-nitin.wankhade@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
References: <20260318091338.483937-1-nitin.wankhade@partner.bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 09:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125356

Reference: https://github.com/ImageMagick/ImageMagick/commit/6f431d445f3ddd609c004a1dde617b0a73e60beb

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../imagemagick/files/CVE-2025-68618.patch    | 95 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch
new file mode 100644
index 0000000000..c846b0cc31
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68618.patch
@@ -0,0 +1,95 @@
+From 6f431d445f3ddd609c004a1dde617b0a73e60beb Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 21 Dec 2025 12:43:08 -0500
+
+Subject: [PATCH] imagemagick: Fix CVE-2025-68618
+CVE: CVE-2025-68618
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6f431d445f3ddd609c004a1dde617b0a73e60beb]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/coders/msl.c b/coders/msl.c
+index 68abd7d..0e8f632 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -126,6 +126,7 @@ typedef struct _MSLInfo
+ 
+   ssize_t
+     n,
++    depth,
+     number_groups;
+ 
+   ImageInfo
+@@ -660,13 +661,13 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+   RectangleInfo
+     geometry;
+ 
+-  ssize_t
+-    i;
+-
+   size_t
+     height,
+     width;
+ 
++  ssize_t
++    i;
++
+   /*
+     Called when an opening tag has been processed.
+   */
+@@ -674,6 +675,13 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+     "  SAX.startElement(%s",tag);
+   exception=AcquireExceptionInfo();
+   msl_info=(MSLInfo *) context;
++  if (msl_info->depth++ >= MagickMaxRecursionDepth)
++    {
++      (void) ThrowMagickException(msl_info->exception,GetMagickModule(),
++        DrawError,"VectorGraphicsNestedTooDeeply","`%s'",tag);
++      xmlStopParser((xmlParserCtxtPtr) context);
++      return;
++    }
+   n=msl_info->n;
+   keyword=(const char *) NULL;
+   value=(char *) NULL;
+@@ -7430,12 +7438,12 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+ 
+ static void MSLEndElement(void *context,const xmlChar *tag)
+ {
+-  ssize_t
+-    n;
+-
+   MSLInfo
+     *msl_info;
+ 
++  ssize_t
++    n;
++
+   /*
+     Called when the end of an element has been detected.
+   */
+@@ -7525,6 +7533,7 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+   }
+   if (msl_info->content != (char *) NULL)
+     msl_info->content=DestroyString(msl_info->content);
++  msl_info->depth--;
+ }
+ 
+ static void MSLCharacters(void *context,const xmlChar *c,int length)
+diff --git a/coders/svg.c b/coders/svg.c
+index 5caf8af..ab139e2 100644
+--- a/coders/svg.c
++++ b/coders/svg.c
+@@ -1270,7 +1270,13 @@ static void SVGStartElement(void *context,const xmlChar *name,
+   (void) LogMagickEvent(CoderEvent,GetMagickModule(),"  SAX.startElement(%s",
+     name);
+   svg_info=(SVGInfo *) context;
+-  svg_info->n++;
++  if (svg_info->n++ > MagickMaxRecursionDepth)
++    {
++      (void) ThrowMagickException(svg_info->exception,GetMagickModule(),
++        DrawError,"VectorGraphicsNestedTooDeeply","`%s'",name);
++      xmlStopParser((xmlParserCtxtPtr) context);
++      return;
++    }
+   svg_info->scale=(double *) ResizeQuantumMemory(svg_info->scale,
+     svg_info->n+1UL,sizeof(*svg_info->scale));
+   if (svg_info->scale == (double *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 7b2d33ccb8..1afc8bbe2c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2025-62171.patch \
     file://CVE-2025-43965.patch \
     file://CVE-2025-66628.patch \
+    file://CVE-2025-68618.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


