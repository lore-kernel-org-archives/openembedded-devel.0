Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705C3C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:55:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.10838.1641581708730027523
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MsXsRWSR;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id b22so5886367pfb.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Qe3wpAsinRKxUtK4akgV+UWjWGXS8kiuZo1B0fclco0=;
        b=MsXsRWSRELNCNgrz7gQjZHvTE7j6bVkttyx3HyAae0HE72fe0w9RJTqeQ1sz+fXwpP
         DsWRPx5Iw4q82o1R1aAsZmqF21NABzG1VjgLxewmnRSIzKtiLFdFo8BOK4HvwNLAw008
         9VUdoMCa2X5Q6RB4omn9cCG4L/v+w3EX9ghttzqDquWEZ5+1tnWyDsJkKay1N9qjFMhQ
         LepTcQsbvyFbRCI4mTg7/eGiwnDfUwOYR8A6SYUlvm6r+nbYOgvuyJRvcKfR5rGIT2Sa
         MsSoIygxhKdHnyzqch3CXZlUQqKliXBzQcB4Ls9lBFB8bWCt1+XGzGUJW+lXVc44o/6U
         8z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Qe3wpAsinRKxUtK4akgV+UWjWGXS8kiuZo1B0fclco0=;
        b=n9R1SU57VVPrYxXAbu5oa4siL1KpwNHEo7SvduKY+pwDFCkh1mo6qEt8SSHrT2OTSP
         d1v0OpDfGXpRhsBnYWXPhWxXyx6DzKyCH5zQs6tr3OUsHDlKwFGTgDPwfub3ICzj9HDV
         38VV0D1y9WL0wTEtYc1929hcF3/UAJ+5KmYNWwsGJX26fWj1bG1Nc+zeQncxhF+5cJV0
         CAMMKEp7DMDo12X2/lS3gMlfVre1ZVfanlnAnmpbf0cyNqjKpi1InRnMSaskag/+vHvX
         48TVwrQmK/tp3AjU7B+Nr4NQJpvZhhTNPLK1FXpi4UcnHHSRuW/ntMQDiB4oufYT4WXT
         CLnA==
X-Gm-Message-State: AOAM533H0RlW79Vi8DMIJiBdKsglwSlxs8Dtnzq3zlzqbaCNgNSX+tCQ
	sx5aI+i7m8rBZHb8dNEdb3Y=
X-Google-Smtp-Source: 
 ABdhPJxRzYGvpGJqoJVfThABjDBr6h2pLMxkLzQYVOVXCHrfhm0+8BxsZOifVvL8qM27VX1qh6mkGA==
X-Received: by 2002:a63:4422:: with SMTP id
 r34mr57973667pga.229.1641581708255;
        Fri, 07 Jan 2022 10:55:08 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:1b:f11:717:929e?
 ([2601:646:9200:a0f0:1b:f11:717:929e])
        by smtp.gmail.com with ESMTPSA id
 q19sm6594161pfk.83.2022.01.07.10.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 10:55:07 -0800 (PST)
Message-ID: <1a1d1ee4-dae0-e93f-8b83-d90bb7b054b0@gmail.com>
Date: Fri, 7 Jan 2022 10:55:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-ujson: Upgrade 5.0.0 ->
 5.1.0
Content-Language: en-US
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20220107174730.3326962-1-leon.anavi@konsulko.com>
 <20220107174730.3326962-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220107174730.3326962-2-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:55:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94702



On 1/7/22 9:47 AM, Leon Anavi wrote:
> Upgrade to release 5.1.0:
> 
> - Strip debugging symbols from Linux binaries
> 
> Add INSANE_SKIP for already-stripped to avoid build errors due to
> the stripped debugging symbols from Linux binaries in this release.
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../{python3-ujson_5.0.0.bb => python3-ujson_5.1.0.bb}       | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_5.0.0.bb => python3-ujson_5.1.0.bb} (78%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
> index fb1bcd761..821eba58c 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[sha256sum] = "3ff7242816b1d22c08c04c4c6db0f6ba7c16cd624ce38534c1025defa011e50e"
> +SRC_URI[sha256sum] = "a88944d2f99db71a3ca0c63d81f37e55b660edde0b07216fb65a3e46403ef004"
>   
>   inherit pypi ptest setuptools3
>   
> @@ -31,3 +31,6 @@ do_install_ptest() {
>   }
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +# Debugging symbols have been stripped from Linux binaries since release 5.1.0
> +INSANE_SKIP:${PN} += "already-stripped"
> 

is it possible to disable this auto stripping via some build configs ?
if so that would be better for debugability to let OE do the stripping 
operation

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94693): https://lists.openembedded.org/g/openembedded-devel/message/94693
> Mute This Topic: https://lists.openembedded.org/mt/88266861/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

