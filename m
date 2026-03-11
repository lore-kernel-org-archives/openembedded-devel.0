Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B009112586A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:04:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4362.1773255861672911034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZhyXWft;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so1760505e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773255860; x=1773860660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj30dbFjUXKWUDC8gRuRfjtMEMiljFDYUgeXpn97fQU=;
        b=iZhyXWftH/QRwfkAzzRiFY9roBcIiUMkXnfPpGIlMof5+slrQvkzIuWDIYZhncdo8m
         w2kwRDyL/9XNO1tzNolxzdSDCol/8xpdyr4hr9no4WKMpCBsakKToXcNmu6lagxLxups
         oJCjq5FlTAc/YOV0RH0Rj323cbuGjvTNYDdXPJJNnk13u0U8vXiZVwnGPJr38pj7pjvQ
         z5VBlUF427lYvvHRhQYog247x+W9KZ4pSlrLZ97gIoluYurR7mTkewPg1piEbzbdWKCS
         Bz3vyh2wpm0UxlrafGT/G1pk2m6QjH9+ctDB6WhzzJr5jtcFUDOqs6eHqjIyse2/3nBt
         p8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255860; x=1773860660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nj30dbFjUXKWUDC8gRuRfjtMEMiljFDYUgeXpn97fQU=;
        b=ghZKWuAiyL0UtETvgClFdy9vI+XEuf575iCFFo+XZuOSSExSkCZdQGR0SwzvfVugh7
         0eOFSnPY6EefxkWAiGuJDW+eXahzsAPJ8AECvPIcW2NEKaYDj+GrMVG8XBenTxYP84P+
         72kYzVWJq5nGwe9MaqtMPtgmsoGFbuy7/OdUPUybjiHWWVzvW49lFTWAGjj7ehsQCH/3
         Pa+P0SfZyaKRQvX4F4ezMQv4DCFqfYIJYXOQY3bO6Pkkt4LovtS45nYgGl2pVdNRAGhz
         csyppH7Wd6al07WB+L/GcQU0JJcAg7DJSD9BMdJo7R1+FkN2FJmm6o1h6t9lpAg56dib
         V/8Q==
X-Gm-Message-State: AOJu0YwIvW6ElgbLsHIbATKbfq6MbLzae9ln6LBuXdcEIr+vd2yG4uPx
	Dme5oaHyCVOXja8oDcijd7f2S+9u/rbVJW3j/9zLEX+Rhj0G78wBcAjWqSxg2w==
X-Gm-Gg: ATEYQzyQ3s6+0qZSa8zxmxH4tE+uZa99QbltbT8x6yqpAWngADv2vI7/hfnofkeHR/f
	ZAD6NT2nqaRvzg0TjByrmOaUINsLSO9/Pc8/3slKqKEkl1VeZRN+IhipSRxSZjprB7Fb9t/o59Z
	q+v5lGXL/9wo6ajsIfsU4KJ3OKnIxhULWkXV326m3wUGfyzrArpMgVe7tWZAcuJK7+zjCL+UsVm
	5HhnVHHVXoUKIyvekGVM4E/PNkEI3Zpusgl+mw12ZzoO1r2jAB8Z5MgU8rSUpPBdsKxxHbaBxUx
	bkydtljuXeVZLcYlkzEd09TiVwvDYhLcnxjZwFI/8Dz5pTV12TmBS4lnY1Ni/qHGMMfrT1X93g3
	V26v2MBfloi9A3/xtmcOaocNkM3cRrwGeD3DWb7J+Fs2X6c7ZDfVuwehSuuDYfsxMMzpfSgfmMm
	CEG0Y1d8w8KyPA0S85i8+r
X-Received: by 2002:a05:600c:4745:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-4854b0ae77bmr59832205e9.2.1773255859649;
        Wed, 11 Mar 2026 12:04:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e2537c3sm43135015e9.15.2026.03.11.12.04.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:04:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/3] imagemagick: patch CVE-2025-68618
Date: Wed, 11 Mar 2026 20:04:16 +0100
Message-ID: <20260311190418.1962798-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 19:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125088

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68618

Backport the commit that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-68618.patch          | 109 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch
new file mode 100644
index 0000000000..e5dcc248a8
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch
@@ -0,0 +1,109 @@
+From 68f99b5094315eb3b4020f01bf9fab9a7c5c40a1 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 21 Dec 2025 12:43:08 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p27m-hp98-6637
+
+CVE: CVE-2025-68618
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/6f431d445f3ddd609c004a1dde617b0a73e60beb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/msl.c | 24 ++++++++++++++++--------
+ coders/svg.c |  8 +++++++-
+ 2 files changed, 23 insertions(+), 9 deletions(-)
+
+diff --git a/coders/msl.c b/coders/msl.c
+index dc7a8bfd8..80468b1ff 100644
+--- a/coders/msl.c
++++ b/coders/msl.c
+@@ -120,6 +120,7 @@ typedef struct _MSLInfo
+     *exception;
+ 
+   ssize_t
++    depth,
+     n,
+     number_groups;
+ 
+@@ -328,6 +329,10 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+   RectangleInfo
+     geometry;
+ 
++  size_t
++    height,
++    width;
++
+   ssize_t
+     i,
+     j,
+@@ -336,11 +341,6 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+     x,
+     y;
+ 
+-
+-  size_t
+-    height,
+-    width;
+-
+   xmlParserCtxtPtr
+     parser;
+ 
+@@ -352,6 +352,13 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+   exception=AcquireExceptionInfo();
+   parser=(xmlParserCtxtPtr) context;
+   msl_info=(MSLInfo *) parser->_private;
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
+@@ -7057,15 +7064,15 @@ static void MSLStartElement(void *context,const xmlChar *tag,
+ 
+ static void MSLEndElement(void *context,const xmlChar *tag)
+ {
+-  ssize_t
+-    n;
+-
+   MSLInfo
+     *msl_info;
+ 
+   xmlParserCtxtPtr
+     parser;
+ 
++  ssize_t
++    n;
++
+   /*
+     Called when the end of an element has been detected.
+   */
+@@ -7158,6 +7165,7 @@ static void MSLEndElement(void *context,const xmlChar *tag)
+   }
+   if (msl_info->content != (char *) NULL)
+     msl_info->content=DestroyString(msl_info->content);
++  msl_info->depth--;
+ }
+ 
+ static void MSLCharacters(void *context,const xmlChar *c,int length)
+diff --git a/coders/svg.c b/coders/svg.c
+index b1ac0783d..6a069745f 100644
+--- a/coders/svg.c
++++ b/coders/svg.c
+@@ -1249,7 +1249,13 @@ static void SVGStartElement(void *context,const xmlChar *name,
+     name);
+   parser=(xmlParserCtxtPtr) context;
+   svg_info=(SVGInfo *) parser->_private;
+-  svg_info->n++;
++  if (svg_info->n++ > MagickMaxRecursionDepth)
++    {
++      (void) ThrowMagickException(svg_info->exception,GetMagickModule(),
++        DrawError,"VectorGraphicsNestedTooDeeply","`%s'",name);
++      xmlStopParser((xmlParserCtxtPtr) context);
++      return;
++    }
+   svg_info->scale=(double *) ResizeQuantumMemory(svg_info->scale,(size_t)
+     svg_info->n+1,sizeof(*svg_info->scale));
+   if (svg_info->scale == (double *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 40e57b7f1d..0e52519558 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-62171.patch \
            file://CVE-2025-65955.patch \
            file://CVE-2025-66628.patch \
+           file://CVE-2025-68618.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

