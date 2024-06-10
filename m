Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CECC27C5E
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 19:56:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.29374.1718049379191772651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 12:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=r1ChIg/l;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.44, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso3543943e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 12:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718049377; x=1718654177; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6PSzrU9JLAhHlmUhxWt9AZ9Ki6rYeJb/rAqwqvwawI=;
        b=r1ChIg/lhBYSNbQyd+qMkA1jEQUa/3j1mre6imiotvCjyNgRy2A/4hBSIUVpB6ESGO
         2Mou5CiwTeGiHxo0JA1GHsdd/nwbI8y32ULKRqlPCJBoELh3MDRKdYwTt32JoFtdF21k
         OB2qKgpnCjM1MiB9bhEaFe0JrjNdnmWW4ADGPsSCwH0gPvPMNuIeDcQ7/yz2GNW6X739
         Whxaofg8FmiAPtmhOWz1IfAz7KrkTTm+ZwR0kAZv3d+dBRgJwxXS7uY4LHdR9VnadO0G
         /b2oweWBLrKF0619QFowvFrfROu9KMSdzp5//hxdR7Wa5+GpqfVpuGYRpa0WeGMW/eUV
         vYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718049377; x=1718654177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6PSzrU9JLAhHlmUhxWt9AZ9Ki6rYeJb/rAqwqvwawI=;
        b=VEtUYCYRfZcQbYC1AsP3UdyMYq/bcYTbJm1DQC9NsmqEWWeYdR0GagEgjYwbc7hmDd
         tuw8AXBoMaQRaUF4Q5YB0XCLAJpCh4AJKaV9ehnCJPoGaqdi4DgfE4EAzL4BmpnSP/rf
         mBqq6LvJyHreSO9T/nKLJ8bmoJKmflsFa7updUua6wXCWxYr0FsqdL+XhENRDfJU2obg
         VbtQ2xkDmwcwjUoBc7EjG//XQjQufg+PawK2/JSR8zlzdSLtG7cyHbzizldLE8/31U6d
         7HO9ZaVTpGt69OISAFPBmBNvmBHgKfdkk5HCunFvF6f31WbqHBR8k4suNUWwQhw2DBP0
         YnnQ==
X-Gm-Message-State: AOJu0YwioYU6q/Opwn8y9jifNWBQSKzsQ1PNQhoMFWYrrD0m4YME6dmn
	N+O8PgZs2UMGSI7HnWFbs8eBmnDe8o3AIM/NS/3BdcNDxcxJEsRF2teo72GFkGdftYN8yLjHYj9
	ifkBcbYoEBLoYKoVYg2VlmjBgtXtVN6h+aVLVDw==
X-Google-Smtp-Source: AGHT+IEzobBdrNw8Jnfi2OLnatQNjbYzOwf9WbYD/44f+SnyEjOPMLoOX8X68AObK/MvYUGq46A66VW1dkwkoX7EeU0=
X-Received: by 2002:a05:6512:3f14:b0:529:ed29:dc94 with SMTP id
 2adb3069b0e04-52bb9fcc165mr7660169e87.44.1718049376778; Mon, 10 Jun 2024
 12:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240610182058.2286377-1-raj.khem@gmail.com> <CAMRc=Mc3e8PdFPHRCcPMvE4Js+utpwN-oXzaHy2w9976tWa7ig@mail.gmail.com>
 <CAMKF1srw9-pcKB0Z08uxZYbD2R1WK9VUv5vsiGC-AAqk8pwKqQ@mail.gmail.com>
In-Reply-To: <CAMKF1srw9-pcKB0Z08uxZYbD2R1WK9VUv5vsiGC-AAqk8pwKqQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jun 2024 21:56:05 +0200
Message-ID: <CAMRc=Mef6nXpD02jNMOJjc4xcF-Nnv0cmhzxmxDu3xbUs4Y02g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Disable ptests and fix build
 on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 19:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110805

On Mon, Jun 10, 2024 at 9:31=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Mon, Jun 10, 2024 at 11:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Mon, 10 Jun 2024 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > libgpiod-1.x is still in use by some BSPs e.g.
> > > variscite SOMs, so we can not get rid of completely
> > > so give some time to move away from 1.x and disable
> > > ptests as they need older version of catch2 which is
> > > being removed
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> >
> > TBH I still support v1.6.x as this is what Debian stable still ships
> > with (and will continue to for some time) so how about dropping only
> > C++ tests?
>
> Should be ok I guess, would you mind sending a hint on top of this patch
> how to do it ?
>

On top? This patch should be dropped and logically split into two.

The musl fix is already upstream as commit f6444fb306d6 ("core: add
missing #include for basename()") which allows you to set the
Upstream-Status tag to accepted.

I will send an alternative version tomorrow morning.

Bart

