Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338E9C636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:21:18 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.13457.1677082870564177725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SS9VnO0U;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id g6-20020a056830308600b0068d4b30536aso1575018ots.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIAIjb2e/uWobjuOtcsETdfx7PvOedF6k7PkmfUrJUo=;
        b=SS9VnO0Ukr1xiGN0IOqw4K9lh9yQxlBBkjvlleB45AaM4pQHlx1x0VL1hk/8KpEifz
         imQl/FBJZWuqRwv+wsaLi6QdLWRbNpVsrnw7pA82TqLDnjlYJuSnb695FCnagrPxFR9T
         xB4wwvsmA6ryeHNBUSop5wE7/5z20eivE0qtqPuO53ernkgCvQxTeeeHVijEHdPNR14C
         PuiX5ZPF9FasuAlEQAmhnpNNmEeGFYftH/jRNU4JpfmdLW5oAcsK9icGN1T+UQZ7PVb6
         vKlZ8REIGQMGRyEWLguGFc3groIUCVoN1lqUoH4qJVMV5H+z29Y2GojGWb7lbycpHKP9
         cEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIAIjb2e/uWobjuOtcsETdfx7PvOedF6k7PkmfUrJUo=;
        b=c1MsGWZW1pBtq2xhGltxuAjecEg/5pyCTbdLQu6yBR9mqpxY3UsCHrwvPCIwhTb2WS
         EEpHTgkYZocLdLtBdnhD6i/yASFc19mY+Jytevc1uUr/BKOKCqqhi1xXGQOoDP4grwXI
         RY1Wl7J3b/HJjgAX/JkoBRVv4UVAeCHqZdAwy/KF3OIz++MQkWET9Idxy0rr/I6Q14NV
         EdIz25dD5BFgy2nCftEz/92COxYlRQGJ9Nwly22WBMTKCGUrC0KiRPqWlkNUgyHCqXyV
         N9YhGRV5jTcrhBrno3yILRZ1t6tYa7rJ9h4geMBtWkzX/DHLuL9mR3BdDR9pPOdDFopi
         bc/Q==
X-Gm-Message-State: AO0yUKVUuBiD0NArSO0zIsKykbCTh9S2kfASPSxD/H3qmRAA2IjAZuEC
	erMAQ72ut128BSfkd+bh9+o=
X-Google-Smtp-Source: AK7set8xP+dRR5H5E+YlPwh7g/mYwHsmzxFNSxdGwa0ofj9bMmrLWPliupm9MtvaWzTZrwygqBAzNQ==
X-Received: by 2002:a05:6830:43a9:b0:68b:b06a:5b8b with SMTP id s41-20020a05683043a900b0068bb06a5b8bmr5336135otv.0.1677082869787;
        Wed, 22 Feb 2023 08:21:09 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:8384:964c:970c:db9? ([2600:1700:9190:ba10:8384:964c:970c:db9])
        by smtp.gmail.com with ESMTPSA id p5-20020a9d4545000000b0068d6ed06b73sm1749931oti.18.2023.02.22.08.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 08:21:09 -0800 (PST)
Message-ID: <2affee6c-e89e-98d9-30c4-a79c20e2a6af@gmail.com>
Date: Wed, 22 Feb 2023 11:21:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-networking][dunfell][PATCH 2/2] openvpn: upgrade 2.4.9
 -> 2.4.12
Content-Language: en-US
To: hsimeliere.opensource@witekio.com,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <PR3P192MB0714ED9A8AE4A3E5FAA10143DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
 <PR3P192MB071407F89FE9B7A1AA8EE484DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <PR3P192MB071407F89FE9B7A1AA8EE484DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101211

Hugo,

On 2/22/23 4:39 AM, Hugo Simeliere via lists.openembedded.org wrote:
> Fixes below CVEs:
> * CVE-2022-0547
> * CVE-2020-15078

Do these CVE's affect the version in Master?

-armin
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  .../openvpn/{openvpn_2.4.9.bb => openvpn_2.4.12.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.4.9.bb => 
> openvpn_2.4.12.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb 
> b/meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb
> similarity index 95%
> rename from meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
> rename to meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb
> index 4820d3d96..55e66036b 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.4.9.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.12.bb
> @@ -14,8 +14,8 @@ SRC_URI = 
> "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
>  UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
> -SRC_URI[md5sum] = "52863fa9b98e5a3d7f8bec1d5785a2ba"
> -SRC_URI[sha256sum] = 
> "46b268ef88e67ca6de2e9f19943eb9e5ac8544e55f5c1f3af677298d03e64b6e"
> +SRC_URI[md5sum] = "e83d430947fb7c9ad1a174987317d1dc"
> +SRC_URI[sha256sum] = 
> "66952d9c95490e5875f04c9f8fa313b5e816d1b7b4d6cda3fb2ff749ad405dee"
>  # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, 
> not for openvpn.
>  CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
> -- 
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101205): https://lists.openembedded.org/g/openembedded-devel/message/101205
> Mute This Topic: https://lists.openembedded.org/mt/97156570/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


