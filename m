Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.51.1620251421622183208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 14:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vK5loh8P;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id w3so5161642ejc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/iVsQabprVHFH0cJI/yY1Mvf+2NudwB74aSV/4N6wLQ=;
        b=vK5loh8PNF76fY1xSmvFpAr5GcbXUlOc09AtRYbqLi5ytKttgS6N6r4yXmw2lsQMK3
         VeuzVDwuiZsXiiqdYSVZxSu6mMU9/3VDZoKn0WGnAY1ui5fy6wHaemjIUL3qt2vFYVlJ
         J7MVIfcUcjM3a0NFh5Fqa5JVz6OY6rlc6Px12PlDq8G09AFEnG3/SLAzmFjsH3YKWBFo
         o0mOgKotDsJfKAGOZ64wPWD1bIlZuLdlc5nSCDg8b5bmbSuOa8pe4Iohh9KPL2ph3WKN
         ndEw5h0OTOatc442U7q7wYXS630omdRmBWVcBGJmCIt4PIjKjzENWYe2eMrWkGSqK1em
         nZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/iVsQabprVHFH0cJI/yY1Mvf+2NudwB74aSV/4N6wLQ=;
        b=L8g6NF34KbtwBunljIunhRhdHRQoQdWxUpTedYYo8jWsZh+Zmm4KcQUAddKdtnCZkn
         C2PJrHercWvYjk98pZ+YAXfYxHcdCxYy719aGsrqHMDIreIE5ZJFYrPhGTOf9VtZ27xm
         kWJHyjGGRLRrxIxbQJ3Lavjji728UQB5iNfHkMshocz3C63A774I8q/LhdRysHi5WZW7
         2UVRCkATDTb0hacm+6G8TFlzwaMfjKKJ9Ug2IMg67c7hrxQp6WXvc9KoImo4gOnzpaiC
         hXFLYQzMES419JDpXlI4zoutZB43MwEilzXiPIWCC5u2isJALZIyIyxcXlG9DVoigwll
         1xsQ==
X-Gm-Message-State: AOAM5303XcQUtbdS5nqNBHhskD2G+m6jZrbsTL8MlfBYuIsSJm5WVAFl
	2D9HbK7GNW4EAoZ0pm4Kigp6yXYjkLnuZFA6l5w=
X-Google-Smtp-Source: ABdhPJw8DH1dq2pFIWPmUlSbTKV8CZeIbNMWABdh90Xg7rpZ+5H19aN/HT7eR3gDTcROrrR7HGQmcy+FUTgkuqpAwL8=
X-Received: by 2002:a17:906:6801:: with SMTP id k1mr827021ejr.137.1620251419914;
 Wed, 05 May 2021 14:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210501190615.545087-1-raj.khem@gmail.com> <CA+chaQdwBJ7LQ4=75L_zT_gaqyw8V0nPCWo=UC+8TDY8U8RxMg@mail.gmail.com>
 <CAMKF1sqFrwS5R4fOwwVf4-xzhF4BAX6ZArR3p04d+sYrLpWTfA@mail.gmail.com>
 <CA+chaQdkP3V2NYN9meJD_LFfJeNNB=UnbtLXH2WataHZicwNnA@mail.gmail.com> <CAMKF1spmakhrx1Mm8cfPe3P1PMcUpG87NbfxXs_9yxrk_A_jRA@mail.gmail.com>
In-Reply-To: <CAMKF1spmakhrx1Mm8cfPe3P1PMcUpG87NbfxXs_9yxrk_A_jRA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 5 May 2021 23:50:08 +0200
Message-ID: <CA+chaQcSD6fwkG4BgbC2k73p+dgUTURD-C2L0PtahBB-ip1FVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-m2crypto: Upgrade to 0.37.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054b6ae05c19c2e60"

--00000000000054b6ae05c19c2e60
Content-Type: text/plain; charset="UTF-8"

but this opensslconf.h is the same with 0.37.1 and 0.30.0 python3-m2crypto,
right?

It is in my WORKDIRs, but I have no __MHWORDSIZE, only __WORDSIZE:

0.37.1-r0$ cat recipe-sysroot/usr/include/openssl/opensslconf.h
/*
 * Copyright (C) 2005-2011 by Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: MIT
 *
 */

#include <bits/wordsize.h>

#if __WORDSIZE == 32

#ifdef _MIPS_SIM

#if _MIPS_SIM == _ABIO32
#include <openssl/opensslconf-32.h>
#elif _MIPS_SIM == _ABIN32
#include <openssl/opensslconf-n32.h>
#else
#error "Unknown _MIPS_SIM"
#endif

#else /* _MIPS_SIM is not defined */
#include <openssl/opensslconf-32.h>
#endif

#elif __WORDSIZE == 64
#include <openssl/opensslconf-64.h>
#else
#error "Unknown __WORDSIZE detected"
#endif /* matches #if __WORDSIZE == 32 */


if I drop the -includeall from swig call I get a bit more reasonable error
message:
Preprocessing...
/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h:29:
Error: CPP #error ""Unknown __WORDSIZE detected"". Use the -cpperraswarn
option to continue swig processing.

If I run the same swig call in 0.30.1 version:
Language subdirectory: python
Search paths:
   ./

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/python3.9/
   /usr/include/openssl/
   ./swig_lib/python/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/../share/swig/3.0.12/python/
   ./swig_lib/

 /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/../share/swig/3.0.12/
Preprocessing...
/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/features.h:399:
Warning 204: CPP #warning, "_FORTIFY_SOURCE requires GCC 4.1 or later".
Starting language-specific parse...
SWIG/gcc_macros.h:102: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:202: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:256: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:284: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:298: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:300: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:306: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:442: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:472: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:476: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:484: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:492: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:564: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:568: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:580: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:588: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:618: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:664: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:690: Warning 305: Bad constant value (ignored).
SWIG/gcc_macros.h:706: Warning 305: Bad constant value (ignored).
/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/sys/cdefs.h:153:
Warning 305: Bad constant value (ignored).
Processing unnamed structs...
Processing types...
C++ analysis...
Generating wrappers...

Looks like this gcc_macros.h still generated by do_configure_prepend (but
no longer included anywhere without the m2crypto-0.26.4-gcc_macros.patch

I'll send RFC patch which fixed the build for me, but I'm no expert on swig
and this whole gcc_macros.h seems like a bit strange black magic to me.

Cheers,

On Wed, May 5, 2021 at 10:50 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 5, 2021 at 1:13 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > It doesn't seem to be missing header file as opensslconf-32.h doesn't
> exist in either of them.
> >
>
> 32bit header file is not important, whats important is the wrapper
> that OE generates for non-multilib cases which breaks such cases as I
> pointed in the commit
> so you have this in opensslconf.h
>
> #if defined (__bpf__)
> #define __MHWORDSIZE                    64
> #elif defined (__arm__)
> #define __MHWORDSIZE                    32
> #elif defined (__aarch64__) && defined ( __LP64__)
> #define __MHWORDSIZE                    64
> #elif defined (__aarch64__)
> #define __MHWORDSIZE                    32
> #else
> #include <bits/wordsize.h>
> #if defined (__WORDSIZE)
> #define __MHWORDSIZE                    __WORDSIZE
> #else
> #error "__WORDSIZE is not defined"
> #endif
> #endif
>
> #if __MHWORDSIZE == 32
>
> #ifdef _MIPS_SIM
>
> #if _MIPS_SIM == _ABIO32
> #include <openssl/opensslconf-32.h>
> #elif _MIPS_SIM == _ABIN32
> #include <openssl/opensslconf-n32.h>
> #else
> #error "Unknown _MIPS_SIM"
> #endif
>
> #else /* _MIPS_SIM is not defined */
> #include <openssl/opensslconf-32.h>
> #endif
>
> #elif __MHWORDSIZE == 64
> #include <openssl/opensslconf-64.h>
> #else
> #error "Unknown __WORDSIZE detected"
> #endif /* matches #if __WORDSIZE == 32 */
>
>
> injected by this multilib game. Now if you do not have __MHWORDSIZE
> detected correctly then things take a very wrong course.
> I proposed this fix for OE-core but it is not yet accpeted.
>
> > oe-core$ find tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/ -name
> opensslconf\*
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/include/openssl/opensslconf.h
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf-64.h
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot-native/usr/include/openssl/opensslconf.h
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot/usr/include/openssl/opensslconf-64.h
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot/usr/include/openssl/opensslconf.h
> >
> > and the swig call seems to be similar, but with the new version the -I
> flags are different, I wonder if that caused wrong header to be read from
> native sysroot or from host (ubuntu-21.04), will try to get some
> preprocessed output from swig to see which headers it really read:
> >
> > oe-core$ grep swig
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.*/temp/log.do_compile
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/log.do_compile:swigging
> SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/log.do_compile:swig
> -python -py3
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/python3.9
> > -I/usr/include/openssl
> > -I/usr/lib/gcc/x86_64-linux-gnu/10/include
> > -I/usr/local/include
> > -I/usr/include/x86_64-linux-gnu
> > -I/usr/include
> > -includeall -modern -builtin -outdir
> /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/M2Crypto-0.30.1/M2Crypto
> -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
> >
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compile:swigging
> SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
> >
> tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compile:swig
> -python -py3
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
> >
> -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9
> > -I/usr/include/openssl
> > -includeall -modern -builtin -outdir
> /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto
> -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
> >
> > On Wed, May 5, 2021 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> hmmm I use
> >>
> >>
> https://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6db0fc7997a093bb400021edce6c7639
> >>
> >> and i wonder thats why I do not see this ?
> >>
> >> On Wed, May 5, 2021 at 10:09 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> >
> >> > This upgrade seems to break the build for aarch64:
> >> > http://errors.yoctoproject.org/Errors/Details/580206/
> >> >
> >> > On Sat, May 1, 2021 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> Unifiy .inc into .bb
> >> >> Add patches to fix issues with openssl 1.1.x
> >> >> Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
> >> >> Refresh existing patches
> >> >>
> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> ---
> >> >>  .../m2crypto-0.26.4-gcc_macros.patch          | 35 --------------
> >> >>  ...verify_cb_-to-be-called-with-ok-True.patch | 47
> +++++++++++++++++++
> >> >>  ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++
> >> >>  ...k-in-sysroot-not-in-host-directories.patch | 12 ++---
> >> >>  .../cross-compile-platform.patch              |  8 ++--
> >> >>  .../python/python3-m2crypto_0.30.1.bb         |  2 -
> >> >>  ...2crypto.inc => python3-m2crypto_0.37.1.bb} |  8 ++--
> >> >>  7 files changed, 88 insertions(+), 53 deletions(-)
> >> >>  delete mode 100644
> meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> (75%)
> >> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/cross-compile-platform.patch (84%)
> >> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
> >> >>  rename meta-python/recipes-devtools/python/{python-m2crypto.inc =>
> python3-m2crypto_0.37.1.bb} (86%)
> >> >>
> >> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >> >> deleted file mode 100644
> >> >> index 7f6dd29f8a..0000000000
> >> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >> >> +++ /dev/null
> >> >> @@ -1,35 +0,0 @@
> >> >> -Imported from Fedora
> >> >> -
> >> >> -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
> >> >> -===================================================================
> >> >> ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
> >> >> -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i
> >> >> -@@ -8,6 +8,11 @@
> >> >> -  *
> >> >> -  */
> >> >> -
> >> >> -+%import "gcc_macros.h"
> >> >> -+
> >> >> -+%ignore WCHAR_MAX;
> >> >> -+%ignore WCHAR_MIN;
> >> >> -+
> >> >> - %module(threads=1) m2crypto
> >> >> - /* We really don't need threadblock (PyGILState_Ensure() etc.)
> anywhere.
> >> >> -    Disable threadallow as well, only enable it for operations
> likely to
> >> >> -@@ -15,11 +20,6 @@
> >> >> - %nothreadblock;
> >> >> - %nothreadallow;
> >> >> -
> >> >> --#if SWIG_VERSION >= 0x030000
> >> >> --#define __WCHAR_MAX__ __WCHAR_MAX
> >> >> --#define __WCHAR_MIN__ __WCHAR_MIN
> >> >> --#endif
> >> >> --
> >> >> - %{
> >> >> - #ifdef _WIN32
> >> >> - #define _WINSOCKAPI_
> >> >> -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
> >> >> - %constant int encrypt = 1;
> >> >> - %constant int decrypt = 0;
> >> >> - #endif
> >> >> --
> >> >> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >> >> new file mode 100644
> >> >> index 0000000000..3c836635a1
> >> >> --- /dev/null
> >> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >> >> @@ -0,0 +1,47 @@
> >> >> +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00
> 2001
> >> >> +From: Casey Deccio <casey@deccio.net>
> >> >> +Date: Fri, 8 Jan 2021 12:43:09 -0700
> >> >> +Subject: [PATCH] Allow verify_cb_* to be called with ok=True
> >> >> +
> >> >> +With
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> >> +OpenSSL allowed verificaton to continue on
> UNABLE_TO_VERIFY_LEAF_SIGNATURE
> >> >> +---
> >> >> + tests/test_ssl.py | 14 ++++++++++++--
> >> >> + 1 file changed, 12 insertions(+), 2 deletions(-)
> >> >> +
> >> >> +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
> >> >> +index 92b6942..7a3271a 100644
> >> >> +--- a/tests/test_ssl.py
> >> >> ++++ b/tests/test_ssl.py
> >> >> +@@ -59,8 +59,13 @@ def allocate_srv_port():
> >> >> +
> >> >> +
> >> >> + def verify_cb_new_function(ok, store):
> >> >> +-    assert not ok
> >> >> +     err = store.get_error()
> >> >> ++    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then
> instead of
> >> >> ++    # aborting, this callback is called to retrieve additional
> error
> >> >> ++    # information.  In this case, ok might not be False.
> >> >> ++    # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> >> ++    if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> >> >> ++        assert not ok
> >> >> +     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> >> >> +                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> >> >> +                    m2.X509_V_ERR_CERT_UNTRUSTED,
> >> >> +@@ -618,7 +623,12 @@ class
> MiscSSLClientTestCase(BaseSSLClientTestCase):
> >> >> +
> >> >> +     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
> >> >> +         try:
> >> >> +-            self.assertFalse(ok)
> >> >> ++            # If err is
> X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of
> >> >> ++            # aborting, this callback is called to retrieve
> additional error
> >> >> ++            # information.  In this case, ok might not be False.
> >> >> ++            # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> >> ++            if err !=
> m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> >> >> ++                self.assertFalse(ok)
> >> >> +             self.assertIn(err,
> >> >> +
>  [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> >> >> +
> m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> >> >> +--
> >> >> +2.29.2
> >> >> +
> >> >> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >> >> new file mode 100644
> >> >> index 0000000000..2313a324a0
> >> >> --- /dev/null
> >> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >> >> @@ -0,0 +1,29 @@
> >> >> +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00
> 2001
> >> >> +From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
> >> >> +Date: Fri, 19 Feb 2021 15:53:02 +0100
> >> >> +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
> >> >> +
> >> >> +Fixes #293.
> >> >> +---
> >> >> + tests/test_rsa.py | 5 -----
> >> >> + 1 file changed, 5 deletions(-)
> >> >> +
> >> >> +diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> >> >> +index 3de5016..7299785 100644
> >> >> +--- a/tests/test_rsa.py
> >> >> ++++ b/tests/test_rsa.py
> >> >> +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
> >> >> +             ptxt = priv.private_decrypt(ctxt, p)
> >> >> +             self.assertEqual(ptxt, self.data)
> >> >> +
> >> >> +-        # sslv23_padding
> >> >> +-        ctxt = priv.public_encrypt(self.data, RSA.sslv23_padding)
> >> >> +-        res = priv.private_decrypt(ctxt, RSA.sslv23_padding)
> >> >> +-        self.assertEqual(res, self.data)
> >> >> +-
> >> >> +         # no_padding
> >> >> +         with six.assertRaisesRegex(self, RSA.RSAError, 'data too
> small'):
> >> >> +             priv.public_encrypt(self.data, RSA.no_padding)
> >> >> +--
> >> >> +2.29.2
> >> >> +
> >> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> >> similarity index 75%
> >> >> rename from
> meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> >> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> >> index b339d93f75..f4c74384f9 100644
> >> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> >> @@ -10,19 +10,17 @@ Upstream-status: Unknown
> >> >>   setup.py | 6 +++---
> >> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >> >>
> >> >> -Index: M2Crypto-0.30.1/setup.py
> >> >> -===================================================================
> >> >> ---- M2Crypto-0.30.1.orig/setup.py
> >> >> -+++ M2Crypto-0.30.1/setup.py
> >> >> -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >> +--- a/setup.py
> >> >> ++++ b/setup.py
> >> >> +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >>           self.set_undefined_options('build', ('bundledlls',
> 'bundledlls'))
> >> >>
> >> >>           self.libraries = ['ssl', 'crypto']
> >> >>  +        self.openssl = os.environ.get( "STAGING_DIR" )
> >> >>           if sys.platform == 'win32':
> >> >>               self.libraries = ['ssleay32', 'libeay32']
> >> >> -             if self.openssl and openssl_version(self.openssl,
> 0x10100000, True):
> >> >> -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >> +             if self.openssl and openssl_version(self.openssl,
> >> >> +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >>
> >> >>           if self.openssl is not None:
> >> >>               log.debug('self.openssl = %s', self.openssl)
> >> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> >> similarity index 84%
> >> >> rename from
> meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> >> >> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> >> index 4b64f4613c..f039ae8665 100644
> >> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> >> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> >> @@ -4,11 +4,9 @@ since it pokes at the system for getting
> architecture values
> >> >>  Upstream-Status: Inappropriate
> >> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >>
> >> >> -Index: M2Crypto-0.30.1/setup.py
> >> >> -===================================================================
> >> >> ---- M2Crypto-0.30.1.orig/setup.py
> >> >> -+++ M2Crypto-0.30.1/setup.py
> >> >> -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >> +--- a/setup.py
> >> >> ++++ b/setup.py
> >> >> +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
> >> >>               log.debug('self.include_dirs = %s', self.include_dirs)
> >> >>               log.debug('self.library_dirs = %s', self.library_dirs)
> >> >>
> >> >> diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
> >> >> deleted file mode 100644
> >> >> index 4d63d4bd3a..0000000000
> >> >> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
> >> >> +++ /dev/null
> >> >> @@ -1,2 +0,0 @@
> >> >> -inherit setuptools3
> >> >> -require python-m2crypto.inc
> >> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc
> b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> >> >> similarity index 86%
> >> >> rename from meta-python/recipes-devtools/python/python-m2crypto.inc
> >> >> rename to meta-python/recipes-devtools/python/
> python3-m2crypto_0.37.1.bb
> >> >> index 797a0354bf..896d9d2cc4 100644
> >> >> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> >> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> >> >> @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=
> "${THISDIR}/python-m2crypto:"
> >> >>
> >> >>  SRC_URI +=
> "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
> >> >>              file://cross-compile-platform.patch \
> >> >> -            file://m2crypto-0.26.4-gcc_macros.patch \
> >> >> +
> file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
> >> >> +
> file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
> >> >>             "
> >> >> -SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
> >> >> -SRC_URI[sha256sum] =
> "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
> >> >> +SRC_URI[sha256sum] =
> "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
> >> >>
> >> >>  PYPI_PACKAGE = "M2Crypto"
> >> >> -inherit pypi siteinfo
> >> >> +inherit pypi siteinfo setuptools3
> >> >>
> >> >>  DEPENDS += "openssl swig-native"
> >> >>  RDEPENDS_${PN} += "\
> >> >> --
> >> >> 2.31.1
> >> >>
> >> >>
> >> >> 
> >> >>
>

--00000000000054b6ae05c19c2e60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">but this opensslconf.h is the same with 0.37.1 and 0.30.0 =
python3-m2crypto, right?<div><br></div><div>It is in my WORKDIRs, but I hav=
e no __MHWORDSIZE, only __WORDSIZE:</div><div><br></div><div>0.37.1-r0$ cat=
 recipe-sysroot/usr/include/openssl/opensslconf.h<br>/*<br>=C2=A0* Copyrigh=
t (C) 2005-2011 by Wind River Systems, Inc.<br>=C2=A0*<br>=C2=A0* SPDX-Lice=
nse-Identifier: MIT<br>=C2=A0* <br>=C2=A0*/<br><br>#include &lt;bits/wordsi=
ze.h&gt;<br><br>#if __WORDSIZE =3D=3D 32<br><br>#ifdef _MIPS_SIM<br><br>#if=
 _MIPS_SIM =3D=3D _ABIO32<br>#include &lt;openssl/opensslconf-32.h&gt;<br>#=
elif _MIPS_SIM =3D=3D _ABIN32<br>#include &lt;openssl/opensslconf-n32.h&gt;=
<br>#else<br>#error &quot;Unknown _MIPS_SIM&quot;<br>#endif<br><br>#else /*=
 _MIPS_SIM is not defined */<br>#include &lt;openssl/opensslconf-32.h&gt;<b=
r>#endif<br><br>#elif __WORDSIZE =3D=3D 64<br>#include &lt;openssl/opensslc=
onf-64.h&gt;<br>#else<br>#error &quot;Unknown __WORDSIZE detected&quot;<br>=
#endif /* matches #if __WORDSIZE =3D=3D 32 */<br></div><div><br></div><div>=
<br></div><div>if I drop the -includeall from swig call I get a bit more re=
asonable error message:</div><div>Preprocessing...<br>/OE/build/oe-core/tmp=
-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/us=
r/include/openssl/opensslconf.h:29: Error: CPP #error &quot;&quot;Unknown _=
_WORDSIZE detected&quot;&quot;. Use the -cpperraswarn option to continue sw=
ig processing.<br></div><div><br></div><div>If I run the same swig call in =
0.30.1 version:</div><div>Language subdirectory: python<br>Search paths:<br=
>=C2=A0 =C2=A0./<br>=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/cortexa57=
-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/aarch64-=
oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include/<br=
>=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m=
2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/=
aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed/<br>=C2=A0 =C2=
=A0/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.=
30.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include/<br>=C2=A0 =
=C2=A0/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto=
/0.30.1-r0/recipe-sysroot/usr/include/<br>=C2=A0 =C2=A0/OE/build/oe-core/tm=
p-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/u=
sr/include/<br>=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-l=
inux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/python3.9/<br>=
=C2=A0 =C2=A0/usr/include/openssl/<br>=C2=A0 =C2=A0./swig_lib/python/<br>=
=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m=
2crypto/0.30.1-r0/recipe-sysroot-native/usr/bin/../share/swig/3.0.12/python=
/<br>=C2=A0 =C2=A0./swig_lib/<br>=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/w=
ork/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot-native/usr=
/bin/../share/swig/3.0.12/<br>Preprocessing...<br>/OE/build/oe-core/tmp-gli=
bc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/in=
clude/features.h:399: Warning 204: CPP #warning, &quot;_FORTIFY_SOURCE requ=
ires GCC 4.1 or later&quot;.<br>Starting language-specific parse...<br>SWIG=
/gcc_macros.h:102: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_m=
acros.h:202: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.=
h:256: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:284:=
 Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:298: Warni=
ng 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:300: Warning 305=
: Bad constant value (ignored).<br>SWIG/gcc_macros.h:306: Warning 305: Bad =
constant value (ignored).<br>SWIG/gcc_macros.h:442: Warning 305: Bad consta=
nt value (ignored).<br>SWIG/gcc_macros.h:472: Warning 305: Bad constant val=
ue (ignored).<br>SWIG/gcc_macros.h:476: Warning 305: Bad constant value (ig=
nored).<br>SWIG/gcc_macros.h:484: Warning 305: Bad constant value (ignored)=
.<br>SWIG/gcc_macros.h:492: Warning 305: Bad constant value (ignored).<br>S=
WIG/gcc_macros.h:564: Warning 305: Bad constant value (ignored).<br>SWIG/gc=
c_macros.h:568: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macr=
os.h:580: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:5=
88: Warning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:618: Wa=
rning 305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:664: Warning =
305: Bad constant value (ignored).<br>SWIG/gcc_macros.h:690: Warning 305: B=
ad constant value (ignored).<br>SWIG/gcc_macros.h:706: Warning 305: Bad con=
stant value (ignored).<br>/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-lin=
ux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/sys/cdefs.h:153: W=
arning 305: Bad constant value (ignored).<br>Processing unnamed structs...<=
br>Processing types...<br>C++ analysis...<br>Generating wrappers...<br></di=
v><div><br></div><div>Looks like this gcc_macros.h still generated by do_co=
nfigure_prepend (but no longer included anywhere without the=C2=A0m2crypto-=
0.26.4-gcc_macros.patch</div><div><br></div><div>I&#39;ll send RFC patch wh=
ich fixed the build for me, but I&#39;m no expert on swig and this whole gc=
c_macros.h seems like a bit strange black magic to me.</div><div><br></div>=
<div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, May 5, 2021 at 10:50 PM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, May 5, 2021 at 1:13 PM =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank=
">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It doesn&#39;t seem to be missing header file as opensslconf-32.h doe=
sn&#39;t exist in either of them.<br>
&gt;<br>
<br>
32bit header file is not important, whats important is the wrapper<br>
that OE generates for non-multilib cases which breaks such cases as I<br>
pointed in the commit<br>
so you have this in opensslconf.h<br>
<br>
#if defined (__bpf__)<br>
#define __MHWORDSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 64<br>
#elif defined (__arm__)<br>
#define __MHWORDSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 32<br>
#elif defined (__aarch64__) &amp;&amp; defined ( __LP64__)<br>
#define __MHWORDSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 64<br>
#elif defined (__aarch64__)<br>
#define __MHWORDSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 32<br>
#else<br>
#include &lt;bits/wordsize.h&gt;<br>
#if defined (__WORDSIZE)<br>
#define __MHWORDSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __WORDSIZE<br>
#else<br>
#error &quot;__WORDSIZE is not defined&quot;<br>
#endif<br>
#endif<br>
<br>
#if __MHWORDSIZE =3D=3D 32<br>
<br>
#ifdef _MIPS_SIM<br>
<br>
#if _MIPS_SIM =3D=3D _ABIO32<br>
#include &lt;openssl/opensslconf-32.h&gt;<br>
#elif _MIPS_SIM =3D=3D _ABIN32<br>
#include &lt;openssl/opensslconf-n32.h&gt;<br>
#else<br>
#error &quot;Unknown _MIPS_SIM&quot;<br>
#endif<br>
<br>
#else /* _MIPS_SIM is not defined */<br>
#include &lt;openssl/opensslconf-32.h&gt;<br>
#endif<br>
<br>
#elif __MHWORDSIZE =3D=3D 64<br>
#include &lt;openssl/opensslconf-64.h&gt;<br>
#else<br>
#error &quot;Unknown __WORDSIZE detected&quot;<br>
#endif /* matches #if __WORDSIZE =3D=3D 32 */<br>
<br>
<br>
injected by this multilib game. Now if you do not have __MHWORDSIZE<br>
detected correctly then things take a very wrong course.<br>
I proposed this fix for OE-core but it is not yet accpeted.<br>
<br>
&gt; oe-core$ find tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/ -na=
me opensslconf\*<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-s=
ysroot-native/usr/include/openssl/opensslconf.h<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-s=
ysroot/usr/include/openssl/opensslconf-64.h<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-s=
ysroot/usr/include/openssl/opensslconf.h<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/rec=
ipe-sysroot-native/usr/include/openssl/opensslconf.h<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/rec=
ipe-sysroot/usr/include/openssl/opensslconf-64.h<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/rec=
ipe-sysroot/usr/include/openssl/opensslconf.h<br>
&gt;<br>
&gt; and the swig call seems to be similar, but with the new version the -=
I flags are different, I wonder if that caused wrong header to be read from=
 native sysroot or from host (ubuntu-21.04), will try to get some preproces=
sed output from swig to see which headers it really read:<br>
&gt;<br>
&gt; oe-core$ grep swig tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto=
/0.*/temp/log.do_compile<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/tem=
p/log.do_compile:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/tem=
p/log.do_compile:swig -python -py3<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.30.1-r0/recipe-sysroot/usr/include<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.30.1-r0/recipe-sysroot/usr/include/python3.9<br>
&gt; -I/usr/include/openssl<br>
&gt; -I/usr/lib/gcc/x86_64-linux-gnu/10/include<br>
&gt; -I/usr/local/include<br>
&gt; -I/usr/include/x86_64-linux-gnu<br>
&gt; -I/usr/include<br>
&gt; -includeall -modern -builtin -outdir /OE/build/oe-core/tmp-glibc/work=
/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/M2Crypto-0.30.1/M2Crypto -o =
SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i<br>
&gt;<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log=
.do_compile:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c<br>
&gt; tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log=
.do_compile:swig -python -py3<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch6=
4-oe-linux/gcc/aarch64-oe-linux/11.1.0/include<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch6=
4-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/include<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/include<br>
&gt; -I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/include/python3.9<br>
&gt; -I/usr/include/openssl<br>
&gt; -includeall -modern -builtin -outdir /OE/build/oe-core/tmp-glibc/work=
/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o =
SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i<br>
&gt;<br>
&gt; On Wed, May 5, 2021 at 7:41 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; hmmm I use<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/YoeDistro/openembedded-core/commit/=
bbb5e56c6db0fc7997a093bb400021edce6c7639" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6db0fc799=
7a093bb400021edce6c7639</a><br>
&gt;&gt;<br>
&gt;&gt; and i wonder thats why I do not see this ?<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 5, 2021 at 10:09 AM Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This upgrade seems to break the build for aarch64:<br>
&gt;&gt; &gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/580=
206/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/E=
rrors/Details/580206/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sat, May 1, 2021 at 9:06 PM Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Unifiy .inc into .bb<br>
&gt;&gt; &gt;&gt; Add patches to fix issues with openssl 1.1.x<br>
&gt;&gt; &gt;&gt; Remove m2crypto-0.26.4-gcc_macros patch, its no longer n=
eeded<br>
&gt;&gt; &gt;&gt; Refresh existing patches<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 .../m2crypto-0.26.4-gcc_macros.patch=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 | 35 --------------<br>
&gt;&gt; &gt;&gt;=C2=A0 ...verify_cb_-to-be-called-with-ok-True.patch | 47=
 +++++++++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 ...A_SSLV23_PADDING-has-been-deprecated.patch | 29=
 ++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 ...k-in-sysroot-not-in-host-directories.patch | 12=
 ++---<br>
&gt;&gt; &gt;&gt;=C2=A0 .../cross-compile-platform.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
&gt;&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-m2crypto_0.30=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.30.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
&gt;&gt; &gt;&gt;=C2=A0 ...2crypto.inc =3D&gt; <a href=3D"http://python3-m=
2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.=
37.1.bb</a>} |=C2=A0 8 ++--<br>
&gt;&gt; &gt;&gt;=C2=A0 7 files changed, 88 insertions(+), 53 deletions(-)=
<br>
&gt;&gt; &gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/py=
thon/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/py=
thon/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch=
<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/py=
thon/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.pa=
tch<br>
&gt;&gt; &gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python=
-m2crypto =3D&gt; python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-ho=
st-directories.patch (75%)<br>
&gt;&gt; &gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python=
-m2crypto =3D&gt; python3-m2crypto}/cross-compile-platform.patch (84%)<br>
&gt;&gt; &gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/py=
thon/<a href=3D"http://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-m2crypto_0.30.1.bb</a><br>
&gt;&gt; &gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python=
-m2crypto.inc =3D&gt; <a href=3D"http://python3-m2crypto_0.37.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.bb</a>} (86%)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-=
m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/py=
thon/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch<br>
&gt;&gt; &gt;&gt; deleted file mode 100644<br>
&gt;&gt; &gt;&gt; index 7f6dd29f8a..0000000000<br>
&gt;&gt; &gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypt=
o/m2crypto-0.26.4-gcc_macros.patch<br>
&gt;&gt; &gt;&gt; +++ /dev/null<br>
&gt;&gt; &gt;&gt; @@ -1,35 +0,0 @@<br>
&gt;&gt; &gt;&gt; -Imported from Fedora<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
&gt;&gt; &gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt; &gt;&gt; ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i<br>
&gt;&gt; &gt;&gt; -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
&gt;&gt; &gt;&gt; -@@ -8,6 +8,11 @@<br>
&gt;&gt; &gt;&gt; -=C2=A0 *<br>
&gt;&gt; &gt;&gt; -=C2=A0 */<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -+%import &quot;gcc_macros.h&quot;<br>
&gt;&gt; &gt;&gt; -+<br>
&gt;&gt; &gt;&gt; -+%ignore WCHAR_MAX;<br>
&gt;&gt; &gt;&gt; -+%ignore WCHAR_MIN;<br>
&gt;&gt; &gt;&gt; -+<br>
&gt;&gt; &gt;&gt; - %module(threads=3D1) m2crypto<br>
&gt;&gt; &gt;&gt; - /* We really don&#39;t need threadblock (PyGILState_En=
sure() etc.) anywhere.<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 Disable threadallow as well, only enable =
it for operations likely to<br>
&gt;&gt; &gt;&gt; -@@ -15,11 +20,6 @@<br>
&gt;&gt; &gt;&gt; - %nothreadblock;<br>
&gt;&gt; &gt;&gt; - %nothreadallow;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; --#if SWIG_VERSION &gt;=3D 0x030000<br>
&gt;&gt; &gt;&gt; --#define __WCHAR_MAX__ __WCHAR_MAX<br>
&gt;&gt; &gt;&gt; --#define __WCHAR_MIN__ __WCHAR_MIN<br>
&gt;&gt; &gt;&gt; --#endif<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; - %{<br>
&gt;&gt; &gt;&gt; - #ifdef _WIN32<br>
&gt;&gt; &gt;&gt; - #define _WINSOCKAPI_<br>
&gt;&gt; &gt;&gt; -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb=
_fu<br>
&gt;&gt; &gt;&gt; - %constant int encrypt =3D 1;<br>
&gt;&gt; &gt;&gt; - %constant int decrypt =3D 0;<br>
&gt;&gt; &gt;&gt; - #endif<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3=
-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch b/meta-pyth=
on/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-cal=
led-with-ok-True.patch<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 0000000000..3c836635a1<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2cryp=
to/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; &gt;&gt; +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 1=
7 00:00:00 2001<br>
&gt;&gt; &gt;&gt; +From: Casey Deccio &lt;<a href=3D"mailto:casey@deccio.n=
et" target=3D"_blank">casey@deccio.net</a>&gt;<br>
&gt;&gt; &gt;&gt; +Date: Fri, 8 Jan 2021 12:43:09 -0700<br>
&gt;&gt; &gt;&gt; +Subject: [PATCH] Allow verify_cb_* to be called with ok=
=
=3DTrue<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +With <a href=3D"https://github.com/openssl/openssl/comm=
it/2e06150e3928daa06d5ff70c32bffad8088ebe58" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32=
bffad8088ebe58</a><br>
&gt;&gt; &gt;&gt; +OpenSSL allowed verificaton to continue on UNABLE_TO_VE=
RIFY_LEAF_SIGNATURE<br>
&gt;&gt; &gt;&gt; +---<br>
&gt;&gt; &gt;&gt; + tests/test_ssl.py | 14 ++++++++++++--<br>
&gt;&gt; &gt;&gt; + 1 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +diff --git a/tests/test_ssl.py b/tests/test_ssl.py<br>
&gt;&gt; &gt;&gt; +index 92b6942..7a3271a 100644<br>
&gt;&gt; &gt;&gt; +--- a/tests/test_ssl.py<br>
&gt;&gt; &gt;&gt; ++++ b/tests/test_ssl.py<br>
&gt;&gt; &gt;&gt; +@@ -59,8 +59,13 @@ def allocate_srv_port():<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; + def verify_cb_new_function(ok, store):<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 assert not ok<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0err =3D store.get_error()<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 # If err is X509_V_ERR_UNABLE_TO_VERIFY_=
LEAF_SIGNATURE, then instead of<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 # aborting, this callback is called to r=
etrieve additional error<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 # information.=C2=A0 In this case, ok mi=
ght not be False.<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 # See <a href=3D"https://github.com/open=
ssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/openssl/openssl/commit/2e06150e39=
28daa06d5ff70c32bffad8088ebe58</a><br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 if err !=3D m2.X509_V_ERR_UNABLE_TO_VERI=
FY_LEAF_SIGNATURE:<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not ok<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert err in [m2.X509_V_ERR_DEPTH_=
ZERO_SELF_SIGNED_CERT,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 m2.X509_V_ERR_CERT_UNTRUSTED,<br>
&gt;&gt; &gt;&gt; +@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSS=
LClientTestCase):<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0def verify_cb_old(self, ctx_ptr, x5=
09_ptr, err, depth, ok):<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertF=
alse(ok)<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If err is =
X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # aborting, =
this callback is called to retrieve additional error<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # informatio=
n.=C2=A0 In this case, ok might not be False.<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a hre=
f=3D"https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bf=
fad8088ebe58" rel=3D"noreferrer" target=3D"_blank">https://github.com/opens=
sl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58</a><br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D =
m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:<br>
&gt;&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 self.assertFalse(ok)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.as=
sertIn(err,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[m2.X509_V_ERR_DEPTH_ZERO_SELF_SI=
GNED_CERT,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.X509_V_ERR_UNABLE_TO_GET_ISSU=
ER_CERT_LOCALLY,<br>
&gt;&gt; &gt;&gt; +--<br>
&gt;&gt; &gt;&gt; +2.29.2<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3=
-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-p=
ython/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDI=
NG-has-been-deprecated.patch<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 0000000000..2313a324a0<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2cryp=
to/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,29 @@<br>
&gt;&gt; &gt;&gt; +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 1=
7 00:00:00 2001<br>
&gt;&gt; &gt;&gt; +From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D &lt;<a hr=
ef=3D"mailto:mcepl@cepl.eu" target=3D"_blank">mcepl@cepl.eu</a>&gt;<br>
&gt;&gt; &gt;&gt; +Date: Fri, 19 Feb 2021 15:53:02 +0100<br>
&gt;&gt; &gt;&gt; +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been dep=
recated.<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +Fixes #293.<br>
&gt;&gt; &gt;&gt; +---<br>
&gt;&gt; &gt;&gt; + tests/test_rsa.py | 5 -----<br>
&gt;&gt; &gt;&gt; + 1 file changed, 5 deletions(-)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +diff --git a/tests/test_rsa.py b/tests/test_rsa.py<br>
&gt;&gt; &gt;&gt; +index 3de5016..7299785 100644<br>
&gt;&gt; &gt;&gt; +--- a/tests/test_rsa.py<br>
&gt;&gt; &gt;&gt; ++++ b/tests/test_rsa.py<br>
&gt;&gt; &gt;&gt; +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCas=
e):<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptxt =
=3D priv.private_decrypt(ctxt, p)<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.as=
sertEqual(ptxt, self.data)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sslv23_padding<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt =3D priv.public_encry=
pt(self.data, RSA.sslv23_padding)<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D priv.private_decry=
pt(ctxt, RSA.sslv23_padding)<br>
&gt;&gt; &gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(res, self=
.data)<br>
&gt;&gt; &gt;&gt; +-<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# no_padding<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with six.assertRaises=
Regex(self, RSA.RSAError, &#39;data too small&#39;):<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv.pu=
blic_encrypt(self.data, RSA.no_padding)<br>
&gt;&gt; &gt;&gt; +--<br>
&gt;&gt; &gt;&gt; +2.29.2<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-=
m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta=
-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysr=
oot-not-in-host-directories.patch<br>
&gt;&gt; &gt;&gt; similarity index 75%<br>
&gt;&gt; &gt;&gt; rename from meta-python/recipes-devtools/python/python-m=
2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; &gt;&gt; rename to meta-python/recipes-devtools/python/python3-m2=
crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; &gt;&gt; index b339d93f75..f4c74384f9 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypt=
o/0001-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; &gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2cryp=
to/0001-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; &gt;&gt; @@ -10,19 +10,17 @@ Upstream-status: Unknown<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0setup.py | 6 +++---<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions=
(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -Index: M2Crypto-0.30.1/setup.py<br>
&gt;&gt; &gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt; &gt;&gt; ---- M2Crypto-0.30.1.orig/setup.py<br>
&gt;&gt; &gt;&gt; -+++ M2Crypto-0.30.1/setup.py<br>
&gt;&gt; &gt;&gt; -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.b=
uild_<br>
&gt;&gt; &gt;&gt; +--- a/setup.py<br>
&gt;&gt; &gt;&gt; ++++ b/setup.py<br>
&gt;&gt; &gt;&gt; +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.b=
uild_<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_undefin=
ed_options(&#39;build&#39;, (&#39;bundledlls&#39;, &#39;bundledlls&#39;))<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.libraries =
=3D [&#39;ssl&#39;, &#39;crypto&#39;]<br>
&gt;&gt; &gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.openssl =3D os.e=
nviron.get( &quot;STAGING_DIR&quot; )<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if sys.platform =
=
=3D=3D &#39;win32&#39;:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
lf.libraries =3D [&#39;ssleay32&#39;, &#39;libeay32&#39;]<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self=
.openssl and openssl_version(self.openssl, 0x10100000, True):<br>
&gt;&gt; &gt;&gt; -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.b=
uild_<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self=
.openssl and openssl_version(self.openssl,<br>
&gt;&gt; &gt;&gt; +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.b=
uild_<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl =
is not None:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
g.debug(&#39;self.openssl =3D %s&#39;, self.openssl)<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-=
m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python=
/python3-m2crypto/cross-compile-platform.patch<br>
&gt;&gt; &gt;&gt; similarity index 84%<br>
&gt;&gt; &gt;&gt; rename from meta-python/recipes-devtools/python/python-m=
2crypto/cross-compile-platform.patch<br>
&gt;&gt; &gt;&gt; rename to meta-python/recipes-devtools/python/python3-m2=
crypto/cross-compile-platform.patch<br>
&gt;&gt; &gt;&gt; index 4b64f4613c..f039ae8665 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypt=
o/cross-compile-platform.patch<br>
&gt;&gt; &gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2cryp=
to/cross-compile-platform.patch<br>
&gt;&gt; &gt;&gt; @@ -4,11 +4,9 @@ since it pokes at the system for gettin=
g architecture values<br>
&gt;&gt; &gt;&gt;=C2=A0 Upstream-Status: Inappropriate<br>
&gt;&gt; &gt;&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -Index: M2Crypto-0.30.1/setup.py<br>
&gt;&gt; &gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt; &gt;&gt; ---- M2Crypto-0.30.1.orig/setup.py<br>
&gt;&gt; &gt;&gt; -+++ M2Crypto-0.30.1/setup.py<br>
&gt;&gt; &gt;&gt; -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.=
build_<br>
&gt;&gt; &gt;&gt; +--- a/setup.py<br>
&gt;&gt; &gt;&gt; ++++ b/setup.py<br>
&gt;&gt; &gt;&gt; +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.=
build_<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
g.debug(&#39;self.include_dirs =3D %s&#39;, self.include_dirs)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
g.debug(&#39;self.library_dirs =3D %s&#39;, self.library_dirs)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=
=
=3D"http://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-m2crypto_0.30.1.bb</a> b/meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-m2crypto_0.30.1.bb</a><br>
&gt;&gt; &gt;&gt; deleted file mode 100644<br>
&gt;&gt; &gt;&gt; index 4d63d4bd3a..0000000000<br>
&gt;&gt; &gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-m2crypto_0.30.1.bb</a><br>
&gt;&gt; &gt;&gt; +++ /dev/null<br>
&gt;&gt; &gt;&gt; @@ -1,2 +0,0 @@<br>
&gt;&gt; &gt;&gt; -inherit setuptools3<br>
&gt;&gt; &gt;&gt; -require python-m2crypto.inc<br>
&gt;&gt; &gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-=
m2crypto.inc b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto=
_0.37.1.bb</a><br>
&gt;&gt; &gt;&gt; similarity index 86%<br>
&gt;&gt; &gt;&gt; rename from meta-python/recipes-devtools/python/python-m=
2crypto.inc<br>
&gt;&gt; &gt;&gt; rename to meta-python/recipes-devtools/python/<a href=3D=
"http://python3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-m2crypto_0.37.1.bb</a><br>
&gt;&gt; &gt;&gt; index 797a0354bf..896d9d2cc4 100644<br>
&gt;&gt; &gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypt=
o.inc<br>
&gt;&gt; &gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-m2crypto_0.37.1.bb</a><br>
&gt;&gt; &gt;&gt; @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=3D &quot;${T=
HISDIR}/python-m2crypto:&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-setup.py-link-in-sy=
sroot-not-in-host-directories.patch \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://c=
ross-compile-platform.patch \<br>
&gt;&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://m2cryp=
to-0.26.4-gcc_macros.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-A=
llow-verify_cb_-to-be-called-with-ok-True.patch \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-U=
se-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;&gt; &gt;&gt; -SRC_URI[md5sum] =3D &quot;7fce3cbf85eb84a669682892b9357=
46b&quot;<br>
&gt;&gt; &gt;&gt; -SRC_URI[sha256sum] =3D &quot;a1b2751cdadc6afac3df8a5799=
676b7b7c67a6ad144bb62d38563062e7cd3fc6&quot;<br>
&gt;&gt; &gt;&gt; +SRC_URI[sha256sum] =3D &quot;e4e42f068b78ccbf113e5d0a72=
ae5f480f6c3ace4940b91e4fff5598cfff6fb3&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 PYPI_PACKAGE =3D &quot;M2Crypto&quot;<br>
&gt;&gt; &gt;&gt; -inherit pypi siteinfo<br>
&gt;&gt; &gt;&gt; +inherit pypi siteinfo setuptools3<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 DEPENDS +=3D &quot;openssl swig-native&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;\<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.31.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; <br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div>

--00000000000054b6ae05c19c2e60--
