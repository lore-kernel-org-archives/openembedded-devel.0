Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B81C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 09:11:59 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.5833.1667898714646614223
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Nov 2022 01:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qYmx7+H0;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id c25so20108724ljr.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 01:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Brap4B5bmRZyRnPyszoF0jLyVdf9KPtTZCkLVDQrAgo=;
        b=qYmx7+H0N/LBzmR9hQQDhDYdiXnc4LQkpfrx0oktydVRqkicn1iBDKfuNyU+Rcpns1
         DdgXj+sJkRDAfQndJkvr8uYk2pLdOLj9FVxPGMxEEmlM2XMQovcAPlknYCKUe2qQrRYG
         cB6BXgz5j9Hr0h/D6+nkrU/O4dx3pfrbt/wfJUxrIlgyHupp8Goopt9REQwMr9na9erW
         Eqag7+SVRwLKgxzLMXzzgoglb/O7yx53tf1/UZigatKJysmATTe5DUizXJqmfcx9XpgN
         IZc2j6hRDoa8MIlPw07sXr1yidGW8Nad3dWZlGyeQfFso//2Hoj8fBv3ktoI1ABU5vLF
         tU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brap4B5bmRZyRnPyszoF0jLyVdf9KPtTZCkLVDQrAgo=;
        b=VPVpIVHofkni8ixiDOPPX+WfXWz73qwrxG1ka+01szksYzqjVtVlxargnrV2Gq54jd
         Oosh5+G/+zkyKgp73P30JBMER6VsMEaS6ELoDbm5zKWdWaUjHrtKnBBd61z9mj9IZGKc
         BqxJD0KJnx4zBPbakKwvJToCBpUg4OLIj1USudKemSxUD6d7DLJgrl0Zcj3tLZEOJXeM
         AgtIDAUHDaNemGnyvYO+ni30D/zAHR14MjBa2VfDVfDiefqMf+fBSjZsJNmLgd6nNaqn
         aCNQPqpX4lXjVHlc1x+p0KhimLXQKTsfrxB+QbG4FCF1TD6TN+8YQpzw8kDvCoWi4zsX
         ZrvQ==
X-Gm-Message-State: ACrzQf3ugUYKr3Qz7gdfAWdFdcpDrGKCkzj6jML6XBpiJVgPxyOOKGOr
	0DnuynRcpTIX05FmRukczXHmbw==
X-Google-Smtp-Source: AMsMyM6fw1Tdy/ZYd0cfIixY56HQJti3wvf+zIav5c/E8lwJlQzX1MsrEoIjcug3J7wfBcZclTGTmg==
X-Received: by 2002:a05:651c:160b:b0:277:1888:cfa3 with SMTP id f11-20020a05651c160b00b002771888cfa3mr6547556ljq.476.1667898712538;
        Tue, 08 Nov 2022 01:11:52 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id k8-20020ac24f08000000b004b18698c558sm1696994lfr.46.2022.11.08.01.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 01:11:52 -0800 (PST)
Date: Tue, 8 Nov 2022 11:11:49 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Wentao Zhang <wentao.zhang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] psplash: delay the
 psplash service
Message-ID: <Y2odVeJ78vY/acfN@nuoska>
References: <20221108083641.2886250-1-wentao.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108083641.2886250-1-wentao.zhang@windriver.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 09:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99489

Hi,

On Tue, Nov 08, 2022 at 04:36:41PM +0800, Wentao Zhang wrote:
> psplash starts too early to open /dev/fb0 correctly on
> some types of machines.
> Starting this service until /dev/fb0 is found.
> 
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  meta/recipes-core/psplash/files/psplash-start.service | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
> index 36c2bb38e0..555ad5e387 100644
> --- a/meta/recipes-core/psplash/files/psplash-start.service
> +++ b/meta/recipes-core/psplash/files/psplash-start.service
> @@ -7,6 +7,8 @@ RequiresMountsFor=/run
>  Type=notify
>  ExecStart=/usr/bin/psplash
>  RemainAfterExit=yes
> +ExecStartPre=bash -c "while [ ! -e /dev/fb0 ]; do sleep 0.01; done"
> +TimeoutStartSec=100

This isn't correct with systemd. If a .service depends on a device node,
just express the dependency:

Requires=dev-fb0.device
After=dev-fb0.device

Cheers,

-Mikko

>  [Install]
>  WantedBy=sysinit.target
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99488): https://lists.openembedded.org/g/openembedded-devel/message/99488
> Mute This Topic: https://lists.openembedded.org/mt/94886380/7159507
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


