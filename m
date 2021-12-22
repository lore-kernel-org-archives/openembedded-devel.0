Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F23C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 10:39:32 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.17824.1640169571516556719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 02:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PtDWGpAX;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id w16so6780986edc.11
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 02:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0e5/MTp7zFlpVQH5elek4cLU8ckdQXkXgmVHTgNj2yE=;
        b=PtDWGpAXqiYspP1qhL4PXdBSNfxuFLLTMav31fd1PjnYBMYblLpQPYWjAgguvZWorA
         M+PH9Fov9JQfHz4j9A4rAkpU1hegQ8cNIM1+r7VhwGtRQm2p+I9NF9h7d71zkBLF28RN
         eYz0bwaDm+GoOS4GYr5XA4xJleTssYFckfRD79SzxNY6ZMSMeUlKuxej7hqsvx9uSMyC
         YEFRr0YAEadBwkCsI4jB2HiyOnvxz2Iz/GHgPGvZd6xT0gjT0A4u66amxI2K1pnxN1I8
         4GmZIerQWaHj8PM1iygJazAWv9sb39DuxBnbq7zMRnd1PTwr02QL+7RzUhPJ1FxCReIA
         jg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0e5/MTp7zFlpVQH5elek4cLU8ckdQXkXgmVHTgNj2yE=;
        b=MuIajmHUEjJwgxraOwKtH/HE/7uNc1G+uLb4Z6RB90C6Kb1Z0P7ryRfV5xB+dWCNFb
         MnaZrLueJZhQyr+NlvAfiLJG0KOG/Na1xoV65I9nLme/GNVORoKRJsZ6cIbEYyYm8Zfp
         BnDy4Foaz6KYmIsTbAxv4h21mOxIF6lUvi0V4Vm38OGd0t2c4tXH2HMSfBayMhUoEeCq
         8YOjJNHULBkSGpyp/5qV0alp7MR3hu+VjJTgciqxDSto06p7VQpejyDhEPqjehrZNhQe
         uWTK9DlVy8vuU4tWghhkDGbtwc/YXuKLWrFJRmO1xaGQ3QDgE2J2boKti5dmjVcVu/E3
         gZLg==
X-Gm-Message-State: AOAM531oPGiLtXvPtXPQR3BjezXkeqt2pzaAlxFeanBNpHaL000siLPG
	ksr7iJJF1nMThwMte6pIbXo=
X-Google-Smtp-Source: 
 ABdhPJxPWhwJQe2uK4kMA6PEQCpTn4PdKNh2hYePmmxkWGfm80IBpWtSvrhLweKK9fzQxzPuIadGVw==
X-Received: by 2002:a50:9510:: with SMTP id u16mr2285512eda.134.1640169569718;
        Wed, 22 Dec 2021 02:39:29 -0800 (PST)
Received: from clst-linux ([77.243.43.130])
        by smtp.gmail.com with ESMTPSA id
 a68sm716983edf.41.2021.12.22.02.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 02:39:29 -0800 (PST)
Message-ID: <e9544ca1366bb22836bc167c20a3249f1151e36e.camel@gmail.com>
Subject: Re: [meta-oe]
From: claus.stovgaard@gmail.com
To: Khem Raj <raj.khem@gmail.com>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>
Cc: nerdboy@gentoo.org
Date: Wed, 22 Dec 2021 11:39:28 +0100
In-Reply-To: <b0fc66bb-db59-11df-9eb9-a11718062af7@gmail.com>
References: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
	 <cfbfdc6b-6ddb-2e04-ff4a-7ded6dc5a2fc@gmail.com>
	 <e94238ed4ece4b751421484d23195f84cfbcc0a6.camel@gmail.com>
	 <b0fc66bb-db59-11df-9eb9-a11718062af7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 10:39:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94483

On Tue, 2021-12-21 at 18:44 -0800, Khem Raj wrote:
> 
> On 12/21/21 2:04 PM, Claus Stovgaard wrote:
> > Hi Khem.
> > 
> > Thanks for your reply
> > 
> > On Mon, 2021-12-20 at 20:15 -0800, Khem Raj wrote:
> > > 
> > > On 12/20/21 1:37 PM, Claus Stovgaard wrote:
> > > > Looking forward to feedback on this.
> > > > 
> > > > Do you prefer to include patch text in the request-pull?
> > > 
> > > this looks good. Also check at layers.openembedded.org to see if
> > > some
> > > other layer is maintaining them already. If not then send it as
> > > patches
> > 
> > usbip-tools and gutenprint is not provided by any other layers as
> > far
> > as I can see.
> > 
> > pycups is also available in meta-printing.
> > https://github.com/rossburton/meta-printing
> > 
> > Though it seems to be discontinued, and only support zeus and
> > dunfell
> > so would significant work to get updated. Though it might be
> > relevant.
> > Have added Steve Arnold to the list (maintainer for meta-printing). 
> > so
> > he can comment about the status of meta-printing.
> 
> To be honest, meta-printing seems better suited for these recipes 
> provided layer is maintained still. Dunfell is LTS release and well 
> maintained so I would not consider is dead by any means. I would like
> to 
> hear from Steve and see what his plans are for this layer.
> 

I agree for gutenprint and pycups.

Though for usbip-tools, being a generic userspace tool part of the
linux kernel like perf I think it should be part of meta-openembedded
or poky.
I used it for more than 10 years ago to access USB jtag and other USB
things, so was a bit puzzeled that it was not already in poky / meta-
openembedded.

Back to meta-printing - if Steve is up for review the changes I can
help with getting meta-printing up to speed. Both for dunfell, and
prepare for kirkstone.

Also I don't know if Ross Burton should be involved - as the layer is
hosted on his github profile, or if Steve is handling the meta-
printing.

Regards
Claus


