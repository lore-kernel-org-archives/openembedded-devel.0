Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B18CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.2622.1759957159922092252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hlJ312Ai;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3d80891c6cso213155066b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957158; x=1760561958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4DUDlH0YKMw05bj8irvMET6FTB+tL4vZA1doBKbYq4=;
        b=hlJ312AiJkwpqG6H3excjey69tP+paJX4fhHU/gpaCZN1cwE9slpmOeI8GcsT5BkSj
         QWTKbyJOxksw5nMFxsEKw2k/jM3ozWqHgRcIPWRucwArWrV4KyyJMfGFLteNVo42d10n
         Ye4eKULT2oPJIMezYmfEUOodKmqGTsons58GRaOAcq2DkQQ/ClLnCjLAz3qodEHWpaVf
         M7OEDvJ3uFiybNwmYlNGoq42gI2gntJkc69+WB3lFWmrdFyAVMtNAV1D0K5shWWTvd/q
         OR+4hlyTSwYpeAqb9g590hPuAS7Z2hfQkN0+0e8HEON+ueeS+swSzLZr8l/L6bY7jqCP
         Ij9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957158; x=1760561958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4DUDlH0YKMw05bj8irvMET6FTB+tL4vZA1doBKbYq4=;
        b=cSGPCnT94iHipHB6dMsr7dF4T76QnxCvu5kGN5JaPLgyJr0O98sgfwWXq37WVEvCYt
         r1O/LIzZBDReXz8oqHDYqDgwLrU02Y64jJjKS3cqu62OTSUZp7+MHw12t9UR0Ykgi29S
         tkdwbsrNgVNO3Jcz4Z76ysykM9IoV91fFPAFpZAEbmZPDnpZh4UGfw6sxG9dxdLpcpQr
         gzka4dUrrUyYxXS0SWi/TPPyuYkLs4/6o64g0A4Pgn7UuvbEZrmcMRdtoB3JdEEpWm0Q
         WzyPSpoX5ugsT/bGnCIkroyTacpXLA/jsnNVjMVg69zxllFu/dzWLGFcAbwmWWXa9ycD
         XSkg==
X-Gm-Message-State: AOJu0YzKJefLTO+lc0WdbtT9tCes6nG4Q8uTgJDJB/QHDRXpqFQz2UIg
	Zm1Mp+pM8glBWUAbkYbRSYyN6GuaAsouuy02tqfBiVDRxQjk4bd98mVg198CbwFJ
X-Gm-Gg: ASbGncuAe8Ufz9kO7gur6UKLzA6xJ5sn8aWT9Ammo32L63VJp/OFZekVdtUvPhOo1Go
	7x7ZDhGdpb9aQmW0rtAAtEqsDZqcbHlk65rqFUNP8lj8KM6/tmSg/VRIkpYb5aHYfmrKPK+SV4h
	b5cJKBfYCFBhX62SeCR2qKd8NBUB3+vg+a9jBku7h4Fd4sMVm5F8JjQZQhV2OLSdrrEkdFvBNFT
	G80n2tfbSWCfsw9GvC9llFpwsOrjzXFMwk8dNPHDywsyJWQJz8IKp36w3aaWsQGjLohXyDOpQd5
	Y7aFQ3SVSFsXZY/KPo5rpMK5CNzqQzi9sSqrYtP8c3gGN73IOwTbQvd69uJmlMKGcp5yIwDMiLz
	Jt5W9aiA5Ii0nSpG0cJLG9g0/HIM4G9w6DMWHNuCB/pXxTrHIm6+OcOI=
X-Google-Smtp-Source: AGHT+IEcIv8lT3crZSdi9/yqYMzs46KMTStapvcthcBZwnXvVPHhrFuYPTH/ilUoJY7wJAvy8N6bcw==
X-Received: by 2002:a17:907:3e14:b0:b0e:83e7:f6e1 with SMTP id a640c23a62f3a-b50bedbf398mr617461066b.15.1759957158218;
        Wed, 08 Oct 2025 13:59:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 05/11] imagemagick: patch CVE-2025-55004
Date: Wed,  8 Oct 2025 22:59:08 +0200
Message-ID: <20251008205914.598660-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120388

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55004

Pick the patch that mentions the relevant github advisory in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-55004.patch     | 64 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55004.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55004.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55004.patch
new file mode 100644
index 0000000000..8a326de900
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55004.patch
@@ -0,0 +1,64 @@
+From 2c850f4136e8972244f21ba2eb2db9397784d479 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Thu, 7 Aug 2025 19:14:00 -0400
+Subject: [PATCH] CVE-2025-55004
+
+CVE: CVE-2025-55004
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/55d97055e00a7bc7ae2776c99824002fbb4a72aa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/png.c | 33 ++++++++++-----------------------
+ 1 file changed, 10 insertions(+), 23 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index ad756e8ed..9594623e3 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -4779,37 +4779,24 @@ static Image *ReadOneJNGImage(MngReadInfo *mng_info,
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index b4990fd5a3..570d162fd4 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0002-Added-missing-return.patch \
            file://0001-Fixed-memory-leak-when-entering-StreamImage-multiple.patch \
            file://0001-https-github.com-ImageMagick-ImageMagick-security-ad.patch \
+           file://0001-CVE-2025-55004.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

