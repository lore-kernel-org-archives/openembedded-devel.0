Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3163C0032E
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 10:20:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.15560.1698488402688886655
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Oct 2023 03:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emJB7WYa;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507c78d258fso4250319e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Oct 2023 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698488401; x=1699093201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLbzMwcYZJjgQN3LJsNCXcHOW9c/yQ7AbocklmAxMoU=;
        b=emJB7WYawgR81t1hMKekuBvRIEtsKGB/2oRy7N1iNJMQMwpCS02C8UVy0lZFgxPGmM
         dIPiylVDQTbKhVEYIt/UFZrCoqYL4QujKOy9en549CtDECUyb56+APYdWIUTUX5kaO9f
         +0tO3Vp+rgy9sw9tePY2SzOWDl+UgfTfifOEevpACMQ0WIizDFPk+EWfLynXPK61mXCw
         AXb3RVgBhIA0DW/zWZ8CQBK7Z+EKQKW6VHZ9psgVKbxBSBaKPSpEI+hiuXzhI9iFgiBu
         8ujeqjm3bQRnOXKu3UrkJM5wMt167m6V5sf/TPMCqTRjQy/vJ91HFhrQ+aUt26fLPm5m
         HPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698488401; x=1699093201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLbzMwcYZJjgQN3LJsNCXcHOW9c/yQ7AbocklmAxMoU=;
        b=un0cf9X7wzqEqfgbdb3lAKWcLcDKaMu9hPvZjdEtKAgwblN00T4mqpboUOHB1KtKQq
         U4mA6oi/9dQzRBRaIV9wdXO/EXRtkUBt5C4LmTK/zsFA7ZaPfqmsG+E4XfpP3SAwldfI
         NipjJigjln3dILyYThPmosF/pftZGoVUyxY3e9roLi3lFAtTZv9/JgipgV2699+CFNrT
         RYqA5lpwagCRX06cu9bCzvvvQiZtc+R36v95hnGBh2A3fBYDZ4hFo3/B201UJ//SDB3S
         Kvs01VRSTppBsBlBdaPWQw/Hsvo8Jkub6b/AUMLZ+EsRkTqg7fEM2b9JqOuQ7Ih0kPL3
         OUeg==
X-Gm-Message-State: AOJu0YxwgGJjLWBofxE+liGYkEwMFVjBIGZ6pw89HniNm0MaSSJJT2gW
	53f+Lnx1OduaLBs7ak8mc75uLPSYhDK5bqJr9SM=
X-Google-Smtp-Source: AGHT+IERzBwLMl3WWK2bzi70W5rflwFIhcfTv9mxO2cK1iBORf+Qy9gjbsM7mxe8+E2etNp4QPmToNXfI/vDHx0qXyE=
X-Received: by 2002:a05:6512:48d0:b0:503:15a5:b368 with SMTP id
 er16-20020a05651248d000b0050315a5b368mr3745293lfb.16.1698488400389; Sat, 28
 Oct 2023 03:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194914.78513-1-peron.clem@gmail.com> <DB5PR02MB102132E9626696DE2B38664C1EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102132E9626696DE2B38664C1EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 28 Oct 2023 12:19:48 +0200
Message-ID: <CAJiuCcf2CtT1Nka5L-X1XHuWYcig4EmgJqDsMeZ+sTZ4dNxZxg@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Oct 2023 10:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105785

Hi Peter,

On Fri, 27 Oct 2023 at 22:40, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Cl=C3=A9ment P=C3=A9ron
> > Sent: den 27 oktober 2023 21:49
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > Subject: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
>
> A more standard subject would be something like:
>
> pcapplusplus: Add recipe
>
> >
> > Add PcapPlusPlus 23.09 recipe.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  .../pcapplusplus/pcapplusplus_23.09.bb        | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusp=
lus_23.09.bb
> >
> > diff --git a/meta-oe/recipes-
> > connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-conne=
ctivity/pcapplusplus/pcapplusplus_23.09.bb
> > new file mode 100644
> > index 000000000..39c6942c8
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> > @@ -0,0 +1,21 @@
> > +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and cr=
afting of network packets"
> > +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> > +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> > +SECTION =3D "libs/network"
> > +LICENSE =3D "Unlicense"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d69=
5d19f"
> > +
> > +DEPENDS =3D "libpcap"
> > +
> > +SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps=
;branch=3Dmaster"
> > +SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[examples] =3D "-DPCAPPP_BUILD_EXAMPLES=3DON,-DPCAPPP_BUI=
LD_EXAMPLES=3DOFF"
> > +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIB=
S=3DOFF"
>
> Did you really mean to not enable the "shared" PACAKEGCONFIG,
> and thus only build static libraries? That seems very odd.

Thanks for your feedback, indeed in my application I only use a small
part of Pcap++ and don't want to have all the Pcap++ shared library.

Also the shared library is not the default behavior on PcapPP repo as
they are some issues with Windows DLL.

>
> > +PACKAGECONFIG[tests] =3D "-DPCAPPP_BUILD_TESTS=3DON,-DPCAPPP_BUILD_TES=
TS=3DOFF"
> > +PACKAGECONFIG[zstd] =3D "-DLIGHT_PCAPNG_ZSTD=3DON,-DLIGHT_PCAPNG_ZSTD=
=3DOFF,zstd"
>
> Since it is unlikely that anyone wants to enable the examples and
> only build statically, I would suggest replacing the first two
> PACKAGECONFIGs above with:

Examples may be bad naming. It's more like "Tools" which binaries like
Arping, DnsSpoofing, HttpAnalyzer, etc...

Then inside these Examples there are trivial ones that are called "Tutorial=
s"
which the configuration is not configurable here.

>
> EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=3DOF=
F"
>
> And unless you plan on adding ptest support, you may as well remove the
> tests PACKAGECONFIG too, and make that:
>
> EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DPCAPPP_BUILD_EXAMPLES=3DOF=
F -DPCAPPP_BUILD_TESTS=3DOFF"
>
> And if either of those three matches the upstream defaults,
> you can of course remove it altogether.

So you prefer to have everything defined with EXTRA_OECMAKE.

Why not let the user have this configurable through packageconfig if
it's possible and doesn't cost?

Thanks
Clement

>
> > --
> > 2.39.3 (Apple Git-145)
>
> //Peter

