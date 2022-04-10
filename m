Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FDAC38A2E
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.21644.1649624306368262998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QO58DJuG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n8so12256454plh.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=eBKIv6bJ+0k1LQyHCMpYHBKyUlox7vhlrvtXeob6p54=;
        b=QO58DJuG3hwY/8THKjMx+7uOvRxDv3HcvghlzIJLufGLP6pQkeppsI0qmsaOxnQQSr
         bzUA4BffzeFJgoBQDKscUEC/V6nX2c+hU8uSBEGY7ZMuUdpPKS0CCEpSS08l8bBSAchr
         gmQBh2ElqkBIBlhhnWayEyHxYDVo7t3bwHMhgiUHAyLyrq5pDd7Y5iaVX5uHZ7QBzCAP
         zC6+es2oynYKcMWZqfZAd439I1YF8UVJITAokGLnHhmu0GoCfZUNqIv1WZ4HLMs76SL9
         W8yENGoFjmmK2dW7j01M8n/QlxfS6RCxKbQzzL70nLUREq2cUbnMp4M/2vsWn9gWF7DW
         XbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=eBKIv6bJ+0k1LQyHCMpYHBKyUlox7vhlrvtXeob6p54=;
        b=WI5Q+5CCXpsXkYZwEaEk0+sK3aFDLZY0TT0Zh6q6C7n3RuFvcJch5W5TI6plKwh+bT
         gaxOOGVW0ckmhJQZ22XeEgwjMte0yuRetS1v8GybU6MCxfJlwkG5jVmiobOoNyzKJYsy
         neOzdhnKcIFSsSFcyZO7QTVo+wvAqxUftDhQmPCdvhJrGCCR/YCQJndNsoyGNiZWmMXu
         cbZngONIoDiU0ukBS2KDeUH67ZKYUyko363SvGjWlvWoJ2JAo9Z33xuojCzwy+77OCte
         ZcGLmtOYZkdmkLcz+fCCwmZjbOMaVXpnxKEIZgURlV916lopryM+2t0KWebxMHo6ofFO
         4TzQ==
X-Gm-Message-State: AOAM532Y9JjEZMdRfiygCSZMa6Iy3lIkQ+StSTpqY+TCzCbxxCEGs1OX
	qFfm3aJSlYH4xsHsUA5hTk+J1gtWiHKo2g==
X-Google-Smtp-Source: 
 ABdhPJyBzq2vmNpGJiM2WWNJKB8fIAH4oei+IRXD0N7H3+osH3EHkraxK/8JFFRIJS/fG/Hca9AhZQ==
X-Received: by 2002:a17:90b:1186:b0:1cb:8e59:2a35 with SMTP id
 gk6-20020a17090b118600b001cb8e592a35mr3829193pjb.95.1649624305608;
        Sun, 10 Apr 2022 13:58:25 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::a9f9? ([2601:646:9200:a0f0::a9f9])
        by smtp.gmail.com with ESMTPSA id
 e6-20020a17090a728600b001cb646a4adfsm5121084pjg.52.2022.04.10.13.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 13:58:25 -0700 (PDT)
Message-ID: <11f1d379-d6bd-afcb-9cb9-ac0ccec78bb2@gmail.com>
Date: Sun, 10 Apr 2022 13:58:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-python][PATCH] python3-imgtool: update to 1.9.0
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20220410204316.4046326-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220410204316.4046326-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96535



On 4/10/22 13:43, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{python3-imgtool_1.8.0.bb => python3-imgtool_1.9.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-imgtool_1.8.0.bb => python3-imgtool_1.9.0.bb} (71%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
> index c957fce3a..3dc171252 100644
> --- a/meta-python/recipes-devtools/python/python3-imgtool_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
> @@ -3,9 +3,9 @@ SUMMARY = "MCUboot's image signing and key management tool"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
>   
> -SRC_URI += "file://cbor2.patch;striplevel=2"

please delete cbor2.patch file as well and send a v2.

> +SRC_URI += "${PYPI_SRC_URI}"

Its already set to PYPI_SRC_URI in pypi.bbclass. So perhaps not needed here.

>   
> -SRC_URI[sha256sum] = "4858f5c5f48cfa4a0bb99e60d00aa291172a7ecc2afe4fb77ed96121f59b6e2f"
> +SRC_URI[sha256sum] = "7fa7f6bd6bf069b5ffa07ea47478e16b6206bd2fc5b7607def999de0e9134a43"
>   
>   inherit pypi setuptools3
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96524): https://lists.openembedded.org/g/openembedded-devel/message/96524
> Mute This Topic: https://lists.openembedded.org/mt/90381765/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

