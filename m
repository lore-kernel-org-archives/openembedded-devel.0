Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EF5C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:45:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.13775.1639413908563912067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aZkidNcL;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so15052620pju.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=mjtn5ZxMLe0xA/IvYV8D4S0LbDAcrVQ8K8iU8zYW6z0=;
        b=aZkidNcLjJmM1NWFNsc+YOrgtJK1FPWTYbJlMj0iKFA7e/fx768gfYYG1IvPYXuQXq
         6App1grld5+yR6Car6q6e7+AITaVvB2W6kvQM7H3MtlSVJWtPbtJDS66/brWfe+p7tYr
         6WdDSXZ7WIoUgUkRG06A7nxYNLf7sXoRvjrBHjL9Gm6D4CbdvxlOyyOJu1IcYeoQIlE+
         Ckc8FhRpMLQ2dh27GAw6P1i2yO4VuprHPr+ywZQkr/gt0bF/MyLL2XsCC7De+ujOgDaL
         eBR02BMPX7vYs0cRYKZh7PauYpTUqiyqmQiYLo7CAIMGlspHTII/OyNsZtYUFrpjeYRj
         OTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mjtn5ZxMLe0xA/IvYV8D4S0LbDAcrVQ8K8iU8zYW6z0=;
        b=1ARLpXE2AQFI2piy4U9c88UzNNNUXdd88NjmdlVSm9PIhJrs0UHnSnosRYLSGdMs80
         hNCCCzXg1AqH4RXHcPoRIWv/3NRXF3XRuPzvR+1jwl5X8NlthmZAm20b0jxmr8B1YKB0
         eSNI/4Np5tqrB1WUp6M5rwRCYwVPmS4Ychj+9EZKTP7yAJ9xahpwQIesvDqvq8t9dSnW
         BNIu96+1xqrtJUsXNCE/yFzd2twpTWdxIzUlG/TVVBA08zZPgLwoNYeNbwVtw0lctAlu
         ti0v5qs8V/TWWHMwPfa+ySOXDPRNb1YtdNYYHF6JPwgKfrU26HpipSXECrJSaEDY21pj
         APdQ==
X-Gm-Message-State: AOAM533avFVRIb/Ji6xk4kp0mTstd1neLa8m5WskmC7782jd4w7FYbPh
	1HTpgk4dzNvlzKoL89wp51o=
X-Google-Smtp-Source: 
 ABdhPJxY6L0SYvq271oUp1i/BIDvY9MPMkkqlOu1k2HSHBDLQamMiwGaTeU7jCnbI1XabnzbRQpQfQ==
X-Received: by 2002:a17:902:a714:b0:143:d007:412f with SMTP id
 w20-20020a170902a71400b00143d007412fmr94958749plq.18.1639413907914;
        Mon, 13 Dec 2021 08:45:07 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:7457:5f16:e18a:42e0?
 ([2601:646:9200:a0f0:7457:5f16:e18a:42e0])
        by smtp.gmail.com with ESMTPSA id
 g1sm13645416pfv.19.2021.12.13.08.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 08:45:07 -0800 (PST)
Message-ID: <5e589f0c-0133-113e-27f8-0a42468746c8@gmail.com>
Date: Mon, 13 Dec 2021 08:45:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [oe] [meta-python] [PATCH] python3-diskcache: upgrade 5.2.1 ->
 5.3.0
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1639401446-27788-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1639401446-27788-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:45:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94337

it was proposed earlier.

https://lore.kernel.org/openembedded-devel/20211211185829.2546544-1-open.source@oleksandr-kravchuk.com/T/#u

On 12/13/21 5:17 AM, wangmy wrote:
> License-Update: year updated to 2022.
> 
> Changelog:
> ==========
> * Add support for Python 3.10
> * Update copyright to 2022
> * Bump version to 5.3.0
> * Add Python 3.10 to the README
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   ...{python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_5.2.1.bb => python3-diskcache_5.3.0.bb} (57%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
> similarity index 57%
> rename from meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
> index 4a028d7694..85e2807634 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_5.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.3.0.bb
> @@ -1,9 +1,9 @@
>   DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
>   HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a3e7dd5bc8f0053fee7c5fe9692b932d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c60ef82f0f40155453f6d5f2c94b6e8e"
>   
> -SRC_URI[sha256sum] = "1805acd5868ac10ad547208951a1190a0ab7bbff4e70f9a07cde4dbdfaa69f64"
> +SRC_URI[sha256sum] = "3f1fa30b29fdff26cfddcb3ee7d61376903f82c769ea2907a2b82a5bfb8abbe2"
>   
>   PYPI_PACKAGE = "diskcache"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94329): https://lists.openembedded.org/g/openembedded-devel/message/94329
> Mute This Topic: https://lists.openembedded.org/mt/87696997/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

