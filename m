Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23031C77B70
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 08:27:30 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.4419.1681460841095376937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 01:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=D08hrIuY;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.48, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f48.google.com with SMTP id k20so12101994ual.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681460840; x=1684052840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgN2Mxwgh3xSyZW4NTX9x1aa/KuK/RUOV8Ys+L7iyqc=;
        b=D08hrIuYEFJXeyG0ZLB1YGnXAzA2+XjEEojvrzjnfnSztZfO3f32ha/t6r1Gx3T1l8
         3OKyvgLiLgxxvmxysDZ11Hj2o+89aKVjY7Rvhw7zPzQ8E8DLjVM1Nswm/SCpJGAnfDsg
         4uCvEmcyalEOS3YEoi/qY80jHWgJaOaew1BDoLWjS4Hbi9jBPXI6EvKBDkq/kRwDYUtC
         eQZNY89NLGJu4WndNjApFrVD9E7frXKLUUPRFgsNkUos2sFSyk8S2FLq1hYOXGZJJi/O
         yE+OgAAAzjCpNwaD0Nx1fAIg9Ba9B2c32j5mdimNy1V/4soMbZmAsapdt6lB91QozA7R
         Qveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460840; x=1684052840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgN2Mxwgh3xSyZW4NTX9x1aa/KuK/RUOV8Ys+L7iyqc=;
        b=P6XKxrnrpfXiOtZYhF1hr4Ci19/kANNT6dn6UUmkZihC/rkNYce1aGxlI0KKozWvER
         b0EnuVnGvvLvqHKKDKUxuaOQIgnNrQdUMgI+LLprXz1dtv/d6hcPvQUXFWMMLrED7vvX
         aKoIgIqlrIDN9b+lKVlUXhpIS5wSIqgcQxN1LjCEUPbco+ufP33QDHw8CbJevYqsbB24
         CD2uu7+7OwHSENSAyWYLOF85y5ya0Nhrfrl2onScFk4ZNcZlV4wRanAeBuGttHqOnHaX
         /mmluR862+SOakt+f4Ycd/LXADFBJHxqmWRRg1eKiFu5tCheB3Wk9GfdvfI8+YQeQJuA
         +TOg==
X-Gm-Message-State: AAQBX9dXK9nrf53ld9lOSeVN/OS3rf/ahXltg7wGTdugCXd1bIS58IED
	criw5PxhBSf+VlCQiloWobSoMyLJvr0JAC/UOeWfpA==
X-Google-Smtp-Source: AKy350aQPMpt7nMrAL1V4JMoQWpd8rDTs9KgUD+L0v5Xm2yDbc5dBCMHab5m8I8mF9hb6nZWB1BALM+LJOCYP5qgFvc=
X-Received: by 2002:a1f:1f0a:0:b0:432:8b30:81b7 with SMTP id
 f10-20020a1f1f0a000000b004328b3081b7mr2482358vkf.2.1681460839990; Fri, 14 Apr
 2023 01:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230411131518.401912-1-brgl@bgdev.pl> <20230411131518.401912-4-brgl@bgdev.pl>
 <CAMKF1spb_w1q6dy2GApO=UyoGm67jnuOfPG55dKbh78Dk6cPCg@mail.gmail.com>
 <CAMRc=Md6AsrBea7NE6odvAxG0bJ7j4Nm3+k48Xij-KPwO=Ps6w@mail.gmail.com>
 <CAMKF1sraz6M2hVAL5wqwnFWpe4+V5dggn1FMCYyn4U0PfnPCzA@mail.gmail.com>
 <CAMRc=McxyOcsCrPRvVM=OLoeyFHJeZVNLs6rp0XeBd3LuodOMg@mail.gmail.com> <CAMKF1sogPatjGj4VPb5XZ3bQ2sN0oMLXCM7Dyx1Ddp-XA0Ky6g@mail.gmail.com>
In-Reply-To: <CAMKF1sogPatjGj4VPb5XZ3bQ2sN0oMLXCM7Dyx1Ddp-XA0Ky6g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Apr 2023 10:27:09 +0200
Message-ID: <CAMRc=MdXUZMY9ZEJCCS8-SCDTVPnCCR7Nem4m4H2Ev76_Uv1mg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 4/4] libgpiod: update to v2.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 08:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102092

On Fri, Apr 14, 2023 at 9:42=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Apr 14, 2023 at 12:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Fri, Apr 14, 2023 at 9:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > https://errors.yoctoproject.org/Errors/Details/699672/
> > >
> >
> > Ah, I need to remember to always test with clang...
> >
>
> Not clang particularly, but with ptest enabled distro feature
> the recipe has deleted
>
> PTEST_CFLAGS =3D "${@bb.utils.contains("PTEST_ENABLED", "1",
> "-I../../tests/gpiosim", "", d)}"
>
> but its still referenced.
>

Hmm, why did it build for me then? Maybe I need a clean rebuild. The
gpiosim.h header is not installed in /usr/include by libgpiod, which
may be the problem. The shared library on the other hand should be
provided by libgpiod at build-time.

I'm on it, will send a fixed series as soon as I have something.

Bart

>
> > This looks like a different bug than the one spotted in libgpiod
> > v2.0-rc1, it appeared now after switching to python3-build based
> > build.
> >
> > I'll take a look.
> >
> > Bart
> >
> > > On Thu, Apr 13, 2023 at 11:21=E2=80=AFPM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > > >
> > > > On Fri, Apr 14, 2023 at 3:19=E2=80=AFAM Khem Raj <raj.khem@gmail.co=
m> wrote:
> > > > >
> > > > > still seeing these errors
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds=
/2659/steps/14/logs/stdio
> > > > >
> > > >
> > > > Seems like this is from python3-gpiod. Can I see the recipe logs so=
mewhere?
> > > >
> > > > Bart

