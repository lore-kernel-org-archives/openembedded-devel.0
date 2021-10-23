Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BB4C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 21:16:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.11569.1635023805001505104
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DAqm8qhc;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id t7so6761445pgl.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=2ZGVo2h334Tyngx2rcNGn8nQyyu8Yz3EiiArB6gLOAE=;
        b=DAqm8qhcci9dtxHLqnBlFmoKJVe9g/3Z6DGwWiMVvSnLqLTULyAEY4htAqxZyIMm3M
         yNIKW+lCSbmZkhw44FlZIV/B9FcmIZTxByzWRRXRCa5lYexR2K12bm0lVol11V1BpEB8
         e62h/GtEwxQp3tsvyTqpUv4mBE3ohK27YbTY5FQJQNfhIYafv6OVvwyEW0U0Mb33kKcd
         zNkQvvA5xyJ6AflBwfTVry8gec+CkGU3RAQfl2JFu55Z67lm28QCNtgd4h1wxFmxYPbS
         BJy/9t0sa2YYAEBlenAcu0EluWtfAsgFyU3H/2fp3n8RZ3fnOhbVz1esYLM4owcND5jx
         DOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=2ZGVo2h334Tyngx2rcNGn8nQyyu8Yz3EiiArB6gLOAE=;
        b=ynv24LY+x62aX2lAgk0eKSI9s+PlvM8sz8B2nqtzeUfT9bLtp3e00Z1C6TP7Wv6WWq
         1s6ANnDWkSMlVixuEKHXKADT/KCPg54oFjg9v2hfk+ctrMx0uuSqlJDT3gjA+179SYbZ
         IKBkb57exYHwqQcV7myuusCN6Awm4cilxzx31RSbPiohXozUTOjfRYga//f9SzfBNxjU
         DhaOWHsixIHDaFSn3OARLKw93semanY4zLVSfbkMxhGDJg+6XDo2SVkIbpWX7DheC54s
         3nz7mOdaHDqZwI6fj4wfH5Q9cUYvuTKjuC2y4g5lXw2MUm15yD2nwO+jwwdFOZ3bUPRC
         whXA==
X-Gm-Message-State: AOAM5301dZ6pxXzwLTI+UZsIpGT8RHX1d6eDxak9Wa4lctS+jwpCmH2c
	Hc1OaUJBj/8smi/nu0h/imo=
X-Google-Smtp-Source: 
 ABdhPJyH+SbdfvZkcE/zXcm66ANMVnD/pkC4k+ArMBULHM+aEW6drthX3ghnxNo+uOHX1afnHkrjuw==
X-Received: by 2002:a63:555d:: with SMTP id f29mr6137657pgm.33.1635023804395;
        Sat, 23 Oct 2021 14:16:44 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:c8cc:aade:9baa:237b?
 ([2601:646:9200:a0f0:c8cc:aade:9baa:237b])
        by smtp.gmail.com with ESMTPSA id
 z2sm11988679pgn.8.2021.10.23.14.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Oct 2021 14:16:44 -0700 (PDT)
Message-ID: <efd558f6-8723-4c18-8a80-096ccf85759b@gmail.com>
Date: Sat, 23 Oct 2021 14:16:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [oe] [PATCH][meta-python] python3-stevedore: update to 3.5.0
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20211023203617.1656746-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211023203617.1656746-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 21:16:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93552

Thanks for your submissions. This recipe is already at 3.5.0 in 
master-next. I suggest that you rebase your patches on master-next 
before sending, that way we can avoid duplicates

On 10/23/21 1:36 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb} (80%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
> index e2f43048e..8d345e66e 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[sha256sum] = "59b58edb7f57b11897f150475e7bc0c39c5381f0b8e3fa9f5c20ce6c89ec4aa1"
> +SRC_URI[sha256sum] = "f40253887d8712eaa2bb0ea3830374416736dc8ec0e22f5a65092c1174c44335"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93548): https://lists.openembedded.org/g/openembedded-devel/message/93548
> Mute This Topic: https://lists.openembedded.org/mt/86543468/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

