Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.9664.1628174357209783872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 07:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jArM+KzC;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so6400707pjn.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Aug 2021 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QHmZsjfougNntZtAtIcB5fYigiaIeZKzX9MQN1yWCd4=;
        b=jArM+KzCXgBA9Q73LH7fJs6RhjLDytjc0bA9VapwNFc1zaLMbe0P3o8+1tLyFN87VT
         3hxPPQTico0hcbovE0ThJAjJ8gk3k9jcUkGAiijlRKTfXeqFCKQ5ks49PNMuQB8DDkFO
         Li34DywNtAU0rLKmdituxzzT9qUpfQEaLCOBOHblDCdpwV5itQxT8AGXi6Lv+THgRj4l
         9waXW5IKl9DHbpoDBxa5cIjIExerCR7KvocrQDbyuKJ2SZZj41MWGEeeX6i3gaOcK0ou
         Ms7TidD2Gs7fFsFdNoPe0kUPAa/SVY0obrQ5tc9EE+sPslL69Y/7nqXAvtd5P85hD6dp
         IP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QHmZsjfougNntZtAtIcB5fYigiaIeZKzX9MQN1yWCd4=;
        b=qOExuqvm73hXetrkJtzolPyw6X7V3JoKwcRWnT3pmaZaDzpdkKF7T+e7EWg8uZ7onP
         36sIRAt91tu6Je9iGQOKh4fhWpR07AssjPVwkoZB0cyp9gc0Bx7pxCzGYBCHIBR9r2gO
         Ixbq2YUsRHg/UYlYnqytATPeFuKXsUR+jaC1PxwgTT7Bw61w5jpqHPRb/J2BL1Jv/2Nq
         TSMr/JeEijb2Cu9HmSQccOTm+tPO4VfuJHjVi4rVH8MNjlByyogp8ZwC2hdFSamME9eN
         OY3a1zB7/Aw4mOeQH6d3dTNdJEEunut+HtIUemKs7xtLKy/KlOR/pRmixAA/Re0pdk03
         vLWg==
X-Gm-Message-State: AOAM533gEPfqw86iwOWA4T+oVnEAMUU7JOc//h7Hz9zXSxn/vD4CBltL
	vfgDzhpZb/+ZbrV6igLjX3Yjo3bHogo9TQ==
X-Google-Smtp-Source: ABdhPJxhVbYuerSI0tMFORK2TdX6mTB0MjaLInYZsr858Vi8agdcQTPav7sK6EOc0+xkWM/D0iz7wQ==
X-Received: by 2002:a63:7883:: with SMTP id t125mr948300pgc.243.1628174356460;
        Thu, 05 Aug 2021 07:39:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::f637? ([2601:646:9200:a0f0::f637])
        by smtp.gmail.com with ESMTPSA id b18sm6946779pfi.199.2021.08.05.07.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 07:39:16 -0700 (PDT)
Subject: Re: [oe] [PATCH 1/2] cve-check: fix comments
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 openembedded-devel@lists.openembedded.org
References: <20210805102729.32575-1-michael.opdenacker@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a55a4cc3-9b7c-ba72-9406-7d9516cc85cd@gmail.com>
Date: Thu, 5 Aug 2021 07:39:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805102729.32575-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Michael

Please send these patches to openembedded-core mailing list since these 
are for core layer.

On 8/5/21 3:27 AM, Michael Opdenacker wrote:
> This implements various fixes in comments in cve-check.bbclass
> In particular, the "whitlisted" typo is important as the "whitelisted"
> word is going to be replaced in a near future.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   meta/classes/cve-check.bbclass | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index a3fc9c2623..acdf005a72 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -20,7 +20,7 @@
>   # the only method to check against CVEs. Running this tool
>   # doesn't guarantee your packages are free of CVEs.
>   
> -# The product name that the CVE database uses.  Defaults to BPN, but may need to
> +# The product name that the CVE database uses defaults to BPN, but may need to
>   # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
>   CVE_PRODUCT ??= "${BPN}"
>   CVE_VERSION ??= "${PV}"
> @@ -56,11 +56,11 @@ CVE_CHECK_WHITELIST ?= ""
>   # Layers to be excluded
>   CVE_CHECK_LAYER_EXCLUDELIST ??= ""
>   
> -# Layers to be included
> +# Layers to be included
>   CVE_CHECK_LAYER_INCLUDELIST ??= ""
>   
>   
> -# set to "alphabetical" for version using single alphabetical character as increament release
> +# set to "alphabetical" for version using single alphabetical character as increment release
>   CVE_VERSION_SUFFIX ??= ""
>   
>   python cve_save_summary_handler () {
> @@ -230,7 +230,7 @@ def check_cves(d, patched_cves):
>           return ([], [], [])
>       pv = d.getVar("CVE_VERSION").split("+git")[0]
>   
> -    # If the recipe has been whitlisted we return empty lists
> +    # If the recipe has been whitelisted we return empty lists
>       if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
>           bb.note("Recipe has been whitelisted, skipping check")
>           return ([], [], [])
> 
> 
> 
> 
> 
