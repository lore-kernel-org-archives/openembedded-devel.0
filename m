Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136BFC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 05:58:25 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.7496.1634363903772864429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 22:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IuT4RUap;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id ls18so8660195pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=3PtIeeYandgcLpHSOVf+0qEIgmxtzNaC3bvYnGf+1Sc=;
        b=IuT4RUaphQLFywcMgsxT1TBcn5+BUHDnuhdwY1XUW7EE/KjOa7UFJaSN5fgiOGqv6u
         qAX+tcA/gfIYTSlk8TQWr4dDuzp38U1UvR7O2gJ9ZVRcAVslikIPjt3B3gNk6PofV1Hs
         iLq6uHZvGKudxd26ovLFbTpflv3HCkyTQNCumPE2gLlVpjGJiukzLlMj0/JbsYyoMS2t
         W92Zx/4Yxq5ED1rBuKrk4+bUSrCGZrd49vh5nq1k9vZYeXvrVqMKwnpB+Wt6yLjAoQLN
         037JMK6ZUbIiPipJwlUAnvof+g/W8r4x2EOVWSDocBLaDW+8VhHJxAn4Mwx4VN9kiyAZ
         0emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3PtIeeYandgcLpHSOVf+0qEIgmxtzNaC3bvYnGf+1Sc=;
        b=HiuEg/ZKLW5HWOf5+WA72ipTRuov+FsM61cBGpcEoKh9MxLbmwlT2v58tXlJ1rLWRD
         0B6VlRLhFSm//j2YyN+zPwIceoWyRFh/ZH6SyQIKlQs5DIhIeiLGZgJp+RYrTgzhCAG2
         PNGKOy41k+LmKWFDL1j5idP+u7L1F1aT+XugHCryrzf3zWW82z5udiHyfDcj9xlF7EH2
         A1FFeeJfagY6ojSSHMf0Gruqwu0Xw6sIUHCUo8WH4ck6CN7Fxuz2dWDYoeIC8K8XKg8r
         HOzcd9JPXEo7T/BNs0gexI9ElW3RF08vBBbbrgn4a4cP1jXi0wyetbSVaN1S0SiolvnP
         pfVA==
X-Gm-Message-State: AOAM531XUoF2b5lC6dnS/+uaIPMCn7tCwMZhoz6+K4BSdYEZVCVRIj7Y
	Mv1H22djH6Nc3jTATsuXblJlQ2/1JIQRuA==
X-Google-Smtp-Source: 
 ABdhPJwmNm0wKbLGX2+GyD9YjS/xs8r1HaFkRmF4Hgu6sX/mItihJhEq5LegFhCoLYfF3UzLAseZJw==
X-Received: by 2002:a17:90b:4d8e:: with SMTP id
 oj14mr24569484pjb.237.1634363903239;
        Fri, 15 Oct 2021 22:58:23 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:6555:f795:63a:89c6?
 ([2601:646:9200:a0f0:6555:f795:63a:89c6])
        by smtp.gmail.com with ESMTPSA id
 s2sm6244750pfe.215.2021.10.15.22.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 22:58:22 -0700 (PDT)
Message-ID: <ed3366ec-1308-0aaa-a898-6b27c272714a@gmail.com>
Date: Fri, 15 Oct 2021 22:58:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [meta-python][PATCH] python3-ujson: update to 4.2.0
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20211015225553.4161966-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211015225553.4161966-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 05:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93390

this is already at 4.2.0

On 10/15/21 3:55 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb} (89%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
> index d8e83c58a..3dbfe44fa 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[sha256sum] = "22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c"
> +SRC_URI[sha256sum] = "fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883"
>   
>   inherit pypi ptest setuptools3
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93342): https://lists.openembedded.org/g/openembedded-devel/message/93342
> Mute This Topic: https://lists.openembedded.org/mt/86361654/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

