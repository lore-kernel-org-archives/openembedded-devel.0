Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FACCFC535
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:57:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8607.1763816261032666853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j96G7Bst;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso27971975e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763816259; x=1764421059; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGXux78inYbAlJ7Qgg3TuPjsePzskGSh4ChCUScIL4k=;
        b=j96G7BstNZ6lLEP7Ih/7NFjzdC6GljRhgZiQFjO9rltbMwVqKlVBmM9MzyqmDY1y1e
         r73Eld5ObLf2prXQPfDVsJwgaMqbucuWmMvJ2kouQBmzdodE8PA+wsAmqWWV6xmEqut9
         qRgnW27+IvbhZrvwRP9aooeNaAc+rQxeT+63b7sJKeeR2nUvpFdCPPbkftfN4yqxc0uq
         h6b6o+eL52yVXnWFDcjzX6tBcWSKQRr2TqzS8mMph3HRQ0pjsEYyu+HvSfuGV8VUdJL3
         HjuKz+OHy/q3ivzb6sC4J0iF2M8u9GZGfZZmAxahmF2r8ksdl6CoBipi5arsv1YVPhQE
         b5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763816259; x=1764421059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGXux78inYbAlJ7Qgg3TuPjsePzskGSh4ChCUScIL4k=;
        b=dbspzwh2q4g0bJdnPC8S9K4p5uFb5Hefl1QbyzO80d86l8OgrIsmeqhfj/KgjQGHHA
         R0gX6MMEsc6U2KEUw3/i/U8qu6M3NthgVKYA/C1Uv0BTEm1jAss5gf0Q4ZHSfJk5IFIe
         FU+oiCG+fSKT8yWpZcr4uHZgzD+N90OhjsBGxvLsd5li9vSG+J6JiI1VIsXqCuERXOYE
         yljPJcfpkK3kQjQ0pERuEHv0Io4YdXdfFSJH3O05ou/vZDQLG4TkzjBhxq636IBQwk8n
         9YcmVOANKNxF4djkGt/59nDsLLHuAQ3eJxgOeQ3jdSZHtq+gm6/v7w9youEd37K1IS/u
         +opw==
X-Forwarded-Encrypted: i=1; AJvYcCUSLY/YJoI40ia1HIRjDT7NwTDbAt0dnmPf8avM/IMi8anYhZehMx0iRxVAlphX2GQocranzsiLPuoVds8MB23lwu8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz7Y9y2/fqxuTxQovNxc0n38MfjX3XZUOEpu/JMrWuffJt+q1jh
	JXry/yqSnCI345MgC5zZiVheAnTlOCEGYQtWxsmuo5iyyRDolk9JdjwWlZ374IiE
X-Gm-Gg: ASbGncvp+UEUe6ENd4erKrzDZ/VEwV0zhNWyT65E0L+LKq9VviuLsG438O8PyyVDhq/
	TEqGaVKfMdkUuaAmI1nbdDonVeup4TUi1hBTrBlm4bptMYRTq1Ir0sdnenjfgzhZ2ARMu/4wljk
	/zxkqDROfw6Hfr17rNGCX46z3j6EZTSKpSyFa5XcLsrbvx3MHKtwqcQLyQ3w6+J3SD5DT2eBqv1
	gpuLo2hzjnBv+qwJJXTXA+mG7Fzo5WqDmBYIdIQVssh9icRq8Fxb4aT8gX+xSAcXVjk4Q8c/VxO
	iHD971rNT4WpjH7PZWq5YNhzCS++hSQ8XZ5fQ7slGYPovMQP/QeeofqVdcEJgXupRcXJc2NEpRv
	29YnfiVUb5zu1NDTb6wyDjPhXCEwrFrNNOfBIfmsMzLA/al609FhcfUGQtEt8SZaVk6I4Zq6jG2
	OoYLcUAJ2Wd6LM9AhDFQ8=
X-Google-Smtp-Source: AGHT+IHbv4ItchSPr/MAiWN6O60cb76p7S09ePltH4j6JIOmhUG47RCyp73xAMrhb/ZJw3tzxWz/AA==
X-Received: by 2002:a05:600c:3110:b0:477:b734:8c52 with SMTP id 5b1f17b1804b1-477c0185bebmr62099965e9.14.1763816259156;
        Sat, 22 Nov 2025 04:57:39 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm107767335e9.8.2025.11.22.04.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 04:57:38 -0800 (PST)
Message-ID: <e6f07a69-08fe-4d52-8ea9-9b53ab8ea217@gmail.com>
Date: Sat, 22 Nov 2025 13:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 02/12] ImageMagick: Fix
 CVE-2025-53101
To: Divyanshu.Rathore@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
Cc: Sana.Kazi@bmwtechworks.in
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
 <20251120084959.51761-2-Divyanshu.Rathore@bmwtechworks.in>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251120084959.51761-2-Divyanshu.Rathore@bmwtechworks.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 12:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121971

There is a fuzz in this patch, when I apply it on top of the first patch
in this series. Could you please rebase it?

Applying patch 0002-ImageMagick-Fix-CVE-2025-53101.patch
patching file MagickCore/image.c
Hunk #1 succeeded at 1652 (offset 2 lines).
Hunk #2 succeeded at 1665 with fuzz 1 (offset 2 lines).


On 11/20/25 09:49, Divyanshu Rathore via lists.openembedded.org wrote:
> From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
>
> Backport the fix for CVE-2025-53101
>
> Add below patch to fix
> 0002-ImageMagick-Fix-CVE-2025-53101.patch
>
> Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
> ---
>  .../0002-ImageMagick-Fix-CVE-2025-53101.patch | 60 +++++++++++++++++++
>  .../imagemagick/imagemagick_7.0.10.bb         |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-2025-53101.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-2025-53101.patch b/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-2025-53101.patch
> new file mode 100644
> index 0000000000..3b31886ae1
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-2025-53101.patch
> @@ -0,0 +1,60 @@
> +From cb29701ae86c2a5b46bdf705bf0df7db152eda68 Mon Sep 17 00:00:00 2001
> +From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +Date: Wed, 5 Nov 2025 12:54:53 +0530
> +Subject: [PATCH 6/8] ImageMagick: Fix CVE-2025-53101
> +
> +CVE: CVE-2025-53101
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
> +Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qh3h-j545-h8c9
> +
> +Comment: Refreshed hunk to match latest kirkstone
> +
> +Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
> +---
> + MagickCore/image.c | 13 +++++++------
> + 1 file changed, 7 insertions(+), 6 deletions(-)
> +
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 34804e522..bf9d53325 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -1650,7 +1650,6 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +     *p;
> + 
> +   ssize_t
> +-    field_width,
> +     offset;
> + 
> +   canonical=MagickFalse;
> +@@ -1664,21 +1663,23 @@ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
> +         p=q+1;
> +         continue;
> +       }
> +-    field_width=0;
> +-    if (*q == '0')
> +-      field_width=(ssize_t) strtol(q,&q,10);
> +     switch (*q)
> +     {
> +       case 'd':
> +       case 'o':
> +       case 'x':
> +       {
> ++        ssize_t
> ++          count;
> ++
> +         q++;
> +         c=(*q);
> +         *q='\0';
> +-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
> ++        count=FormatLocaleString(filename+(p-format-offset),(size_t)
> +           (MagickPathExtent-(p-format-offset)),p,value);
> +-        offset+=(4-field_width);
> ++        if ((count <= 0) || (count > (MagickPathExtent-(p-format-offset))))
> ++          return(0);
> ++        offset+=(ssize_t) ((q-p)-count);
> +         *q=c;
> +         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
> +         canonical=MagickTrue;
> +-- 
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index e0d584f165..9744e1e919 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -24,6 +24,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
>      file://CVE-2023-34474.patch \
>      file://CVE-2023-5341.patch \
>      file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
> +    file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
>  "
>  
>  SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121945): https://lists.openembedded.org/g/openembedded-devel/message/121945
> Mute This Topic: https://lists.openembedded.org/mt/116392325/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


