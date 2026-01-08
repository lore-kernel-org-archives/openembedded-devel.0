Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32538D185CE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:11 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4008.1767869646451463546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uw21s7FI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so25268715e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869645; x=1768474445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sXGBaeqPL4CDT894hc7YXmVIRGDJO7tMSjJ2/9IYo8=;
        b=Uw21s7FIPsgYmVDZnPQLdR66AQ5ryG4zccJmLHFLFr+FZfSl+aYTU00aA+qAEHeFn6
         8B3W4FGTHbCUHNOuQ7MbFJ5xlP9bLvZXyEVXc2IGhesGhP4KxTsnlPHM3rW6TttdFThC
         dSTqD5t3Jb1M15WiyMSaJbT//j9yjwH9TqzJhL+c+fLrV56eB0CYDXH6fNdRLrEjaiOT
         EWUcyBLwONgpUNANpl2/J/sI4xYMO+HKGdPn0EfXnjSlODHOcmrm75Stc6Susl+/Aj/C
         4uuqSJWe8wnYMnU47q8EMyrIFp+6R9WRNVLZZGe0U5eFgOuipByxlBUre7aynY5Jy8si
         MpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869645; x=1768474445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sXGBaeqPL4CDT894hc7YXmVIRGDJO7tMSjJ2/9IYo8=;
        b=jqBlBZEWQ5GkOiv+qrDekYbca53LlmVwYMY7sFMPbgecK2oKnZXjEiN63IHKfSuh5Z
         X1YhCrNwwqdrC3Xj7rku0fhxf1k2QgFdZ42QYkBp3w1FhlIt+QwzW1OHFWyv7/iMYisC
         rZHO+UDNj4kSstemW7+pUonQ6Z/HQkbwdgKWFzf8fEWZkvGWNcXW+bDUQyB/fcgHcFTq
         Ic1ZlKdCOo/MogFeuG14qybI9zjJAPVo90IStmWhCLHd35jff4FrlcWI7qIy9KFKyJOC
         O0V6SWDhXKN+Dk9g7E/oSKlHu+2IyxCB879iXVhtFFqxR+0gqwYOwU7dFgEX2vtQJ0dj
         ZQSw==
X-Gm-Message-State: AOJu0Yz1qtX4LujAsMQEaL9fQhJiuEFBzqDMhNsAoTQzM2YUln7sRUn0
	auHYzyvGuSRYn6wlNnK1eh1f5xAxDa68DlB9PwHvlHh6SdcHqxNI2hzBPlMNMQ==
X-Gm-Gg: AY/fxX78vzfYtqNVqtowgOj3uepMTPfRT95DRPFyJb63tPgALzO3G1lOA3W8OHCSG00
	DnHCrOAjq7PCpWos7hKjBsXO3zoO+VkFM/yp1G2PfbKBNEP6bQxRcwtv0l59Wgc06aSSs3ZsSao
	jYOolayC7JxBlZqk42v2BJN//ZtJHXnB02d0KY2sT+nbvauZwP+X7cJAHTLcaq5IZgQsdlA+9r+
	S4lN4qcLYtkVYQhkj/0SVA+xrlL6NIm32/1ZaQ77du6lG3+3hfUeMB51UltCHzORKR39YG7aaFV
	Hy4NE78pZ4mzonA1lN77/gRoMrppG7neuxAjPLMSRieJ1gSLHDo8FpIc0IthmjoKk+CL7sn8Bpo
	+DTssUnG/8OEqtd6psyG0Shdl7nFcg+XQkcWCI+GPD4KP3JMsblRRx5KaaPY9/WnijjRf3eMH5p
	9/JP2Qm2pP
X-Google-Smtp-Source: AGHT+IFgcPZbqirvdih3roPeB2ybsE0TU3LJKtnM6VMiI7D02N9yFll5SdKiw2FrEoC9DztvQEo2IA==
X-Received: by 2002:a05:600c:699a:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d84b1fcd5mr65051635e9.13.1767869644623;
        Thu, 08 Jan 2026 02:54:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 10/15] imagemagick: patch CVE-2025-55160
Date: Thu,  8 Jan 2026 11:53:12 +0100
Message-ID: <20260108105317.460246-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123264

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55160

Pick the patch that mentions the related github advisory[1]
in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hgw-6x87-578x

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-55160.patch          | 159 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
new file mode 100644
index 0000000000..565322e7ab
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55160.patch
@@ -0,0 +1,159 @@
+From fecf9ca80adecb7709446ee226d50ac079a37308 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 10 Aug 2025 08:28:28 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6hgw-6x87-578x
+
+CVE: CVE-2025-55160
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/63d8769dd6a8f32f4096c71be9e08a2c081e47da]
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
+index eee6f943c..31c5fa99a 100644
+--- a/MagickCore/option.c
++++ b/MagickCore/option.c
+@@ -2361,6 +2361,21 @@ static const OptionInfo
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
+@@ -2376,7 +2391,7 @@ MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
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
+index f11e87d8a..f8779f3a1 100644
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index dc18169b34..5e9561291c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-55004.patch \
            file://CVE-2025-55005.patch \
            file://CVE-2025-55154.patch \
+           file://CVE-2025-55160.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

