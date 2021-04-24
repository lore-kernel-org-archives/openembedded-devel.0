Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4202.1619300872306760925
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 14:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=w3lB9CL8;
 spf=pass (domain: burtonini.com, ip: 209.85.128.43, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f43.google.com with SMTP id y204so26518859wmg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsN9nohr5MoyZTlcEkwUPZBcJY1VGIJFW2d0PYNTM34=;
        b=w3lB9CL8iCUV8G2XVEEo2Qpf3v9Hd6lBOXeuAkdWC5C5z3Av+2XATcC6PqVlN5T6k/
         O7LhBFjZEWfB96M4ppUVnVwXLhXvOlwn3hRxaofpNfjvmbkEI94rLTa2j930V1l9WVns
         av8vCXeqUw3xoJzwgx1dhmGbYaYbPWwIZ1YpJiUFWWpOAPunAJxYrCrIY1vilTCffN+7
         i86aXcVq/meg1cT8YKLTyGDOSBt8DmjFeYpKQmVIEoowDyZtJZc3kQ9KzOEMwlCorlkm
         rYRRXhWx+0eFfrvdNyKR1VAx+BUtPaSYG0pWY082l+7SH+6olERsq10rc43BB4vt8vY5
         KOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsN9nohr5MoyZTlcEkwUPZBcJY1VGIJFW2d0PYNTM34=;
        b=cK8e+LCJxth3X5ABJ1IOYxFM0SIRo1AugGAgUa/avf7sxfkHkwQF67KxgbxwsEN29C
         R+JYZMQ4mfzQYhMN045fRCfBSod+h4d1yBH+QMr5P5E4KGXD9kGSICyM1ZPxJRjFh4js
         gqlNwurNhWfA7PTWdlUEiap9zkIGQkiB5F7NdjHLHJaBpWH6K9TqzmMqEJYLMEgM7TVV
         AB79NHaPRd7HMK/JDElg9EzZoRs+bvz3GUsg0QI8KDg+LLNEMFF1az5H5nc9eVDcWSSI
         vAtVAxDuEj5zW2uusf52/7yd5pahcERYPgTLEUpNfFhvJIM7RS+kWrVyHXPUe3oCG3wB
         CFQQ==
X-Gm-Message-State: AOAM530HCK4STz+vsr6pDnmXzNfCX50RyTVbrR22Gutl0TzMReu+2Ssv
	u39q2MhQu13mAaMaVVXrmBUjqLURL6vdkj/wJOSYOg==
X-Google-Smtp-Source: ABdhPJw9n66NL4QV1FrcOjNwoD52NRu8Mxx9xg6Ol4a0ph/w3EwB/XaU7L4hdCt/SZhpe8Et28//IMGp00p9UeBViNc=
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr12504942wmk.63.1619300870769;
 Sat, 24 Apr 2021 14:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
 <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com> <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
In-Reply-To: <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Sat, 24 Apr 2021 22:47:40 +0100
Message-ID: <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To be honest, as this is Arm-specific I'd encourage adding it to
meta-arm instead of meta-oe.

(speaking as the meta-arm co-maintainer)

Ross

On Sat, 24 Apr 2021 at 12:29, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Ah, even better than, but I would keep the recipe name as gator, if it's=
 going to completely replace these older gator versions in other layers.
>
> On Sat, Apr 24, 2021 at 1:24 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmai=
l.com> wrote:
>>
>> Hi Martin,
>>
>> On Sat, 24 Apr 2021 at 12:45, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>> >
>> > Why do you want to build only the daemon?
>> >
>> > There are already 4 variants of this recipe in various layers (at lea=
st by what's reported on layerindex):
>> > http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro/r=
ecipes-kernel/gator/gator_git.bb?h=3Dmaster
>> > https://github.com/webosose/meta-webosose/blob/master/meta-webos/reci=
pes-core/gator/gator_git.bb
>> > https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/gato=
r/gator_git.bb
>> > https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtools=
/gator/gator_git.bb
>> >
>> > so sharing some recipe which would suit most of these needs in meta-o=
e is definitely welcome, but starting with just a daemon will just complica=
te things to these layers.
>>
>> New gator daemon doesn't need a kernel module anymore, it's now fully u=
serspace.
>>
>> Regards,
>> Clement
>>
>> >
>> > But I understand that building the kernel modules for wider range of =
kernels in different MACHINEs is quite pain (been there:
>> > https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a96=
cefefa49ebf397a383a88f1
>> > and given up shortly after:
>> > https://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfad7=
80fc39fef47d55d4d6e698d
>> > as I don't really use gator, it was just one of many build issues in =
'bitbake world' I was looking at).
>> >
>> > Regards,
>> >
>> > On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@g=
mail.com> wrote:
>> >>
>> >> Hi,
>> >>
>> >> I have some questions regarding my patch.
>> >>
>> >> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gm=
ail.com> wrote:
>> >> >
>> >> > To communicate with the target device, Streamline requires the
>> >> > gator daemon, gatord, to be running on the device.
>> >>
>> >> Is gator the correct name for this package? or would gatord be bette=
r?
>> >>
>> >> >
>> >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> >> > ---
>> >> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24 ++++++++++++++=
+++++
>> >> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 ++++++++++++++=
+++
>> >> >  2 files changed, 46 insertions(+)
>> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-gato=
r-don-t-strip-debug.patch
>> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb
>> >> >
>> >> > diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t=
-strip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-=
strip-debug.patch
>> >> > new file mode 100644
>> >> > index 000000000000..8e59fffa1fc2
>> >> > --- /dev/null
>> >> > +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-=
debug.patch
>> >> > @@ -0,0 +1,24 @@
>> >> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00=
 2001
>> >> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@ou=
tsight.tech>
>> >> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
>> >> > +Subject: [PATCH] gator: don't strip debug
>> >> > +
>> >> > +---
>> >> > + daemon/Makefile | 2 --
>> >> > + 1 file changed, 2 deletions(-)
>> >> > +
>> >> > +diff --git a/daemon/Makefile b/daemon/Makefile
>> >> > +index ba5f29cfeb10..6807948310f9 100644
>> >> > +--- a/daemon/Makefile
>> >> > ++++ b/daemon/Makefile
>> >> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -=
f1 -d.` \>=3D 5),1)
>> >> > +       CXXFLAGS +=3D -fno-sized-deallocation
>> >> > + endif
>> >> > +
>> >> > +-# -s strips the binary of debug info
>> >> > +-LDFLAGS     +=3D -s
>> >> > + LDLIBS      +=3D -lrt -lm -pthread
>> >> > + TARGET      :=3D $(OBJ_DIR)gatord
>> >> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
>> >> > +--
>> >> > +2.25.1
>> >> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/meta-=
oe/recipes-devtools/gator/gator_7.5.0.bb
>> >> > new file mode 100644
>> >> > index 000000000000..8e15b1ca5fc5
>> >> > --- /dev/null
>> >> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
>> >> > @@ -0,0 +1,22 @@
>> >> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
>> >> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Stream=
line Performance Analyzer."
>> >> > +
>> >> > +LICENSE =3D "GPL-2.0-only"
>> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263"
>> >> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
>> >>
>> >> Gator git specifies that:
>> >>
>> >> -libsensors source code in daemon/libsensors licensed under LGPL-2.1=
-or-later
>> >> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
>> >> Mini-XML-exception
>> >> -perf_event.h from Linux userspace kernel headers in daemon/k licens=
ed
>> >> under GPL-2.0-only WITH Linux-syscall-note.
>> >>
>> >> I'm not sure how to properly reflect this in the recipe.
>> >>
>> >> Thanks for your help,
>> >> Clement
>> >>
>> >> > +
>> >> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
>> >> > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dh=
ttp;branch=3Dmaster \
>> >> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D..=
 \
>> >> > +         "
>> >> > +
>> >> > +S =3D "${WORKDIR}/git/daemon"
>> >> > +
>> >> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAUL=
T_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
>> >> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=3D${T=
ARGET_PREFIX}' \
>> >> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${=
CC}' CXX=3D'${CXX}'"
>> >> > +
>> >> > +do_install() {
>> >> > +       install -d ${D}${sbindir}
>> >> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
>> >> > +}
>> >> > --
>> >> > 2.25.1
>> >> >
>> >>
>> >>
>> >>
>
>
>=20
>
