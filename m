Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B103C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 15:01:54 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.498.1744297306751014992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RZkMPPK+;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3feb3f54339so647028b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744297306; x=1744902106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwwGqo7dqiFEnTKbnmq8bMsjRCVLvrCa4ZaLlOS1y8o=;
        b=RZkMPPK+wyYUDwRH+HOnPjNKppSlVQf0fTNlon+i/kKzRRrGJO5ZVQiBR1KTDAonEa
         LcF/yXFkqEA6DBjRD43rDa2F0tNeZZB+j4R9uXAl/4hQX6qnMhHIvR8tqPcOm1BX+2el
         z5tZx3wqXnXWDyOfqCv/CwZpt3mKKdkoMx/m73/IOzNkHoRaH3YLizPeja2lbW5GIffP
         3TaH4C5kQuZg15T0L569QFk1C7aWB2JCLde5CTQhvFBEPsK2ymSnMtpK4TK/mgk9dYAU
         ds1X/K1vq7x/t5O/YhgYsDqHxqA1CX54eBsEtaJvsobvTOyL93L8LZP/Mmmwm3HoVtRH
         wAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297306; x=1744902106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwwGqo7dqiFEnTKbnmq8bMsjRCVLvrCa4ZaLlOS1y8o=;
        b=ckPXD9nmqv0HQ36YsoGymMR1d5FIMorASm/CI9TuKvuxGE7Ydaskr4hexVOuozcxMG
         GA5QwAeXkH75FTw418OXOY+PxW5hh+9WPVfRXkXIvRAc97e0REgxyQxurTz0tdgoplcQ
         f1DUBIF5cmg+ZLIf5d8fB1vGB8cSVX8yp/roao8A8cq9X5mVND7PQoHpsPIXhT8C/PTD
         3al7cRgxzCS0MoOiGEmAADp7nTcuJ6+QcrBswshwdkec5cKqB4kqSC69b9QJK56oI3sp
         PRyuHpcAJmLvZwmgXJ2iz6UrCjmmazq1DzTs9JNVkZFCCXPbNseCf5qdbXHRk0TpWYOS
         oX9g==
X-Gm-Message-State: AOJu0YxfI+2x+9C1W0dLrwQFGLid+3EVQOP6WM7ZAocXYpmEsuGNy/us
	8q/CLHZvviIpDLqg9LAixz7jaKQwujftUU1fasx2MmAON20OYArKa8OIcCjtE+Q0rAVuaUfcgAW
	UICkq/RUkjdVG99iNGhyHqjMVjnyiJcSMsjM=
X-Gm-Gg: ASbGnctrP68nhcXBlLefuRvxrjTdUVruOPBUpXhaU1AMSj4vPzXW5VGTC0konZAaXwN
	22ZyZYVD7x7IYDSXlaPno4YpHn2UNTooRPCMkISD8UFi9lB4IV2Q/+oCCwcICBAj/R4/InzJidY
	Ph/g/I1DvrxeyNqi+qHUxvuQ==
X-Google-Smtp-Source: AGHT+IF6VSG0CN6po7kyB1Rg/xOZLpRGWJ5dTEZoPq2aJUXENicf3626Ciw7IpiELqtRCVMOFiL1LWJOjsaJcL0V6Gk=
X-Received: by 2002:a05:6808:2f13:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-4007cd25beamr1854249b6e.36.1744297305403; Thu, 10 Apr 2025
 08:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
 <1744017431-22217-17-git-send-email-wangmy@fujitsu.com> <CAMKF1sqLef9z8tRJPoV=zYZRGyY3RqzP2d3OuqeDu7qnqYaMNg@mail.gmail.com>
 <TYWPR01MB11861206AA0FEE6F16341991DDCB72@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861206AA0FEE6F16341991DDCB72@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 08:01:18 -0700
X-Gm-Features: ATxdqUEhXdsH2C2eaP8Iv9yqxi5jSSQpgRo2sQZZBtpRBiko4fn84Gfj6s2qH60
Message-ID: <CAMKF1sqz7ue05HZd7siJwsSKVVyw_eZcWngLHYeioyJcDNQaGw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrade 6.2.0
 -> 6.3.2
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 15:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116770

On Thu, Apr 10, 2025 at 12:40=E2=80=AFAM Mingyu Wang (Fujitsu)
<wangmy@fujitsu.com> wrote:
>
> I used qemux86-64 target machine and run the ptest of python3-multidict, =
there's no error occurred.
>

Perhaps you did it on the latest master branch after [1], where I have
sent patches to fix the fallout.


[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Db8ea21f860c=
0e451c34b80d5172367c619094db6

> Testsuite summary
> # TOTAL: 1596
> # PASS: 1596
> # SKIP: 0
> # XFAIL: 0
> # FAIL: 0
> # XPASS: 0
> # ERROR: 0
> DURATION: 90
> END: /usr/lib/python3-multidict/ptest
> 2025-04-10T05:23
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Wednesday, April 9, 2025 12:15 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-python] [PATCH 17/30] python3-multidict: upgrad=
e 6.2.0
> > -> 6.3.2
> >
> > This failed ptests
> >
> >    Failed ptests:
> > =E2=94=82   {'python3-multidict':
> > ['tests/test_leaks.py:test_leak[multidict_extend_dict.py]',
> > =E2=94=82
> > 'tests/test_leaks.py:test_leak[multidict_extend_multidict.py]',
> > =E2=94=82
> > 'tests/test_leaks.py:test_leak[multidict_extend_tuple.py]',
> > =E2=94=82
> > 'tests/test_leaks.py:test_leak[multidict_update_multidict.py]']}
> > =E2=94=82
> >
> > I would encourage to run ptests for recipes when doing upgrades etc. e.=
g.
> > for python3-multidict one would do
> > bitbake meta-python-image-ptest-python3-multidict
> >
> > using qemux86-64 target machine.
> >
> > On Mon, Apr 7, 2025 at 2:17=E2=80=AFAM wangmy via lists.openembedded.or=
g
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../{python3-multidict_6.2.0.bb =3D> python3-multidict_6.3.2.bb}  | =
2
> > > +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)  rename
> > > meta-python/recipes-devtools/python/{python3-multidict_6.2.0.bb =3D>
> > > python3-multidict_6.3.2.bb} (91%)
> > >
> > > diff --git
> > > a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> > > b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> > > similarity index 91%
> > > rename from
> > > meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> > > rename to
> > > meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> > > index 8b30574020..4e4d69bbd4 100644
> > > --- a/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-multidict_6.3.2.bb
> > > @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
> > > ptest-python-pytest
> > >
> > >  PV .=3D "+git"
> > >
> > > -SRCREV =3D "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
> > > +SRCREV =3D "0d667589cd02c8ce8251226f8f64fd86afd7ffa3"
> > >  PYPI_SRC_URI =3D
> > "git://github.com/aio-libs/multidict;branch=3Dmaster;protocol=3Dhttps"
> > >  S =3D "${WORKDIR}/git"
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#116642):
> > > https://lists.openembedded.org/g/openembedded-devel/message/116642
> > > Mute This Topic: https://lists.openembedded.org/mt/112129274/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

