Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63705C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:33:25 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.88373.1747171997905382033
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 14:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czuphtgZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c173211feso1650004a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747171997; x=1747776797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gnDb9Fhal2xcWkttylDFPWmQZqJm4tFaWPg3OKYME4=;
        b=czuphtgZxffb+S2Cgq82vFXdyGVzJbJYINceT7fdrPBInkXsjTCXv6+mVIGoBGsyIT
         bDUgSBjLjM13aa2iacAseRfCohRzQzbu0HjB+gkm+K/d3FULqwaZi9Zek91SycbNbSlO
         ClKcT0CpAKHTLAlwVCMCkdNfup9v9AYg8lISb6C/lFfxCuZpnDCiV9s2d7/cWI4A3cxL
         Vy0+HNP8XzvIklci9OV7dOtaTJ5TMji1KfX8x5uYz91OAwC1iDiyZgKdzxWl895kjjNa
         oWl8sCEtSBezSe22pAQ0TgkZhRc2F1zBPdw70N9JFI4rozb+Shrc+UFITvf5sbXMbOLi
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171997; x=1747776797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gnDb9Fhal2xcWkttylDFPWmQZqJm4tFaWPg3OKYME4=;
        b=Ro0YM8mYGmX9bizTYCM3arfKktNL6WmQqE1ZiZaMkQK8LUbCRQL/CylLLiAj8+UyW1
         pMetUxGadgXsYgO9ifglQZuMbB3uJ5dWxtyGNeiCW4tyfd+oUBzcAgfckllpEEjortVK
         fkPr8NIpqgOcqTl7cHomF4UOnp/ef9D+GAJ4c1548Nag8hUzGn3GWsTwGfH56nAJSjrv
         /32k0STiil1LIkgNMvBZhOIscRvRFrlqzrcXUAQc82x5EexhGLQzIPUfPVnQL+3EueSm
         dsdY7xYOiFc8IxwdWXbAJFPBHLZGt08jURGmbxt7+dOx6tQ1XxINh10wmCjrg7ghLfDq
         c/TA==
X-Gm-Message-State: AOJu0YytaB+InNyC8+5XRpKLl8QnD/o2Nm4Nt7XzPSS+40DKiA1mANLd
	BAm+/sdovblb0tcyGTDVc3pSJF2JRIvsLOMbMd8WTCcJYvtQMUIYiERXRDs4tk2oAvC3wLI2PCa
	GU8CYeZP4+8fJeMaIXmhdzYVtZTodTo9g
X-Gm-Gg: ASbGnctITEGwHIUVEb9v9/8PpNEukxcT8ZR+RRRnvcMmMyEttQbjYY863BAnqi2Uk4z
	0C8P4EzBDBvu2sxb32NtTEcEZcCdVIudyYY2C11K/Zo6kwD9FFbfxCcNnU7nx26ISF+2loBzb+B
	gW1ewDKsp+2+a+uDsJalv+7TfDzWiecLU=
X-Google-Smtp-Source: AGHT+IFO3ujRyGiLA1LIh+wYa/yijSEGgZgVagm7GSN4QF5RvHi95pRVH63hYozlvnfThqLyXTj70njsTQHaeM8lKF0=
X-Received: by 2002:a05:6830:6615:b0:72b:9724:6a82 with SMTP id
 46e09a7af769-734e156fca8mr519509a34.17.1747171997035; Tue, 13 May 2025
 14:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250513060149.3971753-1-dmukhin@ford.com> <CAMKF1srPZJ7=AmVVyp6Y7b3AsJAy4jjqeV+iaOgApF0phXmOxA@mail.gmail.com>
 <aCO3yr77yzsKCylq@kraken>
In-Reply-To: <aCO3yr77yzsKCylq@kraken>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2025 14:32:50 -0700
X-Gm-Features: AX0GCFubGjTpt-RDMKRKlWXp5LBHp74hhQlVH4hoPVSbFC42_L-Mxd8bqU5CiKA
Message-ID: <CAMKF1sqUkLq6MJgx-E2n5UZRhQ6E0yaD5aXx=51KXcMPU27FJQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v1] dediprog-flasher: enable native builds
To: dmkhn@proton.me
Cc: openembedded-devel@lists.openembedded.org, tymoteusz.burak@3mdeb.com, 
	Denis Mukhin <dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 21:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117408

On Tue, May 13, 2025 at 2:21=E2=80=AFPM <dmkhn@proton.me> wrote:
>
> On Mon, May 12, 2025 at 11:40:18PM -0700, Khem Raj wrote:
> > On Mon, May 12, 2025 at 11:04=E2=80=AFPM <dmkhn@proton.me> wrote:
> > >
> > > From: Denis Mukhin <dmukhin@ford.com>
> > >
> > > Update dediprog-flasher recipe to support native class variants.
> > >
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > >  .../dediprog-flasher/dediprog-flasher_1.14.20.bb      | 11 ++++++++-=
--
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.=
14.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > > index 83a88ab75f..4c6d6bf6f1 100644
> > > --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.b=
b
> > > +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.b=
b
> > > @@ -12,18 +12,23 @@ SRC_URI =3D " \
> > >      file://0002-Makefile-add-conditional-stripping.patch \
> > >      "
> > >
> > > -EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> > > +EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
> > >
> > >  PV =3D "1.0+${SRCPV}"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -do_install () {
> > > -    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
> > > +do_install() {
> > > +    oe_runmake install
> > >  }
> > >
> > > +# NB: /etc/udev/rules.d is packaged outside of ${prefix}
> > >  FILES:${PN} +=3D " \
> > > +    /etc/udev \
> >
> > Please use ${sysconfdir} here instead of hardcoding /etc
>
> nativesdk variant of sysconfdir expands to something like:
>     sysconfdir=3D"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-m=
ysdk-linux/etc"
> where
>     prefix=3D"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-mysdk=
-linux"
>
> dediprog build installs USB udev rules into the host's environment
>     /etc/udev/rules.d

i think its not a good idea to inject things into the host
environment. This can alter
the behaviour of SDK host which is not desired. Is there any other way for =
it
to register with udev ?

> i.e. packages udev rules outside of ${prefix}.
> So in this case /etc/udev should be open-coded, which is not ideal.
>
> I can expand the comment before FILES:${PN} to explain that better.
> Will that work?
>
> >
> > > +    ${bindir} \
> > >      ${datadir}/DediProg \
> > >  "
> > >
> > >  inherit pkgconfig
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.34.1
> > >
> > >
>

