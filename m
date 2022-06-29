Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A900C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 17:05:55 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.14180.1656522351258151053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 10:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TQMAHUf5;
 spf=pass (domain: gmail.com, ip: 209.85.166.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id a7so5615779ilj.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Qi1ucf8TMsH0Q+DnI2C/zhEpgbgXg3tCSgHpPJE7wi8=;
        b=TQMAHUf5VBLE673Cord8jNKY01/pVees26mPga5zfQKqaH4m9og2cWNaNBUSCAQ6lQ
         pIGWj/g4NqeiLiuRo3t0Hea4wl08HDrub87tUYjs7w4OGNqfb02SCyTHsTwLjHZ4JsSK
         gTZVYRC6UxLZH67tOBESzYgeTq1+rdZckxG5/5fAbmHn7qi9lnq8XVGjcUon55Xy7t1k
         TUVcnhHoiR3ZMQZlOCFOSc8F3/Zstt1w6IJGo5dvazq9MqdMTIx31PqUHPtSnPSFLOX6
         s3vxJKlaofbiVajJjtY89J8pLkkKeMgYAJo8Nm7mXfuDQtgdCV9zDahqzOIUHx9IMZ5f
         Rv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qi1ucf8TMsH0Q+DnI2C/zhEpgbgXg3tCSgHpPJE7wi8=;
        b=5TnLrxEahyoOfPM01EvS8p7NDjKbD2019YhODtv2daqK3F2S3rNRRO/5G5Cn9NMaiR
         mI1f8I3FGr9AMXS8XgI1yeevDZzmy7D8FvFQOC4yQ3LjBIEE+nYUgTqMWeWOivt+ofZY
         LwKqeJVv6pluB8dicfdAdnYxXpsEDU+KFlGB6pDKRIsTg0SokdDlDDFRT8x6ni76aDrB
         3k1gSXTtjDK38FUUviY2NJe+lB0CeaN7YaNvQ1gwDEbRZmnjhlrxfm3y0eMGXdp4yD+f
         tIZInR877YkbjYwgyikBrsoZkuQ7/vqwF1aqHu09r8kdK2bag8Xa4UOpNxlzQGiHNn+9
         Epdw==
X-Gm-Message-State: AJIora8yvGSqb7piYrzAh1QvnaRrlHbAnYmCDW5S04ihnSPNToSVikgW
	FNZ1UJPmFW/F8d6JtrHI4Ps=
X-Google-Smtp-Source: 
 AGRyM1snKWku/noB7LLr3KQh6UxIQC7L8j96JvuYW669PWiMM2n17/iCThHamel3JgBNPI5u4PbvPw==
X-Received: by 2002:a92:d849:0:b0:2d5:43c0:f9f6 with SMTP id
 h9-20020a92d849000000b002d543c0f9f6mr2321424ilq.25.1656522350545;
        Wed, 29 Jun 2022 10:05:50 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:6119:b422:792f:b68a?
 ([2607:fea8:95df:9730:6119:b422:792f:b68a])
        by smtp.gmail.com with ESMTPSA id
 b34-20020a0295a5000000b0032b3a7817a7sm7588972jai.107.2022.06.29.10.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:05:49 -0700 (PDT)
Message-ID: <dbae2f04-a763-9fc4-b4d5-32ed3d6f9dcd@gmail.com>
Date: Wed, 29 Jun 2022 13:05:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] networkmanager: fix
 build with enabled ppp
Content-Language: en-US
To: javier.viguera@digi.com, openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
References: <20220627133914.14615-1-javier.viguera@digi.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220627133914.14615-1-javier.viguera@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 17:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97621

do we need this patch on master too where we have networkmanager 1.38

On 6/27/22 9:39 AM, Javier Viguera via lists.openembedded.org wrote:
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
> ---
>   .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> index 6c665d53bb50..e3b1296a6bc4 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
> @@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
>   # consolekit is not picked by shlibs, so add it to RDEPENDS too
>   PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
>   PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
> -PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp,ppp"
> +PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=/usr/sbin/pppd,-Dppp=false,ppp,ppp"
>   PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
>   PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
>   PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97600): https://lists.openembedded.org/g/openembedded-devel/message/97600
> Mute This Topic: https://lists.openembedded.org/mt/92020681/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

