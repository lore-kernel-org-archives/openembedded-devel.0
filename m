Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.151.1587407175358124037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 11:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eu1b/u2a;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: andrea.adami@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id o15so4917537pgi.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F2XupmBJG2CZXHi0aUMqkwTb5QOWb+xaGohVI6mvtao=;
        b=eu1b/u2aAfYxPRUSRK2ZT0fhSYQX32Q7Hv+x8k6z5/PUUo1WhDmP6Njog+bo6S1kYg
         PQ7x+x09jifqBIFaw1+DnVCZdVSItmzGv3FsagKSGkpEjDJV1Ad8Uju0NZAQE5UvB/H7
         +J5IjzTCNhQrbzkcQDVqjYBgwFbpPwODTb8t6yDaDpys5T2HiR+QuxBoRYmvXQNssATu
         eswWBPvdqcR8xK8TznHKLQX6nN46BjEEjmzsCMNH/zpkDuKCwQCcoDCGK7CLA6pABw5/
         /YbDK3YeFzTvzpGgx7rAPTRXx96Yo4JbWpnc8NXruZs1MTlL3HYub3mB7p1UdD+gn7g/
         ctFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2XupmBJG2CZXHi0aUMqkwTb5QOWb+xaGohVI6mvtao=;
        b=EM9YBObVrklrG3eQ1i2sGrjPzifbKtOcRoJKliLPMOU/uWOyVfZ7cPN1eblOX/bG8V
         tOHptmNwnRrtUhA0U2Vt7v1e8L5REvUzs2HIZduILpl5tWxB9gYERst82b0Tph5plc7N
         jzqPwHugqS3vZxl5pGTh3fjOkhyvCUpK5u85FtVaYNr/7bmJQ1C29Z16f2n/YqaJmDp8
         dN3IZ0CK4HbpMhYuEEayqNwwL5vNtjHfWGPlrNSkd2dQzW9UlZBdNK2BfHff1VFz8tDy
         UyJj6QH7C1y2DWgz18OQDfSqcMUf9olD4pW33klBW87WY/frW4YuNygZxMka4aFBDtey
         Hwjg==
X-Gm-Message-State: AGi0PuYZ53GlOH7LjTtfcfPIq1dNKWJJg+knMpDhpjfuf5fFHoLW5s2p
	CCbxxvZGf1S0Jtae6oXQNoYKJFV5ryguy9wcMc/SAN09
X-Google-Smtp-Source: APiQypJbxUsET1IZaIBUsDHE8XyFOmbe/FJ8p4mqR3AegIqaa2IivnlrfoqW+dG9QpVJo85035+aZkDAKUb0YsVokNo=
X-Received: by 2002:a63:b251:: with SMTP id t17mr16820971pgo.44.1587407174642;
 Mon, 20 Apr 2020 11:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200420170656.10895-1-andrea.adami@gmail.com> <CAMKF1sr+nAmaQzpN_eWvsS8_KdyfzHdF7AfgDdhsWRgmgO=3YA@mail.gmail.com>
In-Reply-To: <CAMKF1sr+nAmaQzpN_eWvsS8_KdyfzHdF7AfgDdhsWRgmgO=3YA@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 20 Apr 2020 20:26:03 +0200
Message-ID: <CAAQYJAuXKGz8vH11d05D9f_uN0YC4CghdC=ZOL6=XAfESUVX8g@mail.gmail.com>
Subject: Re: [oe] [meta-handheld][PATCH 1/4] zaurusd: fix build with kernels < 4.16 and newer libc headers
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 20, 2020 at 7:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 20, 2020 at 10:07 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > The Y2038 changes broke the build for older 32bit devices using
> > older kernels.
> >
> > As seen on: https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  .../zaurusd/zaurusd/add_64bit_time_t.patch    | 43 +++++++++++++++++++
> >  recipes-bsp/zaurusd/zaurusd_git.bb            |  3 +-
> >  2 files changed, 45 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> >
> > diff --git a/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> > new file mode 100644
> > index 0000000..5f9587a
> > --- /dev/null
> > +++ b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> > @@ -0,0 +1,43 @@
> > +From d15b20fd9e8927db5dc4303f2e6c11cfa8d6fe95 Mon Sep 17 00:00:00 2001
> > +From: Andrea Adami <andrea.adami@gmail.com>
> > +Date: Mon, 20 Apr 2020 16:21:22 +0200
> > +Subject: [PATCH] tskeys.c: add support for 64bit time_t
> > +
> > +Upgrade the recipe to cope with the 64-bit time changes introduced in 4.16
> > +
> > +Fix:
> > +
> > +| tskeys.c: In function 'press_key':
> > +| tskeys.c:141:4: error: 'struct input_event' has no member named 'time'
> > +|   141 |  ev.time.tv_sec = time(0);
> > +|       |    ^
> > +| tskeys.c:142:4: error: 'struct input_event' has no member named 'time'
> > +|   142 |  ev.time.tv_usec = 0;
> > +|       |    ^
> > +
> > +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > +---
> > + apps/tskeys/tskeys.c | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c
> > +index 264dfb7..36e3bfd 100644
> > +--- a/apps/tskeys/tskeys.c
> > ++++ b/apps/tskeys/tskeys.c
> > +@@ -138,8 +138,13 @@ void press_key(int fd, int key, int pressed)
> > +       struct input_event ev;
> > +       int r;
> > +
> > ++#if !defined(__USE_TIME_BITS64)
> > +       ev.time.tv_sec = time(0);
> > +       ev.time.tv_usec = 0;
> > ++#else
> > ++      ev.input_event_sec = time(0);
> > ++      ev.input_event_usec = 0;
> > ++#endif
>
> does this work with musl ?
>


Yes, actually I tested it on musl first.

Build Configuration:
BB_VERSION           = "1.46.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-18.04"
TARGET_SYS           = "arm-oe-linux-musleabi"
MACHINE              = "spitz"
DISTRO               = "nodistro"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm armv5 thumb dsp"
TARGET_FPU           = "soft"
meta                 = "master-next:b450b0a2f5df27c4ea903ae9c5f6f5b96b9ddfc3"
meta-oe              = "master-next:205440e40f9a2d37a4f48391b03673a4aa042982"
meta-handheld        = "master:a876aaa33317d388aa2e865f665fe6cc58d500a7"




> > +       ev.type = EV_KEY;
> > +       ev.code = key;
> > +       ev.value = pressed;
> > +--
> > +2.17.1
> > +
> > diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
> > index d69805b..1f8e40b 100644
> > --- a/recipes-bsp/zaurusd/zaurusd_git.bb
> > +++ b/recipes-bsp/zaurusd/zaurusd_git.bb
> > @@ -24,7 +24,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
> >             file://01-check-toggle-portait \
> >             file://use-ts-symlink-instead-of-hardcoding.diff \
> >             file://0001-zaurusd-add-support-for-collie.patch \
> > -           file://allow-newer-tslib.patch"
> > +           file://allow-newer-tslib.patch \
> > +           file://add_64bit_time_t.patch"
> >
> >
> >  S = "${WORKDIR}/git"
> > --
> > 2.17.1
> >
> > 
