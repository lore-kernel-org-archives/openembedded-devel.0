Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49172C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:51:05 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.10774.1641581464127666848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wiw+RuYB;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id t32so6170268pgm.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=6fQVPMRKC6k6/r8RcezS5eLrqEiMDgO2swQZSDQWQsQ=;
        b=Wiw+RuYBzWjBskzIk6QYooH+oAOK0tjcaw6nUsd7oEXqgsrV3m17Qn8LnYz0vNgOQE
         ipXcjlU7AEbVqOXDPISv3Sgnb86v3xF9R/rtmqIsLzpmpHPUzMnJRH85iwreA4iiUhr2
         xDhk2uK1waii0OnSdXelbh1cQB5KwnIZTkEiwgDIPatiQeGE1nkHjiaj7RydzeAatUl5
         HhG17CYtjdVE5U5j0A2cM0jE4vspwDOzioHpm5VRltF6FsIbU3qJm5Lyg1PvBbM7S86d
         RCu2GaAa20cjGgqzF0C3uF5xifP8tC5gM+kbeMaCH+jiPD6q4M5u1eCS3TPThh2cwgp1
         H7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6fQVPMRKC6k6/r8RcezS5eLrqEiMDgO2swQZSDQWQsQ=;
        b=6QpOc6egT5wsQydQTub09g2pY+EzeAztcMlEBnljAB5xGlTJ2KxEXqbgcou297BxrY
         P+VzeWgvLdjtCIW/DB+0LdQYcPBcnjOSR5j5CdTnIvLYlVwpET74OSNVmWcXOZbIwVC6
         wNUfEiX+HOzwbN5ex15ENAU2BvN2p00F9461id0DQuL2nsym/NQjNWfzaWICi6IzH4NY
         zktBGOWd1UJI4BU1zho36LDQIQhVzVg5lVGSx/+7kC382NJlo0KTlMT6Bz8smtGP7/2i
         YcBKOVftAJroLfFeDgsoJFFsZPTlyPz8s3AEMXDHzUiewEsaK6Bxtyux/aV4a7bAWCT5
         TjsA==
X-Gm-Message-State: AOAM533DU4yeqg/ZBEJzV0R8TN1Z0KXBEYAMwWKYUFGzcgQ7Qy010glX
	+BlI/sozAZpZq/zVHm9u+cGSOYIAtnk0eA==
X-Google-Smtp-Source: 
 ABdhPJwZhUclYnQ37kIJ8cNZwXFHtA9UqsETzw9dl+6kLBX/snnB1L7b8DD58mB11tm8JkhxnNCyfA==
X-Received: by 2002:aa7:96cb:0:b0:4bb:77e6:91f1 with SMTP id
 h11-20020aa796cb000000b004bb77e691f1mr65295836pfq.41.1641581463478;
        Fri, 07 Jan 2022 10:51:03 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:1b:f11:717:929e?
 ([2601:646:9200:a0f0:1b:f11:717:929e])
        by smtp.gmail.com with ESMTPSA id
 m10sm1036935pgu.70.2022.01.07.10.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 10:51:03 -0800 (PST)
Message-ID: <0ffbbd0b-3010-70d8-30c7-240fcbaeeed6@gmail.com>
Date: Fri, 7 Jan 2022 10:51:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
 <1641565655-53792-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1641565655-53792-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:51:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94698



On 1/7/22 6:27 AM, wangmy wrote:
> Changelog:
> Bugs fixed for this release <https://github.com/manatools/dnfdragora/issues/#####>
> =========
> Fixed wrong access to manatools.service module (issue #202)
> Fixed issue #189 "No line break to fit the width of the window in dnfdragora"
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> index fdc164d56..a67bd9bcb 100644
> --- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> @@ -9,8 +9,8 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
>              file://0001-To-fix-error-when-do_package.patch \
>              "
>   
> -PV = "1.1.2+git${SRCPV}"
> -SRCREV = "19e123132cfd4efd860e5204261c3c228bfe80a8"
> +PV = "2.1.2"
> +SRCREV = "5cbbc07c9d015af284a424a172a379b385f05b6f"
>   
>   S = "${WORKDIR}/git"
>   
> 

please rename the recipe as well to reflect PV while you are here.

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94688): https://lists.openembedded.org/g/openembedded-devel/message/94688
> Mute This Topic: https://lists.openembedded.org/mt/88261764/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

