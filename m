Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CCBF433E8
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:41:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6925.1776318100199808579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rcPDUGOa;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a8fba3f769so34629995ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318099; x=1776922899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOHhn+p/dqcpJ6jcVKd3EVtgmI070FY1v3J2/oWIEhM=;
        b=rcPDUGOa3tv6o6YfFZ71zUtr4Ie/W3SpeVBEB9NKxAv9KbeHIdYRjVRKhxE4dvqhXD
         87l2GTdN/7YqcgkjKSzk0t5/SPt+rLBrY+vHoSVEjeihejR9AgG6AQzLk9QvtnIyH5GB
         xw6J2pzNZewTcrFo3dATvASrVbnG5C8TS0n3e3GHOoSb9VFNE7x7jv/dYyxB067hgGem
         x231I9m5KHMgbxM9Jj8Kw4kl2WFjbJBF4NSfKchQPyztlia8Rc1p75vItDXZA1H2gnjs
         yus9LZ6BrSlRHLwP36JOQ9NQjK3RrMiEltTS2UFxxFr/PqB1d3GQ0qBfqqVLQI1NdxEC
         Hv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318099; x=1776922899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jOHhn+p/dqcpJ6jcVKd3EVtgmI070FY1v3J2/oWIEhM=;
        b=XQXPFmP8qnBsXcHrjXNy5+m7BH2kywGY4e7jYYLsbi3e6NR3SctsyWok4fX6s18xyy
         TvTlSkY9/Qx3izw6bwKEPZQ5GsroySOr+2C0aLojEmS4whMhWfw5Dln4eq3VrYx2LXMP
         U8ji8UjyZ0lljlz2SEa0HkmRTSzYzD9oNYcM1aUAGjh/m6Qu8umxBKqrt0PA3MGLsIKz
         EDW1/OhajvFjh6NcsHlc3jsE3/28ucEOERix7J6Hf8ULyjbnTbJQB9ZN3H9hcy6foOET
         nCjplUgKtXKxeTzVm4aHsosbtqTqAfpQIcMnJDlCfoDMNgzI6BUXp4qOKPb+zTOqsmec
         nSjw==
X-Gm-Message-State: AOJu0Yx8xNXaZCbj8p2gKesclydVmrYHx4eNIC0ZMFzUnRYoTVYgAtKx
	BdMtv5+7paXEXTAdIll349kuzwsWkTmQbQk5bzbU+FemrsNZ8nGLNOV60mNpdg==
X-Gm-Gg: AeBDievCiqzqmJCJJSbSFLidzJl62D0IQCKy6DqmA3vknU1kqa/yovKHZdzZQLDhBJy
	31O3EPeAGOvVAiBY0mc9qSS2d9UgwSgLUP0rWV2yY4lknBHRJXgto29siYji4bnb8PqOaeI08fq
	D9BgzVkcGx1bQZXDbp/GwF56OCCv1KiSgjf5MWDD63m9YFbwYElePfvNNUoJb6UDAZPimNigtr2
	AaxpQ6Z6H22o6S/zXabKSyWcOJEAlPV65W2hdlrpbC/ANj+kI5S9B4Rchqc7nGaqlDHtDCG2ozW
	LB0X1Mz0IezDvXwqJhvMOENUGSagKjBpz4egiVEIDnsF9dPA1eLUB+TxUvNurs03JwYR6jcZsvo
	ry0gyGiCWgIa8VVOKcyBjElYXy2VgThIeWC2/SjTMDIAEp1tCCpcCswwcArVn00L61bJjcv4fCI
	0oS8OMXeTJNB9dV1nNxwEIcIQCG0J2
X-Received: by 2002:a17:902:cf12:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b2d59b92a5mr248390795ad.19.1776318099287;
        Wed, 15 Apr 2026 22:41:39 -0700 (PDT)
Received: from L-12443L.kpit.com ([106.51.47.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782b1174sm50361225ad.70.2026.04.15.22.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:41:38 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
X-Google-Original-From: Bhabu Bindu <bhabu.bindu@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	bhabu.bindu@kpit.com
Subject: [meta-oe][scarthgap][PATCH 2/2] imagemagick: Fix CVE-2026-28494
Date: Thu, 16 Apr 2026 11:09:49 +0530
Message-Id: <20260416053949.365300-2-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260416053949.365300-1-bhabu.bindu@kpit.com>
References: <20260416053949.365300-1-bhabu.bindu@kpit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126379

From: Bindu Bhabu <bhabu.bindu@kpit.com>

Backport imagemagick commits [1] from version 7.1.2-16
which fixes the vulnerability according to Debian [2].

[1] https://github.com/ImageMagick/ImageMagick/commit/a3f2f8680fa01cbce731191789322419efb5954a
[2] https://security-tracker.debian.org/tracker/CVE-2026-28494

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../imagemagick/CVE-2026-28494.patch          | 61 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28494.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28494.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28494.patch
new file mode 100644
index 0000000000..1f65d0131f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-28494.patch
@@ -0,0 +1,61 @@
+From a3f2f8680fa01cbce731191789322419efb5954a Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Sat, 28 Feb 2026 11:31:15 +0100
+Subject: [PATCH] Added checks to avoid possible stack corruption
+ (GHSA-932h-jw47-73jm)
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/a3f2f8680fa01cbce731191789322419efb5954a]
+CVE: CVE-2026-28494
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ MagickCore/morphology.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/MagickCore/morphology.c b/MagickCore/morphology.c
+index 81bd2265438..727ac100180 100644
+--- a/MagickCore/morphology.c
++++ b/MagickCore/morphology.c
+@@ -234,6 +234,9 @@ static KernelInfo *ParseKernelArray(const char *kernel_string)
+   GeometryInfo
+     args;
+ 
++  size_t
++    length;
++
+   kernel=(KernelInfo *) AcquireMagickMemory(sizeof(*kernel));
+   if (kernel == (KernelInfo *) NULL)
+     return(kernel);
+@@ -261,8 +264,9 @@ static KernelInfo *ParseKernelArray(const char *kernel_string)
+   if ( p != (char *) NULL && p < end)
+     {
+       /* ParseGeometry() needs the geometry separated! -- Arrgghh */
+-      (void) memcpy(token, kernel_string, (size_t) (p-kernel_string));
+-      token[p-kernel_string] = '\0';
++      length=MagickMin((size_t) (p-kernel_string),sizeof(token)-1);
++      (void) memcpy(token, kernel_string, length);
++      token[length] = '\0';
+       SetGeometryInfo(&args);
+       flags = ParseGeometry(token, &args);
+ 
+@@ -388,6 +392,9 @@ static KernelInfo *ParseKernelName(const char *kernel_string,
+   MagickStatusType
+     flags;
+ 
++  size_t
++    length;
++
+   ssize_t
+     type;
+ 
+@@ -406,8 +413,9 @@ static KernelInfo *ParseKernelName(const char *kernel_string,
+     end = strchr(p, '\0');
+ 
+   /* ParseGeometry() needs the geometry separated! -- Arrgghh */
+-  (void) memcpy(token, p, (size_t) (end-p));
+-  token[end-p] = '\0';
++  length=MagickMin((size_t) (end-p),sizeof(token)-1);
++  (void) memcpy(token, p, length);
++  token[length] = '\0';
+   SetGeometryInfo(&args);
+   flags = ParseGeometry(token, &args);
+ 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 09a56a1723..d85cdb27f3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-28493-1.patch \
            file://CVE-2026-28493-2.patch \
            file://CVE-2026-28493-3.patch \
+           file://CVE-2026-28494.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


