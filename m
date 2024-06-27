Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B98C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:06:11 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.3122.1719475567099005238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aIFEdQWL;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso5284710e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719475565; x=1720080365; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUE3AVCn5/hbiYE/AtOL8ea2NPAab98ZakIdtcI2u3o=;
        b=aIFEdQWLjLA5ipRH8jv5UKuzaJ5MzMw/FqkZ179JISsj8xxaMeu1UsI/dXRefKnkT4
         /pTpQvsf0h9oJejDvAteNfoaCkuGpXL9g1L9Vqpu5SGrV5yOZLjqfEZTRfKFUelVbd7q
         7U4HD9+3oPkD3dVkY6TRXjnxmBUUzRlQwaRgrcdcyYJ1xRhgYE8Jb2zNc1ncWaaNx+mQ
         NuQnQKyGXxj0ha/evh3Ks8UALBWAUIhjDkMY2/6jM8W2vXWBPE7ialZZRI4dolJT80xb
         0e0g0dvE+ICRfim2Ng0b6ejCWQcqJVUSjPDzO10immb4CwTRxg1RMCnaFmv407IDaYhn
         8Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475565; x=1720080365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUE3AVCn5/hbiYE/AtOL8ea2NPAab98ZakIdtcI2u3o=;
        b=bKgc3PGw3t9Q7fmuvqwf3Ao3OQw9Q+qWypfFoV3xaCCU+EBAZVsxsPwPl4c9lbWBIA
         SEpW462xOZxxH9ob1tZIYKrHEWtXTVc0wAfDxC5XOWF0vuME7HiVAo+mX3IJgJY1oQdn
         wpVOgf24Vd6DS5vf9PSyd8P6x4N/SHsn5VmZrjmX3NR3yBj+z5nK8xxQBhFL4su3qih9
         jLVhMmDs+SsB5kjTFHsiwU2q5/p7Ru+MyakgEJeZOtVPpa0pF3dof/zxnbcOIVaxNcIZ
         ed40UOJ6SwBOlvM1fY9P+q4TQQxAa8Z0pY+ZjKYKVoESbOmvMZ+gyNPskKrJuExERT40
         zBCw==
X-Gm-Message-State: AOJu0YzLyR09Dtyt/u8djj1rQX6u0p26OSokrWYeCxw0W8QdwIIWweyy
	/98C+p78M4zFQb2sTTxzX79wpnUVP1eizyoEkCwN/41XE2K5pYdbDCADQH695+1/Oyp3BRDfket
	8AMBwMIQNz0XrJBiH3seQyJ8Pnj8=
X-Google-Smtp-Source: AGHT+IEonYkyJiG+TQ3d8yZWgSYKSBMcNjjcDTTaCiaZ/bvaCyXCoHnH7ud7rhrhKfNPf3CWiTGSbBymO33c7dTUwtQ=
X-Received: by 2002:a05:6512:78f:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-52ce064f62dmr7771086e87.40.1719475564894; Thu, 27 Jun 2024
 01:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240619094547.30863-1-mark.jonas@de.bosch.com>
 <CA+chaQfw=Uj30UAbC7m6eoN_0ZhzFYqoJKL1vdAkTZe13vukAg@mail.gmail.com> <DU0PR10MB7076A615B2317E23746D5ABFADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB7076A615B2317E23746D5ABFADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Jun 2024 10:05:50 +0200
Message-ID: <CA+chaQeFm_xMLeHpvfM+ouUPZ0OhoOmQ1=NwSQmtoc3Z2SqzrQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] magic-enum: add recipe
To: "Jonas Mark (BT-FS/ENG1-GRB)" <mark.jonas@de.bosch.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"Simoes Ricardo (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111118

> Thank you for making us aware of the problem when compiling the ptest. We=
 were able to reproduce the problem when compiling for qemuarm. We were not=
 able to spot the problem on the autobuilder. How did you trigger the probl=
em?

I've just seen new build failure in world build and it was indeed with
32bit arm (from multilib builds).
Thanks for looking into it quickly.

> We looked into it and have to admit that we cannot explain why g++ 14.1.0=
 trips over that line.

Have you tried to compare preprocessed output from g++ from qemuarm
and qemuarm64 to see if there is some strange difference? The code
where color_set_not_const is used looks simple enough, but maybe some
REQUIRE* macro expansion does more than it looks in
https://github.com/search?q=3Drepo%3ANeargye%2Fmagic_enum+color_set_not_con=
st&type=3Dcode

Regards,

On Thu, Jun 27, 2024 at 9:00=E2=80=AFAM Jonas Mark (BT-FS/ENG1-GRB)
<mark.jonas@de.bosch.com> wrote:
>
> Hi Martin,
>
> Thank you for making us aware of the problem when compiling the ptest. We=
 were able to reproduce the problem when compiling for qemuarm. We were not=
 able to spot the problem on the autobuilder. How did you trigger the probl=
em?
>
> We looked into it and have to admit that we cannot explain why g++ 14.1.0=
 trips over that line.
>
> - It is perfectly legal C++ 17.
> - It compiles without that warning error for other machines, i.e. qemux86=
, qemux86-64, qemuarm64.
> - It does not act up with g++ 11.4 (Kirkstone) with qemuarm, our own NXP =
i.MX6 machine, or any other machine we tried.
>
> The problem can be mitigated by replacing the offending line
>
> magic_enum::containers::set color_set_not_const {Color::RED, Color::GREEN=
, Color::BLUE};
>
> with
>
> magic_enum::containers::set color_set_not_const =3D {Color::RED, Color::G=
REEN, Color::BLUE};
>
> We are working on sending a patch for the recipe containing a patch for m=
agic_enum to the OE mailing list (this one).
>
> We already got in contact with the upstream magic_enum project.
>
> https://github.com/Neargye/magic_enum/issues/362
>
> Cheers,
> Mark
>
>
> Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | www.boschsecurity.com
>
> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Frank Meyer; Gesch=C3=A4ftsf=C3=BChrung: Thoma=
s Quante, Peter L=C3=B6ffler, Henrik Siegle, Peter von Wartenberg
>
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Martin Jansa <martin.jansa@gmail.com>
> > Gesendet: Mittwoch, 26. Juni 2024 17:53
> > An: Jonas Mark (BT-FS/ENG1-GRB) <mark.jonas@de.bosch.com>
> > Cc: openembedded-devel@lists.openembedded.org; raj.khem@gmail.com;
> > Simoes Ricardo (BT-FS/ENG1.1-Ovr) <ricardo.simoes@pt.bosch.com>
> > Betreff: Re: [oe] [meta-oe][PATCH] magic-enum: add recipe
> >
> > ptest seems to fail building
> >
> > lib32-magic-enum/0.9.5/git/test/test_containers.cpp:290:89: error:
> > value computed is not used [-Werror=3Dunused-value]
> >   290 |   magic_enum::containers::set color_set_not_const {Color::RED,
> > Color::GREEN, Color::BLUE};
> >       |
> >                          ^
> >
> > On Wed, Jun 19, 2024 at 11:47=E2=80=AFAM Mark Jonas via lists.openembed=
ded.org
> > <mark.jonas=3Dde.bosch.com@lists.openembedded.org> wrote:
> > >
> > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > >
> > > magic-enum is a header-only C++17 library provides static reflection
> > > for enums, works with any enum type without any macro or boilerplate
> > > code.
> > >
> > > Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > > ---
> > >  .../magic-enum/magic-enum/run-ptest           | 27 ++++++++++++
> > >  .../magic-enum/magic-enum_0.9.5.bb            | 44
> > +++++++++++++++++++
> > >  2 files changed, 71 insertions(+)
> > >  create mode 100644
> > > meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
> > >  create mode 100644
> > > meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> > >
> > > diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum/run-
> > ptest
> > > b/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
> > > new file mode 100644
> > > index 000000000..865da9f69
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
> > > @@ -0,0 +1,27 @@
> > > +#!/bin/sh
> > > +
> > > +# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH # #
> > > +SPDX-License-Identifier: MIT
> > > +
> > > +fail_count=3D0
> > > +all_count=3D0
> > > +
> > > +for test_suite in tests/test_*
> > > +do
> > > +    if "./$test_suite"
> > > +    then
> > > +        echo "PASS: $test_suite"
> > > +    else
> > > +        echo "FAIL: $test_suite"
> > > +        fail_count=3D$((fail_count + 1))
> > > +    fi
> > > +    all_count=3D$((all_count + 1))
> > > +done
> > > +
> > > +if [ $fail_count -eq 0 ]
> > > +then
> > > +    echo "PASS: All $all_count tests passed"
> > > +else
> > > +    echo "FAIL: $fail_count of $all_count tests failed"
> > > +fi
> > > diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> > > b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> > > new file mode 100644
> > > index 000000000..096f869c3
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> > > @@ -0,0 +1,44 @@
> > > +# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH # #
> > > +SPDX-License-Identifier: MIT
> > > +
> > > +SUMMARY =3D "Static reflection for enums"
> > > +DESCRIPTION =3D "Header-only C++17 library provides static reflectio=
n
> > > +for enums, works \ with any enum type without any macro or
> > boilerplate code."
> > > +BUGTRACKER =3D
> > "https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> > hub.com%2FNeargye%2Fmagic_enum%2Fissues&data=3D05%7C02%7Cmark.jonas%40d=
e
> > .bosch.com%7C30c7277c5aa54b0fd67c08dc95f80c79%7C0ae51e1907c84e4bbb6d64
> > 8ee58410f4%7C0%7C0%7C638550139794967735%7CUnknown%7CTWFpbGZsb3d8eyJWIj
> > oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C
> > %7C&sdata=3DdTRcL1OePxuq8rbGeyR4SgdAjkLBeKX79lwaRns9pmQ%3D&reserved=3D0=
"
> > > +HOMEPAGE =3D
> > "https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> > hub.com%2FNeargye%2Fmagic_enum&data=3D05%7C02%7Cmark.jonas%40de.bosch.c=
o
> > m%7C30c7277c5aa54b0fd67c08dc95f80c79%7C0ae51e1907c84e4bbb6d648ee58410f
> > 4%7C0%7C0%7C638550139794976366%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> > wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata
> > =3D6GyAhu2fPHE0jZyaohpwL6%2FkP70fly7o4Bfxs9oPdDQ%3D&reserved=3D0"
> > > +
> > > +LICENSE =3D "MIT"
> > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Db15f48588464ec8ef87d2b560aad2caa"
> > > +
> > > +SRC_URI =3D " \
> > > +
> > git://github.com/Neargye/magic_enum.git;protocol=3Dhttps;branch=3Dmaste=
r \
> > > +    file://run-ptest \
> > > +"
> > > +
> > > +SRCREV =3D "e55b9b54d5cf61f8e117cafb17846d7d742dd3b4"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit cmake ptest
> > > +
> > > +EXTRA_OECMAKE =3D "\
> > > +    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=3DOFF \ "
> > > +
> > > +do_install_ptest () {
> > > +    install -d ${D}${PTEST_PATH}/tests
> > > +    install -m 0755 ${B}/test/test_* ${D}${PTEST_PATH}/tests }
> > > +
> > > +# Add catkin and colcon (ROS build system) support FILES:${PN}-dev
> > +=3D
> > > +"\
> > > +    ${datadir}/magic_enum/package.xml \ "
> > > +
> > > +# Header-only library
> > > +# ${PN} is empty so we need to tweak -dev and -dbg package
> > > +dependencies RDEPENDS:${PN}-dev =3D ""
> > > +RDEPENDS:${PN}-ptest =3D ""
> > > +RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#110963):
> > >
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > > s.openembedded.org%2Fg%2Fopenembedded-
> > devel%2Fmessage%2F110963&data=3D05
> > >
> > %7C02%7Cmark.jonas%40de.bosch.com%7C30c7277c5aa54b0fd67c08dc95f80c79%7
> > >
> > C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C638550139794981698%7CUnkno
> > >
> > wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> > >
> > CJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DaxWZTm%2FgV008AP6DiBtD1K3C6WXjF61ysA=
f
> > > bYxCOIMo%3D&reserved=3D0 Mute This Topic:
> > >
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > >
> > s.openembedded.org%2Fmt%2F106757432%2F3617156&data=3D05%7C02%7Cmark.jon=
a
> > >
> > s%40de.bosch.com%7C30c7277c5aa54b0fd67c08dc95f80c79%7C0ae51e1907c84e4b
> > >
> > bb6d648ee58410f4%7C0%7C0%7C638550139794985970%7CUnknown%7CTWFpbGZsb3d8
> > >
> > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> > >
> > %7C%7C%7C&sdata=3Dzmi38YI4iiU%2BwuaA1OESxzOb2blMvJEyjv9c7rsH3uM%3D&rese=
r
> > > ved=3D0 Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > >
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > > s.openembedded.org%2Fg%2Fopenembedded-
> > devel%2Funsub&data=3D05%7C02%7Cmar
> > >
> > k.jonas%40de.bosch.com%7C30c7277c5aa54b0fd67c08dc95f80c79%7C0ae51e1907
> > >
> > c84e4bbb6d648ee58410f4%7C0%7C0%7C638550139794990014%7CUnknown%7CTWFpbG
> > >
> > Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > >
> > 3D%7C0%7C%7C%7C&sdata=3DUFlwDFcdmqLHREOjshbhtNrFIkK07k9wMUVtIpMTrsk%3D&=
r
> > > eserved=3D0 [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

