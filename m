Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3388CD185CD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4005.1767869635328866818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zbl7EtO6;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso8935375e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869634; x=1768474434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQ06v4hGaKQd0vmxXkeIGq5ZXEB5CXBmlklFnBdxv8E=;
        b=Zbl7EtO6puFc/wAldOWUGBxII7ygBabMRZ5n/z0EsQisHO0IVqZldWTLnn76j4Q2ZZ
         lc6HhzwDHkXxGfY4z+LKWWQuJHNPFmYBA3CAzylWqkWuGuxKCJPIg7+6XhOlrcnFr0l6
         TERterUXGYxH2oqsEtMH5kAfWRjb534F3qHInOozWBiBr4K+74jXNJORepuDtiMACHAF
         mhuAUW6TPuPzv9ACJijk4jzLdPRe5UP+pp+OgeQipKUTeRlBahpiyaMEZCEMTZxk+xAW
         WoWFRxpJyokBVGHX3T7hg9J5WCjXGkhIM55fqc+wfLJ/nJQHpXOI+sjYrOPRI9asyaY+
         6fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869634; x=1768474434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQ06v4hGaKQd0vmxXkeIGq5ZXEB5CXBmlklFnBdxv8E=;
        b=hmkKzJNTOC342/fZXdxQq+jlBg8FFwk1AtJPE+2ye0S1YQLYyXfkGf+4hXScIn9tV1
         MrjEbQ0heJXvGupVJV2FWoh87amgOeAy0gQJ1MJugP9Jnx8KeJPWZ0ukLeriMDyw8QbK
         N6Ics189p9Vl5akbKd2G6gcxe5nGN0X493y2x/jyYABS0DdJhguQYCGDQvB4Vx2hvSqR
         ctwMi+/1XO72mCzONUb1OwMcFfN58bsBdJ4ueoleG5rcIf/J8CQsMp0eDbLb5PDz837F
         0uT8KvmltWQ2uLhnSQv8Dqstex5lafqNOhgLtY41CbhJ1Ky6cNjsFE9CrzzYxLejzevp
         gtKw==
X-Gm-Message-State: AOJu0YyqASzrJBvGNTOEV3wCtZtuiG+hoIuUA3qseQV4X0nXg8TQzyjW
	mx0rRaZCMJuCiSuv7SxJpDAaviMpt+21H3h9CDttuCvIrl0hrCYmYrLGaNd86g==
X-Gm-Gg: AY/fxX7SCJudaM0NIqWcsHwz0jVjrow2hm8GbZlZr8rMTALZtHujG0uWD3Nv/FOA0AI
	3yix5QRjluwmJxr/xx0hnbZ8fRqMPjQEXYppTqmUrLl/mybFOm75CRxxgwWn+4f8vUxu3BPi5Zp
	yX+J/IU23ZFHyF8sDwgSLKal9sFnIuS0JrGYFgKRWn80q11YkN7iLBc04RFGHMWCoyndKaCf6CG
	0JiNnHNLK/C3fmf5oZ2CRLbYHNHrJRvK8mm/VTczn7dHFI30VO602JEewlAbtReQKrrVHjWgmZf
	RNNVXqHZBuIncdIHCZLWBpboqpTKwwH10jgg3b1J9Y4KF72cW1euN25N9HQLxV/4f4x54MSddGv
	yK7KPf4/j2TzRHsyfuUzORSJWeIobNj/g3hW3gmRhpWCjCk6DIqOAl4TeSVVlBjju5S5idixSqi
	eJ4yTgLGCi
X-Google-Smtp-Source: AGHT+IGLfNJmPUcbv12mnA3BbCFoWA1BLIKNzR9jOr2W5nlhqqj7vh2giBYsc7FqBi2OnbDqmZfw8Q==
X-Received: by 2002:a05:600c:3541:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d848787e3mr74849045e9.14.1767869633580;
        Thu, 08 Jan 2026 02:53:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 07/15] imagemagick: patch CVE-2025-55004
Date: Thu,  8 Jan 2026 11:53:09 +0100
Message-ID: <20260108105317.460246-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123261

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55004

Pick the patch that mentions the related github advisory[1] explicitly in
its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cjc8-g9w8-chfw

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-55004.patch          | 65 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
new file mode 100644
index 0000000000..44ef34c40b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55004.patch
@@ -0,0 +1,65 @@
+From e3b2eba8a84e7c4222bcf1a843c1677b7406db3f Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 7 Aug 2025 19:14:00 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-cjc8-g9w8-chfw
+
+CVE: CVE-2025-55004
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/55d97055e00a7bc7ae2776c99824002fbb4a72aa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/png.c | 33 ++++++++++-----------------------
+ 1 file changed, 10 insertions(+), 23 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index 23a96e4d0..c6fae6283 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -4785,37 +4785,24 @@ static Image *ReadOneJNGImage(MngReadInfo *mng_info,
+       jng_image=ReadImage(alpha_image_info,exception);
+ 
+       if (jng_image != (Image *) NULL)
+-        for (y=0; y < (ssize_t) image->rows; y++)
+         {
+-          s=GetVirtualPixels(jng_image,0,y,image->columns,1,exception);
+-          q=GetAuthenticPixels(image,0,y,image->columns,1,exception);
+-          if ((s == (const Quantum *)  NULL) || (q == (Quantum *) NULL))
+-            break;
++          image->alpha_trait=BlendPixelTrait;
++          for (y=0; y < (ssize_t) image->rows; y++)
++          {
++            s=GetVirtualPixels(jng_image,0,y,image->columns,1,exception);
++            q=GetAuthenticPixels(image,0,y,image->columns,1,exception);
++            if ((s == (const Quantum *)  NULL) || (q == (Quantum *) NULL))
++              break;
+ 
+-          if (image->alpha_trait != UndefinedPixelTrait)
+             for (x=(ssize_t) image->columns; x != 0; x--)
+             {
+               SetPixelAlpha(image,GetPixelRed(jng_image,s),q);
+               q+=(ptrdiff_t) GetPixelChannels(image);
+               s+=(ptrdiff_t) GetPixelChannels(jng_image);
+             }
+-
+-          else
+-            for (x=(ssize_t) image->columns; x != 0; x--)
+-            {
+-              Quantum
+-                alpha;
+-
+-              alpha=GetPixelRed(jng_image,s);
+-              SetPixelAlpha(image,alpha,q);
+-              if (alpha != OpaqueAlpha)
+-                image->alpha_trait=BlendPixelTrait;
+-              q+=(ptrdiff_t) GetPixelChannels(image);
+-              s+=(ptrdiff_t) GetPixelChannels(jng_image);
+-            }
+-
+-          if (SyncAuthenticPixels(image,exception) == MagickFalse)
+-            break;
++            if (SyncAuthenticPixels(image,exception) == MagickFalse)
++              break;
++          }
+         }
+       (void) RelinquishUniqueFileResource(alpha_image->filename);
+       alpha_image=DestroyImageList(alpha_image);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index e486d072be..caaf813f6e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-53015.patch \
            file://CVE-2025-53019.patch \
            file://CVE-2025-53101.patch \
+           file://CVE-2025-55004.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

