Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D513C48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 20:39:23 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.1921.1708547954095364934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 12:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyEJkyG8;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e2df04c812so4101662a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 12:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708547953; x=1709152753; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eipxZHn8LM+VAi4nA4EI5Au/zWsPAyrD5bcMcrKHeO0=;
        b=gyEJkyG86i+WlpmAM0zvjknOFXf9tYQkLqCEFDFQnd0RyWztYGB7BnipE+TcpqC2k4
         wQuh3Psr3xV1WLN/2tUNkbLcU4HnOqXBZC0xTD1b9YmlIgIZcNrDZp+vCJbVBu0wQENg
         JyVlMY2mZj1VFYKR6KVRzjnGU+eXCMNC9S8lgnWbErHJkkth0WmkXWWWWc61BUWsPPVB
         Xe1VkZWmowJ/1X2D+2/TqrnS/brWKzivN3VMNxac1YGIVqfQWJJiFULeLfkled+JKOuX
         yljPvZOPXQakHE+ek08Sjs9w+CXxbvfzRXqHnuKs1S+VpOPXmpGHy6zdICmHDDRBMg5y
         ylrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547953; x=1709152753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eipxZHn8LM+VAi4nA4EI5Au/zWsPAyrD5bcMcrKHeO0=;
        b=nPFxMPuehHVPYMY4DI0X1hyodmfVOCvE2Hwckfq4jYu+aS3R7utizHfC9G7n/Tw4jw
         J8BTRFv2a7lLnvF3FEUTEdN4BkKMuzAZSfJB51zbUgUOqc7ckrj8g3YGUJGFx8b3CRMF
         IW8JlwhNwgVTopGsrOVoBZslIWp9JWc+QioNwCR+UgvBl7KNqAfZxcfFP1FXXXNjFmVC
         3NQxhQpZioVs8fAyfcfLH48Cz0rqAKmX9FiyzS82i2qb5rTwyHqNxl7UMAt/a6vcPDfB
         0+c7V3tSnT2guUgoVasXe+GTc8TPYMJsk3uqSciihHnL6sqsltnkuaAi2gyYp3RK8uOE
         HqSw==
X-Gm-Message-State: AOJu0YwUyLQeXU5wVjdkRe6cjiYTNsqx8Se82ovEvLcSMVqiLVvaFEEm
	8ueD476L1WtapMrYfyZZKxuwK5sXGlFtNMfGI1LqUe6QN2GMSw3b4nqFuJRH4AxrS16gsO+O+oe
	DUjWe1SE7omGiJj2BWzppAoc/6zk=
X-Google-Smtp-Source: AGHT+IHXv0Kglyt4ud04MC7tlhl266BNnFeO4n0Fp62kiPpklnRHVRXJfMjOhlRc9oFWkv0R9ibqkV+KajrrkMbjjmI=
X-Received: by 2002:a05:6870:3311:b0:21e:80a1:315d with SMTP id
 x17-20020a056870331100b0021e80a1315dmr16741692oae.4.1708547953300; Wed, 21
 Feb 2024 12:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20240221184624.3000696-1-jan.vermaete@gmail.com>
 <CAMKF1soThiXQmUDvfQhti=NXDvFEUQ_i126TyEZ1oyxZzeuJrw@mail.gmail.com> <CABF_=yi+=U+Q1kduwrwUt32Rt+5S3vZ76DyH65pqjug-32h_tQ@mail.gmail.com>
In-Reply-To: <CABF_=yi+=U+Q1kduwrwUt32Rt+5S3vZ76DyH65pqjug-32h_tQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Feb 2024 12:38:47 -0800
Message-ID: <CAMKF1sq1CiJ2sdHx6oiu3UJUwbDdCT+d+Bba0oxak6gVhyF+OA@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] netdata: version bump 1.43.2 -> 1.44.3
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 20:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108971

On Wed, Feb 21, 2024 at 12:34=E2=80=AFPM jan vermaete <jan.vermaete@gmail.c=
om> wrote:
>
> Hi Khem,
>
> I was using the latest version of oelint-adv to check the recipe.
> I had this warnings:
>    netdata_1.43.2.bb:15:error:oelint.vars.srcuriappend:Use
> SRC_URI:append otherwise this will override weak defaults by inherit
>    netdata_1.43.2.bb:18:error:oelint.vars.srcuriappend:Use
> SRC_URI:append otherwise this will override weak defaults by inherit
>
> If you prefer I can make a v2 of the patch without it.
>

lets consolidate all under one SRC_URI, I don't see a pressing reason to ha=
ve
each file added individually to SRC_URI here.

> On Wed, Feb 21, 2024 at 8:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Wed, Feb 21, 2024 at 10:46=E2=80=AFAM Jan Vermaete <jan.vermaete@gma=
il.com> wrote:
> > >
> > > And fixed a few minor oelint-adv warnings in the recipe.
> > >
> > > Tested on Raspberry PI 4
> > >
> > > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > > ---
> > >  .../netdata/{netdata_1.43.2.bb =3D> netdata_1.44.3.bb} | 12 ++++++--=
----
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >  rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb =
=3D> netdata_1.44.3.bb} (92%)
> > >
> > > diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.b=
b b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > > similarity index 92%
> > > rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> > > rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > > index 28e82dac3..8eeb61f66 100644
> > > --- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
> > > +++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
> > > @@ -5,17 +5,17 @@ HOMEPAGE =3D "https://github.com/netdata/netdata/"
> > >  LICENSE =3D "GPL-3.0-only"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc9b848046ef54b5eaee60719=
47abd24"
> > >
> > > -DEPENDS +=3D "libuv util-linux zlib libyaml json-c"
> > > +DEPENDS +=3D "json-c libuv libyaml util-linux zlib "
> > >
> > > -SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${P=
V}/${BPN}-v${PV}.tar.gz \
> > > -"
> > > -SRC_URI[sha256sum] =3D "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059=
f1b5ced75a44f74afc4d"
> > > +SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${P=
V}/${BPN}-v${PV}.tar.gz"
> > > +
> > > +SRC_URI[sha256sum] =3D "50df30a9aaf60d550eb8e607230d982827e04194f7df=
3eba0e83ff7919270ad2"
> > >
> > >  # default netdata.conf for netdata configuration
> > > -SRC_URI +=3D "file://netdata.conf"
> > > +SRC_URI:append =3D " file://netdata.conf"
> > >
> > >  # file for providing systemd service support
> > > -SRC_URI +=3D "file://netdata.service"
> > > +SRC_URI:append =3D " file://netdata.service"
> >
> > why do we need to change +=3D to append here ?
> >
> > >
> > >  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/tags"
> > >  UPSTREAM_CHECK_REGEX =3D "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)=
*)"
> > > --
> > > 2.39.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#108968): https://lists.openembedded.org/g/openemb=
edded-devel/message/108968
> > > Mute This Topic: https://lists.openembedded.org/mt/104494299/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

