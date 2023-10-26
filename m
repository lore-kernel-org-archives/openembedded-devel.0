Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B402C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:11:08 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.204507.1698336667493345099
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nI22A4IX;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ead2e6fab7so687427fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698336667; x=1698941467; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dSLtKNFXGcSXgkdfvaUeAUSSC7u5wjyoy9fhPtuCyo=;
        b=nI22A4IXyeeUjfRQOOl+VmWYoQc5ZE3unjKmiyJWlz0LpnQ1hKsohui/S8FvctYZqG
         mq712/qgxEZFqmju5TlRE4d0qko9i0FuKTnCZElfi1h4rDSNQHCkPz43L5DJUvur9/dz
         q/9mbJoDNyvRcWm5feeKRGWG6L9YldwfSeJJxOoxWIrjjPCiZ8d+pat+Ip0/2nj+sEcx
         ZE517D+K45mIg6fIJ6jnJb0JKdWOc1tpSEKi5ZGxvLrUb6tFqEQ8zJQ15oNXTDjX3b5z
         ZOoT3D46Y3IZJaZB5H1qRX371fWzaUuLSCZ7X6lEZTnl6pSmHsXSMOBr0T215nwpkpsQ
         Runw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698336667; x=1698941467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dSLtKNFXGcSXgkdfvaUeAUSSC7u5wjyoy9fhPtuCyo=;
        b=VFlY30JIPyhku/LMVVthfjFYB8GkVq9BwYXM+M5OU9DDa5yf/RyQrNLmn1jJKV3wer
         fDog70rbkuBE4LUHXftCKtlHp6t2mR5TJjnMEMFkmAyD3pBnf+Ag0MbrOqM8/w3FF9GI
         pjtQi+aJ4xK8bT6dXqmsfpmL5AEoa74L8BJfjf3O3hZfOk0JPuP0f8CqUe/t2durPLjc
         k+gubAh6xmjwe744avBDNbrv5w776WYwSMaZhUFZwbcEs+ZjshDa0a2bbeqiFen3ANqj
         I5BNM0KC8tWMBT4cxSoxPmjtuiisgKJNg5XZ9dnKZDuUMVGlDKYcUctMVvYlx0KHZ1RP
         KXRg==
X-Gm-Message-State: AOJu0Yw9RVq9PxLRLz+1bJR59K9xrnUWUFQbFz6XX4IxIbcMrYv0J2Qt
	glCSqD+WRj16rN9/f/90XqjLopnYUlYIztyVrCk=
X-Google-Smtp-Source: AGHT+IHGGwJ1WMDh3LafGdIoriWtxarqWxlOEvALfYsaYhbwl/Hjtjg8lilmyww/UPVOgHGGAjcPGD0lPmS6g+fdoFU=
X-Received: by 2002:a05:6870:4615:b0:1d0:e372:6c2d with SMTP id
 z21-20020a056870461500b001d0e3726c2dmr58628oao.0.1698336666675; Thu, 26 Oct
 2023 09:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com>
 <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de> <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
In-Reply-To: <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Oct 2023 09:10:40 -0700
Message-ID: <CAMKF1spjcfc8Z0ZOvSifKKgNUNPv5mfy1TMVf23vq2tNfbZKYw@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>, 
	Jose Quaresma <quaresma.jose@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 16:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105756

On Thu, Oct 26, 2023 at 8:26=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Thu, Oct 26, 2023 at 7:16=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@na=
vimatix.de> wrote:
> >
> > On 26.10.23 10:34, Jose Quaresma wrote:
> > >
> > >
> > > Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu no
> > > dia quarta, 25/10/2023 =C3=A0(s) 18:18:
> > >
> > >     I wonder if something like below would help
> > >
> > >     diff --git
> > >     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > >     <http://make-mod-scripts_1.0.bb>
> > >     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > >     <http://make-mod-scripts_1.0.bb>
> > >     index 2cff48c39c3..6133721334c 100644
> > >     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> > >     <http://make-mod-scripts_1.0.bb>
> > >     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> > >     <http://make-mod-scripts_1.0.bb>
> > >     @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
> > >
> > >      do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
> > >     openssl-native:do_populate_sysroot"
> > >      do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodule=
s"
> > >     -
> > >     +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sy=
sroot"
> > >
> > >
> > > This doesn't solve the problem because at compile time the openssl is
> > > already there on native sysroot
> >
> > How about a patch like this:
> >
>
> I proposed something similar in the earlier threads on this topic (it
> has been around for quite some time, and is in bugzilla for oe-core)/
>
> I ran into issues with some kernel versions, but we may have moved on
> far enough that it is no longer an issue.
>
> static linking is another option, but it runs into some autobuilder
> issues with distros that don't have a static libc.

right, I do like the idea of static linking sadly it does add a host
dependency of this nature.
unless you add a dependency on native glibc but it gets heavier on
dependency tree

>
> Bruce
>
> > ```
> > diff --git i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.=
bb w/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > index 0e420a25d9..182abd0233 100644
> > --- i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ w/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -18,6 +18,10 @@ RDEPENDS:${PN}-dev =3D ""
> >  DEPENDS +=3D "bc-native bison-native"
> >  DEPENDS +=3D "gmp-native"
> >
> > +BUILD_LDFLAGS =3D+ "-L /build/tmp/sysroots-components/x86_64/openssl-n=
ative/usr/lib \
> > +       -Wl,-rpath-link,/build/tmp/sysroots-components/x86_64/openssl-n=
ative/usr/lib \
> > +       -Wl,-rpath,/build/tmp/sysroots-components/x86_64/openssl-native=
/usr/lib"
> > +
> >  EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLA=
GS}" HOSTCPP=3D"${BUILD_CPP}""
> >  EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_=
LDFLAGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
> >
> > ```
> >
> > Regards
> >
> > J=C3=B6rg Sommer
> > --
> > Navimatix GmbH
> > Tatzendpromenade 2
> > D-07745 Jena
> > Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> > Registergericht: Amtsgericht Jena, HRB 501480
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

