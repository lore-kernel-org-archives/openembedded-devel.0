Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3367C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 18:49:43 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.20809.1699814978881041931
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 10:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jj+UBZoG;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ce2b6b3cb6so2314276a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699814978; x=1700419778; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr511VzMDHJvazye2FgD/BuP2IZc9bn+GwtRmDHt4Pk=;
        b=jj+UBZoGH6En58vNnQuTMm/nI4a8aVtP7pmxmT0K9YCTrkA1T8rGm+Tosqf/SK0dpD
         n4cCJ0jaOmIpsq6uiv5LfVdGKJ9ONw+k8TpiztmwDScfkzmAWVvp02+vsQKdiKKjLFQn
         D4vsj9JU6CWa/l3am6tsBNgZKOO4p1Hpmp1JF2oCGmPlByNK9qIDPhugVAP6273AZY7i
         /9Pgka0X+WaIjdgyhXAVpctUNg06Z82tiZv0CIBlICFlrozhNzIDJpXZD2HL8UCRWf/h
         N79xTpb1+/YEMUcqfKMVf7LOs8U7ANVirHerBHSDEEaUFwBUw2aC1HLosP+5LIIdz1mB
         qC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699814978; x=1700419778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr511VzMDHJvazye2FgD/BuP2IZc9bn+GwtRmDHt4Pk=;
        b=H5tT0hVTyD+gSYtyAooYFZ82I6zjDa/ER1GO62uxytu+1XGtXIfWFTbnn20ABoVLZ7
         u27OVSXWPexN5LYAoNrk0nyL9nT2b/U5GOUeN/tXbqKayZgdE4AG9KYuEESl44zydd6O
         5+I3ds4y6ME2+NURbkfCHlbCB7YKsNOxdJ2OneNk/JYAeQ07rBW1aUkWmxaBtLFTN6TX
         UIj8w9YLQjYvsSNls0N8W8XDDPeXUSS7L/4yLpF0U5jTFhxWhgOcZRoQl3WSz8JOUtIw
         LjP4xaq9mk8og6UpFTvdHGLhKh0il8X6G0shw17C1eMi/hZssX9rdPdfLEzHCT2kOCx5
         OCwg==
X-Gm-Message-State: AOJu0YxUwThH8oFpZlmamEhuI/e0r9J5AiqTl9gCNzxoa+AZsqw5kTe2
	J6x0XWaqL3S6BD+p/sbL8b5LB2wDpp418jwK+aU=
X-Google-Smtp-Source: AGHT+IFTcvuW+snV1/l2CNVHCazzRVeOf/6ot38o/QicOW9EE3bq/1l1oR8UBTFO3qUOPyNmMEGg76umgjBnXZaHqmE=
X-Received: by 2002:a05:6870:cd0b:b0:1e9:bda0:774 with SMTP id
 qk11-20020a056870cd0b00b001e9bda00774mr6897372oab.25.1699814977988; Sun, 12
 Nov 2023 10:49:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sq55zsKUM24WVKusuQCvGjG9CgXCuVHxvaX8hTMtvD49g@mail.gmail.com>
 <616DF2BB-0679-45D9-AE12-0A5006A2A840@getmailspring.com>
In-Reply-To: <616DF2BB-0679-45D9-AE12-0A5006A2A840@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 10:49:12 -0800
Message-ID: <CAMKF1spiKW6E=AzH7gbhSzva_qCT_4nBiQexA2sGvr09gyfs0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 18:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106600

hmm is that just seen with musl and works ok with glibc based images ?

TCLIBC=3Dmusl bitbake core-image-base

eg. will produce a musl based image which is expected to work

On Sun, Nov 12, 2023 at 10:23=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@w=
eb.de> wrote:
>
> Unfortunately I can't test it unless this gets solved (or I buy a differe=
nt Raspberry Pi)
>
> https://github.com/agherzan/meta-raspberrypi/issues/1229
>
> On Nov. 12 2023, at 6:43 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> TCLIBC=3Dmusl bitbake <recipe>
>
> On Sun, Nov 12, 2023 at 9:24=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@=
web.de> wrote:
> >
> > How to test it against musl btw? Build a musl-based system for Raspberr=
y Pi and see if it runs?
> >
> > On Nov. 12 2023, at 6:23 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> w=
rote:
> >
> > Yes, the CMake support was added two months ago and the release is from=
 2022. Cmake is also not supported by the main developer who seems to favor=
 an advanced Makefile. In any case, it is easier to fix than the Makefile. =
I will go with the git version for now then until there is a new release.
> >
> > On Nov. 12 2023, at 6:20 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen1=
0@web.de> wrote:
> > >
> > > I am trying with the tarball but it is quite hard, since it doesn't c=
ome with a CMakeLists.txt.
> > > There is a recipe here, but it involves a lot of patching which could=
 potentially be painful to maintain
> > >
> > > https://github.com/aristocratos/btop/issues/330#issuecomment-11236857=
79
> > >
> >
> > is it because cmake support was added later ? in that case maybe using
> > git version is ok
> >
> > > On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.clauss=
en10@web.de> wrote:
> > > >
> > > > It also needs a utf-8 locale to work. Else you have to force utf-8 =
mode with a flag. I haven't included this as dependency at this point.
> > >
> > > you want to express all that is needed to get it running amicably.
> > > keeping in mind that we have glibc and musl based systems to service
> > > it will be good to check it on musl too.
> > >
> > > >
> > > > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@web.d=
e> wrote:
> > > >
> > > > Glad that it arrived now! This is a really great resource monitor. =
It is building from the git repository. Do you think it is better to use th=
e release instead?
> > > >
> > > > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Thanks for your contribution Jan
> > > >
> > > > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.clau=
ssen10@web.de> wrote:
> > > > >
> > > > > ---
> > > > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++++++++=
+++++
> > > > > 1 file changed, 23 insertions(+)
> > > > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > >
> > > > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-o=
e/recipes-support/btop/btop_1.2.13.bb
> > > > > new file mode 100644
> > > > > index 000000000..f780a993a
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > > > @@ -0,0 +1,23 @@
> > > > > +SUMMARY =3D "Resource monitor that shows usage and stats for pro=
cessor, memory, disks, network and processes."
> > > > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > > > +LICENSE =3D "Apache-2.0"
> > > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57"
> > > > > +SECTION =3D "console/utils"
> > > > > +
> > > > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dh=
ttps;branch=3Dmain"
> > > > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > > > +
> > > > > +S =3D "${WORKDIR}/git"
> > > > > +
> > > > > +inherit cmake
> > > > > +
> > > > > +FILES:${PN} +=3D " \
> > > > > + /usr/share/icons \
> > > >
> > > > Lets use ${datadir} instead of hardcoded /usr/share
> > > >
> > > > > + /usr/share/icons/hicolor \
> > > > > + /usr/share/icons/hicolor/48x48 \
> > > > > + /usr/share/icons/hicolor/scalable \
> > > > > + /usr/share/icons/hicolor/48x48/apps \
> > > > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > > > + /usr/share/icons/hicolor/scalable/apps \
> > > > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > > > +"
> > > > > --
> > > > > 2.42.0
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#106559): https://lists.openembedded.org/g/ope=
nembedded-devel/message/106559
> > > > > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997=
914
> > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/=
unsub [raj.khem@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >

