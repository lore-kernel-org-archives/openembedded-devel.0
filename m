Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.11405.1614094162586453252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=usJuWUJS;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id kr16so2041841pjb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 07:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Y6JP4A+uyrkI2+DXhEx4RD1NElDGfEgeVyYDO/wdaQ8=;
        b=usJuWUJSe97JOUYrXU9QnDX02qYECdt2XX2vLQ8iJ4iYts+Tk4nwwhL8FIgJ5z0BH9
         LhvYYq8qDwdlVK4PYiIuuEqnPSi4u7+a/V+qexuQ9+HEy+D+xNjXgcakpDZemEhRGoT+
         uClTM2TJ+gCGLbPoxNYxQahxvdOxTil3BNFLhupuPEkVyNBwsT3Do/gGipSBcz0aaBKp
         gMfTjBunXU3J2bEgPVZL5QH76EvEE24hYsLrw1t35L5Zfu7a8NOamxEKPZNOTTH7v/Un
         XFt8QULMDNpGhp7twxPOSHXR8YKq7tGHGSUW4N0TlYyrOrr0BmPWK689h5OmwC9idABQ
         2TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y6JP4A+uyrkI2+DXhEx4RD1NElDGfEgeVyYDO/wdaQ8=;
        b=VCBWxTuAt2/PYmP8M1O7zG6DMfQByjdIc3tl39yIxaEc0ba8vj9kPH+JhICSk+0X0P
         /i7IZS55fqphCZ6eArbTrGLFVXwgD5zOXwjT5o4aPhcJ1oG6/bGU3sIhWp4kI0oJ4uEF
         rM2aQbw2DQjZ4QMew5+vtHA/X+Ic3JTzrEpCn2aIjycoReEqwY7/E4RbsQqWS1KT8NKW
         oe7l1lLRldWI+FfkMTKOZsCfr+noY7fk5cAPcJJU1+3c/eR/hjd2tapzrTfi+hzyFC3C
         RN+P5d/lKEFBz3ZtUfpqcqKeKZ+DqfEEMIPGMSeYQDn8A2N545Ksyc4yRYX7eZJRNGY5
         6wfA==
X-Gm-Message-State: AOAM531u7rVaQEHkFKq+jA1Vz6iInAcWfBV+G+1vsUgmrQO9JEosKEU+
	lht0r846E0xbwZk3ooTrOdZO03tabYOJIw==
X-Google-Smtp-Source: ABdhPJw8PuuwoObEVIzc8+IHUlsNRcNkoxtRQpgOPUY3owh+8p0nM5K0HMTwy665JN/P4jAuwNKa4g==
X-Received: by 2002:a17:90a:f87:: with SMTP id 7mr21719659pjz.98.1614094161687;
        Tue, 23 Feb 2021 07:29:21 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8e1:8c0f:8c00:9696? ([2601:202:4180:a5c0:8e1:8c0f:8c00:9696])
        by smtp.gmail.com with ESMTPSA id n11sm21506002pgm.30.2021.02.23.07.29.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 07:29:21 -0800 (PST)
Subject: Re: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
To: openembedded-devel@lists.openembedded.org
References: <20210223082553.29759-1-andrej.valek@siemens.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f9cfbc7e-4faf-7d7c-0fc0-60029eb3e43f@gmail.com>
Date: Tue, 23 Feb 2021 07:29:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223082553.29759-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/23/21 12:25 AM, Andrej Valek wrote:
>  - do not install obj files
What kind of update is this.

What problem is not install obj fixing?

These changes are not in Master.

-armin
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.4.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.4.bb} (82%)
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
> similarity index 82%
> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
> index e41907de4..a02ff4a4d 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
> @@ -13,13 +13,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>  
>  PE = "1"
>  
> -SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
> +SRCREV = "9059f5cad030ba11d37818847443a53918c327b1"
>  SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit cmake
>  
> -EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
> +EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
>  
>  BBCLASSEXTEND = "native"
>
> 
>

