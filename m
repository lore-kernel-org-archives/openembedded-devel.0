Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCD7CD8CAC
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 16:19:21 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.95805.1696954753629684625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 09:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PwEdH6Zs;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso31666b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696954736; x=1697559536; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rz+D9MtU57/8JvhZwZECKUv7AA5rgPMZu2CttNB7ik=;
        b=PwEdH6ZspvUEZCq0xQo/i1f//VIZy3ih+N99FO6nFSI2LBRNCKiFpUXJnKRBV4xbI6
         PjeELQWNbuFS50h11bBd6BciTayg6I0K9BTaDXAkDNzNr+fh/6NWUkreSqYBBgEbd0wN
         GMBJjBYAQzuSauQxCqhyiEvyqjyADqNfY3nt9SuSDu1hfr5XgSsnMHy2p6XRoNyOJglh
         nYnaYh300ESjXSEmpqVpjNc38qQBliwz7iUEdV85tUnLIR6MumF6iZt/ktgROxVK/IAP
         NaqHs+WrdpV6kztg4qdTmuVb/ZPGZZKOFMAIyDlGnwE1jJhkgBueB8ohOcuNR9T4Wb8j
         6gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954736; x=1697559536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rz+D9MtU57/8JvhZwZECKUv7AA5rgPMZu2CttNB7ik=;
        b=hJj+GiNq1fJZglJ1bgrAYhh0/HzBeNcTqAji1DizfSaB5UxlNQs8+tS+7el0VrifsM
         xvPCpcWBba25/Wya/Wq7MDnOhar7m4M/X+SyYs5sxtITNqWyILP7i6VranhP1D0Z1dx/
         20U6ABHz3F3wpQVEgPRbe0qat53k24kOG6xU/Gw095Itt8u4MxgZwkMAIvy/8IXYwbn+
         pBo9NXiuG+LmaFL6p5Z/8lufriijbizq37ivsoLJhCEVQrWkinqCLF22CWNrbPSJi6IZ
         IHbuorY5qm470CdPSb7PiSXErvGF5HfkuZq9SX+vF93Voaots/yWI6D0+L6udvJlPzbQ
         Sxgg==
X-Gm-Message-State: AOJu0YzwYudD2z3LnVc6axCPrvqHRWJpKEUSt2ZdbfA+SZxVkA8ytbui
	G0DvMmqQmvR0aL8dy2udHyOGZMkK1rVFJOBaoGQvEg==
X-Google-Smtp-Source: AGHT+IHZRBgTCU2vpWT+PgjeuBg1MB4OBkLCKO+sCMkfhvS0d+ADT8T93ZuChaPDz2tsD2coSbLV9Q8AHjpdZmwK9NE=
X-Received: by 2002:a17:906:31c1:b0:9b6:d20d:8a46 with SMTP id
 f1-20020a17090631c100b009b6d20d8a46mr13783792ejf.6.1696954736531; Tue, 10 Oct
 2023 09:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231010160932.1711687-1-yoann.congal@smile.fr> <CAMKF1so4-2Y1LSjHqYRFgnyDqysAnbrrwyHU4f52U2hw0SdjhA@mail.gmail.com>
In-Reply-To: <CAMKF1so4-2Y1LSjHqYRFgnyDqysAnbrrwyHU4f52U2hw0SdjhA@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Tue, 10 Oct 2023 18:18:30 +0200
Message-ID: <CAMSfU+5TNjrD0ojBshSJTmTM_obynJah_DRgqUpu2r3MEWw1SA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rapidjson: add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Mickael RAMILISON <mickael.ramilison@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 16:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105411

Le mar. 10 oct. 2023 =C3=A0 18:14, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :
> Thanks for this patch, I am wondering what those 8 fails are and if we
> can perhaps fix them or add them to known failure list.

We (as a team) may lack the time to really fix the tests but "add them
to known failure list" while taking note of coming back to it will be
feasible. I'll look into this.

> Then add it to
> PTESTS_SLOW_META_PYTHON or PTESTS_FAST_META_PYTHON depending upon how
> quick it takes to complete. So we can track regressions
> regularly.

The test is under 4s (under qemu x86-64 kvm), This would be FAST I guess.

Thanks!


>
> On Tue, Oct 10, 2023 at 9:10=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
> >
> > From: Mickael RAMILISON <mickael.ramilison@smile.fr>
> >
> > Signed-off-by: Mickael RAMILISON <mickael.ramilison@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > Note:
> > As of now, the ptest shows:
> >   Testsuite summary
> >   # TOTAL: 940
> >   # PASS: 913
> >   # SKIP: 17
> >   # XFAIL: 2
> >   # FAIL: 8
> >   # XPASS: 0
> >   # ERROR: 0
> >
> >  .../python/python3-rapidjson/run-ptest        |  3 +++
> >  .../python/python3-rapidjson_1.11.bb          | 20 ++++++++++++++++++-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-rapidjs=
on/run-ptest
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-rapidjson/run-=
ptest b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
> > new file mode 100644
> > index 000000000..8d2017d39
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-rapidjson/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest --automake
> > diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.11=
.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> > index 930ad3434..3ea559488 100644
> > --- a/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> > +++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.11.bb
> > @@ -9,14 +9,32 @@ SRCREV =3D "e1b41f64df1705770b7b70d7221a4812909c1d0f"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -inherit setuptools3
> > +# Inheriting ptest provides functionality for packaging and installing=
 runtime tests for this recipe
> > +inherit setuptools3 ptest
> >
> >  SETUPTOOLS_BUILD_ARGS +=3D " --rj-include-dir=3D${RECIPE_SYSROOT}${inc=
ludedir}"
> >
> > +# run-ptest is a shell script that starts the test suite
> > +SRC_URI +=3D " \
> > +    file://run-ptest \
> > +"
> > +
> >  DEPENDS +=3D " \
> >      rapidjson \
> >  "
> >
> > +# Adding required python package for the ptest (pytest and pytest->aut=
omake report translation)
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +    ${PYTHON_PN}-pytest \
> > +    ${PYTHON_PN}-unittest-automake-output \
> > +"
> > +
> >  RDEPENDS:${PN} +=3D " \
> >      ${PYTHON_PN}-core \
> >  "
> > +
> > +# Installing the test suite on the target
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +}
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105409): https://lists.openembedded.org/g/openembed=
ded-devel/message/105409
> > Mute This Topic: https://lists.openembedded.org/mt/101878478/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS - Tech expert

