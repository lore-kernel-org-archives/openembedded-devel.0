Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8029CF532E1
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 06:09:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13335.1774330171692316728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 22:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hh16wMrv;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so2431325a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 22:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774330170; x=1774934970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ob5UkoH9XRf51Qe5bbqP+jLLkcgOStHwOs8nmwPLiYw=;
        b=Hh16wMrvw4Anl9iLxYlKOakW6pViGNFT0clo1GSwhoFce8nIIZjfTbyMdgRpUqV8mc
         9T2P01pic3JEb6SGRj4PmPVVerCAIiN/fMRqlc5nUM7Iv5HdJlMvSMeiJhsBlyrRmWr7
         WeGNzVf0vLyb5kl1EibBHfm29tGUH9pyuQx9gU2z/I0mVz7RUy2yd50EGiv7Khzhdp4A
         Rd0EOnoGUDfuUIk38n8HIfjuI3/y0JOlZUxP/8J0ropIxGfidVerlJUWod2+oLYKTBkN
         U+4U+B1rbQCDKREKtDUCNj9fuZKbcHG5odwxWnUrfgRJRxFw1eNlJjNRh0RSJdI4qFK9
         2W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330170; x=1774934970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob5UkoH9XRf51Qe5bbqP+jLLkcgOStHwOs8nmwPLiYw=;
        b=TNB7abVGml6YP2p9oZfSfEJRjCfvT+Ub5tk7OTrcPiXjbVFSPNXJRyTw7BijqRxmSR
         U6Dzhr9C7NDA96XXwbCJqUpfkDg0u8ByA47LUGk5hgCS+7gMaqM8k7I35Yc9Od1EzWsd
         IqYbumbu/xnVffViEnYaDgVsekYvhrh9fvrg4hbJIsrNR/MTNz3aKCBcej0/udUy7L21
         L7lrBMqX7aJz+A3HhRW35gnepjnhmZFYigJQAbb797JpbUV6BzHREIvWEXb04Vr+a/6m
         +yQXbsPHKfk2T1PYwo9IDr1RWrOqbGlMmdZmgiL6TE0JSKHY+BWQqoH/RRH4tX7B6csw
         aQMA==
X-Gm-Message-State: AOJu0Yw5qz6vH5Fjj6yRRdV+IO6nBm2qUW61nUNR62H9svhPi9mwO7Av
	+arGeAOdd8PrBiBvtXNarBeKnquMnolSXyIV9fIXq5pF2UXLDF8x/afpL/OzjQ==
X-Gm-Gg: ATEYQzy4IWA7wyR/nNExk7wMGz24Kh2EN+TmgjqDJt2oyUJI9fTUWN0yMfwUXEI9gXq
	Xht3G+Q/Wmq5t8BGktlfnQylU2apIIWQd0trqB584Ay74HEZj1jZ3CpsHtZaIES7iChL1lJFAA5
	5R6v5BJm+a6ck7rbi3xYbJoxcWW9ksiVjwyXAH+CKyznDCoaQsGJB2fADW7JCyap+T3IgULiBzg
	Ghj+7mOrKnUdC3OCGJCnZ4MXsDHVd6dCfsGh8WaVu78Ut84ud6Ye2gSRDo1u+KJ6U/SyktG2rJv
	FavmOi5ckm6E6Z93CZMs7vDIxmLaarBOlA7XpC6MTWv/ZX/LFJB4ptiK1ARnPq/PqLQY686h/MH
	qilDB9OIyXkkuQFck6c9Jd0hARtjjWT3s6Z+MorlnVGBeEfqU5/S73khrqGxGKrsQOS7XDz5Qae
	Hq1G5zasGY/ReWO7VTG/lqlw==
X-Received: by 2002:a17:903:124f:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0827cf462mr156798895ad.46.1774330170303;
        Mon, 23 Mar 2026 22:29:30 -0700 (PDT)
Received: from L-15597L.kpit.com ([36.255.86.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083679867sm152469675ad.65.2026.03.23.22.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:29:29 -0700 (PDT)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [[OE-core][scarthgap][PATCH]] imagemagick: Fix CVE-2025-62594
Date: Tue, 24 Mar 2026 10:58:34 +0530
Message-Id: <20260324052834.2150224-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125539

Backport the fix for CVE-2025-62594

Changes are made with 7.1.1 version code and only required and
compatible code is taken into patch.
image-private.h:-
Integrated only the essential and compatible updates from the 7.1.1
upstream patch. Specifically, the changes related to the
CastDoubleToPtrdiffT and CastDoubleToQuantumAny macros were adopted, as
these updates are directly tied to the vulnerability fix. The remaining
modifications in this file were excluded because they do not affect the
execution paths relevant to our codebase.
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
 .../imagemagick/CVE-2025-62594.patch          | 229 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62594.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62594.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62594.patch
new file mode 100644
index 0000000000..947ab254e6
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-62594.patch
@@ -0,0 +1,229 @@
+From 6915701d2cb9bb5b404517938d75274877994646 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 22 Feb 2026 11:17:14 +0530
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
+Changes are made with 7.1.1 version code and only required and
+compatible code is taken into patch.
+In image-private.h file, only couple of "MACRO's",
+"CastDoubleToPtrdiffT" and CastDoubleToQuantumAny changes are taken as
+other functions are not effecting our current code.
+Composite.c file - is not taken in consideration as the change is for a
+space " ".
+Enhance.c file - All hunks are applied to the current code.
+
+Signed-off-by: Cristy <urban-warrior@imagemagick.org>
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ MagickCore/enhance.c       | 48 +++++++++++++++++++++-----------------
+ MagickCore/image-private.h | 40 +++++++++++++++++++++++++++----
+ 2 files changed, 61 insertions(+), 27 deletions(-)
+
+diff --git a/MagickCore/enhance.c b/MagickCore/enhance.c
+index ee9d304..ee39476 100644
+--- a/MagickCore/enhance.c
++++ b/MagickCore/enhance.c
+@@ -69,6 +69,7 @@
+ #include "MagickCore/option.h"
+ #include "MagickCore/pixel.h"
+ #include "MagickCore/pixel-accessor.h"
++#include "MagickCore/pixel-private.h"
+ #include "MagickCore/property.h"
+ #include "MagickCore/quantum.h"
+ #include "MagickCore/quantum-private.h"
+@@ -318,11 +319,8 @@ static void ClipCLAHEHistogram(const double clip_limit,const size_t number_bins,
+     return;
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
+@@ -481,9 +479,6 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+   MemoryInfo
+     *tile_cache;
+ 
+-  unsigned short
+-    *p;
+-
+   size_t
+     limit,
+     *tiles;
+@@ -492,15 +487,16 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+     y;
+ 
+   unsigned short
+-    *lut;
++    *lut,
++    *p;
+ 
+   /*
+     Contrast limited adapted histogram equalization.
+   */
+   if (clip_limit == 1.0)
+     return(MagickTrue);
+-  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,
+-    (size_t) clahe_info->y*sizeof(*tiles));
++  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,(size_t)
++    clahe_info->y*sizeof(*tiles));
+   if (tile_cache == (MemoryInfo *) NULL)
+     return(MagickFalse);
+   lut=(unsigned short *) AcquireQuantumMemory(NumberCLAHEGrays,sizeof(*lut));
+@@ -510,7 +506,8 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
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
+         tile_info->height,histogram);
+       p+=(ptrdiff_t) tile_info->width;
+     }
+-    p+=(ptrdiff_t) clahe_info->width*(tile_info->height-1);
++    p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile_info->height-1));
+   }
+   /*
+     Interpolate greylevel mappings to get CLAHE image.
+@@ -576,6 +573,12 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
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
+@@ -598,15 +601,16 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
+             tile.x=clahe_info->x-1;
+             offset.x=tile.x;
+           }
+-      InterpolateCLAHE(clahe_info,
+-        tiles+((ssize_t) number_bins*(tile.y*clahe_info->x+tile.x)),   /* Q12 */
+-        tiles+((ssize_t) number_bins*(tile.y*clahe_info->x+offset.x)), /* Q22 */
+-        tiles+((ssize_t) number_bins*(offset.y*clahe_info->x+tile.x)), /* Q11 */
+-        tiles+((ssize_t) number_bins*(offset.y*clahe_info->x+offset.x)), /* Q21 */
+-        &tile,lut,p);
++      Q12=(double) number_bins*(tile.y*clahe_info->x+tile.x);
++      Q22=(double) number_bins*(tile.y*clahe_info->x+offset.x);
++      Q11=(double) number_bins*(offset.y*clahe_info->x+tile.x);
++      Q21=(double) number_bins*(offset.y*clahe_info->x+offset.x);
++      InterpolateCLAHE(clahe_info,tiles+CastDoubleToPtrdiffT(Q12),
++        tiles+CastDoubleToPtrdiffT(Q22),tiles+CastDoubleToPtrdiffT(Q11),
++        tiles+CastDoubleToPtrdiffT(Q21),&tile,lut,p);
+       p+=(ptrdiff_t) tile.width;
+     }
+-    p+=(ptrdiff_t) clahe_info->width*(tile.height-1);
++    p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile.height-1));
+   }
+   lut=(unsigned short *) RelinquishMagickMemory(lut);
+   tile_cache=RelinquishVirtualMemory(tile_cache);
+@@ -659,10 +663,10 @@ MagickExport MagickBooleanType CLAHEImage(Image *image,const size_t width,
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
+index 11dca10..e740ccf 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -46,6 +46,8 @@ extern "C" {
+ #define MagickPHI    1.61803398874989484820458683436563811772030917980576
+ #define MagickPI2    1.57079632679489661923132169163975144209858469968755
+ #define MagickPI     3.1415926535897932384626433832795028841971693993751058209749445923078164062
++#define MAGICK_PTRDIFF_MAX  (PTRDIFF_MAX)
++#define MAGICK_PTRDIFF_MIN  (-PTRDIFF_MAX-1)
+ #define MagickSQ1_2  0.70710678118654752440084436210484903928483593768847
+ #define MagickSQ2    1.41421356237309504880168872420969807856967187537695
+ #define MagickSQ2PI  2.50662827463100024161235523934010416269302368164062
+@@ -96,24 +98,52 @@ static inline ssize_t CastDoubleToLong(const double x)
+   return((ssize_t) value);
+ }
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
+ static inline QuantumAny CastDoubleToQuantumAny(const double x)
+ {
++  double
++    value;
++
+   if (IsNaN(x) != 0)
+     {
+       errno=ERANGE;
+       return(0);
+     }
+-  if (x > ((double) ((QuantumAny) ~0)))
++  value=(x < 0.0) ? ceil(x) : floor(x);
++  if (value < 0.0)
+     {
+       errno=ERANGE;
+-      return((QuantumAny) ~0);
++      return(0);
+     }
+-  if (x < 0.0)
++  if (value > ((double) ((QuantumAny) ~0)))
+     {
+       errno=ERANGE;
+-      return((QuantumAny) 0);
++      return((QuantumAny) ~0);
+     }
+-  return((QuantumAny) (x+0.5));
++  return((QuantumAny) value);
+ }
+ 
+ static inline size_t CastDoubleToUnsigned(const double x)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 40e57b7f1d..6fc71c9580 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-62171.patch \
            file://CVE-2025-65955.patch \
            file://CVE-2025-66628.patch \
+           file://CVE-2025-62594.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 
-- 
2.34.1


