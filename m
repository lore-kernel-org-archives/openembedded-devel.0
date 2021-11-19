Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52497C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:20:28 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.251.1637356827853521569
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=acfvwfkI;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m25so10707522qtq.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rAlv7zdx0TqLyEDTjaAQIzBPW+uFFOuWahtq7EzEwvM=;
        b=acfvwfkIOuSd+uukyVDcnMEBtuJ8HkVEsQplaRrsfDWaTtqCeX18s6lDdY0hP7HsXQ
         r9vvxtLgpa3MUeJlXr//XXHNkkWoB88j9Ht2ZjYSsNYTkX8LR7srZOu30GBmHJS2stO+
         nKD9evJ4BN4L7wnNJrxtzCxORmLH0VbXpRBzVyQtKl4jXW+ARUvs9rJFndMZlPa+NTVT
         1o+X9DdYFF3WNAp+U6icYp3n4CXU+dxeTkhiFwhrrW0MVvrWvot6vb3UM/73ywpmIwxS
         alNxK3rZeoAhSKKm8NX/XrYkemyodEuCKcTOTpyYzFgQqmqHSPWeDz9urWYxnSojuhvu
         z/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rAlv7zdx0TqLyEDTjaAQIzBPW+uFFOuWahtq7EzEwvM=;
        b=2T9xGrlHPZpCjgMA6dnuTi7O40dGGpB4xn5fajP1ngQV3KoSn6gG41dP0MIUKI2/v8
         u/IrSx6T1TW8oTGAb8CTwVWevXMoMyCv/gnhPCUPzCNXdCGm34H9I9Bbsbtt2beIJEDA
         QTQZfBCqVgknkz4K4Vy04XLtkxqjy6En/Xhlgeg7vYUYqMxThwfyWcxFLav9zlkbWgHE
         a1Ybv569Ls6CbC2RL1TkrBgG3E/bVIOxkiLny1CEsiTz+vBiAU3F0YxXkqaw62+j4mQB
         plKBRdxSoSMkBPYxp0z95IPysWgHqOrqfAhB7bZXcu79Bi0dAd6K2em9SCdnUFYWFHhS
         BVYw==
X-Gm-Message-State: AOAM532uhDk8PgugL/go9o86A7eZrAVN0UVXsRUPXwdKGCnRIqfZRjZE
	yay7zV/pMeQkCR5YPEjf2GVc8sqyFZEDb5p0Xag=
X-Google-Smtp-Source: 
 ABdhPJwUWwPPN95D8a1eRd3oeRt+xs7X8LP9O5NSwlV200zCEagHxhyulWoQ+3C2VO2s1xNNNezcsvqEzeHTuZFyfyM=
X-Received: by 2002:ac8:45d2:: with SMTP id e18mr9792293qto.112.1637356826960;
 Fri, 19 Nov 2021 13:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20211119210515.131769-1-marex@denx.de>
 <CAMKF1squfEBbt6G-UzaW-k2dUDMiUJ-U0d1E+ZdtTMPV=3waeQ@mail.gmail.com>
 <286cbec8-212c-0346-c754-a7313fcd1c82@denx.de>
In-Reply-To: <286cbec8-212c-0346-c754-a7313fcd1c82@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Nov 2021 13:20:01 -0800
Message-ID: 
 <CAMKF1srRxBDSmV+Mrm_ucdk=jwVrANybPbrVZ7E3K8+_nnid4w@mail.gmail.com>
Subject: Re: [oe] [meta-games][PATCH] neverball: Add neverball
To: Marek Vasut <marex@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Marko Lindqvist <cazfi74@gmail.com>, Heiko Schocher <hs@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 21:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94070

On Fri, Nov 19, 2021 at 1:14 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/19/21 10:08 PM, Khem Raj wrote:
>
> [...]
>
> >> +do_install() {
> >> +       install -d -m 755 ${D}${bindir}
> >> +       install -m 755 ${B}/neverball ${D}/${bindir}/
> >> +       install -m 755 ${B}/neverputt ${D}/${bindir}/
> >> +
> >> +       install -d -m 755 ${D}${datadir}/neverball
> >> +       cp -r ${B}/locale ${D}${datadir}/neverball/
> >
> > perhap use
> >
> > cp -R --no-dereference --preserve=mode,links
> >
> > here
>
> Will do in V2.
>
> Is that some new recommended best practice ?

We need to have same username, sometimes username differs especially
when building in docker containers.

