Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.309.1620252557218255256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 15:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sed+Z4cu;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id u7so2087011qvv.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 15:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KLUmO+R6QhVRsMPvdDBY0re657TLFqR/RoRdpEKthX4=;
        b=sed+Z4cubyiKR3jBD2aLIlk0l7zBSdiYicUBXuyO9R3MVwZjo1hhMGY/pPgc7aE9e/
         x0cPBVKPJPA8v8CbzeZkoi84s0Ri7Hk2XrL7/KkxncDs/tlGdlt2qVBdmxfXqSx9Cg/2
         OioCbi5HJ9RQnzGNsMmV9zaOhy0OAyFZa/hr1wl0jfuUFDzj647hlT02ssbMPCUDpmOL
         ceC+8Hzuay5TT6aSln66BrgQ72UaEzJ9Gv4DoKPfBl8UMcwijY/JPsL5yGnpAL+xB6wv
         hxWu6nRH+mGmoywiQaeLDXafCJBkOumOpVAC/i2w5OhGzGX+yPFrNuPN6mi5AHO+fFwX
         IVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KLUmO+R6QhVRsMPvdDBY0re657TLFqR/RoRdpEKthX4=;
        b=CkRYqUa1pmSdV+bx7Mxb2a93ML/ezaonlDGGQ+W94BD3OyaqM03XtW2TCa3mP/M+f0
         N2DkE2unLJUT/oLdACLpPx5yHtb6S/ydPBYLIMtYMc9cLnIIqZ4BVWUEX7NydfOmbqJD
         o+6YncMFy4GnqCb4Y9+gW5ke7BCmbbEjV/jsAkt3ZkpMEUsyxmQ2oyS4XMizDR+4Qmzl
         zWt9aer9EVxJnKTU6DY54W2rq+65psUislHPGrO2eeMe9VzUa61RfDjfX4zPb79Pn76p
         Gu2Amuf0L+5hXdUHcBw+wAv6DRz0Rcw5nDUxZ3CuVbEKZZj5M5LF6DVt9aP9weBSCm+c
         Vyxg==
X-Gm-Message-State: AOAM531rsEIOxQ/uiZoLl4PqffvP+X/29lD4vWyQK+WTMdwDjSGu4Qyq
	FeUaN3rGPBI9U3J3oaYAN22/UNdVmMn9d62FCQE=
X-Google-Smtp-Source: ABdhPJxtVDbjywI6J/9wrvl4JAaTJGfi4g2mgC23nPStnBcl8Bjgfo3bLnbjk/NHI9Aa74reMdPYitZikEkTA1kMyMQ=
X-Received: by 2002:a0c:b218:: with SMTP id x24mr936308qvd.55.1620252556300;
 Wed, 05 May 2021 15:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210505215026.1339351-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210505215026.1339351-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:08:50 -0700
Message-ID: <CAMKF1soMMAPpwS5meeJbhJn_mB4pX8i+AYO4ocEacYe3wq5YQQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCH] python3-m2crypto: restore m2crypto-0.26.4-gcc_macros.patch
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I guess I forgot that it was added for fixing same reason and
by me :) so I should have known better but as always thanks for
providing the fix.

On Wed, May 5, 2021 at 2:50 PM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * m2crypto-0.26.4-gcc_macros.patch was dropped as unnecessary
>   in the upgrade to 0.37.1 but for aarch64 it still seems to
>   be needed at least in some setups otherwise swig fails with:
>   http://errors.yoctoproject.org/Errors/Details/580206/
>   swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m=
2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/=
aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/wor=
k/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/b=
in/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/=
include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/tm=
p-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/u=
sr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37=
.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux=
/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/inc=
lude/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/cor=
texa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG=
/_m2crypto_wrap.c SWIG/_m2crypto.i
>   TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/re=
cipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find 'o=
penssl/opensslconf-32.h'
>
> * if I drop the -includeall from swig call I get a bit more reasonable e=
rror message:
>   Preprocessing...
>   /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: CPP #e=
rror ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to conti=
nue swig processing.
>
> * gcc_macros.h is generated by do_configure_prepend, if
>   this patch really isn't needed, then the do_configure_prepend
>   should probably be dropped as well
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-import-gcc_macros.h.patch            | 59 +++++++++++++++++++
>  .../python/python3-m2crypto_0.37.1.bb         |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto=
/0001-import-gcc_macros.h.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-i=
mport-gcc_macros.h.patch b/meta-python/recipes-devtools/python/python3-m2cr=
ypto/0001-import-gcc_macros.h.patch
> new file mode 100644
> index 0000000000..3c6d584983
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-import-g=
cc_macros.h.patch
> @@ -0,0 +1,59 @@
> +From 1364722439a0a36e3f57119dd45de666d213888c Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Wed, 5 May 2021 21:34:35 +0000
> +Subject: [PATCH] import gcc_macros.h
> +
> +* it was dropped as unnecessary in the upgrade to 0.37.1 but for
> +  aarch64 it still seems to be needed at least in some setups
> +  otherwise swig fails with:
> +  http://errors.yoctoproject.org/Errors/Details/580206/
> +  swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-=
m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib=
/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/wo=
rk/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/=
bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0=
/include-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/=
0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/t=
mp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/=
usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.3=
7.1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linu=
x/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/in=
clude/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/co=
rtexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWI=
G/_m2crypto_wrap.c SWIG/_m2crypto.i
> +  TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/r=
ecipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find '=
openssl/opensslconf-32.h'
> +
> +* if I drop the -includeall from swig call I get a bit more reasonable =
error message:
> +  Preprocessing...
> +  /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/=
0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29: Error: CPP #=
error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn option to cont=
inue swig processing.
> +
> +* maybe we need newer swig, the regenerated m2crypto.py shows
> +  that it was generated with 4.0.2 before while meta-oe has 3.0.12
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + SWIG/_m2crypto.i  |  10 +-
> + 2 files changed, 737 insertions(+), 5 deletions(-)
> + create mode 100644 SWIG/gcc_macros.h
> +
> +diff --git a/SWIG/_m2crypto.i b/SWIG/_m2crypto.i
> +index e300a10..3d51c22 100644
> +--- a/SWIG/_m2crypto.i
> ++++ b/SWIG/_m2crypto.i
> +@@ -8,6 +8,11 @@
> +  *
> +  */
> +
> ++%import "gcc_macros.h"
> ++
> ++%ignore WCHAR_MAX;
> ++%ignore WCHAR_MIN;
> ++
> + %module(threads=3D1) m2crypto
> + /* We really don't need threadblock (PyGILState_Ensure() etc.) anywher=
e.
> +    Disable threadallow as well, only enable it for operations likely t=
o
> +@@ -15,10 +20,6 @@
> + %nothreadblock;
> + %nothreadallow;
> +
> +-#if SWIG_VERSION >=3D 0x030000
> +-#define __WCHAR_MAX__ __WCHAR_MAX
> +-#define __WCHAR_MIN__ __WCHAR_MIN
> +-#endif
> + /* https://gitlab.com/m2crypto/m2crypto/issues/246 */
> + %ignore WCHAR_MAX;
> + %ignore WCHAR_MIN;
> +@@ -103,4 +104,3 @@ static PyObject *x509_store_verify_cb_func;
> + %constant int encrypt =3D 1;
> + %constant int decrypt =3D 0;
> + #endif
> +-
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1=
.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> index 896d9d2cc4..84400da002 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> @@ -10,6 +10,7 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot-not=
-in-host-directories.patch \
>              file://cross-compile-platform.patch \
>              file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patc=
h \
>              file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.p=
atch \
> +            file://0001-import-gcc_macros.h.patch \
>             "
>  SRC_URI[sha256sum] =3D "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91=
e4fff5598cfff6fb3"
>
> --
> 2.30.2
>
>
>=20
>
