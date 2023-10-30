Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4714DC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 13:27:52 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.148780.1698672463265503118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 06:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QMiKsRXO;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507b96095abso6388420e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698672461; x=1699277261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ8I8nWn2QiZaSmrwlDszv47oiUawOLzE67Mh8e1I/c=;
        b=QMiKsRXOgJvWTjb+oBk8ZT1ZWY/H3MeU9fTw+rQ4MMjvmykpSyyM26C3xJ5lANUF/N
         V3dHQVl2bFlrL7qxAEP0hHG4oHa/4D44ByMCf8YClIP4/+MmTWWKojgXju5Js/Ym7+bw
         3ZL0EH1TOrqWyFn1tkAH4jvGm6zIYTJmfWbeu7X4uZQfr2vjrH5MfPIezU4D1NCJi4q8
         54ZWB9vpqeQpCrodP1Tqs1G3FX5l7dmrTtBVcftESsrrPjV8g3/WHzuwXCAouGKo15l/
         CYs/itiXFcrtruyDGeLCvGcMZrXsa6sh9ZM5hf0+DG1WcgERR2fY/wN29ctEAFdN7BTB
         SzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698672461; x=1699277261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ8I8nWn2QiZaSmrwlDszv47oiUawOLzE67Mh8e1I/c=;
        b=PFatYsHQOYYK+VmX89tGpZImiwUodySWPoZrFRI483HRmtWoHkWNOv/zt5hWFzECrF
         dxuZDfu4ARQDxwGVKqhMn/s7PHCP6guz3AfnRjVsr/CXd75qNy+kEDrRZ9s2riH5YwoR
         53sYGpYcw6kFIeyCfJUWZsXAyzHzLtErsMya/uGpa+W91M6L4MUjGgsfuqe0iq3ydhpU
         9XM6cpshGd3YeppvhAsjHwruKn8ntBACN+0YzFhNMKTtSFGc89Zgf7cXaviVmhrhw13g
         E1H9iG9BwHMtL5yGbrB/ReWE18NFWcqzQKzBAeSsQ+jAOT4v7SakHLJKaBpsSIkyQQx6
         7aiQ==
X-Gm-Message-State: AOJu0YwNjQSp5j6w882ZQOvICPh6cVN75/tQ96fYEaCambyGVoqAHhI9
	lsdnBmVkmq97c8Ad0cYzEM/SkE8RfkZLxgxulOc=
X-Google-Smtp-Source: AGHT+IGZWdSN9AWtP1VeDVAVLiM0+KlDRu62y17zzZWm0YxPN/89MUVkbL51oiXD+nMOA4nVycWR3NxRgocr982oi24=
X-Received: by 2002:a19:2d54:0:b0:500:94c3:8e3b with SMTP id
 t20-20020a192d54000000b0050094c38e3bmr6697890lft.57.1698672461091; Mon, 30
 Oct 2023 06:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194914.78513-1-peron.clem@gmail.com> <DB5PR02MB102132E9626696DE2B38664C1EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <17923E3423A27A6E.20486@lists.openembedded.org>
In-Reply-To: <17923E3423A27A6E.20486@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 30 Oct 2023 14:27:29 +0100
Message-ID: <CAJiuCccyyG4kDkYmEqxanwn=8u-pfrsPb0-nEHSRkRfU2NCG5w@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
To: Khem Raj <raj.khem@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 13:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105794

Hi Peter,

+Khem

On Sat, 28 Oct 2023 at 12:20, Cl=C3=A9ment P=C3=A9ron via lists.openembedde=
d.org
<peron.clem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Peter,
>
> On Fri, 27 Oct 2023 at 22:40, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-devel@l=
ists.openembedded.org> On Behalf Of Cl=C3=A9ment P=C3=A9ron
> > > Sent: den 27 oktober 2023 21:49
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > Subject: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
> >
> > A more standard subject would be something like:
> >
> > pcapplusplus: Add recipe

Is it ok, if I send a v3 changing the subject and enabling the shared
option by default.

But leaving the other packageconfig available.

Does that seem good to you?


> >
> > >
> > > Add PcapPlusPlus 23.09 recipe.
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  .../pcapplusplus/pcapplusplus_23.09.bb        | 21 +++++++++++++++++=
++
> > >  1 file changed, 21 insertions(+)
> > >  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplu=
splus_23.09.bb
> > >
> > > diff --git a/meta-oe/recipes-
> > > connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-con=
nectivity/pcapplusplus/pcapplusplus_23.09.bb
> > > new file mode 100644
> > > index 000000000..39c6942c8
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> > > @@ -0,0 +1,21 @@
> > > +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and =
crafting of network packets"
> > > +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> > > +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> > > +SECTION =3D "libs/network"
> > > +LICENSE =3D "Unlicense"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d=
695d19f"
> > > +
> > > +DEPENDS =3D "libpcap"
> > > +
> > > +SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhtt=
ps;branch=3Dmaster"
> > > +SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit cmake
> > > +
> > > +PACKAGECONFIG ??=3D ""
> > > +PACKAGECONFIG[examples] =3D "-DPCAPPP_BUILD_EXAMPLES=3DON,-DPCAPPP_B=
UILD_EXAMPLES=3DOFF"
> > > +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_L=
IBS=3DOFF"
> >
> > Did you really mean to not enable the "shared" PACAKEGCONFIG,
> > and thus only build static libraries? That seems very odd.
>
> Thanks for your feedback, indeed in my application I only use a small
> part of Pcap++ and don't want to have all the Pcap++ shared library.
>
> Also the shared library is not the default behavior on PcapPP repo as
> they are some issues with Windows DLL.
>
> >
> > > +PACKAGECONFIG[tests] =3D "-DPCAPPP_BUILD_TESTS=3DON,-DPCAPPP_BUILD_T=
ESTS=3DOFF"
> > > +PACKAGECONFIG[zstd] =3D "-DLIGHT_PCAPNG_ZSTD=3DON,-DLIGHT_PCAPNG_ZST=
D=3DOFF,zstd"
> >
> > Since it is unlikely that anyone wants to enable the examples and
> > only build statically, I would suggest replacing the first two
> > PACKAGECONFIGs above with:
>
> Examples may be bad naming. It's more like "Tools" which binaries like
> Arping, DnsSpoofing, HttpAnalyzer, etc...
>
> Then inside these Examples there are trivial ones that are called "Tutori=
als"
> which the configuration is not configurable here.
>
> >
> > EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=3D=
OFF"
> >
> > And unless you plan on adding ptest support, you may as well remove the
> > tests PACKAGECONFIG too, and make that:
> >
> > EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=3D=
OFF -DPCAPPP_BUILD_TESTS=3DOFF"
> >
> > And if either of those three matches the upstream defaults,
> > you can of course remove it altogether.
>
> So you prefer to have everything defined with EXTRA_OECMAKE.
>
> Why not let the user have this configurable through packageconfig if
> it's possible and doesn't cost?
>
> Thanks
> Clement
>
> >
> > > --
> > > 2.39.3 (Apple Git-145)
> >
> > //Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105785): https://lists.openembedded.org/g/openembedde=
d-devel/message/105785
> Mute This Topic: https://lists.openembedded.org/mt/102228837/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

