Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2EDD3A677
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 17:27:56 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.2491.1730222871302974332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 10:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dc8ccwWr;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ebc03951abso2650954eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 10:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730222870; x=1730827670; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKDJ8WAIHJevHxYoSDcYYUUGLxGXUnfIpOgFu5vLEyk=;
        b=dc8ccwWrhY+8Sy76z0yQj0l0+ublwxY8xXT6i261GOSnecFJlRpHdMIbW3sVzoQ3+V
         8JfNOgx66d5E0jDR/dQiSfGqax7ofcY/KnO+hW7rwRBtCSOgBPxRVTJ1lbUyWHw9qtR2
         HkySB+pPXGd/3FmBwtvFj/KQwylnrASUEBKcvVZ7FwRJzCFo6fcjgVbw0faJ2S8MlnLh
         LPGaCuVFlVy4iioinlDT9IhbK+X3Ptm5OItw56tgpJ5Paq84WA4508aQE1XZ75OyARbi
         KS5klvxp9rx39W5nKIQ2Ni5jzbeJ+Yx1GgyRfv3ajecGckLO8TO//20zP5vSAuf+md0o
         Cqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222870; x=1730827670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKDJ8WAIHJevHxYoSDcYYUUGLxGXUnfIpOgFu5vLEyk=;
        b=q+L/0wnPKMm147j6rFiV5XrKJecURLJFk0q6E6tEXeuxCqVRHxnM9p5Z6UpB0z1mXn
         c50rK1huue6w1eisn5wbYyEy/NEorUHEdGLAFyX7n4B/o1bKtGvMMtjCkyV3nbYDhl+C
         TdiOzk/PhNK1sOwCnhS0Hch4NlHpXJgHFISXojo5Q2AcyWg3qJjIXc1C2rVkdF86lFal
         iF903Fs6DUyy4Xb0zlzIbG7QgS+vmDeBSvQVz1jpS2CwH8xJkGJKvwDHg3wmz6VAyYuJ
         CfFYxtF1o2oGpSeBmcYe1FjzuqhcYQvUPgbJeSQcF+B3gMPC5b+3K4nsgNkWkXuJI1yb
         CGsg==
X-Forwarded-Encrypted: i=1; AJvYcCXucJaOsE0ltTnOb3ZWmOOzv1qB+EMwpJUf6QAnJlQgaA3xCQS1tph/eTIRRUalK64juhJNJnKjirYQtDOZO7hx3Xs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZJSmeTVh1btRL5m2N5GTG1qb3EXoGFCL5nv9mEJtjWEjoLciJ
	OHex1HWgOAcYdkqwanxGDhEUbI09rhLj21Y9x/V0HyALDser2lKeiWIeriHjNzLJTS+/SfSH7T6
	UhETKqYN32weqmgGRxoaQlqhEXtI=
X-Google-Smtp-Source: AGHT+IF8aopLpmJkyn/ZwVsVSLPNFPMwzPzSpNajVB2rgzlmZKfcZcIvocO+1fC+4fjrdoA45RPAxPQZKFP63dDEcbs=
X-Received: by 2002:a05:6820:616:b0:5e1:efda:3991 with SMTP id
 006d021491bc7-5ec235f2509mr9227213eaf.0.1730222870467; Tue, 29 Oct 2024
 10:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241024135126.48781-1-brgl@bgdev.pl> <29bbf4a17cfa28fc45c0f3e7fe3b472170d6bdec.camel@siemens.com>
 <CAMKF1spzk7ezwr1ekRq+NxoLFuT3gZ66-ARsc1_ZYfi0czwUgg@mail.gmail.com>
 <CA+chaQdCQquu7TDt=YONbXmA8rpdoALUDPJ22eJRe50Zumo73g@mail.gmail.com>
 <CAMRc=MdDpw6O-T5uGsos4gFr87J85wtFxLK1F+TeJLd8JctdwA@mail.gmail.com>
 <CA+chaQdB0DWJ_UjrFp3NRzDyU48rLtf8--XUj9yvrKRXUQ0GVQ@mail.gmail.com> <CAMRc=McXnYFrM5gPftv8BpBSc2X8=E-++PrP-LiPy2Cs5qCG4A@mail.gmail.com>
In-Reply-To: <CAMRc=McXnYFrM5gPftv8BpBSc2X8=E-++PrP-LiPy2Cs5qCG4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2024 10:27:22 -0700
Message-ID: <CAMKF1sqNfxKB2trWzexx+o6N9A1-D=pwBOD5avaXoF85xDz+yw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: update to v2.2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 17:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113330

On Tue, Oct 29, 2024 at 10:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Tue, Oct 29, 2024 at 5:54=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > > I'm not sure how you got there
> >
> > bitbake python3-gpiod
> >
>
> There must be something more to it though as a simple 'bitbake
> python3-gpiod' works fine for me. Anything particular in the config?
>

yeah it worked in AB CI and also my world build builds on different
architectures but I am able to see a build
failure on one machine today which is new and runs ubuntu 20.04, I
will share if I find more.

> Bart

