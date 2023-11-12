Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C560C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:22:04 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.22615.1699820522363093017
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bTzU4/+z;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f06931e4f7so2502624fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820521; x=1700425321; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4zaRYFg7drnnHxSqk9eBRdT119enWMIL14MfRXvPk4=;
        b=bTzU4/+zz5esxAqvMncQGeTqI3B9Tdr00W6jvLsE6xccFULML5o8b1O5UGenJqFHJB
         3mQYLV/Aue93n8VsTuMKqbwvOL37CVPkBcrBP8j6PifAiwbO9UWerI6wtNfl4DvSo7zl
         k8lrdmFzkst2NPAWzU8WMNWboxP62wllCo27GcBqt7XZg05ZlY8iy4l5a9Ya5/jEeNlC
         NY2+a+Id1AUnKyqJdo7Ioiqg5Onb+j9pD6BiqZfQkgDhtm1MjTrKmA9UExnWluStBnaQ
         iGyAuKEETbyLXlpAVYO6weNpBihkYOLDcreCoIWQR7wFTz/akYSe7HQYTWy0HLDWx/Tk
         +Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820521; x=1700425321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4zaRYFg7drnnHxSqk9eBRdT119enWMIL14MfRXvPk4=;
        b=R/Lb/A6deQ/PhQ/v4YvAsYuDMELfz7txr0wLe4qDNKF9mK2nbmI4gp/5TAAxpevXy7
         lOZFlMsBrbolQok6yRVhwb60EAvMAqLzC2FBiKsb0Pixds6ChyYmA/tqsMThKpcbxns4
         NXtrEFArulka73gYT4WaQu5pRcsTc22NMviP6Ujz9vF8kFk4pqigP2j+X0VE8WYQXB/j
         gqLP3SyBI0ptiqVfcgiOGYe7teod2OTUBd5KLJeN+xKyW/VqmgyC8ZNGDBxeDNcOvlhj
         GiYPLyfDsRISXUmad+ttwENjJUIRmQhmoRDb9IZYpsQIWIsBTX5yx3iwBTXFSuzMKZ7n
         OgkA==
X-Gm-Message-State: AOJu0YwZnaLCvpreDGna7XsV7It8QO0JoGcsbQsfwRz16Kgmm8sQOMXy
	iy/I/lNiToC8jRHAf8xuuvxd0fer7gwxjNu/n35c1/FMhcw=
X-Google-Smtp-Source: AGHT+IGObh3BHUOdFc7VOkx8iKbiKgZ8w6XEknGB3jBK2fwhIE8ikuKwpgDygmwWcT+ochpPkH7Ssfa2EM9bILmKuwQ=
X-Received: by 2002:a05:6870:9d99:b0:1f0:5248:c6a6 with SMTP id
 pv25-20020a0568709d9900b001f05248c6a6mr7400991oab.51.1699820521522; Sun, 12
 Nov 2023 12:22:01 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spiKW6E=AzH7gbhSzva_qCT_4nBiQexA2sGvr09gyfs0g@mail.gmail.com>
 <FA9B6E4D-2A1D-4EF4-A672-198CC3ED0021@getmailspring.com>
In-Reply-To: <FA9B6E4D-2A1D-4EF4-A672-198CC3ED0021@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:21:35 -0800
Message-ID: <CAMKF1sqd83q-=EjZHya7PWoWRO=X10X6rbJTvZJGCNtJ4n=iPg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106610

On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> No, it is an issue I have with images for the Pi Zero. I haven't build an=
ything for musl at all, although it would probably a good choice for the Pi=
 Zero.
>
> I have no issues using Raspberry Pi OS or other distros btw, so the devic=
e is not the issue

As one point I have pi0 running fine perhaps something has regressed
in meta-raspberrypi :( these things need TLC to keep going.

> On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> hmm is that just seen with musl and works ok with glibc based images ?
>
> TCLIBC=3Dmusl bitbake core-image-base
>
> eg. will produce a musl based image which is expected to work
>
> On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > Unfortunately I can't test it unless this gets solved (or I buy a diffe=
rent Raspberry Pi)
> >
> > https://github.com/agherzan/meta-raspberrypi/issues/1229
> >
> > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > TCLIBC=3Dmusl bitbake <recipe>
> >
> > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen1=
0@web.de> wrote:
> > >
> > > How to test it against musl btw? Build a musl-based system for Raspbe=
rry Pi and see if it runs?
> > >
> > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de>=
 wrote:
> > >
> > > Yes, the CMake support was added two months ago and the release is fr=
om 2022. Cmake is also not supported by the main developer who seems to fav=
or an advanced Makefile. In any case, it is easier to fix than the Makefile=
. I will go with the git version for now then until there is a new release.
> > >
> > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.clausse=
n10@web.de> wrote:
> > > >
> > > > I am trying with the tarball but it is quite hard, since it doesn't=
 come with a CMakeLists.txt.
> > > > There is a recipe here, but it involves a lot of patching which cou=
ld potentially be painful to maintain
> > > >
> > > > https://github.com/aristocratos/btop/issues/330#issuecomment-112368=
5779
> > > >
> > >
> > > is it because cmake support was added later ? in that case maybe usin=
g
> > > git version is ok
> > >
> > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10@web.de> wrote:
> > > > >
> > > > > It also needs a utf-8 locale to work. Else you have to force utf-=
8 mode with a flag. I haven't included this as dependency at this point.
> > > >
> > > > you want to express all that is needed to get it running amicably.
> > > > keeping in mind that we have glibc and musl based systems to servic=
e
> > > > it will be good to check it on musl too.
> > > >
> > > > >
> > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@web=
.de> wrote:
> > > > >
> > > > > Glad that it arrived now! This is a really great resource monitor=
. It is building from the git repository. Do you think it is better to use =
the release instead?
> > > > >
> > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > Thanks for your contribution Jan
> > > > >
> > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.cl=
aussen10@web.de> wrote:
> > > > > >
> > > > > > ---
> > > > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++++++=
+++++++
> > > > > > 1 file changed, 23 insertions(+)
> > > > > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta=
-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > new file mode 100644
> > > > > > index 000000000..f780a993a
> > > > > > --- /dev/null
> > > > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > @@ -0,0 +1,23 @@
> > > > > > +SUMMARY =3D "Resource monitor that shows usage and stats for p=
rocessor, memory, disks, network and processes."
> > > > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57"
> > > > > > +SECTION =3D "console/utils"
> > > > > > +
> > > > > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=
=3Dhttps;branch=3Dmain"
> > > > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > > > +
> > > > > > +S =3D "${WORKDIR}/git"
> > > > > > +
> > > > > > +inherit cmake
> > > > > > +
> > > > > > +FILES:${PN} +=3D " \
> > > > > > + /usr/share/icons \
> > > > >
> > > > > Lets use ${datadir} instead of hardcoded /usr/share
> > > > >
> > > > > > + /usr/share/icons/hicolor \
> > > > > > + /usr/share/icons/hicolor/48x48 \
> > > > > > + /usr/share/icons/hicolor/scalable \
> > > > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > > > +"
> > > > > > --
> > > > > > 2.42.0
> > > > > >
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#106559): https://lists.openembedded.org/g/o=
penembedded-devel/message/106559
> > > > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/19=
97914
> > > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-deve=
l/unsub [raj.khem@gmail.com]
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > >

