Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.2980.1620247830693359438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 13:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i2zXBOz+;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q127so2987118qkb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J6lbxEI+Pwiu+5PposhcJiNi76CJpxbmYFd7Ci7XNSE=;
        b=i2zXBOz+UZqcM8B/Vlii4BcP7zVR//gyJbcmHJtnZmyg6Ithfi+B59UrXm307kCTlj
         VDwaDOOX6UKYU2R4VKJlc7GinQkWPx60tbMFWiqgoR6AWLdM7ZnQkKTF0mfIE6T28B2S
         KyFUdCRPXleLmnJ2cUJh3ym9TLXE4hai8JUMMa+MYlSyW3fECHg1+KuxlIYI37uysqB3
         fhV6NLmQ8Yp5aIeY0egaq/XNDFnOLQ0SW86aY24W39Avk1Mmp1mbxV0VbfgydNX8YrvG
         ENxMsR4Z9rm9YClLrABO9XCnAlLdziF2bUY0WZ/Im64Kutf10G83djVP9j4VdWM7qA1v
         S/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J6lbxEI+Pwiu+5PposhcJiNi76CJpxbmYFd7Ci7XNSE=;
        b=HRVOCZlpLreLWBDN5Io9BxE8Pi45n3lL+8lyq2wHM8iRWs0QZaze67ul5xWhv2bPDi
         cxDI3U6vubumA8Hez3oABSHN7qBkgsEppkBUdHu9DE/jrouW2RtRKdFK6XSuHoUn/VUs
         mscGrlLKTWyZluPoQN1OkadTDbV0yyWvcRkv9ssH7MI+pP0vOLZ55kUEaHPVQ6Q1TtEE
         j/FoOeOKJ38SQbJCFipQh7ljjujGSZ7bqkT1rUactAlIGf2RxWeZsOGcL1lPvykk3D8b
         7CjhZ+i/NwbcQOvBwntZRRasWzm0gQgTx8l5/RtjrBA0c2I85pZJeo1u5B1EnblwQ7i6
         7FBA==
X-Gm-Message-State: AOAM532h/sOl/ZtTlo95v0Dh19/O0ND/Qdgq6d8qYtlJGXOCjSGBnwrn
	xiKIgLBmh1OXzR6Iz7HBtUNdGq3+bBOQEYUXGgo=
X-Google-Smtp-Source: ABdhPJwFgnQ4n3ThWnCQk+EN4eVB932rQPlaJaFI5TnmxGKvX4zMwnHZcDirWnnS9+XFHaVETemUhl4CvYOhaCehnRM=
X-Received: by 2002:a37:9607:: with SMTP id y7mr655588qkd.25.1620247829424;
 Wed, 05 May 2021 13:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210501190615.545087-1-raj.khem@gmail.com> <CA+chaQdwBJ7LQ4=75L_zT_gaqyw8V0nPCWo=UC+8TDY8U8RxMg@mail.gmail.com>
 <CAMKF1sqFrwS5R4fOwwVf4-xzhF4BAX6ZArR3p04d+sYrLpWTfA@mail.gmail.com> <CA+chaQdkP3V2NYN9meJD_LFfJeNNB=UnbtLXH2WataHZicwNnA@mail.gmail.com>
In-Reply-To: <CA+chaQdkP3V2NYN9meJD_LFfJeNNB=UnbtLXH2WataHZicwNnA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 13:50:03 -0700
Message-ID: <CAMKF1spmakhrx1Mm8cfPe3P1PMcUpG87NbfxXs_9yxrk_A_jRA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-m2crypto: Upgrade to 0.37.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 1:13 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It doesn't seem to be missing header file as opensslconf-32.h doesn't ex=
ist in either of them.
>

32bit header file is not important, whats important is the wrapper
that OE generates for non-multilib cases which breaks such cases as I
pointed in the commit
so you have this in opensslconf.h

#if defined (__bpf__)
#define __MHWORDSIZE                    64
#elif defined (__arm__)
#define __MHWORDSIZE                    32
#elif defined (__aarch64__) && defined ( __LP64__)
#define __MHWORDSIZE                    64
#elif defined (__aarch64__)
#define __MHWORDSIZE                    32
#else
#include <bits/wordsize.h>
#if defined (__WORDSIZE)
#define __MHWORDSIZE                    __WORDSIZE
#else
#error "__WORDSIZE is not defined"
#endif
#endif

#if __MHWORDSIZE =3D=3D 32

#ifdef _MIPS_SIM

#if _MIPS_SIM =3D=3D _ABIO32
#include <openssl/opensslconf-32.h>
#elif _MIPS_SIM =3D=3D _ABIN32
#include <openssl/opensslconf-n32.h>
#else
#error "Unknown _MIPS_SIM"
#endif

#else /* _MIPS_SIM is not defined */
#include <openssl/opensslconf-32.h>
#endif

#elif __MHWORDSIZE =3D=3D 64
#include <openssl/opensslconf-64.h>
#else
#error "Unknown __WORDSIZE detected"
#endif /* matches #if __WORDSIZE =3D=3D 32 */


injected by this multilib game. Now if you do not have __MHWORDSIZE
detected correctly then things take a very wrong course.
I proposed this fix for OE-core but it is not yet accpeted.

> oe-core$ find tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/ -name =
opensslconf\*
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysr=
oot-native/usr/include/openssl/opensslconf.h
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysr=
oot/usr/include/openssl/opensslconf-64.h
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysr=
oot/usr/include/openssl/opensslconf.h
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe=
-sysroot-native/usr/include/openssl/opensslconf.h
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe=
-sysroot/usr/include/openssl/opensslconf-64.h
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe=
-sysroot/usr/include/openssl/opensslconf.h
>
> and the swig call seems to be similar, but with the new version the -I f=
lags are different, I wonder if that caused wrong header to be read from na=
tive sysroot or from host (ubuntu-21.04), will try to get some preprocessed=
 output from swig to see which headers it really read:
>
> oe-core$ grep swig tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.=
*/temp/log.do_compile
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/l=
og.do_compile:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/l=
og.do_compile:swig -python -py3
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.30.1-r0/recipe-sysroot/usr/include
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.30.1-r0/recipe-sysroot/usr/include/python3.9
> -I/usr/include/openssl
> -I/usr/lib/gcc/x86_64-linux-gnu/10/include
> -I/usr/local/include
> -I/usr/include/x86_64-linux-gnu
> -I/usr/include
> -includeall -modern -builtin -outdir /OE/build/oe-core/tmp-glibc/work/co=
rtexa57-oe-linux/python3-m2crypto/0.30.1-r0/M2Crypto-0.30.1/M2Crypto -o SWI=
G/_m2crypto_wrap.c SWIG/_m2crypto.i
>
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do=
_compile:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do=
_compile:swig -python -py3
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-o=
e-linux/gcc/aarch64-oe-linux/11.1.0/include
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-o=
e-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/include
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/include
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0=
.37.1-r0/recipe-sysroot/usr/include/python3.9
> -I/usr/include/openssl
> -includeall -modern -builtin -outdir /OE/build/oe-core/tmp-glibc/work/co=
rtexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWI=
G/_m2crypto_wrap.c SWIG/_m2crypto.i
>
> On Wed, May 5, 2021 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> hmmm I use
>>
>> https://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6db0fc799=
7a093bb400021edce6c7639
>>
>> and i wonder thats why I do not see this ?
>>
>> On Wed, May 5, 2021 at 10:09 AM Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> >
>> > This upgrade seems to break the build for aarch64:
>> > http://errors.yoctoproject.org/Errors/Details/580206/
>> >
>> > On Sat, May 1, 2021 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> Unifiy .inc into .bb
>> >> Add patches to fix issues with openssl 1.1.x
>> >> Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
>> >> Refresh existing patches
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>  .../m2crypto-0.26.4-gcc_macros.patch          | 35 --------------
>> >>  ...verify_cb_-to-be-called-with-ok-True.patch | 47 ++++++++++++++++=
+++
>> >>  ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++
>> >>  ...k-in-sysroot-not-in-host-directories.patch | 12 ++---
>> >>  .../cross-compile-platform.patch              |  8 ++--
>> >>  .../python/python3-m2crypto_0.30.1.bb         |  2 -
>> >>  ...2crypto.inc =3D> python3-m2crypto_0.37.1.bb} |  8 ++--
>> >>  7 files changed, 88 insertions(+), 53 deletions(-)
>> >>  delete mode 100644 meta-python/recipes-devtools/python/python-m2cry=
pto/m2crypto-0.26.4-gcc_macros.patch
>> >>  create mode 100644 meta-python/recipes-devtools/python/python3-m2cr=
ypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
>> >>  create mode 100644 meta-python/recipes-devtools/python/python3-m2cr=
ypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
>> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =3D> py=
thon3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.patch=
 (75%)
>> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =3D> py=
thon3-m2crypto}/cross-compile-platform.patch (84%)
>> >>  delete mode 100644 meta-python/recipes-devtools/python/python3-m2cr=
ypto_0.30.1.bb
>> >>  rename meta-python/recipes-devtools/python/{python-m2crypto.inc =3D=
> python3-m2crypto_0.37.1.bb} (86%)
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2c=
rypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-=
m2crypto/m2crypto-0.26.4-gcc_macros.patch
>> >> deleted file mode 100644
>> >> index 7f6dd29f8a..0000000000
>> >> --- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0=
.26.4-gcc_macros.patch
>> >> +++ /dev/null
>> >> @@ -1,35 +0,0 @@
>> >> -Imported from Fedora
>> >> -
>> >> -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
>> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
>> >> -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i
>> >> -@@ -8,6 +8,11 @@
>> >> -  *
>> >> -  */
>> >> -
>> >> -+%import "gcc_macros.h"
>> >> -+
>> >> -+%ignore WCHAR_MAX;
>> >> -+%ignore WCHAR_MIN;
>> >> -+
>> >> - %module(threads=3D1) m2crypto
>> >> - /* We really don't need threadblock (PyGILState_Ensure() etc.) any=
where.
>> >> -    Disable threadallow as well, only enable it for operations like=
ly to
>> >> -@@ -15,11 +20,6 @@
>> >> - %nothreadblock;
>> >> - %nothreadallow;
>> >> -
>> >> --#if SWIG_VERSION >=3D 0x030000
>> >> --#define __WCHAR_MAX__ __WCHAR_MAX
>> >> --#define __WCHAR_MIN__ __WCHAR_MIN
>> >> --#endif
>> >> --
>> >> - %{
>> >> - #ifdef _WIN32
>> >> - #define _WINSOCKAPI_
>> >> -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
>> >> - %constant int encrypt =3D 1;
>> >> - %constant int decrypt =3D 0;
>> >> - #endif
>> >> --
>> >> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/00=
01-Allow-verify_cb_-to-be-called-with-ok-True.patch b/meta-python/recipes-d=
evtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-=
True.patch
>> >> new file mode 100644
>> >> index 0000000000..3c836635a1
>> >> --- /dev/null
>> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allo=
w-verify_cb_-to-be-called-with-ok-True.patch
>> >> @@ -0,0 +1,47 @@
>> >> +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2=
001
>> >> +From: Casey Deccio <casey@deccio.net>
>> >> +Date: Fri, 8 Jan 2021 12:43:09 -0700
>> >> +Subject: [PATCH] Allow verify_cb_* to be called with ok=3DTrue
>> >> +
>> >> +With https://github.com/openssl/openssl/commit/2e06150e3928daa06d5f=
f70c32bffad8088ebe58
>> >> +OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF_SI=
GNATURE
>> >> +---
>> >> + tests/test_ssl.py | 14 ++++++++++++--
>> >> + 1 file changed, 12 insertions(+), 2 deletions(-)
>> >> +
>> >> +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
>> >> +index 92b6942..7a3271a 100644
>> >> +--- a/tests/test_ssl.py
>> >> ++++ b/tests/test_ssl.py
>> >> +@@ -59,8 +59,13 @@ def allocate_srv_port():
>> >> +
>> >> +
>> >> + def verify_cb_new_function(ok, store):
>> >> +-    assert not ok
>> >> +     err =3D store.get_error()
>> >> ++    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then i=
nstead of
>> >> ++    # aborting, this callback is called to retrieve additional err=
or
>> >> ++    # information.  In this case, ok might not be False.
>> >> ++    # See https://github.com/openssl/openssl/commit/2e06150e3928da=
a06d5ff70c32bffad8088ebe58
>> >> ++    if err !=3D m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
>> >> ++        assert not ok
>> >> +     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
>> >> +                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY=
,
>> >> +                    m2.X509_V_ERR_CERT_UNTRUSTED,
>> >> +@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTestC=
ase):
>> >> +
>> >> +     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
>> >> +         try:
>> >> +-            self.assertFalse(ok)
>> >> ++            # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE=
, then instead of
>> >> ++            # aborting, this callback is called to retrieve additi=
onal error
>> >> ++            # information.  In this case, ok might not be False.
>> >> ++            # See https://github.com/openssl/openssl/commit/2e0615=
0e3928daa06d5ff70c32bffad8088ebe58
>> >> ++            if err !=3D m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNAT=
URE:
>> >> ++                self.assertFalse(ok)
>> >> +             self.assertIn(err,
>> >> +                           [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CE=
RT,
>> >> +                            m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT=
_LOCALLY,
>> >> +--
>> >> +2.29.2
>> >> +
>> >> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/00=
01-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-python/recipe=
s-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-=
deprecated.patch
>> >> new file mode 100644
>> >> index 0000000000..2313a324a0
>> >> --- /dev/null
>> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-=
of-RSA_SSLV23_PADDING-has-been-deprecated.patch
>> >> @@ -0,0 +1,29 @@
>> >> +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2=
001
>> >> +From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D <mcepl@cepl.eu>
>> >> +Date: Fri, 19 Feb 2021 15:53:02 +0100
>> >> +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
>> >> +
>> >> +Fixes #293.
>> >> +---
>> >> + tests/test_rsa.py | 5 -----
>> >> + 1 file changed, 5 deletions(-)
>> >> +
>> >> +diff --git a/tests/test_rsa.py b/tests/test_rsa.py
>> >> +index 3de5016..7299785 100644
>> >> +--- a/tests/test_rsa.py
>> >> ++++ b/tests/test_rsa.py
>> >> +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
>> >> +             ptxt =3D priv.private_decrypt(ctxt, p)
>> >> +             self.assertEqual(ptxt, self.data)
>> >> +
>> >> +-        # sslv23_padding
>> >> +-        ctxt =3D priv.public_encrypt(self.data, RSA.sslv23_padding=
)
>> >> +-        res =3D priv.private_decrypt(ctxt, RSA.sslv23_padding)
>> >> +-        self.assertEqual(res, self.data)
>> >> +-
>> >> +         # no_padding
>> >> +         with six.assertRaisesRegex(self, RSA.RSAError, 'data too s=
mall'):
>> >> +             priv.public_encrypt(self.data, RSA.no_padding)
>> >> +--
>> >> +2.29.2
>> >> +
>> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/000=
1-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/reci=
pes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-h=
ost-directories.patch
>> >> similarity index 75%
>> >> rename from meta-python/recipes-devtools/python/python-m2crypto/0001=
-setup.py-link-in-sysroot-not-in-host-directories.patch
>> >> rename to meta-python/recipes-devtools/python/python3-m2crypto/0001-=
setup.py-link-in-sysroot-not-in-host-directories.patch
>> >> index b339d93f75..f4c74384f9 100644
>> >> --- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup=
.py-link-in-sysroot-not-in-host-directories.patch
>> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setu=
p.py-link-in-sysroot-not-in-host-directories.patch
>> >> @@ -10,19 +10,17 @@ Upstream-status: Unknown
>> >>   setup.py | 6 +++---
>> >>   1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> -Index: M2Crypto-0.30.1/setup.py
>> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> ---- M2Crypto-0.30.1.orig/setup.py
>> >> -+++ M2Crypto-0.30.1/setup.py
>> >> -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
>> >> +--- a/setup.py
>> >> ++++ b/setup.py
>> >> +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
>> >>           self.set_undefined_options('build', ('bundledlls', 'bundle=
dlls'))
>> >>
>> >>           self.libraries =3D ['ssl', 'crypto']
>> >>  +        self.openssl =3D os.environ.get( "STAGING_DIR" )
>> >>           if sys.platform =3D=3D 'win32':
>> >>               self.libraries =3D ['ssleay32', 'libeay32']
>> >> -             if self.openssl and openssl_version(self.openssl, 0x10=
100000, True):
>> >> -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
>> >> +             if self.openssl and openssl_version(self.openssl,
>> >> +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
>> >>
>> >>           if self.openssl is not None:
>> >>               log.debug('self.openssl =3D %s', self.openssl)
>> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cro=
ss-compile-platform.patch b/meta-python/recipes-devtools/python/python3-m2c=
rypto/cross-compile-platform.patch
>> >> similarity index 84%
>> >> rename from meta-python/recipes-devtools/python/python-m2crypto/cros=
s-compile-platform.patch
>> >> rename to meta-python/recipes-devtools/python/python3-m2crypto/cross=
-compile-platform.patch
>> >> index 4b64f4613c..f039ae8665 100644
>> >> --- a/meta-python/recipes-devtools/python/python-m2crypto/cross-comp=
ile-platform.patch
>> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto/cross-com=
pile-platform.patch
>> >> @@ -4,11 +4,9 @@ since it pokes at the system for getting architectu=
re values
>> >>  Upstream-Status: Inappropriate
>> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>
>> >> -Index: M2Crypto-0.30.1/setup.py
>> >> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> >> ---- M2Crypto-0.30.1.orig/setup.py
>> >> -+++ M2Crypto-0.30.1/setup.py
>> >> -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
>> >> +--- a/setup.py
>> >> ++++ b/setup.py
>> >> +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
>> >>               log.debug('self.include_dirs =3D %s', self.include_dir=
s)
>> >>               log.debug('self.library_dirs =3D %s', self.library_dir=
s)
>> >>
>> >> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.=
30.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
>> >> deleted file mode 100644
>> >> index 4d63d4bd3a..0000000000
>> >> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
>> >> +++ /dev/null
>> >> @@ -1,2 +0,0 @@
>> >> -inherit setuptools3
>> >> -require python-m2crypto.inc
>> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc=
 b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
>> >> similarity index 86%
>> >> rename from meta-python/recipes-devtools/python/python-m2crypto.inc
>> >> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.37.=
1.bb
>> >> index 797a0354bf..896d9d2cc4 100644
>> >> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
>> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
>> >> @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/python-m2=
crypto:"
>> >>
>> >>  SRC_URI +=3D "file://0001-setup.py-link-in-sysroot-not-in-host-dire=
ctories.patch \
>> >>              file://cross-compile-platform.patch \
>> >> -            file://m2crypto-0.26.4-gcc_macros.patch \
>> >> +            file://0001-Allow-verify_cb_-to-be-called-with-ok-True.=
patch \
>> >> +            file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecat=
ed.patch \
>> >>             "
>> >> -SRC_URI[md5sum] =3D "7fce3cbf85eb84a669682892b935746b"
>> >> -SRC_URI[sha256sum] =3D "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144=
bb62d38563062e7cd3fc6"
>> >> +SRC_URI[sha256sum] =3D "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace494=
0b91e4fff5598cfff6fb3"
>> >>
>> >>  PYPI_PACKAGE =3D "M2Crypto"
>> >> -inherit pypi siteinfo
>> >> +inherit pypi siteinfo setuptools3
>> >>
>> >>  DEPENDS +=3D "openssl swig-native"
>> >>  RDEPENDS_${PN} +=3D "\
>> >> --
>> >> 2.31.1
>> >>
>> >>
>> >>=20
>> >>
