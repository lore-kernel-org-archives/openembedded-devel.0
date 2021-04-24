Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.4513.1619302327926844939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 15:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IH0jEX9G;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id i12so21591539qke.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/JD8uhVcUm3e8GIMZaClc1/I8+nGCANHSkjFBv61vYo=;
        b=IH0jEX9GzJLB6s/OQ/Z6tE1hCw+FE/RVV1hvP61iuwKOvGuyu1+PhZEWhoT/2hA/b7
         zjwaLYiss993Q1ALijWDJRo7qOcuyfdcy/dXfCmZp6hvHgy+stlK1uaPPyVCNFnvASws
         DR5AzEpo+XnWnZJG5gSQAujoKiuv5lu/ZWd7s4I3XdRBvi6nq7V4Uq/9htet88bwDxja
         hFp/X7bHzzPsqbLrKRSOQl3DxHOLiGc01aIxp4b/yqTjgWNRZj6mH9mnZVULvuGVTjV7
         EeYwkwKrx75ghZUEekyQCKg5eEBYKlZ/SXEPYpuM7PzcAfam6rYny3aBHuUIXkrlrVpL
         hp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/JD8uhVcUm3e8GIMZaClc1/I8+nGCANHSkjFBv61vYo=;
        b=KT1xnqwO1Yk4efPgG20oiYM79Rb1KB+l6O275ffLOS7umbNVX4iEQ4G5hg6SXM09ki
         SYwfGR0AgbpeguF9B8xwF0REaQ7CmxVlbsr0ViOXFG4tFQ+mRq/tA4RgWg9+M+nCW7qS
         ucXeUwNhFIMhQzXIgiyd9wSBPwRT9UKEIEVgq/IxFZneMg40SH/1/Oeh+3ztL7c8sh+Y
         UdtLDlBt9Zv14F0B7ZJuSC9Z/4yomFqgja/1LF0pU04QHxTm82KB9YV2U+dAvxATJpFw
         6awdWLIyT2OU8J+MUKYvqgacrQSLJ9B7fMW5cJW6IGnBqRFODAo3/cvrKCHT03igL3in
         Kqmg==
X-Gm-Message-State: AOAM530CayciSszcguVN5tFGF4M5nBMnyyM0gr5uK9skXl2yhFn7VlS+
	qWXzrMZ6bCSEJaa2cq1/t4tlfnm4hKRgKRGYbTA=
X-Google-Smtp-Source: ABdhPJyDnt0qvBiZEm4nD4q5VRMy4tyVpXr+spNbb818fhfN18e4lYkjSxZ3PfxtzEy290ib6UYY0YKICdooypBd/3s=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr10411144qkd.381.1619302326861;
 Sat, 24 Apr 2021 15:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
 <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
 <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com> <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com>
In-Reply-To: <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 24 Apr 2021 15:11:40 -0700
Message-ID: <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Ross Burton <ross@burtonini.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 24, 2021 at 2:48 PM Ross Burton <ross@burtonini.com> wrote:
>
> To be honest, as this is Arm-specific I'd encourage adding it to
> meta-arm instead of meta-oe.

I would tend to agree, although there is something to consider it also
means all arm SOCs will have to depend on meta-arm for this recipe
which may not be a bad thing but some BSP layers for ARM based SOCs
are independent

>
> (speaking as the meta-arm co-maintainer)
>
> Ross
>
> On Sat, 24 Apr 2021 at 12:29, Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
> >
> > Ah, even better than, but I would keep the recipe name as gator, if it=
's going to completely replace these older gator versions in other layers.
> >
> > On Sat, Apr 24, 2021 at 1:24 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gm=
ail.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On Sat, 24 Apr 2021 at 12:45, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >> >
> >> > Why do you want to build only the daemon?
> >> >
> >> > There are already 4 variants of this recipe in various layers (at l=
east by what's reported on layerindex):
> >> > http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro=
/recipes-kernel/gator/gator_git.bb?h=3Dmaster
> >> > https://github.com/webosose/meta-webosose/blob/master/meta-webos/re=
cipes-core/gator/gator_git.bb
> >> > https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/ga=
tor/gator_git.bb
> >> > https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtoo=
ls/gator/gator_git.bb
> >> >
> >> > so sharing some recipe which would suit most of these needs in meta=
-oe is definitely welcome, but starting with just a daemon will just compli=
cate things to these layers.
> >>
> >> New gator daemon doesn't need a kernel module anymore, it's now fully=
 userspace.
> >>
> >> Regards,
> >> Clement
> >>
> >> >
> >> > But I understand that building the kernel modules for wider range o=
f kernels in different MACHINEs is quite pain (been there:
> >> > https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a=
96cefefa49ebf397a383a88f1
> >> > and given up shortly after:
> >> > https://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfa=
d780fc39fef47d55d4d6e698d
> >> > as I don't really use gator, it was just one of many build issues i=
n 'bitbake world' I was looking at).
> >> >
> >> > Regards,
> >> >
> >> > On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> I have some questions regarding my patch.
> >> >>
> >> >> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@=
gmail.com> wrote:
> >> >> >
> >> >> > To communicate with the target device, Streamline requires the
> >> >> > gator daemon, gatord, to be running on the device.
> >> >>
> >> >> Is gator the correct name for this package? or would gatord be bet=
ter?
> >> >>
> >> >> >
> >> >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >> >> > ---
> >> >> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24 ++++++++++++=
+++++++
> >> >> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 ++++++++++++=
+++++
> >> >> >  2 files changed, 46 insertions(+)
> >> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-ga=
tor-don-t-strip-debug.patch
> >> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.b=
b
> >> >> >
> >> >> > diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don=
-t-strip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-=
t-strip-debug.patch
> >> >> > new file mode 100644
> >> >> > index 000000000000..8e59fffa1fc2
> >> >> > --- /dev/null
> >> >> > +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-stri=
p-debug.patch
> >> >> > @@ -0,0 +1,24 @@
> >> >> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:=
00 2001
> >> >> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@=
outsight.tech>
> >> >> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
> >> >> > +Subject: [PATCH] gator: don't strip debug
> >> >> > +
> >> >> > +---
> >> >> > + daemon/Makefile | 2 --
> >> >> > + 1 file changed, 2 deletions(-)
> >> >> > +
> >> >> > +diff --git a/daemon/Makefile b/daemon/Makefile
> >> >> > +index ba5f29cfeb10..6807948310f9 100644
> >> >> > +--- a/daemon/Makefile
> >> >> > ++++ b/daemon/Makefile
> >> >> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut=
 -f1 -d.` \>=3D 5),1)
> >> >> > +       CXXFLAGS +=3D -fno-sized-deallocation
> >> >> > + endif
> >> >> > +
> >> >> > +-# -s strips the binary of debug info
> >> >> > +-LDFLAGS     +=3D -s
> >> >> > + LDLIBS      +=3D -lrt -lm -pthread
> >> >> > + TARGET      :=3D $(OBJ_DIR)gatord
> >> >> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> >> >> > +--
> >> >> > +2.25.1
> >> >> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/met=
a-oe/recipes-devtools/gator/gator_7.5.0.bb
> >> >> > new file mode 100644
> >> >> > index 000000000000..8e15b1ca5fc5
> >> >> > --- /dev/null
> >> >> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> >> >> > @@ -0,0 +1,22 @@
> >> >> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
> >> >> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Stre=
amline Performance Analyzer."
> >> >> > +
> >> >> > +LICENSE =3D "GPL-2.0-only"
> >> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263"
> >> >> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
> >> >>
> >> >> Gator git specifies that:
> >> >>
> >> >> -libsensors source code in daemon/libsensors licensed under LGPL-2=
.1-or-later
> >> >> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
> >> >> Mini-XML-exception
> >> >> -perf_event.h from Linux userspace kernel headers in daemon/k lice=
nsed
> >> >> under GPL-2.0-only WITH Linux-syscall-note.
> >> >>
> >> >> I'm not sure how to properly reflect this in the recipe.
> >> >>
> >> >> Thanks for your help,
> >> >> Clement
> >> >>
> >> >> > +
> >> >> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> >> >> > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=
=3Dhttp;branch=3Dmaster \
> >> >> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D=
.. \
> >> >> > +         "
> >> >> > +
> >> >> > +S =3D "${WORKDIR}/git/daemon"
> >> >> > +
> >> >> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFA=
ULT_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> >> >> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=3D$=
{TARGET_PREFIX}' \
> >> >> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'=
${CC}' CXX=3D'${CXX}'"
> >> >> > +
> >> >> > +do_install() {
> >> >> > +       install -d ${D}${sbindir}
> >> >> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> >> >> > +}
> >> >> > --
> >> >> > 2.25.1
> >> >> >
> >> >>
> >> >>
> >> >>
> >
> >
> >
> >
>
>=20
>
