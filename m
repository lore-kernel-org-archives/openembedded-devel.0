Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F36AC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:33:12 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.108140.1712586787824551811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 07:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=neYb37Qt;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so1617002a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 07:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712586786; x=1713191586; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFEef4JFP/cvCz1Fp36NwyqVq2n2cIO3IgnokL8VbpY=;
        b=neYb37QtWeYondVEInfvq/nLFH2266dR9q7poCG8weI7Po3vIR2yXEGKNjfEt/MGPq
         bKQaOMBCJHcHbefyXfxZQEi44wt89xbvVbRd06fAAo9NcA5M66y9dIkcMQ8p1P0qp0Ws
         EQjtHksVCl6o3J/lFp99JVYmxbZoR2gV/OHvX9UIGiUdFh/xW0U2k0X0bi5W/Hu2V1/6
         rJzwSKNOLCo7E0Y1VweKH6JwQmH/UcTn9iK5jnQ7ouKZbPErG6tidjBcovleAoP6aGWo
         IxwtJZQjm9wJOanjsZIL/smX6ydECCrow2THMa7k8JMXqGxbsxbCKPBBueHVfKT5XicR
         i/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712586786; x=1713191586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFEef4JFP/cvCz1Fp36NwyqVq2n2cIO3IgnokL8VbpY=;
        b=Jizb/sMoMlHhDO6QFiuLejODbaSwD161uaTMKO9cwP3oN55f4WWRUmW1r1M8noWGfx
         KA4IXRHdWf26VPwltbS2Kkx2LaHT6tlj1zzastN5NOFigTF6sB5oK0CaKqG+bL/ZsE4T
         rFYFFTUWycZ00+zoF6HPmXeMtaXEIk3V+Tz37EpmNiRBIK/vawf1ix019YyjaQZ5PJpH
         50UYeSV9CND6ssau+BkPR8I3SjhUAsms3o1x3NYKq/0lN1N1X6JIDT5kxN9onhEvP91H
         eTFcsyD4/nH3QrvexNnoHgau52xRHrdLDgBDIH+sFB3dZY1dpLhFpkddUF+ZYBCn59eR
         39VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL/N8vtrkqxqdnCsJta9uSViBwYTpl/UuUrMt8qwy02Rc8ffTCbtWrhopxyT8l68lYqhIgJj4GzeUINY1GrCDMjyo4hLgRqNimpBVvbB3CyQulJqG2q5/BLg==
X-Gm-Message-State: AOJu0YygzDtSlQkUhjV50gCHSWeqJ4jXK2GsJui82qr8VGlPaDWc7mlE
	H9ed5pMAR6FqXYpQzimwIW3NP9cbVGH8ECFa4X77b6nZpJJbQA449qFhZtrjrd6ABYTkxkRT2Xe
	bPdha89myirg37UnxtDqQBZ2w2Ks9jGhihNj2wg==
X-Google-Smtp-Source: AGHT+IFPVghYzut7Im0QzCV2MG3cNjWkuOCXiYQO9vY37viUSvw5kb4V8NPo9ck6uHy+f8jULm3zm5grmiz5mS4E5kM=
X-Received: by 2002:a50:935d:0:b0:56c:d1b:e088 with SMTP id
 n29-20020a50935d000000b0056c0d1be088mr6253897eda.19.1712586786212; Mon, 08
 Apr 2024 07:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
 <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com> <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com>
In-Reply-To: <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 8 Apr 2024 16:32:54 +0200
Message-ID: <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109866

Hi Martin,

On Mon, 8 Apr 2024 at 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Apr 8, 2024 at 3:50=E2=80=AFPM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
> >
> > Hi Khem,
> >
> > On Sat, 6 Apr 2024 at 03:04, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > fails with latest musl
> > >
> > > https://errors.yoctoproject.org/Errors/Details/761688/
> >
> > I tried to reproduce:
> >
> > local.conf:
> > MACHINE =3D "qemuarm64"
> > TCLIBC =3D "musl"
> > TOOLCHAIN =3D "clang"
> >
> > $ bitbake -e musl |grep "^PV=3D"
> > PV=3D"1.2.4+git"
> >
> > Build Configuration:
> > BB_VERSION           =3D "2.7.3"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "debian"
> > TARGET_SYS           =3D "aarch64-oe-linux-musl"
> > MACHINE              =3D "qemuarm64"
> > DISTRO               =3D "nodistro"
> > DISTRO_VERSION       =3D "nodistro.0"
> > TUNE_FEATURES        =3D "aarch64 crc cortexa57"
> > TARGET_FPU           =3D ""
> > meta                 =3D "master:486ed69939f1b7572f121960c2dde246032686=
e7"
> > meta-clang           =3D "master:13dcab852c5bcd51fd75ae84ace9eddd992546=
53"
> > meta-filesystems
> > meta-networking
> > meta-oe
> > meta-python          =3D "master:5a02b76b82d1f48986212c33dddf7986385c79=
ef"
> >
> > I couldn't reproduce the build failure. What am I missing?
>
> removing meta-filesystems from your bblayers.conf

no, I'm asking about the musl basename() related build failure.

The build failure about fuse3 dependency is quite obvious.
In my local build, I moved the recipe to
meta-filesystems/recipes-support/composefs/
I'll submit a v2 for the latter but if I can reproduce the musl issue
and get it fixed for v2 that would be great.

