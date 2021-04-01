Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2181.1617244640929497854
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qVmV/9fO;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id l1so229800plg.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Mar 2021 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tVLqtgdQme7ZPbhNrJY0iwv7i81EBwlQ1jJgNP7WVIg=;
        b=qVmV/9fO1LSbTWI5lcpc10jnj0w13BQNIjCvctAL/N65t8zYHlHuRRKOxTbvlL4ia5
         j7ybIG0zYjJaaQXPbYSkJ56/y0J7IJw8IAQLJqO8XlfsCisML/oVTObelwRTpRaptkRe
         vMFKsUNCeEV2Pil3N5DH4F4pVcfDRFtHCRHTnM7QQqoYmcCRlnzVoFEtuEra9GKGmUpc
         CrBob8RPeaaEg/qfCPA/4d8lvaiC+35ThZ6WAf7Q8Z9ienkTzFJtvWBm0Jx/vkthA+2A
         6IzSkLJyYb/OSf2V60b2oFXDLGujeFPrIpD5+717EiFxB1Ndp019hHWyJnUT02/HeyfV
         cf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tVLqtgdQme7ZPbhNrJY0iwv7i81EBwlQ1jJgNP7WVIg=;
        b=gC/XzNdOEfAYqqcqdDG4wWgD/JcsxLX1u/c9ZsZv0C9Liq+/fl6kgi6CVDEmaQCuCL
         HWL1FVtjh0X04A06jBk4nlEP7tRCDdi16P275l7nbRYF2d9PaAtlsoHhmbAKwFb3skjN
         EkKaxWh9RSHoXBpTa4yxcpRaIZb3aENlcobPXffrwK8YQtXTd3rNk0+Qy7C4NOek4tSu
         eMipnBfNvo3aX3G6cb1CRex2VthU2ukzKDjnWHTiWc22Fg7HQvx/neAideHHHf7dwRYz
         pEdfEE2zeuWVqubbm0Uoq7G5UgPG+b9PL42HCKEOuAOLUFzoYOKK253HfKo5KZN+QuUP
         GnaQ==
X-Gm-Message-State: AOAM533K3WyklmtuoPJzS1s1Bt5CtMG1pBVnoXEUR4iJFdU9SSl6S9no
	gvCX6JWB4StxKL6Sf9cQ0GmTOdjGoNIVPQ==
X-Google-Smtp-Source: ABdhPJwN2PaBKnsGUIHLweYBLjCZJoML1OCAHqO0V+nu8XzTDOC45+sQgpfqLu0K2EvavDw7MUafHg==
X-Received: by 2002:a17:90a:9f48:: with SMTP id q8mr6619732pjv.53.1617244640087;
        Wed, 31 Mar 2021 19:37:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7c4e? ([2601:646:9200:a0f0::7c4e])
        by smtp.gmail.com with ESMTPSA id d11sm3487741pjz.47.2021.03.31.19.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 19:37:19 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] libxaw: upgrade 1.0.13 -> 1.0.14
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1617244140-91947-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fe964c3f-4f5c-15ee-f621-1ef5483d43d1@gmail.com>
Date: Wed, 31 Mar 2021 19:37:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617244140-91947-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/31/21 7:29 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}           | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (83%)
> 
> diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> similarity index 83%
> rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
> rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> index cb1ffcd8c..1783ee8fb 100644
> --- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
> +++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
>   PE = "1"
>   PR = "r2"

Drop setting PR while doing this upgrade as well.

>   
> -SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
> -SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
> +SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
> +SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
>   
>   do_install_append () {
>       ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
> 
> 
> 
> 
> 
