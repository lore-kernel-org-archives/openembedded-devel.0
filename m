Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366E4E75423
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 04:55:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.101724.1696308894199674587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 21:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Gq/NAgQp;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50435a9f800so523330e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 21:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696308892; x=1696913692; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Typ37ZMqoQGdNKR28PShDIIt0odv/YWsZeEl/vi9hZQ=;
        b=Gq/NAgQpqua22gI51/tWOvY+XC1YNZBaAQ6IovoEcBF61qABcu0FZXkcgeAnAlYwaE
         nAOftHc+6G0vVYbW0CFoOIzYiYOaPJsfHfkGAMhZKWOOc2taBYEqbFhCvRCMa6vSrf15
         /k9eJkTXt6OiyzFBoUGioCYWEbW6C5jhO7CxeSZqHCfHTaQ5mpnnjclqeaQNqjJ0Neo7
         040icC9OrQ9jV2VX3SzCHk4Lpk9n+ZzNDImZjbPSXVMwULRYTdASIIKbZh1qIJTjPPLs
         s5LNKkFgUjfdke1fJ+S5GD5Zkj/ZG0kJXSHeIIVNssfp0qMPK66V4fKS2BOO4xob38wb
         Lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308892; x=1696913692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Typ37ZMqoQGdNKR28PShDIIt0odv/YWsZeEl/vi9hZQ=;
        b=ciJvhQr7J1gSIjMhwSExaGPFqfGGiEEfFGdmSXQPGTC5BguuErMCopHYO6vAT0dYiP
         BKyyWl6/QJiOE8xNQ4K1YJC6IQqy5U66P7oNnyBunqsSPxGGGofHhUQo8aurgU4+XfBK
         Z486hNkup6MyfSu5nKoryUskEhz+uTMUf7pbkmHOLAZvJfq/90jrW3XTIGBa2hC4gOCT
         P4/dsmN90K2VQnaCZSDJaJY/438XDd7MEQSKtZL8TOrEjR/Ro7zicazxVdAfT6huN1m7
         PAoIY9BnpkuuSiU3AsdxmfCZV6TmGXD0/dRVQHT3G7EDCYzJRJgRQ9RXBVA1bmeQOFnA
         FljQ==
X-Gm-Message-State: AOJu0Yzbgmi+SmiNhfRuSK3gLEgKO+NtL5ip1AschpSvdjxHXZPkV5Py
	HDSlqfljtEaWL8UKt356nRJgtg==
X-Google-Smtp-Source: AGHT+IFBrfjEJlK+0BVtPNcRPEWwJ6My0vvCTwLT81XQKFeRPtJdV0nbb3eMPe1TtR6RuQ3onxQA+g==
X-Received: by 2002:a19:8c50:0:b0:502:f2a8:d380 with SMTP id i16-20020a198c50000000b00502f2a8d380mr9415237lfj.19.1696308892052;
        Mon, 02 Oct 2023 21:54:52 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id j1-20020a19f501000000b005056e9b734esm49606lfb.151.2023.10.02.21.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:54:51 -0700 (PDT)
Date: Tue, 3 Oct 2023 07:54:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Jeffrey Pautler <jeffrey.pautler@ni.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] bolt: disable CVE checking for this recipe
Message-ID: <ZRuemRmjlQ9p2Kzk@nuoska>
References: <20230929170731.749414-1-jeffrey.pautler@ni.com>
 <ZRqL7yT0ME00CakU@nuoska>
 <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 04:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105317

Hi,

On Mon, Oct 02, 2023 at 11:53:42AM -0400, Alex Stewart wrote:
> On 10/2/23 05:22, Mikko Rapeli via lists.openembedded.org wrote:
> > Hi,
> > 
> > On Fri, Sep 29, 2023 at 12:07:31PM -0500, Jeffrey Pautler wrote:
> > > This bolt product does not currently have an entry in the CVE database.
> > > However, the default cve-check logic that maps recipes to products in
> > > the CVE database is incorrectly matching this package to a different
> > > bolt product made by bolt-cms. As a result, CVE checking incorrectly
> > > reports CVEs for that product for this package.
> > > 
> > > Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
> > > ---
> > >   meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> > > index b6ad6337c..583cc6378 100644
> > > --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> > > +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> > > @@ -12,6 +12,8 @@ SRCREV = "5a8a5866a847561566499847d46a97c612b4e6dd"
> > >   S = "${WORKDIR}/git"
> > > +CVE_CHECK_SKIP_RECIPE = "${PN}"
> > I think this is wrong and dangerous for anyone who in the future tries to use
> > cve checker for this recipe. Instead, set the CVE product with vendor correctly
> > so that other products/vendors don't mix the results? Hopefully any new CVEs
> > in the future will set the same vendor and product.
> 
> Are you suggesting that he set the string to something like...
> `cpe:*:a:freedesktop:bolt:*`
> 
> on the hopes that, if the Free Desktop folks open a CPE in the future, that
> it will match?

Yes, if other Freedesktop projects have used these before.

Cheers,

-Mikko

