Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6056C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 10:45:33 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.19701.1709289932840575499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 02:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gBdFr3sb;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d275e63590so26102601fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 02:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709289931; x=1709894731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jfcvl5vSFY4gvxFrTcqy0VvkdSPl+4Q6358tShfoHxk=;
        b=gBdFr3sbBLUcpWUFUSFiRiwQdXn4ktFS4f4ZxivVeUSoPAscWdHTez/OB8leNNJZiE
         RF+ziuVrSZrEMDrNj5txFkL6gD+p8Lx/rEcTud66PuJk+U2klBAckbXJf/zZAc+uBESJ
         tLg5DjlJRAHpwPbiDIAz/cN0nvb9sSPcm1p0SisNo1ojWsIQ4XHLW3kCiFrmfuMDfW9d
         eMz1KKOH2IHNQa5jFYPX39AnytSGB/KKiJGtdsrMN2n8uiJ/WHpbvb7MhDN2e1WqG9Ry
         RHZKjuib6Q0rBgQAylvAHV9w+yHcbDMAseBMNkW2ltD5yBYBee6gL8m6y3EmznILqOGo
         yrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709289931; x=1709894731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfcvl5vSFY4gvxFrTcqy0VvkdSPl+4Q6358tShfoHxk=;
        b=LcI9AYsCzSIHgSfzayIDMa1KfL1eGmv0DEGaiY4sZyJ14Ff2JAJKzfA2s0ERyykpYZ
         RvF8lDBQAKq8jAz97NJwGGXfMwJrcpr971jOW21sQdrfQkZcaQS4a9N3lVZiHaASVxcO
         1DTToFNi/all7Cvc+Fb+gfUlrAlyIyXZeaKMyLGpxwYB5THLBNZoWGK93MCV8Cd3H82c
         rTlc923Dp/AD/NEcXI4RZUmlLumJlEDb7HFD8IUTAEUztlBzwdKML1MB3fKs5XGiHaBA
         xi+S+K8xgT/xpAnRDKvQh+indq/uDCbPDUSu6049OEt8uuLRzcHglaI6gxyzp2BPMTWZ
         w+uA==
X-Gm-Message-State: AOJu0YxVyEIkIYrPIuLbgHhBueGmAdo2ifRTBHEFJf0VLS9ryI0wOawR
	rqqhElWFmASti1ts40aN1S7vM+jUXyFukinSrt3gR7/6RsFe1TCJMjeiBJiGzzsD3giQJhYcNaZ
	7h0cep9LmY9NO91PqrnLXnrS7oxo=
X-Google-Smtp-Source: AGHT+IGMHck5iiR+jhVw8awjlt/b1zRTouYfkMnCprddrhW8YZtjqvYLzdQus4PvVotvb1VC/iYBToNCciB9teTu8io=
X-Received: by 2002:a2e:91da:0:b0:2d3:3b37:db78 with SMTP id
 u26-20020a2e91da000000b002d33b37db78mr803746ljg.16.1709289930796; Fri, 01 Mar
 2024 02:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com> <CA+chaQfOOMdDvQE1Q+7qMBdb37A3UUins90d+=hUy7OVYT60Xw@mail.gmail.com>
In-Reply-To: <CA+chaQfOOMdDvQE1Q+7qMBdb37A3UUins90d+=hUy7OVYT60Xw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Mar 2024 11:45:12 +0100
Message-ID: <CA+chaQdtcOvfmXtPM2W2ZeVo1XtvUtNC_b4m78b7krrQedZaLQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/4] fuse3: Add missing runtime
 deps for ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 10:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109075

or is it typo cuse -> fuse?

On Fri, Mar 1, 2024 at 11:43=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> does it need virtual/kernel dependency now?
>
> in world build I've seen:
> ERROR: QA Issue: fuse3-ptest rdepends on kernel-module-cuse, but it
> isn't a build dependency? [build-deps]
>
> On Thu, Feb 22, 2024 at 9:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/me=
ta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > index 5e532ba7ed..321851da5c 100644
> > --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > @@ -29,8 +29,10 @@ SRC_URI +=3D " \
> >  "
> >
> >  RDEPENDS:${PN}-ptest +=3D " \
> > -        python3-pytest \
> > -       bash \
> > +    python3-pytest \
> > +    python3-looseversion \
> > +    kernel-module-cuse \
> > +    bash \
> >  "
> >
> >  do_install_ptest() {
> > --
> > 2.43.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108994): https://lists.openembedded.org/g/openembed=
ded-devel/message/108994
> > Mute This Topic: https://lists.openembedded.org/mt/104516894/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

