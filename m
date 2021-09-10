Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.12435.1631295488151000470
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 10:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DfoBluUf;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id j2so1613087pll.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Sep 2021 10:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=d+3GWtbMBaOGrb8BbnFJTy8ENgtSL7W0XB9iqbsfUZM=;
        b=DfoBluUfhWoaVJHwt73yJZT70NX2NsDTyOOiC1oT9sYfg46PVPZY3rNtMFy3qWG1Yc
         egnW+C4zeUcZm1B8oAKiZDVWLG15gV0PC3Yv9l0RtwaYEGfVe5uR4TO+cz4jKTXbKKod
         zH2PeMeoJegoaKLAgrTO5a8aa1s2y0qVvetdtnSrKWszSVl8Z1D8zsUqO0k2kd4Sq32A
         KS8RlJpN2f9mlDHZmieumo/9oi0s5A4fKfkxMZVXgFAJR0HdbjReuc812Ux+2rNNqh5s
         8pDdNsEO2yvg62GJv4jOVnPUOqUVHzSLGFp3giAX2+MY27ynFNezZJPqkyG6urcDEu96
         Gyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=d+3GWtbMBaOGrb8BbnFJTy8ENgtSL7W0XB9iqbsfUZM=;
        b=X9UOrl/HrhruwmvUO+JvBdFuWU+sHqXvCGuY1gbWPlB6GZEMDvjvY7Q+mPFxX7sZLn
         ovcGAQkFBmjZK7cjR1kuTzleQYitJuFT4/1G04prbJQwjKhoEiIGyd1XWFkBmnyrShA6
         FImelkrCnM5RajKcuPaCSc2x+Mfk6kAshcRvvfU5Ak1AYGJ/wnqkehsVro8/uu6OwOlm
         S8sQbHhc/NugB7rSx3OEJn1BTaAr0vtBtPQ8ngkpB3WP6+bI2udLKVCVhsTrW+zZwumW
         3sGMAEcntXrOBAsHgquMysKMVhIjqavjerT4FaqKIFpOYFA0289jxT4TU9YbHRWGvaDZ
         0cNg==
X-Gm-Message-State: AOAM532H4eirTVkH/u/frOixJ36SRPZA6jTFSFoKR8fwfwC0YQix6SfP
	FoXMhl4d9x1prVCORWKK58o=
X-Google-Smtp-Source: ABdhPJzVAo7r6h0sagr50V7U7iOxkjF2s7dqqkFC0znKrrOD/pfEsnbyHgQjS3bcwRJGCL2yg2szGw==
X-Received: by 2002:a17:902:cacb:b0:13a:5f28:e4cb with SMTP id y11-20020a170902cacb00b0013a5f28e4cbmr8602398pld.37.1631295487451;
        Fri, 10 Sep 2021 10:38:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:1c4a:aeb8:db4f:6b43? ([2601:646:9200:a0f0:1c4a:aeb8:db4f:6b43])
        by smtp.gmail.com with ESMTPSA id m12sm5914069pjc.18.2021.09.10.10.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 10:38:07 -0700 (PDT)
Message-ID: <7c070bf3-f90d-88f4-7220-b1d8faca0176@gmail.com>
Date: Fri, 10 Sep 2021 10:38:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.0
Subject: Re: [oe] [meta-oe][PATCH] Remove patch that produces a segfault in the ptest of lua
To: =?UTF-8?Q?Jan-Simon_M=c3=b6ller?= <dl9pf@gmx.de>,
 openembedded-devel@lists.openembedded.org
References: <20210910162949.3732-1-dl9pf@gmx.de>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210910162949.3732-1-dl9pf@gmx.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/10/21 9:29 AM, Jan-Simon Möller wrote:
> From: Jan-Simon Moeller <dl9pf@gmx.de>
> 
> The patch file CVE-2020-15945.patch does cause a segfault in the lua ptest (db.lua test).
> According to upstream developers the patch is not correct and causes the segfault.
> 
> Reproduce: build core-image-minimal with lua and ptest-pkgs on .
> Run: ptest-runner lua
> 
> This test passes if the patch is removed.
> 
> Please also backport to dunfell as well.
> 
> Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
> ---
>   meta-oe/recipes-devtools/lua/lua_5.3.6.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> index f830e0925..af3054dcb 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> @@ -8,7 +8,6 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
>              file://lua.pc.in \
>              file://0001-Allow-building-lua-without-readline-on-Linux.patch \
>              file://CVE-2020-15888.patch \
> -           file://CVE-2020-15945.patch \

Can you also remove/delete the patch file itelf too and resend ?

>              file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
>              "
> 
> --
> 2.32.0
> 
> 
> 
> 
> 
