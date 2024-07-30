Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6A4C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 00:07:36 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.6900.1722298048834893192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 17:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mBRITik+;
 spf=pass (domain: konsulko.com, ip: 209.85.222.180, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1dcba8142so269605285a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722298048; x=1722902848; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=py1ojMGaxhkG2pykqtzjUdBunOGgkIo6xzjYpO17lo8=;
        b=mBRITik+f4rWW/ISqr3qxQtETR9u9p8BstpQE2UM1s5NXhUHuqB9UyAG5PLcdclOqw
         SKMzVINrtbUb7p2Hw70weeYuO5S7T3vys4ValWDXqbA5HvO+GkZud7Vlb8uveeVqBSPx
         r9cvnEA/7DUPaPvhbuIErWhITE9065lqKq418=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722298048; x=1722902848;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=py1ojMGaxhkG2pykqtzjUdBunOGgkIo6xzjYpO17lo8=;
        b=JQPcIH8qLTWHkOAFYZXZd6nK0WFRFg7UQXWeoOyOHbIF2NsjGAtGong4sxbUIdURev
         VzrEOm/VSVJ/5xcTqcV4DkGCj6csvpIUpHUFyuQqYD+4IXE2ZYdidkGMuDjvF0ZlY/52
         A8GWb3PXoUP8z9eNDTh/6lwArAy+/qsDac8klFLUvg6xUbTMtIry/e8OE80/mbwDbNPs
         ZS6iqPyuSGbGBv81Jo1GdC2Y32p0xE6OKiYu1T+kcVtThpUCnKwGkASYmTMpYbiIP0LH
         jt/k9ptIH72QUvHt5uDCdLbZJhCe9WTj4u7dElZdn0Fuqfu/TcOQhX34qHZRKmBE83GP
         9ABg==
X-Forwarded-Encrypted: i=1; AJvYcCXBn4UNmxGz3jR8Dy5Ecv2f3RAdIktfY0J4TlaaFXfLtevJCP2jnS81idKXUfCkSLX+zPRnfM1YgsDSxJX6WRrUTygadWdjBww477OXAKacsKJEf4fyZVRjqQ==
X-Gm-Message-State: AOJu0YzwK3zC7DtxLVxTqTHAVeVMHiSJOfNf3a8iy6trDm+NrbbzL9Cc
	F0RRU/hmH32qBdTLqGPBDevjZwZ6mJuKuuztIPiIedL1bQL1MevzmLgWT48b5qU=
X-Google-Smtp-Source: AGHT+IHhJnNwyUlWBGx4CmzH7Tnfil82kPotWD2eERbmo+u2UZHPdkZpeTl+3cFvNB2priC1f5ruvg==
X-Received: by 2002:a05:620a:2805:b0:7a1:d6b9:ff2e with SMTP id af79cd13be357-7a200f4f4a4mr66628485a.35.1722298047842;
        Mon, 29 Jul 2024 17:07:27 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1e57ce439sm397577785a.97.2024.07.29.17.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 17:07:27 -0700 (PDT)
Date: Mon, 29 Jul 2024 20:07:14 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: ranjitsinh.rathod@kpit.com
cc: Quentin Schulz <quentin.schulz@cherry.de>, 
    "Openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
    "alex@linutronix.de" <alex@linutronix.de>
Subject: Re: [OE-core] How to contribute in meta-lts-mixins layer?
In-Reply-To: <f93e5b15-e469-459b-bd17-3e5fcb8d8102@cherry.de>
Message-ID: <21b1be79-bc97-6a5a-f1c0-d681caa47145@konsulko.com>
References: <MA0PR01MB91744DCAA3A1F5313FF521138FB72@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM> <f93e5b15-e469-459b-bd17-3e5fcb8d8102@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 00:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111475

On Mon, 29 Jul 2024, Quentin Schulz wrote:

> Hi Ranjitsinh,
>
> On 7/29/24 3:52 PM, Ranjitsinh Rathod via lists.openembedded.org wrote:
> > You don't often get email from
> > ranjitsinh.rathod=kpit.com@lists.openembedded.org. Learn why this is
> > important<https://aka.ms/LearnAboutSenderIdentification>
> > Hello all,
> >
> > I want to contribute for the layer meta-lts-mixins for kirkstone/rust
> > branch. Does anyone suggest which email and labels to use to do contribution
> > for this layer? I did not find any specific contribute guide or details in
> > the repository. Any help is appreciated.
> >
>
> I think yocto-patches is the appropriate ML?
>
> https://lists.yoctoproject.org/g/yocto-patches/message/8 is a patch for
> meta-lts-mixins scarthgap/u-boot branch I think.
>
> Adding the maintainer in Cc, they would/should know :)

yocto-patches would be fine.  I think it had not been created when I made
the layer, so I assumed oe-devel.

> Here's to hoping on of your first patch is adding this information to the
> different branches' README :)

By the way, Ranjitsinh, if you're looking to backport the newer Rust
upgrades from oe-core master, I was going to work on that this week if
you're willing to wait a bit longer.

Scott


