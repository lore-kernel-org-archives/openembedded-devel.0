Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946F2C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:40:23 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.32048.1703104818572609675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FjbgcWF3;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-20306782371so4381fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104818; x=1703709618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL/ThntlV4UZ+s8J54fCkfFPFhmKPIcWS0UtZsU00mQ=;
        b=FjbgcWF37OAXVW0lLmcU0CQC6s5/tZM3mwzOgN/pIPV8O0LBvc0v0x1QIhDEYfgfHT
         PKWa0yz9oRbPlusfksy0asAD5GzrTx8IAtNKMDRSDzOmuOad2BNEI1jOlO0l5VApJrLB
         k75tdaPEB1HxUcGhllQa66l64o64ihtI4RgH3C2vA+6WXQTgiNQaovheMUodmNUOYD5k
         ke+cW9hHWKYKt/gz83YJ++KJDzfbXFjeIo0AymleCIqwxttZZonPiUKZF/snmLV5pjav
         XT6+VDLGnHi5YICAmjuqtL7Gg0u41lay2qOoyjBIv/1vyzLBX+EBvs310aV0dH2mzyOb
         FbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104818; x=1703709618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL/ThntlV4UZ+s8J54fCkfFPFhmKPIcWS0UtZsU00mQ=;
        b=TkxD06zPJH5sLQ/dCGbY+rlUywoYHZJaTCogNFc0BbxJ5vdD6QJ2shYqKY4YHcQd6h
         xIdyOL/Jkk/TaBf6SeC8vUaBjhUsUgf6E7wXGqLYblWB8iQFHr30E+IFGFHIm4TnPXoI
         I1LAIOkse6LgrARdGgAWdW0inXojQmleyVjr53boXvKBqeryhl324yz56ppiuPw/o5B0
         L/pQY713bhMZKjPy3TnZov/nMoZaDHWD+zyL7Y6lxgeLvweCDlVMZc0Y3ZcJYHCb6mBF
         /8aX3g0FbxTK/K5xm4WgQzHp2TU6tHfAL3cwDYTDYJxIGR1ZR2j7NzVAgcPsEkkQh163
         JgpQ==
X-Gm-Message-State: AOJu0Yw6wfw/BQrmTO5Vudj512VKQTBDEBvThL0P/SIark/WWvMQMIxI
	LzaTNhS2gBMiEtX9KUWCO1imyQvWsTqAwIqbOdTABYjs
X-Google-Smtp-Source: AGHT+IER8YGfGJ+/yBv6gzvgieP2G4wrF2Y2qKSYOarjEPkLIk3uPLzedlSVErXLiqEfXKJuGnmR9dOycBXm0a8BDy4=
X-Received: by 2002:a05:6871:293:b0:1fa:fc32:f081 with SMTP id
 i19-20020a056871029300b001fafc32f081mr363111oae.25.1703104817816; Wed, 20 Dec
 2023 12:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20231220200805.27842-1-alex.kiernan@gmail.com>
In-Reply-To: <20231220200805.27842-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Dec 2023 12:39:51 -0800
Message-ID: <CAMKF1sqoYgpj7oMrOiKMd4pUv3POMjoc4040cVYx4Ytj=DUnCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] c-ares: Move to tarballs, add ptest and
 static support
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107668

On Wed, Dec 20, 2023 at 12:08=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../recipes-support/c-ares/c-ares/run-ptest   |  7 +++++++
>  .../recipes-support/c-ares/c-ares_1.24.0.bb   | 19 ++++++++++++++-----
>  2 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-support/c-ares/c-ares/run-ptest
>
> diff --git a/meta-oe/recipes-support/c-ares/c-ares/run-ptest b/meta-oe/re=
cipes-support/c-ares/c-ares/run-ptest
> new file mode 100644
> index 000000000000..ec115a535217
> --- /dev/null
> +++ b/meta-oe/recipes-support/c-ares/c-ares/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +if /usr/lib/c-ares/ptest/arestest; then

hardcoding /usr/lib might not work in all cases e.g. where baselib is
lib64 e.g. perhaps on ppc64 or multilib x86_64

> +       echo "PASS: c-ares"
> +else
> +       echo "FAIL: c-ares"
> +fi
> diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb b/meta-oe/re=
cipes-support/c-ares/c-ares_1.24.0.bb
> index 2171002aa95e..3b3b2b83febc 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> +++ b/meta-oe/recipes-support/c-ares/c-ares_1.24.0.bb
> @@ -5,14 +5,23 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfdbc58a6da11a9f68aa73c4538=
18decc"
>
> -SRC_URI =3D "git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=
=3Dhttps"
> -SRCREV =3D "972f456f2808b4e4b1730c90ab506f6af5f4c725"
> +SRC_URI =3D "https://c-ares.org/download/c-ares-1.24.0.tar.gz \
> +           file://run-ptest"
> +SRC_URI[sha256sum] =3D "c517de6d5ac9cd55a9b72c1541c3e25b84588421817b5f09=
2850ac09a8df5103"
>
> -UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', =
'', d)}"
> +PACKAGECONFIG[manpages] =3D ""
> +PACKAGECONFIG[tests] =3D "-DCARES_BUILD_TESTS=3DON,-DCARES_BUILD_TESTS=
=3DOFF,googletest"
>
> -S =3D "${WORKDIR}/git"
> +inherit cmake manpages pkgconfig ptest
>
> -inherit cmake pkgconfig
> +EXTRA_OECMAKE =3D "-DCARES_STATIC=3D${@ 'ON' if d.getVar('DISABLE_STATIC=
') =3D=3D '' else 'OFF' }"
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}
> +       install -m 0755 ${B}/bin/arestest ${D}${PTEST_PATH}
> +       install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
> +}
>
>  PACKAGE_BEFORE_PN =3D "${PN}-utils"
>
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107667): https://lists.openembedded.org/g/openembedde=
d-devel/message/107667
> Mute This Topic: https://lists.openembedded.org/mt/103288008/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

