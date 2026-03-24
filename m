Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B497F532DE
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 06:09:35 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13344.1774330228298605457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 22:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UgXMY2G4;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: careers.myinfo@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12732e6a123so7676325c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 22:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330227; x=1774935027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mK28Bi7IPMLzbKXDKSO4NLt5HP3nGFgU2PITdlZL/cY=;
        b=UgXMY2G4NXcwmrUj+DVmHBwS5gSJ9DUE90EAS2cv4czDd1IRNbFrJbXOzPfbnths6z
         B2hwblE9hGseZF8tO6rAY481un5KXXgM88JKGclWbt6gyx3VtwgLAWT03plLZxmG4OIU
         gufjjV4jGwCxy2iyFKxTjCBnaXejyjhrrsa8fW/u9vimqTSKgURc3ar1qbxKbOq7QV9C
         9ew6o9av2/Tq+8yD0SNwkW5yK3rozs6bO2ffl3xXy2MOcw47oGAdASV83t4yuvqV/kz7
         67ED7oqP1jc2MmnprB1vUgwD/461Zpq0hgdlDOkqALPbg12ckJ8Vvs66ksnbx0YU4/XL
         YhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330227; x=1774935027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK28Bi7IPMLzbKXDKSO4NLt5HP3nGFgU2PITdlZL/cY=;
        b=fnBtNzqH/pK2Zy6YgL/vo2TXw735OVoTIQvgHaFX80DM/hJu9DmEPxbINORi498fAy
         nSWm6J6unyWhYYCzIf1pYqV1bOf+61kdVL+uml4Kh2SSi2qPmG3o22Eurh8IPMtS+i/7
         Zcw1gRBHkzh474r3tPP7OhFam5sVBAOVR09jd3+vavwd5XqbAwPnlEd7UY4YyH2HuQWB
         uaTS6BaP0o8owMbb754fNBUI2ZXfBQulFtXUg+wI5+G+vwjNB/mG1BnpyF3i+uiWP5uZ
         ZfV4qZzX92gHY4p8+cSu8vcuP+MBT7ltqJVuza0Ldw3DXst9JHotDYp3ZvDN3A2P2bQh
         v9lg==
X-Gm-Message-State: AOJu0YzqYO/3+lJ98Dzwkz/1cAvilRLE4FrK9tJZ43a5WCGOYksSmyWo
	4Lz7d5aCGHZMoB9owsjyffvaiHLi+6eUQYyTT/Hjj2PPTWd09nLN3E/Sd8pNLw==
X-Gm-Gg: ATEYQzy7I27RR5Vtol2G1CvSAA9jmjMuI54Chlc/m9dLdSZfncwjWiHwH3SLjAouuMc
	sCot7BoWeFCQd59PKIaSxlcg+R5dAYw9Ou3oWjUPYw4H7Xh+0opLeuw5Mq+CPq057SP5uug5i77
	/okvzLwHatssw8h47deXKjYJTcF6+GcBG3hhFHE6W6P/eHIPC65JjMZimNnZ6mfOKtdQ2oWeUf8
	mjCvoM1u+aVbajjt68No4hkqDfWokmKgNVEfk1EZvIOl3r9pa+paAfYm39NySnmUI4s+k7lfKXH
	hwFblWBqHNvQC7dsgbpvKZ8oxOgGGIrsTDTyVGi8XdwnAfgOQMGJnlphmAVAqtTINXFnfllj6zx
	S5WtxPBvQmiLT+VuMT2k14hj822AP2PSh48F6SZl83FAh5M4+U3kHUi4wU/ijrUGSS3InfTdBFZ
	r4JA7KOhL3sFHIsVqL2uQJVw==
X-Received: by 2002:a17:90b:17ce:b0:35a:cf:64a6 with SMTP id 98e67ed59e1d1-35bd2cee711mr12701956a91.23.1774329792489;
        Mon, 23 Mar 2026 22:23:12 -0700 (PDT)
Received: from L-15597L.kpit.com ([36.255.86.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c030577f7sm974295a91.0.2026.03.23.22.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:23:11 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [[OE-core][kirkstone][PATCH]] imagemagick: Fix CVE-2025-62594
Date: Tue, 24 Mar 2026 10:52:16 +0530
Message-Id: <20260324052216.2148837-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125538

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

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../imagemagick/files/CVE-2025-62594.patch    | 200 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
new file mode 100644
index 0000000000..5264e3af80
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
@@ -0,0 +1,200 @@
+From 3756fcec4fb3395b8a72dcd36d892cf3c24fdb2a Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 21 Feb 2026 20:02:51 +0530
+Subject: [PATCH] imagemagick: Unsigned underflow and division-by-zero
+lead to OOB pointer arithmetic and process crash (DoS)
+
+Reference -
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-
+wpp4-vqfq-v4hp
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
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ MagickCore/enhance.c       | 46 +++++++++++++++++++++-----------------
+ MagickCore/image-private.h | 26 +++++++++++++++++++++
+ 2 files changed, 51 insertions(+), 21 deletions(-)
+
+diff --git a/MagickCore/enhance.c b/MagickCore/enhance.c
+index 23134d5..7baeb2f 100644
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
+@@ -535,7 +532,7 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+       ClipCLAHEHistogram((double) limit,number_bins,histogram);
+       MapCLAHEHistogram(range_info,number_bins,tile_info->width*
+         tile_info->height,histogram);
+-      p+=tile_info->width;
++      p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile_info->height-1));
+     }
+     p+=clahe_info->width*(tile_info->height-1);
+   }
+@@ -578,6 +575,12 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+         }
+     for (x=0; x <= (ssize_t) clahe_info->x; x++)
+     {
++      double
++        Q11,
++        Q12,
++        Q21,
++        Q22;
++
+       tile.width=tile_info->width;
+       tile.x=x-1;
+       offset.x=tile.x+1;
+@@ -600,15 +603,16 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
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
+@@ -661,10 +665,10 @@ MagickExport MagickBooleanType CLAHEImage(Image *image,const size_t width,
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
+index 8ce0208..f3ab19f 100644
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
+@@ -52,6 +54,30 @@ extern "C" {
+ #define TransparentColor  "#00000000"  /* transparent black */
+ #define UndefinedCompressionQuality  0UL
+ #define UndefinedTicksPerSecond  100L
++ 
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
+ 
+ static inline ssize_t CastDoubleToLong(const double x)
+ {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 81f4596456..03ee9f3b25 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2022-1115.patch \
     file://CVE-2025-65955.patch \
     file://CVE-2025-62171.patch \
+    file://CVE-2025-62594.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.34.1


