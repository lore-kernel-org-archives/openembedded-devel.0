Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F4CC43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 17:37:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.8624.1657388263058022495
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 10:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D7oGGSP0;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 73so1462041pgb.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=o+vnCEJE9B3Xnm6rsxHYTpBC4XYf3bdNlp2sldiYf34=;
        b=D7oGGSP0RQfkmglORDZEyDYmpqzaW9oSEun1nSuJAV5jzPHYUhfUuDY/uJfJ/AMqIg
         8HSOgbQ5pBFUdKaenMNklqTvSheXyRG0EBAKVG9CyBo9ZeruhIAXMbHAibEh7Exvn9mE
         4fEq7B947+syDOU+cqMn9UQaUFWGde0itmUPS0RM5JrHbAc9qggiGXZTgra7g8YOt/+E
         3oCs1Lo7UR3TXfsayrQmJIN4wbmsufQN8jtl/TssdvOaBVqeKb41wHZPz+gNzUgvZtxw
         wIxX9qXykqgOGy5YgTnaEvy16jrts6l7DDu38wrvLpYjfIrn89h3UjhlRWaIASIeEqb/
         Jumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o+vnCEJE9B3Xnm6rsxHYTpBC4XYf3bdNlp2sldiYf34=;
        b=BQ/AUinBkR3g7Tk5TvYURwx83X89Uj0O1v9o+N/yyVThg/edQ5tNkNyonk0x74VqGJ
         XA3JWaKBngHWReD6rvk/I4a5e12NrO0dQf3GaMo+xrPDAOcfmO1A9ubnxaaH+2Hw/DHW
         A5esdYgzPIIull+q9t6d+dIPKUPL0Clp5Pf1I6DYu+cpAmRp7cSf5GysirAIlI/skNhN
         eUxYP61+lMrtTJjjHciDytsZx5swzra5UlECk6T0++qHmBLcI3cL4PiOAEd7dc1nQ/MO
         +pHDjmKKZOz19OIqHEb65dd0wIevanmNZ/HPedJGqERCMP7VnQxDCuclTjXrCakd3DMa
         Oveg==
X-Gm-Message-State: AJIora+zBkPza5KI5qmBvg5HH0CpVP2/ZVL1lFEMCEZboL5SwOzL3XMf
	+GzamnAW6w431zeBNAGasf4CELbvktM=
X-Google-Smtp-Source: 
 AGRyM1usilOiiZSLg5WjHmO8WvqdOx5zaQRtmni3KeZCZK/p2bj0hcSaI+LBTaGYgaw7j0wiWNeR1Q==
X-Received: by 2002:a63:5710:0:b0:414:dd94:727a with SMTP id
 l16-20020a635710000000b00414dd94727amr8605586pgb.300.1657388262036;
        Sat, 09 Jul 2022 10:37:42 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:928b:9751:6f45:8d7?
 ([2601:202:4180:a5c0:928b:9751:6f45:8d7])
        by smtp.gmail.com with ESMTPSA id
 r18-20020a170903015200b0016a11b9aeb3sm1577071plc.224.2022.07.09.10.37.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 10:37:41 -0700 (PDT)
Message-ID: <41cb6ddc-dc61-3eb0-e586-e2ab5a0ec745@gmail.com>
Date: Sat, 9 Jul 2022 10:37:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 2/3] networkmanager: fix
 build with enabled ppp
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
 <20220707090653.2513017-3-adrian.freihofer@siemens.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220707090653.2513017-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Jul 2022 17:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97799

this was already backported and is in kirkstone-next.
https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=7040cffbb06b2ae0a03b5353b2698a5c5ead9172
- armin

On 7/7/22 02:06, Adrian Freihofer wrote:
> From: Javier Viguera <javier.viguera@digi.com>
>
> If 'ppp' packageconfig option is enabled, but the build system does NOT
> have pppd binary installed, the build fails with:
>
> | Has header "pppd/pppd.h" : YES
> | Program pppd /sbin/pppd /usr/sbin/pppd found: NO
> |
> | ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it
>
> This is due to meson trying to look for the 'pppd' binary in the build
> system when it should not. If the build system does not contain pppd,
> the build fails.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> index ab8fc136a..eb9e1553c 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> @@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
>   # consolekit is not picked by shlibs, so add it to RDEPENDS too
>   PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
>   PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
> -PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp"
> +PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp,ppp"
>   PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
>   PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
>   PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97767): https://lists.openembedded.org/g/openembedded-devel/message/97767
> Mute This Topic: https://lists.openembedded.org/mt/92224796/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


