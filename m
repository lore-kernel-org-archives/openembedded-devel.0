Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F12E784AF
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 09:23:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.77699.1696238579872804100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 02:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=il1/xLHS;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c008042211so259309811fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238578; x=1696843378; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewNTm9aygPnAE+psp7kmQNAVfPm08ShP/a89U5ULqbc=;
        b=il1/xLHSdbcaIGs/+fLz5l7AUaArrBa1gZizF3L4CxBiZxERx4HF+O6g84Lo5MSY/l
         B352t7B5eyn8gn68xNTnKOQy4FMhV3wKVlK2bZKslc731SzCUvDXLYUMYSPYHP9E0s23
         lhyF92PMW53J+1dH2aq1FBw/ipTwHbL81ifbqtJi5PFczwKayId/XuIQhiFXeMdEgpA+
         zAuFB10m135AY+yeFZ+MoK0k2U+DO20RoW76vlKHMcVXvIArs9zXO9mypFCRi8xzLQsU
         QsorlbJmAbuFWRTJMhovQLV32MvqzpIdVPnWBAzp1BLJ27fbJKZUeHwBEOYWH0s8/rlD
         5SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238578; x=1696843378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewNTm9aygPnAE+psp7kmQNAVfPm08ShP/a89U5ULqbc=;
        b=XRAaMzq/4Skf9g3+uWO8iBk6Vmj9rZX5Et84FwYAHZpQ3RFEnWSW87hUWL5eDJ7B2M
         GjQoTrLqZ2lo7xEa/Z3Wlt4MrOAz1h7UwsaNyXC8x+YKKTqbF8ySlZJQZJN9ybx+h8Mc
         7q4jtGJ9PrwNTKfKssyAkBBE8tnnQhS/VuSNKGSbaSHgmZJyDcK1hB6xcrP7sS/5sR7s
         yOeyY+w/YwYvrV33fuDOANvEtK6fHe5bp3E9WKtsh+d7mVFvzhui7E3f3JriAZ0M8KWV
         JpX4fAvkqOx/M/UZVZxz5VvWEvtEUfs49ZSoJi5UMGXLy72eIhJE4p8I7iN9DUGYg9BR
         TwZQ==
X-Gm-Message-State: AOJu0YxTrnALvCiLWk+fJ6WJ+ftS3ZHXNZ7Mq1naFasdvgqIPPkFLLGB
	Isvxji0LsErPY2rUsJnQH/1qlQ==
X-Google-Smtp-Source: AGHT+IF45WuN3LsmEO1FQSixoVyzkP04eu9Xd1bHnsR7Eqosku6tHdJ3BQIeCaC612rpj35ZR1gQvA==
X-Received: by 2002:a2e:b6cd:0:b0:2bf:7905:12c3 with SMTP id m13-20020a2eb6cd000000b002bf790512c3mr9024676ljo.40.1696238577841;
        Mon, 02 Oct 2023 02:22:57 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id b30-20020a05651c0b1e00b002c288388153sm1402549ljr.136.2023.10.02.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 02:22:57 -0700 (PDT)
Date: Mon, 2 Oct 2023 12:22:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jeffrey Pautler <jeffrey.pautler@ni.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] bolt: disable CVE checking for this recipe
Message-ID: <ZRqL7yT0ME00CakU@nuoska>
References: <20230929170731.749414-1-jeffrey.pautler@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929170731.749414-1-jeffrey.pautler@ni.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 09:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105303

Hi,

On Fri, Sep 29, 2023 at 12:07:31PM -0500, Jeffrey Pautler wrote:
> This bolt product does not currently have an entry in the CVE database.
> However, the default cve-check logic that maps recipes to products in
> the CVE database is incorrectly matching this package to a different
> bolt product made by bolt-cms. As a result, CVE checking incorrectly
> reports CVEs for that product for this package.
> 
> Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
> ---
>  meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> index b6ad6337c..583cc6378 100644
> --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> @@ -12,6 +12,8 @@ SRCREV = "5a8a5866a847561566499847d46a97c612b4e6dd"
>  
>  S = "${WORKDIR}/git"
>  
> +CVE_CHECK_SKIP_RECIPE = "${PN}"

I think this is wrong and dangerous for anyone who in the future tries to use
cve checker for this recipe. Instead, set the CVE product with vendor correctly
so that other products/vendors don't mix the results? Hopefully any new CVEs
in the future will set the same vendor and product.

Cheers,

-Mikko

>  inherit cmake pkgconfig meson features_check
>  
>  FILES:${PN} += "${datadir}/dbus-1/* \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105252): https://lists.openembedded.org/g/openembedded-devel/message/105252
> Mute This Topic: https://lists.openembedded.org/mt/101662068/7159507
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


