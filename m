Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF75F8A16A
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:09:33 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11417.1776338165639681181
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 04:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c9aY4G06;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: careers.myinfo@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cfc3ca1922so57507985a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776338164; x=1776942964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QigkK8VqnVVwVjhBn4Dons8VZ1YQqmk97AMAML3kqz4=;
        b=c9aY4G06QwU6B+RXDv6tRYawnNizjmEb2AB2ddVNW/vXneiiNPLwQgJl1bY5MOEx+j
         ZGiRVRV5a62d5gPiuWs7/Nd8rj3Xd7+45R4mME83rUW7lCqmAMxS3UqKElXhKyKcUGld
         3U1G4Fx5TxqNWyNs61/59NzwJmMAlpcQaWOy7AOH2lhITwzK5xTPjCD7+MzTiCuvCygI
         8xOOJbaUL4T/ZwQTK/6F31dZi4vlUM0drMZ42PudImT7H1kydu6HKc63IFGdYsZIzbSI
         KuRPcP8WXELhCxmkrn1XdBRweMjOkzM2R8gUi7vNdiSnIvJ37f8TQoCiYVFuja+JjcAE
         C94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338164; x=1776942964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QigkK8VqnVVwVjhBn4Dons8VZ1YQqmk97AMAML3kqz4=;
        b=gr5oOdhDSSWOyAf9Rw5Dge08smJmYcq63ToDWvsoB7Dhov2r4ykiz9sBbRCLDdGSn0
         eB7E6M6G8VxM4Jy60lDnbJbV0ya8NjleWk9kENOycu6Qz4HAeZVv/gfdx8xdws36yrTT
         Oo54ZI/SR5QZYuaIwdcute5sj+CofrZ6KpjdVV6Ikj9qJ0+sHh9sCuDk5nke8nOMbeUG
         q+fLMarNSBb3vHIt4OB6cSDhy9YQsqnp5q1XL0x/HUb5I8cV72+21yk+wySd0VIgC+k9
         vgdAbMqVZIusQznGfeHvk34P9G2EL9o4t/bGl/zHjSiwNraDspnqxONszwHmDHarJUwF
         voMA==
X-Gm-Message-State: AOJu0Ywuh7mG2bW/8PxwDm5y46ofibbMAeZCNR2JYPDhHSVdU9LU3Byb
	0AktdCxFxOn2cBk0FiVweQUIviJ426ArTSgu7kia+RPAzfqXVixP7LmdoYnwpQ==
X-Gm-Gg: AeBDievly4hmczFX9wOd5WpVvEHQLY3xRLsVx3ZZPh2UPKmwUKLvvVWYlYqqzYs2JSE
	8gvGnuXU2e6GRKbTyqpfMnWknzm6VWVhPkyXB6rQDVgtQx/DlgJmLUElcAiTpbrEk7o8Fg4CG7u
	pX5q/NQVh+GDqsWZAZiGgUayzMb5lDJC2ErgMBRGlFrk8xNkyVrezkHtwmufmJP+c6TO+4hpAe9
	n/XHU4ueB2Dh/RwbaZWVOmn+jTXznxai++8jtAFspfOyG/IzUBnHvLGmY7yMm32/E8X/jaT++G/
	ZbcgbZDPwcy/oMwUqWF3MsTAlWZF5J7nHKc12I50qw0ef8H0fC6xF3OADXVrL8rkeu2cCk8KPgH
	CC5TFoOCwkTkH0PyvKLeuzbDnE34BYibTSSzjW//N9osz+awKA/wm/qJw3bYgb+DQDnLoqk3KaQ
	X+JaJe8v+HCK4H9CnLurb6+HuK0h8gx2hmGeOxx0n+bXe3DOaWvUgQRfnj
X-Received: by 2002:a05:6a20:2589:b0:398:9243:2ae0 with SMTP id adf61e73a8af0-3a06d1072a2mr3360846637.5.1776337840059;
        Thu, 16 Apr 2026 04:10:40 -0700 (PDT)
Received: from L-15597L.kpit.com ([49.205.102.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957eeb35csm4089503a12.12.2026.04.16.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:10:39 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moin.shaik@partner.bmwgroup.com>
To: openembedded-devel@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [[OE-core][kirkstone][PATCH]] imagemagick: Fix CVE-2025-62594
Date: Thu, 16 Apr 2026 16:39:39 +0530
Message-Id: <20260416110939.1051493-1-moin.shaik@partner.bmwgroup.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 12:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126405

From: Shaik Moin <careers.myinfo@gmail.com>

Backport the fix for CVE-2025-62594

Changes are made with 7.0.10 version code and only required and
compatible code is taken into patch.
image-private.h:-
Integrated only the essential and compatible updates from the 7.0.10
upstream patch. Specifically, the changes related to the Macro's and
CastDoubleToPtrdiffT were adopted, as these updates are directly tied to
the vulnerability fix. The remaining modifications in this file were
excluded because they do not affect the execution paths relevant to our
codebase.
composite.c:-
This file was intentionally left unchanged. The upstream patch contains
only a formatting update (a trailing space adjustment) with no
functional relevance or security impact, so the change was not included
in our patch.
enhance.c:-
All functional hunks from the upstream vulnerability fix were applied.
These modifications directly contribute to addressing the CVE by
strengthening bounds handling and improving input validation in the
enhancement routines.

Signed-off-by: Shaik Moin <careers.myinfo@gmail.com>
---
 .../imagemagick/files/CVE-2025-62594.patch    | 197 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
new file mode 100644
index 0000000000..66670a61df
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
@@ -0,0 +1,197 @@
+From 766d3f6eb8a536dd33ce9b43df361e13e34bcf45 Mon Sep 17 00:00:00 2001
+From: Shaik Moin <careers.myinfo@gmail.com>
+Date: Tue, 7 Apr 2026 15:31:24 +0530
+Subject: [PATCH] imagemagick: Fix CVE-2025-62594
+
+ImageMagick CLAHE : Unsigned underflow and division-by-zero lead to OOB pointer arithmetic and process crash (DoS)
+Reference - https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-wpp4-vqfq-v4hp
+
+CVE: CVE-2025-62594
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/7b47fe369eda90483402fcd3d78fa4167d3bb129]
+
+Changes are made with 7.0.10 version code and only required and
+compatible code is taken into patch.
+In image-private.h file, only couple of "MACRO's" and
+"CastDoubleToPtrdiffT" is taken as other functions are not effecting our
+current code.
+Composite.c file - is not taken in consideration as the change is for a
+space " ".
+Enhance.c file - All hunks are taken in our current code.
+
+Signed-off-by: Cristy <urban-warrior@imagemagick.org>
+Signed-off-by: Shaik Moin <careers.myinfo@gmail.com>
+---
+ MagickCore/enhance.c       | 45 ++++++++++++++++++++------------------
+ MagickCore/image-private.h | 26 ++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 21 deletions(-)
+
+diff --git a/MagickCore/enhance.c b/MagickCore/enhance.c
+index 23134d5..54b2695 100644
+--- a/MagickCore/enhance.c
++++ b/MagickCore/enhance.c
+@@ -69,6 +69,7 @@
+ #include "MagickCore/option.h"
+ #include "MagickCore/pixel.h"
+ #include "MagickCore/pixel-accessor.h"
++#include "MagickCore/pixel-private.h"
+ #include "MagickCore/quantum.h"
+ #include "MagickCore/quantum-private.h"
+ #include "MagickCore/resample.h"
+@@ -320,11 +321,8 @@ static void ClipCLAHEHistogram(const double clip_limit,const size_t number_bins,
+   */
+   cumulative_excess=0;
+   for (i=0; i < (ssize_t) number_bins; i++)
+-  {
+-    excess=(ssize_t) histogram[i]-(ssize_t) clip_limit;
+-    if (excess > 0)
+-      cumulative_excess+=excess;
+-  }
++    if (histogram[i] > clip_limit)
++      cumulative_excess+=(ssize_t) (histogram[i]-clip_limit);
+   /*
+     Clip histogram and redistribute excess pixels across all bins.
+   */
+@@ -483,9 +481,6 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+   MemoryInfo
+     *tile_cache;
+ 
+-  unsigned short
+-    *p;
+-
+   size_t
+     limit,
+     *tiles;
+@@ -494,14 +489,15 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+     y;
+ 
+   unsigned short
+-    *lut;
++    *lut,
++    *p;
+ 
+   /*
+     Constrast limited adapted histogram equalization.
+   */
+   if (clip_limit == 1.0)
+     return(MagickTrue);
+-  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,
++  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,(size_t)
+     clahe_info->y*sizeof(*tiles));
+   if (tile_cache == (MemoryInfo *) NULL)
+     return(MagickFalse);
+@@ -512,7 +508,8 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+       return(MagickFalse);
+     }
+   tiles=(size_t *) GetVirtualMemoryBlob(tile_cache);
+-  limit=(size_t) (clip_limit*(tile_info->width*tile_info->height)/number_bins);
++  limit=(size_t) (clip_limit*((double) tile_info->width*tile_info->height)/
++    number_bins);
+   if (limit < 1UL)
+     limit=1UL;
+   /*
+@@ -537,7 +534,7 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+         tile_info->height,histogram);
+       p+=tile_info->width;
+     }
+-    p+=clahe_info->width*(tile_info->height-1);
++    p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile_info->height-1));
+   }
+   /*
+     Interpolate greylevel mappings to get CLAHE image.
+@@ -578,6 +575,11 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+         }
+     for (x=0; x <= (ssize_t) clahe_info->x; x++)
+     {
++      double
++        Q11,
++        Q12,
++        Q21,
++        Q22;
+       tile.width=tile_info->width;
+       tile.x=x-1;
+       offset.x=tile.x+1;
+@@ -600,15 +602,16 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+             tile.x=clahe_info->x-1;
+             offset.x=tile.x;
+           }
+-      InterpolateCLAHE(clahe_info,
+-        tiles+(number_bins*(tile.y*clahe_info->x+tile.x)),     /* Q12 */
+-        tiles+(number_bins*(tile.y*clahe_info->x+offset.x)),   /* Q22 */
+-        tiles+(number_bins*(offset.y*clahe_info->x+tile.x)),   /* Q11 */
+-        tiles+(number_bins*(offset.y*clahe_info->x+offset.x)), /* Q21 */
+-        &tile,lut,p);
++      Q12=(double) number_bins*(tile.y*clahe_info->x+tile.x);
++      Q22=(double) number_bins*(tile.y*clahe_info->x+offset.x);
++      Q11=(double) number_bins*(offset.y*clahe_info->x+tile.x);
++      Q21=(double) number_bins*(offset.y*clahe_info->x+offset.x);
++      InterpolateCLAHE(clahe_info,tiles+CastDoubleToPtrdiffT(Q12),
++        tiles+CastDoubleToPtrdiffT(Q22),tiles+CastDoubleToPtrdiffT(Q11),
++        tiles+CastDoubleToPtrdiffT(Q21),&tile,lut,p);
+       p+=tile.width;
+     }
+-    p+=clahe_info->width*(tile.height-1);
++    p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile.height-1));
+   }
+   lut=(unsigned short *) RelinquishMagickMemory(lut);
+   tile_cache=RelinquishVirtualMemory(tile_cache);
+@@ -661,10 +664,10 @@ MagickExport MagickBooleanType CLAHEImage(Image *image,const size_t width,
+     (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",image->filename);
+   range_info.min=0;
+   range_info.max=NumberCLAHEGrays-1;
+-  tile_info.width=width;
++  tile_info.width=MagickMax(width,2);
+   if (tile_info.width == 0)
+     tile_info.width=image->columns >> 3;
+-  tile_info.height=height;
++  tile_info.height=MagickMax(height,2);
+   if (tile_info.height == 0)
+     tile_info.height=image->rows >> 3;
+   tile_info.x=0;
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index 8ce0208..eaed34f 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -38,6 +38,8 @@ extern "C" {
+ #define MagickPHI    1.61803398874989484820458683436563811772030917980576
+ #define MagickPI2    1.57079632679489661923132169163975144209858469968755
+ #define MagickPI  3.14159265358979323846264338327950288419716939937510
++#define MAGICK_PTRDIFF_MAX  (PTRDIFF_MAX)
++#define MAGICK_PTRDIFF_MIN  (-PTRDIFF_MAX-1)
+ #define MagickSQ1_2  0.70710678118654752440084436210484903928483593768847
+ #define MagickSQ2    1.41421356237309504880168872420969807856967187537695
+ #define MagickSQ2PI  2.50662827463100024161235523934010416269302368164062
+@@ -53,6 +55,30 @@ extern "C" {
+ #define UndefinedCompressionQuality  0UL
+ #define UndefinedTicksPerSecond  100L
+ 
++static inline ptrdiff_t CastDoubleToPtrdiffT(const double x)
++{
++  double
++    value;
++
++  if (IsNaN(x) != 0)
++    {
++      errno=ERANGE;
++      return(0);
++    }
++  value=(x < 0.0) ? ceil(x) : floor(x);
++  if (value < ((double) MAGICK_PTRDIFF_MIN))
++    {
++      errno=ERANGE;
++      return(MAGICK_PTRDIFF_MIN);
++    }
++  if (value > ((double) MAGICK_PTRDIFF_MAX))
++    {
++      errno=ERANGE;
++      return(MAGICK_PTRDIFF_MAX);
++    }
++  return((ptrdiff_t) value);
++}
++
+ static inline ssize_t CastDoubleToLong(const double x)
+ {
+   if (IsNaN(x) != 0)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 9bc857b715..d6e1c647c7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2026-22770.patch \
     file://CVE-2026-23874.patch \
     file://CVE-2026-23876.patch \
+    file://CVE-2025-62594.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


