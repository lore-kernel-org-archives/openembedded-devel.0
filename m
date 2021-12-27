Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D69CC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 22:17:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.31788.1640643458245515906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhH+youa;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 205so14666475pfu.0;
        Mon, 27 Dec 2021 14:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=xvWK37ThRwhKgZP15MjGXCdobR+8/YnJQgHC2ccywOs=;
        b=FhH+youaOkketyeqQ1+efTYSwNDPOv2y0ICDtFhsY2KX0WXyL4GTuuONE+G2MOOORT
         f51jRmVpUfEtiNpz8KjUc2niNw9EIAg8MfX9pv+uP2uBzajNW4mXAo19TQJXfWB0HSO0
         xeImsKhxN71kMpSYNRXAiK0wsEOJzT4K1awI0yZhhhxqEGA1dlwnjsCTL5srV+OwZFPa
         fYgphtgFWYUe2cyG6gEA1o6BXVXhHwpwhqz0UEYb4Ae6HNeg8oRa93zlkVTLSL61i8jG
         MCG6xFiitMD3hl+gkVP6aKJkEKnzEizIDzZ8jA7vcat1YorJIVqWhlli8MC6Sspl+ijj
         GP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=xvWK37ThRwhKgZP15MjGXCdobR+8/YnJQgHC2ccywOs=;
        b=wdjpEaAzhZrFZqzUvbQoXt4pTDAGppQv/6+ELcAWTqCPG3x5hgLiqDT8JTb7/uqcpv
         aBRw+UhC0PpDnv5qG70/55JfMmULXSQHZ/0Ewo9EGzZHzBhSFe31s45NdwwxbDCn7EIp
         tY4rXFrVinxcEnoQ64JSPh3Te6K1ujl/UItxLQQ6t+Dtm9W1UURjtEib5B4o+dXIvrwV
         TORARn8eetxQV3Sjp81d3MV4/rkM+4Qrk6W79uDsIXpo9BFXtMqZhlQItBT3XhDa/qrE
         +Cgfmh6nwFsEi0JOzuPcLHXH1yMTY7wuBtdFXFoWXNDEo2jR11yU/F5XgU64DIRXjyab
         u9nw==
X-Gm-Message-State: AOAM533rBv4BrNGaWZNqY7GCpPOMGxIGqBnxmtQl+5OXi5byTxWogGpx
	qVP8Ia7WHBOAIGg3TnTHC88=
X-Google-Smtp-Source: 
 ABdhPJyho0nca2ifsJ+ePwshaNNAgzDEqXGbJ/cJIWZZGnsgbF4fbFZXw9DXVv8VIJ45clJR1ttpfA==
X-Received: by 2002:a05:6a00:8cc:b0:4a8:262:49e1 with SMTP id
 s12-20020a056a0008cc00b004a8026249e1mr19288534pfu.28.1640643457719;
        Mon, 27 Dec 2021 14:17:37 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:ad5a:f567:6a13:2bdd?
 ([2601:646:9200:a0f0:ad5a:f567:6a13:2bdd])
        by smtp.gmail.com with ESMTPSA id
 93sm18224856pjo.26.2021.12.27.14.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 14:17:37 -0800 (PST)
Message-ID: <64ee8951-4d4c-2262-9628-0bd19c8bef78@gmail.com>
Date: Mon, 27 Dec 2021 14:17:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [oe] [meta-networking][v2][PATCH 1/4] strongswan: provide
 PACKAGECONFIG for cureve25519
Content-Language: en-US
To: Armin Kuster <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: "Armin Kuster via lists.openembedded.org"
 <akuster808=gmail.com@lists.openembedded.org>
References: <20211227203811.481782-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211227203811.481782-1-akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 22:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94522

author is

Author: Armin Kuster via lists.openembedded.org 
<akuster808=gmail.com@lists.op
   enembedded.org>

Perhaps something is wrong with your email agent.

On 12/27/21 12:38 PM, Armin Kuster wrote:
> From: "Armin Kuster via lists.openembedded.org" <akuster808=gmail.com@lists.openembedded.org>
> 
> Not everyone wants this to be installed by default. Enable to remove
> cureve25519 is someone wants to.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> 
> ---
> v2]
> Fix typo
> ---
>   .../recipes-support/strongswan/strongswan_5.9.4.bb            | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> index 45500df01..124b5a799 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
> @@ -23,7 +23,7 @@ EXTRA_OECONF = " \
>   
>   EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>   
> -PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
> +PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl curve25519\
>           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
>   "
>   PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
> @@ -41,6 +41,7 @@ PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-sou
>   PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
>   PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
>   PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
> +PACKAGECONFIG[curve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
>   
>   # requires swanctl
>   PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
> @@ -130,7 +131,6 @@ RDEPENDS:${PN} += "\
>       ${PN}-plugin-x509 \
>       ${PN}-plugin-xauth-generic \
>       ${PN}-plugin-xcbc \
> -    ${PN}-plugin-curve25519 \
>       "
>   
>   RPROVIDES:${PN} += "${PN}-systemd"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94517): https://lists.openembedded.org/g/openembedded-devel/message/94517
> Mute This Topic: https://lists.openembedded.org/mt/87984771/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

