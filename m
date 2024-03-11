Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC73C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:14:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.62385.1710162833690528601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=evyhEvVx;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e9df3416bso228312f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710162832; x=1710767632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8epejRZKPP/xwZo/EAxslx/Cb1xRIhRnft3GjRVtBbI=;
        b=evyhEvVxew/rN9MfSlNxQJps+16EfBidVV7/rj1VBr1uBVLXqWNTqfzBlYWnupW7SC
         mU0W4JaOXOoErHA6HdOCTnKiMw6PMm1yXbVUEsXxuDkcW4J97lbQGGIP2A30Uc3VirJm
         KPpC8u6suOXhQznv46YZDAJZGV+EKA50jpGwvURRwavZqPbO/L8vX266qDjQECZXkkgE
         lOWBZD5vFgJzujp+vUfey7nBKTc00AyBzQ3Qr/Mgqf634dTTkuAaxjShSd0yCOQUWXgw
         3B6r0gLC2x+CIfmqkJqOYDtNI6E4rLjo4iJJv02zOJypEpxLpkm8csm/G6SXw/GqJRe+
         kbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710162832; x=1710767632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8epejRZKPP/xwZo/EAxslx/Cb1xRIhRnft3GjRVtBbI=;
        b=p+3FiZB0saTjivhuWNonZ88q4hW91PN4QO53ysv/4q8MmmG/59BpzSnkEe0dVx9Ide
         bnp6NvND6k/mos9NwltqcVFjJE4w0X8BgcnrJbQYqBr2kJlOBcqy1jAOojEa5buSQQJ1
         Wbk6gg5c3Tyzt8NGTwcT4hTnKr3YaYKXzVCzokfBrWnWSkMrgvMnuWBArxDlVaAZ3E6G
         BIlzoJoT6MzDOVYfMtv46UL4Lf6TXqGpEdNXoZUV6vJ/mwo/if3GYSyA/pw//0IJ+AM/
         aEFQHAelRryKluljnN/PcWWb/JShw+b2uwFD9I5MypD01SXOoujc+jDZrrLCp6VnR3Io
         uJwg==
X-Forwarded-Encrypted: i=1; AJvYcCUo8hE5Oiw97Pt+6a1zRlOPaECSqapKyr8mVv8LaZnbwOOa1eonqqmYXOWMsf2AF3qwszm9qDW6II07WLNMeCnR7O5XRSpIkUwPwuvlRSH6RDWCtpI7pcA81w==
X-Gm-Message-State: AOJu0Ywy+HmfZsfcupWoM8yq6KSkIjzmn2V1jayxukQjDmIk1/0brCva
	5JE8X1vU2A8/2SNDMxCIe71h03eY1bEd3gWB88jmhkaIbKsO2Gq3tOsQmiUWFn4EsX91BZrFES0
	zeSYnwz+PyVskM7k+shD5PNjUwZQ=
X-Google-Smtp-Source: AGHT+IFtAHyvvpcsDJdKU4fmCIQzVZmLi9blIvmVoUtQptXCltoj6OmNDuSJDOBPkQlVk9igxV/U8N/fx3jLGBLCMYE=
X-Received: by 2002:a5d:660f:0:b0:33e:7065:78f2 with SMTP id
 n15-20020a5d660f000000b0033e706578f2mr3980426wru.40.1710162831799; Mon, 11
 Mar 2024 06:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <1709856910-618-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfzxU-v-S0rVjFfH6pX87Z8zMsmmnKXz2o7ofKyGdh_dA@mail.gmail.com> <DB5PR02MB10213E4CE78F0EE60BE8899D1EF242@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E4CE78F0EE60BE8899D1EF242@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Mar 2024 14:13:33 +0100
Message-ID: <CA+chaQfhgDu_mafebxpJBg70m7+ETn9z7Gs+uVFTSAEajrtW_w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH V2] abseil-cpp: upgrade 20230802.1 -> 20240116.1
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Mar 2024 13:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109272

> No idea how that was not detected before the below patch was integrated t=
hough.

You had the same chance to catch it on ML as me or khem..

On Mon, Mar 11, 2024 at 2:06=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Martin Jansa
> > Sent: den 10 mars 2024 14:54
> > To: wangmy@fujitsu.com; Peter Kjellerstedt <peter.kjellerstedt@axis.com=
>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH V2] abseil-cpp: upgrade 20230802.1 -=
>
> > 20240116.1
> >
> > Does this intentionally undo last 2 changes from Peter? The commit
> > message doesn't mention it
> >
> > https://git.openembedded.org/meta-openembedded/commit/?id=3D32eefcf1ca9=
7a08ea85f62a72b676e447f1b79a0
> > https://git.openembedded.org/meta-openembedded/commit/?id=3D5c554c9b8cb=
63b5d0d5f434c28dd71c0f1843448
>
> I have no idea what happened there, but I assume they were somehow
> accidentally reverted. No idea how that was not detected before the below
> patch was integrated though.
>
> Anyway, I have sent updated patches to restore what was reverted.
>
> //Peter
>
> >
> > also looks like libabsl_flags is no longer provided by this version
> > (got failure from one recipe, will check if it's expected).
> >
> > Regards,
> >
> > On Fri, Mar 8, 2024 at 1:15=E2=80=AFAM wangmy via lists.openembedded.or=
g
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > 0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
> > > revmoed since it's included in 20240116.1.
> > >
> > > Changelog:
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > -Added absl::NoDestructor<T> to simplify defining static types that d=
o
> > not need
> > >  to be destructed upon program exit.
> > > -Added configurable verbose logging (also known as VLOG).
> > > -Added absl::Overload(), which returns a functor that provides overlo=
ads
> > based
> > >  on the functors passed to it.
> > > -Bzlmod is now officially supported (previously it was supported by t=
he
> > community).
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...-Win32Waiter-and-PthreadWaiter-on-Mi.patch | 62 -----------------=
--
> > >  ...20230802.1.bb =3D> abseil-cpp_20240116.1.bb} | 37 +++--------
> > >  2 files changed, 9 insertions(+), 90 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/00=
04-
> > Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
> > >  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20230802.1.bb=
 =3D>
> > abseil-cpp_20240116.1.bb} (59%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoi=
d-
> > using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch b/meta-oe/recipes-
> > devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-
> > PthreadWaiter-on-Mi.patch
> > > deleted file mode 100644
> > > index db559bb16..000000000
> > > --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using=
-
> > both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
> > > +++ /dev/null
> > > @@ -1,62 +0,0 @@
> > > -From cb7665f39e23e95e2466390c60ee5a410780a3ed Mon Sep 17 00:00:00 20=
01
> > > -From: Derek Mauro <dmauro@google.com>
> > > -Date: Wed, 8 Nov 2023 09:55:31 -0800
> > > -Subject: [PATCH] Avoid using both Win32Waiter and PthreadWaiter on
> > MinGW, and
> > > - use StdcppWaiter instead.
> > > -
> > > -There are various flavors of MinGW, some of which support pthread,
> > > -and some of which support Win32. Instead of figuring out which
> > > -platform is being used, just use the generic implementation.
> > > -
> > > -PiperOrigin-RevId: 580565507
> > > -Change-Id: Ia85fd7496f1e6ebdeadb95202f0039e844826118
> > > -Upstream-Status: Backport
> > > ----
> > > - absl/synchronization/internal/pthread_waiter.h | 4 ++--
> > > - absl/synchronization/internal/win32_waiter.h   | 6 ++++--
> > > - 2 files changed, 6 insertions(+), 4 deletions(-)
> > > -
> > > -diff --git a/absl/synchronization/internal/pthread_waiter.h
> > b/absl/synchronization/internal/pthread_waiter.h
> > > -index 206aefa4..23db76ad 100644
> > > ---- a/absl/synchronization/internal/pthread_waiter.h
> > > -+++ b/absl/synchronization/internal/pthread_waiter.h
> > > -@@ -16,7 +16,7 @@
> > > - #ifndef ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> > > - #define ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> > > -
> > > --#ifndef _WIN32
> > > -+#if !defined(_WIN32) && !defined(__MINGW32__)
> > > - #include <pthread.h>
> > > -
> > > - #include "absl/base/config.h"
> > > -@@ -55,6 +55,6 @@ class PthreadWaiter : public
> > WaiterCrtp<PthreadWaiter> {
> > > - ABSL_NAMESPACE_END
> > > - }  // namespace absl
> > > -
> > > --#endif  // ndef _WIN32
> > > -+#endif  // !defined(_WIN32) && !defined(__MINGW32__)
> > > -
> > > - #endif  // ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> > > -diff --git a/absl/synchronization/internal/win32_waiter.h
> > b/absl/synchronization/internal/win32_waiter.h
> > > -index 87eb617c..fdab264e 100644
> > > ---- a/absl/synchronization/internal/win32_waiter.h
> > > -+++ b/absl/synchronization/internal/win32_waiter.h
> > > -@@ -20,7 +20,8 @@
> > > - #include <sdkddkver.h>
> > > - #endif
> > > -
> > > --#if defined(_WIN32) && _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> > > -+#if defined(_WIN32) && !defined(__MINGW32__) && \
> > > -+    _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> > > -
> > > - #include "absl/base/config.h"
> > > - #include "absl/synchronization/internal/kernel_timeout.h"
> > > -@@ -65,6 +66,7 @@ class Win32Waiter : public WaiterCrtp<Win32Waiter>=
 {
> > > - ABSL_NAMESPACE_END
> > > - }  // namespace absl
> > > -
> > > --#endif  // defined(_WIN32) && _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> > > -+#endif  // defined(_WIN32) && !defined(__MINGW32__) &&
> > > -+        // _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> > > -
> > > - #endif  // ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
> > > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-
> > cpp_20230802.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-
> > cpp_20240116.1.bb
> > > similarity index 59%
> > > rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1=
.bb
> > > rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.b=
b
> > > index 17db7b2e4..82b2d20e0 100644
> > > --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> > > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> > > @@ -1,24 +1,26 @@
> > >  SUMMARY =3D "Abseil is a cpp library like STL"
> > >  DESCRIPTION =3D "Abseil provides pieces missing from the C++ standar=
d.
> > Contains \
> > >  additional useful libraries like algorithm, container, debugging, ha=
sh,
> > memory, \
> > > -meta, numeric, strings, synchronization, time, types and utility."
> > > +meta, numeric, strings, synchronization, time, types and utility"
> > >  HOMEPAGE =3D "https://abseil.io/"
> > >  SECTION =3D "libs"
> > >  LICENSE =3D "Apache-2.0"
> > >  LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3915"
> > >
> > > -SRCREV =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
> > > -BRANCH =3D "lts_2023_08_02"
> > > +SRCREV =3D "2f9e432cce407ce0ae50676696666f33a77d42ac"
> > > +BRANCH =3D "lts_2024_01_16"
> > >  SRC_URI =3D "git://github.com/abseil/abseil-
> > cpp;branch=3D${BRANCH};protocol=3Dhttps \
> > >             file://0001-absl-always-use-asm-sgidefs.h.patch
> > \
> > >             file://0002-Remove-maes-option-from-cross-compilation.pat=
ch
> > \
> > >             file://abseil-ppc-fixes.patch \
> > >             file://0003-Remove-neon-option-from-cross-compilation.pat=
ch
> > \
> > > -           file://0004-Avoid-using-both-Win32Waiter-and-PthreadWaite=
r-
> > on-Mi.patch \
> > >            "
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > +ASNEEDED:class-native =3D ""
> > > +ASNEEDED:class-nativesdk =3D ""
> > > +
> > >  inherit cmake
> > >
> > >  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> > > @@ -26,29 +28,8 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> > >                   -DABSL_ENABLE_INSTALL=3DON \
> > >                  "
> > >
> > > -SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
> > > -
> > > -PACKAGES_DYNAMIC =3D "^libabsl-*"
> > > -PACKAGES_DYNAMIC:class-native =3D ""
> > > -
> > > -PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
> > > -
> > > -python split_dynamic_packages() {
> > > -    libdir =3D d.getVar('libdir')
> > > -
> > > -    libpackages =3D do_split_packages(
> > > -        d,
> > > -        root=3Dlibdir,
> > > -        file_regex=3Dr'^libabsl_(.*)\.so\..*$',
> > > -        output_pattern=3D'libabsl-%s',
> > > -        description=3D"abseil shared library %s",
> > > -        prepend=3DTrue,
> > > -        extra_depends=3D'',
> > > -    )
> > > -    if libpackages:
> > > -        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + '
> > '.join(libpackages))
> > > -}
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > >
> > > -ALLOW_EMPTY:${PN} =3D "1"
> > > +SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
> > >
> > > -BBCLASSEXTEND =3D "native nativesdk"
> > > +FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgcon=
fig"
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >

