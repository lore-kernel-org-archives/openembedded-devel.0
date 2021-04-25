Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.3079.1619366284406708523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 08:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PmMGqRsq;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id e7so62761197edu.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0+WvRM6QL9ZsiC3NdqIFBzhEB/eeWyfvCgRvtds3Vmc=;
        b=PmMGqRsqfbCvYyk5g4tcpWIXnp/TVBttf2mpT8AkwMF2rmn5hArWUpzgcLMaEdNEHR
         yZQOh5xTWL7590OXtFtUT/AClqo/zmMXA8tmvZ4LYaEHIPFuEPQmo6XisXxz7/2Yjso7
         80B09YHi/cl2FqTsaMb4wqAUSAOQ/9lxp89jurHg4YZiXK+RaB9Bf8DnujduKO8oXPVg
         uo8Kpzz78bbNrypk/0Hmv1mHpId2yqvzHUSyCVHdj8Y6qMsGnk/F6ufRZTrJ7XwDgKpc
         BzHMU9Deg3hoDCUlHiyjLZQKHkzQDC3ubGeJGiiL7Aq/xMle++qZKDk0Jqv3A4OtMK9Y
         IV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0+WvRM6QL9ZsiC3NdqIFBzhEB/eeWyfvCgRvtds3Vmc=;
        b=VGStoFqztF7blLgGoeDtYXjVFVaM4LmCXS4U3EcxjD0VpDaU5B4Nlh9SqwEh7dXqFV
         pW+Wmp4FkF4i9wARlOObpIGGPh0cDHnzgnJpDCGrZUQHhA6TLNiDcfM4PlMH6DFNKqGz
         nfaRzMVDOE+IBmAhEJJUdYzNrsFRC5Gm5BWTW9kMFwy8byr34BPrLHGYrzoPa3hmGW4L
         6tLfXcGuqUwRfVyTuJaF8KgdDk0Xxg/esmfs+fXuyjK4Y7u30eJARn6q5adubjJPfPYE
         gJvaoqWz9f3VWF2/uScAMzmg2UrymeQhkn/1Ub4LUdbNB3HTU3fAzRBNgWbYV73JjJC0
         jDkA==
X-Gm-Message-State: AOAM5316mvsdBFkfS/h0ZIrHB2xaBGqi9MLvTCo+Cv1FPYrnVZAiWU9g
	OkUWp27M/iBXzL0mW+AKMXCDSyRWcRcmc8jcQcA=
X-Google-Smtp-Source: ABdhPJwCI1RTrcpJK7Dy+3UoLe5VQs6108yU3lXVOec5J5VD7ceeaJPjx4kIYERF3wGqExVZmNP323jAo38yZ8c7k/k=
X-Received: by 2002:a50:eb82:: with SMTP id y2mr8549085edr.190.1619366282712;
 Sun, 25 Apr 2021 08:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
 <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
 <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
 <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com> <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
In-Reply-To: <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 25 Apr 2021 17:57:51 +0200
Message-ID: <CAJiuCcde=8f6Ms7_3se39AhN8TVHa1S2eq1N51d5CwT_TC+NBQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross@burtonini.com>, Martin Jansa <Martin.Jansa@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 25 Apr 2021 at 00:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Apr 24, 2021 at 2:48 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > To be honest, as this is Arm-specific I'd encourage adding it to
> > meta-arm instead of meta-oe.
>
> I would tend to agree, although there is something to consider it also
> means all arm SOCs will have to depend on meta-arm for this recipe
> which may not be a bad thing but some BSP layers for ARM based SOCs
> are independent

Ok, so I will submit this patch to meta-arm.

Clement

>
> >
> > (speaking as the meta-arm co-maintainer)
> >
> > Ross
> >
> > On Sat, 24 Apr 2021 at 12:29, Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
> > >
> > > Ah, even better than, but I would keep the recipe name as gator, if =
it's going to completely replace these older gator versions in other layers=
.
> > >
> > > On Sat, Apr 24, 2021 at 1:24 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
> > >>
> > >> Hi Martin,
> > >>
> > >> On Sat, 24 Apr 2021 at 12:45, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > >> >
> > >> > Why do you want to build only the daemon?
> > >> >
> > >> > There are already 4 variants of this recipe in various layers (at=
 least by what's reported on layerindex):
> > >> > http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-lina=
ro/recipes-kernel/gator/gator_git.bb?h=3Dmaster
> > >> > https://github.com/webosose/meta-webosose/blob/master/meta-webos/=
recipes-core/gator/gator_git.bb
> > >> > https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/=
gator/gator_git.bb
> > >> > https://github.com/robseb/meta-intelfpga/blob/master/recipes-devt=
ools/gator/gator_git.bb
> > >> >
> > >> > so sharing some recipe which would suit most of these needs in me=
ta-oe is definitely welcome, but starting with just a daemon will just comp=
licate things to these layers.
> > >>
> > >> New gator daemon doesn't need a kernel module anymore, it's now ful=
ly userspace.
> > >>
> > >> Regards,
> > >> Clement
> > >>
> > >> >
> > >> > But I understand that building the kernel modules for wider range=
 of kernels in different MACHINEs is quite pain (been there:
> > >> > https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a=
0a96cefefa49ebf397a383a88f1
> > >> > and given up shortly after:
> > >> > https://github.com/shr-project/meta-webosose/commit/d4bc575623dfb=
fad780fc39fef47d55d4d6e698d
> > >> > as I don't really use gator, it was just one of many build issues=
 in 'bitbake world' I was looking at).
> > >> >
> > >> > Regards,
> > >> >
> > >> > On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com> wrote:
> > >> >>
> > >> >> Hi,
> > >> >>
> > >> >> I have some questions regarding my patch.
> > >> >>
> > >> >> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:
> > >> >> >
> > >> >> > To communicate with the target device, Streamline requires the
> > >> >> > gator daemon, gatord, to be running on the device.
> > >> >>
> > >> >> Is gator the correct name for this package? or would gatord be b=
etter?
> > >> >>
> > >> >> >
> > >> >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > >> >> > ---
> > >> >> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24 ++++++++++=
+++++++++
> > >> >> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 ++++++++++=
+++++++
> > >> >> >  2 files changed, 46 insertions(+)
> > >> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-=
gator-don-t-strip-debug.patch
> > >> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0=
.bb
> > >> >> >
> > >> >> > diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-d=
on-t-strip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-do=
n-t-strip-debug.patch
> > >> >> > new file mode 100644
> > >> >> > index 000000000000..8e59fffa1fc2
> > >> >> > --- /dev/null
> > >> >> > +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-st=
rip-debug.patch
> > >> >> > @@ -0,0 +1,24 @@
> > >> >> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:0=
0:00 2001
> > >> >> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cp=
e@outsight.tech>
> > >> >> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
> > >> >> > +Subject: [PATCH] gator: don't strip debug
> > >> >> > +
> > >> >> > +---
> > >> >> > + daemon/Makefile | 2 --
> > >> >> > + 1 file changed, 2 deletions(-)
> > >> >> > +
> > >> >> > +diff --git a/daemon/Makefile b/daemon/Makefile
> > >> >> > +index ba5f29cfeb10..6807948310f9 100644
> > >> >> > +--- a/daemon/Makefile
> > >> >> > ++++ b/daemon/Makefile
> > >> >> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | c=
ut -f1 -d.` \>=3D 5),1)
> > >> >> > +       CXXFLAGS +=3D -fno-sized-deallocation
> > >> >> > + endif
> > >> >> > +
> > >> >> > +-# -s strips the binary of debug info
> > >> >> > +-LDFLAGS     +=3D -s
> > >> >> > + LDLIBS      +=3D -lrt -lm -pthread
> > >> >> > + TARGET      :=3D $(OBJ_DIR)gatord
> > >> >> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> > >> >> > +--
> > >> >> > +2.25.1
> > >> >> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/m=
eta-oe/recipes-devtools/gator/gator_7.5.0.bb
> > >> >> > new file mode 100644
> > >> >> > index 000000000000..8e15b1ca5fc5
> > >> >> > --- /dev/null
> > >> >> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> > >> >> > @@ -0,0 +1,22 @@
> > >> >> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
> > >> >> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM St=
reamline Performance Analyzer."
> > >> >> > +
> > >> >> > +LICENSE =3D "GPL-2.0-only"
> > >> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263"
> > >> >> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
> > >> >>
> > >> >> Gator git specifies that:
> > >> >>
> > >> >> -libsensors source code in daemon/libsensors licensed under LGPL=
-2.1-or-later
> > >> >> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
> > >> >> Mini-XML-exception
> > >> >> -perf_event.h from Linux userspace kernel headers in daemon/k li=
censed
> > >> >> under GPL-2.0-only WITH Linux-syscall-note.
> > >> >>
> > >> >> I'm not sure how to properly reflect this in the recipe.
> > >> >>
> > >> >> Thanks for your help,
> > >> >> Clement
> > >> >>
> > >> >> > +
> > >> >> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> > >> >> > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=
=
=3Dhttp;branch=3Dmaster \
> > >> >> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=
=3D.. \
> > >> >> > +         "
> > >> >> > +
> > >> >> > +S =3D "${WORKDIR}/git/daemon"
> > >> >> > +
> > >> >> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DE=
FAULT_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> > >> >> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=
=3D${TARGET_PREFIX}' \
> > >> >> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=
=3D'${CC}' CXX=3D'${CXX}'"
> > >> >> > +
> > >> >> > +do_install() {
> > >> >> > +       install -d ${D}${sbindir}
> > >> >> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> > >> >> > +}
> > >> >> > --
> > >> >> > 2.25.1
> > >> >> >
> > >> >>
> > >> >>
> > >> >>
> > >
> > >
> > >
> > >
> >
> >=20
> >
