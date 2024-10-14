Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E641CF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 02:36:51 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.45648.1728873407034607298
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 19:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XOGLrAw5;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e5a0519d00so1514465eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728873406; x=1729478206; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtyFUgWVtEtSmlfXJNTYgWA4U0+HRwCZevKak7fpbqs=;
        b=XOGLrAw5Pc3lgiNlfmADQO9PkqbXPVyjwBbx0aoLUYPkvfbcdi0E7Qd4j48XHqKc6O
         Z3YO5SCDVGbPt1guc91U92K2fOMPGMaFzFb0BblXI7Fk3fMljEtHYF3GsOfqa2tZPNxg
         pGYSnDtLprKVLsJKf4SXi9AucXK/TsF3dsCXq0YJIYwD7Aab/keIrBEvriuo4me+irpk
         ASDveyPcskugCf6RSlTgVusIGvLT1e5HTq2wg5YLpRpUrZZiJrQGvNB7p9AaY2ogGAU+
         NU9n0JYJ0JzuKC0sFDupjw6umqZMBy/9Ee384/8VqzmCxNzDx9m6Ug/NXfX4VP6Onqb+
         qq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728873406; x=1729478206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtyFUgWVtEtSmlfXJNTYgWA4U0+HRwCZevKak7fpbqs=;
        b=uzi3G4YqjnuL6vd2QP+7uy0dB3DHYBR2rltu+sxtNsX6gsmqVoFTMw26NFy9IWeFI2
         zlu7U8Lvgg+E+iZxGx9r4sgyyDdN9k3hO9pgTcdp2aOQamFEe0BEeZn2Cku3E8fIkrnR
         KJWxkX6dW7OSPYQUWEaW4vAXzWK5sPdER9WArPJd4qWwGboX4t4OKXqdnJlcO9NmtXi0
         mS3IA7QVpwVZawLmJt6cG+h5p+GK1r/xAtIAufYSdXvKzUm27RiTDkU+h5pI8v6Cbc7E
         8Ft3oPY39DkV/UIvg9tN1IeIy51sUajZYCEG2DXbZyhOeScU+wynEilWy5ZiQIxVP7cD
         Srxw==
X-Forwarded-Encrypted: i=1; AJvYcCW3cYMUdi+J+qdjHhEsBL1hVKYq6k9QvVBr/6VwYyFRR7rv9XDAuCqdCWG0RLbbt6melnJy9Axt/qnN8p+HQQPj4Yk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgGENoiQzi+x7jBl1hqhaMrSpLBLyDIwerPmG8Sgc35GiweBXZ
	nQWzXLcU9yCQUBr4VeljNkefI9zey77iF1rna7tK+muxqRntLk6YWVWtZhk7R54vqJ9cgUHcMoQ
	Z++qC3F0BtjzIEancRoxZkSXoR9w=
X-Google-Smtp-Source: AGHT+IEIrMca+PP05l33nKxL9MNM4Oj4KiVz15gMp0f6E0mjk5QvN8SERbzMIOt3p9TKV7At0jnmZxLwZzlgaZaVfYE=
X-Received: by 2002:a05:6820:2225:b0:5e7:bd85:f1ea with SMTP id
 006d021491bc7-5eb26461b01mr3468563eaf.2.1728873406023; Sun, 13 Oct 2024
 19:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com> <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
In-Reply-To: <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Oct 2024 19:36:19 -0700
Message-ID: <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 02:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112845

On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windriver.com=
> wrote:
>
> Hi Khem,
>
> On 10/14/24 00:18, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > ptests seems to be failing for qemux86-64 -  https://snips.sh/f/PWrmTR3=
-bm
>
> I didn't reproduce the issue locally as below:
>
> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
> PASS: tomlplusplus_odr_test
> PASS: tomlplusplus_tests

Did you build and run with meta-oe-image-ptest-tomlplusplus ?
secondly, I ran with image built with clang compiler

>
> Anyway, I will look into this then.
>
> Thanks,
>
> >
> > bitbake meta-oe-image-ptest-tomlplusplus
> > bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> >
> > On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org
> > <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >>   # ./run-ptest
> >> PASS: tomlplusplus_odr_test
> >> PASS: tomlplusplus_tests
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++++++++
> >>   .../tomlplusplus/tomlplusplus_git.bb              | 15 +++++++++++++=
--
> >>   2 files changed, 25 insertions(+), 2 deletions(-)
> >>   create mode 100755 meta-oe/recipes-devtools/tomlplusplus/files/run-p=
test
> >>
> >> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b/m=
eta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >> new file mode 100755
> >> index 000000000..4f682c5eb
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >> @@ -0,0 +1,12 @@
> >> +#!/bin/sh
> >> +
> >> +cd tests
> >> +for atest in tomlplusplus_* ; do
> >> +    rm -rf tests.log
> >> +    ./${atest} > tests.log 2>&1
> >> +    if [ $? =3D 0 ] ; then
> >> +        echo "PASS: ${atest}"
> >> +    else
> >> +        echo "FAIL: ${atest}"
> >> +    fi
> >> +done
> >> diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb=
 b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >> index 0e8202bdc..245c309a2 100644
> >> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplus"
> >>   LICENSE =3D "MIT"
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90960f22c10049c117d56ed2e=
e5ee167"
> >>
> >> -SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttp=
s;branch=3Dmaster"
> >> +SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttp=
s;branch=3Dmaster \
> >> +           file://run-ptest \
> >> +"
> >>
> >>   PV =3D "3.4.0"
> >>   SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
> >> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
> >>
> >>   DEPENDS =3D "cmake-native"
> >>
> >> -inherit meson
> >> +inherit meson ptest
> >> +
> >> +EXTRA_OEMESON +=3D "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEAT=
URES", "ptest", "true", "false", d)} \
> >> +"
> >> +
> >> +do_install_ptest () {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
> >> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
> >> +}
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#112828): https://lists.openembedded.org/g/openembe=
dded-devel/message/112828
> >> Mute This Topic: https://lists.openembedded.org/mt/108964413/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

