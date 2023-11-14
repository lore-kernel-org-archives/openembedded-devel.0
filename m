Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC10C54E8C
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:43:34 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.4071.1699994612385956890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E/744m3O;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b3f6dd612cso3576054b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699994611; x=1700599411; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVVe+nrvh9/i4U2yWBuk6dFyxn3zgVBRrCc5Qp0Jz6w=;
        b=E/744m3Oqph2mz8rxMubTvcktBpG4Y3XPuNjQnRAFmYpa/phDG55YtCiYulsv6mVQi
         ZqWKcqWQox/OgweUHaebbdpv9/caJF1JVeh6qwTBspSA+b9K9eoDQU+wAoyKB9WuSnVw
         9VYRo/AFZAoEbfsHWSsEXatquC+hdWxpvs3y5B90kxkzCHYkB6OIIukllcR6MWT+cjtv
         528vkY0Ov+8YqSdSMWhET7NYM/JW/nEEeOqURTRlcY8vW9Ck+40RYdmEut301WzsTSyQ
         iRAYR1sNBuCZiCjz768N2OtWYEfFysek2rT8/fLdpCAT//YOU6gk0f4xp4LliDYm1HPo
         4v3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699994611; x=1700599411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVVe+nrvh9/i4U2yWBuk6dFyxn3zgVBRrCc5Qp0Jz6w=;
        b=oSnnBIqFWY+QMMRpt5A68cuPxlkskLa2MToaBH47TsSPsK+jeR5HHzUEWT73PeZfoV
         aOdVshPDi1OytEfSJY4GRJVGZz/oCZzgdkaVh1iU+QqJsjt6riOIQF6H2M+9QLw6taYN
         UJXVlsVBpRg8vxDtSRd3GzAtq4OtuhloK6ECB8lc3+v9EOGUtcQf6odoiak2aQNtWtr6
         JesUMWXin7wyt4Akw2aOX0sODbtJWrYbRO6Htkj8yPoUvxqGTOrdvhQ51YdU/eMVyXCU
         7McuC9dXi/UFUcPk5CWw4bLhsZGqBm+ogbSGv4Acy9id8I5CquyfRXxf/QSPpkTZKjfu
         kVQw==
X-Gm-Message-State: AOJu0YxTr9FS3fHwWmrQK5Vv+TNzjl7myHC6Ux3WkfflpIdK9A8iRAPA
	Ecn8suPubZ543y3MrfkkrSj732HHOGrQ0BHBhAM=
X-Google-Smtp-Source: AGHT+IEzBHd9dwUrI/Tq5cMBGmVXVyIWGFWKm1moh/g/wdhPlRVHtPiYFhfCy9tcYm6wn8yKybOHRKcYXrVpnvRrFYA=
X-Received: by 2002:a05:6871:3786:b0:1e9:64f1:9c30 with SMTP id
 nq6-20020a056871378600b001e964f19c30mr12565794oac.18.1699994611547; Tue, 14
 Nov 2023 12:43:31 -0800 (PST)
MIME-Version: 1.0
References: <27BCAA1A-D895-4C5A-9A1E-D9D1F3DBB773@getmailspring.com> <B209B613-FD40-495C-A652-2F322C2CFCCF@getmailspring.com>
In-Reply-To: <B209B613-FD40-495C-A652-2F322C2CFCCF@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 12:43:05 -0800
Message-ID: <CAMKF1spC66qx=abKfbYuJoP_5pu_WmGxpr3+S5gq4ttKzsSyRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 20:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106723

On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> So I have just tested btop on musl succesfully.
>

OK

> I am questioning the need for the locales though. You can run btop with t=
he --utf-force flag and it will work well. If you want to run it without th=
is flag, you'll need to not only install the locales, but also add
>
> LC_ALL=3Den_US.UTF-8
> LANG=3Den_US.UTF-8
>

yeah if it can work without it, that would be great

> to /etc/profile as a minimum. This would force the user to use these loca=
les. It would also require a .bbappend on base-files and I don't think that=
 this is a good idea.
>
> On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> wro=
te:
>
> How did you build it? I have sent you a PM on IRC
>
> On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > No, it is an issue I have with images for the Pi Zero. I haven't build =
anything for musl at all, although it would probably a good choice for the =
Pi Zero.
> >
> > I have no issues using Raspberry Pi OS or other distros btw, so the dev=
ice is not the issue
>
> As one point I have pi0 running fine perhaps something has regressed
> in meta-raspberrypi :( these things need TLC to keep going.
>
> > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > hmm is that just seen with musl and works ok with glibc based images ?
> >
> > TCLIBC=3Dmusl bitbake core-image-base
> >
> > eg. will produce a musl based image which is expected to work
> >
> > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10@web.de> wrote:
> > >
> > > Unfortunately I can't test it unless this gets solved (or I buy a dif=
ferent Raspberry Pi)
> > >
> > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > >
> > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > TCLIBC=3Dmusl bitbake <recipe>
> > >
> > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.clausse=
n10@web.de> wrote:
> > > >
> > > > How to test it against musl btw? Build a musl-based system for Rasp=
berry Pi and see if it runs?
> > > >
> > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@web.d=
e> wrote:
> > > >
> > > > Yes, the CMake support was added two months ago and the release is =
from 2022. Cmake is also not supported by the main developer who seems to f=
avor an advanced Makefile. In any case, it is easier to fix than the Makefi=
le. I will go with the git version for now then until there is a new releas=
e.
> > > >
> > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claus=
sen10@web.de> wrote:
> > > > >
> > > > > I am trying with the tarball but it is quite hard, since it doesn=
't come with a CMakeLists.txt.
> > > > > There is a recipe here, but it involves a lot of patching which c=
ould potentially be painful to maintain
> > > > >
> > > > > https://github.com/aristocratos/btop/issues/330#issuecomment-1123=
685779
> > > > >
> > > >
> > > > is it because cmake support was added later ? in that case maybe us=
ing
> > > > git version is ok
> > > >
> > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.cl=
aussen10@web.de> wrote:
> > > > > >
> > > > > > It also needs a utf-8 locale to work. Else you have to force ut=
f-8 mode with a flag. I haven't included this as dependency at this point.
> > > > >
> > > > > you want to express all that is needed to get it running amicably=
.
> > > > > keeping in mind that we have glibc and musl based systems to serv=
ice
> > > > > it will be good to check it on musl too.
> > > > >
> > > > > >
> > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
> > > > > >
> > > > > > Glad that it arrived now! This is a really great resource monit=
or. It is building from the git repository. Do you think it is better to us=
e the release instead?
> > > > > >
> > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > > > >
> > > > > > Thanks for your contribution Jan
> > > > > >
> > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.=
claussen10@web.de> wrote:
> > > > > > >
> > > > > > > ---
> > > > > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++++=
+++++++++
> > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.b=
b
> > > > > > >
> > > > > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/me=
ta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > new file mode 100644
> > > > > > > index 000000000..f780a993a
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > @@ -0,0 +1,23 @@
> > > > > > > +SUMMARY =3D "Resource monitor that shows usage and stats for=
 processor, memory, disks, network and processes."
> > > > > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57"
> > > > > > > +SECTION =3D "console/utils"
> > > > > > > +
> > > > > > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=
=3Dhttps;branch=3Dmain"
> > > > > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > > > > +
> > > > > > > +S =3D "${WORKDIR}/git"
> > > > > > > +
> > > > > > > +inherit cmake
> > > > > > > +
> > > > > > > +FILES:${PN} +=3D " \
> > > > > > > + /usr/share/icons \
> > > > > >
> > > > > > Lets use ${datadir} instead of hardcoded /usr/share
> > > > > >
> > > > > > > + /usr/share/icons/hicolor \
> > > > > > > + /usr/share/icons/hicolor/48x48 \
> > > > > > > + /usr/share/icons/hicolor/scalable \
> > > > > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > > > > +"
> > > > > > > --
> > > > > > > 2.42.0
> > > > > > >
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > Links: You receive all messages sent to this group.
> > > > > > > View/Reply Online (#106559): https://lists.openembedded.org/g=
/openembedded-devel/message/106559
> > > > > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/=
1997914
> > > > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-de=
vel/unsub [raj.khem@gmail.com]
> > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > >

