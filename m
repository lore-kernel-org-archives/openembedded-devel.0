Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4F8D3A676
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 17:31:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.2617.1730223058428504216
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 10:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idLvgEin;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f6e1f756so6036273e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730223056; x=1730827856; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhjRKfilpClkAA1MlqiHY+FcOr20MUYyH0RdDpGfAKE=;
        b=idLvgEinYhmPfjjlV1MNObzma03rrJumQVCZ9z12bCldcVL6H975BCrqESC4XmNyNG
         msjUmQ3ps0brdioWzXN9ZgqhkrYVH+R20sxYFAPpAUhSPrAYT0zwzlSPM4vdacDaH8Vx
         S7mXYJ5QabI0fmSAZJhC1IUmI+qG3WARkKI86dxlmnn/bpMNvbwTdihnsAC6jWZjDX4I
         t26UWj/GSuQVXnE+7lVyrdXVLdvxmO8/qaamtDf1mGouAlMYVFdJ+4IdBvs5hU8wCvtp
         gWxG7swl1p8F9CXpypuHu1IEtXG3TPqw7INJ2GS6sqWUUmpHJheLBA75MhOJTk6SFxTT
         ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730223056; x=1730827856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhjRKfilpClkAA1MlqiHY+FcOr20MUYyH0RdDpGfAKE=;
        b=OuoDBx5+1SXbKzhx6a/p7EbcZ9gG1XgvvdkE8zczUQ7u48qJpUNhxSE6tO2CdI8D5n
         pbEyaJMmT6zhWMGr2SG5PoP6aXb/KIHNI20/1DLNR/+0Bc2FeForpYCHPKKUuyxY257t
         wjZkDu7LVs3hpxfMlE5F8aX6tYeyMnFl9LwW52Caz2LVDw9OOCG4XXBFfmKRtCFsjmZD
         S/CTvlz/SAM2+M80WqwFp6E2X/rXJztQLidoysvgojqDqnTkhMBTrxkStE0n47c8PG8O
         aNGeJfveOp8nNn1xTp2JzFxyPb9+qfaPq7aA+Ab+mWutKutISff9x5xiL+I0/FhjYa5h
         m8/w==
X-Forwarded-Encrypted: i=1; AJvYcCXplT6H5WREAr4p1QRTLgvxYJ80nPJucuJX8VqlAZh+ymhiLqqqYuAff0wBcUXw1LL3ki+wVEolSx2midUW6G2a+7c=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeUolNIwDd7udJs58OpK6nQ0jEAtGI3uySNTyuaHyGCdOjwMb9
	zBrrPsVGWTEQDmI+dtrfi7ZKp5lUrSoe1vCi26a97WcGApHbRzd1JBD6iNtuUB1LsI33ZpSLkie
	xgtcY8MxjD8Sz43WoNO1hW/NkD/Y=
X-Google-Smtp-Source: AGHT+IFqifMsxf9TVdQzQwSNIKfWiwXTzksvJM9PBwLuS28Jk7OjFlSFA+L8GBKPlURiC8llEUmXayAq98tbf7XEKxU=
X-Received: by 2002:a05:6512:1092:b0:53b:20a1:1c4a with SMTP id
 2adb3069b0e04-53b34a19077mr5911360e87.42.1730223056244; Tue, 29 Oct 2024
 10:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
 <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
 <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
 <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com>
 <CAMRc=McXnYFrM5gPftv8BpBSc2X8=E-++PrP-LiPy2Cs5qCG4A@mail.gmail.com> <CAMKF1sqNfxKB2trWzexx+o6N9A1-D=pwBOD5avaXoF85xDz+yw@mail.gmail.com>
In-Reply-To: <CAMKF1sqNfxKB2trWzexx+o6N9A1-D=pwBOD5avaXoF85xDz+yw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Oct 2024 18:30:44 +0100
Message-ID: <CA+chaQd48rTW4VWANLxd+hsTCgpeyi2J=X+6U02pBDjnrmtqtQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 17:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113331

My builds were on ubuntu-20.04 as well, nothing special in my config.

https://valkyrie.yoctoproject.org/#/builders/87/builds/16/steps/40/logs/std=
io
seems to be from debian-12

On Tue, Oct 29, 2024 at 6:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Tue, Oct 29, 2024 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Tue, Oct 29, 2024 at 5:54=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > > I'm not sure how you got there
> > >
> > > bitbake python3-gpiod
> > >
> >
> > There must be something more to it though as a simple 'bitbake
> > python3-gpiod' works fine for me. Anything particular in the config?
> >
>
> yeah it worked in AB CI and also my world build builds on different
> architectures but I am able to see a build
> failure on one machine today which is new and runs ubuntu 20.04, I
> will share if I find more.
>
> > Bart

