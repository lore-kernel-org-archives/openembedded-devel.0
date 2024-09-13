Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4A7FC6171
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 18:29:12 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.80499.1726252144705401046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 11:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHgJRcQ9;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e1c56a8415so1172273eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726252144; x=1726856944; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e64VmgSMTaz2fRqw8Zf1wmyJ5y76l8u6xDx0vB051C0=;
        b=eHgJRcQ9VctZUKnYoSKr7akEFeUl3gu7FQ+WRRw4Zyu9bleIQOJaffn0u1UrzZjD2d
         R/qhai07KU54p5ODpVm8njcoDBIVokSOWTF5wlYcnBbHYCBBTqyUEB5Mmt/s+yOZXbT5
         i1f6EzLkMG5wPIV+DtgOyWr8cjFRoxo+4qYbBn+5wV8t7zFPfIWyHqYX7D6EiLrRV4Gx
         ZOGSLorkgnC1FvrCjH9tTcs2f9BMP37GENstEjuATD/meX0BNCnycQN94Z7jEtEcZ+sk
         62LGHGw3re9JpxgwESPbc8BS2QUzXoskD35ZTspHJBR4cfV5oKmxby4OIw8RWlODfnm8
         b4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726252144; x=1726856944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e64VmgSMTaz2fRqw8Zf1wmyJ5y76l8u6xDx0vB051C0=;
        b=EcBM9E7eSlaZEBCq033bi2M+fvqe5qu50Szrx+JzUYNUzGMZzPMVO53l3UT/QhAa9M
         /gPEM9oGNCB9L5fyes50ooLR/uTW1hRAozbQnD3zfUUnHCeVepI4nzaOliQPQGSvlHm7
         +VQrYmOzl/c4wLHO40U4ioBneIKVj6g1RrP2j1+Yp3AMS4SrsXRGpsJupWR02/40DTux
         dshLP6+0/DGkcFxRg5u3Sl/bfrjPzJXorv7nZB3AGaUzOs2fHcrFosiR8HiyiNPpZF01
         EDSAz0Y53g0XGdGn78e2Z2ghSgExkQ/E70a2xUgI04r8zEn3A0MoOJHepaciSGJPl3cA
         izXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3LIvCoVdqm3vm5wRszMWX8DyobmVxrNxFVfn+ZT/CPKUPNO38zxzqUXWHyXj2SkzWSTVz1grZ5wF62xVLy31rQDU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6lZ5GG1FSNp2uN9nqp6aLQmAfU3X9fu1dFAXInmXZ6n+tBI3P
	9lKIUPnRm9xd2dCFPTiF0HLaeDMpZVE0qLMGikwhIUdQQo8cW+ZIE1p16hdDBUYJC1G4D6c+ymx
	vC8ShmYfYF2OlFgQv5lU7/mJzeSs=
X-Google-Smtp-Source: AGHT+IHK69V4v4cop7qdrZE/z8pT+kqmpuzxYzkesNsCiXSt7o++p2MvCrVi+n5rVjH7eNaxYC2/Ctx0foKuyDDtwLU=
X-Received: by 2002:a4a:ee81:0:b0:5d5:bce7:677 with SMTP id
 006d021491bc7-5e2014555ebmr3399656eaf.7.1726252143717; Fri, 13 Sep 2024
 11:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240910124936.21220-1-tolvupostur@gmail.com> <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
 <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
In-Reply-To: <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2024 11:28:38 -0700
Message-ID: <CAMKF1sqWjSpC2dHmjibDy=hnkJk7-WUD5U0czpVDtp0gvr2rzw@mail.gmail.com>
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: tolvupostur@gmail.com
Cc: Ryan Eatmon <reatmon@ti.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 18:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112279

On Fri, Sep 13, 2024 at 11:17=E2=80=AFAM Einar Gunnarsson via
lists.openembedded.org <tolvupostur=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Ooops
>
> On Fri, 13 Sept 2024 at 15:25, Ryan Eatmon <reatmon@ti.com> wrote:
>>
>>
>> I'm seeing build failures on 32bit platforms with this new version.  Can
>> anyone verify?
>
>
> I can confirm that this does not build on 32-bit.
> The problem seems to be switching to meson build - both the current SRCRE=
V
> and the updated one fail on time_t size with meson, but build with the ol=
d mess of a code.
>

My builds test 64 bit on AB, locally I test 32bit arm/x86 and its
using clang compiler and it works fine there too.
I do not have 32bit builds+musl combination, too many combos, not
enough compute power.

> Sorry about that
> Einar Jon
>
>>
>>
>> On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
>> > Additional changes:
>> > Use https protocol for git fetch
>> > Build with meson
>> >
>> > Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
>> > ---
>> >   .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++-------------=
--
>> >   1 file changed, 3 insertions(+), 15 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-o=
e/recipes-multimedia/v4l2apps/yavta_git.bb
>> > index c4f31c033..db00c67b1 100644
>> > --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>> > +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
>> > @@ -2,9 +2,9 @@ SUMMARY =3D "Yet Another V4L2 Test Application"
>> >   LICENSE =3D "GPL-2.0-only"
>> >   LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D751419260aa954499f7ab=
aabaa882bbe"
>> >
>> > -SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster \
>> > +SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster;pro=
tocol=3Dhttps \
>> >             "
>> > -SRCREV =3D "65f740aa1758531fd810339bc1b7d1d33666e28a"
>> > +SRCREV =3D "323facd1d5bd6251eec70dd5c1484a12ce01202a"
>> >
>> >   PV =3D "0.0"
>> >   S =3D "${WORKDIR}/git"
>> > @@ -12,16 +12,4 @@ S =3D "${WORKDIR}/git"
>> >   # Upstream repo does not tag
>> >   UPSTREAM_CHECK_COMMITS =3D "1"
>> >
>> > -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
>> > -
>> > -# The yavta sources include copies of the headers required to build i=
n the
>> > -# include directory.  The Makefile uses CFLAGS to include these, but =
since
>> > -# we override the CFLAGS then we need to add this include path back i=
n.
>> > -CFLAGS +=3D "-I${S}/include"
>> > -
>> > -do_install() {
>> > -    install -d ${D}${bindir}
>> > -    install -m 0755 yavta ${D}${bindir}
>> > -}
>> > -
>> > -
>> > +inherit meson
>> >
>> >
>> >
>> >
>> >
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
>
> --
> Regards
> Einar J=C3=B3n
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112277): https://lists.openembedded.org/g/openembedde=
d-devel/message/112277
> Mute This Topic: https://lists.openembedded.org/mt/108374819/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

