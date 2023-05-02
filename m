Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A9C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:58:15 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.4183.1683064686139947224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 14:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=U0ITxRIt;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-38eb2984c82so1524314b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683064685; x=1685656685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xUZSstrghRpnYCJsGUoXbTYd0TRCuS5+e9H63PMudw=;
        b=U0ITxRIt9OfQgsRDZR0aD46fA6T3i2oOvMfoyCg2tHvSYnGPTlRXYseAVmpxBGV75M
         jZhgwR2Rt8QmETMPOSc4Tpg8pSpRAFGEtDa7Ucu7Z8PGg9kK7zwoFBX3hFKwUWmViw5P
         byfRyWKIEk125/VaJDNK7eT/gR5Cdhwx4QJD42NhzmsPC43VEr2IoOdL8bZOdAitT4Fg
         p/WF5YlS6ocyEU2uAaq+TVq0wRZiCYYRyD4hWK86vx3Eg04HPKJTAa806DG1KCQlZlnr
         tO1RGT3lbLAX/AHaQrLZNflUkLTVEFdUvtwgWwrFl5+0LpT9c9qb6JQAivGGzxdhKwTc
         Nl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683064685; x=1685656685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xUZSstrghRpnYCJsGUoXbTYd0TRCuS5+e9H63PMudw=;
        b=XVTaA9fmy4iXNMR5OzSS/boYSq449YcObDHbmuluWlbP4C14RMyyiUbuyezafb5nHM
         B5l3UOH7v+eFfFIs1DiSbRdT7qvTvqPpXqak7miA0Pqwvx3QWc/OYPfjjwq4uXbdt2IL
         zBqe9T/E2Yi85m+gHq0ZZokTWbxEIp4oWADmbxhH24xZa5gAW7XFwt0sk2CwoB/PDRbO
         o7PkM0f6VP7j8S+vgBDT/6BChnirMuhZgqou9tkJdbOF4gCF8Q+tTj4hPCtQLeIimizu
         F/AJnG5424u8YlNwRZ7mgY55UnL0AA7eV04glfbvWfsEpcxLOIR+v9/ExkaXprrS5ElV
         1Fdg==
X-Gm-Message-State: AC+VfDyYiQxpyGnBvWdsOI3eSSsxSbn4jmUKjwiy6GtL3FgGUnLqR1iQ
	V211t/W8Eos9FUxmtcgHS3N3Kq/8B9MpZAc1neg=
X-Google-Smtp-Source: ACHHUZ57zetGHdG4Qtl8syrqKYVrCbj/LEio8RhSvNyczlJy9QoIcpRgeDVWH2YhfJEnk12SPGSDujTyKsnEn3VGO6M=
X-Received: by 2002:aca:f19:0:b0:389:4f86:205e with SMTP id
 25-20020aca0f19000000b003894f86205emr8468167oip.9.1683064685212; Tue, 02 May
 2023 14:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com>
 <20230502165005.880470-2-tgamblin@baylibre.com> <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
In-Reply-To: <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 14:57:39 -0700
Message-ID: <CAMKF1sp_P098oaCBZvuhsUtPBgUmMaF30-fdrzaZfOWRRsz0XA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 21:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102281

ah nm, I needed your patches for oe-core as well which upgrades
hatchling to 1.14.x but it still fails to build let me see what could
be going on.

On Tue, May 2, 2023 at 2:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> I think it needs python3-hatchling or native variant of this. It fails to=
 build
>
> | ERROR Missing dependencies:
> |       hatchling>=3D1.14
>
> On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
> >
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> >  .../python/python3-platformdirs/run-ptest     |  3 ++
> >  .../python/python3-platformdirs_3.5.0.bb      | 35 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-platfor=
mdirs/run-ptest
> >  create mode 100644 meta-python/recipes-devtools/python/python3-platfor=
mdirs_3.5.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/r=
un-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-pte=
st
> > new file mode 100644
> > index 000000000..b63c4de0d
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptes=
t
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || =
$NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print=
}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3=
.5.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
> > new file mode 100644
> > index 000000000..b5ff369d0
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
> > @@ -0,0 +1,35 @@
> > +SUMMARY =3D "A small Python module for determining appropriate platfor=
m-specific dirs"
> > +HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d872=
3d17a"
> > +
> > +SRC_URI =3D " \
> > +    git://github.com/platformdirs/platformdirs.git;branch=3Dmain;proto=
col=3Dhttps \
> > +    file://run-ptest \
> > +"
> > +
> > +SRCREV ?=3D "dcb56802714f5570236c86d03773ff881be6e39f"
> > +SRC_URI[sha256sum] =3D "7954a68d0ba23558d753f73437c55f89027cf8f5108c19=
844d4b82e5af396335"
> > +
> > +inherit python_setuptools_build_meta ptest
> > +
> > +DEPENDS +=3D " \
> > +    python3-hatch-vcs-native \
> > +    python3-setuptools-scm-native \
> > +    python3-toml-native \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +    ${PYTHON_PN}-appdirs \
> > +    ${PYTHON_PN}-pytest \
> > +    ${PYTHON_PN}-pytest-mock \
> > +"
> > +
> > +do_install_ptest() {
> > +        install -d ${D}${PTEST_PATH}/Tests
> > +        cp -rf ${S}/tests ${D}${PTEST_PATH}/
> > +}
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.40.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102266): https://lists.openembedded.org/g/openembed=
ded-devel/message/102266
> > Mute This Topic: https://lists.openembedded.org/mt/98643291/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

