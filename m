Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D9C2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 16:45:34 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.12020.1700325927209367733
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 08:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdATKvUy;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1ef36a04931so1762339fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 08:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700325926; x=1700930726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdcVe4GTrkF9DB9CaK3GgcMuiJQr4r27TG4zPC3xKa8=;
        b=cdATKvUygAPvtTBEBJ+ljHqLyNM7IxCcXcB0wjP3E6UN3h3YV0nUYhWQSK4szsW6nj
         P0j2lnJnXXJkiX+OA3ewLvzJiFp/19wM55anMM1wHuzbsVvc/qrj3YpK9+84vYe9wgMz
         hrZd8d0BIDzTYt3GZuFEobdQzTO88tKPRTvIQPQrobw48so/D0aS+nxuh5yEqCNYF3Oi
         hjb4FnzuFE3RAfbrulrcEq1hlyaA9YVrARds3cx/YkbxKtZ/TI7XgwhKoTQu14VHfoN2
         413PAf+nXrg7SwZ+Ffnw+RHBMhhUF+mikrwwPKZEDKV10o9LLfz1UN3kQIBRv/Gf9zi4
         cgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700325926; x=1700930726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdcVe4GTrkF9DB9CaK3GgcMuiJQr4r27TG4zPC3xKa8=;
        b=C/ipUPhqm4xadhTNCEm0Gwwt8PGy0sbbWfyMmOYExPVRIdvnZEj7czWOo+qJr4o44s
         Ldk6VUXphxFDciRIOQ0e6eXRHr6cWjyMzEsi7j9K4ry+PoJna8K48aMRGhh8s7D+dJ+w
         vu8D11OQxIOrcUGfvLUfB9Dsi0vX2a0b65yDVdvmcDi2OpUuEwcnrtq7iGKGWP5OIF82
         yTKjjnQvew4gNpd6f64YYTmqDGNMe8bwIzFLid0gQMpKWGIyQQMjwYAdx8uhfdU+sORp
         pV/IjG2lIlgNcmD3wUbEHx8I7judxUctSQ2gGdoqFwRpIZ98gcrPEj/QXaDqdBgleF6I
         s0tg==
X-Gm-Message-State: AOJu0YwSvCwA8KP7bydt6x29uDUNDnhi+Wqd95+102XFqLQ1bJ1pjoFQ
	RKGJMWjyLi5rqv4AV9lVVyJqp27wUkdFhuVFczY=
X-Google-Smtp-Source: AGHT+IGDhr0wD9mLhAJkd9pdQ0RcmShtqPdMKL98fC7I9wCZ/qY010GWBEXEfBuaREzzpjyC53U5Dp2GAmUM3euoSj0=
X-Received: by 2002:a05:6870:1681:b0:1ef:aba0:1e34 with SMTP id
 j1-20020a056870168100b001efaba01e34mr2938104oae.29.1700325926320; Sat, 18 Nov
 2023 08:45:26 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spC66qx=abKfbYuJoP_5pu_WmGxpr3+S5gq4ttKzsSyRg@mail.gmail.com>
 <D5F6E8F4-14B1-4CFF-A966-2215804A8D87@getmailspring.com>
In-Reply-To: <D5F6E8F4-14B1-4CFF-A966-2215804A8D87@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Nov 2023 08:45:00 -0800
Message-ID: <CAMKF1sp9-aAaTxtYYcrBQh=sthmdRSaErMB5weXYGd1sbar1BA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 16:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106888

thats fine and thanks for update. However, if you can resend it via
git format-patch && git  send-email then tools I use will capture the
v2 properly.

On Sat, Nov 18, 2023 at 5:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@we=
b.de> wrote:
>
> So in this case it shoule be alright like this. The developer will have t=
o take care to set its proper locale, but apart from that everything works.
>
> From b242979231f4f32243b99cb8312fe4de07b0d87b Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Jan=3D20Clau=3DC3=3D9Fen?=3D <jan.claussen10@web.de>
> Date: Sat, 18 Nov 2023 14:45:27 +0100
> Subject: [PATCH] meta-oe: recipes-support: Add btop
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Adds btop, the shell-based resource monitor that shows usage and stats fo=
r processor, memory, disks, network and processes.
>
> Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
> ---
>  meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
>
> diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipe=
s-support/btop/btop_1.2.13.bb
> new file mode 100644
> index 000000000..a944fe7b5
> --- /dev/null
> +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Resource monitor that shows usage and stats for processor, =
memory, disks, network and processes."
> +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +SECTION =3D "console/utils"
> +
> +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain"
> +SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/icons \
> +    ${datadir}/icons/hicolor \
> +    ${datadir}/icons/hicolor/48x48 \
> +    ${datadir}/icons/hicolor/scalable \
> +    ${datadir}/icons/hicolor/48x48/apps \
> +    ${datadir}/icons/hicolor/48x48/apps/btop.png \
> +    ${datadir}/icons/hicolor/scalable/apps \
> +    ${datadir}/icons/hicolor/scalable/apps/btop.svg \
> +"
> --
> 2.42.1
>
> On Nov. 14 2023, at 9:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Nov 14, 2023 at 12:38=E2=80=AFPM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > So I have just tested btop on musl succesfully.
> >
>
> OK
>
> > I am questioning the need for the locales though. You can run btop with=
 the --utf-force flag and it will work well. If you want to run it without =
this flag, you'll need to not only install the locales, but also add
> >
> > LC_ALL=3Den_US.UTF-8
> > LANG=3Den_US.UTF-8
> >
>
> yeah if it can work without it, that would be great
>
> > to /etc/profile as a minimum. This would force the user to use these lo=
cales. It would also require a .bbappend on base-files and I don't think th=
at this is a good idea.
> >
> > On Nov. 12 2023, at 9:24 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> w=
rote:
> >
> > How did you build it? I have sent you a PM on IRC
> >
> > On Nov. 12 2023, at 9:21 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Nov 12, 2023 at 10:51=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10@web.de> wrote:
> > >
> > > No, it is an issue I have with images for the Pi Zero. I haven't buil=
d anything for musl at all, although it would probably a good choice for th=
e Pi Zero.
> > >
> > > I have no issues using Raspberry Pi OS or other distros btw, so the d=
evice is not the issue
> >
> > As one point I have pi0 running fine perhaps something has regressed
> > in meta-raspberrypi :( these things need TLC to keep going.
> >
> > > On Nov. 12 2023, at 7:49 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > hmm is that just seen with musl and works ok with glibc based images =
?
> > >
> > > TCLIBC=3Dmusl bitbake core-image-base
> > >
> > > eg. will produce a musl based image which is expected to work
> > >
> > > On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10@web.de> wrote:
> > > >
> > > > Unfortunately I can't test it unless this gets solved (or I buy a d=
ifferent Raspberry Pi)
> > > >
> > > > https://github.com/agherzan/meta-raspberrypi/issues/1229
> > > >
> > > > On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > TCLIBC=3Dmusl bitbake <recipe>
> > > >
> > > > On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claus=
sen10@web.de> wrote:
> > > > >
> > > > > How to test it against musl btw? Build a musl-based system for Ra=
spberry Pi and see if it runs?
> > > > >
> > > > > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@web=
.de> wrote:
> > > > >
> > > > > Yes, the CMake support was added two months ago and the release i=
s from 2022. Cmake is also not supported by the main developer who seems to=
 favor an advanced Makefile. In any case, it is easier to fix than the Make=
file. I will go with the git version for now then until there is a new rele=
ase.
> > > > >
> > > > > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.cla=
ussen10@web.de> wrote:
> > > > > >
> > > > > > I am trying with the tarball but it is quite hard, since it doe=
sn't come with a CMakeLists.txt.
> > > > > > There is a recipe here, but it involves a lot of patching which=
 could potentially be painful to maintain
> > > > > >
> > > > > > https://github.com/aristocratos/btop/issues/330#issuecomment-11=
23685779
> > > > > >
> > > > >
> > > > > is it because cmake support was added later ? in that case maybe =
using
> > > > > git version is ok
> > > > >
> > > > > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > > > >
> > > > > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.=
claussen10@web.de> wrote:
> > > > > > >
> > > > > > > It also needs a utf-8 locale to work. Else you have to force =
utf-8 mode with a flag. I haven't included this as dependency at this point=
.
> > > > > >
> > > > > > you want to express all that is needed to get it running amicab=
ly.
> > > > > > keeping in mind that we have glibc and musl based systems to se=
rvice
> > > > > > it will be good to check it on musl too.
> > > > > >
> > > > > > >
> > > > > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> > > > > > >
> > > > > > > Glad that it arrived now! This is a really great resource mon=
itor. It is building from the git repository. Do you think it is better to =
use the release instead?
> > > > > > >
> > > > > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wr=
ote:
> > > > > > >
> > > > > > > Thanks for your contribution Jan
> > > > > > >
> > > > > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <ja=
n.claussen10@web.de> wrote:
> > > > > > > >
> > > > > > > > ---
> > > > > > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++=
+++++++++++
> > > > > > > > 1 file changed, 23 insertions(+)
> > > > > > > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13=
.bb
> > > > > > > >
> > > > > > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/=
meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000..f780a993a
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > > > > @@ -0,0 +1,23 @@
> > > > > > > > +SUMMARY =3D "Resource monitor that shows usage and stats f=
or processor, memory, disks, network and processes."
> > > > > > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > > > > > +LICENSE =3D "Apache-2.0"
> > > > > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f146=
55fc854ddc3c6bd57"
> > > > > > > > +SECTION =3D "console/utils"
> > > > > > > > +
> > > > > > > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protoc=
ol=3Dhttps;branch=3Dmain"
> > > > > > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > > > > > +
> > > > > > > > +S =3D "${WORKDIR}/git"
> > > > > > > > +
> > > > > > > > +inherit cmake
> > > > > > > > +
> > > > > > > > +FILES:${PN} +=3D " \
> > > > > > > > + /usr/share/icons \
> > > > > > >
> > > > > > > Lets use ${datadir} instead of hardcoded /usr/share
> > > > > > >
> > > > > > > > + /usr/share/icons/hicolor \
> > > > > > > > + /usr/share/icons/hicolor/48x48 \
> > > > > > > > + /usr/share/icons/hicolor/scalable \
> > > > > > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > > > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > > > > > +"
> > > > > > > > --
> > > > > > > > 2.42.0
> > > > > > > >
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > > Links: You receive all messages sent to this group.
> > > > > > > > View/Reply Online (#106559): https://lists.openembedded.org=
/g/openembedded-devel/message/106559
> > > > > > > > Mute This Topic: https://lists.openembedded.org/mt/10253047=
8/1997914
> > > > > > > > Group Owner: openembedded-devel+owner@lists.openembedded.or=
g
> > > > > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-=
devel/unsub [raj.khem@gmail.com]
> > > > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > > >

