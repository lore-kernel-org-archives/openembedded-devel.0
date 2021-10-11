Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3F5C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 20:37:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.4243.1633984641870572302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mJfPFOhy;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c29so15786319pfp.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=NbI/W0qkxE3IDlpx1KsJWXPRfO+B6IAp3kjwoh/+SOg=;
        b=mJfPFOhyjHXQDiq786O06vYQBumMmen96hPdPrSJt2Q3uRWShoUKdWrl1fo12cxtYG
         Da8fCua6iWR7yMsTvjTwmCNqdg2xEI4Y3fzLOJ4izWsSRGc4jqWUtSNBNAAP8wUMCWkn
         ocWrbmxulQNm+T05DZDmGiRfNHRrkHNogygZ0BqO1mAoZNLn2ZfqXq28c5cxoCJaWu1B
         l2TUB1XOlhh8vdvBSaSYEUAlH5tcaVvItcrmHzrQ4VMtQywvB6IX6kn+i6Ig4vyptlCr
         IEPAz1eyREKCkxYsqtV16NmCoVaTdoWeVjIo4ZsT+h9JCUfxiML8bLZU5ZC5ZEIOzity
         epFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=NbI/W0qkxE3IDlpx1KsJWXPRfO+B6IAp3kjwoh/+SOg=;
        b=1AqgLBq82jyuyQDMN4z7VttJIiPppUoUbkjjbwcCD0S2/Kb+158FcM9Wt/x5bzZqRM
         VA2SISdoZbyqno7QWwdKRX6E9cA7YtiGZBXoXuUIJya4e6MaFO9kfdWOknnBV0JXI3DE
         73KgROybyp0yR59dwPvEKZCDRrzrtuv11NI6GneRUOPCnKW3uvoL/tugZ48uWZiCw4e9
         Uq79ZfNOJPdjuR0GISUW64cJZv4gEP+7hzup+Xup1Snv18QwJb6LiYNLC5o1BhRDu6XP
         URN4Ey5gp2ZpV0Ai+ddW2AuJgbseyKfQ6svfCREGTt/meTZdgwf6hZsXmX6wEIwCBxPk
         Bzew==
X-Gm-Message-State: AOAM5318GZdDK+ISpF8r3HVrhTyaEsUaecGCYofXS6243HQ5qx3fWYQk
	oZRIWTzhmLEd6ZWxTJxa2flBwDPCf0BhBg==
X-Google-Smtp-Source: 
 ABdhPJyhKNWyV+nvHhbFeFFT6ipWGi6LDYqNfFajiRhlz8A1S+UnPww3k2MnKjFB0EofBnyyv4S7Ag==
X-Received: by 2002:a63:e041:: with SMTP id n1mr20262715pgj.211.1633984641382;
        Mon, 11 Oct 2021 13:37:21 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:d088:c18a:4e31:cc65?
 ([2601:646:9200:a0f0:d088:c18a:4e31:cc65])
        by smtp.gmail.com with ESMTPSA id z3sm8586102pfa.2.2021.10.11.13.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 13:37:21 -0700 (PDT)
Message-ID: <8adf137c-8ff8-3451-eb14-d60cfe8b35bb@gmail.com>
Date: Mon, 11 Oct 2021 13:37:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH 18/24] cfengine: blacklist due to openssl 3.x
 incompatibility
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-18-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211011184140.653609-18-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 20:37:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93242

Remove it from 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well

On 10/11/21 11:41 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
> index 38efe6306..60c5ab381 100644
> --- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
> +++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
> @@ -10,6 +10,8 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
>   
>   HOMEPAGE = "http://cfengine.com"
>   
> +PNBLACKLIST[cfengine] ?= "Needs porting to openssl 3.x"
> +
>   LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93232): https://lists.openembedded.org/g/openembedded-devel/message/93232
> Mute This Topic: https://lists.openembedded.org/mt/86244769/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

