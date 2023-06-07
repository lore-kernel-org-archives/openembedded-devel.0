Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ED3C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:54:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3204.1686124461435500695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HoFhpQqM;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30af20f5f67so6898370f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686124460; x=1688716460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQGLaDQV4297GjMtnflEHGjwwd0uHVoCsFPuVWLXkV0=;
        b=HoFhpQqMnK+R6fGwbfpNyI7WzqGdWZ5CYYT3KtDbkh/W2yKHFUsw6XBLzgjLJuBGGR
         INBI3XIEKtTabl0yf6b4HHDKJjAjkJLrd3NwSqGbarNxZEl5aLJunjgMk6JKPfM6qT2z
         +n9rhvKZs+QabcTWEi0zoTgsgA6OlNcK4XfTexLruMuH1VU/WtsT2K261jASY2ZEYCPL
         dwE0hXwVyqsxMs8tw0374Zc/dnDel4EJOKH3dYBIvgigC9BJ0wNpN9Z/f2yE+NvB29x3
         6jX9/QUarzeSRc3EsOZ+XJScfZXwGj8UExjaZ00Tc9G+0HZQ2qQX2GuHy8YGVNr/YpHa
         JsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124460; x=1688716460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQGLaDQV4297GjMtnflEHGjwwd0uHVoCsFPuVWLXkV0=;
        b=DvD3UIuINdtvDyr5I1h+/d/deqhcnSETLyXXlkWEZMAPIH3DDy0zX0g6E5BB0wDIQe
         TyOH1/MJZUr8LeVcX6mBNmkli0YcwNb5GHb1yylLcVlrJV7Zry8CMIR9CILufWhI+utT
         NpR3qpLbJ5hUg49U6rp1hw8eNVUJ/blNPO2MJU7q3YrfVToyGRiEE8L6m4VPEeNyV8eJ
         VLJ6Iq1PDh2EyZWg7skAAABN1lCDTmfPQ6x4bE4PxVpBmb3Ed9atBoMKEYqHwbp9akLQ
         B55NZG+393iI2RET15TqNtdEVy5iwt9f+NITT25dvX5LdudZlKw19fvmy2/12Ep5pEft
         qPNg==
X-Gm-Message-State: AC+VfDwRh2L87e2Ts2/BaUO8pSsp8IQwUfdYfFCmgpAd8n+CT+ouXkvP
	H32fuzkaZiQ++ApzXp1u+iJmDEk4l3o=
X-Google-Smtp-Source: ACHHUZ4dsyM8LVfruhIOD/GXhWcysXjRZ0lK460nvi4mUAoIvzyUna5AoePkURGsseHYIUSgroLqrg==
X-Received: by 2002:a5d:4482:0:b0:30e:3f55:ebc9 with SMTP id j2-20020a5d4482000000b0030e3f55ebc9mr3768818wrq.13.1686124459742;
        Wed, 07 Jun 2023 00:54:19 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id f4-20020adff8c4000000b00307a83ea722sm14497136wrq.58.2023.06.07.00.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:54:19 -0700 (PDT)
Message-ID: <ed363ff3-2d2f-999f-c7ae-2311751ef4dd@gmail.com>
Date: Wed, 7 Jun 2023 09:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][PATCH] fftw: Check for TOOLCHAIN_OPTIONS to be
 non-empty before sed ops
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: jan vermaete <jan.vermaete@gmail.com>
References: <20230523045151.139311-1-raj.khem@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230523045151.139311-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103169

Please backport this to mickledore ASAP.

2023. 05. 23. 6:51 keltezéssel, Khem Raj írta:
> Ensures that we do not apply empty sed expression which might happen
> when building native recipe
>
> Cc: jan vermaete <jan.vermaete@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> index 1fead4d029..33e8279880 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> @@ -55,7 +55,7 @@ do_configure() {
>   do_compile() {
>       for lib in fftw fftwl fftwf; do
>           cd ${WORKDIR}/build-$lib
> -        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
> +        test -n "${TOOLCHAIN_OPTIONS}" && sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
>           autotools_do_compile
>       done
>   }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102729): https://lists.openembedded.org/g/openembedded-devel/message/102729
> Mute This Topic: https://lists.openembedded.org/mt/99081361/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


