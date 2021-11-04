Return-Path: <maxims@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4325FC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 21:45:53 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.1021.1636062351837804551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 14:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=mjeu+wOl;
 spf=pass (domain: google.com, ip: 209.85.222.52, mailfrom: maxims@google.com)
Received: by mail-ua1-f52.google.com with SMTP id e10so13646411uab.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=LfkzsXiZQjvUiZ6kLFJ4aafvRKBThAp8fpMHPft7Bfg=;
        b=mjeu+wOlhdrUABN07gjd0h752m1AcvYVgWECXmLyv/6asYAt++njUfp9GW8xLzEDRV
         GIjHKjisssXcu5tG+kRV0cxoD38d2+rzDJVXMSO5+eVQDTnu42OrFE+mPBF5DiQnyx9P
         XZWiCBjLwlbktvD6qdOoSU6vTdkwNtnbOcHD5ZswwFXnNAAtMHk2PN2i5CawtKY+bLHm
         0+92zLiaBjHmk8dI9sYOr0Fg7zFcaLdq/FnNQpDeJ3H0PDVaIBzxFsYWb7LTUHdgEvIx
         7UHEV+blRu8IE4bZb6lS3MGwpX3C+gqqr59mUA270I1R6+1RC5F5YG+OXCqh2O7+dHwm
         fFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LfkzsXiZQjvUiZ6kLFJ4aafvRKBThAp8fpMHPft7Bfg=;
        b=zFcF1n+/pzm9b6eUmlRiuMOhRQTeJUDZmh8oAp15M1lRwkQmTsqiKm3ZKjS/jveD30
         rlBkARgjsh7WdOFGaQNtXkfvjqM6UzRRl1iIxgcgq6V3nsBHzeCK+mIxkwBHZyNs5eoL
         uWghNKiVlEsnOYm4Qp4ksRoI3k2DsdFNvvFIRc2PfgUtz6+KVfHiRZhoXyEnedVxpDPs
         vmKUrQugAP0PeUpSzU76Wml+orvkbdeVUF83SHKBXtLClHG+CUJfznUYmnBbr8Q5QSZX
         Y7froheqM5OcUF/7s586iJM9a13hak2kXCPPCiBJWtcVEHdibIS7OhsbxpCjteR1Pwra
         cFTQ==
X-Gm-Message-State: AOAM532nUHAoghhbGpGt2XnI1ThZasW7H7eUtbEr0YhoOJm8Kk8okAim
	5rCqWwpiAShewETqb68cquigyM16tuaJRBv+SuZ3LSoIvWSExw==
X-Google-Smtp-Source: 
 ABdhPJyUhuoGm6eULjcThsrsX6Wh3Zs6x7amRuIAR5+Ix9A7n3JRrJa80/FPre+Fnwau/Biq9jOfJurcxH0ds6/Gljo=
X-Received: by 2002:a67:ee41:: with SMTP id g1mr39139299vsp.41.1636062350445;
 Thu, 04 Nov 2021 14:45:50 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 4 Nov 2021 14:45:39 -0700
Message-ID: 
 <CAFR_W8rkzPWCN9BnHXjZTcu58sBYfGOsOAT-rUyUKB1_k59X4w@mail.gmail.com>
Subject: Depending on other package's features.
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 21:45:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93825

Hi all,

The recipe that I'm working on for our system (let's call it A) has a
dependency on a certain feature being enabled in another package (B).
So, in B, we have:

PACKAGECONFIG[nice-feature] = "..."

and my recipe (or rather, the tool built by the recipe), needs that
feature to be enabled to work properly. What's worse, is that this is
a runtime dependency, so if somebody just forgets to enable that
feature, the image will build fine, but the tool won't work. I would
like this to be a build time failure.

My plan is to change recipe A, so that if the "nice-feature" is
enabled, the package will PROVIDE one more thing:

PROVIDES += "${PN}-nice-feature"

and in my recipe B, I'll declare this as a dependency:

RDEPENDS:${PN} += "package-a-nice-feature".

Now I'm thinking, wouldn't it be great if package A could specify
extra PROVIDES when the feature is configured? This would be similar
to the way it's done for package's R?DEPENDS:

PACKAGECONFIG ??= "f1 f2 f3 ..."
     PACKAGECONFIG[f1] = "\
                          --with-f1, \
                          --without-f1, \
                          build-deps-for-f1, \
                          runtime-deps-for-f1, \
                          runtime-recommends-for-f1, \
                          packageconfig-conflicts-for-f1 \
                          provides-for-f1 \
                          "

The last line would be a change that I propose. It looks like it would
be relatively easy to implement this in base.bbclass

What do you think? Will this be useful? Did I miss an existing way to do this?

Thanks,

-- 
-MS

