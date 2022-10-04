Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EB4C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 18:16:39 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.14307.1664907398460483188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 11:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dUV9VGOa;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id f193so13388826pgc.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oIVaIsry2xt/LuNSb9uBr/ro9N2G9oarY3HqAleVrnQ=;
        b=dUV9VGOaZMwytLkaENeoUXol5oz8kBj/70dxwqrGHh9mkJ6QyHCxmibyeZa83IaCR3
         AtGjIi1IzS2yvq6bl4VF4Q80Wa0hhbSBUUJRjBmoNkzNqpNOwo05IxE43FoCXASdi2WY
         lzWpfZecu+zeoF2Bbo5D8Rfc46I80US+tZimHRPu1r3lCFm8OwMdxA2Z75yRHBD4Ogca
         ZmEt7f7L9tO5W+raQjijsFe68yFOmfCtOx1IvsTJSLJJyoVELs6vu2TAvLBAKL/PsOdp
         8hudvC4n6aqrZBa5fxVS0sHTiuc6SsxIR3wqqz8kBgKXMsAfIAIbdYWykFs9rTSsu4LF
         /5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oIVaIsry2xt/LuNSb9uBr/ro9N2G9oarY3HqAleVrnQ=;
        b=oywRF1S7BdCqmnsGycCOt9qmJ0RkOzEOHVh36YUg97IienxGXiHJvGgxH0vgJnTA0v
         bd5/KrgmbEmHAGePpPxyHuIZzaN8FbRzmQeN+EsWkkDKerczT/vplCBD3KUXawFzyeQx
         NFJqMQUagJ6OXjUYd7vNH1mwUWTPBQrEJNSI2GyeUNGCWGStSavOK1X5xxJkcuQ7bZ/E
         YboWs+kaB1lDP8dDwX9WUF2glpfhIjINbeFOB20TBP+cnkDRUOX8LITA/Oh5INfJ3orO
         wKzczaGjV2V/suuZNjfKuy0jLN247VF6O30FmDSTxpAnCcWG0X1HEpOJ9G258B/x2T8D
         bRuQ==
X-Gm-Message-State: ACrzQf36tzf2VrFoPKZM+s0hUy434AgqETZtLm7XujrdvllgX/J53n4C
	8ukd3go7WHfmCak0n8QNlJ0=
X-Google-Smtp-Source: 
 AMsMyM5/4IlAMra1q2hF4ebApw7X8wKRhMALjIEBsa2Ly6oZ5yVd5om/iwLhHfTBGFXkwf/ufBhJXA==
X-Received: by 2002:a05:6a00:15c9:b0:541:1767:4ce2 with SMTP id
 o9-20020a056a0015c900b0054117674ce2mr27909266pfu.30.1664907397871;
        Tue, 04 Oct 2022 11:16:37 -0700 (PDT)
Received: from [172.31.27.15] (50-240-203-141-static.hfc.comcastbusiness.net.
 [50.240.203.141])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a170902dac800b00173368e9dedsm3957894plx.252.2022.10.04.11.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 11:16:37 -0700 (PDT)
Message-ID: <9d4accb4-515f-0b72-9670-7c5aad728ef4@gmail.com>
Date: Tue, 4 Oct 2022 14:16:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-networking][dunfell][PATCH 2/4] mbedtls: Update to 2.16.12
 stable version
Content-Language: en-US
To: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>,
 openembedded-devel@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
References: <20221004062843.2541778-1-mbriand@witekio.com>
 <20221004062843.2541778-2-mbriand@witekio.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221004062843.2541778-2-mbriand@witekio.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 18:16:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99060

Why did the LIC_FILES_CHKSUM change?

- armin


On 10/4/22 2:28 AM, Mathieu Dubois-Briand wrote:
> Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
> ---
>   .../mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.16.12.bb} | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.16.12.bb} (81%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> similarity index 81%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> index 0ad1e02630a8..adb8e4a2c994 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.12.bb
> @@ -18,13 +18,16 @@ understand what the code does. It features:                          \
>   HOMEPAGE = "https://tls.mbed.org/"
>   
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=d32b51202e173d9e438ca20f008209a1 \
> +    file://apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    "
>   
>   SECTION = "libs"
>   
> -SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
> -SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
> -SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
> +SRC_URI = "https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v${PV}.tar.gz"
> +SRC_URI[md5sum] = "f3a7b041c43b35c883632a1773bf61a6"
> +SRC_URI[sha256sum] = "294871ab1864a65d0b74325e9219d5bcd6e91c34a3c59270c357bb9ae4d5c393"
>   
>   inherit cmake
>   


