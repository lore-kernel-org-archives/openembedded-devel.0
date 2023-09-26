Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58371E7D274
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 10:11:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.15643.1695723061562882918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 03:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=U2MOjVki;
 spf=pass (domain: thaumatec.com, ip: 209.85.214.172, mailfrom: dse@thaumatec.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5c91bece9so63032025ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695723061; x=1696327861; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMr/RTWnC28ZSwm1PtCpwH9h1iGnn0UGGSswKjCX37I=;
        b=U2MOjVkiFTc9uEkZla0/k+6tS3nZfzENGODtp41L7iZgvENO8zoKGPI48WMxaoR9cO
         7xbwQFvnaQviGL+gUvFOvDIHONUbxMg2Ppf8q/uaIJkT1pb/ke69LfVoBmoSiJ9edWDt
         VT9Q/eOjCJKfsgU29uVW4hRpr+XJRYk44m3uQXFY+2x4fyWvwyKduoEMOsIMSpzaHiby
         3y7eCwd8B1PBPeDHSyH98ueRU12MfNWIuIuSqgIpcfJDet1tu9PBAjNOdy8mTSrkl7MC
         j8K3IczzS+9RM1fiGBJL1pBzTt+c/mnOW/VWnv9+DfQWW8YHoJvbapG7UsGAlmnRDQpi
         EEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695723061; x=1696327861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMr/RTWnC28ZSwm1PtCpwH9h1iGnn0UGGSswKjCX37I=;
        b=qQrVl9NXI6Sw+8BAWO1tXVfDBigUPLF0R4nVkGIlykc14lXHUyZ7KHXiCFrBG93pb/
         5lqM4Ii5XPoMhyYQxp4YEaVjEEy+v56YUqnVhNs42m5ZoSvhrYAhLH7iUNxDmWHQOEzH
         quoY51+WpmI3rh1ABgoyBhdVqPAHyagvx5tSoMWb1ButO+2T/g7HzkYWKF3SqBcPHKKI
         lkWHh9j7Se+N1TXQ/kvfB0IWTahv+f9727GrGtX2/Xn41kD+fOETmOaiXRAbb+lFT+J9
         SvJmED5+nPCbOvXPaip/587ahaQ5rJkLoSQrV/yOrQgVdrIHPr6sJ06RptQW2RuZJjeE
         pfNA==
X-Gm-Message-State: AOJu0YwVd91/uNIVfiW3IWfwFCqU8pi7cjbvWGPDE9FsKQ/illHCSnmG
	vlYINCfPcrWh8ez8StpOFfu3McuI8fhvytNWMikESg==
X-Google-Smtp-Source: AGHT+IEFS8yWU/Ra/1ZRtMfO9pBZEAi57yxIkFK+mYKHP2ZgOowT+eM89G3233u+F3JqiKY1vXAISiLpojyeKO5ks18=
X-Received: by 2002:a17:90a:9604:b0:277:852:cf45 with SMTP id
 v4-20020a17090a960400b002770852cf45mr6599597pjo.19.1695723060932; Tue, 26 Sep
 2023 03:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230918110305.38374-1-dse@thaumatec.com> <CAMKF1sqGaJqAHp4_6gsvNPqXywGf=Gjv7ML2d=G16ZbLCW8N4g@mail.gmail.com>
 <CAHgnY3kDUAUSR=o-HXEoBuybqqW47_4AGJScDUgvo-KDRewczg@mail.gmail.com> <CAMKF1sr0HY1WL8fcwJ0Uoewgeu-geCYVN+A9Naj3=_qfsQRpsw@mail.gmail.com>
In-Reply-To: <CAMKF1sr0HY1WL8fcwJ0Uoewgeu-geCYVN+A9Naj3=_qfsQRpsw@mail.gmail.com>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Tue, 26 Sep 2023 12:10:49 +0200
Message-ID: <CAHgnY3k2HqCAAZ5oOf7Tp=ONwc0X6AycvaQuRZSJffPra7KVpg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v1 0/2] cockpit: Separate packagekit
 and apps packages
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 10:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105140

I tried yoe-distro on two different hosts and I was not able to reproduce
the error. I have built cockpit using following commands:

```
. ./envsetup.sh qemux86
yoe_setup
bitbake cockpit
```

with version:

meta-yoe =3D "master:3e8908b3b2af1fa9bf45b8abb52753b972341c8a"

I am using podman with container `yoedistro/yoe-build:bookworm-x86_64`.





On Mon, Sep 25, 2023 at 7:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I usually use - https://github.com/yoedistro/yoe-distro but I think it
> can be reproduced with poky + meta-openembedded as well.
>
> On Mon, Sep 25, 2023 at 6:53=E2=80=AFAM Daniel Semkowicz <dse@thaumatec.c=
om> wrote:
> >
> > Hello,
> >
> > Could you please provide some details about test setup? I tried to
> > build cockpit using meta-yoe with yoe distro and qemux86, but it was
> > built without any error. Building using clean poky also does not show
> > any error. It seems to be related to environment.
> >
> > Best regards
> > Daniel
> >
> > On Wed, Sep 20, 2023 at 10:04=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > I usually see this error with this package
> > >
> > > https://errors.yoctoproject.org/Errors/Details/737847/
> > >
> > > Can you see if anything pops up to fix it while you are here ?
> > >
> > > On Mon, Sep 18, 2023 at 4:03=E2=80=AFAM Daniel Semkowicz <dse@thaumat=
ec.com> wrote:
> > > >
> > > > "Packagekit" and "apps" Cockpit modules were included in the main $=
{PN}
> > > > package. Move them to a separate packages like all other existing C=
ockpit
> > > > modules. This allows to choose which modules are installed in the s=
ystem.
> > > >
> > > > Daniel Semkowicz (2):
> > > >   cockpit: Move packagekit to a separate package
> > > >   cockpit: Move apps to a separate package
> > > >
> > > >  meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > --
> > > > 2.41.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#104924): https://lists.openembedded.org/g/opene=
mbedded-devel/message/104924
> > > > Mute This Topic: https://lists.openembedded.org/mt/101430711/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

