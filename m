Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3B7C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 19:22:39 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web08.1285.1635276159388653584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jg7N8mvy;
 spf=pass (domain: gmail.com, ip: 209.85.166.177,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id l7so379531iln.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HpJxHQwkxwDtfFirvIUu5Q32rxW11pvxPlHoF2ns3I=;
        b=Jg7N8mvyoQJ2tsdDvoHTI/ViXMDywo8TRloInJfl7wtDvDQj35nnDgNFvcDSO2LjJB
         d/pvnyoDuEyghjUMkBOWFLv1DkGKz0Zfq7QE0ZVym4yWkVYPKdFuCjFn2i7YMa8oujQi
         t+QbJ3eo0yJx8vGpcsF36b7U/dRaNOYDZkyJPwb748lLsTrQebaOrsIQl7a1/3MHDuBC
         bI+VG3gNry8qVh3vwejUIOvOR0uxz4fT2A3loJZvRIkbfxTdJ+VRRwaWeEJITB2W7rFO
         U80IRe/LLkZI/X4Q5zaVRjNj0R77LSBQrEIGZdMJjAB8uvHVtEGdrtlw2YuoTC63jIAU
         dzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HpJxHQwkxwDtfFirvIUu5Q32rxW11pvxPlHoF2ns3I=;
        b=xcFqws+K6jeon7KxSQGAUBsgC8OfcFvTWAXFSeQDI35/4u6SJ4omERqpFpFvMx8XND
         lLTQg4PCmEKNxlkJm8ytCHClOsN6ANj9Ckb8/Nij5gqI7MSxJGFyBB7gyOiDlqhCh05F
         8nhIElyJhLUnyJFuOYAw8nWyovxVnQExGB/Y28KMJuZxzGmccH65ctazD/SOvrhk4DfQ
         eSFwMo/t7PmSY+vz1XyAYLMZSzVzgjw+b6pkDTdzA6/2E+iNzHhGMqYedG6EFRNz9t9C
         ThcyMIoAnIrzaWcF4e1DIJ2x7wKK4bv0C6CE33n5nDXKwhbgKj72QcgKhKL1/iIjVPM9
         XMLw==
X-Gm-Message-State: AOAM530mLpGR8/0eHp4qIp8ZbheY+MnYw0JyiqQAIm4y5dJcv/GHpL82
	a4iLVoR85USRYV2EdeLyZDiP6YMxdb+60/KMENk=
X-Google-Smtp-Source: 
 ABdhPJxc8jf9bpVUlIHHOMRSq+xoxxzda1/+mI3W9Fk+FwJvgBOc4zBRD8+DhLEiVO0ejyR5IDOa1Fs6PV/Qh5nRSr8=
X-Received: by 2002:a92:d752:: with SMTP id e18mr15488542ilq.31.1635276158534;
 Tue, 26 Oct 2021 12:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
 <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
 <CAO5Uq5Tv+yfED2u7ygvCX1tBcKpnAgpVaiAPGg10uYnXBfEdsw@mail.gmail.com>
 <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
In-Reply-To: <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 26 Oct 2021 20:22:27 +0100
Message-ID: 
 <CAO5Uq5RUCUkBEEf6faBhBc_LGnyic=oqr_U+c_mJSXubOtALwA@mail.gmail.com>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 19:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93612

On Mon, Oct 25, 2021 at 4:11 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Mon, 25 Oct 2021, Alex Kiernan wrote:
>
> > On Mon, Oct 25, 2021 at 11:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > > On Sun, 24 Oct 2021, Khem Raj wrote:
> > >
> > > > On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > >
> > > > >
> > > > >   colleague recently asked me how to get access to one or more header
> > > > > files associated with "ntp", so he could:
> > > > >
> > > > >   #include <ntp.h>
> > > > >
> > > > > from some other code. casually, i suggested the standard way was to
> > > > > add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> > > > > in my own aarch64 project, then took a look under packages-split to
> > > > > see what got packaged in ntp-dev, and was puzzled to see it was
> > > > > absolutely empty.
> > > > >
> > > > >   is this deliberate? are other recipes not entitled to ntp's header
> > > > > files? am i overlooking something?
> > > >
> > > > While the header seems to be meant for public consumption, the build
> > > > explicitly does not export it, so perhaps thats not expected to be
> > > > used this way anymore.
> > >
> > >   just to tie this back to a question i once asked on (i believe) the
> > > YP mailing list, this wind river build is using ntpsec instead of
> > > regular ntp, but it would appear this would still have the same
> > > problem -- while the ntpsec source contains an "include" directory
> > > with lots of ntp-related header files, if one comes up with an ntpsec
> > > recipe, nothing would be solved if it also does not install those
> > > headers into ntpsec-dev.
> > >
> > >   so, simple question: does anyone have a bitbake recipe for current
> > > ntpsec?
> >
> > I do, it's unfinished as I realised part way through that the python
> > dependency meant it wasn't going to fit for my use case, but the
> > basics of the build are there.
>
>   so is there a link for this?
>

Have a look at this:

https://github.com/akiernan/meta-openembedded/commit/b1464c4b8dcab4a9dfaebbb7116b1c8462a198c4

Seems like it works for me. Will send a patch if it looks good.

-- 
Alex Kiernan

