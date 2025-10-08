Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FADCCD189
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.2625.1759957162880593523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g+gYW9bQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b50206773adso255085266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957161; x=1760561961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI9HHzYWEIZ7yTG1ddhUjmm/YTEU2tLGbfgPGYoomow=;
        b=g+gYW9bQbRWSz6/L0IQGFnV2qZ96uDr/1xxHMqOMXF/C7SR2q5Go++MTkIaJH4CFZy
         8GHbiE3S2WQyw/7XKTmHSar8knBWgT7RDGrgurJqxsYaN/V3glqDoNnuXd8hEtPmCrTV
         OqXRfzdQlM10dqcAr8eXEnY2IMolCTP5h1JNK6moS7VOlrS7mmxV5L37Kasm/9IDkiCX
         4x8JcmUd5As9nsbY3ORmb3c6egJN/RMtOoETTi+ankRGlUJPS/c1eotqZ1kuXY1VNiGe
         K2SS2R1+aJBinoNP2/+nmWPxkqLj/RNlTKlQSuXMh7SuDfaD+oAVLfoIFL3181RCZl0Q
         3RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957161; x=1760561961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qI9HHzYWEIZ7yTG1ddhUjmm/YTEU2tLGbfgPGYoomow=;
        b=vkMjIzpmEIq57xzuwD7LOx4hgJZzOtv9Ill0WiYccKjH8G0FPmk99UJJn8wTZU2sNd
         M14zz+JUWpfG4MTFP5GSATdPYI5vM1edkQIIMhgTRqhDWeRRs9pI4SiJnmmwdRa2kZFL
         j1gv4oXY+mQJpqylkGq6Og4M5P4ck9LF0pAZDP61Vu4jB1xvb3q51ttGBm4fuZrmbkj3
         UG4lVucrROnG4Y2eVnJF49WgSM2xzRErUcCpQc/608zCS4TfDt6zBet4XStvPtoS72tN
         ZksgoeVLHdpjmJKvo/D9qzbnaeJ7T/Thv4YbVjXC/IMJn8nlZCkyKHFaMHM0hSFUPgo/
         3ajQ==
X-Gm-Message-State: AOJu0YzXVKQjocyqVj0UI2LTYWcbFALM4PHlvSHYmgfMT+wQUQgQPqs+
	QVdRFpaQs+lLaU2+QxVnARJ1XzxOXW8HuLLcp5B0tZnaAxsI+4OlzNlciBsr2UnO
X-Gm-Gg: ASbGnctXMvnbutvMaXNVpC82M3UW5lafEAr4RKGg1+POPCfc8zNvciJW/cKVYZy33cu
	1KPwYSKla1fqJnN6M6rW4lAnBXLCiTL79rVczko3NqFPdCXtWLKA3jltJ9icp36ZjXt2Q+PlXEC
	7WgM4y763r3O59YS1Jc+u6Jo+7SW/NJ2QRIvhAOr7n/MBNhxH8oOgFT07URwNEfpjun40YYoVlI
	ItrHM6l7rA3aC204TjcraptvaLKUxHNG3LR8lc9s1iUGHMubzSFbpS8qzKyQ4IQGB5sHN+KPRe5
	pCbojtesLnk2RqQfQ5qVP49ePEH2aSq7kepLlksdXSydwpkvYM1f3I7C+fQCliCCRD4ihdVDhOt
	7elwOngZYArrW/jhErXhNf3hGbOJ73vxGKHDdI9n/szrW
X-Google-Smtp-Source: AGHT+IEWAwFyhrpquOcmMI4QoEOfAPgg0bXf9NYdI1oX+1SPr9TRKa6kLSloJ+Sf0STsXSPcJrPkgg==
X-Received: by 2002:a17:907:d412:b0:b3c:d31:31ca with SMTP id a640c23a62f3a-b4f429f3443mr1083437166b.17.1759957161093;
        Wed, 08 Oct 2025 13:59:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 09/11] imagemagick: patch CVE-2025-55212
Date: Wed,  8 Oct 2025 22:59:12 +0200
Message-ID: <20251008205914.598660-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120392

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55212

Pick the patch that mentions the related github advisory in its commit message.

Also backport the missing function that the fix uses.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-55212.patch     | 56 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55212.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55212.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55212.patch
new file mode 100644
index 0000000000..c409dc807d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-55212.patch
@@ -0,0 +1,56 @@
+From a5acb50364cfa7fa6cfb56af9b2c1ac3d7efce93 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 17 Aug 2025 14:33:44 -0400
+Subject: [PATCH] CVE-2025-55212
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-fh55-q5pj-pxgw
+
+CVE: CVE-2025-55212
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/5f0bcf986b8b5e90567750d31a37af502b73f2af]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/resize.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/MagickCore/resize.c b/MagickCore/resize.c
+index 381b3a663..d34c5e23a 100644
+--- a/MagickCore/resize.c
++++ b/MagickCore/resize.c
+@@ -74,6 +74,7 @@
+ #include "MagickCore/resize.h"
+ #include "MagickCore/resize-private.h"
+ #include "MagickCore/resource_.h"
++#include "MagickCore/statistic-private.h"
+ #include "MagickCore/string_.h"
+ #include "MagickCore/string-private.h"
+ #include "MagickCore/thread-private.h"
+@@ -4602,8 +4602,10 @@ MagickExport Image *ThumbnailImage(const Image *image,const size_t columns,
+         x_factor,
+         y_factor;
+ 
+-      x_factor=(ssize_t) image->columns/(ssize_t) columns;
++      x_factor=(ssize_t) (image->columns*MagickSafeReciprocal((double) 
++        columns));
+       y_factor=(ssize_t) image->rows/(ssize_t) rows;
++      y_factor=(ssize_t) (image->rows*MagickSafeReciprocal((double) rows));
+       if ((x_factor > 4) && (y_factor > 4))
+         {
+           thumbnail_image=SampleImage(clone_image,4*columns,4*rows,exception);
+diff --git a/MagickCore/statistic-private.h b/MagickCore/statistic-private.h
+index f873a472b..0c9a6843d 100644
+--- a/MagickCore/statistic-private.h
++++ b/MagickCore/statistic-private.h
+@@ -29,6 +29,13 @@ static inline double MagickLog10(const double x)
+   return(log10(fabs(x)));
+ }
+ 
++static inline double MagickSafeReciprocal(const double x)
++{
++  if ((x > -MagickEpsilon) && (x < MagickEpsilon))
++    return(1.0/MagickEpsilon);
++  return(1.0/x);
++}
++
+ #if defined(__cplusplus) || defined(c_plusplus)
+ }
+ #endif
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 8c83d018cc..eed07642d9 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-CVE-2025-55005.patch \
            file://0001-CVE-2025-55154.patch \
            file://0001-CVE-2025-55160.patch \
+           file://0001-CVE-2025-55212.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

