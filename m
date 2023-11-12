Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC40C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 17:43:53 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.19588.1699811024989636619
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 09:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWXo4Zsi;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1efabc436e4so2314285fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699811024; x=1700415824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3swvW5/dmMg2tLRIRl47lOFjW97sFlPhw+VOM0LSnE=;
        b=gWXo4ZsiESCVcnSY8MttWRr7w3AeJbd1hbCol2V0qy7TP2HmGqmpM8Yhz9JY6vU+ta
         6hbWSK3nCFMHz0M5+DiRVnaFCGRPnPvL1EcDH69t4+Ac81zhTmESyRcgcLCtcL+V/Vk8
         nwXwd0BJiZTmstkC1o0dZelpv+IV/2nt4osEnRbXp2In2gqzZkzs1bWrDeMONNpaFp1G
         Ogg22Pur6vcI4/T4Ysr0O+SMgZrDZAuEX/aHZkF6glm7g4oRrR+Va3lRuJPCJaCJglvb
         auivKuY7HuJjgTruNFgdsK8l+dTAIihAgF0KyOPW3vtl8p5b46L23vYKi0oO1rbRHXVB
         Q4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699811024; x=1700415824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3swvW5/dmMg2tLRIRl47lOFjW97sFlPhw+VOM0LSnE=;
        b=IjI+okbMmX9xBouySbsJr3JHIvs542NZ5qpy4hC08jG/vHVJOlyZS0HPXfNBWVB5Ob
         MhGADUCo51X9UfPstfS7UacLECwtAYH7M70edST4D7on1YbpWMUa5kpvifQfQivSV373
         QxMNEZDsVTceqv9wb6s1o1GycwYqAaV+6JxEDhMIBCjgJTB4891lQI+sBkjUR4rCYPxB
         tKYZGVeUX1Qj3F5TYsNXo22r7y2L7sFOyv7zPJVgTDKQMa12XvmLJGPEiGavcX57olY4
         MZV9CJBvzCRzFbNqGlZd0HPiYpMTySbdbEpRrvuMqeL91zwg0pVFGHMpKPSA1XMG2uD2
         WRQg==
X-Gm-Message-State: AOJu0YyGTwzXcau3hvPWdqLEjgZYiOzNGGTqMKmoL/6A2KNB3F52g+t7
	oxyZjDoluW0oZVu2mKB7u/G+c62R27pSvH2WP+A=
X-Google-Smtp-Source: AGHT+IEMMrUm9J/RZ9osQWEoMG2ty6B4btDr0AeJyPUUewWJbBakNmvsdAHsAd60yGZ88cEK5m7xOrmGsRJnXlySC3I=
X-Received: by 2002:a05:6870:3b8e:b0:1f4:bdab:b3a7 with SMTP id
 gi14-20020a0568703b8e00b001f4bdabb3a7mr6798268oab.37.1699811024197; Sun, 12
 Nov 2023 09:43:44 -0800 (PST)
MIME-Version: 1.0
References: <EA44BE37-C4A7-47D0-9361-FAC9B2D84373@getmailspring.com> <3E93B590-1D58-48B3-AB82-4887A0075065@getmailspring.com>
In-Reply-To: <3E93B590-1D58-48B3-AB82-4887A0075065@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 09:43:17 -0800
Message-ID: <CAMKF1sq55zsKUM24WVKusuQCvGjG9CgXCuVHxvaX8hTMtvD49g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106597

TCLIBC=3Dmusl bitbake <recipe>

On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@we=
b.de> wrote:
>
> How to test it against musl btw? Build a musl-based system for Raspberry =
Pi and see if it runs?
>
> On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> wro=
te:
>
> Yes, the CMake support was added two months ago and the release is from 2=
022. Cmake is also not supported by the main developer who seems to favor a=
n advanced Makefile. In any case, it is easier to fix than the Makefile. I =
will go with the git version for now then until there is a new release.
>
> On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@=
web.de> wrote:
> >
> > I am trying with the tarball but it is quite hard, since it doesn't com=
e with a CMakeLists.txt.
> > There is a recipe here, but it involves a lot of patching which could p=
otentially be painful to maintain
> >
> > https://github.com/aristocratos/btop/issues/330#issuecomment-1123685779
> >
>
> is it because cmake support was added later ? in that case maybe using
> git version is ok
>
> > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10@web.de> wrote:
> > >
> > > It also needs a utf-8 locale to work. Else you have to force utf-8 mo=
de with a flag. I haven't included this as dependency at this point.
> >
> > you want to express all that is needed to get it running amicably.
> > keeping in mind that we have glibc and musl based systems to service
> > it will be good to check it on musl too.
> >
> > >
> > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de>=
 wrote:
> > >
> > > Glad that it arrived now! This is a really great resource monitor. It=
 is building from the git repository. Do you think it is better to use the =
release instead?
> > >
> > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Thanks for your contribution Jan
> > >
> > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10@web.de> wrote:
> > > >
> > > > ---
> > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++++++++++=
+++
> > > > 1 file changed, 23 insertions(+)
> > > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > >
> > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/=
recipes-support/btop/btop_1.2.13.bb
> > > > new file mode 100644
> > > > index 000000000..f780a993a
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > @@ -0,0 +1,23 @@
> > > > +SUMMARY =3D "Resource monitor that shows usage and stats for proce=
ssor, memory, disks, network and processes."
> > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > +LICENSE =3D "Apache-2.0"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57"
> > > > +SECTION =3D "console/utils"
> > > > +
> > > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhtt=
ps;branch=3Dmain"
> > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +FILES:${PN} +=3D " \
> > > > + /usr/share/icons \
> > >
> > > Lets use ${datadir} instead of hardcoded /usr/share
> > >
> > > > + /usr/share/icons/hicolor \
> > > > + /usr/share/icons/hicolor/48x48 \
> > > > + /usr/share/icons/hicolor/scalable \
> > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > +"
> > > > --
> > > > 2.42.0
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#106559): https://lists.openembedded.org/g/opene=
mbedded-devel/message/106559
> > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

