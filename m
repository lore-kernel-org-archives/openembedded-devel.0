Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730F3CE7AAA
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:26:04 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.67388.1695662757473466508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDadvqcv;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1db2445b7afso4177041fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662756; x=1696267556; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTYKYGzRyyq8E39NTMwk7KwEqT2A1oxC2mVQH5NeTb4=;
        b=aDadvqcvnCug36eJS6YDUkG6oBxuAO3ASKxHdwKAJDphtriPBb34kcKkFhHG23I+HQ
         FhFfxt1YHVSNpnJNyT26il8sgcR4YIXVFoL6thMzJtdA2nMvMqDMFD2Cr0BKvaRVJ38k
         kQyom7Bsd+g1rdBFEYO9CoWy8X3XfYxxJbD6E+fDF7A4RkTua9rw4w+M1jdwdwdFalDo
         sjThvmfnYITr2P1jHhhu9I0xyC/smdYaqR/iRg/B3YjayUxt17w/9cPOGccsMxrDRS9G
         0llNtHebpaY7yNwnjoA4PxuRtTgoj0+DibARgIquBwZwsDjFjjyTZRsG23pGWmiXiccc
         Fq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662756; x=1696267556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTYKYGzRyyq8E39NTMwk7KwEqT2A1oxC2mVQH5NeTb4=;
        b=HyVDKsQtw+mtTiNMoMj5L+097UJxIz/J22GfUaG1BMkDhu/KHVzwY9DTWnTE9ZvbyW
         jkjm+mzGgA6fGhZRKxOCdbZJpjSYbcgJg7bxwihvc3zB0s4qCXoAazcenfbJJ2CcwlkQ
         CGeHNFZYCV63GyY7905OlfVdadzoqmhgpoVcaP5+tiz362VKIzMuVK/QzinrmHA5dxaU
         4q/eBZccvYK9O2jdTdz7VkvdV3jqPRy/2FyPirUsuZTLGoMyWtEb3wmhQ0EUctkUmuy2
         vxO6wgiXbpJ2bJIVJ7VptEVbzwm/Wiv9IAhCk830gDkpF5F2ZY2mqYZXyRxQ7g0MQ+oq
         L2Nw==
X-Gm-Message-State: AOJu0YyOYXXaW0H4+q9G2jb/2lYpimO058FJI7w6hpSHpYHRCow5hZHt
	SsOgkxeCp5bvjFDB2mEQ62wLrTBLijHz/by06hKeJBg7Yc9oZw==
X-Google-Smtp-Source: AGHT+IGnhculomij/CfoS1szoGjjWtClNhMBjfA/aFqEY88E3LRMv/7e5vmYVDMZY0ntm0Oqzsv46cOWgORC2dgmJV0=
X-Received: by 2002:a05:6870:d38b:b0:1b0:408a:1d14 with SMTP id
 k11-20020a056870d38b00b001b0408a1d14mr9716288oag.44.1695662756697; Mon, 25
 Sep 2023 10:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230918110305.38374-1-dse@thaumatec.com> <CAMKF1sqGaJqAHp4_6gsvNPqXywGf=Gjv7ML2d=G16ZbLCW8N4g@mail.gmail.com>
 <CAHgnY3kDUAUSR=o-HXEoBuybqqW47_4AGJScDUgvo-KDRewczg@mail.gmail.com>
In-Reply-To: <CAHgnY3kDUAUSR=o-HXEoBuybqqW47_4AGJScDUgvo-KDRewczg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 10:25:30 -0700
Message-ID: <CAMKF1sr0HY1WL8fcwJ0Uoewgeu-geCYVN+A9Naj3=_qfsQRpsw@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH v1 0/2] cockpit: Separate packagekit
 and apps packages
To: Daniel Semkowicz <dse@thaumatec.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 17:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105130

I usually use - https://github.com/yoedistro/yoe-distro but I think it
can be reproduced with poky + meta-openembedded as well.

On Mon, Sep 25, 2023 at 6:53=E2=80=AFAM Daniel Semkowicz <dse@thaumatec.com=
> wrote:
>
> Hello,
>
> Could you please provide some details about test setup? I tried to
> build cockpit using meta-yoe with yoe distro and qemux86, but it was
> built without any error. Building using clean poky also does not show
> any error. It seems to be related to environment.
>
> Best regards
> Daniel
>
> On Wed, Sep 20, 2023 at 10:04=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > I usually see this error with this package
> >
> > https://errors.yoctoproject.org/Errors/Details/737847/
> >
> > Can you see if anything pops up to fix it while you are here ?
> >
> > On Mon, Sep 18, 2023 at 4:03=E2=80=AFAM Daniel Semkowicz <dse@thaumatec=
.com> wrote:
> > >
> > > "Packagekit" and "apps" Cockpit modules were included in the main ${P=
N}
> > > package. Move them to a separate packages like all other existing Coc=
kpit
> > > modules. This allows to choose which modules are installed in the sys=
tem.
> > >
> > > Daniel Semkowicz (2):
> > >   cockpit: Move packagekit to a separate package
> > >   cockpit: Move apps to a separate package
> > >
> > >  meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > --
> > > 2.41.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#104924): https://lists.openembedded.org/g/openemb=
edded-devel/message/104924
> > > Mute This Topic: https://lists.openembedded.org/mt/101430711/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

