Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6932CC54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:27:59 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.8073.1710365276386377055
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtYsnV2j;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-22181888b88so271910fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710365275; x=1710970075; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyQXJY/GW/kUg1JYLeZZex9MumbTwX1Y/EXepown/qE=;
        b=JtYsnV2j2SeB350vkVQCsuYrlFr5d3cCI5x446NA/VySr4XD5L+hrlzws4EI7te+pU
         6m9YquEfiAlgnLcYwnQNZwFQ0Tx+6cHwNG+guMUXnsisrh0zsemIrSOQGm88obigIfd7
         WOdQ0MS4RSbIw1w0MXRGrn6OB1tsiBHRlBYyLaywig8xSogkbcmh+KV8jPS3chS5Ocaz
         GNpy8/b5wVHpqbdsCHNsDNvenHoySP0dtbyOjRYqt9+3xv1N8CZ3vgY23oe4d/KYpHuf
         MrOCLU/AK1uw+pJgFStsNp6BIxRgNjakRsv2kc1stp8Un/lVVnb83EScIaeSjV848lhM
         ez3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710365275; x=1710970075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyQXJY/GW/kUg1JYLeZZex9MumbTwX1Y/EXepown/qE=;
        b=ek192XxjpunupKwmLqMX4NJ2o2qJEHYchR3ImvlHmptC2+x/ZlS+3tieavC3V57CHw
         BJeYtX/miQyVC7kh7IA7ESsNsOaruSf1Gjd3w3b8KMI+KQSKJ3+DDQ7wzJ6bF+khui9c
         zAK+PT9hoIFeXb9wLG8SJbHn5UXIQWm6CJpPi6Celwkh6rWPnEy4q6dJeFUSgHEhahkj
         z2u5xna1Bvy7VDKNqy0p7yn7aWHymT38YMPuz3vXHw2fm/t4fPxDuE8kM9MVrMEi6th9
         lHxvt12O5PGZFpjQ5utj+O12mSPR/4nKufwAwgV2xy7Jf3HEfwqaVIn697IO0bTdcYa2
         MbkQ==
X-Gm-Message-State: AOJu0Yw5oG00WsBjWyNn1NtVR0koanP2gayrcMv7uV7IY32kg/75IJwE
	M6Udwmri5uT4DGBvOp36s1rRn+lH9psPM/f8XorjZZ6g6ZYMGGhLAjTuCaebjxWVgAz6s2TPvoZ
	VVCoZxm8PuF8SSShbtEvGPhI9yzg=
X-Google-Smtp-Source: AGHT+IEssGI36b5UBbiFSTM5UdTdihybSDIOO683zt84PWjjwK63sAnDO4+Kwps3z64HWnl6ysI/hYorgQD7kPCYafo=
X-Received: by 2002:a05:6870:8996:b0:221:96fb:9ca5 with SMTP id
 f22-20020a056870899600b0022196fb9ca5mr22703oaq.33.1710365275535; Wed, 13 Mar
 2024 14:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240313205231.1799380-1-danismostlikely@gmail.com> <CACS+7ZR=U+6-P1OiQ4oB2oBOxgStoeOCOzm4jknY0LJ6pJUeLw@mail.gmail.com>
In-Reply-To: <CACS+7ZR=U+6-P1OiQ4oB2oBOxgStoeOCOzm4jknY0LJ6pJUeLw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 14:27:29 -0700
Message-ID: <CAMKF1sqFTAt3GCnXThpyVabx7Xm1Q078_eqTinxFRGuVs-0b3g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-pylint: Update to 3.1.0
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 21:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109298

On Wed, Mar 13, 2024 at 2:04=E2=80=AFPM Dan McGregor <danismostlikely@gmail=
.com> wrote:
>
> Hm. looks like v1 was committed. I'll rebase this change and submit a
> new version.

yes since this upgrade was reducing number of ptest failures down to
1, it was an improvement on existing
situation regardless. So I accepted it. Thanks for fixing it, and yes
please rebase it on top of latest master
and resend.

>
> On Wed, 13 Mar 2024 at 14:53, Dan McGregor <danismostlikely@gmail.com> wr=
ote:
> >
> > From: Dan McGregor <dan.mcgregor@vecima.com>
> >
> > PyLint needs to be comapatible with Astroid. It was recently updated
> > to version 3.1.0, so follow suit with pylint.
> >
> > Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> > ---
> >  ...1-Adjust-test-expectations-for-ptest.patch | 44 +++++++++++++++++++
> >  ...ylint_3.0.3.bb =3D> python3-pylint_3.1.0.bb} |  5 ++-
> >  2 files changed, 47 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-pylint/=
0001-Adjust-test-expectations-for-ptest.patch
> >  rename meta-python/recipes-devtools/python/{python3-pylint_3.0.3.bb =
=3D> python3-pylint_3.1.0.bb} (91%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Ad=
just-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/pytho=
n/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
> > new file mode 100644
> > index 00000000000..8edecbf1bd1
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-te=
st-expectations-for-ptest.patch
> > @@ -0,0 +1,44 @@
> > +From f3a213cf4922c122e554277ea2031c0c54cd3fe5 Mon Sep 17 00:00:00 2001
> > +From: Dan McGregor <dan.mcgregor@vecima.com>
> > +Date: Wed, 13 Mar 2024 14:08:25 -0600
> > +Subject: [PATCH] Adjust test expectations for ptest
> > +
> > +Because of the way we install ptests, some first party imports
> > +became third party. Reflect that in the test case.
> > +
> > +Upstream-Status: Inappropriate (embedded specific)
> > +Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
> > +---
> > + tests/functional/w/wrong_import_order.txt | 22 +++++++++++-----------
> > + 1 file changed, 11 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/tests/functional/w/wrong_import_order.txt b/tests/functio=
nal/w/wrong_import_order.txt
> > +index 068d2140d..9594ff9e0 100644
> > +--- a/tests/functional/w/wrong_import_order.txt
> > ++++ b/tests/functional/w/wrong_import_order.txt
> > +@@ -3,14 +3,14 @@ wrong-import-order:14:0:14:10::"standard import ""sy=
s"" should be placed before
> > + wrong-import-order:15:0:15:15::"standard import ""datetime"" should b=
e placed before third party imports ""six"", ""astroid.are_exclusive""":UND=
EFINED
> > + wrong-import-order:18:0:18:22::"third party import ""totally_missing"=
" should be placed before local import ""package.Class""":UNDEFINED
> > + wrong-import-order:20:0:20:14::"third party import ""astroid"" should=
 be placed before local imports ""package.Class"", "".package""":UNDEFINED
> > +-wrong-import-order:22:0:22:22::"first party import ""pylint.checkers"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2""":UNDEFINED
> > +-wrong-import-order:23:0:23:25::"first party import ""pylint.config"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2""":UNDEFINED
> > +-wrong-import-order:24:0:24:17::"first party import ""pylint.sys"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2""":UNDEFINED
> > +-wrong-import-order:25:0:25:28::"first party import ""pylint.pyreverse=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2""":UNDEFINED
> > +-wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib=
.parse.quote"" should be placed before first party imports ""pylint.checker=
s"", ""pylint.config"", ""pylint.sys"", ""pylint.pyreverse"" and local impo=
rts ""package.Class"", "".package"", "".package2"" (...) ""package3.Class3"=
", "".package4"", ""package4.Class4""":UNDEFINED
> > +-wrong-import-order:31:0:31:23::"first party import ""pylint.constants=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4"""=
:UNDEFINED
> > +-wrong-import-order:32:0:32:19::"standard import ""re"" should be plac=
ed before third party imports ""six"", ""astroid.are_exclusive"", ""unused_=
import"", ""totally_missing"", ""astroid"", ""six.moves.urllib.parse.quote"=
", first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys=
"", ""pylint.pyreverse"", ""pylint.constants"", and local imports ""package=
.Class"", "".package"", "".package2"" (...) ""package3.Class3"", "".package=
4"", ""package4.Class4""":UNDEFINED
> > +-wrong-import-order:32:0:32:19::"third party import ""requests"" shoul=
d be placed before first party imports ""pylint.checkers"", ""pylint.config=
"", ""pylint.sys"", ""pylint.pyreverse"", ""pylint.constants"" and local im=
ports ""package.Class"", "".package"", "".package2"" (...) ""package3.Class=
3"", "".package4"", ""package4.Class4""":UNDEFINED
> > +-wrong-import-order:33:0:33:24::"first party import ""pylint.exception=
s"" should be placed before local imports ""package.Class"", "".package"", =
"".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""=
":UNDEFINED
> > +-wrong-import-order:34:0:34:21::"first party import ""pylint.message""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":U=
NDEFINED
> > +-wrong-import-order:35:0:35:11::"standard import ""time"" should be pl=
aced before third party imports ""six"", ""astroid.are_exclusive"", ""unuse=
d_import"" (...) ""astroid"", ""six.moves.urllib.parse.quote"", ""requests"=
", first party imports ""pylint.checkers"", ""pylint.config"", ""pylint.sys=
"" (...) ""pylint.constants"", ""pylint.exceptions"", ""pylint.message"", a=
nd local imports ""package.Class"", "".package"", "".package2"" (...) ""pac=
kage3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
> > ++wrong-import-order:22:0:22:22::"third party import ""pylint.checkers"=
" should be placed before local imports ""package.Class"", "".package"", ""=
.package2""":UNDEFINED
> > ++wrong-import-order:23:0:23:25::"third party import ""pylint.config"" =
should be placed before local imports ""package.Class"", "".package"", "".p=
ackage2""":UNDEFINED
> > ++wrong-import-order:24:0:24:17::"third party import ""pylint.sys"" sho=
uld be placed before local imports ""package.Class"", "".package"", "".pack=
age2""":UNDEFINED
> > ++wrong-import-order:25:0:25:28::"third party import ""pylint.pyreverse=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2""":UNDEFINED
> > ++wrong-import-order:30:0:30:40::"third party import ""six.moves.urllib=
.parse.quote"" should be placed before local imports ""package.Class"", "".=
package"", "".package2"" (...) ""package3.Class3"", "".package4"", ""packag=
e4.Class4""":UNDEFINED
> > ++wrong-import-order:31:0:31:23::"third party import ""pylint.constants=
"" should be placed before local imports ""package.Class"", "".package"", "=
".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4"""=
:UNDEFINED
> > ++wrong-import-order:32:0:32:19::"standard import ""re"" should be plac=
ed before third party imports ""six"", ""astroid.are_exclusive"", ""unused_=
import"" (...) ""pylint.pyreverse"", ""six.moves.urllib.parse.quote"", ""py=
lint.constants"" and local imports ""package.Class"", "".package"", "".pack=
age2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEF=
INED
> > ++wrong-import-order:32:0:32:19::"third party import ""requests"" shoul=
d be placed before local imports ""package.Class"", "".package"", "".packag=
e2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":UNDEFIN=
ED
> > ++wrong-import-order:33:0:33:24::"third party import ""pylint.exception=
s"" should be placed before local imports ""package.Class"", "".package"", =
"".package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""=
":UNDEFINED
> > ++wrong-import-order:34:0:34:21::"third party import ""pylint.message""=
 should be placed before local imports ""package.Class"", "".package"", "".=
package2"" (...) ""package3.Class3"", "".package4"", ""package4.Class4""":U=
NDEFINED
> > ++wrong-import-order:35:0:35:11::"standard import ""time"" should be pl=
aced before third party imports ""six"", ""astroid.are_exclusive"", ""unuse=
d_import"" (...) ""requests"", ""pylint.exceptions"", ""pylint.message"" an=
d local imports ""package.Class"", "".package"", "".package2"" (...) ""pack=
age3.Class3"", "".package4"", ""package4.Class4""":UNDEFINED
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.b=
b b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> > similarity index 91%
> > rename from meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> > rename to meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> > index eb4b9e897ff..12f4f908af7 100644
> > --- a/meta-python/recipes-devtools/python/python3-pylint_3.0.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
> > @@ -3,10 +3,11 @@ HOMEPAGE=3D "http://www.pylint.org/"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d=
4e9c9"
> >
> > -SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/=
3.0.x;protocol=3Dhttps \
> > +SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/=
3.1.x;protocol=3Dhttps \
> > +           file://0001-Adjust-test-expectations-for-ptest.patch \
> >             file://run-ptest \
> >             "
> > -SRCREV =3D "1a5ffc1f447b77071ffe18a9c6836c09147ee2ed"
> > +SRCREV =3D "053c2c3a25f97f043e10cdd41d2609e495a68f57"
> >
> >  inherit python_setuptools_build_meta ptest
> >
> > --
> > 2.41.0
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109296): https://lists.openembedded.org/g/openembedde=
d-devel/message/109296
> Mute This Topic: https://lists.openembedded.org/mt/104914544/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

