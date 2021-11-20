Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614B1C433F5
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 14:51:50 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.8658.1637419907162729012
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Nov 2021 06:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XQrL/DnS;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id de30so13344472qkb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Nov 2021 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1EUWJRcNpIgsOUmdBjqlr8KO74vvRBKCpZqNuBbs04=;
        b=XQrL/DnSmuAacA8Qcxl4SfcXAJfGlC75fS4cJAcgbYvozO+yzp58gDCTUWoosnspBS
         qQxftGaudyUTL88kaBievLfpT5m6BFTttYkSAT3g0AvHj2oH/jOitiIXEWNv42m+7A3r
         OWqmUYjLa9qMrdmJnYloUT4ZPtvjUVIcK8GjPGk+W5EIBEgibEzLEs8oq5lQystGbkv2
         05ygvet5r5yYfjllXKF+0Fluc79f4DGWWbYilc2RmK/l0oy2UyePbgBICTvJ3Nw60wK5
         fP73w/lYt9A6TikGuxt2BVv4HiCocDKxEagF1sV9Lz0/e5Vm7W2Ib5YxiFNLCalB7BWr
         Ey6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1EUWJRcNpIgsOUmdBjqlr8KO74vvRBKCpZqNuBbs04=;
        b=kF2TGXx7Cwl6u6KM1hwkZ+LBXQURmFwj50tKNh6DL3JW8utzZCudZkneWbC2GcWDk+
         TB4qCkeyBYhUX/kFzBm7KyxasXdc3Z/HUroYDUq4Vhg0uvxxooQgld9cgSoXhTOdPFFm
         9zEoXf20mz/0kIghdin88O3B2UbuAe5NIrrSCdAlSoaAmtI+k/grZTiwjSoZME+hMx8q
         xuTMltpSW6x+FgSKYBdY6eDIcuetoMoocnoXoC4JE8+mXUlqSOSFmW765qkgamWkD3Tn
         tG9kzbTyzc3Jhfgqyxws3Ma57JTlPTWWaEh9ziEqefQYyQpOyKVAGBa8THCq2tY7wz45
         UTuw==
X-Gm-Message-State: AOAM530oY2DaeKk6veW3ZDBoWl5sCnzoUjVLFdkr7MWMOh/GrUh/tU2z
	ACZP0qgOfqIjUCzVQZvU4WUVwq6Alg0qdiGFy6E=
X-Google-Smtp-Source: 
 ABdhPJyoAhJqfh/mPHsW/1PbR4QRsoxxj4EGzHh50xqc8kdTxv0FUuQoybbuNJ4G/7JzBD6KtIcUBUkdnBbj5muwfEk=
X-Received: by 2002:a05:620a:4f6:: with SMTP id
 b22mr34742758qkh.98.1637419906249;
 Sat, 20 Nov 2021 06:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20211119220833.133927-1-marex@denx.de>
 <7fca4b13-199a-ff2a-4680-370cb8a48a01@gmail.com>
 <CAF6bG8f9xb2qn8sDkAtz_6xKxGKwFkudFFUZTQJoUaa8qPa=og@mail.gmail.com>
In-Reply-To: 
 <CAF6bG8f9xb2qn8sDkAtz_6xKxGKwFkudFFUZTQJoUaa8qPa=og@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2021 06:51:20 -0800
Message-ID: 
 <CAMKF1spTKLnNQR738+hOPNwP3LESfcfXfeNkCGrbZYCkxEaw0Q@mail.gmail.com>
Subject: Re: [oe] [meta-games][PATCH v2] neverball: Add neverball
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Heiko Schocher <hs@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Nov 2021 14:51:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94076

On Fri, Nov 19, 2021 at 10:42 PM Marko Lindqvist <cazfi74@gmail.com> wrote:
>
> On Sat, 20 Nov 2021 at 03:12, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 11/19/21 2:08 PM, Marek Vasut wrote:
> > > This is an interactive game with a rolling ball, useful for
> > > testing whether point sprites work correctly in GPU drivers.
> > >
> > > The user should install both neverball neverball-data packages.
> > >
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > V2: Use cp -R --no-dereference --preserve=mode,links
> > > ---
> > >   recipes-games/neverball/neverball-data_git.bb | 16 ++++++++++++
> > >   recipes-games/neverball/neverball.inc         | 26 +++++++++++++++++++
> > >   recipes-games/neverball/neverball_git.bb      | 16 ++++++++++++
> >
> > hmm, these recipes should belong to a layer, perhaps meta-oe or
> > meta-multimedia
>
>  I think this was meant for meta-games: https://github.com/cazfi/meta-games

thanks, I missed that, I read meta-gnome :)

>
>
>  - ML

