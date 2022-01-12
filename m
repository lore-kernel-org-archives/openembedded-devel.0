Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BECC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:42:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.19081.1641962547101447719
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AsadcSzR;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id l8so2331062plt.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aFZoD5Vzm3adrKrz8pd/Jj0UokNUB/0RmgyZe7g8HSQ=;
        b=AsadcSzRm7cDi+oj2VJE+nrQPVNJB2Q9V7BSBkw1wHLbV72rjgCNaD8qJdcPraQe7A
         CsRC8JQCuutWkq9NWmZUjPKoMCZXu2mis0mvnVNIkUA87p6UzhgJa8NWxyZL8mYUy633
         PwJftxCHFz1QBfZjn2NDPmkwWTvJD1P77q6eors0jrQ2JosHrXpCY106NpWGVFYm/+73
         +gvp9uzvTKbMjqjeuX7mlVq950ycoMXPNm6d3O/IoFjEJuaVTX2hWutkD/O+iOavtt6x
         KLu6Ytn9USsRtOYvMWxbRR+qQDBu7S4w8ABvBFCa1d5xLi0rbAvYa73z+iYqQ8fXlV4i
         CxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aFZoD5Vzm3adrKrz8pd/Jj0UokNUB/0RmgyZe7g8HSQ=;
        b=QpXP4ZEzO1VRgQPg2THBzhGdKhlcajU3/fhhogHGvbx0pSm1S6RcI28eyz93do0Pea
         OnsydnLKhnB55MWBg980Ij62sqAeBklNjN6QEqI+kcXW5p1XuIDvUBVWjJ45cND9oU9h
         ECt7Et74+4Y0qA+WXI9HxYbf5XXKlpWUqkFpaiaKzYzcEmfQXzgwitjl9llGqCg07Rbn
         +AwIKAJVILjGpNeZPrrY33gHgYUKE5ZB7f46xdiefQthKCSN933vMBuQlT/YxsWuf5d9
         g0xEfSvZhWkNjwJe76dgpbR593of2U0FHHXoaXv475An2lhrbi6vwY58rwUOwkrmvnBy
         s3Dw==
X-Gm-Message-State: AOAM530U5XEZEIcavjq2ZenLMaaEdXIK51qfIs0GvEDctbhiP7sJ4wA9
	lO+gp/fHvag3fqtI9u3l3iv+yUmcVc8=
X-Google-Smtp-Source: 
 ABdhPJwLgXc6i5ViiwMlFBlWPzjsjLZwZfZW9QznkOzu7dIF3DrMMxV9566pTrqu52Z0JmJe3BgmLQ==
X-Received: by 2002:a63:9709:: with SMTP id n9mr6845526pge.146.1641962546595;
        Tue, 11 Jan 2022 20:42:26 -0800 (PST)
Received: from [10.14.2.168] ([12.196.124.196])
        by smtp.gmail.com with ESMTPSA id
 em22sm3994007pjb.23.2022.01.11.20.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 20:42:26 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20220111224714.1289840-1-marex@denx.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
Date: Tue, 11 Jan 2022 20:42:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111224714.1289840-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:42:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94772



On 1/11/22 2:47 PM, Marek Vasut wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

And why should I allow this?

-armin
> ---
>  .../freerdp/{freerdp_git.bb => freerdp_2.2.0.bb}            | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/freerdp/{freerdp_git.bb => freerdp_2.2.0.bb} (94%)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> similarity index 94%
> rename from meta-oe/recipes-support/freerdp/freerdp_git.bb
> rename to meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> index 309acfbff..90ede1297 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.2.0.bb
> @@ -11,12 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  inherit pkgconfig cmake gitpkgv
>  
>  PE = "1"
> -PV = "2.0.0+gitr${SRCPV}"
>  PKGV = "${GITPKGVTAG}"
>  
> -# 2.0.0 release
> -SRCREV = "5ab2bed8749747b8e4b2ed431fd102bc726be684"
> -SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
> +SRCREV = "d2ba84a6885f57674098fe8e76c5f99d880e580d"
> +SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
>      file://winpr-makecert-Build-with-install-RPATH.patch \
>  "
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94761): https://lists.openembedded.org/g/openembedded-devel/message/94761
> Mute This Topic: https://lists.openembedded.org/mt/88361250/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


