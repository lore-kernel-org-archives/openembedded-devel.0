Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D586EC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:20:55 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.33712.1635175254420954819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AjudtXjE;
 spf=pass (domain: gmail.com, ip: 209.85.166.49,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id n10so6519945iod.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVqImBl/qa0ibNMBDLUiOBvZed1zBkKgL46SP7n8Z18=;
        b=AjudtXjENPZaCeH16H3LMDcG4t13jeVhC4mgTrk/FusVp9uCMMjcwsA8i/qFmss4qw
         uBUbWGoTD+Sy3FMeLSHHuIW6Ww/kuSk2qEpMMNJnVKB9Oyos/r2FQylX6USY7Bq87sPB
         o97cqeMZH3dD61/IZhcx33fKqeYyrwYQQ9xN0/llVeahdrLMo5jW3V6BRCYf7FOQaLKs
         HgQrKy8geHft4i7xc90brhQIl0uQCTDBpC3VDLs2S28hC2dKK1FzEOPedqldhXudq6g4
         IxwJrlSUZCIDRrzC9yT5bwXRvXD5aLL/zm0bPg80ct474QU2mZp/1ycrkl3WcWFOHnTu
         JAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVqImBl/qa0ibNMBDLUiOBvZed1zBkKgL46SP7n8Z18=;
        b=vs0QZNb5ZaT2Erocb6YM2Rjw96fy8keUZReQR8Fe/XWW9ILwuegvf5tn8Ew9OtGaPX
         1jq35wQfs7aUk6Q+qskdX61YOI7qieFIxnJaQVbiHuzhcBUXfouhxaMx0P2i7bk6djFZ
         /308MFH4IHSliQhYNfHY0sWa6JWSKfcqx3936fc2V+p7S4nw4sS4NC2ILrs8nKZ7FgVm
         SCQRFQvPfILDbCkBEOufmW2Mx5kKOka4KXvaH5XrcgIIJUgNOLNpWTNIg01YbMRe+XYU
         cFMXo+SvQ4mcNkNAojVuX/UjwRPLpXCSA7I1mBT+K1+vfTLdFTIriZ7xSh0KlAeKg9qJ
         MgXg==
X-Gm-Message-State: AOAM533EtWE2cw6yTov7acipPQEskE4NCp9iPZDl3Vxl5Mkz4pJI7n5Q
	AbMBqrm4aqd4SUmjplpjiwYWjOEshNhbCdUmJVg=
X-Google-Smtp-Source: 
 ABdhPJyKI7cB4ra+LeG2YfYWMCoQ77TWPU7NdqkQhZKSskG8g4nraQ2Q/xz1AW5/+89g/nMtH+O1JXySAnhUL3E9VXA=
X-Received: by 2002:a05:6638:d53:: with SMTP id
 d19mr11065415jak.123.1635175253752;
 Mon, 25 Oct 2021 08:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
 <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
 <CAO5Uq5Tv+yfED2u7ygvCX1tBcKpnAgpVaiAPGg10uYnXBfEdsw@mail.gmail.com>
 <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
In-Reply-To: <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 25 Oct 2021 16:20:42 +0100
Message-ID: 
 <CAO5Uq5T=jC4_ZwzWq9HQARZnaMtaGP99jaby2DRjPiKonNLGHA@mail.gmail.com>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Khem Raj <raj.khem@gmail.com>,
	OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 15:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93566

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

Just looking through what needs resolving, I think it's just
initscripts/systemd support


-- 
Alex Kiernan

