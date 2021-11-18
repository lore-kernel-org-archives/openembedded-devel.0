Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64297C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 03:18:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.460.1637205489516425303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 19:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oKdSHicZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id b11so3974138pld.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 19:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=z2mKTdEI889Q9ihpAN3BKBFEuFz5RUt+KyMNN0lQ/jw=;
        b=oKdSHicZh6o2M8QsDc+wjVvc1lydiBYHCg65eHciE1cNNxpIMUjMwcN/AFp+Zbe4NG
         RCTKzrW7TrNdIlhpOYVU6SZm8kO8P1sd7vtvw/uGGTqdTDlqd42AHYZoPwHT6Cs89xKH
         UGicpvwXPz16XaWusYWMWxLURv+ddel9q1XVkY5WbC1T83rVymfD++x2e9AIa2CREtbt
         XWPD1OKWO7778bxKsloSNHzA5Bu0F/oQHwSOmCSpyoaZZZSDma2RV6pD8v9GzUT7KkXd
         at++rsAtaYiQJ/8srrlmrjS+rtjENJFUiS5dxR+icPx7sK0t3sv3W6rxIMEl3GvWwVEA
         o4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=z2mKTdEI889Q9ihpAN3BKBFEuFz5RUt+KyMNN0lQ/jw=;
        b=y/KdWLd5XQ7S1O0zYHTG0zCbcJTg4XplcGFE4I5O6iidIcIWkE6yZQqwQATzftBWQ0
         G72nt4FKMbQLcxalrt/p+W9M2Gb+T+j8z57l2pnnhnWLM+UQ5PyV7USmWNWD+kyisUz6
         BELsLUp3kV/w45rKt7n/AhsMnCsiYKbXrmcPD+1sbL4XovsCTeDna3lswhrw1AVnxz1F
         rKTZ6Fy1G/NU1feZTAWTeD2RxS/0QvPqlgDhD+GSJEuKTx3QuHOLSIKDpvrqmOT9W2am
         +DjMXuZSMF9+e1pA3PZ7PY6ysbEw2xvGVVBRBzKm9IbvtkJr5dXCCikiHrkpJiagZHS8
         FVHA==
X-Gm-Message-State: AOAM531Pt9Q2PtIe1/WqVs6MvWyLAF/pF6zIo/i/pt342ckih2D9R0Vu
	n+Ctud5KWeV7owAT/1XzP8Y=
X-Google-Smtp-Source: 
 ABdhPJwaxlR+5t613ktGC+5sHFUEM9hyjdpDUd8cHRoITHb40tAAt07/IcERknZkgTOyv60+F8/51Q==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr6462358pjb.34.1637205488925;
        Wed, 17 Nov 2021 19:18:08 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0::5ede? ([2601:646:9200:a0f0::5ede])
        by smtp.gmail.com with ESMTPSA id
 j17sm1074405pfj.55.2021.11.17.19.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 19:18:08 -0800 (PST)
Message-ID: <89012344-845f-9078-d90d-1f2a10359cfd@gmail.com>
Date: Wed, 17 Nov 2021 19:18:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [oe][meta-oe][PATCH] gdm: introspection is not valid meson option
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20211118024128.477249-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211118024128.477249-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 03:18:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94016



On 11/17/21 18:41, Joshua Watt wrote:
> meson 0.60+ errors out on unknown options and -Dintrospection
> is not a valid option
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta-gnome/recipes-gnome/gdm/gdm_41.0.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
> index a485c0c9c..ac57b5bf2 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_41.0.bb
> @@ -11,6 +11,7 @@ DEPENDS = " \
>   "
>   
>   REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit gobject-introspection-data"
> +GIR_MESON_OPTION = ""


we need to delete

UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"

around line 22 as well.

>   
>   GNOMEBASEBUILDCLASS = "meson"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94013): https://lists.openembedded.org/g/openembedded-devel/message/94013
> Mute This Topic: https://lists.openembedded.org/mt/87136092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

