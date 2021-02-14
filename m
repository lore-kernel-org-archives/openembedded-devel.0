Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.14402.1613291261663002271
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 00:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n+WiVEBn;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id e9so2058290plh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AzqzpqOcAQVPyhxLntwsaCBWKjrR3DSPdSTA/Ntvx/I=;
        b=n+WiVEBn+LMwmeqSvUzGNBQ0jlVkHW9MmCWeM9n0+Vpwl5IInUaGk9KUosK2BmCFKE
         ICiJN66ER+Lfh3mSV55cuGW3jjDXclkQABkVzGJ0VEmoiQJbLZ8JcS+1et3E4h4xPuSI
         CwSFxf9cIasQAwfxozaWFBaDRfFhapoTlVbAI+RjGovRNOsey3JqCF+mP5FRShisbO2x
         2F3WL7ysA7KIQ9FVnzPgt0E72SIXLaV/UT7xO1gOcrU6FdyoJVz12TdYvOewrcsclu6O
         7EgGidhVUSmkNPtA8RSwxAsEzvzCzxWZTw/HOOs5eaHYzjHn730kfWbPSmSNL2RGqY4x
         0YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AzqzpqOcAQVPyhxLntwsaCBWKjrR3DSPdSTA/Ntvx/I=;
        b=Wj4ZZqTi439ICMi2NxbEb1Nsdlt8ssp0b6p8euhLgE7oSi5+fJPSHMENaY8BCqDT7j
         eG9gJno7LieYPiELUDp8RDg/k8Zi0bXp9GUQhjzffGlDaRxXfVBDyuDrmOxoi25Jm4Ei
         Ik/NDoqSIH1UI/6rG8Xq52eT3N05jIvWwwPwiMoq+D+w3JD6hn1/hCoBCFz/ONG2Ivzu
         iA2BJvP0WH4kEF1kbUI5iEP50A1fbhbvYhpVdT6FAsslLY6o8NflILytL6GicZfHZW8v
         xrPaSonxKOZiNAbXW9Uu5pEqARcSY4yePNDOPgVRpCQd09ROJmQz0xY24MaM++U61bCj
         qNdQ==
X-Gm-Message-State: AOAM531qQZVL40uTYlliVlQz/+Bx3MTCYCpVREpZaOu4fu9i0hsf2TVU
	Dvm/v9zr4UCMOhMYE7mxORerkNhOYVS/dQ==
X-Google-Smtp-Source: ABdhPJyJaaN9M9rTXpxtKWi4rjF6J7uyZwtMYJOjt5vs7+jh+ajGyppcfe8Y2YEIozkI4q2iAgaA8w==
X-Received: by 2002:a17:902:8c91:b029:e3:d52:9402 with SMTP id t17-20020a1709028c91b02900e30d529402mr10108207plo.21.1613291260741;
        Sun, 14 Feb 2021 00:27:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b4ad:c8b:948b:d311? ([2601:646:9200:a0f0:b4ad:c8b:948b:d311])
        by smtp.gmail.com with ESMTPSA id g3sm14843778pfq.42.2021.02.14.00.27.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 00:27:40 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] python3-setuptools: update to 53.0.0
To: openembedded-devel@lists.openembedded.org
References: <20210214043349.497555-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8a329bf4-880b-2ae9-5baa-cec20b3f39ae@gmail.com>
Date: Sun, 14 Feb 2021 00:27:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210214043349.497555-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

this should go to oe-core ml

On 2/13/21 8:33 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   ...ython3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-devtools/python/{python3-setuptools_52.0.0.bb => python3-setuptools_53.0.0.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
> index 118f416657..811c8a5900 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_52.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
> @@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
>   
>   SRC_URI += "file://0001-change-shebang-to-python3.patch"
>   
> -SRC_URI[sha256sum] = "fb3a1ee622509550dbf1d419f241296169d7f09cb1eb5b1736f2f10965932b96"
> +SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
>   
>   DEPENDS += "${PYTHON_PN}"
>   
> 
> 
> 
> 
> 
