Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F1CC77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:38:29 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web10.3711.1681457907820970786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 00:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=jsAjkAY4;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.47, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f47.google.com with SMTP id y13so15853509vss.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681457907; x=1684049907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz3Pv4byP27Oj7U/DdJ12mTAugq7yXLmDUPex5yHP7A=;
        b=jsAjkAY4OQESs29Dz9CidDCgX4TLMCKHfV2QHovxRqkbdZIA9FEt8VDly4BppUChV/
         fFWB0WRmnNlW0gdRzcg33Sg2uHaOIvP2xr1mXFWqhndpzY4KfPtkj48ZIAbVFlpxYFLl
         8lxZkBmC+uMM6rf+EAZwTsqU1hE5ZzCtiuivISbqslyOAOykt3N5iCb9yWjutmKXMxN1
         sUW1MqI/HdEXNkCGVUDdG0AI+0OECg3SkhRQcNOPhsWl5hSkk/B2N6uJkV8+Oemd0CxE
         /4jHiORx9ploJHDcfCzCz0avyakzLkXJHWmZaS1zN84hALxjbya5F1zwik97qOW8rE/X
         GEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681457907; x=1684049907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz3Pv4byP27Oj7U/DdJ12mTAugq7yXLmDUPex5yHP7A=;
        b=Einoe2yltI/hKqjbf7wvKepINvqTb5qhQ4n5w4frDhmwdpO2fnig2Qwe23xf2DQcKs
         lvGU88/3ixuBiewmxq84gEy9OiJoBJNQOVBxcWN2H6/wXjwnJgI3dfDQOnGrCp4Ix+H4
         Auz+Tw7lEb0+eClI2xgQ3p/vCk2ABZq+IrFTkK6L02oZODYc9Mqv3hkLMvfN1WOYb65j
         xVz68BkDAoTWr1RWSC8nadc+uuaM0PwCTPRhhMdvDCh4U9xNgHXDFQqAk0iePXhWi95G
         Q5pG89gihNeER80I7um9ycCIe0T5j0V+TkWEuUrVDNyhdNmgUN7BCuXuLTXSNPEYKi7n
         65rg==
X-Gm-Message-State: AAQBX9fewib+6fLytM4NtKhH/TOKwAVkv/cO26M678UFkMaXXmQMPBUC
	CJ7qDoiz/hTnDEnHuVcaIX446pOy4a+4ZewatpXsOCY40xNvZ4RG
X-Google-Smtp-Source: AKy350aabLCUlwhQR2L6jpnbMYqJhcObg9LhASypB6pV3uKjiqIhwdSBrfwD5QaPnoWnVJcFZgfXje+TIMV8L8eZ06w=
X-Received: by 2002:a67:d719:0:b0:42c:9397:429 with SMTP id
 p25-20020a67d719000000b0042c93970429mr2858823vsj.0.1681457906805; Fri, 14 Apr
 2023 00:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
 <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com> <CAMKF1sraz6M2hVAL5wqwnFWpe4+V5dggn1FMCYyn4U0PfnPCzA@mail.gmail.com>
In-Reply-To: <CAMKF1sraz6M2hVAL5wqwnFWpe4+V5dggn1FMCYyn4U0PfnPCzA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Apr 2023 09:38:16 +0200
Message-ID: <CAMRc=McxyOcsCrPRvVM=OLoeyFHJeZVNLs6rp0XeBd3LuodOMg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 07:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102090

On Fri, Apr 14, 2023 at 9:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> https://errors.yoctoproject.org/Errors/Details/699672/
>

Ah, I need to remember to always test with clang...

This looks like a different bug than the one spotted in libgpiod
v2.0-rc1, it appeared now after switching to python3-build based
build.

I'll take a look.

Bart

> On Thu, Apr 13, 2023 at 11:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Fri, Apr 14, 2023 at 3:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > still seeing these errors
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/265=
9/steps/14/logs/stdio
> > >
> >
> > Seems like this is from python3-gpiod. Can I see the recipe logs somewh=
ere?
> >
> > Bart

