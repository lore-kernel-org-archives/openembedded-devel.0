Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC38C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:15:03 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.307.1717096496781365232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WsFkUAY7;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d1c051a9e7so197783b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717096496; x=1717701296; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZeNo80eS77pirJ977hFVIIGHvenTaobX3jor6rcCT0=;
        b=WsFkUAY7k1Vj9X6CO1gcXdgsgzhBZtmM/3JCf+Qef7w7GZCXh2HhmNpMfXucrFszd3
         gZt4CykW1t2Dv7ToS5NvIt4ljyt1ohLKnNSx3aP4v6J0Ytvn7/Y9cjvjMBdizAc5F1BH
         imkd0swz1cetetDyNajhbasUxPXJZejQv7BtzhDmnFjkAEFyXsyC5FXk7qpCATWRzgqR
         Pb220+gSCNE1/gEWdme56RHSllinIc/RdnmkxA5sDuXOU4RI1HUAyrNYSDKXwpvkKWvp
         FGNtUpPNEebhsf9yYjBtP1904wF7GjqmeK+I869nRxGfsLBqfGEuiwaBvUGMaEQbYKre
         CXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717096496; x=1717701296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZeNo80eS77pirJ977hFVIIGHvenTaobX3jor6rcCT0=;
        b=nwsJbexVINnbNL3CnzkQEeudTXtW4NEs57GLx5upO4EpEuBnxIrOfSr00eAvwldM4u
         0GQ5cCmYBI9fad65feJVEXP41MNXB9RflpdWt3rQCzcSnKO6W3Gf/Tk4y3b4R3Y5HnGy
         sO1xy9C/YTHXsXVBYycCkSmOvmuAZ8+hTbdg2e316V67kdqb5hT4z0U9CtmS0jsx5kbY
         AvFMkIwAM56VFFYEP8iiEZn/82Yr7zMkh2JlhEoXbaQZ87IfdzvwqUEmgZycPKdPhwnO
         b3L/flZ3e9cKoSK2YNuKF1mwszfFzSQpczhwHHuyB1YX/WpwebvOeVsGPoZxCmlr5XZX
         jZpg==
X-Gm-Message-State: AOJu0Yz+lllnd7c1tXPaKgKhkL+OIAdrvhrk+MHGNxZjcYR4T/fFu0Oh
	fUus9F5kQXWfc24mu2XTE5gnwmr4lfiNANDfNuI9xkB5L/1U2D1qVXFwZNW0d7jrMuQ1CNDDpgE
	xV5rKFEmam3bJibuBVgRkcJP5RFoPEvHM3R4=
X-Google-Smtp-Source: AGHT+IF5tIemC6k1DPuM2oWklkVlVv6wf1d0IFo2mzLxZJ2k376kett5zXFlQyUm+tjIAZ+0thhzfhkuYbJ+56el2BY=
X-Received: by 2002:a05:6808:23d1:b0:3d1:e014:a8a7 with SMTP id
 5614622812f47-3d1e014aa41mr2153654b6e.3.1717096495853; Thu, 30 May 2024
 12:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <17D459C574195D27.22027@lists.openembedded.org> <CABF_=yh3jq-qrS_Z+SrQfxfQzZxTskpEM9D--YKhaKvGD+HK6Q@mail.gmail.com>
In-Reply-To: <CABF_=yh3jq-qrS_Z+SrQfxfQzZxTskpEM9D--YKhaKvGD+HK6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 12:14:29 -0700
Message-ID: <CAMKF1spcoqc4sHZSruJ=6Xgii3bT0BAzTje8UYK2+7JjRf7EKA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flask: add ptest
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110644

On Thu, May 30, 2024 at 12:13=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Question: should I add to the list in
> conf/include/ptest-packagelists-meta-python.inc?  Or will the
> maintainer do this?
> It took about 60sec in qemu on a slow machine.

yes please add it to fast section,

>
> On Thu, May 30, 2024 at 9:07=E2=80=AFPM Jan Vermaete via
> lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-flask/run-ptest   |  3 +++
> >  .../recipes-devtools/python/python3-flask_3.0.2.bb    | 11 ++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-flask/r=
un-ptest
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-flask/run-ptes=
t b/meta-python/recipes-devtools/python/python3-flask/run-ptest
> > new file mode 100644
> > index 000000000..8d2017d39
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-flask/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake
> > diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb=
 b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> > index 300ca99dd..99524b437 100644
> > --- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
> > @@ -8,10 +8,14 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa=
59c90c9c4a033c7574f8f3fb75"
> >
> >  SRC_URI[sha256sum] =3D "822c03f4b799204250a7ee84b1eddc40665395333973df=
b9deebfe425fefcb7d"
> >
> > +SRC_URI +=3D " \
> > +        file://run-ptest \
> > +"
> > +
> >  UPSTREAM_CHECK_URI =3D "https://pypi.python.org/pypi/Flask"
> >  UPSTREAM_CHECK_REGEX =3D "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
> >
> > -inherit pypi python_setuptools_build_meta
> > +inherit pypi python_setuptools_build_meta ptest
> >
> >  CLEANBROKEN =3D "1"
> >
> > @@ -23,3 +27,8 @@ RDEPENDS:${PN} =3D " \
> >      python3-profile \
> >      python3-werkzeug \
> >  "
> > +
> > +do_install_ptest() {
> > +        install -d ${D}${PTEST_PATH}/tests
> > +        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > --
> > 2.39.2
> >
> >
> >
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110642): https://lists.openembedded.org/g/openembedde=
d-devel/message/110642
> Mute This Topic: https://lists.openembedded.org/mt/106394805/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

