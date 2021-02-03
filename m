Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3831.1612389629543027937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 14:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mUy2E7mb;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id t29so700317pfg.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+lfnjAc+Dj2rc/pZAcEmm/CD89zx3LZcXusVJLNaFSM=;
        b=mUy2E7mbfmUmEVfc0L7afR6MgNmR9g4DU/7VfOQ3QlQq4arNomX2KAaPliDUJnZGlD
         zjDJqHBipfgnXRSjOm1w1kHo2uRX5Kbgz3+cHRUzGMmiBMF9NKQVP9Hlfq38/PvpB+XZ
         LrlFqG6O/EK5gBi+YaCkY9cMsNYo/gOCrmAyhOzr1UDMo3VSPYhtfR8FQWBxPmqOM4tZ
         G85Mxl1NxJdeZ+toSqJaIdjSHmZeQLVceANrBEIdJgM7HwzZ+/m6m/JDlNITtOROLKuk
         CXGJ4lvQL/Yd5GGpsFDHLzp+y2ATwWdoggrM/NQzfdHEk+yLkN3Z+9LbmoWRWMGuv6iu
         z0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=+lfnjAc+Dj2rc/pZAcEmm/CD89zx3LZcXusVJLNaFSM=;
        b=KQJbhtujwmzapF7r6Q/FjFSE0HMYDaCrd3fLN613w6mxnOkeQA0br8rUZIjzCslLNR
         G3MTCQhkL7TsOu5pxmti0T6Ro6DvGXWrIrnK2e4m1u86YxgsCtcnm6gm+AP023Ku0NO5
         fOTW7KwBatmdqS3+fd//kEIvEEXPOOi60jxoXML44tJXyaT3/CK88hr9DZys1N+qv0Jb
         gSjXN9G/BCzhvoxPpATPjAe7SqZFGwM5eP1IM0zYdZSXTbMYoVL1q62u6KF80FPGjv3l
         6+jZ1xQsxDGWMv6ITOFvDGEfkIY5jKgORzeiS4DnHadbMIEx9oqGg1Pwvhwtwr9Y2V5X
         utUA==
X-Gm-Message-State: AOAM530BRFHgNbGPSRCzYP0+4RdEKv1AwahKs6zlyvLtLnrZBsFNukH9
	VSNygaTxkTv7+uNTn5cDUpS5oumWFWh8Ng==
X-Google-Smtp-Source: ABdhPJxncOk9ekUf7ygQh0FpnjN4rpxxkwmwlb+Zkx+u6f/IL4E4sBuRW9KHVbXvsCUOwzW/9NvRGw==
X-Received: by 2002:a63:f95b:: with SMTP id q27mr5888692pgk.82.1612389628476;
        Wed, 03 Feb 2021 14:00:28 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:544f:4719:8737:443b? ([2601:202:4180:a5c0:544f:4719:8737:443b])
        by smtp.gmail.com with ESMTPSA id a14sm3652003pfl.169.2021.02.03.14.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 14:00:27 -0800 (PST)
Subject: Re: [oe] [PATCH][meta-support] nano: update to 5.5
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203201558.1431983-1-open.source@oleksandr-kravchuk.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <5a49ac04-cb27-318e-1977-c50f8f6cd65d@gmail.com>
Date: Wed, 3 Feb 2021 14:00:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203201558.1431983-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/3/21 12:15 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

What layer is this against?

- armin
> ---
>  meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/nano/{nano_5.4.bb => nano_5.5.bb} (87%)
>
> diff --git a/meta-oe/recipes-support/nano/nano_5.4.bb b/meta-oe/recipes-support/nano/nano_5.5.bb
> similarity index 87%
> rename from meta-oe/recipes-support/nano/nano_5.4.bb
> rename to meta-oe/recipes-support/nano/nano_5.5.bb
> index 68c326b52..29ec00a79 100644
> --- a/meta-oe/recipes-support/nano/nano_5.4.bb
> +++ b/meta-oe/recipes-support/nano/nano_5.5.bb
> @@ -12,7 +12,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
>  PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
>  
>  SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "fe993408b22286355809ce48ebecc4444d19af8203ed4959d269969112ed86e9"
> +SRC_URI[sha256sum] = "390b81bf9b41ff736db997aede4d1f60b4453fbd75a519a4ddb645f6fd687e4a"
>  
>  UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
>  
>
> 
>

