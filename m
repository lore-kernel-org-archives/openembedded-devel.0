Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D17CDB47E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:50:03 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.26336.1697053802720550368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 12:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=el0sxWve;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d84f18e908aso227481276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697053802; x=1697658602; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4YKEIiGSYkwrvb2ZwvW++Kzs2+K/7ATa9tu9Abc2E0=;
        b=el0sxWvegWnOFYcFJFFTK0KVQveUrn+fcb8MXOd7+t/1+cmLBgEDV5GNC4td/fvXyw
         cwPJ72N6LttMHRNscEnbgcCM0lwXZtR3+v9hsMSiYdnw4TnUOikOwGyvUcOZ9VZ92ciW
         qyJXO3nxA70gOOMtO3RHwxIae5BqS4Z3Ig+h7bpNiwlEOXnBN/TUg7HOehXCuHCHcBRH
         9/7V+jhWJfkr6VxDMkuBr/Gd49T4ygtXn2WGR//+YvbWBFLvD113YlGOhBcyKli5tp6Z
         soIzTV3DZBow5jVgIN1yx9a2E+SHoHYoXw3rXoHL96g4siWWYovgfCv9ixQq4dFfJXlg
         gZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697053802; x=1697658602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4YKEIiGSYkwrvb2ZwvW++Kzs2+K/7ATa9tu9Abc2E0=;
        b=ic1jIvsKHRacKfwRNNw4TFUixzHxTj9gPPYmgdPKUCef9CDRn/IWmSMCI6CMUhRBt+
         cN1oc776ynS5mpS540QODEsQJGrXYOQ0FRjGwRoMm3JFROr4Wyiste3ofe3P6/mqlswz
         iO54xkvWjzmL4gcz0ZIyKIEWdo84uCf87GNKj1Hb+w0uyXLnythsc+3DsbluDH0fwNuz
         1iH4uhOr2k0iZxgaErlIMcLaW5Eb+zTPy+6bQGEcKasCT5v2Pdy7JV8/a1/brL3VwuRZ
         TqKCLmIvWQxWeW/9/FoZf3+PadSOavbOtk5W9+/mX2eXbkFFRusWQbmS/6hE1UzSNq7c
         tc8Q==
X-Gm-Message-State: AOJu0Yz9VYLgFDJpB0yDWfrcPPkZ/3UNQf2J0gk0fV5mbbfuMwvXM5uq
	Ljj5sBb99puqQ8vrq/IOF/fntgsvCRXYehJcdDw=
X-Google-Smtp-Source: AGHT+IG5v6gKFUhltkgk6uFmz0FJT7c1+fa1hiMH29F/OR9pZ2AO/LLzrkbDKXr95jMDlxhSobfIYwiVDT5V3UuYYXk=
X-Received: by 2002:a25:4110:0:b0:d7f:25c:b0ac with SMTP id
 o16-20020a254110000000b00d7f025cb0acmr19821711yba.65.1697053801851; Wed, 11
 Oct 2023 12:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231011190650.622937-1-daniel.mcgregor@vecima.com> <CAMKF1sozn5Bgw0Wb0dP9Atu8r7+V=M8jWiG=wQ6KHYGoWPDM-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sozn5Bgw0Wb0dP9Atu8r7+V=M8jWiG=wQ6KHYGoWPDM-Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 11 Oct 2023 13:49:50 -0600
Message-ID: <CACS+7ZQH=T0PcEwo5+zrMh5KQFB3HKeqLRM_rXveePpYo18Lyg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pylint: allow native build
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 19:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105439

Great. Though looking at the original message that I sent to the list
it's using the wrong author email address. It worked fine the other
day, so I wonder what I did differently. Should be the @vecima.com
address.

On Wed, 11 Oct 2023 at 13:33, Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for heads up. Armin is planning another downmerge from master
> which should cover this too
>
> On Wed, Oct 11, 2023 at 12:07=E2=80=AFPM Dan McGregor <danismostlikely@gm=
ail.com> wrote:
> >
> > We use pylint for some native recipes in our build. Allow pylint
> > to be a native recipe, and likewise allow its runtime dependencies
> > to be native recipes.
> >
> > Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> > ---
> >  meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb  | 2 ++
> >  meta-python/recipes-devtools/python/python3-dill_0.3.7.bb     | 2 ++
> >  meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb   | 2 ++
> >  meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb   | 2 ++
> >  meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb | 2 ++
> >  5 files changed, 10 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.=
bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> > index 2f80187b2b2..cdf6fc74edf 100644
> > --- a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
> > @@ -34,3 +34,5 @@ RDEPENDS:${PN}-tests:class-target +=3D "\
> >      ${PYTHON_PN}-unittest \
> >      ${PYTHON_PN}-xml \
> >  "
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb =
b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> > index b6b788110d9..673964f3b70 100644
> > --- a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> > +++ b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
> > @@ -15,3 +15,5 @@ RDEPENDS:${PN} +=3D "\
> >      ${PYTHON_PN}-profile \
> >      ${PYTHON_PN}-core \
> >  "
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.b=
b b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> > index a2c72fcc997..265b28a7715 100644
> > --- a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
> > @@ -9,3 +9,5 @@ SRC_URI[sha256sum] =3D "348e0240c33b60bbdf4e523192ef919=
f28cb2c3d7d5c7794f74009290f
> >  inherit pypi setuptools3
> >
> >  DEPENDS +=3D "${PYTHON_PN}-pytest-runner-native"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.b=
b b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > index 413e6599db1..bd2faa5b5af 100644
> > --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > @@ -48,3 +48,5 @@ do_install_ptest() {
> >      install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PT=
EST_PATH}/tests/.pylint_primer_tests/.gitkeep
> >      sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/t=
ests/data/ascript
> >  }
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1=
.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> > index e86a3c78981..59e83e00db7 100644
> > --- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
> > @@ -27,3 +27,5 @@ do_install_ptest() {
> >          install -d ${D}${PTEST_PATH}/tests
> >          cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >  }
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105436): https://lists.openembedded.org/g/openembed=
ded-devel/message/105436
> > Mute This Topic: https://lists.openembedded.org/mt/101903777/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

