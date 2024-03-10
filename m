Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5D5C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 13:54:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.37236.1710078836629915960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 06:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHfm3X93;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33e7946bddfso1530361f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710078835; x=1710683635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9dI1WASZnAMDzppVYxSlodz3GC/JTd9S+GO9tiMQzw=;
        b=VHfm3X93IWfpTANcT4uUIpHZwVxYqvQWgWlCRm4zpdlYxwu5R1eLVuu+HX7vezqO6O
         peWMEtyf3c1QQxV1IZFnd2plnQ0Ewm8rDzLqD1qQqlZ5otVbTabuGRHJ43pYA3cByAuf
         6D7lrK007K0bAaPsLmUyY+xjE9Gubk5TH5KXD9vs0sNCgOUnaQ+rfTuZntBBDQh304HX
         6czLM6062+84IvLC6/3IMkD1Kdfkm/MqNLYjyvQ6sTXGfCo50BEJvgTBdbg5ziaIAHkf
         qQJXp5wfD+qSI0D3hSljjqeRGgp/QSQ8RSzK8FjpvYzs5PVoYDRwf/LK3Fov9wsIW7W8
         v9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710078835; x=1710683635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9dI1WASZnAMDzppVYxSlodz3GC/JTd9S+GO9tiMQzw=;
        b=tjJJZk2RTE/lLM0kBTs8R0KO8ht1q0bP9pKhCQsYjRYRRESnkYfB3GGwckO3K8aTLn
         XZP2Xp6j3bOe6dyU/x9LCrKrQjKNzQqTe4/EQ6FUbMGf9KLvYPmCdareipcXlCJpbAKQ
         Im/jL9bKviSZRPhqacrl4aOX0s6Igb3HidSIib9kFjl6N3VzzLtRO//iRHEgmEZSTL+h
         xD7kBi/BaAaU4gbCFC11xvaAVwB3JHokXeKkrQ3yrAolt4yW1apQu3PKg1I4ICH+AWEN
         T0x+w5G0/i9BLJTme8bBRxHn6CcPx0BzMybHjxJUehB/iwDwMtkZ8nsNWoDS5lTLF3/K
         2Jkw==
X-Gm-Message-State: AOJu0Yxx5Lmkv8wUqxErcEVorHKhEpzMDxEuBeqv7oqWyJyqw1TBqwQM
	WOniHDiUFQ7hjoB5CCE9oM09yBKTVn73mOD+eAzmhmtF4+Vi+2gWi9VZCWIR94VG6+K/BZ61CkP
	1ze1evKf/QXKbhu4mtgjKwPZRhzc=
X-Google-Smtp-Source: AGHT+IFFADQN5ecuSvaK7jFkGdaa8bRc9k49LotvbjQehLeh09q689Nu6eyRMCGDQ6HsKrAj2kSFsAGCwPSkUe6kWuM=
X-Received: by 2002:a5d:4e08:0:b0:33e:38f1:77f6 with SMTP id
 p8-20020a5d4e08000000b0033e38f177f6mr2852320wrt.39.1710078834751; Sun, 10 Mar
 2024 06:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <1709856910-618-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1709856910-618-1-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Mar 2024 14:53:43 +0100
Message-ID: <CA+chaQfzxU-v-S0rVjFfH6pX87Z8zMsmmnKXz2o7ofKyGdh_dA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH V2] abseil-cpp: upgrade 20230802.1 -> 20240116.1
To: wangmy@fujitsu.com, Peter Kjellerstedt <pkj@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 13:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109254

Does this intentionally undo last 2 changes from Peter? The commit
message doesn't mention it

https://git.openembedded.org/meta-openembedded/commit/?id=3D32eefcf1ca97a08=
ea85f62a72b676e447f1b79a0
https://git.openembedded.org/meta-openembedded/commit/?id=3D5c554c9b8cb63b5=
d0d5f434c28dd71c0f1843448

also looks like libabsl_flags is no longer provided by this version
(got failure from one recipe, will check if it's expected).

Regards,

On Fri, Mar 8, 2024 at 1:15=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
> revmoed since it's included in 20240116.1.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -Added absl::NoDestructor<T> to simplify defining static types that do no=
t need
>  to be destructed upon program exit.
> -Added configurable verbose logging (also known as VLOG).
> -Added absl::Overload(), which returns a functor that provides overloads =
based
>  on the functors passed to it.
> -Bzlmod is now officially supported (previously it was supported by the c=
ommunity).
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...-Win32Waiter-and-PthreadWaiter-on-Mi.patch | 62 -------------------
>  ...20230802.1.bb =3D> abseil-cpp_20240116.1.bb} | 37 +++--------
>  2 files changed, 9 insertions(+), 90 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-A=
void-using-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch
>  rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20230802.1.bb =3D=
> abseil-cpp_20240116.1.bb} (59%)
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-us=
ing-both-Win32Waiter-and-PthreadWaiter-on-Mi.patch b/meta-oe/recipes-devtoo=
ls/abseil-cpp/abseil-cpp/0004-Avoid-using-both-Win32Waiter-and-PthreadWaite=
r-on-Mi.patch
> deleted file mode 100644
> index db559bb16..000000000
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-Avoid-using-bot=
h-Win32Waiter-and-PthreadWaiter-on-Mi.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From cb7665f39e23e95e2466390c60ee5a410780a3ed Mon Sep 17 00:00:00 2001
> -From: Derek Mauro <dmauro@google.com>
> -Date: Wed, 8 Nov 2023 09:55:31 -0800
> -Subject: [PATCH] Avoid using both Win32Waiter and PthreadWaiter on MinGW=
, and
> - use StdcppWaiter instead.
> -
> -There are various flavors of MinGW, some of which support pthread,
> -and some of which support Win32. Instead of figuring out which
> -platform is being used, just use the generic implementation.
> -
> -PiperOrigin-RevId: 580565507
> -Change-Id: Ia85fd7496f1e6ebdeadb95202f0039e844826118
> -Upstream-Status: Backport
> ----
> - absl/synchronization/internal/pthread_waiter.h | 4 ++--
> - absl/synchronization/internal/win32_waiter.h   | 6 ++++--
> - 2 files changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/absl/synchronization/internal/pthread_waiter.h b/absl/synch=
ronization/internal/pthread_waiter.h
> -index 206aefa4..23db76ad 100644
> ---- a/absl/synchronization/internal/pthread_waiter.h
> -+++ b/absl/synchronization/internal/pthread_waiter.h
> -@@ -16,7 +16,7 @@
> - #ifndef ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> - #define ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> -
> --#ifndef _WIN32
> -+#if !defined(_WIN32) && !defined(__MINGW32__)
> - #include <pthread.h>
> -
> - #include "absl/base/config.h"
> -@@ -55,6 +55,6 @@ class PthreadWaiter : public WaiterCrtp<PthreadWaiter>=
 {
> - ABSL_NAMESPACE_END
> - }  // namespace absl
> -
> --#endif  // ndef _WIN32
> -+#endif  // !defined(_WIN32) && !defined(__MINGW32__)
> -
> - #endif  // ABSL_SYNCHRONIZATION_INTERNAL_PTHREAD_WAITER_H_
> -diff --git a/absl/synchronization/internal/win32_waiter.h b/absl/synchro=
nization/internal/win32_waiter.h
> -index 87eb617c..fdab264e 100644
> ---- a/absl/synchronization/internal/win32_waiter.h
> -+++ b/absl/synchronization/internal/win32_waiter.h
> -@@ -20,7 +20,8 @@
> - #include <sdkddkver.h>
> - #endif
> -
> --#if defined(_WIN32) && _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> -+#if defined(_WIN32) && !defined(__MINGW32__) && \
> -+    _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> -
> - #include "absl/base/config.h"
> - #include "absl/synchronization/internal/kernel_timeout.h"
> -@@ -65,6 +66,7 @@ class Win32Waiter : public WaiterCrtp<Win32Waiter> {
> - ABSL_NAMESPACE_END
> - }  // namespace absl
> -
> --#endif  // defined(_WIN32) && _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> -+#endif  // defined(_WIN32) && !defined(__MINGW32__) &&
> -+        // _WIN32_WINNT >=3D _WIN32_WINNT_VISTA
> -
> - #endif  // ABSL_SYNCHRONIZATION_INTERNAL_WIN32_WAITER_H_
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb=
 b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> similarity index 59%
> rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> index 17db7b2e4..82b2d20e0 100644
> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.1.bb
> @@ -1,24 +1,26 @@
>  SUMMARY =3D "Abseil is a cpp library like STL"
>  DESCRIPTION =3D "Abseil provides pieces missing from the C++ standard. C=
ontains \
>  additional useful libraries like algorithm, container, debugging, hash, =
memory, \
> -meta, numeric, strings, synchronization, time, types and utility."
> +meta, numeric, strings, synchronization, time, types and utility"
>  HOMEPAGE =3D "https://abseil.io/"
>  SECTION =3D "libs"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3=
915"
>
> -SRCREV =3D "fb3621f4f897824c0dbe0615fa94543df6192f30"
> -BRANCH =3D "lts_2023_08_02"
> +SRCREV =3D "2f9e432cce407ce0ae50676696666f33a77d42ac"
> +BRANCH =3D "lts_2024_01_16"
>  SRC_URI =3D "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};proto=
col=3Dhttps \
>             file://0001-absl-always-use-asm-sgidefs.h.patch             \
>             file://0002-Remove-maes-option-from-cross-compilation.patch \
>             file://abseil-ppc-fixes.patch \
>             file://0003-Remove-neon-option-from-cross-compilation.patch \
> -           file://0004-Avoid-using-both-Win32Waiter-and-PthreadWaiter-on=
-Mi.patch \
>            "
>
>  S =3D "${WORKDIR}/git"
>
> +ASNEEDED:class-native =3D ""
> +ASNEEDED:class-nativesdk =3D ""
> +
>  inherit cmake
>
>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> @@ -26,29 +28,8 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>                   -DABSL_ENABLE_INSTALL=3DON \
>                  "
>
> -SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
> -
> -PACKAGES_DYNAMIC =3D "^libabsl-*"
> -PACKAGES_DYNAMIC:class-native =3D ""
> -
> -PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
> -
> -python split_dynamic_packages() {
> -    libdir =3D d.getVar('libdir')
> -
> -    libpackages =3D do_split_packages(
> -        d,
> -        root=3Dlibdir,
> -        file_regex=3Dr'^libabsl_(.*)\.so\..*$',
> -        output_pattern=3D'libabsl-%s',
> -        description=3D"abseil shared library %s",
> -        prepend=3DTrue,
> -        extra_depends=3D'',
> -    )
> -    if libpackages:
> -        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpack=
ages))
> -}
> +BBCLASSEXTEND =3D "native nativesdk"
>
> -ALLOW_EMPTY:${PN} =3D "1"
> +SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
>
> -BBCLASSEXTEND =3D "native nativesdk"
> +FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109211): https://lists.openembedded.org/g/openembedde=
d-devel/message/109211
> Mute This Topic: https://lists.openembedded.org/mt/104800225/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

