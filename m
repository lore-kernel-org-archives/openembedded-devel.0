Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.16127.1616983568970392143
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 19:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vQTKVrob;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id g10so3668441plt.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 19:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4TU1FYYb5FvFc5I6iferQZvSykmNchxb17VkggDv9aw=;
        b=vQTKVrob0YCFENZ6wtpEUgWHcoij/1TrgRzLcwIbwc6s63Qu5GHNvSRqbHuzv4uzTe
         WJ7APqxSLgjU/A0BYJVDXqO06zTWpD3fx72sEqfXykxmMJqHXkLo6kThG1he2v0T0Csd
         LUbQW0dC96MUlfX4luf8X/OdWgH/G1GJR2uROEchanVrCwaRmx9aZoaTrCOa3wDaLsvQ
         4IxNwU8Mu6NoO+ADRCGZfpq5sVj1odZvvSpbkTZO12Qn/fKEzjIS4w3+fpugSSgdd4zC
         WfVVEwlriqSXJSec6zY+t2B82J9f6+fdV/HIruyz9SKuGNlMTP2HBqPstRQwHVXbD1IQ
         vKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4TU1FYYb5FvFc5I6iferQZvSykmNchxb17VkggDv9aw=;
        b=gXMRz13M2McApuuaPm0xwSqqLdyycFbzZ44D+/BQnxqa31Pu0eYFs2M8JjRGPmzJRk
         TPAvRnA0UCofjWdMIVP7tAdAwqb6DVXCKdsJGagYhZT5kbFs0dNQrgYd3JjXxcC1kI/V
         86Z2F7gBt9WyT0MUQbz0xf1HA5Kq26jv/BReilTc70ti/KkDY8lrDHGGN8wtkzQQqBO1
         1+wdEHpBBuWcnbQp3dVo/9mAa2OGlOGxEiicYCClSpXm2hf8pkVn5swQ9g4iITE7EAnH
         H1EP5nbwePrsMqSwe3+1EqJWFLArSSfcGuP2W89lZhaFxu4TwKgeFhdL2diA5lbYZysq
         34Tg==
X-Gm-Message-State: AOAM5317wtaeOOgsdw9t4hA/T4FRQH4pI8NSaYRfkW0FpjdS6eazupQZ
	6EvSLpWv3pvmutu+y+AIv3+ua8QT4eKl5A==
X-Google-Smtp-Source: ABdhPJzkEB3tzP82mtkENn/X4N+pq0Pa4ZcfoU5nVI+VWa5xz3eMyQCNx5VhRF0Gi3rROgxaEwim4g==
X-Received: by 2002:a17:90a:e2c3:: with SMTP id fr3mr24175507pjb.48.1616983568058;
        Sun, 28 Mar 2021 19:06:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4986:10f4:29b0:2119? ([2601:646:9200:a0f0:4986:10f4:29b0:2119])
        by smtp.gmail.com with ESMTPSA id mp21sm15831981pjb.16.2021.03.28.19.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 19:06:07 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH v2 2/5] python3-httptools: new package
To: bgampe@digi.com, openembedded-devel@lists.openembedded.org
References: <20210329012143.2580564-1-bgampe@digi.com>
 <20210329012143.2580564-2-bgampe@digi.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <02f81bb7-05d9-c54a-befd-d5c85ab4da79@gmail.com>
Date: Sun, 28 Mar 2021 19:06:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329012143.2580564-2-bgampe@digi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/28/21 6:21 PM, Ben Gampe via lists.openembedded.org wrote:
> Add recipe for python3-httptools: a collection of framework
> independent HTTP protocol utils
> 
> Signed-off-by: Ben Gampe <bgampe@digi.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb            | 1 +
>   .../recipes-devtools/python/python3-httptools_0.1.1.bb   | 9 +++++++++
>   2 files changed, 10 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> 
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 0418b5930..30e90dcd7 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -162,6 +162,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-html2text \
>       python3-html5lib \
>       python3-httplib2 \
> +    python3-httptools \

I think indenting is off here, please match the existing indentation

>       python3-huey \
>       python3-humanfriendly \
>       python3-humanize \
> diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> new file mode 100644
> index 000000000..1f623fa9d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A collection of framework independent HTTP protocol utils"
> +HOMEPAGE = "https://github.com/MagicStack/httptools";

A semi-colon at the end of HOMEPAGE is not correct please correct it. 
Its in subsequent patches too. Once done resend all the patches in one 
series.

Secondly, your mails appear authored by

Author: Ben Gampe via lists.openembedded.org 
<bgampe=digi.com@lists.openembedded
.org>

So please look into this, there might be some settings in your mail 
settings which is causing this.

you can also send a github pull against 
https://github.com/openembedded/meta-openembedded if this does not sort 
out. I do cherry-pick the pulls from there.

> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
> +
> 
> 
> 
> 
> 
