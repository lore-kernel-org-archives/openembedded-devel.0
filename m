Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED130C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:30:56 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.14352.1635352255917823437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kaHzBoGa;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id b63so1441182edf.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EJi1IRdrP+B1F8hZ+zCP9jRBm6i+6mtHa0DH4An1WyY=;
        b=kaHzBoGa9wTY2BfmczM9tOG18RZk07sa1g0UHscedFFV0PaYKbj42PFusVoyx3w0Dk
         86MmTl4JknyGwbx7X2ZnoDcex9V25/lz3Gm+aPF5TqPyAFrxBwPzUKTBC7rUrCnfx7wW
         x90Q+8txO0fv/+3K9i/pH7tVTLR0KbFolOognr5Wwef/tPhi6GV+VEslkpjuesHIXnSd
         pyDtd2OtZeIJH8NLKyy/YsTLW/Awc/I16lNlNOQHM4ZngS9Q4LPbEgHQjXkGRQSl9LRq
         tGrBKT9kOIdNO9zf37vQ2hPehYIQRpNxU6yurgaTuigh8oBL8fH4KQUbjZIPdERFR4Cw
         chVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJi1IRdrP+B1F8hZ+zCP9jRBm6i+6mtHa0DH4An1WyY=;
        b=GqXw2aRMiwop76y2/lb6AjHZ8WbbozL+Fvk+651HFV5/GjqcE95SZsxwPJXLvF78p6
         nG6blUG5WekLHdt2jCe6tTn732i/U3tcWxgEH2M4kxA3vDuWVbj5r35mQFSpY+ZEP3XL
         y2oT54TSVU1E9oK9zJL/QNqawN4PxZ+eQ9cn98xo7PU8MAmPs+Bj5or27TeoSF0ENcaY
         cMMxuaebqEyewvZKzK9Gav+DQkLmbQjX8JaS83mRTkL8ifqAi3jgtjVBVIlg/9/+2qPq
         UHOr25pSYAqCrwL2mNSUBpJfxCJKQttAbemG7+O8J56eN9hXEfyF960ZtLNywrClR+p0
         yOOg==
X-Gm-Message-State: AOAM533ubEdR6tPfIx0tes03StkZTW7/DCahCDf+N+9oy3HnFtbyCYSL
	LrWzRSF0cdFFYKGTbdM17Vi+g+KZZwOEojcpYgM=
X-Google-Smtp-Source: 
 ABdhPJx/tmcRKIvbxpF4Obs9srrglpUkmO6HaFqqAAKssA1Fr/Hk6QmbRDmlrcUvIt4lGHJgS7DCCbQTdViOUWzFGbE=
X-Received: by 2002:aa7:ca07:: with SMTP id y7mr8106877eds.107.1635352250987;
 Wed, 27 Oct 2021 09:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
 <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
 <CAO5Uq5Tv+yfED2u7ygvCX1tBcKpnAgpVaiAPGg10uYnXBfEdsw@mail.gmail.com>
 <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
 <CAO5Uq5RUCUkBEEf6faBhBc_LGnyic=oqr_U+c_mJSXubOtALwA@mail.gmail.com>
 <34e4b19f-e186-76dd-ac4-68b940b4a4a1@crashcourse.ca>
In-Reply-To: <34e4b19f-e186-76dd-ac4-68b940b4a4a1@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 27 Oct 2021 17:30:38 +0100
Message-ID: 
 <CAO5Uq5ROkDKe5Y7VcUUoAUnsF4Wpuax7nARc2W5e9p_SUTCbaA@mail.gmail.com>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 16:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93633

On Wed, Oct 27, 2021 at 4:55 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Tue, 26 Oct 2021, Alex Kiernan wrote:
>
> > On Mon, Oct 25, 2021 at 4:11 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > > On Mon, 25 Oct 2021, Alex Kiernan wrote:
> > >
> > > > On Mon, Oct 25, 2021 at 11:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > >
> > > > > On Sun, 24 Oct 2021, Khem Raj wrote:
> > > > >
> > > > > > On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > > > >
> > > > > > >
> > > > > > >   colleague recently asked me how to get access to one or more header
> > > > > > > files associated with "ntp", so he could:
> > > > > > >
> > > > > > >   #include <ntp.h>
> > > > > > >
> > > > > > > from some other code. casually, i suggested the standard way was to
> > > > > > > add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> > > > > > > in my own aarch64 project, then took a look under packages-split to
> > > > > > > see what got packaged in ntp-dev, and was puzzled to see it was
> > > > > > > absolutely empty.
> > > > > > >
> > > > > > >   is this deliberate? are other recipes not entitled to ntp's header
> > > > > > > files? am i overlooking something?
> > > > > >
> > > > > > While the header seems to be meant for public consumption, the build
> > > > > > explicitly does not export it, so perhaps thats not expected to be
> > > > > > used this way anymore.
> > > > >
> > > > >   just to tie this back to a question i once asked on (i believe) the
> > > > > YP mailing list, this wind river build is using ntpsec instead of
> > > > > regular ntp, but it would appear this would still have the same
> > > > > problem -- while the ntpsec source contains an "include" directory
> > > > > with lots of ntp-related header files, if one comes up with an ntpsec
> > > > > recipe, nothing would be solved if it also does not install those
> > > > > headers into ntpsec-dev.
> > > > >
> > > > >   so, simple question: does anyone have a bitbake recipe for current
> > > > > ntpsec?
> > > >
> > > > I do, it's unfinished as I realised part way through that the python
> > > > dependency meant it wasn't going to fit for my use case, but the
> > > > basics of the build are there.
> > >
> > >   so is there a link for this?
> > >
> >
> > Have a look at this:
> >
> > https://github.com/akiernan/meta-openembedded/commit/b1464c4b8dcab4a9dfaebbb7116b1c8462a198c4
> >
> > Seems like it works for me. Will send a patch if it looks good.
>
>   well, it builds for my poky/aarch64/core-image-base build, so all
> that's let is to decide how to populate ntpsec-dev with those header
> files (simple), and why they're not part of nptsec-dev in the first
> place.
>

I'm just scanning through the code and I don't obviously see anything
which is a public interface (other than the python one)? There's
clearly bits you could pick out, but having that in a default package
feels wrong to me - there's no -dev package in Ubuntu that I can spot
either.

-- 
Alex Kiernan

