Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.546.1620313186660641833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 07:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XZNbPn3s;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q127so5197506qkb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5TBWhjYLbBa+O2g+c/sCb0WDM/t2jERltB6B24OPjWM=;
        b=XZNbPn3szyEGc4lPc8Z1x49kvTGzyVsmCv6vUjRjjkpGRqnoxHDZutIqhM76EngU4L
         bSpT5LEudegDkvMhySXxC4b98uRCyzYesPc4cCUDkZc+L8gvE9bvEkdsm/FAG2N4hLJJ
         OhbeLeYMWt1//fKzCLjay2wvyLVrSGXw43m13pkyEqAdMPEEzqGqLUv3TemaBRSs9jX3
         N02RS/epzP+szt8YQ9t4hPd/Las24b6/f45e3tM89P4S0ZjOyLpdbLW8aBwi+bhUYRQc
         gsaAmdaSMyqKMuIyPiyMd7K0FzeeBOvRyMKItF9tjOs3TWHqQ7/A2r6rCVfzLKO0nreQ
         EKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5TBWhjYLbBa+O2g+c/sCb0WDM/t2jERltB6B24OPjWM=;
        b=Oam8J124YZu62SgB1tFJ3oaCXJOv9c+1UvBHAlrbjVKsusNIRUYoBCExJekP2pYDQD
         9Jh7JAJBBGUqeGJhESKDwvgO71P4t5mMNEiypqm7ppFxLEizZUGX2CfFhZfIGPB1b332
         /j3F2LaP+kjMD4Hs3mgbzBHwj1OtPYyew0HzTRxyA2NPwtwMiUQ/WrQNi0Ni0Rar76ne
         xdywG3LOyxsbP8nZedrr/7ZAaCKDXB/cy+11poViN2V23FxXmRRqGDedweR3Bz8HuGAb
         VR6xmsREpRjql3/Gk/bhYokz6jdhnPAozQ7r+O/azWsFWDzEBjH4DvLhWTIDWzRcznpu
         h9qQ==
X-Gm-Message-State: AOAM532d801jqvY5up6UD5OwX4droxKaT3f5XOmAgqZAuTSzectrjtrw
	opMJrXCuTpxSBA51MzOBKTCqugaY9pK275+FKowqk6JISeaILw==
X-Google-Smtp-Source: ABdhPJxFr7obsNye3Y6RhaqQPsfXjPUWjiXSd/ZmslBFvROodvegelxEB/tAP3irrrktYuWPsGUrdSH7tSZmc5aSPA8=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr4390936qky.125.1620313185735;
 Thu, 06 May 2021 07:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210505215026.1339351-1-Martin.Jansa@gmail.com> <CAMKF1soMMAPpwS5meeJbhJn_mB4pX8i+AYO4ocEacYe3wq5YQQ@mail.gmail.com>
In-Reply-To: <CAMKF1soMMAPpwS5meeJbhJn_mB4pX8i+AYO4ocEacYe3wq5YQQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 6 May 2021 07:59:19 -0700
Message-ID: <CAMKF1so2gJRf6TWMdqs-C41tu7Qw2-TFvjoO_=9KnmsEkAVY3A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCH] python3-m2crypto: restore m2crypto-0.26.4-gcc_macros.patch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on musl builds

https://errors.yoctoproject.org/Errors/Details/580240/

On Wed, May 5, 2021 at 3:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks, I guess I forgot that it was added for fixing same reason and
> by me :) so I should have known better but as always thanks for
> providing the fix.
>
> On Wed, May 5, 2021 at 2:50 PM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
> >
> > * m2crypto-0.26.4-gcc_macros.patch was dropped as unnecessary
> >   in the upgrade to 0.37.1 but for aarch64 it still seems to
> >   be needed at least in some setups otherwise swig fails with:
> >   http://errors.yoctoproject.org/Errors/Details/580206/
> >   swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3=
-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../li=
b/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/w=
ork/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr=
/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.=
0/include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto=
/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/=
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot=
/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.=
37.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-lin=
ux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/i=
nclude/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/c=
ortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SW=
IG/_m2crypto_wrap.c SWIG/_m2crypto.i
> >   TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/=
recipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find =
'openssl/opensslconf-32.h'
> >
> > * if I drop the -includeall from swig call I get a bit more reasonable=
 error message:
> >   Preprocessing...
> >   /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto=
/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: CPP =
#error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to con=
tinue swig processing.
> >
> > * gcc_macros.h is generated by do_configure_prepend, if
> >   this patch really isn't needed, then the do_configure_prepend
> >   should probably be dropped as well
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../0001-import-gcc_macros.h.patch            | 59 ++++++++++++++++++=
+
> >  .../python/python3-m2crypto_0.37.1.bb         |  1 +
> >  2 files changed, 60 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-m2cryp=
to/0001-import-gcc_macros.h.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001=
-import-gcc_macros.h.patch b/meta-python/recipes-devtools/python/python3-m2=
crypto/0001-import-gcc_macros.h.patch
> > new file mode 100644
> > index 0000000000..3c6d584983
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-import=
-gcc_macros.h.patch
> > @@ -0,0 +1,59 @@
> > +From 1364722439a0a36e3f57119dd45de666d213888c Mon Sep 17 00:00:00 200=
1
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Wed, 5 May 2021 21:34:35 +0000
> > +Subject: [PATCH] import gcc_macros.h
> > +
> > +* it was dropped as unnecessary in the upgrade to 0.37.1 but for
> > +  aarch64 it still seems to be needed at least in some setups
> > +  otherwise swig fails with:
> > +  http://errors.yoctoproject.org/Errors/Details/580206/
> > +  swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python=
3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../l=
ib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/=
work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/us=
r/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1=
.0/include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR=
/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroo=
t/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-li=
nux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/=
include/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/=
cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o S=
WIG/_m2crypto_wrap.c SWIG/_m2crypto.i
> > +  TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0=
/recipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find=
 'openssl/opensslconf-32.h'
> > +
> > +* if I drop the -includeall from swig call I get a bit more reasonabl=
e error message:
> > +  Preprocessing...
> > +  /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: CPP=
 #error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to co=
ntinue swig processing.
> > +
> > +* maybe we need newer swig, the regenerated m2crypto.py shows
> > +  that it was generated with 4.0.2 before while meta-oe has 3.0.12
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + SWIG/_m2crypto.i  |  10 +-
> > + 2 files changed, 737 insertions(+), 5 deletions(-)
> > + create mode 100644 SWIG/gcc_macros.h
> > +
> > +diff --git a/SWIG/_m2crypto.i b/SWIG/_m2crypto.i
> > +index e300a10..3d51c22 100644
> > +--- a/SWIG/_m2crypto.i
> > ++++ b/SWIG/_m2crypto.i
> > +@@ -8,6 +8,11 @@
> > +  *
> > +  */
> > +
> > ++%import "gcc_macros.h"
> > ++
> > ++%ignore WCHAR_MAX;
> > ++%ignore WCHAR_MIN;
> > ++
> > + %module(threads=3D1) m2crypto
> > + /* We really don't need threadblock (PyGILState_Ensure() etc.) anywh=
ere.
> > +    Disable threadallow as well, only enable it for operations likely=
 to
> > +@@ -15,10 +20,6 @@
> > + %nothreadblock;
> > + %nothreadallow;
> > +
> > +-#if SWIG_VERSION >=3D 0x030000
> > +-#define __WCHAR_MAX__ __WCHAR_MAX
> > +-#define __WCHAR_MIN__ __WCHAR_MIN
> > +-#endif
> > + /* https://gitlab.com/m2crypto/m2crypto/issues/246 */
> > + %ignore WCHAR_MAX;
> > + %ignore WCHAR_MIN;
> > +@@ -103,4 +104,3 @@ static PyObject *x509_store_verify_cb_func;
> > + %constant int encrypt =3D 1;
> > + %constant int decrypt =3D 0;
> > + #endif
> > +-
> > diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37=
.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > index 896d9d2cc4..84400da002 100644
> > --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > @@ -10,6 +10,7 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot-n=
ot-in-host-directories.patch \
> >              file://cross-compile-platform.patch \
> >              file://0001-Allow-verify_cb_-to-be-called-with-ok-True.pa=
tch \
> >              file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated=
.patch \
> > +            file://0001-import-gcc_macros.h.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b=
91e4fff5598cfff6fb3"
> >
> > --
> > 2.30.2
> >
> >
> >=20
> >
