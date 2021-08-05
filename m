Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.4196.1628132242588468530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sNmyQtgK;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cl16-20020a17090af690b02901782c35c4ccso2748977pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h2f61EztbCS6UFzLWbXbTfbNekNCA32ND10GvE7yU5g=;
        b=sNmyQtgKWu/ht5Xer3x9CBdp4Hx6cU+o9Vt0MmeWD0Y3bVJtomhwHuKnqfoC2pcUr8
         51eD8/PuU2u+NlJ5dOAau+pwjpDnC6xEZaPTh/qj+uIyTqqyaMoN8XCYDzKQZWoEiagF
         o2liR8PMYHp5S8uuGGbmZKLR/NsXKQkWzxYuQ33UT7DJky/uP+CDjoMFa8rrAccU9rJa
         u0IiAYJktc+WPfhCNDx+mWYo58Zwa28OlKUf5GrJozUaOB4I3Vim41bYonknmJ2r9qB+
         eOwm/O+lNg8Df7N0PifbkqOxNDaUci6jpMiYXR8XIsG6bIPRsUyDhzOLfBihbwveppDu
         jgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=h2f61EztbCS6UFzLWbXbTfbNekNCA32ND10GvE7yU5g=;
        b=CqsT7GNpVSYkNI1n/WNv7rntlxqy/SLie0G++XqpMNrAstDaqBltt1UBDiuGxPHGJW
         8yFD/SPemsPNvPshW7/xmyPTUOUM5fkdA4G0JkSi8XwPaviqzRjUDy3jxiRpu76eWdYf
         yveSexzLrFMRQMgAU1jCdXHaPqMb5xxGseTocvta9pqolEC1kszQ1e5fiQqHdpzckL67
         WNkMriz4rcd8TRwK2ZYt6npu2NIcWaxHyHeyDxIK+HrfSTzF/OwihwstYeS4P6NcZYOJ
         XihLq2Xsg5F+/jAh2NAy3YAfrgEsfD2qJzqtjuKozwzzgkN6lAMTT6FX/3wbBcNdiSFZ
         5clw==
X-Gm-Message-State: AOAM532dpniU/tYMes17CWHJZDOP5367rc+q1EPNnhImKaxw2iq8eR4d
	bCaUrwngPhEf5Jv7m4fpSK5mRTA7eEeQww==
X-Google-Smtp-Source: ABdhPJzWbYRKM/ZdtT7DLhv+kscSjuxZ+mhnBAoUET8Sve9XvL7OWIugC008AX3uYTQ2QrK9mtA/XQ==
X-Received: by 2002:a17:902:d2c8:b029:12b:84f8:d916 with SMTP id n8-20020a170902d2c8b029012b84f8d916mr1971151plc.75.1628132241820;
        Wed, 04 Aug 2021 19:57:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:7855:55f7:d28b:c03? ([2601:646:9200:a0f0:7855:55f7:d28b:c03])
        by smtp.gmail.com with ESMTPSA id l126sm5144269pgl.14.2021.08.04.19.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 19:57:21 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 1/2] meta-oe: python3-gmpy: Add native support
To: Andrew Jeffery <andrew@aj.id.au>,
 openembedded-devel@lists.openembedded.org
References: <20210805022906.1023804-1-andrew@aj.id.au>
 <20210805022906.1023804-2-andrew@aj.id.au>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d7a8a64f-3ed7-3d55-afa3-ced9add34aae@gmail.com>
Date: Wed, 4 Aug 2021 19:57:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805022906.1023804-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/4/21 7:29 PM, Andrew Jeffery wrote:
> python3-gmpy is a transitive dependency of meta-aspeed's socsec package,
> via python3-ecdsa. socsec is a set of tools for signing bootloaders and
> forming a hardware root of trust for ASPEED BMC SoCs.
> 


Thanks for your contributions Andrew, a small nit on subject line we 
dont need layer name. Format is something like below

recipe: short summary

Detailed commit explaination


I have fixed it this time around, so no need to send v2.

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
> index c6edcbb3207a..976f57ab26a6 100644
> --- a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
> @@ -10,4 +10,5 @@ PYPI_PACKAGE = "gmpy2"
>   PYPI_PACKAGE_EXT = "zip"
>   SRC_URI[sha256sum] = "dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 python3native
> +BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 
> 
