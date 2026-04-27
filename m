Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22FCFF8862
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:05:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38190.1777277111510780059
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UB0E6EVp;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso82555055e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277110; x=1777881910; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBRAFQVTX3JDbltPeji/g75W3oibxpwGsQx2iNRxlMA=;
        b=UB0E6EVpYYAxg+yaOHhz16ILPZxkHAcfDSnQIKOriidrgAFA8oJr1zccPkrFDO3MPQ
         s9Qu3rxyd5fb6lj7DXbKicvIK7xA3ppVAQdKE6fMU7yddLohKqr7Gp5qJa+Gabn7BWJU
         uHkFqduKKthJ32p0g/FbANlL4iwS0FPlzpjHmt1e836hjjfMc/ufMeE1tWA5edrWGkZ4
         lMch/xTnPGODfJTqJVEXLgMkRXGDMnDJxqUNo56rXtUg6fcwikVqrT0AQWzJ+zDYc9G8
         I0PD68hn+I2Dq5ZZiUbZUv2ItyGULtLA3tVH088lb1zNufe2mHvnMExdqu30IeON4mz1
         bb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277110; x=1777881910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBRAFQVTX3JDbltPeji/g75W3oibxpwGsQx2iNRxlMA=;
        b=sohYHbHx8SwzcjVa0FcmRzMx/hRXYjkkV1wZUaKv2usp0BlC1ckoUQM6Avw+DDWBZi
         rXcf14Ysll6Oz7IH990zFsDIuy3bjKrxUcVRNx6VrC5p+BfecWtvmRXmJ/LwquFP9cPj
         mdTBtE0zno+/KZ5PZ+JZt76+AXHVfo7/7gPOp39/Gowa5Q3qQz/lLEOe2JFn1i47OqH4
         7AAaM4iegW+5EaLoiMD7sCc5Hl2C00ldIhu57aCaH++RqliwN7YecjqhNaaaqzlZPpiE
         9wBjV36chyq3aQ4Vp1bDiUvQLCwijKYF0Bt4p98F6POz0GCG7YYbh5hjZLCIQ7WQDEw1
         VBQg==
X-Forwarded-Encrypted: i=1; AFNElJ8dkPEzkD8qnsyz68dmalj/VHwSifqOQAYDasoHTsBT+ry0Vb89b7zK/ilPHSFdK10pnNRhR7srYZ28SHNYYy4dFlc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzuJ2ez1uhFiUm8WFSTVrWQglCriiOtQK6hShTV79aceyQNnx41
	279VquEamAJ8WqDrnZknwltpN7wcD2j1T9svnHAZYSSw1XivKjaNXOLa
X-Gm-Gg: AeBDieusFLJgZtexaUkw+tVJijzVH1DZjWvOCcPiLy6PqwAyQvUWeo8PSJZ0D6W7HfN
	p1SRJdYZ6bmKmIr8QGCZO7leypHAvjo+CXylVTseaRdxGw1rdKlJm1IvNcQum7yeH49aLSN76S7
	B1oWBJq3pBtpHjijtz5liqZQe5JKn6zdFBSw4GlhlUf2kwZJdJ6pmRJwLLVyKpOzczArgMC10IW
	XdEKshI6N6agxLpU2Tc4VXvdc8wW79620U552TA4N0uSNgLIGC+tgGArdXkRY/OD8yDVP3a5+5q
	GPH3NhoLHc4v5IQ43pPMgemCZHWyiss7n82dFeigJLYG/PzmIRI0+dIYr4vgrxp0dFPV01P9sZX
	stmv13oHAy9mRSe/+0rJge501ruEeHbwCHq3qgf037wsJUtKmFGSO5fUNYxv3jIGFaAsOwtzfZW
	HTzGxHL6K574e+L/f+X+DTgVL5ShZgj26AWvcII+te8w==
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr580795245e9.14.1777277109290;
        Mon, 27 Apr 2026 01:05:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm778395645e9.12.2026.04.27.01.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:05:08 -0700 (PDT)
Message-ID: <d14f0925-2b52-4c4d-be3b-d740c2b1b5f6@gmail.com>
Date: Mon, 27 Apr 2026 10:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] imagemagick: Fix CVE-2025-68950
To: nmjain23@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
References: <20260427063333.117465-1-naman.jain@partner.bmw.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260427063333.117465-1-naman.jain@partner.bmw.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 08:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126634

Just as a confirmation, you meant this for kirkstone, right?


On 4/27/26 08:33, Naman Jain via lists.openembedded.org wrote:
> From: Naman Jain <namanj1@kpit.com>
> 
> ImageMagick is free and open-source software used for editing and
> manipulating digital images. Prior to version 7.1.2-12, Magick fails
> to check for circular references between two MVGs, leading to a
> stack overflow. This is a DoS vulnerability, and any situation that
> allows reading the mvg file will be affected.
> Version 7.1.2-12 fixes the issue.
> This is a minimal patch required for this cve.
> 
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  .../imagemagick/files/CVE-2025-68950.patch    | 24 +++++++++++++++++++
>  .../imagemagick/imagemagick_7.0.10.bb         |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> 
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> new file mode 100644
> index 0000000000..f839884994
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2025-68950.patch
> @@ -0,0 +1,24 @@
> +From 204718c2211903949dcfc0df8e65ed066b008dec Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Fri, 26 Dec 2025 11:22:12 -0500
> +Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-7rvh-xqp3-pr8j
> +
> +Magick fails to check for circular references between two MVGs, leading to a stack overflow. 
> +
> +CVE: CVE-2025-68950
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/204718c2211903949dcfc0df8e65ed066b008dec]
> +
> +Comment: Refreshed the orignal patch based on 7.0.10-62 version of imagemagick
> +
> +--- a/MagickCore/draw.c	2026-04-09 13:26:27.935293000 +0530
> ++++ b/MagickCore/draw.c	2026-04-16 11:52:23.007277997 +0530
> +@@ -5545,7 +5545,7 @@ MagickExport MagickBooleanType DrawPrimi
> +               clone_info->size=DestroyString(clone_info->size);
> +             if (clone_info->extract != (char *) NULL)
> +               clone_info->extract=DestroyString(clone_info->extract);
> +-            if (*clone_info->filename != '\0')
> ++            if ((*clone_info->filename != '\0') && (LocaleCompare(clone_info->magick,"mvg") != 0))
> +               composite_images=ReadImage(clone_info,exception);
> +           }
> +       clone_info=DestroyImageInfo(clone_info);
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 9bc857b715..1dc1005aa7 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -54,6 +54,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
>      file://CVE-2026-22770.patch \
>      file://CVE-2026-23874.patch \
>      file://CVE-2026-23876.patch \
> +    file://CVE-2025-68950.patch \
>  "
>  
>  SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126632): https://lists.openembedded.org/g/openembedded-devel/message/126632
> Mute This Topic: https://lists.openembedded.org/mt/119026610/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


