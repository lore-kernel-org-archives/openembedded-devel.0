Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83043FCB615
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70992.1772809572086325553
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hhKS4LdS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48371bb515eso138602325e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809570; x=1773414370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb7BiTY4hFlYWZyA8rTMDpvdoKP/vOyYKch1WmsDfQI=;
        b=hhKS4LdSn5I9kQWH9OzpkIMpf7TB2Kh5Jm3RJXC4RbGyo8AgQ265euZDI26JIj+EfN
         /lOUL+0oPM/ZYldWwF3cICD5W2QaBc9RQ1joehUiFdC/Zz09tLds8L7lj4PAwLJc2Bjz
         t0FdXjxsZ497ejXQSoPQ4AMUZSbFImS8hl6pO70xgE3Vh+jzNe4+7tVPYaGlragvYOcB
         AJV0XCsK8t6tAiM/KmoRZpVCosi5866NTlYZqoVSS4PG/9JzDSpuuzXqWhRaTKpy6U5/
         7nIK9MVSo/mIG0rkO8lZzFWo+dk/iFNCQPQtkanf/JvisCWWoZaaFPtlZgWznjyhIDw5
         o8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809570; x=1773414370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yb7BiTY4hFlYWZyA8rTMDpvdoKP/vOyYKch1WmsDfQI=;
        b=Kvp19OolClEbOsBjBhMlirI9/SbmH6JUAOAN5cJ8FlclxzsZ0EOv58SeSe47/eRWKO
         PrWYc87rDni3tqyvX3cKzbSRA1FmfxBQPGJEAmajkN+ZPHibrKPBM5JMvWZsnDozTImn
         eW3CIdIbj1OR/OSY+lkvclM54I29R0IguOk4WUAZOg2Q2hQTo7pnvVZf1f+mfvk3nBfS
         5YxkhoGbwbZfdQEN+ZCYeLMLd1v3abj4JZryd32Q2s2YYfgX1T3Nl1VSJx/9C8nJrPBy
         mKyOu47Gb3Fl96nbyhDRU0rNb9VANDLf7vsWaBDCfFdmZsu39BuALVLtCRTXFSjeTpqx
         bmZA==
X-Gm-Message-State: AOJu0Ywm2JOkb/SWrENhCLAx0P5YRPIsANX2p1LUJWpmQw0TgDUV2eTX
	ecs4jhGJqOyYfX1clB5pjTjemY0gnqMz2NQgTPV4JbWDa2oCUi9qg82BQTKsRg==
X-Gm-Gg: ATEYQzzCC6TUbvUEZqOdKvYttfQcyacUESVMBJGumYpw9hzacbagqRz8W0IqmzcEHGQ
	/b87jBfuC99MGjMdDeFbvU2gt/ALyGN9KoCCo9JM34qOMpMFLhGd1m+2KbDGwOqCRelUZ0WcHmo
	3SHTO8uUv312eyUEkFI8ITkeSQBHubI0enK9ANzbiMzarGwRUEn+qTwLjxLB8wyUJRdO+i1ie+4
	qj+jBF6KTTpLYNvKHZQPJ1VoWtMQgBbC2c5KIwIqRmkj2uW5ZHTrLIsTyjFh+gHhH3Gnx3oVVJx
	Zh6ye1ohbpDPrhdFGQ9B+8cIrSfjgJSBoQ4Ugj2ftO7uREzYRImpvRq/kM05jnCHdtdJd83rsle
	dJM8D0FcxEyvUJ9X8s1I93bbkBJexUtdXAIg1Fupgf/SKEIrzWfwG6Aoj/Y5z0QCeLfxV5TkdU0
	zYBGReF6FOviB8ZpU846zE
X-Received: by 2002:a05:600c:45d1:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4852697844emr39565235e9.32.1772809570251;
        Fri, 06 Mar 2026 07:06:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 10/11] imagemagick: patch CVE-2026-25797
Date: Fri,  6 Mar 2026 16:06:01 +0100
Message-ID: <20260306150602.616834-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124914

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25797

Backport the patch that mentions the related Github advisory[1]
in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-225v

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25797.patch          | 339 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |   1 +
 2 files changed, 340 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797.patch
new file mode 100644
index 0000000000..aa88a81203
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797.patch
@@ -0,0 +1,339 @@
+From cd63a33f1ec263e27049cdfb9d1345e1a4bd564f Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:28:50 +0100
+Subject: [PATCH] Prevent code injection via PostScript header
+ (https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-225v)
+
+CVE: CVE-2026-25797
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/26088a83d71e9daa203d54a56fe3c31f3f85463d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/ps.c  | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ coders/ps2.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ coders/ps3.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 3 files changed, 243 insertions(+), 3 deletions(-)
+
+diff --git a/coders/ps.c b/coders/ps.c
+index 66b08e8c7..d2ea34588 100644
+--- a/coders/ps.c
++++ b/coders/ps.c
+@@ -1086,6 +1086,82 @@ static inline unsigned char *PopHexPixel(const char hex_digits[][3],
+   return(pixels);
+ }
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+   ExceptionInfo *exception)
+ {
+@@ -1554,6 +1630,9 @@ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+       text_size=(size_t) (MultilineCensus(value)*pointsize+12);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Output Postscript header.
+         */
+@@ -1564,8 +1643,9 @@ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *image,
+             MagickPathExtent);
+         (void) WriteBlobString(image,buffer);
+         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: (%s)\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
+diff --git a/coders/ps2.c b/coders/ps2.c
+index 82935dc8e..009129a98 100644
+--- a/coders/ps2.c
++++ b/coders/ps2.c
+@@ -225,6 +225,82 @@ static MagickBooleanType Huffman2DEncodeImage(const ImageInfo *image_info,
+   return(status);
+ }
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+   ExceptionInfo *exception)
+ {
+@@ -547,6 +623,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+       text_size=(size_t) (MultilineCensus(value)*pointsize+12);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Output Postscript header.
+         */
+@@ -557,8 +636,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image *image,
+             MagickPathExtent);
+         (void) WriteBlobString(image,buffer);
+         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: (%s)\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
+diff --git a/coders/ps3.c b/coders/ps3.c
+index 77ddf050b..2b02d49b5 100644
+--- a/coders/ps3.c
++++ b/coders/ps3.c
+@@ -203,6 +203,82 @@ ModuleExport void UnregisterPS3Image(void)
+ %
+ */
+ 
++static inline void FilenameToTitle(const char *filename,char *title,
++  const size_t extent)
++{
++  int
++    depth = 0;
++
++  ssize_t
++    i,
++    offset = 0;
++
++  if (extent == 0)
++    return;
++  for (i=0; (filename[i] != '\0') && ((offset+1) < (ssize_t) extent); i++)
++  {
++    unsigned char
++      c = filename[i];
++
++    /*
++      Only allow printable ASCII.
++    */
++    if ((c < 32) || (c > 126))
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Percent signs break DSC parsing.
++    */
++    if (c == '%')
++      {
++        title[offset++]='_';
++        continue;
++      }
++    /*
++      Parentheses must remain balanced.
++    */
++    if (c == '(')
++      {
++        depth++;
++        title[offset++] = '(';
++        continue;
++      }
++    if (c == ')')
++      {
++        if (depth <= 0)
++          title[offset++]='_';
++        else
++          {
++            depth--;
++            title[offset++]=')';
++          }
++         continue;
++     }
++    /*
++      Everything else is allowed.
++    */
++    title[offset++]=c;
++  }
++  /*
++    If parentheses remain unbalanced, close them.
++  */
++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
++    title[offset++]=')';
++    depth--;
++  }
++  title[offset]='\0';
++  /*
++    Ensure non-empty result.
++  */
++  if (offset == 0)
++    {
++      (void) CopyMagickString(title,"Untitled",extent-1);
++      title[extent-1]='\0';
++    }
++}
++
+ static MagickBooleanType Huffman2DEncodeImage(const ImageInfo *image_info,
+   Image *image,Image *inject_image,ExceptionInfo *exception)
+ {
+@@ -1007,6 +1083,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo *image_info,Image *image,
+     is_gray=IdentifyImageCoderGray(image,exception);
+     if (page == 1)
+       {
++        char
++          title[MagickPathExtent];
++
+         /*
+           Postscript header on the first page.
+         */
+@@ -1019,8 +1098,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo *image_info,Image *image,
+         (void) FormatLocaleString(buffer,MagickPathExtent,
+           "%%%%Creator: ImageMagick %s\n",MagickLibVersionText);
+         (void) WriteBlobString(image,buffer);
++        FilenameToTitle(image->filename,title,MagickPathExtent);
+         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title: %s\n",
+-          image->filename);
++          title);
+         (void) WriteBlobString(image,buffer);
+         timer=GetMagickTime();
+         (void) FormatMagickTime(timer,sizeof(date),date);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index bb1272d512..2f6c8079cf 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-25794.patch \
            file://CVE-2026-25795.patch \
            file://CVE-2026-25796.patch \
+           file://CVE-2026-25797.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

