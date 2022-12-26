Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF0C4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 19:57:02 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.142588.1672084619215520042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 11:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KdueV5DK;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id r11so10882062oie.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 11:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCC5wtHRuyX3EIr5VOaob0D4YmdHN9qcUH8l0g66IG8=;
        b=KdueV5DK1t7JLk9oCIzyNpcHW6uMw4x/nqIBU/gyWTbEE6AY9gV6CruR996mxTuQae
         XGrT39Sy3+G/ougMAtqRC9M/MdN+DoNThmOrRAVBaeVJCcsuI5l1OsqG2wFxGAyDpoOY
         Nmrh7G2kWi3CnY0P1648WKu2iUsSwiL+ksCijZMzERgoI7WI6rSDvwMKHJs7P+2wBXEi
         ghtFN+FcfxCtwqbiITf0/RfNunvqqXXIdVw45EwNZ4Lz8PnUae0D1qtjaXmdXYX5QhYO
         yqGMG6NkV8UH0ju5yyKHMF5Fuzu58SHzGckaHI5SFxjjc1qK/pYMlhik38yEnC9oV9YD
         5QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCC5wtHRuyX3EIr5VOaob0D4YmdHN9qcUH8l0g66IG8=;
        b=gIwhLDA6D9Ma9BvLDXhwwntzfm6kMs1FLb3M8czO7/oZZml2nEpondxYPLZ96lbsji
         hAIL6+eLlV44v/BFlk+Q9Jp+tBTxZ5HD8Jx675g9RW8G7UmW+Hxwb21r2rsB1fv+PAIf
         NIwZPQ/0rjyW++es06+No9G2e1Ox8n+NbTNAA6pc71WFs9Ct3GsL2y2bWWfgJzblACXJ
         fO/laMiR5NnbRM1RyVh5cUkekbYsVa/2+JI9gcpl8f/aRuWz8TtRn14ADltXSOFL8Jvb
         AzBuCLlioagihAQyfIOxWMqGN0Biv1TjURooPjE7Ed1ZM5NlkYERic0QQ5g/ySx5w+0j
         PxpA==
X-Gm-Message-State: AFqh2kqzJ20m191bo7ael3JIDiIo2R9Z1PBI4rSsBJFiO/9nuhL65WJY
	QEWZE6NcMmal27n+ehjWfx4=
X-Google-Smtp-Source: AMrXdXtXbBPs/fHiG+z15IcAqCsAu+DNq3KXF1NMAlqDChHXFlCCbM8MkmUhk2tv9Z/nEEkbM5LMzQ==
X-Received: by 2002:a05:6808:17a6:b0:361:1112:2e3a with SMTP id bg38-20020a05680817a600b0036111122e3amr12320313oib.17.1672084618428;
        Mon, 26 Dec 2022 11:56:58 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:9c43:eae7:4345:816a? ([2600:1700:9190:ba10:9c43:eae7:4345:816a])
        by smtp.gmail.com with ESMTPSA id m8-20020a05680806c800b00360bf540072sm5142576oih.0.2022.12.26.11.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 11:56:58 -0800 (PST)
Message-ID: <762fe9c5-ef41-8c46-02bd-ddb1021fad84@gmail.com>
Date: Mon, 26 Dec 2022 14:56:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [kirkstone][meta-xfce][PATCH] xfce4-settings: 4.16.2 ->
 4.16.5
Content-Language: en-US
To: Kai Kang <kai.kang@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20221224164509.11131-1-kai.kang@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20221224164509.11131-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 19:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100245



On 12/24/22 11:45 AM, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Update xfce4-settings to latest 4.16.x. It fixes CVE-2022-45062 in
> xfce4-settings 4.16.4.

A patch providing the same update was sent earlier.

I prefer you commit message so I will squish to the two to provide more 
information.

thanks
>
> CVE: CVE-2022-45062
>
> 4.16.5 (2022-11-12)
> ======
> - mime-settings: Properly quote command parameters
> - Revert "Escape characters which do not belong into an URI/URL (Issue
>
> 4.16.4 (2022-11-07)
> ======
> - Escape characters which do not belong into an URI/URL (Issue #390)
> - Prefer full command when basic command is env (Fixes #358)
> - Translation Updates:
>    Japanese, Portuguese, Russian
>
> 4.16.3
> ======
> - xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
> - build: Fix intltool lock file problem during make distcheck
> - Translation Updates:
>    Armenian (Armenia), Belarusian, Catalan, English (Canada), English
>    (United Kingdom), Estonian, Galician, Greek, Indonesian, Kazakh,
>    Korean, Lithuanian, Malay, Occitan (post 1500), Polish, Romanian,
>    Swedish
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb => xfce4-settings_4.16.5.bb} (93%)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> similarity index 93%
> rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> index aa4265f7b..4a4e9f188 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> @@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
>   SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
> -SRC_URI[sha256sum] = "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
> +SRC_URI[sha256sum] = "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
>   
>   EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100207): https://lists.openembedded.org/g/openembedded-devel/message/100207
> Mute This Topic: https://lists.openembedded.org/mt/95864252/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


