Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5E9C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:01:06 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.4322.1683064863704490992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 15:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iWRjO5LE;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-187af4a5453so1924455fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683064863; x=1685656863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOUpuQSkQO3cEo2ejYHnnzdYlVPXnE7xuMte2lPNwIM=;
        b=iWRjO5LED61eNt1cMm0JSHrujIpFK+8HBYl6U+i9ujmcx8rasECTFmxyIe5Y+kk4eS
         9WOqNbCCAZHfC5Jiv6Z36CNzl2HFY1vTZ4RxOBnaq6zApkConnn4rrvWvKcvCf8vVBnb
         ZZ5fpn1jOYu/tu37Nv+HuyK6kYqXR5UFUqNi06UKNaKFJaU3DZjHiDxI2cXPucrSGSYV
         xQCMr2MT89Mem1xUIY7n/9rKb5MYzdmiU/LGWgqym1Ee1eM7pG/GFEjVgSTLSNUjiQI+
         rIs81FCVpQyxLFzLOpphFywGGj8f9+ze7cU228MfPpyNK+H1H7vk4sJXO2bkWR5hAukm
         Q/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683064863; x=1685656863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOUpuQSkQO3cEo2ejYHnnzdYlVPXnE7xuMte2lPNwIM=;
        b=RIJF+iE06Qmx4sNaKms5sLVA8VKh1ByzynYvRJTN+3whvHhe7nDGvp1QjeX/XD9XS9
         AnFCfp2ppVWj8RwA5M0WBSlysSohQ/8WKd+qYQHrf57xdAVS0mCLap+jIkZkdZRImPUb
         DTiulHWLBhV8/NQJKpw36F4c7mFArIgrsNpgyH/FZ0chzs9Zviz1mVb6pGcZ5J+iJgWk
         63h5ILJLSA/TqWZywWwoStGEfa/M/R32Wv9GKRUFnnUW0yc5zIvJuRfLK8BTQA/v1p8a
         J47Kf9v+L2nMV7oStv03/NnTvcQyW4A03tzSG/SjCrui/BSYL8PSorIlPfJT9fFJJ0o6
         0zzg==
X-Gm-Message-State: AC+VfDwPU4i8+ovGh1bhmTENtTttnCoOJZ3a03TwY5RRBCP+RTcpiB4+
	/qXUMqRZqPp7nzq01J718mBOU2B1F9xY3Npb+TM=
X-Google-Smtp-Source: ACHHUZ64ZP94FdPTO/lZq+S0yDAY1vA1jgT51n0ppvG/PL0gS1aYI2iPe/Su28RL9HcIQWCtReDF6DXSyseYxAVmRaY=
X-Received: by 2002:a05:6870:3a0a:b0:18e:e9cd:5856 with SMTP id
 du10-20020a0568703a0a00b0018ee9cd5856mr9275973oab.36.1683064862778; Tue, 02
 May 2023 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com>
 <20230502165005.880470-2-tgamblin@baylibre.com> <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
 <CAMKF1sp_P098oaCBZvuhsUtPBgUmMaF30-fdrzaZfOWRRsz0XA@mail.gmail.com>
In-Reply-To: <CAMKF1sp_P098oaCBZvuhsUtPBgUmMaF30-fdrzaZfOWRRsz0XA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 15:00:36 -0700
Message-ID: <CAMKF1srjJhgwReg=N-YKs3No1Em7yztqr7eY1N-s7ySN=diVSg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 22:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102282

nm cleaned tmpdir it builds and runs ok

On Tue, May 2, 2023 at 2:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> ah nm, I needed your patches for oe-core as well which upgrades
> hatchling to 1.14.x but it still fails to build let me see what could
> be going on.
>
> On Tue, May 2, 2023 at 2:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > I think it needs python3-hatchling or native variant of this. It fails =
to build
> >
> > | ERROR Missing dependencies:
> > |       hatchling>=3D1.14
> >
> > On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@baylibr=
e.com> wrote:
> > >
> > > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ---
> > >  .../python/python3-platformdirs/run-ptest     |  3 ++
> > >  .../python/python3-platformdirs_3.5.0.bb      | 35 +++++++++++++++++=
++
> > >  2 files changed, 38 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-platf=
ormdirs/run-ptest
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-platf=
ormdirs_3.5.0.bb
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-platformdirs=
/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-p=
test
> > > new file mode 100644
> > > index 000000000..b63c4de0d
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-pt=
est
> > > @@ -0,0 +1,3 @@
> > > +#!/bin/sh
> > > +
> > > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\=
]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED=
/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pri=
nt}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > > diff --git a/meta-python/recipes-devtools/python/python3-platformdirs=
_3.5.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.=
bb
> > > new file mode 100644
> > > index 000000000..b5ff369d0
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.=
bb
> > > @@ -0,0 +1,35 @@
> > > +SUMMARY =3D "A small Python module for determining appropriate platf=
orm-specific dirs"
> > > +HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
> > > +LICENSE =3D "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8=
723d17a"
> > > +
> > > +SRC_URI =3D " \
> > > +    git://github.com/platformdirs/platformdirs.git;branch=3Dmain;pro=
tocol=3Dhttps \
> > > +    file://run-ptest \
> > > +"
> > > +
> > > +SRCREV ?=3D "dcb56802714f5570236c86d03773ff881be6e39f"
> > > +SRC_URI[sha256sum] =3D "7954a68d0ba23558d753f73437c55f89027cf8f5108c=
19844d4b82e5af396335"
> > > +
> > > +inherit python_setuptools_build_meta ptest
> > > +
> > > +DEPENDS +=3D " \
> > > +    python3-hatch-vcs-native \
> > > +    python3-setuptools-scm-native \
> > > +    python3-toml-native \
> > > +"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +RDEPENDS:${PN}-ptest +=3D " \
> > > +    ${PYTHON_PN}-appdirs \
> > > +    ${PYTHON_PN}-pytest \
> > > +    ${PYTHON_PN}-pytest-mock \
> > > +"
> > > +
> > > +do_install_ptest() {
> > > +        install -d ${D}${PTEST_PATH}/Tests
> > > +        cp -rf ${S}/tests ${D}${PTEST_PATH}/
> > > +}
> > > +
> > > +BBCLASSEXTEND =3D "native"
> > > --
> > > 2.40.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#102266): https://lists.openembedded.org/g/openemb=
edded-devel/message/102266
> > > Mute This Topic: https://lists.openembedded.org/mt/98643291/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

