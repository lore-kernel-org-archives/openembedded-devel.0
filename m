Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A69BF532E8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 07:09:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14224.1774336139024014169
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 00:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NZJyrEnt;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso31890085e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 00:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774336137; x=1774940937; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcTLRm7WblfBj6MtwipW/awv8vaZUUOgTqCQ+y0DllU=;
        b=NZJyrEntCGg8Fn9ZpUqB6bt4OpZQGMilL5MnO3dTrLWWef28jqHfrhMm987BpJ6m89
         mNg/Lsserer1ZwSMWNAT9kad5b+oyECtNaGVWqew9yt4BfvGjQ0rbhchx4oV60BNDUWK
         nushz51ha9w65LUzrR5L9QlvTRccVE1ynsEbH+ihtC8b79QbrwtaJTbHQavyOVoOgvnr
         CKZtSFnic5oIA5WASIQcSKdAKXC6UpGnmpwKEuXUgr+HdTc4Dw3OvyUTwJWyP2cVgk9X
         ibGGK9g7u78cWJ9o+jDyyfeuDq0/PKnLd4eOPM1bA4r0Sug5B9uQ417jij9JGahSJBJ/
         fvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774336137; x=1774940937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcTLRm7WblfBj6MtwipW/awv8vaZUUOgTqCQ+y0DllU=;
        b=jJsznbnYjJnNgC6AZdNrPaZf+xpQ5W1N7uid3OSXuMQ9Vn8u8a8NCZz/LeZOZq92up
         +Z5VHZvH7WX+PEQayrC6geXBnn4vrznuJBrrnTYqkHdpIiZoIltRHGrjBzEraKxEJme8
         3VJtThKMQsyV8zm/roQnJGMtG6qmt+pltiF+26oT7bKnaeQWOxDV+/7hR2jI+kY0wLV1
         UYrhCxgdynuruzYrEHitU5dzNv+cQUZTj4+fYsI86AtjfK3KBWxFwTaabDOiFQQ7CBlI
         krVVPdqtdHOi5R6uREbQCmR9XDw0AjnCazNtWqjAtOjuvUbpaES5o6c6mFyUFT6OPV5Z
         WXqw==
X-Forwarded-Encrypted: i=1; AJvYcCVcqmhnSi3aRvXUlaUbGcugpxbwVZ4+AIjbv4UAaCWSwKW9IxwKmSYhwDZsUMclL5cPWJtQVpvsX1jFgNtIQWLWdbI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTHIuCdgQ+G30sXKAnbrwR27kXnvAW6H1Iteklb1FHAy18zRBQ
	uL9VC8/d2nXp1pPBZVTqpKYJ0IY2Nw0SSv4Me3aAJLtfIAXZSq9SwwaY
X-Gm-Gg: ATEYQzxNtmhK1g5LDO6B9mGc1COMV6Qa4kSoC+RCfr6SgnUorC7VhVDYZvgge3pIIMe
	6u4DuVhozyMGOzm9JV2Up4YnVq+ribd07PPxV1NgcjaBoUPYKqqN16I+GmV+GqDLCcukD/5IQMf
	6CwlgyI7qy/NRinRssD97QSYiCbXHtlLNkCD8pqd7EPq6y++Hq6i+tm1iKL79GBqMeSH+8/P4UA
	h6hjV7qlF4LwyEQbCNcAwVJvdSwkrTt9W0BmpffCzHVpmd8v6gK6IbYxllYASkYeS1GUSOnzcCU
	LEvIjE61F45RksYV7h//68ebnftpyS+KvTfMxeCGBarPk4E4iO/TmQBXHFXnrxkvNpYNLXxiEoj
	7B6mTb+7EnMPZc9mbGN++wdx49qfTCanW2ZNHwUamz5oa2ASVkJ6fj5Y4kpFN8sGalfgH3C2HVK
	MHJ9SsxXif9IyKzzGyUYqvMTjUFk7lh+8=
X-Received: by 2002:a5d:588f:0:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-43b6423fb3dmr23521299f8f.5.1774336136872;
        Tue, 24 Mar 2026 00:08:56 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm36572506f8f.17.2026.03.24.00.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 00:08:56 -0700 (PDT)
Message-ID: <9920b4a4-8bb3-4bc6-b924-6da3e11bb773@gmail.com>
Date: Tue, 24 Mar 2026 08:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [[OE-core][kirkstone][PATCH]] imagemagick: Fix
 CVE-2025-62594
To: careers.myinfo@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260324052216.2148837-1-moins@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260324052216.2148837-1-moins@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 07:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125541



On 3/24/26 06:22, Shaik Moin via lists.openembedded.org wrote:
> Backport the fix for CVE-2025-62594
> 
> Changes are made with 7.0.10 version code and only required and
> compatible code is taken into patch.
> image-private.h:-
> Integrated only the essential and compatible updates from the 7.0.10
> upstream patch. Specifically, the changes related to the Macro's and
> CastDoubleToPtrdiffT were adopted, as these updates are directly tied to
> the vulnerability fix. The remaining modifications in this file were
> excluded because they do not affect the execution paths relevant to our
> codebase.
> composite.c:-
> This file was intentionally left unchanged. The upstream patch contains
> only a formatting update (a trailing space adjustment) with no
> functional relevance or security impact, so the change was not included
> in our patch.
> enhance.c:-
> All functional hunks from the upstream vulnerability fix were applied.
> These modifications directly contribute to addressing the CVE by
> strengthening bounds handling and improving input validation in the
> enhancement routines.
> 
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  .../imagemagick/files/CVE-2025-62594.patch    | 200 ++++++++++++++++++
>  .../imagemagick/imagemagick_7.0.10.bb         |   1 +
>  2 files changed, 201 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
> 
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
> new file mode 100644
> index 0000000000..5264e3af80
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-62594.patch
> @@ -0,0 +1,200 @@
> +From 3756fcec4fb3395b8a72dcd36d892cf3c24fdb2a Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sat, 21 Feb 2026 20:02:51 +0530
> +Subject: [PATCH] imagemagick: Unsigned underflow and division-by-zero
> +lead to OOB pointer arithmetic and process crash (DoS)
> +
> +Reference -
> +https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-
> +wpp4-vqfq-v4hp
> +
> +CVE: CVE-2025-62594
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/7b47fe369eda90483402fcd3d78fa4167d3bb129]
> +
> +Changes are made with 7.0.10 version code and only required and
> +compatible code is taken into patch.
> +In image-private.h file, only couple of "MACRO's" and
> +"CastDoubleToPtrdiffT" is taken as other functions are not effecting our
> +current code.
> +Composite.c file - is not taken in consideration as the change is for a
> +space " ".
> +Enhance.c file - All hunks are taken in our current code.
> +
> +Signed-off-by: Cristy <urban-warrior@imagemagick.org>
> +Signed-off-by: Shaik Moin <moins@kpit.com>
> +---
> + MagickCore/enhance.c       | 46 +++++++++++++++++++++-----------------
> + MagickCore/image-private.h | 26 +++++++++++++++++++++
> + 2 files changed, 51 insertions(+), 21 deletions(-)
> +
> +diff --git a/MagickCore/enhance.c b/MagickCore/enhance.c
> +index 23134d5..7baeb2f 100644
> +--- a/MagickCore/enhance.c
> ++++ b/MagickCore/enhance.c
> +@@ -69,6 +69,7 @@
> + #include "MagickCore/option.h"
> + #include "MagickCore/pixel.h"
> + #include "MagickCore/pixel-accessor.h"
> ++#include "MagickCore/pixel-private.h"
> + #include "MagickCore/quantum.h"
> + #include "MagickCore/quantum-private.h"
> + #include "MagickCore/resample.h"
> +@@ -320,11 +321,8 @@ static void ClipCLAHEHistogram(const double clip_limit,const size_t number_bins,
> +   */
> +   cumulative_excess=0;
> +   for (i=0; i < (ssize_t) number_bins; i++)
> +-  {
> +-    excess=(ssize_t) histogram[i]-(ssize_t) clip_limit;
> +-    if (excess > 0)
> +-      cumulative_excess+=excess;
> +-  }
> ++    if (histogram[i] > clip_limit)
> ++      cumulative_excess+=(ssize_t) (histogram[i]-clip_limit);
> +   /*
> +     Clip histogram and redistribute excess pixels across all bins.
> +   */
> +@@ -483,9 +481,6 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +   MemoryInfo
> +     *tile_cache;
> + 
> +-  unsigned short
> +-    *p;
> +-
> +   size_t
> +     limit,
> +     *tiles;
> +@@ -494,14 +489,15 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +     y;
> + 
> +   unsigned short
> +-    *lut;
> ++    *lut,
> ++    *p;
> + 
> +   /*
> +     Constrast limited adapted histogram equalization.
> +   */
> +   if (clip_limit == 1.0)
> +     return(MagickTrue);
> +-  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,
> ++  tile_cache=AcquireVirtualMemory((size_t) clahe_info->x*number_bins,(size_t)
> +     clahe_info->y*sizeof(*tiles));
> +   if (tile_cache == (MemoryInfo *) NULL)
> +     return(MagickFalse);
> +@@ -512,7 +508,8 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +       return(MagickFalse);
> +     }
> +   tiles=(size_t *) GetVirtualMemoryBlob(tile_cache);
> +-  limit=(size_t) (clip_limit*(tile_info->width*tile_info->height)/number_bins);
> ++  limit=(size_t) (clip_limit*((double) tile_info->width*tile_info->height)/
> ++    number_bins);
> +   if (limit < 1UL)
> +     limit=1UL;
> +   /*
> +@@ -535,7 +532,7 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +       ClipCLAHEHistogram((double) limit,number_bins,histogram);
> +       MapCLAHEHistogram(range_info,number_bins,tile_info->width*
> +         tile_info->height,histogram);
> +-      p+=tile_info->width;
> ++      p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile_info->height-1));


Is this change correct here? Shouldn't this change be 2 lines below,
outside of the innermost for loop? (or looking at the code, maybe it
should be even at both places?)
Or am I misreading this?


> +     }
> +     p+=clahe_info->width*(tile_info->height-1);
> +   }
> +@@ -578,6 +575,12 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +         }
> +     for (x=0; x <= (ssize_t) clahe_info->x; x++)
> +     {
> ++      double
> ++        Q11,
> ++        Q12,
> ++        Q21,
> ++        Q22;
> ++
> +       tile.width=tile_info->width;
> +       tile.x=x-1;
> +       offset.x=tile.x+1;
> +@@ -600,15 +603,16 @@ static MagickBooleanType CLAHE(const RectangleInfo *clahe_info,
> +             tile.x=clahe_info->x-1;
> +             offset.x=tile.x;
> +           }
> +-      InterpolateCLAHE(clahe_info,
> +-        tiles+(number_bins*(tile.y*clahe_info->x+tile.x)),     /* Q12 */
> +-        tiles+(number_bins*(tile.y*clahe_info->x+offset.x)),   /* Q22 */
> +-        tiles+(number_bins*(offset.y*clahe_info->x+tile.x)),   /* Q11 */
> +-        tiles+(number_bins*(offset.y*clahe_info->x+offset.x)), /* Q21 */
> +-        &tile,lut,p);
> ++      Q12=(double) number_bins*(tile.y*clahe_info->x+tile.x);
> ++      Q22=(double) number_bins*(tile.y*clahe_info->x+offset.x);
> ++      Q11=(double) number_bins*(offset.y*clahe_info->x+tile.x);
> ++      Q21=(double) number_bins*(offset.y*clahe_info->x+offset.x);
> ++      InterpolateCLAHE(clahe_info,tiles+CastDoubleToPtrdiffT(Q12),
> ++        tiles+CastDoubleToPtrdiffT(Q22),tiles+CastDoubleToPtrdiffT(Q11),
> ++        tiles+CastDoubleToPtrdiffT(Q21),&tile,lut,p);
> +       p+=tile.width;
> +     }
> +-    p+=clahe_info->width*(tile.height-1);
> ++    p+=CastDoubleToPtrdiffT((double) clahe_info->width*(tile.height-1));
> +   }
> +   lut=(unsigned short *) RelinquishMagickMemory(lut);
> +   tile_cache=RelinquishVirtualMemory(tile_cache);
> +@@ -661,10 +665,10 @@ MagickExport MagickBooleanType CLAHEImage(Image *image,const size_t width,
> +     (void) LogMagickEvent(TraceEvent,GetMagickModule(),"%s",image->filename);
> +   range_info.min=0;
> +   range_info.max=NumberCLAHEGrays-1;
> +-  tile_info.width=width;
> ++  tile_info.width=MagickMax(width,2);
> +   if (tile_info.width == 0)
> +     tile_info.width=image->columns >> 3;
> +-  tile_info.height=height;
> ++  tile_info.height=MagickMax(height,2);
> +   if (tile_info.height == 0)
> +     tile_info.height=image->rows >> 3;
> +   tile_info.x=0;
> +diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
> +index 8ce0208..f3ab19f 100644
> +--- a/MagickCore/image-private.h
> ++++ b/MagickCore/image-private.h
> +@@ -38,6 +38,8 @@ extern "C" {
> + #define MagickPHI    1.61803398874989484820458683436563811772030917980576
> + #define MagickPI2    1.57079632679489661923132169163975144209858469968755
> + #define MagickPI  3.14159265358979323846264338327950288419716939937510
> ++#define MAGICK_PTRDIFF_MAX  (PTRDIFF_MAX)
> ++#define MAGICK_PTRDIFF_MIN  (-PTRDIFF_MAX-1)
> + #define MagickSQ1_2  0.70710678118654752440084436210484903928483593768847
> + #define MagickSQ2    1.41421356237309504880168872420969807856967187537695
> + #define MagickSQ2PI  2.50662827463100024161235523934010416269302368164062
> +@@ -52,6 +54,30 @@ extern "C" {
> + #define TransparentColor  "#00000000"  /* transparent black */
> + #define UndefinedCompressionQuality  0UL
> + #define UndefinedTicksPerSecond  100L
> ++ 
> ++static inline ptrdiff_t CastDoubleToPtrdiffT(const double x)
> ++{
> ++  double
> ++    value;
> ++
> ++  if (IsNaN(x) != 0)
> ++    {
> ++      errno=ERANGE;
> ++      return(0);
> ++    }
> ++  value=(x < 0.0) ? ceil(x) : floor(x);
> ++  if (value < ((double) MAGICK_PTRDIFF_MIN))
> ++    {
> ++      errno=ERANGE;
> ++      return(MAGICK_PTRDIFF_MIN);
> ++    }
> ++  if (value > ((double) MAGICK_PTRDIFF_MAX))
> ++    {
> ++      errno=ERANGE;
> ++      return(MAGICK_PTRDIFF_MAX);
> ++    }
> ++  return((ptrdiff_t) value);
> ++}
> + 
> + static inline ssize_t CastDoubleToLong(const double x)
> + {
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 81f4596456..03ee9f3b25 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -48,6 +48,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
>      file://CVE-2022-1115.patch \
>      file://CVE-2025-65955.patch \
>      file://CVE-2025-62171.patch \
> +    file://CVE-2025-62594.patch \
>  "
>  
>  SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125538): https://lists.openembedded.org/g/openembedded-devel/message/125538
> Mute This Topic: https://lists.openembedded.org/mt/118479560/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


