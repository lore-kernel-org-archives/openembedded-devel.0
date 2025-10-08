Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A3CCD188
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.2605.1759957162182203099
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GK8KQc4o;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso404941a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957160; x=1760561960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oex3BojXI8AW7UEsFgYvwYN9YSTWljoaxa+bM3Qk4w=;
        b=GK8KQc4ofJWe9/Jdech/FI6QWOwhQLpX5MQflM8HOc68P57xfzUqHVKmBlZ7JhQ2/9
         qaAHpBT9AFfiyfB5Q+771YhHLTeXchp+ndrMmRO9VQKdDpMCIRZ+rz+Igs0iPX6B6R+5
         ysO2r62RdVm8jO3/S4rdwvXMsS+Ug79Fek9Px/qcj8xz9rTUIRe4ADGXaIUWUL2yzVPU
         /pnOM+eZpNkdgQZSe/MEtTyXqDb9My7vrQM/cTmEj0aGnW13geg5/RRCMBaPt/g2U1My
         LbZlGXbPhent8S8tc57UhMnAWNbUtgiI9svgCowM0YpfuFFaAFp72RwnQi5aPnIfP3EA
         zVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957160; x=1760561960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oex3BojXI8AW7UEsFgYvwYN9YSTWljoaxa+bM3Qk4w=;
        b=olV88jQYDGA2xaaGPFPePNKLXIFbN3GKv9CUjx5BTlEfYhe3VEBzlmYLcDEeSeLleT
         DE/bt7b8VHoTvu3BEUT2Zp/ivaI139KPuxnZqBi3GbFfqLckleO2caNIbpPVHLX//XTz
         RvyLL1oi27OM/rnfJ6hx/P+rr+VPVVuausCNpc9ftCRqEVkNie6mNeMw6u5h0x82dh+q
         pdkufOLu711MSUfxXz14mlG1JQYmmVFeZxCDOTaQQek3Nld0fy7ISaI7ZVmAA/0gbDyI
         c3zXcsNhINNcwWtrjQZVqbvfQvuxdT9p9E+uqQaxPVaYEoHUFvConce+BPxoyChRRTo0
         YJOw==
X-Gm-Message-State: AOJu0YyC8DVr4yYgg0urgps1XbRszII+SBywr15PtG0wCnMQx2smP5jl
	fR/Bc2dhEexbt43V1wvf6DyZfUnCFJy3ig807HFa5AYeavGXH8S+EYf8o2BUohtz
X-Gm-Gg: ASbGnctnR0cALSUnfaj0AxPKBV4ZEersW1inWKIrDIUzHIUXiP19HcALZ+M5sLUK//L
	yUew6kgYCvMWJmPddEktK/Ga9qDLqe5xgMmWXeLyAbHCnB+6z3AnKeCWWFBFHA0le4M0L/RJDf7
	rIKTe99WUA5I7k2FZB2F2USWIsj7dvLvw47Xq1ft6jVsR/eTEdfqk0Fk+ww/9rK4723iUUbneaW
	PgPAKhvqhVWWI98dRlftZPxvCjLYRA1A8LMIUs0jlcogEi51y9inQ211rO3/4F43NXfK8f4JZeo
	G5RyDC9Snx7HyAn9PqghgT5gVo3wfZmRTtYf0HXPfquT168wZfPEbE90X+gZUBfQ5e59uTyy30U
	YRX7c78nuuUVkUaWcRpW2bNxGs27RR/Slx2UoC+4TMldtqX3THTmMYws=
X-Google-Smtp-Source: AGHT+IHoreBdkX7TRN/Ywp+BhK1dPHK7G6f8Z40FZ3guVzRc3z8TI2iM35OHtO9l5oJ+sGKsqTKLPg==
X-Received: by 2002:a17:907:7f8a:b0:b45:e8e2:ade3 with SMTP id a640c23a62f3a-b50ace225f8mr454285566b.64.1759957160370;
        Wed, 08 Oct 2025 13:59:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 08/11] imagemagick: patch CVE-2025-55160
Date: Wed,  8 Oct 2025 22:59:11 +0200
Message-ID: <20251008205914.598660-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120391

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55160

Pick the commit that mentions the related github advisory in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-55160.patch     | 161 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55160.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55160.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55160.patch
new file mode 100644
index 0000000000..c9fbeb907a
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55160.patch
@@ -0,0 +1,161 @@
+From 0d03196a77a14c124c4d5c7b817c67a448251731 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 10 Aug 2025 08:28:28 -0400
+Subject: [PATCH] CVE-2025-55160
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hgw-6x87-578x
+
+CVE: CVE-2025-55160
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/63d8769dd6a8f32f4096c71be9e08a2c081e47da]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/artifact.c | 17 ++++++++++++++++-
+ MagickCore/option.c   | 17 ++++++++++++++++-
+ MagickCore/profile.c  | 19 ++++++++++++++++++-
+ MagickCore/property.c | 18 ++++++++++++++++--
+ 4 files changed, 66 insertions(+), 5 deletions(-)
+
+diff --git a/MagickCore/artifact.c b/MagickCore/artifact.c
+index dae6aaaf0..764ef75a4 100644
+--- a/MagickCore/artifact.c
++++ b/MagickCore/artifact.c
+@@ -99,6 +99,21 @@
+ %    o clone_image: the source image for artifacts to clone.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *CloneArtifactKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneArtifactValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
++}
++
+ MagickExport MagickBooleanType CloneImageArtifacts(Image *image,
+   const Image *clone_image)
+ {
+@@ -117,7 +132,7 @@ MagickExport MagickBooleanType CloneImageArtifacts(Image *image,
+       if (image->artifacts != (void *) NULL)
+         DestroyImageArtifacts(image);
+       image->artifacts=CloneSplayTree((SplayTreeInfo *) clone_image->artifacts,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantString);
++        CloneArtifactKey,CloneArtifactValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/option.c b/MagickCore/option.c
+index 6774334d3..e60cd878b 100644
+--- a/MagickCore/option.c
++++ b/MagickCore/option.c
+@@ -2358,6 +2358,21 @@ static const OptionInfo
+ %    o clone_info: the source image info for options to clone.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *CloneOptionKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneOptionValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
++}
++
+ MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
+   const ImageInfo *clone_info)
+ {
+@@ -2373,7 +2388,7 @@ MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
+       if (image_info->options != (void *) NULL)
+         DestroyImageOptions(image_info);
+       image_info->options=CloneSplayTree((SplayTreeInfo *) clone_info->options,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantString);
++        CloneOptionKey,CloneOptionValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/profile.c b/MagickCore/profile.c
+index a68e54f14..e131bd6ec 100644
+--- a/MagickCore/profile.c
++++ b/MagickCore/profile.c
+@@ -143,6 +143,23 @@ typedef struct _CMSExceptionInfo
+ %    o clone_image: the clone image.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *);
++
++typedef StringInfo
++  *(*CloneValueFunc)(const StringInfo *);
++
++static inline void *CloneProfileKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneProfileValue(void *value)
++{
++  return((void *) ((CloneValueFunc) CloneStringInfo)((const StringInfo *) value));
++}
++
+ MagickExport MagickBooleanType CloneImageProfiles(Image *image,
+   const Image *clone_image)
+ {
+@@ -157,7 +174,7 @@ MagickExport MagickBooleanType CloneImageProfiles(Image *image,
+       if (image->profiles != (void *) NULL)
+         DestroyImageProfiles(image);
+       image->profiles=CloneSplayTree((SplayTreeInfo *) clone_image->profiles,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) CloneStringInfo);
++        CloneProfileKey,CloneProfileValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/property.c b/MagickCore/property.c
+index 1d9e50184..8a6727de4 100644
+--- a/MagickCore/property.c
++++ b/MagickCore/property.c
+@@ -131,6 +131,21 @@
+ %    o clone_image: the clone image.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *ClonePropertyKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *ClonePropertyValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value));
++}
++
+ MagickExport MagickBooleanType CloneImageProperties(Image *image,
+   const Image *clone_image)
+ {
+@@ -195,8 +210,7 @@ MagickExport MagickBooleanType CloneImageProperties(Image *image,
+       if (image->properties != (void *) NULL)
+         DestroyImageProperties(image);
+       image->properties=CloneSplayTree((SplayTreeInfo *)
+-        clone_image->properties,(void *(*)(void *)) ConstantString,
+-        (void *(*)(void *)) ConstantString);
++        clone_image->properties,ClonePropertyKey,ClonePropertyValue);
+     }
+   return(MagickTrue);
+ }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index cca4c8ff1b..8c83d018cc 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-CVE-2025-55004.patch \
            file://0001-CVE-2025-55005.patch \
            file://0001-CVE-2025-55154.patch \
+           file://0001-CVE-2025-55160.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

