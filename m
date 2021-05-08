Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.3255.1620453080505315907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 May 2021 22:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vGFfofHX;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id a2so10737536qkh.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 May 2021 22:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=57qVAj+g2ehoEKmPSvnyxxfF40N5GF4OicL3VCminzI=;
        b=vGFfofHXhukgc2RDEIAg+dbqmm/lWdRmaWAQiUgx+Xp85gq7ZWYRRKjlzKx6iu9KGt
         Su1PSoYJzWSN6pd0I9STf5nTt2y7vrNat0nMdyR9nbqZkpu/LQ1nyOfQMZFsj3165Dcc
         Etjqw1//A+cRbx9RX4a3C5zyMb3X/mULnqyzX9NCrccZyisy3rHqfL6lcm5PbniHqXY1
         BcgZf13hwAeK0X8/JfHJDoXtOadx1Yrfn6S8yXoq0JaAuu7hw1VFJq0Z/HZlL12KQF31
         zek/bItIdISi8OasQWZsyOd8Lqgdjjns0J4/eZ5o5olBf+ilOqH3+qAwUqP0g8WCvBu3
         OF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=57qVAj+g2ehoEKmPSvnyxxfF40N5GF4OicL3VCminzI=;
        b=Fisdht5TPJzB+dOpq5DeWVx5M8F4AkDrlCyD9oDoodCoMymTu+uyUhwFBWoJKwR4EO
         00OeeT54CBdtkB6EmwiJEdWriRNEjGGYJi8kEwtVUfdXEkjRK8dLrKsswZ0Jm2IScPYA
         GFrNwS/82m8n8cq7U9w1Vs7hf1C5DsUikMiUvdpod8wpKHiSqgxOY09dJBi000pcqP1U
         3eMiE5Lh9iTyxqx+kIZgXhnudvmu7SqOi0sceqjydx9Djo66zR9TLardk2cNpFdWoG5G
         JVihxHckAOuk0xkulbihjWfGkP/0XFxXQlIT/To5SA8o8BaN65FcOtrufHkS0QZ4ZMMj
         KV2Q==
X-Gm-Message-State: AOAM531TFouNyuXc/eJZrMaAnL08e0I3eVl2Vc066J9lLyhnanwXZeci
	pmTIrEWsgJKlwjbzoL4gtto9qJL4wWqVUK3FkhI=
X-Google-Smtp-Source: ABdhPJziaDv3iYxWrQzT45vQcDZ+ZuZNfHJAKQhZ1/i0JhQGC0DGg8GgrKDSsyNLlqZNxDzNttL5/OekfpkxAyr2cfk=
X-Received: by 2002:a37:9607:: with SMTP id y7mr13286556qkd.25.1620453079545;
 Fri, 07 May 2021 22:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210505215026.1339351-1-Martin.Jansa@gmail.com>
 <CAMKF1soMMAPpwS5meeJbhJn_mB4pX8i+AYO4ocEacYe3wq5YQQ@mail.gmail.com> <CAMKF1so2gJRf6TWMdqs-C41tu7Qw2-TFvjoO_=9KnmsEkAVY3A@mail.gmail.com>
In-Reply-To: <CAMKF1so2gJRf6TWMdqs-C41tu7Qw2-TFvjoO_=9KnmsEkAVY3A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 7 May 2021 22:50:52 -0700
Message-ID: <CAMKF1sogZt-y=113BxbWX1DKJPupEtQ9713npa6+satGor-SqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCH] python3-m2crypto: restore m2crypto-0.26.4-gcc_macros.patch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin

I have sent another simpler fix, please test it in your environment,
this macros patch is a hack and has many issues, thats why I wanted to
drop it in the first place.

On Thu, May 6, 2021 at 7:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails on musl builds
>
> https://errors.yoctoproject.org/Errors/Details/580240/
>
> On Wed, May 5, 2021 at 3:08 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Thanks, I guess I forgot that it was added for fixing same reason and
> > by me :) so I should have known better but as always thanks for
> > providing the fix.
> >
> > On Wed, May 5, 2021 at 2:50 PM Martin Jansa <Martin.Jansa@gmail.com> w=
rote:
> > >
> > > * m2crypto-0.26.4-gcc_macros.patch was dropped as unnecessary
> > >   in the upgrade to 0.37.1 but for aarch64 it still seems to
> > >   be needed at least in some setups otherwise swig fails with:
> > >   http://errors.yoctoproject.org/Errors/Details/580206/
> > >   swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/pytho=
n3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../=
lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc=
/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/u=
sr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.=
1.0/include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2cryp=
to/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDI=
R/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysro=
ot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/=
0.37.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-l=
inux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr=
/include/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work=
/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o =
SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
> > >   TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r=
0/recipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to fin=
d 'openssl/opensslconf-32.h'
> > >
> > > * if I drop the -includeall from swig call I get a bit more reasonab=
le error message:
> > >   Preprocessing...
> > >   /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2cryp=
to/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: CP=
P #error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to c=
ontinue swig processing.
> > >
> > > * gcc_macros.h is generated by do_configure_prepend, if
> > >   this patch really isn't needed, then the do_configure_prepend
> > >   should probably be dropped as well
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  .../0001-import-gcc_macros.h.patch            | 59 ++++++++++++++++=
+++
> > >  .../python/python3-m2crypto_0.37.1.bb         |  1 +
> > >  2 files changed, 60 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-m2cr=
ypto/0001-import-gcc_macros.h.patch
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/00=
01-import-gcc_macros.h.patch b/meta-python/recipes-devtools/python/python3-=
m2crypto/0001-import-gcc_macros.h.patch
> > > new file mode 100644
> > > index 0000000000..3c6d584983
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-impo=
rt-gcc_macros.h.patch
> > > @@ -0,0 +1,59 @@
> > > +From 1364722439a0a36e3f57119dd45de666d213888c Mon Sep 17 00:00:00 2=
001
> > > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > > +Date: Wed, 5 May 2021 21:34:35 +0000
> > > +Subject: [PATCH] import gcc_macros.h
> > > +
> > > +* it was dropped as unnecessary in the upgrade to 0.37.1 but for
> > > +  aarch64 it still seems to be needed at least in some setups
> > > +  otherwise swig fails with:
> > > +  http://errors.yoctoproject.org/Errors/Details/580206/
> > > +  swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/pyth=
on3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../..=
/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glib=
c/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/=
usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11=
.1.0/include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2cry=
pto/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPD=
IR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysr=
oot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto=
/0.37.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-=
linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/us=
r/include/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/wor=
k/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o=
 SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
> > > +  TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-=
r0/recipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to fi=
nd 'openssl/opensslconf-32.h'
> > > +
> > > +* if I drop the -includeall from swig call I get a bit more reasona=
ble error message:
> > > +  Preprocessing...
> > > +  /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2cry=
pto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: C=
PP #error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to =
continue swig processing.
> > > +
> > > +* maybe we need newer swig, the regenerated m2crypto.py shows
> > > +  that it was generated with 4.0.2 before while meta-oe has 3.0.12
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > +---
> > > + SWIG/_m2crypto.i  |  10 +-
> > > + 2 files changed, 737 insertions(+), 5 deletions(-)
> > > + create mode 100644 SWIG/gcc_macros.h
> > > +
> > > +diff --git a/SWIG/_m2crypto.i b/SWIG/_m2crypto.i
> > > +index e300a10..3d51c22 100644
> > > +--- a/SWIG/_m2crypto.i
> > > ++++ b/SWIG/_m2crypto.i
> > > +@@ -8,6 +8,11 @@
> > > +  *
> > > +  */
> > > +
> > > ++%import "gcc_macros.h"
> > > ++
> > > ++%ignore WCHAR_MAX;
> > > ++%ignore WCHAR_MIN;
> > > ++
> > > + %module(threads=3D1) m2crypto
> > > + /* We really don't need threadblock (PyGILState_Ensure() etc.) any=
where.
> > > +    Disable threadallow as well, only enable it for operations like=
ly to
> > > +@@ -15,10 +20,6 @@
> > > + %nothreadblock;
> > > + %nothreadallow;
> > > +
> > > +-#if SWIG_VERSION >=3D 0x030000
> > > +-#define __WCHAR_MAX__ __WCHAR_MAX
> > > +-#define __WCHAR_MIN__ __WCHAR_MIN
> > > +-#endif
> > > + /* https://gitlab.com/m2crypto/m2crypto/issues/246 */
> > > + %ignore WCHAR_MAX;
> > > + %ignore WCHAR_MIN;
> > > +@@ -103,4 +104,3 @@ static PyObject *x509_store_verify_cb_func;
> > > + %constant int encrypt =3D 1;
> > > + %constant int decrypt =3D 0;
> > > + #endif
> > > +-
> > > diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.=
37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > > index 896d9d2cc4..84400da002 100644
> > > --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> > > @@ -10,6 +10,7 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot=
-not-in-host-directories.patch \
> > >              file://cross-compile-platform.patch \
> > >              file://0001-Allow-verify_cb_-to-be-called-with-ok-True.=
patch \
> > >              file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecat=
ed.patch \
> > > +            file://0001-import-gcc_macros.h.patch \
> > >             "
> > >  SRC_URI[sha256sum] =3D "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace494=
0b91e4fff5598cfff6fb3"
> > >
> > > --
> > > 2.30.2
> > >
> > >
> > >=20
> > >
