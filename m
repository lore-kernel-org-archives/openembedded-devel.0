Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C67C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 10:45:47 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.9201.1648118745469066856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 03:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ndpuhyMB;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id w7so7317498lfd.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rl0mpCcggQOANAdV1cLK6YAdICap0FtHnU1a0jux7c=;
        b=ndpuhyMBhELz2lPqZtok12HSVmjaVZp873kPqdujLHszpiJu0Dof3P+6rgjpJa3zsV
         GoeGHb9QYpiCBG5/5NEosK1Cepy04yr8on7ow94n69JlA7TDoyU8z6YtJYI3+qBK0xjM
         9GXnWM0NbHgB1QalerUOVm2RRyPCTIFBqhVlozPt1dW4Pwqo1hKgHIkOTOuurI0mGRPL
         vkO+7yJfeVtWztOcKaAC7pOX4hD8H+ik1KGS8GOWhZpn69HFCmd9qPFf0bDu26nj5ynC
         jTE3asb7Vxh7iod9upznDp/h0m1Jz+D2MSJeE0wG6O9kVk8YT7uLrR4G74H74IHuApGJ
         qJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rl0mpCcggQOANAdV1cLK6YAdICap0FtHnU1a0jux7c=;
        b=IOpA1RINO25oSNVB8jVBmK5JTO93tUavbQ3YQslgZXkFT7w5jDD0BJJxLjsqqS1pfz
         p+0NfpCexqLF/Ud77nTmAeZu2e6ww0KyI7ohHLKSrF00psS2t23+7vDKaKBluw4GL4Zk
         arm/Lna3mjMYCvGvEvWv9qg7mgNWlAiaB+46xzZQ/gZ6G4+Am2B+HhmvR4Pxae/G5ld3
         /ipmq9MDeU0GCIFDvRb2i6+4av2Z2QdvnStOLtSOsZBZRt8vmlM9qfOFaxgdsFKQgcN9
         edrzuvMy1IwIXj0CpC9eL8PnFLx4TyAXPeUpOGU1QqIaHAv3Dv94X5U2LRlMloxf7JeA
         PPGw==
X-Gm-Message-State: AOAM5321U/BIt98VlA6CLECarWveMxxUJeC7kriHlzB1JxiPV48+8fIL
	A6LeZMJd/NWWpFudv8v68YiIta1IdNZL8Mj3MJE=
X-Google-Smtp-Source: 
 ABdhPJyNzlGdfWb7NYqJpmT69yxeZeQcQusOgaDfTqxQKHdr38hxvomI4QT2Nj7UjoLtL5F+XaKxcdoGD0xprm/leqE=
X-Received: by 2002:a05:6512:282c:b0:44a:129c:7e73 with SMTP id
 cf44-20020a056512282c00b0044a129c7e73mr3450480lfb.106.1648118742863; Thu, 24
 Mar 2022 03:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220324102115.31112-1-mikko.rapeli@bmw.de>
 <20220324102115.31112-3-mikko.rapeli@bmw.de>
In-Reply-To: <20220324102115.31112-3-mikko.rapeli@bmw.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 24 Mar 2022 10:45:34 +0000
Message-ID: 
 <CANPvuRmnZPfVKmx+KfRJ9bL7av0vEVmpBmHg-5jKL1+XGpn56g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] polkit: switch from mozjs to duktape
 javascript engine
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000003753eb05daf48c32"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 10:45:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96195

--0000000000003753eb05daf48c32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Mikko Rapeli <mikko.rapeli@bmw.de> escreveu no dia quinta, 24/03/2022 =C3=
=A0(s)
10:21:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> cherry-pick the change from polkit 0.120+ upstream since
> it applies directly to 0.119. Drop mozjs patches.
>
> Removes mozjs and its dependency nspr from images. They account for
> roughly 21 Mb on 64bit ARM machines. The replacement libduktape is
> roughly 300 kb in size. Thus this saves at least 20 Mb in rootfs size
> when polkit is used.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  .../0002-jsauthority-port-to-mozjs-91.patch   |   38 -
>  ...ded-support-for-duktape-as-JS-engine.patch | 3463 +++++++++++++++++
>  ...re-to-call-JS_Init-and-JS_ShutDown-e.patch |   63 -
>  .../recipes-extended/polkit/polkit_0.119.bb   |    6 +-
>  4 files changed, 3466 insertions(+), 104 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-91.=
patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-as-=
JS-engine.patch
>  delete mode 100644
> meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-JS=
_Init-and-JS_ShutDown-e.patch
>
> diff --git
> a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> deleted file mode 100644
> index 5b3660da2..000000000
> ---
> a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs-9=
1.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001
> -From: Xi Ruoyao <xry111@mengyan1223.wang>
> -Date: Tue, 10 Aug 2021 19:09:42 +0800
> -Subject: [PATCH] jsauthority: port to mozjs-91
> -
> -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - configure.ac | 2 +-
> - meson.build  | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index d807086..5a7fc11 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 >=3D
> 2.30.0])
> - AC_SUBST(GLIB_CFLAGS)
> - AC_SUBST(GLIB_LIBS)
> -
> --PKG_CHECK_MODULES(LIBJS, [mozjs-78])
> -+PKG_CHECK_MODULES(LIBJS, [mozjs-91])
> -
> - AC_SUBST(LIBJS_CFLAGS)
> - AC_SUBST(LIBJS_CXXFLAGS)
> -diff --git a/meson.build b/meson.build
> -index b3702be..733bbff 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -126,7 +126,7 @@ expat_dep =3D dependency('expat')
> - assert(cc.has_header('expat.h', dependencies: expat_dep), 'Can\'t find
> expat.h. Please install expat.')
> - assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep),
> 'Can\'t find expat library. Please install expat.')
> -
> --mozjs_dep =3D dependency('mozjs-78')
> -+mozjs_dep =3D dependency('mozjs-91')
> -
> - dbus_dep =3D dependency('dbus-1')
> - dbus_confdir =3D dbus_dep.get_pkgconfig_variable('datadir',
> define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from
> sysconfdir with respect to commit#8eada3836465838
> diff --git
> a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-a=
s-JS-engine.patch
> b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-a=
s-JS-engine.patch
> new file mode 100644
> index 000000000..e44e4f6e4
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape-a=
s-JS-engine.patch
> @@ -0,0 +1,3463 @@
> +From eaecfb21e1bca42e99321cc731e21dbfc1ea0d0c Mon Sep 17 00:00:00 2001
> +From: Gustavo Lima Chaves <limachaves@gmail.com>
> +Date: Tue, 25 Jan 2022 09:43:21 +0000
> +Subject: [PATCH 3/3] Added support for duktape as JS engine
> +
> +Original author: Wu Xiaotian (@yetist)
> +Resurrection author, runaway-killer author: Gustavo Lima Chaves
> (@limachaves)
>

Upstream-Status: Backport [c7fc4e1b61f0fd82fc697c19c604af7e9fb291a2]

The right place for the Upstream-Status is on the commit message and not on
the commit comments ---
as in the commit comments it will be lost when merged.

Jose

+
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> +
> +---
> + .gitlab-ci.yml                                |    1 +
> + buildutil/ax_pthread.m4                       |  522 ++++++++
> + configure.ac                                  |   34 +-
> + docs/man/polkit.xml                           |    4 +-
> + meson.build                                   |   16 +-
> + meson_options.txt                             |    1 +
> + src/polkitbackend/Makefile.am                 |   17 +-
> + src/polkitbackend/meson.build                 |   14 +-
> + src/polkitbackend/polkitbackendcommon.c       |  530 +++++++++
> + src/polkitbackend/polkitbackendcommon.h       |  158 +++
> + .../polkitbackendduktapeauthority.c           | 1051 +++++++++++++++++
> + .../polkitbackendjsauthority.cpp              |  721 +----------
> + .../etc/polkit-1/rules.d/10-testing.rules     |    6 +-
> + .../test-polkitbackendjsauthority.c           |    2 +-
> + 14 files changed, 2399 insertions(+), 678 deletions(-)
> + create mode 100644 buildutil/ax_pthread.m4
> + create mode 100644 src/polkitbackend/polkitbackendcommon.c
> + create mode 100644 src/polkitbackend/polkitbackendcommon.h
> + create mode 100644 src/polkitbackend/polkitbackendduktapeauthority.c
> +
> +Upstream-Status: Backport [c7fc4e1b61f0fd82fc697c19c604af7e9fb291a2]
> +Dropped change to .gitlab-ci.yml and adapted configure.ac due to other
> +patches in meta-oe.
> +
> +diff --git a/buildutil/ax_pthread.m4 b/buildutil/ax_pthread.m4
> +new file mode 100644
> +index 0000000..9f35d13
> +--- /dev/null
> ++++ b/buildutil/ax_pthread.m4
> +@@ -0,0 +1,522 @@
> ++#
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> ++#        https://www.gnu.org/software/autoconf-archive/ax_pthread.html
> ++#
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   This macro figures out how to build C programs using POSIX threads.
> It
> ++#   sets the PTHREAD_LIBS output variable to the threads library and
> linker
> ++#   flags, and the PTHREAD_CFLAGS output variable to any special C
> compiler
> ++#   flags that are needed. (The user can also force certain compiler
> ++#   flags/libs to be tested by setting these environment variables.)
> ++#
> ++#   Also sets PTHREAD_CC and PTHREAD_CXX to any special C compiler that
> is
> ++#   needed for multi-threaded programs (defaults to the value of CC
> ++#   respectively CXX otherwise). (This is necessary on e.g. AIX to use
> the
> ++#   special cc_r/CC_r compiler alias.)
> ++#
> ++#   NOTE: You are assumed to not only compile your program with these
> flags,
> ++#   but also to link with them as well. For example, you might link wit=
h
> ++#   $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIB=
S
> ++#   $PTHREAD_CXX $CXXFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS
> $LIBS
> ++#
> ++#   If you are only building threaded programs, you may wish to use the=
se
> ++#   variables in your default LIBS, CFLAGS, and CC:
> ++#
> ++#     LIBS=3D"$PTHREAD_LIBS $LIBS"
> ++#     CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> ++#     CXXFLAGS=3D"$CXXFLAGS $PTHREAD_CFLAGS"
> ++#     CC=3D"$PTHREAD_CC"
> ++#     CXX=3D"$PTHREAD_CXX"
> ++#
> ++#   In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute consta=
nt
> ++#   has a nonstandard name, this macro defines PTHREAD_CREATE_JOINABLE =
to
> ++#   that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
> ++#
> ++#   Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is found and t=
he
> ++#   PTHREAD_PRIO_INHERIT symbol is defined when compiling with
> ++#   PTHREAD_CFLAGS.
> ++#
> ++#   ACTION-IF-FOUND is a list of shell commands to run if a threads
> library
> ++#   is found, and ACTION-IF-NOT-FOUND is a list of commands to run it i=
f
> it
> ++#   is not found. If ACTION-IF-FOUND is not specified, the default acti=
on
> ++#   will define HAVE_PTHREAD.
> ++#
> ++#   Please let the authors know if this macro fails on any platform, or
> if
> ++#   you have any other suggestions or comments. This macro was based on
> work
> ++#   by SGJ on autoconf scripts for FFTW (http://www.fftw.org/) (with
> help
> ++#   from M. Frigo), as well as ac_pthread and hb_pthread macros posted =
by
> ++#   Alejandro Forero Cuervo to the autoconf macro repository. We are al=
so
> ++#   grateful for the helpful feedback of numerous users.
> ++#
> ++#   Updated for Autoconf 2.68 by Daniel Richard G.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
> ++#   Copyright (c) 2011 Daniel Richard G. <skunk@iSKUNK.ORG>
> ++#   Copyright (c) 2019 Marc Stevens <marc.stevens@cwi.nl>
> ++#
> ++#   This program is free software: you can redistribute it and/or modif=
y
> it
> ++#   under the terms of the GNU General Public License as published by t=
he
> ++#   Free Software Foundation, either version 3 of the License, or (at
> your
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> General
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License
> along
> ++#   with this program. If not, see <https://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright
> owner
> ++#   gives unlimited permission to copy, distribute and modify the
> configure
> ++#   scripts that are the output of Autoconf when processing the Macro.
> You
> ++#   need not follow the terms of the GNU General Public License when
> using
> ++#   or distributing such scripts, even though portions of the text of t=
he
> ++#   Macro appear in them. The GNU General Public License (GPL) does
> govern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoco=
nf
> ++#   Macro released by the Autoconf Archive. When you make and distribut=
e
> a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 31
> ++
> ++AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
> ++AC_DEFUN([AX_PTHREAD], [
> ++AC_REQUIRE([AC_CANONICAL_HOST])
> ++AC_REQUIRE([AC_PROG_CC])
> ++AC_REQUIRE([AC_PROG_SED])
> ++AC_LANG_PUSH([C])
> ++ax_pthread_ok=3Dno
> ++
> ++# We used to check for pthread.h first, but this fails if pthread.h
> ++# requires special compiler flags (e.g. on Tru64 or Sequent).
> ++# It gets checked for in the link test anyway.
> ++
> ++# First of all, check if the user has set any of the PTHREAD_LIBS,
> ++# etcetera environment variables, and if threads linking works using
> ++# them:
> ++if test "x$PTHREAD_CFLAGS$PTHREAD_LIBS" !=3D "x"; then
> ++        ax_pthread_save_CC=3D"$CC"
> ++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
> ++        ax_pthread_save_LIBS=3D"$LIBS"
> ++        AS_IF([test "x$PTHREAD_CC" !=3D "x"], [CC=3D"$PTHREAD_CC"])
> ++        AS_IF([test "x$PTHREAD_CXX" !=3D "x"], [CXX=3D"$PTHREAD_CXX"])
> ++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> ++        LIBS=3D"$PTHREAD_LIBS $LIBS"
> ++        AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS
> $PTHREAD_LIBS])
> ++        AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])],
> [ax_pthread_ok=3Dyes])
> ++        AC_MSG_RESULT([$ax_pthread_ok])
> ++        if test "x$ax_pthread_ok" =3D "xno"; then
> ++                PTHREAD_LIBS=3D""
> ++                PTHREAD_CFLAGS=3D""
> ++        fi
> ++        CC=3D"$ax_pthread_save_CC"
> ++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
> ++        LIBS=3D"$ax_pthread_save_LIBS"
> ++fi
> ++
> ++# We must check for the threads library under a number of different
> ++# names; the ordering is very important because some systems
> ++# (e.g. DEC) have both -lpthread and -lpthreads, where one of the
> ++# libraries is broken (non-POSIX).
> ++
> ++# Create a list of thread flags to try. Items with a "," contain both
> ++# C compiler flags (before ",") and linker flags (after ","). Other ite=
ms
> ++# starting with a "-" are C compiler flags, and remaining items are
> ++# library names, except for "none" which indicates that we try without
> ++# any flags at all, and "pthread-config" which is a program returning
> ++# the flags for the Pth emulation library.
> ++
> ++ax_pthread_flags=3D"pthreads none -Kthread -pthread -pthreads -mthreads
> pthread --thread-safe -mt pthread-config"
> ++
> ++# The ordering *is* (sometimes) important.  Some notes on the
> ++# individual items follow:
> ++
> ++# pthreads: AIX (must check this before -lpthread)
> ++# none: in case threads are in libc; should be tried before -Kthread an=
d
> ++#       other compiler flags to prevent continual compiler warnings
> ++# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h=
)
> ++# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads), Tru=
64
> ++#           (Note: HP C rejects this with "bad form for `-t' option")
> ++# -pthreads: Solaris/gcc (Note: HP C also rejects)
> ++# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
> ++#      doesn't hurt to check since this sometimes defines pthreads and
> ++#      -D_REENTRANT too), HP C (must be checked before -lpthread, which
> ++#      is present but should not be used directly; and before -mthreads=
,
> ++#      because the compiler interprets this as "-mt" + "-hreads")
> ++# -mthreads: Mingw32/gcc, Lynx/gcc
> ++# pthread: Linux, etcetera
> ++# --thread-safe: KAI C++
> ++# pthread-config: use pthread-config program (for GNU Pth library)
> ++
> ++case $host_os in
> ++
> ++        freebsd*)
> ++
> ++        # -kthread: FreeBSD kernel threads (preferred to -pthread since
> SMP-able)
> ++        # lthread: LinuxThreads port on FreeBSD (also preferred to
> -pthread)
> ++
> ++        ax_pthread_flags=3D"-kthread lthread $ax_pthread_flags"
> ++        ;;
> ++
> ++        hpux*)
> ++
> ++        # From the cc(1) man page: "[-mt] Sets various -D flags to enab=
le
> ++        # multi-threading and also sets -lpthread."
> ++
> ++        ax_pthread_flags=3D"-mt -pthread pthread $ax_pthread_flags"
> ++        ;;
> ++
> ++        openedition*)
> ++
> ++        # IBM z/OS requires a feature-test macro to be defined in order
> to
> ++        # enable POSIX threads at all, so give the user a hint if this =
is
> ++        # not set. (We don't define these ourselves, as they can affect
> ++        # other portions of the system API in unpredictable ways.)
> ++
> ++        AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
> ++            [
> ++#            if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
> ++             AX_PTHREAD_ZOS_MISSING
> ++#            endif
> ++            ],
> ++            [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or
> -D_UNIX03_THREADS to enable pthreads support.])])
> ++        ;;
> ++
> ++        solaris*)
> ++
> ++        # On Solaris (at least, for some versions), libc contains stubb=
ed
> ++        # (non-functional) versions of the pthreads routines, so
> link-based
> ++        # tests will erroneously succeed. (N.B.: The stubs are missing
> ++        # pthread_cleanup_push, or rather a function called by this
> macro,
> ++        # so we could check for that, but who knows whether they'll stu=
b
> ++        # that too in a future libc.)  So we'll check first for the
> ++        # standard Solaris way of linking pthreads (-mt -lpthread).
> ++
> ++        ax_pthread_flags=3D"-mt,-lpthread pthread $ax_pthread_flags"
> ++        ;;
> ++esac
> ++
> ++# Are we compiling with Clang?
> ++
> ++AC_CACHE_CHECK([whether $CC is Clang],
> ++    [ax_cv_PTHREAD_CLANG],
> ++    [ax_cv_PTHREAD_CLANG=3Dno
> ++     # Note that Autoconf sets GCC=3Dyes for Clang as well as GCC
> ++     if test "x$GCC" =3D "xyes"; then
> ++        AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
> ++            [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
> ++#            if defined(__clang__) && defined(__llvm__)
> ++             AX_PTHREAD_CC_IS_CLANG
> ++#            endif
> ++            ],
> ++            [ax_cv_PTHREAD_CLANG=3Dyes])
> ++     fi
> ++    ])
> ++ax_pthread_clang=3D"$ax_cv_PTHREAD_CLANG"
> ++
> ++
> ++# GCC generally uses -pthread, or -pthreads on some platforms (e.g.
> SPARC)
> ++
> ++# Note that for GCC and Clang -pthread generally implies -lpthread,
> ++# except when -nostdlib is passed.
> ++# This is problematic using libtool to build C++ shared libraries with
> pthread:
> ++# [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D25460
> ++# [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D661333
> ++# [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D468555
> ++# To solve this, first try -pthread together with -lpthread for GCC
> ++
> ++AS_IF([test "x$GCC" =3D "xyes"],
> ++      [ax_pthread_flags=3D"-pthread,-lpthread -pthread -pthreads
> $ax_pthread_flags"])
> ++
> ++# Clang takes -pthread (never supported any other flag), but we'll try
> with -lpthread first
> ++
> ++AS_IF([test "x$ax_pthread_clang" =3D "xyes"],
> ++      [ax_pthread_flags=3D"-pthread,-lpthread -pthread"])
> ++
> ++
> ++# The presence of a feature test macro requesting re-entrant function
> ++# definitions is, on some systems, a strong hint that pthreads support =
is
> ++# correctly enabled
> ++
> ++case $host_os in
> ++        darwin* | hpux* | linux* | osf* | solaris*)
> ++        ax_pthread_check_macro=3D"_REENTRANT"
> ++        ;;
> ++
> ++        aix*)
> ++        ax_pthread_check_macro=3D"_THREAD_SAFE"
> ++        ;;
> ++
> ++        *)
> ++        ax_pthread_check_macro=3D"--"
> ++        ;;
> ++esac
> ++AS_IF([test "x$ax_pthread_check_macro" =3D "x--"],
> ++      [ax_pthread_check_cond=3D0],
> ++      [ax_pthread_check_cond=3D"!defined($ax_pthread_check_macro)"])
> ++
> ++
> ++if test "x$ax_pthread_ok" =3D "xno"; then
> ++for ax_pthread_try_flag in $ax_pthread_flags; do
> ++
> ++        case $ax_pthread_try_flag in
> ++                none)
> ++                AC_MSG_CHECKING([whether pthreads work without any
> flags])
> ++                ;;
> ++
> ++                *,*)
> ++                PTHREAD_CFLAGS=3D`echo $ax_pthread_try_flag | sed
> "s/^\(.*\),\(.*\)$/\1/"`
> ++                PTHREAD_LIBS=3D`echo $ax_pthread_try_flag | sed
> "s/^\(.*\),\(.*\)$/\2/"`
> ++                AC_MSG_CHECKING([whether pthreads work with
> "$PTHREAD_CFLAGS" and "$PTHREAD_LIBS"])
> ++                ;;
> ++
> ++                -*)
> ++                AC_MSG_CHECKING([whether pthreads work with
> $ax_pthread_try_flag])
> ++                PTHREAD_CFLAGS=3D"$ax_pthread_try_flag"
> ++                ;;
> ++
> ++                pthread-config)
> ++                AC_CHECK_PROG([ax_pthread_config], [pthread-config],
> [yes], [no])
> ++                AS_IF([test "x$ax_pthread_config" =3D "xno"], [continue=
])
> ++                PTHREAD_CFLAGS=3D"`pthread-config --cflags`"
> ++                PTHREAD_LIBS=3D"`pthread-config --ldflags` `pthread-con=
fig
> --libs`"
> ++                ;;
> ++
> ++                *)
> ++                AC_MSG_CHECKING([for the pthreads library
> -l$ax_pthread_try_flag])
> ++                PTHREAD_LIBS=3D"-l$ax_pthread_try_flag"
> ++                ;;
> ++        esac
> ++
> ++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
> ++        ax_pthread_save_LIBS=3D"$LIBS"
> ++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> ++        LIBS=3D"$PTHREAD_LIBS $LIBS"
> ++
> ++        # Check for various functions.  We must include pthread.h,
> ++        # since some functions may be macros.  (On the Sequent, we
> ++        # need a special flag -Kthread to make this header compile.)
> ++        # We check for pthread_join because it is in -lpthread on IRIX
> ++        # while pthread_create is in libc.  We check for
> pthread_attr_init
> ++        # due to DEC craziness with -lpthreads.  We check for
> ++        # pthread_cleanup_push because it is one of the few pthread
> ++        # functions on Solaris that doesn't have a non-functional libc
> stub.
> ++        # We try pthread_create on general principles.
> ++
> ++        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
> ++#                       if $ax_pthread_check_cond
> ++#                        error "$ax_pthread_check_macro must be defined=
"
> ++#                       endif
> ++                        static void *some_global =3D NULL;
> ++                        static void routine(void *a)
> ++                          {
> ++                             /* To avoid any unused-parameter or
> ++                                unused-but-set-parameter warning.  */
> ++                             some_global =3D a;
> ++                          }
> ++                        static void *start_routine(void *a) { return a;
> }],
> ++                       [pthread_t th; pthread_attr_t attr;
> ++                        pthread_create(&th, 0, start_routine, 0);
> ++                        pthread_join(th, 0);
> ++                        pthread_attr_init(&attr);
> ++                        pthread_cleanup_push(routine, 0);
> ++                        pthread_cleanup_pop(0) /* ; */])],
> ++            [ax_pthread_ok=3Dyes],
> ++            [])
> ++
> ++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
> ++        LIBS=3D"$ax_pthread_save_LIBS"
> ++
> ++        AC_MSG_RESULT([$ax_pthread_ok])
> ++        AS_IF([test "x$ax_pthread_ok" =3D "xyes"], [break])
> ++
> ++        PTHREAD_LIBS=3D""
> ++        PTHREAD_CFLAGS=3D""
> ++done
> ++fi
> ++
> ++
> ++# Clang needs special handling, because older versions handle the
> -pthread
> ++# option in a rather... idiosyncratic way
> ++
> ++if test "x$ax_pthread_clang" =3D "xyes"; then
> ++
> ++        # Clang takes -pthread; it has never supported any other flag
> ++
> ++        # (Note 1: This will need to be revisited if a system that Clan=
g
> ++        # supports has POSIX threads in a separate library.  This tends
> not
> ++        # to be the way of modern systems, but it's conceivable.)
> ++
> ++        # (Note 2: On some systems, notably Darwin, -pthread is not
> needed
> ++        # to get POSIX threads support; the API is always present and
> ++        # active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
> ++        # -pthread does define _REENTRANT, and while the Darwin headers
> ++        # ignore this macro, third-party headers might not.)
> ++
> ++        # However, older versions of Clang make a point of warning the
> user
> ++        # that, in an invocation where only linking and no compilation =
is
> ++        # taking place, the -pthread option has no effect ("argument
> unused
> ++        # during compilation").  They expect -pthread to be passed in
> only
> ++        # when source code is being compiled.
> ++        #
> ++        # Problem is, this is at odds with the way Automake and most
> other
> ++        # C build frameworks function, which is that the same flags use=
d
> in
> ++        # compilation (CFLAGS) are also used in linking.  Many systems
> ++        # supported by AX_PTHREAD require exactly this for POSIX thread=
s
> ++        # support, and in fact it is often not straightforward to
> specify a
> ++        # flag that is used only in the compilation phase and not in
> ++        # linking.  Such a scenario is extremely rare in practice.
> ++        #
> ++        # Even though use of the -pthread flag in linking would only
> print
> ++        # a warning, this can be a nuisance for well-run software
> projects
> ++        # that build with -Werror.  So if the active version of Clang h=
as
> ++        # this misfeature, we search for an option to squash it.
> ++
> ++        AC_CACHE_CHECK([whether Clang needs flag to prevent "argument
> unused" warning when linking with -pthread],
> ++            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
> ++            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3Dunknown
> ++             # Create an alternate version of $ac_link that compiles an=
d
> ++             # links in two steps (.c -> .o, .o -> exe) instead of one
> ++             # (.c -> exe), because the warning occurs only in the seco=
nd
> ++             # step
> ++             ax_pthread_save_ac_link=3D"$ac_link"
> ++             ax_pthread_sed=3D's/conftest\.\$ac_ext/conftest.$ac_objext=
/g'
> ++             ax_pthread_link_step=3D`AS_ECHO(["$ac_link"]) | sed
> "$ax_pthread_sed"`
> ++             ax_pthread_2step_ac_link=3D"($ac_compile) && (echo =3D=3D=
=3D=3D >&5)
> && ($ax_pthread_link_step)"
> ++             ax_pthread_save_CFLAGS=3D"$CFLAGS"
> ++             for ax_pthread_try in '' -Qunused-arguments
> -Wno-unused-command-line-argument unknown; do
> ++                AS_IF([test "x$ax_pthread_try" =3D "xunknown"], [break]=
)
> ++                CFLAGS=3D"-Werror -Wunknown-warning-option $ax_pthread_=
try
> -pthread $ax_pthread_save_CFLAGS"
> ++                ac_link=3D"$ax_pthread_save_ac_link"
> ++                AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return
> 0;}]])],
> ++                    [ac_link=3D"$ax_pthread_2step_ac_link"
> ++                     AC_LINK_IFELSE([AC_LANG_SOURCE([[int
> main(void){return 0;}]])],
> ++                         [break])
> ++                    ])
> ++             done
> ++             ac_link=3D"$ax_pthread_save_ac_link"
> ++             CFLAGS=3D"$ax_pthread_save_CFLAGS"
> ++             AS_IF([test "x$ax_pthread_try" =3D "x"], [ax_pthread_try=
=3Dno])
> ++             ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=3D"$ax_pthread_try"
> ++            ])
> ++
> ++        case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
> ++                no | unknown) ;;
> ++                *) PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG
> $PTHREAD_CFLAGS" ;;
> ++        esac
> ++
> ++fi # $ax_pthread_clang =3D yes
> ++
> ++
> ++
> ++# Various other checks:
> ++if test "x$ax_pthread_ok" =3D "xyes"; then
> ++        ax_pthread_save_CFLAGS=3D"$CFLAGS"
> ++        ax_pthread_save_LIBS=3D"$LIBS"
> ++        CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> ++        LIBS=3D"$PTHREAD_LIBS $LIBS"
> ++
> ++        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
> ++        AC_CACHE_CHECK([for joinable pthread attribute],
> ++            [ax_cv_PTHREAD_JOINABLE_ATTR],
> ++            [ax_cv_PTHREAD_JOINABLE_ATTR=3Dunknown
> ++             for ax_pthread_attr in PTHREAD_CREATE_JOINABLE
> PTHREAD_CREATE_UNDETACHED; do
> ++                 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>]=
,
> ++                                                 [int attr =3D
> $ax_pthread_attr; return attr /* ; */])],
> ++
> [ax_cv_PTHREAD_JOINABLE_ATTR=3D$ax_pthread_attr; break],
> ++                                [])
> ++             done
> ++            ])
> ++        AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D "xunknown" && =
\
> ++               test "x$ax_cv_PTHREAD_JOINABLE_ATTR" !=3D
> "xPTHREAD_CREATE_JOINABLE" && \
> ++               test "x$ax_pthread_joinable_attr_defined" !=3D "xyes"],
> ++              [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
> ++                                  [$ax_cv_PTHREAD_JOINABLE_ATTR],
> ++                                  [Define to necessary symbol if this
> constant
> ++                                   uses a non-standard name on your
> system.])
> ++               ax_pthread_joinable_attr_defined=3Dyes
> ++              ])
> ++
> ++        AC_CACHE_CHECK([whether more special flags are required for
> pthreads],
> ++            [ax_cv_PTHREAD_SPECIAL_FLAGS],
> ++            [ax_cv_PTHREAD_SPECIAL_FLAGS=3Dno
> ++             case $host_os in
> ++             solaris*)
> ++             ax_cv_PTHREAD_SPECIAL_FLAGS=3D"-D_POSIX_PTHREAD_SEMANTICS"
> ++             ;;
> ++             esac
> ++            ])
> ++        AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" !=3D "xno" && \
> ++               test "x$ax_pthread_special_flags_added" !=3D "xyes"],
> ++              [PTHREAD_CFLAGS=3D"$ax_cv_PTHREAD_SPECIAL_FLAGS
> $PTHREAD_CFLAGS"
> ++               ax_pthread_special_flags_added=3Dyes])
> ++
> ++        AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
> ++            [ax_cv_PTHREAD_PRIO_INHERIT],
> ++            [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
> ++                                             [[int i =3D
> PTHREAD_PRIO_INHERIT;
> ++                                               return i;]])],
> ++                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],
> ++                            [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])
> ++            ])
> ++        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" =3D "xyes" && \
> ++               test "x$ax_pthread_prio_inherit_defined" !=3D "xyes"],
> ++              [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have
> PTHREAD_PRIO_INHERIT.])
> ++               ax_pthread_prio_inherit_defined=3Dyes
> ++              ])
> ++
> ++        CFLAGS=3D"$ax_pthread_save_CFLAGS"
> ++        LIBS=3D"$ax_pthread_save_LIBS"
> ++
> ++        # More AIX lossage: compile with *_r variant
> ++        if test "x$GCC" !=3D "xyes"; then
> ++            case $host_os in
> ++                aix*)
> ++                AS_CASE(["x/$CC"],
> ++
> [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/xlc|x*/xlc_v6|x*/x=
lc128|x*/xlc128_v6],
> ++                    [#handle absolute path differently from PATH based
> program lookup
> ++                     AS_CASE(["x$CC"],
> ++                         [x/*],
> ++                         [
> ++
>  AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC=3D"${CC}_r"])
> ++                         AS_IF([test "x${CXX}" !=3D "x"],
> [AS_IF([AS_EXECUTABLE_P([${CXX}_r])],[PTHREAD_CXX=3D"${CXX}_r"])])
> ++                       ],
> ++                         [
> ++                         AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])
> ++                         AS_IF([test "x${CXX}" !=3D "x"],
> [AC_CHECK_PROGS([PTHREAD_CXX],[${CXX}_r],[$CXX])])
> ++                       ]
> ++                     )
> ++                    ])
> ++                ;;
> ++            esac
> ++        fi
> ++fi
> ++
> ++test -n "$PTHREAD_CC" || PTHREAD_CC=3D"$CC"
> ++test -n "$PTHREAD_CXX" || PTHREAD_CXX=3D"$CXX"
> ++
> ++AC_SUBST([PTHREAD_LIBS])
> ++AC_SUBST([PTHREAD_CFLAGS])
> ++AC_SUBST([PTHREAD_CC])
> ++AC_SUBST([PTHREAD_CXX])
> ++
> ++# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
> ++if test "x$ax_pthread_ok" =3D "xyes"; then
> ++        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have
> POSIX threads libraries and header files.])],[$1])
> ++        :
> ++else
> ++        ax_pthread_ok=3Dno
> ++        $2
> ++fi
> ++AC_LANG_POP
> ++])dnl AX_PTHREAD
> +diff --git a/configure.ac b/configure.ac
> +index b625743..bbf4768 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -80,11 +80,22 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 >=
=3D
> 2.30.0])
> + AC_SUBST(GLIB_CFLAGS)
> + AC_SUBST(GLIB_LIBS)
> +
> +-PKG_CHECK_MODULES(LIBJS, [mozjs-78])
> +-
> +-AC_SUBST(LIBJS_CFLAGS)
> +-AC_SUBST(LIBJS_CXXFLAGS)
> +-AC_SUBST(LIBJS_LIBS)
> ++dnl
> -------------------------------------------------------------------------=
--
> ++dnl - Check javascript backend
> ++dnl
> -------------------------------------------------------------------------=
--
> ++AC_ARG_WITH(duktape, AS_HELP_STRING([--with-duktape],[Use Duktape as
> javascript backend]),with_duktape=3Dyes,with_duktape=3Dno)
> ++AS_IF([test x${with_duktape} =3D=3D xyes], [
> ++  PKG_CHECK_MODULES(LIBJS, [duktape >=3D 2.2.0 ])
> ++  AC_SUBST(LIBJS_CFLAGS)
> ++  AC_SUBST(LIBJS_LIBS)
> ++], [
> ++  PKG_CHECK_MODULES(LIBJS, [mozjs-78])
> ++
> ++  AC_SUBST(LIBJS_CFLAGS)
> ++  AC_SUBST(LIBJS_CXXFLAGS)
> ++  AC_SUBST(LIBJS_LIBS)
> ++])
> ++AM_CONDITIONAL(USE_DUKTAPE, [test x$with_duktape =3D=3D xyes], [Using
> duktape as javascript engine library])
> +
> + EXPAT_LIB=3D""
> + AC_ARG_WITH(expat, [  --with-expat=3D<dir>      Use expat from here],
> +@@ -100,6 +111,12 @@
> AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS=3D"-lexpat"],
> +            [AC_MSG_ERROR([Can't find expat library. Please install
> expat.])])
> + AC_SUBST(EXPAT_LIBS)
> +
> ++AX_PTHREAD([], [AC_MSG_ERROR([Cannot find the way to enable pthread
> support.])])
> ++LIBS=3D"$PTHREAD_LIBS $LIBS"
> ++CFLAGS=3D"$CFLAGS $PTHREAD_CFLAGS"
> ++CC=3D"$PTHREAD_CC"
> ++AC_CHECK_FUNCS([pthread_condattr_setclock])
> ++
> + AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)
> +
> + if test "x$GCC" =3D "xyes"; then
> +@@ -581,6 +598,13 @@ echo "
> +         PAM support:                ${have_pam}
> +         systemdsystemunitdir:       ${systemdsystemunitdir}
> +         polkitd user:               ${POLKITD_USER}"
> ++if test "x${with_duktape}" =3D xyes; then
> ++echo "
> ++        Javascript engine:          Duktape"
> ++else
> ++echo "
> ++        Javascript engine:          Mozjs"
> ++fi
> +
> + if test "$have_pam" =3D yes ; then
> + echo "
> +diff --git a/docs/man/polkit.xml b/docs/man/polkit.xml
> +index 99aa474..90715a5 100644
> +--- a/docs/man/polkit.xml
> ++++ b/docs/man/polkit.xml
> +@@ -639,7 +639,9 @@ polkit.Result =3D {
> +         If user-provided code takes a long time to execute, an exceptio=
n
> +         will be thrown which normally results in the function being
> +         terminated (the current limit is 15 seconds). This is used to
> +-        catch runaway scripts.
> ++        catch runaway scripts. If the duktape JavaScript backend is
> ++        compiled in, instead of mozjs, no exception will be thrown=E2=
=80=94the
> ++        script will be killed right away (same timeout).
> +       </para>
> +
> +       <para>
> +diff --git a/meson.build b/meson.build
> +index b3702be..7506231 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -126,7 +126,18 @@ expat_dep =3D dependency('expat')
> + assert(cc.has_header('expat.h', dependencies: expat_dep), 'Can\'t find
> expat.h. Please install expat.')
> + assert(cc.has_function('XML_ParserCreate', dependencies: expat_dep),
> 'Can\'t find expat library. Please install expat.')
> +
> +-mozjs_dep =3D dependency('mozjs-78')
> ++duktape_req_version =3D '>=3D 2.2.0'
> ++
> ++js_engine =3D get_option('js_engine')
> ++if js_engine =3D=3D 'duktape'
> ++  js_dep =3D dependency('duktape', version: duktape_req_version)
> ++  libm_dep =3D cc.find_library('m')
> ++  thread_dep =3D dependency('threads')
> ++  func =3D 'pthread_condattr_setclock'
> ++  config_h.set('HAVE_' + func.to_upper(), cc.has_function(func, prefix =
:
> '#include <pthread.h>'))
> ++elif js_engine =3D=3D 'mozjs'
> ++  js_dep =3D dependency('mozjs-78')
> ++endif
> +
> + dbus_dep =3D dependency('dbus-1')
> + dbus_confdir =3D dbus_dep.get_pkgconfig_variable('datadir',
> define_variable: ['datadir', pk_prefix / pk_datadir])   #changed from
> sysconfdir with respect to commit#8eada3836465838
> +@@ -350,6 +361,9 @@ if enable_logind
> +   output +=3D '        systemdsystemunitdir:     ' +
> systemd_systemdsystemunitdir + '\n'
> + endif
> + output +=3D '        polkitd user:             ' + polkitd_user + ' \n'
> ++output +=3D '        Javascript engine:        ' + js_engine + '\n'
> ++if enable_logind
> ++endif
> + output +=3D '        PAM support:              ' + enable_pam.to_string=
()
> + '\n\n'
> + if enable_pam
> +   output +=3D '        PAM file auth:            ' +
> pam_conf['PAM_FILE_INCLUDE_AUTH'] + '\n'
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 25e3e77..76aa311 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -16,3 +16,4 @@ option('introspection', type: 'boolean', value: true,
> description: 'Enable intro
> +
> + option('gtk_doc', type: 'boolean', value: false, description: 'use
> gtk-doc to build documentation')
> + option('man', type: 'boolean', value: false, description: 'build manual
> pages')
> ++option('js_engine', type: 'combo', choices: ['mozjs', 'duktape'], value=
:
> 'duktape', description: 'javascript engine')
> +diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.=
am
> +index 7e3c080..935fb98 100644
> +--- a/src/polkitbackend/Makefile.am
> ++++ b/src/polkitbackend/Makefile.am
> +@@ -17,6 +17,8 @@ AM_CPPFLAGS =3D
>          \
> +         -DPACKAGE_LIB_DIR=3D\""$(libdir)"\"                       \
> +         -D_POSIX_PTHREAD_SEMANTICS                              \
> +         -D_REENTRANT                                            \
> ++        -D_XOPEN_SOURCE=3D700                                     \
> ++        -D_GNU_SOURCE=3D1                                         \
> +         $(NULL)
> +
> + noinst_LTLIBRARIES=3Dlibpolkit-backend-1.la
> +@@ -31,9 +33,10 @@ libpolkit_backend_1_la_SOURCES =3D
>                               \
> +         polkitbackend.h
>                      \
> +       polkitbackendtypes.h
>               \
> +       polkitbackendprivate.h
>               \
> ++      polkitbackendcommon.h                   polkitbackendcommon.c
>              \
> +       polkitbackendauthority.h                polkitbackendauthority.c
>               \
> +       polkitbackendinteractiveauthority.h
>  polkitbackendinteractiveauthority.c     \
> +-      polkitbackendjsauthority.h
> polkitbackendjsauthority.cpp            \
> ++      polkitbackendjsauthority.h                              \
> +       polkitbackendactionpool.h               polkitbackendactionpool.c
>              \
> +       polkitbackendactionlookup.h
>  polkitbackendactionlookup.c             \
> +         $(NULL)
> +@@ -51,19 +54,27 @@ libpolkit_backend_1_la_CFLAGS =3D
>                       \
> +         -D_POLKIT_BACKEND_COMPILATION
>      \
> +         $(GLIB_CFLAGS)
>       \
> +       $(LIBSYSTEMD_CFLAGS)                                            \
> +-      $(LIBJS_CFLAGS)                                                 \
> ++      $(LIBJS_CFLAGS)                                         \
> +         $(NULL)
> +
> + libpolkit_backend_1_la_CXXFLAGS =3D $(libpolkit_backend_1_la_CFLAGS)
> +
> + libpolkit_backend_1_la_LIBADD =3D
>      \
> +         $(GLIB_LIBS)                                                  \
> ++        $(DUKTAPE_LIBS)
>      \
> +       $(LIBSYSTEMD_LIBS)                                              \
> +       $(top_builddir)/src/polkit/libpolkit-gobject-1.la               \
> +       $(EXPAT_LIBS)                                                   \
> +-      $(LIBJS_LIBS)                                                   \
> ++      $(LIBJS_LIBS)                                                   \
> +         $(NULL)
> +
> ++if USE_DUKTAPE
> ++libpolkit_backend_1_la_SOURCES +=3D polkitbackendduktapeauthority.c
> ++libpolkit_backend_1_la_LIBADD +=3D -lm
> ++else
> ++libpolkit_backend_1_la_SOURCES +=3D polkitbackendjsauthority.cpp
> ++endif
> ++
> + rulesdir =3D $(sysconfdir)/polkit-1/rules.d
> + rules_DATA =3D 50-default.rules
> +
> +diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.bui=
ld
> +index 93c3c34..99f8e33 100644
> +--- a/src/polkitbackend/meson.build
> ++++ b/src/polkitbackend/meson.build
> +@@ -4,8 +4,8 @@ sources =3D files(
> +   'polkitbackendactionlookup.c',
> +   'polkitbackendactionpool.c',
> +   'polkitbackendauthority.c',
> ++  'polkitbackendcommon.c',
> +   'polkitbackendinteractiveauthority.c',
> +-  'polkitbackendjsauthority.cpp',
> + )
> +
> + output =3D 'initjs.h'
> +@@ -21,7 +21,7 @@ sources +=3D custom_target(
> + deps =3D [
> +   expat_dep,
> +   libpolkit_gobject_dep,
> +-  mozjs_dep,
> ++  js_dep,
> + ]
> +
> + c_flags =3D [
> +@@ -29,8 +29,18 @@ c_flags =3D [
> +   '-D_POLKIT_BACKEND_COMPILATION',
> +   '-DPACKAGE_DATA_DIR=3D"@0@"'.format(pk_prefix / pk_datadir),
> +   '-DPACKAGE_SYSCONF_DIR=3D"@0@"'.format(pk_prefix / pk_sysconfdir),
> ++  '-D_XOPEN_SOURCE=3D700',
> ++  '-D_GNU_SOURCE=3D1',
> + ]
> +
> ++if js_engine =3D=3D 'duktape'
> ++  sources +=3D files('polkitbackendduktapeauthority.c')
> ++  deps +=3D libm_dep
> ++  deps +=3D thread_dep
> ++elif js_engine =3D=3D 'mozjs'
> ++  sources +=3D files('polkitbackendjsauthority.cpp')
> ++endif
> ++
> + if enable_logind
> +   sources +=3D files('polkitbackendsessionmonitor-systemd.c')
> +
> +diff --git a/src/polkitbackend/polkitbackendcommon.c
> b/src/polkitbackend/polkitbackendcommon.c
> +new file mode 100644
> +index 0000000..6783dff
> +--- /dev/null
> ++++ b/src/polkitbackend/polkitbackendcommon.c
> +@@ -0,0 +1,530 @@
> ++/*
> ++ * Copyright (C) 2008 Red Hat, Inc.
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General
> ++ * Public License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ *
> ++ * Author: David Zeuthen <davidz@redhat.com>
> ++ */
> ++
> ++#include "polkitbackendcommon.h"
> ++
> ++static void
> ++utils_child_watch_from_release_cb (GPid     pid,
> ++                                   gint     status,
> ++                                   gpointer user_data)
> ++{
> ++}
> ++
> ++static void
> ++utils_spawn_data_free (UtilsSpawnData *data)
> ++{
> ++  if (data->timeout_source !=3D NULL)
> ++    {
> ++      g_source_destroy (data->timeout_source);
> ++      data->timeout_source =3D NULL;
> ++    }
> ++
> ++  /* Nuke the child, if necessary */
> ++  if (data->child_watch_source !=3D NULL)
> ++    {
> ++      g_source_destroy (data->child_watch_source);
> ++      data->child_watch_source =3D NULL;
> ++    }
> ++
> ++  if (data->child_pid !=3D 0)
> ++    {
> ++      GSource *source;
> ++      kill (data->child_pid, SIGTERM);
> ++      /* OK, we need to reap for the child ourselves - we don't want
> ++       * to use waitpid() because that might block the calling
> ++       * thread (the child might handle SIGTERM and use several
> ++       * seconds for cleanup/rollback).
> ++       *
> ++       * So we use GChildWatch instead.
> ++       *
> ++       * Avoid taking a references to ourselves. but note that we need
> ++       * to pass the GSource so we can nuke it once handled.
> ++       */
> ++      source =3D g_child_watch_source_new (data->child_pid);
> ++      g_source_set_callback (source,
> ++                             (GSourceFunc)
> utils_child_watch_from_release_cb,
> ++                             source,
> ++                             (GDestroyNotify) g_source_destroy);
> ++      g_source_attach (source, data->main_context);
> ++      g_source_unref (source);
> ++      data->child_pid =3D 0;
> ++    }
> ++
> ++  if (data->child_stdout !=3D NULL)
> ++    {
> ++      g_string_free (data->child_stdout, TRUE);
> ++      data->child_stdout =3D NULL;
> ++    }
> ++
> ++  if (data->child_stderr !=3D NULL)
> ++    {
> ++      g_string_free (data->child_stderr, TRUE);
> ++      data->child_stderr =3D NULL;
> ++    }
> ++
> ++  if (data->child_stdout_channel !=3D NULL)
> ++    {
> ++      g_io_channel_unref (data->child_stdout_channel);
> ++      data->child_stdout_channel =3D NULL;
> ++    }
> ++  if (data->child_stderr_channel !=3D NULL)
> ++    {
> ++      g_io_channel_unref (data->child_stderr_channel);
> ++      data->child_stderr_channel =3D NULL;
> ++    }
> ++
> ++  if (data->child_stdout_source !=3D NULL)
> ++    {
> ++      g_source_destroy (data->child_stdout_source);
> ++      data->child_stdout_source =3D NULL;
> ++    }
> ++  if (data->child_stderr_source !=3D NULL)
> ++    {
> ++      g_source_destroy (data->child_stderr_source);
> ++      data->child_stderr_source =3D NULL;
> ++    }
> ++
> ++  if (data->child_stdout_fd !=3D -1)
> ++    {
> ++      g_warn_if_fail (close (data->child_stdout_fd) =3D=3D 0);
> ++      data->child_stdout_fd =3D -1;
> ++    }
> ++  if (data->child_stderr_fd !=3D -1)
> ++    {
> ++      g_warn_if_fail (close (data->child_stderr_fd) =3D=3D 0);
> ++      data->child_stderr_fd =3D -1;
> ++    }
> ++
> ++  if (data->cancellable_handler_id > 0)
> ++    {
> ++      g_cancellable_disconnect (data->cancellable,
> data->cancellable_handler_id);
> ++      data->cancellable_handler_id =3D 0;
> ++    }
> ++
> ++  if (data->main_context !=3D NULL)
> ++    g_main_context_unref (data->main_context);
> ++
> ++  if (data->cancellable !=3D NULL)
> ++    g_object_unref (data->cancellable);
> ++
> ++  g_slice_free (UtilsSpawnData, data);
> ++}
> ++
> ++/* called in the thread where @cancellable was cancelled */
> ++static void
> ++utils_on_cancelled (GCancellable *cancellable,
> ++                    gpointer      user_data)
> ++{
> ++  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> ++  GError *error;
> ++
> ++  error =3D NULL;
> ++  g_warn_if_fail (g_cancellable_set_error_if_cancelled (cancellable,
> &error));
> ++  g_simple_async_result_take_error (data->simple, error);
> ++  g_simple_async_result_complete_in_idle (data->simple);
> ++  g_object_unref (data->simple);
> ++}
> ++
> ++static gboolean
> ++utils_timeout_cb (gpointer user_data)
> ++{
> ++  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> ++
> ++  data->timed_out =3D TRUE;
> ++
> ++  /* ok, timeout is history, make sure we don't free it in
> spawn_data_free() */
> ++  data->timeout_source =3D NULL;
> ++
> ++  /* we're done */
> ++  g_simple_async_result_complete_in_idle (data->simple);
> ++  g_object_unref (data->simple);
> ++
> ++  return FALSE; /* remove source */
> ++}
> ++
> ++static void
> ++utils_child_watch_cb (GPid     pid,
> ++                      gint     status,
> ++                      gpointer user_data)
> ++{
> ++  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> ++  gchar *buf;
> ++  gsize buf_size;
> ++
> ++  if (g_io_channel_read_to_end (data->child_stdout_channel, &buf,
> &buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)
> ++    {
> ++      g_string_append_len (data->child_stdout, buf, buf_size);
> ++      g_free (buf);
> ++    }
> ++  if (g_io_channel_read_to_end (data->child_stderr_channel, &buf,
> &buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)
> ++    {
> ++      g_string_append_len (data->child_stderr, buf, buf_size);
> ++      g_free (buf);
> ++    }
> ++
> ++  data->exit_status =3D status;
> ++
> ++  /* ok, child watch is history, make sure we don't free it in
> spawn_data_free() */
> ++  data->child_pid =3D 0;
> ++  data->child_watch_source =3D NULL;
> ++
> ++  /* we're done */
> ++  g_simple_async_result_complete_in_idle (data->simple);
> ++  g_object_unref (data->simple);
> ++}
> ++
> ++static gboolean
> ++utils_read_child_stderr (GIOChannel *channel,
> ++                         GIOCondition condition,
> ++                         gpointer user_data)
> ++{
> ++  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> ++  gchar buf[1024];
> ++  gsize bytes_read;
> ++
> ++  g_io_channel_read_chars (channel, buf, sizeof buf, &bytes_read, NULL)=
;
> ++  g_string_append_len (data->child_stderr, buf, bytes_read);
> ++  return TRUE;
> ++}
> ++
> ++static gboolean
> ++utils_read_child_stdout (GIOChannel *channel,
> ++                         GIOCondition condition,
> ++                         gpointer user_data)
> ++{
> ++  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> ++  gchar buf[1024];
> ++  gsize bytes_read;
> ++
> ++  g_io_channel_read_chars (channel, buf, sizeof buf, &bytes_read, NULL)=
;
> ++  g_string_append_len (data->child_stdout, buf, bytes_read);
> ++  return TRUE;
> ++}
> ++
> ++void
> ++polkit_backend_common_spawn (const gchar *const  *argv,
> ++                             guint                timeout_seconds,
> ++                             GCancellable        *cancellable,
> ++                             GAsyncReadyCallback  callback,
> ++                             gpointer             user_data)
> ++{
> ++  UtilsSpawnData *data;
> ++  GError *error;
> ++
> ++  data =3D g_slice_new0 (UtilsSpawnData);
> ++  data->timeout_seconds =3D timeout_seconds;
> ++  data->simple =3D g_simple_async_result_new (NULL,
> ++                                            callback,
> ++                                            user_data,
> ++
> (gpointer*)polkit_backend_common_spawn);
> ++  data->main_context =3D g_main_context_get_thread_default ();
> ++  if (data->main_context !=3D NULL)
> ++    g_main_context_ref (data->main_context);
> ++
> ++  data->cancellable =3D cancellable !=3D NULL ? (GCancellable*)g_object=
_ref
> (cancellable) : NULL;
> ++
> ++  data->child_stdout =3D g_string_new (NULL);
> ++  data->child_stderr =3D g_string_new (NULL);
> ++  data->child_stdout_fd =3D -1;
> ++  data->child_stderr_fd =3D -1;
> ++
> ++  /* the life-cycle of UtilsSpawnData is tied to its GSimpleAsyncResult
> */
> ++  g_simple_async_result_set_op_res_gpointer (data->simple, data,
> (GDestroyNotify) utils_spawn_data_free);
> ++
> ++  error =3D NULL;
> ++  if (data->cancellable !=3D NULL)
> ++    {
> ++      /* could already be cancelled */
> ++      error =3D NULL;
> ++      if (g_cancellable_set_error_if_cancelled (data->cancellable,
> &error))
> ++        {
> ++          g_simple_async_result_take_error (data->simple, error);
> ++          g_simple_async_result_complete_in_idle (data->simple);
> ++          g_object_unref (data->simple);
> ++          goto out;
> ++        }
> ++
> ++      data->cancellable_handler_id =3D g_cancellable_connect
> (data->cancellable,
> ++                                                            G_CALLBACK
> (utils_on_cancelled),
> ++                                                            data,
> ++                                                            NULL);
> ++    }
> ++
> ++  error =3D NULL;
> ++  if (!g_spawn_async_with_pipes (NULL, /* working directory */
> ++                                 (gchar **) argv,
> ++                                 NULL, /* envp */
> ++                                 G_SPAWN_SEARCH_PATH |
> G_SPAWN_DO_NOT_REAP_CHILD,
> ++                                 NULL, /* child_setup */
> ++                                 NULL, /* child_setup's user_data */
> ++                                 &(data->child_pid),
> ++                                 NULL, /* gint *stdin_fd */
> ++                                 &(data->child_stdout_fd),
> ++                                 &(data->child_stderr_fd),
> ++                                 &error))
> ++    {
> ++      g_prefix_error (&error, "Error spawning: ");
> ++      g_simple_async_result_take_error (data->simple, error);
> ++      g_simple_async_result_complete_in_idle (data->simple);
> ++      g_object_unref (data->simple);
> ++      goto out;
> ++    }
> ++
> ++  if (timeout_seconds > 0)
> ++    {
> ++      data->timeout_source =3D g_timeout_source_new_seconds
> (timeout_seconds);
> ++      g_source_set_priority (data->timeout_source, G_PRIORITY_DEFAULT);
> ++      g_source_set_callback (data->timeout_source, utils_timeout_cb,
> data, NULL);
> ++      g_source_attach (data->timeout_source, data->main_context);
> ++      g_source_unref (data->timeout_source);
> ++    }
> ++
> ++  data->child_watch_source =3D g_child_watch_source_new (data->child_pi=
d);
> ++  g_source_set_callback (data->child_watch_source, (GSourceFunc)
> utils_child_watch_cb, data, NULL);
> ++  g_source_attach (data->child_watch_source, data->main_context);
> ++  g_source_unref (data->child_watch_source);
> ++
> ++  data->child_stdout_channel =3D g_io_channel_unix_new
> (data->child_stdout_fd);
> ++  g_io_channel_set_flags (data->child_stdout_channel,
> G_IO_FLAG_NONBLOCK, NULL);
> ++  data->child_stdout_source =3D g_io_create_watch
> (data->child_stdout_channel, G_IO_IN);
> ++  g_source_set_callback (data->child_stdout_source, (GSourceFunc)
> utils_read_child_stdout, data, NULL);
> ++  g_source_attach (data->child_stdout_source, data->main_context);
> ++  g_source_unref (data->child_stdout_source);
> ++
> ++  data->child_stderr_channel =3D g_io_channel_unix_new
> (data->child_stderr_fd);
> ++  g_io_channel_set_flags (data->child_stderr_channel,
> G_IO_FLAG_NONBLOCK, NULL);
> ++  data->child_stderr_source =3D g_io_create_watch
> (data->child_stderr_channel, G_IO_IN);
> ++  g_source_set_callback (data->child_stderr_source, (GSourceFunc)
> utils_read_child_stderr, data, NULL);
> ++  g_source_attach (data->child_stderr_source, data->main_context);
> ++  g_source_unref (data->child_stderr_source);
> ++
> ++ out:
> ++  ;
> ++}
> ++
> ++void
> ++polkit_backend_common_on_dir_monitor_changed (GFileMonitor     *monitor=
,
> ++                                              GFile            *file,
> ++                                              GFile
> *other_file,
> ++                                              GFileMonitorEvent
> event_type,
> ++                                              gpointer
> user_data)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (user_data);
> ++
> ++  /* TODO: maybe rate-limit so storms of events are collapsed into one
> with a 500ms resolution?
> ++   *       Because when editing a file with emacs we get 4-8 events..
> ++   */
> ++
> ++  if (file !=3D NULL)
> ++    {
> ++      gchar *name;
> ++
> ++      name =3D g_file_get_basename (file);
> ++
> ++      /* g_print ("event_type=3D%d file=3D%p name=3D%s\n", event_type, =
file,
> name); */
> ++      if (!g_str_has_prefix (name, ".") &&
> ++          !g_str_has_prefix (name, "#") &&
> ++          g_str_has_suffix (name, ".rules") &&
> ++          (event_type =3D=3D G_FILE_MONITOR_EVENT_CREATED ||
> ++           event_type =3D=3D G_FILE_MONITOR_EVENT_DELETED ||
> ++           event_type =3D=3D G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT))
> ++        {
> ++          polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (authority),
> ++                                        "Reloading rules");
> ++          polkit_backend_common_reload_scripts (authority);
> ++        }
> ++      g_free (name);
> ++    }
> ++}
> ++
> ++gboolean
> ++polkit_backend_common_spawn_finish (GAsyncResult   *res,
> ++                                    gint           *out_exit_status,
> ++                                    gchar         **out_standard_output=
,
> ++                                    gchar         **out_standard_error,
> ++                                    GError        **error)
> ++{
> ++  GSimpleAsyncResult *simple =3D G_SIMPLE_ASYNC_RESULT (res);
> ++  UtilsSpawnData *data;
> ++  gboolean ret =3D FALSE;
> ++
> ++  g_return_val_if_fail (G_IS_ASYNC_RESULT (res), FALSE);
> ++  g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, FALSE)=
;
> ++
> ++  g_warn_if_fail (g_simple_async_result_get_source_tag (simple) =3D=3D
> polkit_backend_common_spawn);
> ++
> ++  if (g_simple_async_result_propagate_error (simple, error))
> ++    goto out;
> ++
> ++  data =3D (UtilsSpawnData*)g_simple_async_result_get_op_res_gpointer
> (simple);
> ++
> ++  if (data->timed_out)
> ++    {
> ++      g_set_error (error,
> ++                   G_IO_ERROR,
> ++                   G_IO_ERROR_TIMED_OUT,
> ++                   "Timed out after %d seconds",
> ++                   data->timeout_seconds);
> ++      goto out;
> ++    }
> ++
> ++  if (out_exit_status !=3D NULL)
> ++    *out_exit_status =3D data->exit_status;
> ++
> ++  if (out_standard_output !=3D NULL)
> ++    *out_standard_output =3D g_strdup (data->child_stdout->str);
> ++
> ++  if (out_standard_error !=3D NULL)
> ++    *out_standard_error =3D g_strdup (data->child_stderr->str);
> ++
> ++  ret =3D TRUE;
> ++
> ++ out:
> ++  return ret;
> ++}
> ++
> ++static const gchar *
> ++polkit_backend_js_authority_get_name (PolkitBackendAuthority *authority=
)
> ++{
> ++  return "js";
> ++}
> ++
> ++static const gchar *
> ++polkit_backend_js_authority_get_version (PolkitBackendAuthority
> *authority)
> ++{
> ++  return PACKAGE_VERSION;
> ++}
> ++
> ++static PolkitAuthorityFeatures
> ++polkit_backend_js_authority_get_features (PolkitBackendAuthority
> *authority)
> ++{
> ++  return POLKIT_AUTHORITY_FEATURES_TEMPORARY_AUTHORIZATION;
> ++}
> ++
> ++void
> ++polkit_backend_common_js_authority_class_init_common
> (PolkitBackendJsAuthorityClass *klass)
> ++{
> ++  GObjectClass *gobject_class;
> ++  PolkitBackendAuthorityClass *authority_class;
> ++  PolkitBackendInteractiveAuthorityClass *interactive_authority_class;
> ++
> ++  gobject_class =3D G_OBJECT_CLASS (klass);
> ++  gobject_class->finalize                               =3D
> polkit_backend_common_js_authority_finalize;
> ++  gobject_class->set_property                           =3D
> polkit_backend_common_js_authority_set_property;
> ++  gobject_class->constructed                            =3D
> polkit_backend_common_js_authority_constructed;
> ++
> ++  authority_class =3D POLKIT_BACKEND_AUTHORITY_CLASS (klass);
> ++  authority_class->get_name                             =3D
> polkit_backend_js_authority_get_name;
> ++  authority_class->get_version                          =3D
> polkit_backend_js_authority_get_version;
> ++  authority_class->get_features                         =3D
> polkit_backend_js_authority_get_features;
> ++
> ++  interactive_authority_class =3D
> POLKIT_BACKEND_INTERACTIVE_AUTHORITY_CLASS (klass);
> ++  interactive_authority_class->get_admin_identities     =3D
> polkit_backend_common_js_authority_get_admin_auth_identities;
> ++  interactive_authority_class->check_authorization_sync =3D
> polkit_backend_common_js_authority_check_authorization_sync;
> ++
> ++  g_object_class_install_property (gobject_class,
> ++                                   PROP_RULES_DIRS,
> ++                                   g_param_spec_boxed ("rules-dirs",
> ++                                                       NULL,
> ++                                                       NULL,
> ++                                                       G_TYPE_STRV,
> ++
>  G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE));
> ++}
> ++
> ++gint
> ++polkit_backend_common_rules_file_name_cmp (const gchar *a,
> ++                                           const gchar *b)
> ++{
> ++  gint ret;
> ++  const gchar *a_base;
> ++  const gchar *b_base;
> ++
> ++  a_base =3D strrchr (a, '/');
> ++  b_base =3D strrchr (b, '/');
> ++
> ++  g_assert (a_base !=3D NULL);
> ++  g_assert (b_base !=3D NULL);
> ++  a_base +=3D 1;
> ++  b_base +=3D 1;
> ++
> ++  ret =3D g_strcmp0 (a_base, b_base);
> ++  if (ret =3D=3D 0)
> ++    {
> ++      /* /etc wins over /usr */
> ++      ret =3D g_strcmp0 (a, b);
> ++      g_assert (ret !=3D 0);
> ++    }
> ++
> ++  return ret;
> ++}
> ++
> ++const gchar *
> ++polkit_backend_common_get_signal_name (gint signal_number)
> ++{
> ++  switch (signal_number)
> ++    {
> ++#define _HANDLE_SIG(sig) case sig: return #sig;
> ++    _HANDLE_SIG (SIGHUP);
> ++    _HANDLE_SIG (SIGINT);
> ++    _HANDLE_SIG (SIGQUIT);
> ++    _HANDLE_SIG (SIGILL);
> ++    _HANDLE_SIG (SIGABRT);
> ++    _HANDLE_SIG (SIGFPE);
> ++    _HANDLE_SIG (SIGKILL);
> ++    _HANDLE_SIG (SIGSEGV);
> ++    _HANDLE_SIG (SIGPIPE);
> ++    _HANDLE_SIG (SIGALRM);
> ++    _HANDLE_SIG (SIGTERM);
> ++    _HANDLE_SIG (SIGUSR1);
> ++    _HANDLE_SIG (SIGUSR2);
> ++    _HANDLE_SIG (SIGCHLD);
> ++    _HANDLE_SIG (SIGCONT);
> ++    _HANDLE_SIG (SIGSTOP);
> ++    _HANDLE_SIG (SIGTSTP);
> ++    _HANDLE_SIG (SIGTTIN);
> ++    _HANDLE_SIG (SIGTTOU);
> ++    _HANDLE_SIG (SIGBUS);
> ++#ifdef SIGPOLL
> ++    _HANDLE_SIG (SIGPOLL);
> ++#endif
> ++    _HANDLE_SIG (SIGPROF);
> ++    _HANDLE_SIG (SIGSYS);
> ++    _HANDLE_SIG (SIGTRAP);
> ++    _HANDLE_SIG (SIGURG);
> ++    _HANDLE_SIG (SIGVTALRM);
> ++    _HANDLE_SIG (SIGXCPU);
> ++    _HANDLE_SIG (SIGXFSZ);
> ++#undef _HANDLE_SIG
> ++    default:
> ++      break;
> ++    }
> ++  return "UNKNOWN_SIGNAL";
> ++}
> ++
> ++void
> ++polkit_backend_common_spawn_cb (GObject       *source_object,
> ++                                GAsyncResult  *res,
> ++                                gpointer       user_data)
> ++{
> ++  SpawnData *data =3D (SpawnData *)user_data;
> ++  data->res =3D (GAsyncResult*)g_object_ref (res);
> ++  g_main_loop_quit (data->loop);
> ++}
> +diff --git a/src/polkitbackend/polkitbackendcommon.h
> b/src/polkitbackend/polkitbackendcommon.h
> +new file mode 100644
> +index 0000000..dd700fc
> +--- /dev/null
> ++++ b/src/polkitbackend/polkitbackendcommon.h
> +@@ -0,0 +1,158 @@
> ++/*
> ++ * Copyright (C) 2008 Red Hat, Inc.
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General
> ++ * Public License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ *
> ++ * Author: David Zeuthen <davidz@redhat.com>
> ++ */
> ++
> ++#if !defined (_POLKIT_BACKEND_COMPILATION) &&
> !defined(_POLKIT_BACKEND_INSIDE_POLKIT_BACKEND_H)
> ++#error "Only <polkitbackend/polkitbackend.h> can be included directly,
> this file may disappear or change contents."
> ++#endif
> ++
> ++#ifndef __POLKIT_BACKEND_COMMON_H
> ++#define __POLKIT_BACKEND_COMMON_H
> ++
> ++#include "config.h"
> ++#include <sys/wait.h>
> ++#include <errno.h>
> ++#include <pwd.h>
> ++#include <grp.h>
> ++#ifdef HAVE_NETGROUP_H
> ++#include <netgroup.h>
> ++#else
> ++#include <netdb.h>
> ++#endif
> ++#include <string.h>
> ++#include <glib/gstdio.h>
> ++#include <locale.h>
> ++#include <glib/gi18n-lib.h> //here, all things glib via glib.h
> (including -> gspawn.h)
> ++
> ++#include <polkit/polkit.h>
> ++#include "polkitbackendjsauthority.h"
> ++
> ++#include <polkit/polkitprivate.h>
> ++
> ++#ifdef HAVE_LIBSYSTEMD
> ++#include <systemd/sd-login.h>
> ++#endif /* HAVE_LIBSYSTEMD */
> ++
> ++#define RUNAWAY_KILLER_TIMEOUT (15)
> ++
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> ++
> ++enum
> ++{
> ++  PROP_0,
> ++  PROP_RULES_DIRS,
> ++};
> ++
> ++typedef struct
> ++{
> ++  GSimpleAsyncResult *simple; /* borrowed reference */
> ++  GMainContext *main_context; /* may be NULL */
> ++
> ++  GCancellable *cancellable;  /* may be NULL */
> ++  gulong cancellable_handler_id;
> ++
> ++  GPid child_pid;
> ++  gint child_stdout_fd;
> ++  gint child_stderr_fd;
> ++
> ++  GIOChannel *child_stdout_channel;
> ++  GIOChannel *child_stderr_channel;
> ++
> ++  GSource *child_watch_source;
> ++  GSource *child_stdout_source;
> ++  GSource *child_stderr_source;
> ++
> ++  guint timeout_seconds;
> ++  gboolean timed_out;
> ++  GSource *timeout_source;
> ++
> ++  GString *child_stdout;
> ++  GString *child_stderr;
> ++
> ++  gint exit_status;
> ++} UtilsSpawnData;
> ++
> ++typedef struct
> ++{
> ++  GMainLoop *loop;
> ++  GAsyncResult *res;
> ++} SpawnData;
> ++
> ++void polkit_backend_common_spawn (const gchar *const  *argv,
> ++                                  guint                timeout_seconds,
> ++                                  GCancellable        *cancellable,
> ++                                  GAsyncReadyCallback  callback,
> ++                                  gpointer             user_data);
> ++void polkit_backend_common_spawn_cb (GObject       *source_object,
> ++                                     GAsyncResult  *res,
> ++                                     gpointer       user_data);
> ++gboolean polkit_backend_common_spawn_finish (GAsyncResult   *res,
> ++                                             gint
>  *out_exit_status,
> ++                                             gchar
>  **out_standard_output,
> ++                                             gchar
>  **out_standard_error,
> ++                                             GError        **error);
> ++
> ++void polkit_backend_common_on_dir_monitor_changed (GFileMonitor
>  *monitor,
> ++                                                   GFile
> *file,
> ++                                                   GFile
> *other_file,
> ++                                                   GFileMonitorEvent
> event_type,
> ++                                                   gpointer
> user_data);
> ++
> ++void polkit_backend_common_js_authority_class_init_common
> (PolkitBackendJsAuthorityClass *klass);
> ++
> ++gint polkit_backend_common_rules_file_name_cmp (const gchar *a,
> ++                                                const gchar *b);
> ++
> ++const gchar *polkit_backend_common_get_signal_name (gint signal_number)=
;
> ++
> ++/* To be provided by each JS backend, from here onwards
> ---------------------------------------------- */
> ++
> ++void polkit_backend_common_reload_scripts (PolkitBackendJsAuthority
> *authority);
> ++void polkit_backend_common_js_authority_finalize (GObject *object);
> ++void polkit_backend_common_js_authority_constructed (GObject *object);
> ++GList *polkit_backend_common_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveAuthority *_authority,
> ++
>  PolkitSubject                     *caller,
> ++
>  PolkitSubject                     *subject,
> ++
>  PolkitIdentity                    *user_for_subject,
> ++
>  gboolean                           subject_is_local,
> ++
>  gboolean                           subject_is_active,
> ++
>  const gchar                       *action_id,
> ++
>  PolkitDetails                     *details);
> ++void polkit_backend_common_js_authority_set_property (GObject
> *object,
> ++                                                      guint
>  property_id,
> ++                                                      const GValue
> *value,
> ++                                                      GParamSpec
>  *pspec);
> ++PolkitImplicitAuthorization
> polkit_backend_common_js_authority_check_authorization_sync
> (PolkitBackendInteractiveAuthority *_authority,
> ++
>                  PolkitSubject                     *caller,
> ++
>                  PolkitSubject                     *subject,
> ++
>                  PolkitIdentity                    *user_for_subject,
> ++
>                  gboolean                           subject_is_local,
> ++
>                  gboolean                           subject_is_active,
> ++
>                  const gchar                       *action_id,
> ++
>                  PolkitDetails                     *details,
> ++
>                  PolkitImplicitAuthorization        implicit);
> ++#ifdef __cplusplus
> ++}
> ++#endif
> ++
> ++#endif /* __POLKIT_BACKEND_COMMON_H */
> ++
> +diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c
> b/src/polkitbackend/polkitbackendduktapeauthority.c
> +new file mode 100644
> +index 0000000..c89dbcf
> +--- /dev/null
> ++++ b/src/polkitbackend/polkitbackendduktapeauthority.c
> +@@ -0,0 +1,1051 @@
> ++/*
> ++ * Copyright (C) 2008-2012 Red Hat, Inc.
> ++ * Copyright (C) 2015 Tangent Space <jstpierre@mecheye.net>
> ++ * Copyright (C) 2019 Wu Xiaotian <yetist@gmail.com>
> ++ *
> ++ * This library is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU Lesser General Public
> ++ * License as published by the Free Software Foundation; either
> ++ * version 2 of the License, or (at your option) any later version.
> ++ *
> ++ * This library is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * Lesser General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General
> ++ * Public License along with this library; if not, write to the
> ++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
> ++ * Boston, MA 02111-1307, USA.
> ++ *
> ++ * Author: David Zeuthen <davidz@redhat.com>
> ++ */
> ++
> ++#include <pthread.h>
> ++
> ++#include "polkitbackendcommon.h"
> ++
> ++#include "duktape.h"
> ++
> ++/* Built source and not too big to worry about deduplication */
> ++#include "initjs.h" /* init.js */
> ++
> ++/**
> ++ * SECTION:polkitbackendjsauthority
> ++ * @title: PolkitBackendJsAuthority
> ++ * @short_description: JS Authority
> ++ * @stability: Unstable
> ++ *
> ++ * An (Duktape-based) implementation of #PolkitBackendAuthority that
> reads and
> ++ * evaluates Javascript files and supports interaction with
> authentication
> ++ * agents (virtue of being based on #PolkitBackendInteractiveAuthority)=
.
> ++ */
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++struct _PolkitBackendJsAuthorityPrivate
> ++{
> ++  gchar **rules_dirs;
> ++  GFileMonitor **dir_monitors; /* NULL-terminated array of GFileMonitor
> instances */
> ++
> ++  duk_context *cx;
> ++
> ++  pthread_t runaway_killer_thread;
> ++};
> ++
> ++enum
> ++{
> ++  RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET,
> ++  RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS,
> ++  RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE,
> ++};
> ++
> ++static gboolean
> execute_script_with_runaway_killer(PolkitBackendJsAuthority *authority,
> ++                                                   const gchar
> *filename);
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++G_DEFINE_TYPE (PolkitBackendJsAuthority, polkit_backend_js_authority,
> POLKIT_BACKEND_TYPE_INTERACTIVE_AUTHORITY);
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static duk_ret_t js_polkit_log (duk_context *cx);
> ++static duk_ret_t js_polkit_spawn (duk_context *cx);
> ++static duk_ret_t js_polkit_user_is_in_netgroup (duk_context *cx);
> ++
> ++static const duk_function_list_entry js_polkit_functions[] =3D
> ++{
> ++  { "log", js_polkit_log, 1 },
> ++  { "spawn", js_polkit_spawn, 1 },
> ++  { "_userIsInNetGroup", js_polkit_user_is_in_netgroup, 2 },
> ++  { NULL, NULL, 0 },
> ++};
> ++
> ++static void report_error (void     *udata,
> ++                          const char *msg)
> ++{
> ++    PolkitBackendJsAuthority *authority =3D udata;
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "fatal Duktape JS backend error: %s",
> ++                                  (msg ? msg : "no message"));
> ++}
> ++
> ++static void
> ++polkit_backend_js_authority_init (PolkitBackendJsAuthority *authority)
> ++{
> ++  authority->priv =3D G_TYPE_INSTANCE_GET_PRIVATE (authority,
> ++
>  POLKIT_BACKEND_TYPE_JS_AUTHORITY,
> ++
>  PolkitBackendJsAuthorityPrivate);
> ++}
> ++
> ++static void
> ++load_scripts (PolkitBackendJsAuthority  *authority)
> ++{
> ++  GList *files =3D NULL;
> ++  GList *l;
> ++  guint num_scripts =3D 0;
> ++  GError *error =3D NULL;
> ++  guint n;
> ++
> ++  files =3D NULL;
> ++
> ++  for (n =3D 0; authority->priv->rules_dirs !=3D NULL &&
> authority->priv->rules_dirs[n] !=3D NULL; n++)
> ++    {
> ++      const gchar *dir_name =3D authority->priv->rules_dirs[n];
> ++      GDir *dir =3D NULL;
> ++
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Loading rules from directory %s",
> ++                                    dir_name);
> ++
> ++      dir =3D g_dir_open (dir_name,
> ++                        0,
> ++                        &error);
> ++      if (dir =3D=3D NULL)
> ++        {
> ++          polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (authority),
> ++                                        "Error opening rules directory:
> %s (%s, %d)",
> ++                                        error->message,
> g_quark_to_string (error->domain), error->code);
> ++          g_clear_error (&error);
> ++        }
> ++      else
> ++        {
> ++          const gchar *name;
> ++          while ((name =3D g_dir_read_name (dir)) !=3D NULL)
> ++            {
> ++              if (g_str_has_suffix (name, ".rules"))
> ++                files =3D g_list_prepend (files, g_strdup_printf ("%s/%=
s",
> dir_name, name));
> ++            }
> ++          g_dir_close (dir);
> ++        }
> ++    }
> ++
> ++  files =3D g_list_sort (files, (GCompareFunc)
> polkit_backend_common_rules_file_name_cmp);
> ++
> ++  for (l =3D files; l !=3D NULL; l =3D l->next)
> ++    {
> ++      const gchar *filename =3D (gchar *)l->data;
> ++
> ++      if (!execute_script_with_runaway_killer(authority, filename))
> ++          continue;
> ++      num_scripts++;
> ++    }
> ++
> ++  polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                "Finished loading, compiling and
> executing %d rules",
> ++                                num_scripts);
> ++  g_list_free_full (files, g_free);
> ++}
> ++
> ++void
> ++polkit_backend_common_reload_scripts (PolkitBackendJsAuthority
> *authority)
> ++{
> ++  duk_context *cx =3D authority->priv->cx;
> ++
> ++  duk_set_top (cx, 0);
> ++  if (!duk_get_global_string (cx, "polkit")) {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error deleting old rules, not
> loading new ones");
> ++      return;
> ++  }
> ++  duk_push_string (cx, "_deleteRules");
> ++
> ++  duk_call_prop (cx, 0, 0);
> ++
> ++  polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                "Collecting garbage unconditionally..."=
);
> ++
> ++  load_scripts (authority);
> ++
> ++  /* Let applications know we have new rules... */
> ++  g_signal_emit_by_name (authority, "changed");
> ++}
> ++
> ++static void
> ++setup_file_monitors (PolkitBackendJsAuthority *authority)
> ++{
> ++  guint n;
> ++  GPtrArray *p;
> ++
> ++  p =3D g_ptr_array_new ();
> ++  for (n =3D 0; authority->priv->rules_dirs !=3D NULL &&
> authority->priv->rules_dirs[n] !=3D NULL; n++)
> ++    {
> ++      GFile *file;
> ++      GError *error;
> ++      GFileMonitor *monitor;
> ++
> ++      file =3D g_file_new_for_path (authority->priv->rules_dirs[n]);
> ++      error =3D NULL;
> ++      monitor =3D g_file_monitor_directory (file,
> ++                                          G_FILE_MONITOR_NONE,
> ++                                          NULL,
> ++                                          &error);
> ++      g_object_unref (file);
> ++      if (monitor =3D=3D NULL)
> ++        {
> ++          g_warning ("Error monitoring directory %s: %s",
> ++                     authority->priv->rules_dirs[n],
> ++                     error->message);
> ++          g_clear_error (&error);
> ++        }
> ++      else
> ++        {
> ++          g_signal_connect (monitor,
> ++                            "changed",
> ++                            G_CALLBACK
> (polkit_backend_common_on_dir_monitor_changed),
> ++                            authority);
> ++          g_ptr_array_add (p, monitor);
> ++        }
> ++    }
> ++  g_ptr_array_add (p, NULL);
> ++  authority->priv->dir_monitors =3D (GFileMonitor**) g_ptr_array_free (=
p,
> FALSE);
> ++}
> ++
> ++void
> ++polkit_backend_common_js_authority_constructed (GObject *object)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> ++  duk_context *cx;
> ++
> ++  cx =3D duk_create_heap (NULL, NULL, NULL, authority, report_error);
> ++  if (cx =3D=3D NULL)
> ++    goto fail;
> ++
> ++  authority->priv->cx =3D cx;
> ++
> ++  duk_push_global_object (cx);
> ++  duk_push_object (cx);
> ++  duk_put_function_list (cx, -1, js_polkit_functions);
> ++  duk_put_prop_string (cx, -2, "polkit");
> ++
> ++  /* load polkit objects/functions into JS context (e.g. addRule(),
> ++   * _deleteRules(), _runRules() et al)
> ++   */
> ++  duk_eval_string (cx, init_js);
> ++
> ++  if (authority->priv->rules_dirs =3D=3D NULL)
> ++    {
> ++      authority->priv->rules_dirs =3D g_new0 (gchar *, 3);
> ++      authority->priv->rules_dirs[0] =3D g_strdup (PACKAGE_SYSCONF_DIR
> "/polkit-1/rules.d");
> ++      authority->priv->rules_dirs[1] =3D g_strdup (PACKAGE_DATA_DIR
> "/polkit-1/rules.d");
> ++    }
> ++
> ++  setup_file_monitors (authority);
> ++  load_scripts (authority);
> ++
> ++  G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->constructe=
d
> (object);
> ++  return;
> ++
> ++ fail:
> ++  g_critical ("Error initializing JavaScript environment");
> ++  g_assert_not_reached ();
> ++}
> ++
> ++void
> ++polkit_backend_common_js_authority_finalize (GObject *object)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> ++  guint n;
> ++
> ++  for (n =3D 0; authority->priv->dir_monitors !=3D NULL &&
> authority->priv->dir_monitors[n] !=3D NULL; n++)
> ++    {
> ++      GFileMonitor *monitor =3D authority->priv->dir_monitors[n];
> ++      g_signal_handlers_disconnect_by_func (monitor,
> ++                                            G_CALLBACK
> (polkit_backend_common_on_dir_monitor_changed),
> ++                                            authority);
> ++      g_object_unref (monitor);
> ++    }
> ++  g_free (authority->priv->dir_monitors);
> ++  g_strfreev (authority->priv->rules_dirs);
> ++
> ++  duk_destroy_heap (authority->priv->cx);
> ++
> ++  G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize
> (object);
> ++}
> ++
> ++void
> ++polkit_backend_common_js_authority_set_property (GObject      *object,
> ++                                                 guint
>  property_id,
> ++                                                 const GValue *value,
> ++                                                 GParamSpec   *pspec)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> ++
> ++  switch (property_id)
> ++    {
> ++      case PROP_RULES_DIRS:
> ++        g_assert (authority->priv->rules_dirs =3D=3D NULL);
> ++        authority->priv->rules_dirs =3D (gchar **) g_value_dup_boxed
> (value);
> ++        break;
> ++
> ++      default:
> ++        G_OBJECT_WARN_INVALID_PROPERTY_ID (object, property_id, pspec);
> ++        break;
> ++    }
> ++}
> ++
> ++static void
> ++polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass
> *klass)
> ++{
> ++  polkit_backend_common_js_authority_class_init_common (klass);
> ++  g_type_class_add_private (klass, sizeof
> (PolkitBackendJsAuthorityPrivate));
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static void
> ++set_property_str (duk_context *cx,
> ++                  const gchar *name,
> ++                  const gchar *value)
> ++{
> ++  duk_push_string (cx, value);
> ++  duk_put_prop_string (cx, -2, name);
> ++}
> ++
> ++static void
> ++set_property_strv (duk_context *cx,
> ++                   const gchar *name,
> ++                   GPtrArray   *value)
> ++{
> ++  guint n;
> ++  duk_push_array (cx);
> ++  for (n =3D 0; n < value->len; n++)
> ++    {
> ++      duk_push_string (cx, g_ptr_array_index (value, n));
> ++      duk_put_prop_index (cx, -2, n);
> ++    }
> ++  duk_put_prop_string (cx, -2, name);
> ++}
> ++
> ++static void
> ++set_property_int32 (duk_context *cx,
> ++                    const gchar *name,
> ++                    gint32       value)
> ++{
> ++  duk_push_int (cx, value);
> ++  duk_put_prop_string (cx, -2, name);
> ++}
> ++
> ++static void
> ++set_property_bool (duk_context *cx,
> ++                   const char  *name,
> ++                   gboolean     value)
> ++{
> ++  duk_push_boolean (cx, value);
> ++  duk_put_prop_string (cx, -2, name);
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static gboolean
> ++push_subject (duk_context               *cx,
> ++              PolkitSubject             *subject,
> ++              PolkitIdentity            *user_for_subject,
> ++              gboolean                   subject_is_local,
> ++              gboolean                   subject_is_active,
> ++              GError                   **error)
> ++{
> ++  gboolean ret =3D FALSE;
> ++  pid_t pid;
> ++  uid_t uid;
> ++  gchar *user_name =3D NULL;
> ++  GPtrArray *groups =3D NULL;
> ++  struct passwd *passwd;
> ++  char *seat_str =3D NULL;
> ++  char *session_str =3D NULL;
> ++
> ++  if (!duk_get_global_string (cx, "Subject")) {
> ++    return FALSE;
> ++  }
> ++
> ++  duk_new (cx, 0);
> ++
> ++  if (POLKIT_IS_UNIX_PROCESS (subject))
> ++    {
> ++      pid =3D polkit_unix_process_get_pid (POLKIT_UNIX_PROCESS (subject=
));
> ++    }
> ++  else if (POLKIT_IS_SYSTEM_BUS_NAME (subject))
> ++    {
> ++      PolkitSubject *process;
> ++      process =3D polkit_system_bus_name_get_process_sync
> (POLKIT_SYSTEM_BUS_NAME (subject), NULL, error);
> ++      if (process =3D=3D NULL)
> ++        goto out;
> ++      pid =3D polkit_unix_process_get_pid (POLKIT_UNIX_PROCESS (process=
));
> ++      g_object_unref (process);
> ++    }
> ++  else
> ++    {
> ++      g_assert_not_reached ();
> ++    }
> ++
> ++#ifdef HAVE_LIBSYSTEMD
> ++  if (sd_pid_get_session (pid, &session_str) =3D=3D 0)
> ++    {
> ++      if (sd_session_get_seat (session_str, &seat_str) =3D=3D 0)
> ++        {
> ++          /* do nothing */
> ++        }
> ++    }
> ++#endif /* HAVE_LIBSYSTEMD */
> ++
> ++  g_assert (POLKIT_IS_UNIX_USER (user_for_subject));
> ++  uid =3D polkit_unix_user_get_uid (POLKIT_UNIX_USER (user_for_subject)=
);
> ++
> ++  groups =3D g_ptr_array_new_with_free_func (g_free);
> ++
> ++  passwd =3D getpwuid (uid);
> ++  if (passwd =3D=3D NULL)
> ++    {
> ++      user_name =3D g_strdup_printf ("%d", (gint) uid);
> ++      g_warning ("Error looking up info for uid %d: %m", (gint) uid);
> ++    }
> ++  else
> ++    {
> ++      gid_t gids[512];
> ++      int num_gids =3D 512;
> ++
> ++      user_name =3D g_strdup (passwd->pw_name);
> ++
> ++      if (getgrouplist (passwd->pw_name,
> ++                        passwd->pw_gid,
> ++                        gids,
> ++                        &num_gids) < 0)
> ++        {
> ++          g_warning ("Error looking up groups for uid %d: %m", (gint)
> uid);
> ++        }
> ++      else
> ++        {
> ++          gint n;
> ++          for (n =3D 0; n < num_gids; n++)
> ++            {
> ++              struct group *group;
> ++              group =3D getgrgid (gids[n]);
> ++              if (group =3D=3D NULL)
> ++                {
> ++                  g_ptr_array_add (groups, g_strdup_printf ("%d", (gint=
)
> gids[n]));
> ++                }
> ++              else
> ++                {
> ++                  g_ptr_array_add (groups, g_strdup (group->gr_name));
> ++                }
> ++            }
> ++        }
> ++    }
> ++
> ++  set_property_int32 (cx, "pid", pid);
> ++  set_property_str (cx, "user", user_name);
> ++  set_property_strv (cx, "groups", groups);
> ++  set_property_str (cx, "seat", seat_str);
> ++  set_property_str (cx, "session", session_str);
> ++  set_property_bool (cx, "local", subject_is_local);
> ++  set_property_bool (cx, "active", subject_is_active);
> ++
> ++  ret =3D TRUE;
> ++
> ++ out:
> ++  free (session_str);
> ++  free (seat_str);
> ++  g_free (user_name);
> ++  if (groups !=3D NULL)
> ++    g_ptr_array_unref (groups);
> ++
> ++  return ret;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static gboolean
> ++push_action_and_details (duk_context               *cx,
> ++                         const gchar               *action_id,
> ++                         PolkitDetails             *details,
> ++                         GError                   **error)
> ++{
> ++  gchar **keys;
> ++  guint n;
> ++
> ++  if (!duk_get_global_string (cx, "Action")) {
> ++    return FALSE;
> ++  }
> ++
> ++  duk_new (cx, 0);
> ++
> ++  set_property_str (cx, "id", action_id);
> ++
> ++  keys =3D polkit_details_get_keys (details);
> ++  for (n =3D 0; keys !=3D NULL && keys[n] !=3D NULL; n++)
> ++    {
> ++      gchar *key;
> ++      const gchar *value;
> ++      key =3D g_strdup_printf ("_detail_%s", keys[n]);
> ++      value =3D polkit_details_lookup (details, keys[n]);
> ++      set_property_str (cx, key, value);
> ++      g_free (key);
> ++    }
> ++  g_strfreev (keys);
> ++
> ++  return TRUE;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++typedef struct {
> ++  PolkitBackendJsAuthority *authority;
> ++  const gchar *filename;
> ++  pthread_cond_t cond;
> ++  pthread_mutex_t mutex;
> ++  gint ret;
> ++} RunawayKillerCtx;
> ++
> ++static gpointer
> ++runaway_killer_thread_execute_js (gpointer user_data)
> ++{
> ++  RunawayKillerCtx *ctx =3D user_data;
> ++  duk_context *cx =3D ctx->authority->priv->cx;
> ++
> ++  int oldtype, pthread_err;
> ++
> ++  if ((pthread_err =3D pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOU=
S,
> &oldtype))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (ctx->authority),
> ++                                  "Error setting thread cancel type: %s=
",
> ++                                  strerror(pthread_err));
> ++    goto err;
> ++  }
> ++
> ++  GFile *file =3D g_file_new_for_path(ctx->filename);
> ++  char *contents;
> ++  gsize len;
> ++
> ++  if (!g_file_load_contents(file, NULL, &contents, &len, NULL, NULL)) {
> ++
> polkit_backend_authority_log(POLKIT_BACKEND_AUTHORITY(ctx->authority),
> ++                                 "Error loading script %s",
> ctx->filename);
> ++    g_object_unref(file);
> ++    goto err;
> ++  }
> ++
> ++  g_object_unref(file);
> ++
> ++  /* evaluate the script, trying to print context in any syntax errors
> ++     found */
> ++  if (duk_peval_lstring(cx, contents, len) !=3D 0)
> ++  {
> ++
> polkit_backend_authority_log(POLKIT_BACKEND_AUTHORITY(ctx->authority),
> ++                                 "Error compiling script %s: %s",
> ctx->filename,
> ++                                 duk_safe_to_string(cx, -1));
> ++    duk_pop(cx);
> ++    goto free_err;
> ++  }
> ++  g_free(contents);
> ++
> ++  ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS;
> ++  goto end;
> ++
> ++free_err:
> ++  g_free(contents);
> ++err:
> ++  ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;
> ++end:
> ++  if ((pthread_err =3D pthread_cond_signal(&ctx->cond))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (ctx->authority),
> ++                                  "Error signaling on condition
> variable: %s",
> ++                                  strerror(pthread_err));
> ++    ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;
> ++  }
> ++  return NULL;
> ++}
> ++
> ++static gpointer
> ++runaway_killer_thread_call_js (gpointer user_data)
> ++{
> ++  RunawayKillerCtx *ctx =3D user_data;
> ++  duk_context *cx =3D ctx->authority->priv->cx;
> ++  int oldtype, pthread_err;
> ++
> ++  if ((pthread_err =3D pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOU=
S,
> &oldtype))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (ctx->authority),
> ++                                  "Error setting thread cancel type: %s=
",
> ++                                  strerror(pthread_err));
> ++    goto err;
> ++  }
> ++
> ++  if (duk_pcall_prop (cx, 0, 2) !=3D DUK_EXEC_SUCCESS)
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (ctx->authority),
> ++                                    "Error evaluating admin rules: ",
> ++                                    duk_safe_to_string (cx, -1));
> ++      goto err;
> ++    }
> ++
> ++  ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS;
> ++  goto end;
> ++
> ++err:
> ++  ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;
> ++end:
> ++  if ((pthread_err =3D pthread_cond_signal(&ctx->cond))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (ctx->authority),
> ++                                  "Error signaling on condition
> variable: %s",
> ++                                  strerror(pthread_err));
> ++    ctx->ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;
> ++  }
> ++  return NULL;
> ++}
> ++
> ++#if defined (HAVE_PTHREAD_CONDATTR_SETCLOCK)
> ++#  if defined(CLOCK_MONOTONIC)
> ++#    define PK_CLOCK CLOCK_MONOTONIC
> ++#  elif defined(CLOCK_BOOTTIME)
> ++#    define PK_CLOCK CLOCK_BOOTTIME
> ++#  else
> ++     /* No suitable clock */
> ++#    undef HAVE_PTHREAD_CONDATTR_SETCLOCK
> ++#    define PK_CLOCK CLOCK_REALTIME
> ++#  endif
> ++#else  /* ! HAVE_PTHREAD_CONDATTR_SETCLOCK */
> ++#  define PK_CLOCK CLOCK_REALTIME
> ++#endif /* ! HAVE_PTHREAD_CONDATTR_SETCLOCK */
> ++
> ++static gboolean
> ++runaway_killer_common(PolkitBackendJsAuthority *authority,
> RunawayKillerCtx *ctx, void *js_context_cb (void *user_data))
> ++{
> ++  int pthread_err;
> ++  gboolean cancel =3D FALSE;
> ++  pthread_condattr_t attr;
> ++  struct timespec abs_time;
> ++
> ++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK
> ++  if ((pthread_err =3D pthread_condattr_init(&attr))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error initializing condition variabl=
e
> attributes: %s",
> ++                                  strerror(pthread_err));
> ++    return FALSE;
> ++  }
> ++  if ((pthread_err =3D pthread_condattr_setclock(&attr, PK_CLOCK))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error setting condition variable
> attributes: %s",
> ++                                  strerror(pthread_err));
> ++    goto err_clean_condattr;
> ++  }
> ++  /* Init again, with needed attr */
> ++  if ((pthread_err =3D pthread_cond_init(&ctx->cond, &attr))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error initializing condition
> variable: %s",
> ++                                  strerror(pthread_err));
> ++    goto err_clean_condattr;
> ++  }
> ++#endif
> ++
> ++  if ((pthread_err =3D pthread_mutex_lock(&ctx->mutex))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error locking mutex: %s",
> ++                                  strerror(pthread_err));
> ++    goto err_clean_cond;
> ++  }
> ++
> ++  if (clock_gettime(PK_CLOCK, &abs_time)) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error getting system's monotonic
> time: %s",
> ++                                  strerror(errno));
> ++    goto err_clean_cond;
> ++  }
> ++  abs_time.tv_sec +=3D RUNAWAY_KILLER_TIMEOUT;
> ++
> ++  if ((pthread_err =3D
> pthread_create(&authority->priv->runaway_killer_thread, NULL,
> ++                                    js_context_cb, ctx))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error creating runaway JS killer
> thread: %s",
> ++                                  strerror(pthread_err));
> ++    goto err_clean_cond;
> ++  }
> ++
> ++  while (ctx->ret =3D=3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET) /* lo=
op to
> treat spurious wakeups */
> ++    if (pthread_cond_timedwait(&ctx->cond, &ctx->mutex, &abs_time) =3D=
=3D
> ETIMEDOUT) {
> ++      cancel =3D TRUE;
> ++
> ++      /* Log that we are terminating the script */
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Terminating runaway script after %=
d
> seconds",
> ++                                    RUNAWAY_KILLER_TIMEOUT);
> ++
> ++      break;
> ++    }
> ++
> ++  if ((pthread_err =3D pthread_mutex_unlock(&ctx->mutex))) {
> ++    polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority),
> ++                                  "Error unlocking mutex: %s",
> ++                                  strerror(pthread_err));
> ++    goto err_clean_cond;
> ++  }
> ++
> ++  if (cancel) {
> ++    if ((pthread_err =3D pthread_cancel
> (authority->priv->runaway_killer_thread))) {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error cancelling runaway JS killer
> thread: %s",
> ++                                    strerror(pthread_err));
> ++      goto err_clean_cond;
> ++    }
> ++  }
> ++  if ((pthread_err =3D pthread_join
> (authority->priv->runaway_killer_thread, NULL))) {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error joining runaway JS killer
> thread: %s",
> ++                                    strerror(pthread_err));
> ++      goto err_clean_cond;
> ++    }
> ++
> ++  return ctx->ret =3D=3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS;
> ++
> ++    err_clean_cond:
> ++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK
> ++  pthread_cond_destroy(&ctx->cond);
> ++#endif
> ++    err_clean_condattr:
> ++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK
> ++  pthread_condattr_destroy(&attr);
> ++#endif
> ++  return FALSE;
> ++}
> ++
> ++/* Blocking for at most RUNAWAY_KILLER_TIMEOUT */
> ++static gboolean
> ++execute_script_with_runaway_killer(PolkitBackendJsAuthority *authority,
> ++                                   const gchar *filename)
> ++{
> ++  RunawayKillerCtx ctx =3D {.authority =3D authority, .filename =3D fil=
ename,
> ++                          .ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UN=
SET,
> ++                          .mutex =3D PTHREAD_MUTEX_INITIALIZER,
> ++                          .cond =3D PTHREAD_COND_INITIALIZER};
> ++
> ++  return runaway_killer_common(authority, &ctx,
> &runaway_killer_thread_execute_js);
> ++}
> ++
> ++/* Calls already stacked function and args. Blocking for at most
> ++ * RUNAWAY_KILLER_TIMEOUT. If timeout is the case, ctx.ret will be
> ++ * RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET, thus returning FALSE.
> ++ */
> ++static gboolean
> ++call_js_function_with_runaway_killer(PolkitBackendJsAuthority *authorit=
y)
> ++{
> ++  RunawayKillerCtx ctx =3D {.authority =3D authority,
> ++                          .ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UN=
SET,
> ++                          .mutex =3D PTHREAD_MUTEX_INITIALIZER,
> ++                          .cond =3D PTHREAD_COND_INITIALIZER};
> ++
> ++  return runaway_killer_common(authority, &ctx,
> &runaway_killer_thread_call_js);
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++GList *
> ++polkit_backend_common_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveAuthority *_authority,
> ++
> PolkitSubject                     *caller,
> ++
> PolkitSubject                     *subject,
> ++
> PolkitIdentity                    *user_for_subject,
> ++                                                              gboolean
>                          subject_is_local,
> ++                                                              gboolean
>                          subject_is_active,
> ++                                                              const
> gchar                       *action_id,
> ++
> PolkitDetails                     *details)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (_authority);
> ++  GList *ret =3D NULL;
> ++  guint n;
> ++  GError *error =3D NULL;
> ++  const char *ret_str =3D NULL;
> ++  gchar **ret_strs =3D NULL;
> ++  duk_context *cx =3D authority->priv->cx;
> ++
> ++  duk_set_top (cx, 0);
> ++  if (!duk_get_global_string (cx, "polkit")) {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error deleting old rules, not
> loading new ones");
> ++      goto out;
> ++  }
> ++
> ++  duk_push_string (cx, "_runAdminRules");
> ++
> ++  if (!push_action_and_details (cx, action_id, details, &error))
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error converting action and detail=
s
> to JS object: %s",
> ++                                    error->message);
> ++      g_clear_error (&error);
> ++      goto out;
> ++    }
> ++
> ++  if (!push_subject (cx, subject, user_for_subject, subject_is_local,
> subject_is_active, &error))
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error converting subject to JS
> object: %s",
> ++                                    error->message);
> ++      g_clear_error (&error);
> ++      goto out;
> ++    }
> ++
> ++  if (!call_js_function_with_runaway_killer (authority))
> ++    goto out;
> ++
> ++  ret_str =3D duk_require_string (cx, -1);
> ++
> ++  ret_strs =3D g_strsplit (ret_str, ",", -1);
> ++  for (n =3D 0; ret_strs !=3D NULL && ret_strs[n] !=3D NULL; n++)
> ++    {
> ++      const gchar *identity_str =3D ret_strs[n];
> ++      PolkitIdentity *identity;
> ++
> ++      error =3D NULL;
> ++      identity =3D polkit_identity_from_string (identity_str, &error);
> ++      if (identity =3D=3D NULL)
> ++        {
> ++          polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (authority),
> ++                                        "Identity `%s' is not valid,
> ignoring: %s",
> ++                                        identity_str, error->message);
> ++          g_clear_error (&error);
> ++        }
> ++      else
> ++        {
> ++          ret =3D g_list_prepend (ret, identity);
> ++        }
> ++    }
> ++  ret =3D g_list_reverse (ret);
> ++
> ++ out:
> ++  g_strfreev (ret_strs);
> ++  /* fallback to root password auth */
> ++  if (ret =3D=3D NULL)
> ++    ret =3D g_list_prepend (ret, polkit_unix_user_new (0));
> ++
> ++  return ret;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++PolkitImplicitAuthorization
> ++polkit_backend_common_js_authority_check_authorization_sync
> (PolkitBackendInteractiveAuthority *_authority,
> ++
>  PolkitSubject                     *caller,
> ++
>  PolkitSubject                     *subject,
> ++
>  PolkitIdentity                    *user_for_subject,
> ++                                                             gboolean
>                        subject_is_local,
> ++                                                             gboolean
>                        subject_is_active,
> ++                                                             const
> gchar                       *action_id,
> ++
>  PolkitDetails                     *details,
> ++
>  PolkitImplicitAuthorization        implicit)
> ++{
> ++  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (_authority);
> ++  PolkitImplicitAuthorization ret =3D implicit;
> ++  GError *error =3D NULL;
> ++  gchar *ret_str =3D NULL;
> ++  gboolean good =3D FALSE;
> ++  duk_context *cx =3D authority->priv->cx;
> ++
> ++  duk_set_top (cx, 0);
> ++  if (!duk_get_global_string (cx, "polkit")) {
> ++      goto out;
> ++  }
> ++
> ++  duk_push_string (cx, "_runRules");
> ++
> ++  if (!push_action_and_details (cx, action_id, details, &error))
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error converting action and detail=
s
> to JS object: %s",
> ++                                    error->message);
> ++      g_clear_error (&error);
> ++      goto out;
> ++    }
> ++
> ++  if (!push_subject (cx, subject, user_for_subject, subject_is_local,
> subject_is_active, &error))
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Error converting subject to JS
> object: %s",
> ++                                    error->message);
> ++      g_clear_error (&error);
> ++      goto out;
> ++    }
> ++
> ++  // If any error is the js context happened (ctx.ret =3D=3D
> ++  // RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE) or it never properly
> returned
> ++  // (runaway scripts or ctx.ret =3D=3D
> RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET),
> ++  // unauthorize
> ++  if (!call_js_function_with_runaway_killer (authority))
> ++    goto out;
> ++
> ++  if (duk_is_null(cx, -1)) {
> ++    /* this is fine, means there was no match, use implicit
> authorizations */
> ++    good =3D TRUE;
> ++    goto out;
> ++  }
> ++  ret_str =3D g_strdup (duk_require_string (cx, -1));
> ++  if (!polkit_implicit_authorization_from_string (ret_str, &ret))
> ++    {
> ++      polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority=
),
> ++                                    "Returned result `%s' is not valid"=
,
> ++                                    ret_str);
> ++      goto out;
> ++    }
> ++
> ++  good =3D TRUE;
> ++
> ++ out:
> ++  if (!good)
> ++    ret =3D POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED;
> ++  if (ret_str !=3D NULL)
> ++      g_free (ret_str);
> ++
> ++  return ret;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static duk_ret_t
> ++js_polkit_log (duk_context *cx)
> ++{
> ++  const char *str =3D duk_require_string (cx, 0);
> ++  fprintf (stderr, "%s\n", str);
> ++  return 0;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++static duk_ret_t
> ++js_polkit_spawn (duk_context *cx)
> ++{
> ++  duk_ret_t ret =3D DUK_RET_ERROR;
> ++  gchar *standard_output =3D NULL;
> ++  gchar *standard_error =3D NULL;
> ++  gint exit_status;
> ++  GError *error =3D NULL;
> ++  guint32 array_len;
> ++  gchar **argv =3D NULL;
> ++  GMainContext *context =3D NULL;
> ++  GMainLoop *loop =3D NULL;
> ++  SpawnData data =3D {0};
> ++  char *err_str =3D NULL;
> ++  guint n;
> ++
> ++  if (!duk_is_array (cx, 0))
> ++    goto out;
> ++
> ++  array_len =3D duk_get_length (cx, 0);
> ++
> ++  argv =3D g_new0 (gchar*, array_len + 1);
> ++  for (n =3D 0; n < array_len; n++)
> ++    {
> ++      duk_get_prop_index (cx, 0, n);
> ++      argv[n] =3D g_strdup (duk_to_string (cx, -1));
> ++      duk_pop (cx);
> ++    }
> ++
> ++  context =3D g_main_context_new ();
> ++  loop =3D g_main_loop_new (context, FALSE);
> ++
> ++  g_main_context_push_thread_default (context);
> ++
> ++  data.loop =3D loop;
> ++  polkit_backend_common_spawn ((const gchar *const *) argv,
> ++                               10, /* timeout_seconds */
> ++                               NULL, /* cancellable */
> ++                               polkit_backend_common_spawn_cb,
> ++                               &data);
> ++
> ++  g_main_loop_run (loop);
> ++
> ++  g_main_context_pop_thread_default (context);
> ++
> ++  if (!polkit_backend_common_spawn_finish (data.res,
> ++                                           &exit_status,
> ++                                           &standard_output,
> ++                                           &standard_error,
> ++                                           &error))
> ++    {
> ++      err_str =3D g_strdup_printf ("Error spawning helper: %s (%s, %d)"=
,
> ++                                 error->message, g_quark_to_string
> (error->domain), error->code);
> ++      g_clear_error (&error);
> ++      goto out;
> ++    }
> ++
> ++  if (!(WIFEXITED (exit_status) && WEXITSTATUS (exit_status) =3D=3D 0))
> ++    {
> ++      GString *gstr;
> ++      gstr =3D g_string_new (NULL);
> ++      if (WIFEXITED (exit_status))
> ++        {
> ++          g_string_append_printf (gstr,
> ++                                  "Helper exited with non-zero exit
> status %d",
> ++                                  WEXITSTATUS (exit_status));
> ++        }
> ++      else if (WIFSIGNALED (exit_status))
> ++        {
> ++          g_string_append_printf (gstr,
> ++                                  "Helper was signaled with signal %s
> (%d)",
> ++                                  polkit_backend_common_get_signal_name
> (WTERMSIG (exit_status)),
> ++                                  WTERMSIG (exit_status));
> ++        }
> ++      g_string_append_printf (gstr, ", stdout=3D`%s', stderr=3D`%s'",
> ++                              standard_output, standard_error);
> ++      err_str =3D g_string_free (gstr, FALSE);
> ++      goto out;
> ++    }
> ++
> ++  duk_push_string (cx, standard_output);
> ++  ret =3D 1;
> ++
> ++ out:
> ++  g_strfreev (argv);
> ++  g_free (standard_output);
> ++  g_free (standard_error);
> ++  g_clear_object (&data.res);
> ++  if (loop !=3D NULL)
> ++    g_main_loop_unref (loop);
> ++  if (context !=3D NULL)
> ++    g_main_context_unref (context);
> ++
> ++  if (err_str)
> ++    duk_error (cx, DUK_ERR_ERROR, err_str);
> ++
> ++  return ret;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> ++
> ++
> ++static duk_ret_t
> ++js_polkit_user_is_in_netgroup (duk_context *cx)
> ++{
> ++  const char *user;
> ++  const char *netgroup;
> ++  gboolean is_in_netgroup =3D FALSE;
> ++
> ++  user =3D duk_require_string (cx, 0);
> ++  netgroup =3D duk_require_string (cx, 1);
> ++
> ++  if (innetgr (netgroup,
> ++               NULL,  /* host */
> ++               user,
> ++               NULL)) /* domain */
> ++    {
> ++      is_in_netgroup =3D TRUE;
> ++    }
> ++
> ++  duk_push_boolean (cx, is_in_netgroup);
> ++  return 1;
> ++}
> ++
> ++/*
> -------------------------------------------------------------------------=
---------------------------
> */
> +diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp
> b/src/polkitbackend/polkitbackendjsauthority.cpp
> +index ca17108..11e91c0 100644
> +--- a/src/polkitbackend/polkitbackendjsauthority.cpp
> ++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> +@@ -19,29 +19,7 @@
> +  * Author: David Zeuthen <davidz@redhat.com>
> +  */
> +
> +-#include "config.h"
> +-#include <sys/wait.h>
> +-#include <errno.h>
> +-#include <pwd.h>
> +-#include <grp.h>
> +-#ifdef HAVE_NETGROUP_H
> +-#include <netgroup.h>
> +-#else
> +-#include <netdb.h>
> +-#endif
> +-#include <string.h>
> +-#include <glib/gstdio.h>
> +-#include <locale.h>
> +-#include <glib/gi18n-lib.h>
> +-
> +-#include <polkit/polkit.h>
> +-#include "polkitbackendjsauthority.h"
> +-
> +-#include <polkit/polkitprivate.h>
> +-
> +-#ifdef HAVE_LIBSYSTEMD
> +-#include <systemd/sd-login.h>
> +-#endif /* HAVE_LIBSYSTEMD */
> ++#include "polkitbackendcommon.h"
> +
> + #include <js/CompilationAndEvaluation.h>
> + #include <js/ContextOptions.h>
> +@@ -52,6 +30,7 @@
> + #include <js/Array.h>
> + #include <jsapi.h>
> +
> ++/* Built source and not too big to worry about deduplication */
> + #include "initjs.h" /* init.js */
> +
> + #ifdef JSGC_USE_EXACT_ROOTING
> +@@ -67,10 +46,9 @@
> +  * @short_description: JS Authority
> +  * @stability: Unstable
> +  *
> +- * An implementation of #PolkitBackendAuthority that reads and
> +- * evalates Javascript files and supports interaction with
> +- * authentication agents (virtue of being based on
> +- * #PolkitBackendInteractiveAuthority).
> ++ * An (SpiderMonkey-based) implementation of #PolkitBackendAuthority
> that reads
> ++ * and evaluates Javascript files and supports interaction with
> authentication
> ++ * agents (virtue of being based on #PolkitBackendInteractiveAuthority)=
.
> +  */
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +@@ -100,57 +78,11 @@ static bool execute_script_with_runaway_killer
> (PolkitBackendJsAuthority *author
> +                                     JS::HandleScript
>  script,
> +                                     JS::MutableHandleValue
>  rval);
> +
> +-static void utils_spawn (const gchar *const  *argv,
> +-                         guint                timeout_seconds,
> +-                         GCancellable        *cancellable,
> +-                         GAsyncReadyCallback  callback,
> +-                         gpointer             user_data);
> +-
> +-gboolean utils_spawn_finish (GAsyncResult   *res,
> +-                             gint           *out_exit_status,
> +-                             gchar         **out_standard_output,
> +-                             gchar         **out_standard_error,
> +-                             GError        **error);
> +-
> +-static void on_dir_monitor_changed (GFileMonitor     *monitor,
> +-                                    GFile            *file,
> +-                                    GFile            *other_file,
> +-                                    GFileMonitorEvent event_type,
> +-                                    gpointer          user_data);
> +-
> +-/*
> -------------------------------------------------------------------------=
---------------------------
> */
> +-
> +-enum
> +-{
> +-  PROP_0,
> +-  PROP_RULES_DIRS,
> +-};
> +-
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> + static gpointer runaway_killer_thread_func (gpointer user_data);
> + static void runaway_killer_terminate (PolkitBackendJsAuthority
> *authority);
> +
> +-static GList *polkit_backend_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveAuthority *authority,
> +-
>  PolkitSubject                     *caller,
> +-
>  PolkitSubject                     *subject,
> +-
>  PolkitIdentity                    *user_for_subject,
> +-
>  gboolean                           subject_is_local,
> +-
>  gboolean                           subject_is_active,
> +-
>  const gchar                       *action_id,
> +-
>  PolkitDetails                     *details);
> +-
> +-static PolkitImplicitAuthorization
> polkit_backend_js_authority_check_authorization_sync (
> +-
> PolkitBackendInteractiveAuthority *authority,
> +-                                                          PolkitSubject
>                    *caller,
> +-                                                          PolkitSubject
>                    *subject,
> +-
> PolkitIdentity                    *user_for_subject,
> +-                                                          gboolean
>                      subject_is_local,
> +-                                                          gboolean
>                      subject_is_active,
> +-                                                          const gchar
>                    *action_id,
> +-                                                          PolkitDetails
>                    *details,
> +-
> PolkitImplicitAuthorization        implicit);
> +-
> + G_DEFINE_TYPE (PolkitBackendJsAuthority, polkit_backend_js_authority,
> POLKIT_BACKEND_TYPE_INTERACTIVE_AUTHORITY);
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +@@ -229,33 +161,6 @@ polkit_backend_js_authority_init
> (PolkitBackendJsAuthority *authority)
> +
> PolkitBackendJsAuthorityPrivate);
> + }
> +
> +-static gint
> +-rules_file_name_cmp (const gchar *a,
> +-                     const gchar *b)
> +-{
> +-  gint ret;
> +-  const gchar *a_base;
> +-  const gchar *b_base;
> +-
> +-  a_base =3D strrchr (a, '/');
> +-  b_base =3D strrchr (b, '/');
> +-
> +-  g_assert (a_base !=3D NULL);
> +-  g_assert (b_base !=3D NULL);
> +-  a_base +=3D 1;
> +-  b_base +=3D 1;
> +-
> +-  ret =3D g_strcmp0 (a_base, b_base);
> +-  if (ret =3D=3D 0)
> +-    {
> +-      /* /etc wins over /usr */
> +-      ret =3D g_strcmp0 (a, b);
> +-      g_assert (ret !=3D 0);
> +-    }
> +-
> +-  return ret;
> +-}
> +-
> + /* authority->priv->cx must be within a request */
> + static void
> + load_scripts (PolkitBackendJsAuthority  *authority)
> +@@ -299,7 +204,7 @@ load_scripts (PolkitBackendJsAuthority  *authority)
> +         }
> +     }
> +
> +-  files =3D g_list_sort (files, (GCompareFunc) rules_file_name_cmp);
> ++  files =3D g_list_sort (files, (GCompareFunc)
> polkit_backend_common_rules_file_name_cmp);
> +
> +   for (l =3D files; l !=3D NULL; l =3D l->next)
> +     {
> +@@ -365,8 +270,8 @@ load_scripts (PolkitBackendJsAuthority  *authority)
> +   g_list_free_full (files, g_free);
> + }
> +
> +-static void
> +-reload_scripts (PolkitBackendJsAuthority *authority)
> ++void
> ++polkit_backend_common_reload_scripts (PolkitBackendJsAuthority
> *authority)
> + {
> +   JS::RootedValueArray<1> args(authority->priv->cx);
> +   JS::RootedValue rval(authority->priv->cx);
> +@@ -395,42 +300,6 @@ reload_scripts (PolkitBackendJsAuthority *authority=
)
> +   g_signal_emit_by_name (authority, "changed");
> + }
> +
> +-static void
> +-on_dir_monitor_changed (GFileMonitor     *monitor,
> +-                        GFile            *file,
> +-                        GFile            *other_file,
> +-                        GFileMonitorEvent event_type,
> +-                        gpointer          user_data)
> +-{
> +-  PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (user_data);
> +-
> +-  /* TODO: maybe rate-limit so storms of events are collapsed into one
> with a 500ms resolution?
> +-   *       Because when editing a file with emacs we get 4-8 events..
> +-   */
> +-
> +-  if (file !=3D NULL)
> +-    {
> +-      gchar *name;
> +-
> +-      name =3D g_file_get_basename (file);
> +-
> +-      /* g_print ("event_type=3D%d file=3D%p name=3D%s\n", event_type, =
file,
> name); */
> +-      if (!g_str_has_prefix (name, ".") &&
> +-          !g_str_has_prefix (name, "#") &&
> +-          g_str_has_suffix (name, ".rules") &&
> +-          (event_type =3D=3D G_FILE_MONITOR_EVENT_CREATED ||
> +-           event_type =3D=3D G_FILE_MONITOR_EVENT_DELETED ||
> +-           event_type =3D=3D G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT))
> +-        {
> +-          polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY
> (authority),
> +-                                        "Reloading rules");
> +-          reload_scripts (authority);
> +-        }
> +-      g_free (name);
> +-    }
> +-}
> +-
> +-
> + static void
> + setup_file_monitors (PolkitBackendJsAuthority *authority)
> + {
> +@@ -462,7 +331,7 @@ setup_file_monitors (PolkitBackendJsAuthority
> *authority)
> +         {
> +           g_signal_connect (monitor,
> +                             "changed",
> +-                            G_CALLBACK (on_dir_monitor_changed),
> ++                            G_CALLBACK
> (polkit_backend_common_on_dir_monitor_changed),
> +                             authority);
> +           g_ptr_array_add (p, monitor);
> +         }
> +@@ -471,8 +340,8 @@ setup_file_monitors (PolkitBackendJsAuthority
> *authority)
> +   authority->priv->dir_monitors =3D (GFileMonitor**) g_ptr_array_free (=
p,
> FALSE);
> + }
> +
> +-static void
> +-polkit_backend_js_authority_constructed (GObject *object)
> ++void
> ++polkit_backend_common_js_authority_constructed (GObject *object)
> + {
> +   PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> +
> +@@ -561,8 +430,8 @@ polkit_backend_js_authority_constructed (GObject
> *object)
> +   g_assert_not_reached ();
> + }
> +
> +-static void
> +-polkit_backend_js_authority_finalize (GObject *object)
> ++void
> ++polkit_backend_common_js_authority_finalize (GObject *object)
> + {
> +   PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> +   guint n;
> +@@ -577,7 +446,7 @@ polkit_backend_js_authority_finalize (GObject *objec=
t)
> +     {
> +       GFileMonitor *monitor =3D authority->priv->dir_monitors[n];
> +       g_signal_handlers_disconnect_by_func (monitor,
> +-                                            (gpointer*)G_CALLBACK
> (on_dir_monitor_changed),
> ++                                            (gpointer*)G_CALLBACK
> (polkit_backend_common_on_dir_monitor_changed),
> +                                             authority);
> +       g_object_unref (monitor);
> +     }
> +@@ -594,11 +463,11 @@ polkit_backend_js_authority_finalize (GObject
> *object)
> +   G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize
> (object);
> + }
> +
> +-static void
> +-polkit_backend_js_authority_set_property (GObject      *object,
> +-                                          guint         property_id,
> +-                                          const GValue *value,
> +-                                          GParamSpec   *pspec)
> ++void
> ++polkit_backend_common_js_authority_set_property (GObject      *object,
> ++                                                 guint
>  property_id,
> ++                                                 const GValue *value,
> ++                                                 GParamSpec   *pspec)
> + {
> +   PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (object);
> +
> +@@ -615,57 +484,12 @@ polkit_backend_js_authority_set_property (GObject
>     *object,
> +     }
> + }
> +
> +-static const gchar *
> +-polkit_backend_js_authority_get_name (PolkitBackendAuthority *authority=
)
> +-{
> +-  return "js";
> +-}
> +-
> +-static const gchar *
> +-polkit_backend_js_authority_get_version (PolkitBackendAuthority
> *authority)
> +-{
> +-  return PACKAGE_VERSION;
> +-}
> +-
> +-static PolkitAuthorityFeatures
> +-polkit_backend_js_authority_get_features (PolkitBackendAuthority
> *authority)
> +-{
> +-  return POLKIT_AUTHORITY_FEATURES_TEMPORARY_AUTHORIZATION;
> +-}
> +-
> + static void
> + polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass
> *klass)
> + {
> +-  GObjectClass *gobject_class;
> +-  PolkitBackendAuthorityClass *authority_class;
> +-  PolkitBackendInteractiveAuthorityClass *interactive_authority_class;
> +-
> +-
> +-  gobject_class =3D G_OBJECT_CLASS (klass);
> +-  gobject_class->finalize                               =3D
> polkit_backend_js_authority_finalize;
> +-  gobject_class->set_property                           =3D
> polkit_backend_js_authority_set_property;
> +-  gobject_class->constructed                            =3D
> polkit_backend_js_authority_constructed;
> +-
> +-  authority_class =3D POLKIT_BACKEND_AUTHORITY_CLASS (klass);
> +-  authority_class->get_name                             =3D
> polkit_backend_js_authority_get_name;
> +-  authority_class->get_version                          =3D
> polkit_backend_js_authority_get_version;
> +-  authority_class->get_features                         =3D
> polkit_backend_js_authority_get_features;
> +-
> +-  interactive_authority_class =3D
> POLKIT_BACKEND_INTERACTIVE_AUTHORITY_CLASS (klass);
> +-  interactive_authority_class->get_admin_identities     =3D
> polkit_backend_js_authority_get_admin_auth_identities;
> +-  interactive_authority_class->check_authorization_sync =3D
> polkit_backend_js_authority_check_authorization_sync;
> +-
> +-  g_object_class_install_property (gobject_class,
> +-                                   PROP_RULES_DIRS,
> +-                                   g_param_spec_boxed ("rules-dirs",
> +-                                                       NULL,
> +-                                                       NULL,
> +-                                                       G_TYPE_STRV,
> +-
>  GParamFlags(G_PARAM_CONSTRUCT_ONLY | G_PARAM_WRITABLE)));
> +-
> ++  polkit_backend_common_js_authority_class_init_common (klass);
> +
> +   g_type_class_add_private (klass, sizeof
> (PolkitBackendJsAuthorityPrivate));
> +-
> +   JS_Init ();
> + }
> +
> +@@ -1005,11 +829,14 @@ runaway_killer_setup (PolkitBackendJsAuthority
> *authority)
> + {
> +   g_assert (authority->priv->rkt_source =3D=3D NULL);
> +
> +-  /* set-up timer for runaway scripts, will be executed in
> runaway_killer_thread */
> ++  /* set-up timer for runaway scripts, will be executed in
> ++     runaway_killer_thread, that is one, permanent thread running a gli=
b
> ++     mainloop (rkt_loop) whose context (rkt_context) has a timeout sour=
ce
> ++     (rkt_source) */
> +   g_mutex_lock (&authority->priv->rkt_timeout_pending_mutex);
> +   authority->priv->rkt_timeout_pending =3D FALSE;
> +   g_mutex_unlock (&authority->priv->rkt_timeout_pending_mutex);
> +-  authority->priv->rkt_source =3D g_timeout_source_new_seconds (15);
> ++  authority->priv->rkt_source =3D g_timeout_source_new_seconds
> (RUNAWAY_KILLER_TIMEOUT);
> +   g_source_set_callback (authority->priv->rkt_source, rkt_on_timeout,
> authority, NULL);
> +   g_source_attach (authority->priv->rkt_source,
> authority->priv->rkt_context);
> +
> +@@ -1069,6 +896,9 @@ execute_script_with_runaway_killer
> (PolkitBackendJsAuthority *authority,
> + {
> +   bool ret;
> +
> ++  // tries to JS_ExecuteScript(), may hang for > RUNAWAY_KILLER_TIMEOUT=
,
> ++  // runaway_killer_thread makes sure the call returns, due to exceptio=
n
> ++  // injection
> +   runaway_killer_setup (authority);
> +   ret =3D JS_ExecuteScript (authority->priv->cx,
> +                           script,
> +@@ -1099,15 +929,15 @@ call_js_function_with_runaway_killer
> (PolkitBackendJsAuthority *authority,
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> +-static GList *
> +-polkit_backend_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveAuthority *_authority,
> +-                                                       PolkitSubject
>                  *caller,
> +-                                                       PolkitSubject
>                  *subject,
> +-                                                       PolkitIdentity
>                 *user_for_subject,
> +-                                                       gboolean
>                  subject_is_local,
> +-                                                       gboolean
>                  subject_is_active,
> +-                                                       const gchar
>                  *action_id,
> +-                                                       PolkitDetails
>                  *details)
> ++GList *
> ++polkit_backend_common_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveAuthority *_authority,
> ++
> PolkitSubject                     *caller,
> ++
> PolkitSubject                     *subject,
> ++
> PolkitIdentity                    *user_for_subject,
> ++                                                              gboolean
>                          subject_is_local,
> ++                                                              gboolean
>                          subject_is_active,
> ++                                                              const
> gchar                       *action_id,
> ++
> PolkitDetails                     *details)
> + {
> +   PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (_authority);
> +   GList *ret =3D NULL;
> +@@ -1202,16 +1032,16 @@
> polkit_backend_js_authority_get_admin_auth_identities
> (PolkitBackendInteractiveA
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> +-static PolkitImplicitAuthorization
> +-polkit_backend_js_authority_check_authorization_sync
> (PolkitBackendInteractiveAuthority *_authority,
> +-                                                      PolkitSubject
>                *caller,
> +-                                                      PolkitSubject
>                *subject,
> +-                                                      PolkitIdentity
>                 *user_for_subject,
> +-                                                      gboolean
>                  subject_is_local,
> +-                                                      gboolean
>                  subject_is_active,
> +-                                                      const gchar
>                *action_id,
> +-                                                      PolkitDetails
>                *details,
> +-
> PolkitImplicitAuthorization        implicit)
> ++PolkitImplicitAuthorization
> ++polkit_backend_common_js_authority_check_authorization_sync
> (PolkitBackendInteractiveAuthority *_authority,
> ++
>  PolkitSubject                     *caller,
> ++
>  PolkitSubject                     *subject,
> ++
>  PolkitIdentity                    *user_for_subject,
> ++                                                             gboolean
>                        subject_is_local,
> ++                                                             gboolean
>                        subject_is_active,
> ++                                                             const
> gchar                       *action_id,
> ++
>  PolkitDetails                     *details,
> ++
>  PolkitImplicitAuthorization        implicit)
> + {
> +   PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORITY
> (_authority);
> +   PolkitImplicitAuthorization ret =3D implicit;
> +@@ -1324,65 +1154,6 @@ js_polkit_log (JSContext  *cx,
> +
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> +-static const gchar *
> +-get_signal_name (gint signal_number)
> +-{
> +-  switch (signal_number)
> +-    {
> +-#define _HANDLE_SIG(sig) case sig: return #sig;
> +-    _HANDLE_SIG (SIGHUP);
> +-    _HANDLE_SIG (SIGINT);
> +-    _HANDLE_SIG (SIGQUIT);
> +-    _HANDLE_SIG (SIGILL);
> +-    _HANDLE_SIG (SIGABRT);
> +-    _HANDLE_SIG (SIGFPE);
> +-    _HANDLE_SIG (SIGKILL);
> +-    _HANDLE_SIG (SIGSEGV);
> +-    _HANDLE_SIG (SIGPIPE);
> +-    _HANDLE_SIG (SIGALRM);
> +-    _HANDLE_SIG (SIGTERM);
> +-    _HANDLE_SIG (SIGUSR1);
> +-    _HANDLE_SIG (SIGUSR2);
> +-    _HANDLE_SIG (SIGCHLD);
> +-    _HANDLE_SIG (SIGCONT);
> +-    _HANDLE_SIG (SIGSTOP);
> +-    _HANDLE_SIG (SIGTSTP);
> +-    _HANDLE_SIG (SIGTTIN);
> +-    _HANDLE_SIG (SIGTTOU);
> +-    _HANDLE_SIG (SIGBUS);
> +-#ifdef SIGPOLL
> +-    _HANDLE_SIG (SIGPOLL);
> +-#endif
> +-    _HANDLE_SIG (SIGPROF);
> +-    _HANDLE_SIG (SIGSYS);
> +-    _HANDLE_SIG (SIGTRAP);
> +-    _HANDLE_SIG (SIGURG);
> +-    _HANDLE_SIG (SIGVTALRM);
> +-    _HANDLE_SIG (SIGXCPU);
> +-    _HANDLE_SIG (SIGXFSZ);
> +-#undef _HANDLE_SIG
> +-    default:
> +-      break;
> +-    }
> +-  return "UNKNOWN_SIGNAL";
> +-}
> +-
> +-typedef struct
> +-{
> +-  GMainLoop *loop;
> +-  GAsyncResult *res;
> +-} SpawnData;
> +-
> +-static void
> +-spawn_cb (GObject       *source_object,
> +-          GAsyncResult  *res,
> +-          gpointer       user_data)
> +-{
> +-  SpawnData *data =3D (SpawnData *)user_data;
> +-  data->res =3D (GAsyncResult*)g_object_ref (res);
> +-  g_main_loop_quit (data->loop);
> +-}
> +-
> + static bool
> + js_polkit_spawn (JSContext  *cx,
> +                  unsigned    js_argc,
> +@@ -1440,21 +1211,21 @@ js_polkit_spawn (JSContext  *cx,
> +   g_main_context_push_thread_default (context);
> +
> +   data.loop =3D loop;
> +-  utils_spawn ((const gchar *const *) argv,
> +-               10, /* timeout_seconds */
> +-               NULL, /* cancellable */
> +-               spawn_cb,
> +-               &data);
> ++  polkit_backend_common_spawn ((const gchar *const *) argv,
> ++                               10, /* timeout_seconds */
> ++                               NULL, /* cancellable */
> ++                               polkit_backend_common_spawn_cb,
> ++                               &data);
> +
> +   g_main_loop_run (loop);
> +
> +   g_main_context_pop_thread_default (context);
> +
> +-  if (!utils_spawn_finish (data.res,
> +-                           &exit_status,
> +-                           &standard_output,
> +-                           &standard_error,
> +-                           &error))
> ++  if (!polkit_backend_common_spawn_finish (data.res,
> ++                                           &exit_status,
> ++                                           &standard_output,
> ++                                           &standard_error,
> ++                                           &error))
> +     {
> +       JS_ReportErrorUTF8 (cx,
> +                       "Error spawning helper: %s (%s, %d)",
> +@@ -1477,7 +1248,7 @@ js_polkit_spawn (JSContext  *cx,
> +         {
> +           g_string_append_printf (gstr,
> +                                   "Helper was signaled with signal %s
> (%d)",
> +-                                  get_signal_name (WTERMSIG
> (exit_status)),
> ++                                  polkit_backend_common_get_signal_name
> (WTERMSIG (exit_status)),
> +                                   WTERMSIG (exit_status));
> +         }
> +       g_string_append_printf (gstr, ", stdout=3D`%s', stderr=3D`%s'",
> +@@ -1542,381 +1313,5 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
> +   return ret;
> + }
> +
> +-
> +-
> + /*
> -------------------------------------------------------------------------=
---------------------------
> */
> +
> +-typedef struct
> +-{
> +-  GSimpleAsyncResult *simple; /* borrowed reference */
> +-  GMainContext *main_context; /* may be NULL */
> +-
> +-  GCancellable *cancellable;  /* may be NULL */
> +-  gulong cancellable_handler_id;
> +-
> +-  GPid child_pid;
> +-  gint child_stdout_fd;
> +-  gint child_stderr_fd;
> +-
> +-  GIOChannel *child_stdout_channel;
> +-  GIOChannel *child_stderr_channel;
> +-
> +-  GSource *child_watch_source;
> +-  GSource *child_stdout_source;
> +-  GSource *child_stderr_source;
> +-
> +-  guint timeout_seconds;
> +-  gboolean timed_out;
> +-  GSource *timeout_source;
> +-
> +-  GString *child_stdout;
> +-  GString *child_stderr;
> +-
> +-  gint exit_status;
> +-} UtilsSpawnData;
> +-
> +-static void
> +-utils_child_watch_from_release_cb (GPid     pid,
> +-                                   gint     status,
> +-                                   gpointer user_data)
> +-{
> +-}
> +-
> +-static void
> +-utils_spawn_data_free (UtilsSpawnData *data)
> +-{
> +-  if (data->timeout_source !=3D NULL)
> +-    {
> +-      g_source_destroy (data->timeout_source);
> +-      data->timeout_source =3D NULL;
> +-    }
> +-
> +-  /* Nuke the child, if necessary */
> +-  if (data->child_watch_source !=3D NULL)
> +-    {
> +-      g_source_destroy (data->child_watch_source);
> +-      data->child_watch_source =3D NULL;
> +-    }
> +-
> +-  if (data->child_pid !=3D 0)
> +-    {
> +-      GSource *source;
> +-      kill (data->child_pid, SIGTERM);
> +-      /* OK, we need to reap for the child ourselves - we don't want
> +-       * to use waitpid() because that might block the calling
> +-       * thread (the child might handle SIGTERM and use several
> +-       * seconds for cleanup/rollback).
> +-       *
> +-       * So we use GChildWatch instead.
> +-       *
> +-       * Avoid taking a references to ourselves. but note that we need
> +-       * to pass the GSource so we can nuke it once handled.
> +-       */
> +-      source =3D g_child_watch_source_new (data->child_pid);
> +-      g_source_set_callback (source,
> +-                             (GSourceFunc)
> utils_child_watch_from_release_cb,
> +-                             source,
> +-                             (GDestroyNotify) g_source_destroy);
> +-      /* attach source to the global default main context */
> +-      g_source_attach (source, NULL);
> +-      g_source_unref (source);
> +-      data->child_pid =3D 0;
> +-    }
> +-
> +-  if (data->child_stdout !=3D NULL)
> +-    {
> +-      g_string_free (data->child_stdout, TRUE);
> +-      data->child_stdout =3D NULL;
> +-    }
> +-
> +-  if (data->child_stderr !=3D NULL)
> +-    {
> +-      g_string_free (data->child_stderr, TRUE);
> +-      data->child_stderr =3D NULL;
> +-    }
> +-
> +-  if (data->child_stdout_channel !=3D NULL)
> +-    {
> +-      g_io_channel_unref (data->child_stdout_channel);
> +-      data->child_stdout_channel =3D NULL;
> +-    }
> +-  if (data->child_stderr_channel !=3D NULL)
> +-    {
> +-      g_io_channel_unref (data->child_stderr_channel);
> +-      data->child_stderr_channel =3D NULL;
> +-    }
> +-
> +-  if (data->child_stdout_source !=3D NULL)
> +-    {
> +-      g_source_destroy (data->child_stdout_source);
> +-      data->child_stdout_source =3D NULL;
> +-    }
> +-  if (data->child_stderr_source !=3D NULL)
> +-    {
> +-      g_source_destroy (data->child_stderr_source);
> +-      data->child_stderr_source =3D NULL;
> +-    }
> +-
> +-  if (data->child_stdout_fd !=3D -1)
> +-    {
> +-      g_warn_if_fail (close (data->child_stdout_fd) =3D=3D 0);
> +-      data->child_stdout_fd =3D -1;
> +-    }
> +-  if (data->child_stderr_fd !=3D -1)
> +-    {
> +-      g_warn_if_fail (close (data->child_stderr_fd) =3D=3D 0);
> +-      data->child_stderr_fd =3D -1;
> +-    }
> +-
> +-  if (data->cancellable_handler_id > 0)
> +-    {
> +-      g_cancellable_disconnect (data->cancellable,
> data->cancellable_handler_id);
> +-      data->cancellable_handler_id =3D 0;
> +-    }
> +-
> +-  if (data->main_context !=3D NULL)
> +-    g_main_context_unref (data->main_context);
> +-
> +-  if (data->cancellable !=3D NULL)
> +-    g_object_unref (data->cancellable);
> +-
> +-  g_slice_free (UtilsSpawnData, data);
> +-}
> +-
> +-/* called in the thread where @cancellable was cancelled */
> +-static void
> +-utils_on_cancelled (GCancellable *cancellable,
> +-                    gpointer      user_data)
> +-{
> +-  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> +-  GError *error;
> +-
> +-  error =3D NULL;
> +-  g_warn_if_fail (g_cancellable_set_error_if_cancelled (cancellable,
> &error));
> +-  g_simple_async_result_take_error (data->simple, error);
> +-  g_simple_async_result_complete_in_idle (data->simple);
> +-  g_object_unref (data->simple);
> +-}
> +-
> +-static gboolean
> +-utils_read_child_stderr (GIOChannel *channel,
> +-                         GIOCondition condition,
> +-                         gpointer user_data)
> +-{
> +-  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> +-  gchar buf[1024];
> +-  gsize bytes_read;
> +-
> +-  g_io_channel_read_chars (channel, buf, sizeof buf, &bytes_read, NULL)=
;
> +-  g_string_append_len (data->child_stderr, buf, bytes_read);
> +-  return TRUE;
> +-}
> +-
> +-static gboolean
> +-utils_read_child_stdout (GIOChannel *channel,
> +-                         GIOCondition condition,
> +-                         gpointer user_data)
> +-{
> +-  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> +-  gchar buf[1024];
> +-  gsize bytes_read;
> +-
> +-  g_io_channel_read_chars (channel, buf, sizeof buf, &bytes_read, NULL)=
;
> +-  g_string_append_len (data->child_stdout, buf, bytes_read);
> +-  return TRUE;
> +-}
> +-
> +-static void
> +-utils_child_watch_cb (GPid     pid,
> +-                      gint     status,
> +-                      gpointer user_data)
> +-{
> +-  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> +-  gchar *buf;
> +-  gsize buf_size;
> +-
> +-  if (g_io_channel_read_to_end (data->child_stdout_channel, &buf,
> &buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)
> +-    {
> +-      g_string_append_len (data->child_stdout, buf, buf_size);
> +-      g_free (buf);
> +-    }
> +-  if (g_io_channel_read_to_end (data->child_stderr_channel, &buf,
> &buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)
> +-    {
> +-      g_string_append_len (data->child_stderr, buf, buf_size);
> +-      g_free (buf);
> +-    }
> +-
> +-  data->exit_status =3D status;
> +-
> +-  /* ok, child watch is history, make sure we don't free it in
> spawn_data_free() */
> +-  data->child_pid =3D 0;
> +-  data->child_watch_source =3D NULL;
> +-
> +-  /* we're done */
> +-  g_simple_async_result_complete_in_idle (data->simple);
> +-  g_object_unref (data->simple);
> +-}
> +-
> +-static gboolean
> +-utils_timeout_cb (gpointer user_data)
> +-{
> +-  UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;
> +-
> +-  data->timed_out =3D TRUE;
> +-
> +-  /* ok, timeout is history, make sure we don't free it in
> spawn_data_free() */
> +-  data->timeout_source =3D NULL;
> +-
> +-  /* we're done */
> +-  g_simple_async_result_complete_in_idle (data->simple);
> +-  g_object_unref (data->simple);
> +-
> +-  return FALSE; /* remove source */
> +-}
> +-
> +-static void
> +-utils_spawn (const gchar *const  *argv,
> +-             guint                timeout_seconds,
> +-             GCancellable        *cancellable,
> +-             GAsyncReadyCallback  callback,
> +-             gpointer             user_data)
> +-{
> +-  UtilsSpawnData *data;
> +-  GError *error;
> +-
> +-  data =3D g_slice_new0 (UtilsSpawnData);
> +-  data->timeout_seconds =3D timeout_seconds;
> +-  data->simple =3D g_simple_async_result_new (NULL,
> +-                                            callback,
> +-                                            user_data,
> +-                                            (gpointer*)utils_spawn);
> +-  data->main_context =3D g_main_context_get_thread_default ();
> +-  if (data->main_context !=3D NULL)
> +-    g_main_context_ref (data->main_context);
> +-
> +-  data->cancellable =3D cancellable !=3D NULL ? (GCancellable*)g_object=
_ref
> (cancellable) : NULL;
> +-
> +-  data->child_stdout =3D g_string_new (NULL);
> +-  data->child_stderr =3D g_string_new (NULL);
> +-  data->child_stdout_fd =3D -1;
> +-  data->child_stderr_fd =3D -1;
> +-
> +-  /* the life-cycle of UtilsSpawnData is tied to its GSimpleAsyncResult
> */
> +-  g_simple_async_result_set_op_res_gpointer (data->simple, data,
> (GDestroyNotify) utils_spawn_data_free);
> +-
> +-  error =3D NULL;
> +-  if (data->cancellable !=3D NULL)
> +-    {
> +-      /* could already be cancelled */
> +-      error =3D NULL;
> +-      if (g_cancellable_set_error_if_cancelled (data->cancellable,
> &error))
> +-        {
> +-          g_simple_async_result_take_error (data->simple, error);
> +-          g_simple_async_result_complete_in_idle (data->simple);
> +-          g_object_unref (data->simple);
> +-          goto out;
> +-        }
> +-
> +-      data->cancellable_handler_id =3D g_cancellable_connect
> (data->cancellable,
> +-                                                            G_CALLBACK
> (utils_on_cancelled),
> +-                                                            data,
> +-                                                            NULL);
> +-    }
> +-
> +-  error =3D NULL;
> +-  if (!g_spawn_async_with_pipes (NULL, /* working directory */
> +-                                 (gchar **) argv,
> +-                                 NULL, /* envp */
> +-                                 GSpawnFlags(G_SPAWN_SEARCH_PATH |
> G_SPAWN_DO_NOT_REAP_CHILD),
> +-                                 NULL, /* child_setup */
> +-                                 NULL, /* child_setup's user_data */
> +-                                 &(data->child_pid),
> +-                                 NULL, /* gint *stdin_fd */
> +-                                 &(data->child_stdout_fd),
> +-                                 &(data->child_stderr_fd),
> +-                                 &error))
> +-    {
> +-      g_prefix_error (&error, "Error spawning: ");
> +-      g_simple_async_result_take_error (data->simple, error);
> +-      g_simple_async_result_complete_in_idle (data->simple);
> +-      g_object_unref (data->simple);
> +-      goto out;
> +-    }
> +-
> +-  if (timeout_seconds > 0)
> +-    {
> +-      data->timeout_source =3D g_timeout_source_new_seconds
> (timeout_seconds);
> +-      g_source_set_priority (data->timeout_source, G_PRIORITY_DEFAULT);
> +-      g_source_set_callback (data->timeout_source, utils_timeout_cb,
> data, NULL);
> +-      g_source_attach (data->timeout_source, data->main_context);
> +-      g_source_unref (data->timeout_source);
> +-    }
> +-
> +-  data->child_watch_source =3D g_child_watch_source_new (data->child_pi=
d);
> +-  g_source_set_callback (data->child_watch_source, (GSourceFunc)
> utils_child_watch_cb, data, NULL);
> +-  g_source_attach (data->child_watch_source, data->main_context);
> +-  g_source_unref (data->child_watch_source);
> +-
> +-  data->child_stdout_channel =3D g_io_channel_unix_new
> (data->child_stdout_fd);
> +-  g_io_channel_set_flags (data->child_stdout_channel,
> G_IO_FLAG_NONBLOCK, NULL);
> +-  data->child_stdout_source =3D g_io_create_watch
> (data->child_stdout_channel, G_IO_IN);
> +-  g_source_set_callback (data->child_stdout_source, (GSourceFunc)
> utils_read_child_stdout, data, NULL);
> +-  g_source_attach (data->child_stdout_source, data->main_context);
> +-  g_source_unref (data->child_stdout_source);
> +-
> +-  data->child_stderr_channel =3D g_io_channel_unix_new
> (data->child_stderr_fd);
> +-  g_io_channel_set_flags (data->child_stderr_channel,
> G_IO_FLAG_NONBLOCK, NULL);
> +-  data->child_stderr_source =3D g_io_create_watch
> (data->child_stderr_channel, G_IO_IN);
> +-  g_source_set_callback (data->child_stderr_source, (GSourceFunc)
> utils_read_child_stderr, data, NULL);
> +-  g_source_attach (data->child_stderr_source, data->main_context);
> +-  g_source_unref (data->child_stderr_source);
> +-
> +- out:
> +-  ;
> +-}
> +-
> +-gboolean
> +-utils_spawn_finish (GAsyncResult   *res,
> +-                    gint           *out_exit_status,
> +-                    gchar         **out_standard_output,
> +-                    gchar         **out_standard_error,
> +-                    GError        **error)
> +-{
> +-  GSimpleAsyncResult *simple =3D G_SIMPLE_ASYNC_RESULT (res);
> +-  UtilsSpawnData *data;
> +-  gboolean ret =3D FALSE;
> +-
> +-  g_return_val_if_fail (G_IS_ASYNC_RESULT (res), FALSE);
> +-  g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, FALSE)=
;
> +-
> +-  g_warn_if_fail (g_simple_async_result_get_source_tag (simple) =3D=3D
> utils_spawn);
> +-
> +-  if (g_simple_async_result_propagate_error (simple, error))
> +-    goto out;
> +-
> +-  data =3D (UtilsSpawnData*)g_simple_async_result_get_op_res_gpointer
> (simple);
> +-
> +-  if (data->timed_out)
> +-    {
> +-      g_set_error (error,
> +-                   G_IO_ERROR,
> +-                   G_IO_ERROR_TIMED_OUT,
> +-                   "Timed out after %d seconds",
> +-                   data->timeout_seconds);
> +-      goto out;
> +-    }
> +-
> +-  if (out_exit_status !=3D NULL)
> +-    *out_exit_status =3D data->exit_status;
> +-
> +-  if (out_standard_output !=3D NULL)
> +-    *out_standard_output =3D g_strdup (data->child_stdout->str);
> +-
> +-  if (out_standard_error !=3D NULL)
> +-    *out_standard_error =3D g_strdup (data->child_stderr->str);
> +-
> +-  ret =3D TRUE;
> +-
> +- out:
> +-  return ret;
> +-}
> +diff --git a/test/data/etc/polkit-1/rules.d/10-testing.rules
> b/test/data/etc/polkit-1/rules.d/10-testing.rules
> +index 98bf062..e346b5d 100644
> +--- a/test/data/etc/polkit-1/rules.d/10-testing.rules
> ++++ b/test/data/etc/polkit-1/rules.d/10-testing.rules
> +@@ -189,8 +189,10 @@ polkit.addRule(function(action, subject) {
> +                 ;
> +         } catch (error) {
> +             if (error =3D=3D "Terminating runaway script")
> +-                return polkit.Result.YES;
> +-            return polkit.Result.NO;
> ++                // Inverted logic to accomodate Duktape's model as well=
,
> which
> ++                // will always fail with negation, on timeouts
> ++                return polkit.Result.NO;
> ++            return polkit.Result.YES;
> +         }
> +     }
> + });
> +diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c
> b/test/polkitbackend/test-polkitbackendjsauthority.c
> +index f97e0e0..2103b17 100644
> +--- a/test/polkitbackend/test-polkitbackendjsauthority.c
> ++++ b/test/polkitbackend/test-polkitbackendjsauthority.c
> +@@ -328,7 +328,7 @@ static const RulesTestCase rules_test_cases[] =3D {
> +     "net.company.run_away_script",
> +     "unix-user:root",
> +     NULL,
> +-    POLKIT_IMPLICIT_AUTHORIZATION_AUTHORIZED,
> ++    POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,
> +   },
> +
> +   {
> +--
> +2.20.1
> +
> diff --git
> a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> b/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> deleted file mode 100644
> index 9e9755e44..000000000
> ---
> a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-call-=
JS_Init-and-JS_ShutDown-e.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001
> -From: Xi Ruoyao <xry111@mengyan1223.wang>
> -Date: Tue, 10 Aug 2021 18:52:56 +0800
> -Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()
> - exactly once
> -
> -Before this commit, we were calling JS_Init() in
> -polkit_backend_js_authority_class_init and never called JS_ShutDown.
> -This is actually a misusage of SpiderMonkey API.  Quote from a comment
> -in js/Initialization.h (both mozjs-78 and mozjs-91):
> -
> -    It is currently not possible to initialize SpiderMonkey multiple
> -    times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in that
> -    order, then doing so again).
> -
> -This misusage does not cause severe issues with mozjs-78.  However, when
> -we eventually port jsauthority to use mozjs-91, bad thing will happen:
> -see the test failure mentioned in #150.
> -
> -This commit is tested with both mozjs-78 and mozjs-91, all tests pass
> -with it.
> -
> -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp
> b/src/polkitbackend/polkitbackendjsauthority.cpp
> -index 41d8d5c..38dc001 100644
> ---- a/src/polkitbackend/polkitbackendjsauthority.cpp
> -+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> -@@ -75,6 +75,13 @@
> -
> - /*
> -------------------------------------------------------------------------=
---------------------------
> */
> -
> -+static class JsInitHelperType
> -+{
> -+public:
> -+      JsInitHelperType() { JS_Init(); }
> -+      ~JsInitHelperType() { JS_ShutDown(); }
> -+} JsInitHelper;
> -+
> - struct _PolkitBackendJsAuthorityPrivate
> - {
> -   gchar **rules_dirs;
> -@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *objec=
t)
> -   delete authority->priv->js_polkit;
> -
> -   JS_DestroyContext (authority->priv->cx);
> --  /* JS_ShutDown (); */
> -
> -   G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)->finalize
> (object);
> - }
> -@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init
> (PolkitBackendJsAuthorityClass *klass)
> -
> -
> -   g_type_class_add_private (klass, sizeof
> (PolkitBackendJsAuthorityPrivate));
> --
> --  JS_Init ();
> - }
> -
> - /*
> -------------------------------------------------------------------------=
---------------------------
> */
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> index a9559c4db..186801a09 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb \
>
>  file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b01331=
76d0504c87a0ded39db4"
>
> -DEPENDS =3D "expat glib-2.0 intltool-native mozjs-91"
> +DEPENDS =3D "expat glib-2.0 intltool-native duktape"
>
>  inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspectio=
n
> features_check
>
> @@ -25,16 +25,16 @@ PAM_SRC_URI =3D "file://polkit-1_pam.patch"
>  SRC_URI =3D "
> http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> '${PAM_SRC_URI}', '', d)} \
>             file://0003-make-netgroup-support-optional.patch \
> -           file://0002-jsauthority-port-to-mozjs-91.patch \
> -
>  file://0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch \
>
> file://0001-pkexec-local-privilege-escalation-CVE-2021-4034.patch \
>             file://0002-CVE-2021-4115-GHSL-2021-077-fix.patch \
> +           file://0003-Added-support-for-duktape-as-JS-engine.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "c8579fdb86e94295404211285fee0722ad04893f0213e571bd75c00972fd1f5c"
>
>  EXTRA_OECONF =3D "--with-os-type=3Dmoblin \
>                  --disable-man-pages \
>                  --disable-libelogind \
> +                --with-duktape \
>                 "
>
>  do_compile:prepend () {
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96194):
> https://lists.openembedded.org/g/openembedded-devel/message/96194
> Mute This Topic: https://lists.openembedded.org/mt/89996103/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003753eb05daf48c32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mikko,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rap=
eli@bmw.de">mikko.rapeli@bmw.de</a>&gt; escreveu no dia quinta, 24/03/2022 =
=C3=A0(s) 10:21:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" target=3D"_b=
lank">mikko.rapeli@bmw.de</a>&gt;<br>
<br>
cherry-pick the change from polkit 0.120+ upstream since<br>
it applies directly to 0.119. Drop mozjs patches.<br>
<br>
Removes mozjs and its dependency nspr from images. They account for<br>
roughly 21 Mb on 64bit ARM machines. The replacement libduktape is<br>
roughly 300 kb in size. Thus this saves at least 20 Mb in rootfs size<br>
when polkit is used.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" targ=
et=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0.../0002-jsauthority-port-to-mozjs-91.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A038 -<br>
=C2=A0...ded-support-for-duktape-as-JS-engine.patch | 3463 ++++++++++++++++=
+<br>
=C2=A0...re-to-call-JS_Init-and-JS_ShutDown-e.patch |=C2=A0 =C2=A063 -<br>
=C2=A0.../recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" rel=3D=
"noreferrer" target=3D"_blank">polkit_0.119.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 6 +-<br>
=C2=A04 files changed, 3466 insertions(+), 104 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0002-jsauth=
ority-port-to-mozjs-91.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-Added-=
support-for-duktape-as-JS-engine.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0003-jsauth=
ority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-t=
o-mozjs-91.patch b/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-=
port-to-mozjs-91.patch<br>
deleted file mode 100644<br>
index 5b3660da2..000000000<br>
--- a/meta-oe/recipes-extended/polkit/polkit/0002-jsauthority-port-to-mozjs=
-91.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From 4ce27b66bb07b72cb96d3d43a75108a5a6e7e156 Mon Sep 17 00:00:00 2001<br>
-From: Xi Ruoyao &lt;xry111@mengyan1223.wang&gt;<br>
-Date: Tue, 10 Aug 2021 19:09:42 +0800<br>
-Subject: [PATCH] jsauthority: port to mozjs-91<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/polk=
it/polkit/-/merge_requests/92" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/polkit/polkit/-/merge_requests/92</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
- meson.build=C2=A0 | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index d807086..5a7fc11 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -80,7 +80,7 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 &gt;=
=3D 2.30.0])<br>
- AC_SUBST(GLIB_CFLAGS)<br>
- AC_SUBST(GLIB_LIBS)<br>
- <br>
--PKG_CHECK_MODULES(LIBJS, [mozjs-78])<br>
-+PKG_CHECK_MODULES(LIBJS, [mozjs-91])<br>
- <br>
- AC_SUBST(LIBJS_CFLAGS)<br>
- AC_SUBST(LIBJS_CXXFLAGS)<br>
-diff --git a/meson.build b/meson.build<br>
-index b3702be..733bbff 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -126,7 +126,7 @@ expat_dep =3D dependency(&#39;expat&#39;)<br>
- assert(cc.has_header(&#39;expat.h&#39;, dependencies: expat_dep), &#39;Ca=
n\&#39;t find expat.h. Please install expat.&#39;)<br>
- assert(cc.has_function(&#39;XML_ParserCreate&#39;, dependencies: expat_de=
p), &#39;Can\&#39;t find expat library. Please install expat.&#39;)<br>
- <br>
--mozjs_dep =3D dependency(&#39;mozjs-78&#39;)<br>
-+mozjs_dep =3D dependency(&#39;mozjs-91&#39;)<br>
- <br>
- dbus_dep =3D dependency(&#39;dbus-1&#39;)<br>
- dbus_confdir =3D dbus_dep.get_pkgconfig_variable(&#39;datadir&#39;, defin=
e_variable: [&#39;datadir&#39;, pk_prefix / pk_datadir])=C2=A0 =C2=A0#chang=
ed from sysconfdir with respect to commit#8eada3836465838<br>
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-=
duktape-as-JS-engine.patch b/meta-oe/recipes-extended/polkit/polkit/0003-Ad=
ded-support-for-duktape-as-JS-engine.patch<br>
new file mode 100644<br>
index 000000000..e44e4f6e4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/polkit/polkit/0003-Added-support-for-duktape=
-as-JS-engine.patch<br>
@@ -0,0 +1,3463 @@<br>
+From eaecfb21e1bca42e99321cc731e21dbfc1ea0d0c Mon Sep 17 00:00:00 2001<br>
+From: Gustavo Lima Chaves &lt;<a href=3D"mailto:limachaves@gmail.com" targ=
et=3D"_blank">limachaves@gmail.com</a>&gt;<br>
+Date: Tue, 25 Jan 2022 09:43:21 +0000<br>
+Subject: [PATCH 3/3] Added support for duktape as JS engine<br>
+<br>
+Original author: Wu Xiaotian (@yetist)<br>
+Resurrection author, runaway-killer author: Gustavo Lima Chaves (@limachav=
es)<br></blockquote><div><br></div><span style=3D"color:rgb(80,0,80)">Upstr=
eam-Status: Backport [c7fc4e1b61f0fd82fc697c19c604a</span><span style=3D"co=
lor:rgb(80,0,80)">f7e9fb291a2]</span><br style=3D"color:rgb(80,0,80)"><div>=
<br></div><div>The right place for the Upstream-Status is on the commit mes=
sage and not on the commit comments ---</div><div>as in the commit comments=
 it will be lost when merged.</div><div><br></div><div>Jose</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
+<br>
+---<br>
+ .gitlab-ci.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
+ buildutil/ax_pthread.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 522 ++++++++<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A034 +-=
<br>
+ docs/man/polkit.xml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A016 +-<br>
+ meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
+ src/polkitbackend/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-<br>
+ src/polkitbackend/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +-<br>
+ src/polkitbackend/polkitbackendcommon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 530 +++++++++<br>
+ src/polkitbackend/polkitbackendcommon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 158 +++<br>
+ .../polkitbackendduktapeauthority.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1051 +++++++++++++++++<br>
+ .../polkitbackendjsauthority.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 721 +----------<br>
+ .../etc/polkit-1/rules.d/10-testing.rules=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 6 +-<br>
+ .../test-polkitbackendjsauthority.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
+ 14 files changed, 2399 insertions(+), 678 deletions(-)<br>
+ create mode 100644 buildutil/ax_pthread.m4<br>
+ create mode 100644 src/polkitbackend/polkitbackendcommon.c<br>
+ create mode 100644 src/polkitbackend/polkitbackendcommon.h<br>
+ create mode 100644 src/polkitbackend/polkitbackendduktapeauthority.c<br>
+<br>
+Upstream-Status: Backport [c7fc4e1b61f0fd82fc697c19c604af7e9fb291a2]<br>
+Dropped change to .gitlab-ci.yml and adapted <a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> due to other<br>
+patches in meta-oe.<br>
+<br>
+diff --git a/buildutil/ax_pthread.m4 b/buildutil/ax_pthread.m4<br>
+new file mode 100644<br>
+index 0000000..9f35d13<br>
+--- /dev/null<br>
++++ b/buildutil/ax_pthread.m4<br>
+@@ -0,0 +1,522 @@<br>
++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.gnu.org/software/auto=
conf-archive/ax_pthread.html" rel=3D"noreferrer" target=3D"_blank">https://=
www.gnu.org/software/autoconf-archive/ax_pthread.html</a><br>
++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
++#<br>
++# SYNOPSIS<br>
++#<br>
++#=C2=A0 =C2=A0AX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])<br>
++#<br>
++# DESCRIPTION<br>
++#<br>
++#=C2=A0 =C2=A0This macro figures out how to build C programs using POSIX =
threads. It<br>
++#=C2=A0 =C2=A0sets the PTHREAD_LIBS output variable to the threads librar=
y and linker<br>
++#=C2=A0 =C2=A0flags, and the PTHREAD_CFLAGS output variable to any specia=
l C compiler<br>
++#=C2=A0 =C2=A0flags that are needed. (The user can also force certain com=
piler<br>
++#=C2=A0 =C2=A0flags/libs to be tested by setting these environment variab=
les.)<br>
++#<br>
++#=C2=A0 =C2=A0Also sets PTHREAD_CC and PTHREAD_CXX to any special C compi=
ler that is<br>
++#=C2=A0 =C2=A0needed for multi-threaded programs (defaults to the value o=
f CC<br>
++#=C2=A0 =C2=A0respectively CXX otherwise). (This is necessary on e.g. AIX=
 to use the<br>
++#=C2=A0 =C2=A0special cc_r/CC_r compiler alias.)<br>
++#<br>
++#=C2=A0 =C2=A0NOTE: You are assumed to not only compile your program with=
 these flags,<br>
++#=C2=A0 =C2=A0but also to link with them as well. For example, you might =
link with<br>
++#=C2=A0 =C2=A0$PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_L=
IBS $LIBS<br>
++#=C2=A0 =C2=A0$PTHREAD_CXX $CXXFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREA=
D_LIBS $LIBS<br>
++#<br>
++#=C2=A0 =C2=A0If you are only building threaded programs, you may wish to=
 use these<br>
++#=C2=A0 =C2=A0variables in your default LIBS, CFLAGS, and CC:<br>
++#<br>
++#=C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;$PTHREAD_LIBS $LIBS&quot;<br>
++#=C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$CFLAGS $PTHREAD_CFLAGS&quot;<br>
++#=C2=A0 =C2=A0 =C2=A0CXXFLAGS=3D&quot;$CXXFLAGS $PTHREAD_CFLAGS&quot;<br>
++#=C2=A0 =C2=A0 =C2=A0CC=3D&quot;$PTHREAD_CC&quot;<br>
++#=C2=A0 =C2=A0 =C2=A0CXX=3D&quot;$PTHREAD_CXX&quot;<br>
++#<br>
++#=C2=A0 =C2=A0In addition, if the PTHREAD_CREATE_JOINABLE thread-attribut=
e constant<br>
++#=C2=A0 =C2=A0has a nonstandard name, this macro defines PTHREAD_CREATE_J=
OINABLE to<br>
++#=C2=A0 =C2=A0that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).<br>
++#<br>
++#=C2=A0 =C2=A0Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is fou=
nd and the<br>
++#=C2=A0 =C2=A0PTHREAD_PRIO_INHERIT symbol is defined when compiling with<=
br>
++#=C2=A0 =C2=A0PTHREAD_CFLAGS.<br>
++#<br>
++#=C2=A0 =C2=A0ACTION-IF-FOUND is a list of shell commands to run if a thr=
eads library<br>
++#=C2=A0 =C2=A0is found, and ACTION-IF-NOT-FOUND is a list of commands to =
run it if it<br>
++#=C2=A0 =C2=A0is not found. If ACTION-IF-FOUND is not specified, the defa=
ult action<br>
++#=C2=A0 =C2=A0will define HAVE_PTHREAD.<br>
++#<br>
++#=C2=A0 =C2=A0Please let the authors know if this macro fails on any plat=
form, or if<br>
++#=C2=A0 =C2=A0you have any other suggestions or comments. This macro was =
based on work<br>
++#=C2=A0 =C2=A0by SGJ on autoconf scripts for FFTW (<a href=3D"http://www.=
fftw.org/" rel=3D"noreferrer" target=3D"_blank">http://www.fftw.org/</a>) (=
with help<br>
++#=C2=A0 =C2=A0from M. Frigo), as well as ac_pthread and hb_pthread macros=
 posted by<br>
++#=C2=A0 =C2=A0Alejandro Forero Cuervo to the autoconf macro repository. W=
e are also<br>
++#=C2=A0 =C2=A0grateful for the helpful feedback of numerous users.<br>
++#<br>
++#=C2=A0 =C2=A0Updated for Autoconf 2.68 by Daniel Richard G.<br>
++#<br>
++# LICENSE<br>
++#<br>
++#=C2=A0 =C2=A0Copyright (c) 2008 Steven G. Johnson &lt;<a href=3D"mailto:=
stevenj@alum.mit.edu" target=3D"_blank">stevenj@alum.mit.edu</a>&gt;<br>
++#=C2=A0 =C2=A0Copyright (c) 2011 Daniel Richard G. &lt;skunk@iSKUNK.ORG&g=
t;<br>
++#=C2=A0 =C2=A0Copyright (c) 2019 Marc Stevens &lt;<a href=3D"mailto:marc.=
stevens@cwi.nl" target=3D"_blank">marc.stevens@cwi.nl</a>&gt;<br>
++#<br>
++#=C2=A0 =C2=A0This program is free software: you can redistribute it and/=
or modify it<br>
++#=C2=A0 =C2=A0under the terms of the GNU General Public License as publis=
hed by the<br>
++#=C2=A0 =C2=A0Free Software Foundation, either version 3 of the License, =
or (at your<br>
++#=C2=A0 =C2=A0option) any later version.<br>
++#<br>
++#=C2=A0 =C2=A0This program is distributed in the hope that it will be use=
ful, but<br>
++#=C2=A0 =C2=A0WITHOUT ANY WARRANTY; without even the implied warranty of<=
br>
++#=C2=A0 =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See th=
e GNU General<br>
++#=C2=A0 =C2=A0Public License for more details.<br>
++#<br>
++#=C2=A0 =C2=A0You should have received a copy of the GNU General Public L=
icense along<br>
++#=C2=A0 =C2=A0with this program. If not, see &lt;<a href=3D"https://www.g=
nu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/=
licenses/</a>&gt;.<br>
++#<br>
++#=C2=A0 =C2=A0As a special exception, the respective Autoconf Macro&#39;s=
 copyright owner<br>
++#=C2=A0 =C2=A0gives unlimited permission to copy, distribute and modify t=
he configure<br>
++#=C2=A0 =C2=A0scripts that are the output of Autoconf when processing the=
 Macro. You<br>
++#=C2=A0 =C2=A0need not follow the terms of the GNU General Public License=
 when using<br>
++#=C2=A0 =C2=A0or distributing such scripts, even though portions of the t=
ext of the<br>
++#=C2=A0 =C2=A0Macro appear in them. The GNU General Public License (GPL) =
does govern<br>
++#=C2=A0 =C2=A0all other use of the material that constitutes the Autoconf=
 Macro.<br>
++#<br>
++#=C2=A0 =C2=A0This special exception to the GPL applies to versions of th=
e Autoconf<br>
++#=C2=A0 =C2=A0Macro released by the Autoconf Archive. When you make and d=
istribute a<br>
++#=C2=A0 =C2=A0modified version of the Autoconf Macro, you may extend this=
 special<br>
++#=C2=A0 =C2=A0exception to the GPL to apply to your modified version as w=
ell.<br>
++<br>
++#serial 31<br>
++<br>
++AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])<br>
++AC_DEFUN([AX_PTHREAD], [<br>
++AC_REQUIRE([AC_CANONICAL_HOST])<br>
++AC_REQUIRE([AC_PROG_CC])<br>
++AC_REQUIRE([AC_PROG_SED])<br>
++AC_LANG_PUSH([C])<br>
++ax_pthread_ok=3Dno<br>
++<br>
++# We used to check for pthread.h first, but this fails if pthread.h<br>
++# requires special compiler flags (e.g. on Tru64 or Sequent).<br>
++# It gets checked for in the link test anyway.<br>
++<br>
++# First of all, check if the user has set any of the PTHREAD_LIBS,<br>
++# etcetera environment variables, and if threads linking works using<br>
++# them:<br>
++if test &quot;x$PTHREAD_CFLAGS$PTHREAD_LIBS&quot; !=3D &quot;x&quot;; the=
n<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_CC=3D&quot;$CC&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_CFLAGS=3D&quot;$CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_LIBS=3D&quot;$LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$PTHREAD_CC&quot; !=3D &qu=
ot;x&quot;], [CC=3D&quot;$PTHREAD_CC&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$PTHREAD_CXX&quot; !=3D &q=
uot;x&quot;], [CXX=3D&quot;$PTHREAD_CXX&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS $PTHREAD_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$PTHREAD_LIBS $LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([for pthread_join using $CC $=
PTHREAD_CFLAGS $PTHREAD_LIBS])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_joi=
n])], [ax_pthread_ok=3Dyes])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$ax_pthread_ok])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$ax_pthread_ok&quot; =3D &quot=
;xno&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_LIBS=3D&q=
uot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_CFLAGS=3D=
&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$ax_pthread_save_CC&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$ax_pthread_save_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$ax_pthread_save_LIBS&quot;<br>
++fi<br>
++<br>
++# We must check for the threads library under a number of different<br>
++# names; the ordering is very important because some systems<br>
++# (e.g. DEC) have both -lpthread and -lpthreads, where one of the<br>
++# libraries is broken (non-POSIX).<br>
++<br>
++# Create a list of thread flags to try. Items with a &quot;,&quot; contai=
n both<br>
++# C compiler flags (before &quot;,&quot;) and linker flags (after &quot;,=
&quot;). Other items<br>
++# starting with a &quot;-&quot; are C compiler flags, and remaining items=
 are<br>
++# library names, except for &quot;none&quot; which indicates that we try =
without<br>
++# any flags at all, and &quot;pthread-config&quot; which is a program ret=
urning<br>
++# the flags for the Pth emulation library.<br>
++<br>
++ax_pthread_flags=3D&quot;pthreads none -Kthread -pthread -pthreads -mthre=
ads pthread --thread-safe -mt pthread-config&quot;<br>
++<br>
++# The ordering *is* (sometimes) important.=C2=A0 Some notes on the<br>
++# individual items follow:<br>
++<br>
++# pthreads: AIX (must check this before -lpthread)<br>
++# none: in case threads are in libc; should be tried before -Kthread and<=
br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0other compiler flags to prevent continual com=
piler warnings<br>
++# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)<=
br>
++# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads), Tru64=
<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(Note: HP C rejects this with &=
quot;bad form for `-t&#39; option&quot;)<br>
++# -pthreads: Solaris/gcc (Note: HP C also rejects)<br>
++# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it<br>
++#=C2=A0 =C2=A0 =C2=A0 doesn&#39;t hurt to check since this sometimes defi=
nes pthreads and<br>
++#=C2=A0 =C2=A0 =C2=A0 -D_REENTRANT too), HP C (must be checked before -lp=
thread, which<br>
++#=C2=A0 =C2=A0 =C2=A0 is present but should not be used directly; and bef=
ore -mthreads,<br>
++#=C2=A0 =C2=A0 =C2=A0 because the compiler interprets this as &quot;-mt&q=
uot; + &quot;-hreads&quot;)<br>
++# -mthreads: Mingw32/gcc, Lynx/gcc<br>
++# pthread: Linux, etcetera<br>
++# --thread-safe: KAI C++<br>
++# pthread-config: use pthread-config program (for GNU Pth library)<br>
++<br>
++case $host_os in<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 freebsd*)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # -kthread: FreeBSD kernel threads (preferred=
 to -pthread since SMP-able)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # lthread: LinuxThreads port on FreeBSD (also=
 preferred to -pthread)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_flags=3D&quot;-kthread lthread $ax=
_pthread_flags&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpux*)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # From the cc(1) man page: &quot;[-mt] Sets v=
arious -D flags to enable<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # multi-threading and also sets -lpthread.&qu=
ot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_flags=3D&quot;-mt -pthread pthread=
 $ax_pthread_flags&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 openedition*)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # IBM z/OS requires a feature-test macro to b=
e defined in order to<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # enable POSIX threads at all, so give the us=
er a hint if this is<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # not set. (We don&#39;t define these ourselv=
es, as they can affect<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # other portions of the system API in unpredi=
ctable ways.)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !defined(_OPEN_THREADS) &am=
p;&amp; !defined(_UNIX03_THREADS)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AX_PTHREAD_ZOS_MISSING<br=
>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_MSG_WARN([IBM z/OS requires=
 -D_OPEN_THREADS or -D_UNIX03_THREADS to enable pthreads support.])])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 solaris*)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # On Solaris (at least, for some versions), l=
ibc contains stubbed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (non-functional) versions of the pthreads r=
outines, so link-based<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # tests will erroneously succeed. (N.B.: The =
stubs are missing<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pthread_cleanup_push, or rather a function =
called by this macro,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so we could check for that, but who knows w=
hether they&#39;ll stub<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that too in a future libc.)=C2=A0 So we&#39=
;ll check first for the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # standard Solaris way of linking pthreads (-=
mt -lpthread).<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_flags=3D&quot;-mt,-lpthread pthrea=
d $ax_pthread_flags&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++esac<br>
++<br>
++# Are we compiling with Clang?<br>
++<br>
++AC_CACHE_CHECK([whether $CC is Clang],<br>
++=C2=A0 =C2=A0 [ax_cv_PTHREAD_CLANG],<br>
++=C2=A0 =C2=A0 [ax_cv_PTHREAD_CLANG=3Dno<br>
++=C2=A0 =C2=A0 =C2=A0# Note that Autoconf sets GCC=3Dyes for Clang as well=
 as GCC<br>
++=C2=A0 =C2=A0 =C2=A0if test &quot;x$GCC&quot; =3D &quot;xyes&quot;; then<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [/* Note: Clang 2.7 lacks __cla=
ng_[a-z]+__ */<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if defined(__clang__) &amp;&am=
p; defined(__llvm__)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AX_PTHREAD_CC_IS_CLANG<br=
>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_CLANG=3Dyes])<br=
>
++=C2=A0 =C2=A0 =C2=A0fi<br>
++=C2=A0 =C2=A0 ])<br>
++ax_pthread_clang=3D&quot;$ax_cv_PTHREAD_CLANG&quot;<br>
++<br>
++<br>
++# GCC generally uses -pthread, or -pthreads on some platforms (e.g. SPARC=
)<br>
++<br>
++# Note that for GCC and Clang -pthread generally implies -lpthread,<br>
++# except when -nostdlib is passed.<br>
++# This is problematic using libtool to build C++ shared libraries with pt=
hread:<br>
++# [1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D25460" re=
l=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cg=
i?id=3D25460</a><br>
++# [2] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D661333" re=
l=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi=
?id=3D661333</a><br>
++# [3] <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D4685=
55" rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/bu=
greport.cgi?bug=3D468555</a><br>
++# To solve this, first try -pthread together with -lpthread for GCC<br>
++<br>
++AS_IF([test &quot;x$GCC&quot; =3D &quot;xyes&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 [ax_pthread_flags=3D&quot;-pthread,-lpthread -pthrea=
d -pthreads $ax_pthread_flags&quot;])<br>
++<br>
++# Clang takes -pthread (never supported any other flag), but we&#39;ll tr=
y with -lpthread first<br>
++<br>
++AS_IF([test &quot;x$ax_pthread_clang&quot; =3D &quot;xyes&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 [ax_pthread_flags=3D&quot;-pthread,-lpthread -pthrea=
d&quot;])<br>
++<br>
++<br>
++# The presence of a feature test macro requesting re-entrant function<br>
++# definitions is, on some systems, a strong hint that pthreads support is=
<br>
++# correctly enabled<br>
++<br>
++case $host_os in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin* | hpux* | linux* | osf* | solaris*)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_check_macro=3D&quot;_REENTRANT&quo=
t;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 aix*)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_check_macro=3D&quot;_THREAD_SAFE&q=
uot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_check_macro=3D&quot;--&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++esac<br>
++AS_IF([test &quot;x$ax_pthread_check_macro&quot; =3D &quot;x--&quot;],<br=
>
++=C2=A0 =C2=A0 =C2=A0 [ax_pthread_check_cond=3D0],<br>
++=C2=A0 =C2=A0 =C2=A0 [ax_pthread_check_cond=3D&quot;!defined($ax_pthread_=
check_macro)&quot;])<br>
++<br>
++<br>
++if test &quot;x$ax_pthread_ok&quot; =3D &quot;xno&quot;; then<br>
++for ax_pthread_try_flag in $ax_pthread_flags; do<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $ax_pthread_try_flag in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 none)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([=
whether pthreads work without any flags])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *,*)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_CFLAGS=3D=
`echo $ax_pthread_try_flag | sed &quot;s/^\(.*\),\(.*\)$/\1/&quot;`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_LIBS=3D`e=
cho $ax_pthread_try_flag | sed &quot;s/^\(.*\),\(.*\)$/\2/&quot;`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([=
whether pthreads work with &quot;$PTHREAD_CFLAGS&quot; and &quot;$PTHREAD_L=
IBS&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -*)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([=
whether pthreads work with $ax_pthread_try_flag])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_CFLAGS=3D=
&quot;$ax_pthread_try_flag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread-config)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_PROG([ax=
_pthread_config], [pthread-config], [yes], [no])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot=
;x$ax_pthread_config&quot; =3D &quot;xno&quot;], [continue])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_CFLAGS=3D=
&quot;`pthread-config --cflags`&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_LIBS=3D&q=
uot;`pthread-config --ldflags` `pthread-config --libs`&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING([=
for the pthreads library -l$ax_pthread_try_flag])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_LIBS=3D&q=
uot;-l$ax_pthread_try_flag&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_CFLAGS=3D&quot;$CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_LIBS=3D&quot;$LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS $PTHREAD_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$PTHREAD_LIBS $LIBS&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check for various functions.=C2=A0 We must =
include pthread.h,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # since some functions may be macros.=C2=A0 (=
On the Sequent, we<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # need a special flag -Kthread to make this h=
eader compile.)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We check for pthread_join because it is in =
-lpthread on IRIX<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # while pthread_create is in libc.=C2=A0 We c=
heck for pthread_attr_init<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # due to DEC craziness with -lpthreads.=C2=A0=
 We check for<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # pthread_cleanup_push because it is one of t=
he few pthread<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # functions on Solaris that doesn&#39;t have =
a non-functional libc stub.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We try pthread_create on general principles=
.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include &lt=
;pthread.h&gt;<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if $ax_pthread_check_cond<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 error &quot;$ax_pthread_check_macro must be defined&quot;<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 static void *some_global =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 static void routine(void *a)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* To avoid any unused-parameter or<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unused-but-set-parameter warning.=C2=
=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0some_global =3D a;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 static void *start_routine(void *a) { return a; }],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[pthread_t th; pthread_attr_t attr;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pthread_create(&amp;th, 0, start_routine, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pthread_join(th, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pthread_attr_init(&amp;attr);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pthread_cleanup_push(routine, 0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pthread_cleanup_pop(0) /* ; */])],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_pthread_ok=3Dyes],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$ax_pthread_save_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$ax_pthread_save_LIBS&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([$ax_pthread_ok])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$ax_pthread_ok&quot; =3D &=
quot;xyes&quot;], [break])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_LIBS=3D&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PTHREAD_CFLAGS=3D&quot;&quot;<br>
++done<br>
++fi<br>
++<br>
++<br>
++# Clang needs special handling, because older versions handle the -pthrea=
d<br>
++# option in a rather... idiosyncratic way<br>
++<br>
++if test &quot;x$ax_pthread_clang&quot; =3D &quot;xyes&quot;; then<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clang takes -pthread; it has never supporte=
d any other flag<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (Note 1: This will need to be revisited if =
a system that Clang<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # supports has POSIX threads in a separate li=
brary.=C2=A0 This tends not<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to be the way of modern systems, but it&#39=
;s conceivable.)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (Note 2: On some systems, notably Darwin, -=
pthread is not needed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to get POSIX threads support; the API is al=
ways present and<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # active.=C2=A0 We could reasonably leave PTH=
READ_CFLAGS empty.=C2=A0 But<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # -pthread does define _REENTRANT, and while =
the Darwin headers<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ignore this macro, third-party headers migh=
t not.)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # However, older versions of Clang make a poi=
nt of warning the user<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that, in an invocation where only linking a=
nd no compilation is<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # taking place, the -pthread option has no ef=
fect (&quot;argument unused<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # during compilation&quot;).=C2=A0 They expec=
t -pthread to be passed in only<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # when source code is being compiled.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Problem is, this is at odds with the way Au=
tomake and most other<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # C build frameworks function, which is that =
the same flags used in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # compilation (CFLAGS) are also used in linki=
ng.=C2=A0 Many systems<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # supported by AX_PTHREAD require exactly thi=
s for POSIX threads<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # support, and in fact it is often not straig=
htforward to specify a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # flag that is used only in the compilation p=
hase and not in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # linking.=C2=A0 Such a scenario is extremely=
 rare in practice.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Even though use of the -pthread flag in lin=
king would only print<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # a warning, this can be a nuisance for well-=
run software projects<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that build with -Werror.=C2=A0 So if the ac=
tive version of Clang has<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this misfeature, we search for an option to=
 squash it.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([whether Clang needs flag to p=
revent &quot;argument unused&quot; warning when linking with -pthread],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_CLANG_NO_WARN_FL=
AG],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_CLANG_NO_WARN_FL=
AG=3Dunknown<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create an alternate ver=
sion of $ac_link that compiles and<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# links in two steps (.c =
-&gt; .o, .o -&gt; exe) instead of one<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# (.c -&gt; exe), because=
 the warning occurs only in the second<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# step<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_save_ac_link=
=3D&quot;$ac_link&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_sed=3D&#39;s/c=
onftest\.\$ac_ext/conftest.$ac_objext/g&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_link_step=3D`A=
S_ECHO([&quot;$ac_link&quot;]) | sed &quot;$ax_pthread_sed&quot;`<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_2step_ac_link=
=3D&quot;($ac_compile) &amp;&amp; (echo =3D=3D=3D=3D &gt;&amp;5) &amp;&amp;=
 ($ax_pthread_link_step)&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_save_CFLAGS=3D=
&quot;$CFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for ax_pthread_try in &#3=
9;&#39; -Qunused-arguments -Wno-unused-command-line-argument unknown; do<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot=
;x$ax_pthread_try&quot; =3D &quot;xunknown&quot;], [break])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;-W=
error -Wunknown-warning-option $ax_pthread_try -pthread $ax_pthread_save_CF=
LAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ac_link=3D&quot;$=
ax_pthread_save_ac_link&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE([A=
C_LANG_SOURCE([[int main(void){return 0;}]])],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ac=
_link=3D&quot;$ax_pthread_2step_ac_link&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[break])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_link=3D&quot;$ax_pthre=
ad_save_ac_link&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$ax_pthrea=
d_save_CFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_IF([test &quot;x$ax_pt=
hread_try&quot; =3D &quot;x&quot;], [ax_pthread_try=3Dno])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_cv_PTHREAD_CLANG_NO_WA=
RN_FLAG=3D&quot;$ax_pthread_try&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot;$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG&=
quot; in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no | unknown) ;;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *) PTHREAD_CFLAGS=
=3D&quot;$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG $PTHREAD_CFLAGS&quot; ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
++<br>
++fi # $ax_pthread_clang =3D yes<br>
++<br>
++<br>
++<br>
++# Various other checks:<br>
++if test &quot;x$ax_pthread_ok&quot; =3D &quot;xyes&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_CFLAGS=3D&quot;$CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_save_LIBS=3D&quot;$LIBS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS $PTHREAD_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$PTHREAD_LIBS $LIBS&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Detect AIX lossage: JOINABLE attribute is c=
alled UNDETACHED.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for joinable pthread attribut=
e],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_JOINABLE_ATTR],<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_JOINABLE_ATTR=3D=
unknown<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for ax_pthread_attr in PT=
HREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_LINK_IFE=
LSE([AC_LANG_PROGRAM([#include &lt;pthread.h&gt;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[int attr =3D $ax_pthread_attr; return attr /* ;=
 */])],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_JOINABLE_ATTR=3D$ax_p=
thread_attr; break],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$ax_cv_PTHREAD_JOINABLE_AT=
TR&quot; !=3D &quot;xunknown&quot; &amp;&amp; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$ax_cv=
_PTHREAD_JOINABLE_ATTR&quot; !=3D &quot;xPTHREAD_CREATE_JOINABLE&quot; &amp=
;&amp; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$ax_pt=
hread_joinable_attr_defined&quot; !=3D &quot;xyes&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_DEFINE_UNQUOTED([PTH=
READ_CREATE_JOINABLE],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [$ax_cv_PTHREAD_JOINABLE_ATTR=
],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Define to necessary symbol i=
f this constant<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uses a non-standard nam=
e on your system.])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_joinabl=
e_attr_defined=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([whether more special flags ar=
e required for pthreads],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_SPECIAL_FLAGS],<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_SPECIAL_FLAGS=3D=
no<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case $host_os in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0solaris*)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_cv_PTHREAD_SPECIAL_FLA=
GS=3D&quot;-D_POSIX_PTHREAD_SEMANTICS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$ax_cv_PTHREAD_SPECIAL_FLA=
GS&quot; !=3D &quot;xno&quot; &amp;&amp; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$ax_pt=
hread_special_flags_added&quot; !=3D &quot;xyes&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [PTHREAD_CFLAGS=3D&quot;=
$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_CFLAGS&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_special=
_flags_added=3Dyes])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_PRIO_INHERIT],<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_LINK_IFELSE([AC_LANG_PROGRA=
M([[#include &lt;pthread.h&gt;]],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0[[int i =3D PTHREAD_PRIO_INHERIT;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return i;]])],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_PRIO_INHERIT=3Dyes],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [ax_cv_PTHREAD_PRIO_INHERIT=3Dno])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_IF([test &quot;x$ax_cv_PTHREAD_PRIO_INHERI=
T&quot; =3D &quot;xyes&quot; &amp;&amp; \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$ax_pt=
hread_prio_inherit_defined&quot; !=3D &quot;xyes&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_DEFINE([HAVE_PTHREAD=
_PRIO_INHERIT], [1], [Have PTHREAD_PRIO_INHERIT.])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ax_pthread_prio_in=
herit_defined=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$ax_pthread_save_CFLAGS&quot;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$ax_pthread_save_LIBS&quot;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # More AIX lossage: compile with *_r variant<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$GCC&quot; !=3D &quot;xyes&quo=
t;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aix*)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AS_CASE([&quot;x/=
$CC&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [x*=
/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/xlc|x*/xlc_v6|x*/xlc128=
|x*/xlc128_v6],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [#h=
andle absolute path differently from PATH based program lookup<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0AS_CASE([&quot;x$CC&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[x/*],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC=3D&quot;${C=
C}_r&quot;])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AS_IF([test &quot;x${CXX}&quot; !=3D &quot;x&quot;], [AS_I=
F([AS_EXECUTABLE_P([${CXX}_r])],[PTHREAD_CXX=3D&quot;${CXX}_r&quot;])])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0[<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AS_IF([test &quot;x${CXX}&quot; !=3D &quot;x&quot;], [AC_C=
HECK_PROGS([PTHREAD_CXX],[${CXX}_r],[$CXX])])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
++fi<br>
++<br>
++test -n &quot;$PTHREAD_CC&quot; || PTHREAD_CC=3D&quot;$CC&quot;<br>
++test -n &quot;$PTHREAD_CXX&quot; || PTHREAD_CXX=3D&quot;$CXX&quot;<br>
++<br>
++AC_SUBST([PTHREAD_LIBS])<br>
++AC_SUBST([PTHREAD_CFLAGS])<br>
++AC_SUBST([PTHREAD_CC])<br>
++AC_SUBST([PTHREAD_CXX])<br>
++<br>
++# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:<br>
++if test &quot;x$ax_pthread_ok&quot; =3D &quot;xyes&quot;; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[D=
efine if you have POSIX threads libraries and header files.])],[$1])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
++else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ax_pthread_ok=3Dno<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $2<br>
++fi<br>
++AC_LANG_POP<br>
++])dnl AX_PTHREAD<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index b625743..bbf4768 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -80,11 +80,22 @@ PKG_CHECK_MODULES(GLIB, [gmodule-2.0 gio-unix-2.0 &gt;=
=3D 2.30.0])<br>
+ AC_SUBST(GLIB_CFLAGS)<br>
+ AC_SUBST(GLIB_LIBS)<br>
+ <br>
+-PKG_CHECK_MODULES(LIBJS, [mozjs-78])<br>
+-<br>
+-AC_SUBST(LIBJS_CFLAGS)<br>
+-AC_SUBST(LIBJS_CXXFLAGS)<br>
+-AC_SUBST(LIBJS_LIBS)<br>
++dnl ---------------------------------------------------------------------=
------<br>
++dnl - Check javascript backend<br>
++dnl ---------------------------------------------------------------------=
------<br>
++AC_ARG_WITH(duktape, AS_HELP_STRING([--with-duktape],[Use Duktape as java=
script backend]),with_duktape=3Dyes,with_duktape=3Dno)<br>
++AS_IF([test x${with_duktape} =3D=3D xyes], [<br>
++=C2=A0 PKG_CHECK_MODULES(LIBJS, [duktape &gt;=3D 2.2.0 ])<br>
++=C2=A0 AC_SUBST(LIBJS_CFLAGS)<br>
++=C2=A0 AC_SUBST(LIBJS_LIBS)<br>
++], [<br>
++=C2=A0 PKG_CHECK_MODULES(LIBJS, [mozjs-78])<br>
++<br>
++=C2=A0 AC_SUBST(LIBJS_CFLAGS)<br>
++=C2=A0 AC_SUBST(LIBJS_CXXFLAGS)<br>
++=C2=A0 AC_SUBST(LIBJS_LIBS)<br>
++])<br>
++AM_CONDITIONAL(USE_DUKTAPE, [test x$with_duktape =3D=3D xyes], [Using duk=
tape as javascript engine library])<br>
+ <br>
+ EXPAT_LIB=3D&quot;&quot;<br>
+ AC_ARG_WITH(expat, [=C2=A0 --with-expat=3D&lt;dir&gt;=C2=A0 =C2=A0 =C2=A0=
 Use expat from here],<br>
+@@ -100,6 +111,12 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS=3D&qu=
ot;-lexpat&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [AC_MSG_ERROR([Can&#39;t find ex=
pat library. Please install expat.])])<br>
+ AC_SUBST(EXPAT_LIBS)<br>
+ <br>
++AX_PTHREAD([], [AC_MSG_ERROR([Cannot find the way to enable pthread suppo=
rt.])])<br>
++LIBS=3D&quot;$PTHREAD_LIBS $LIBS&quot;<br>
++CFLAGS=3D&quot;$CFLAGS $PTHREAD_CFLAGS&quot;<br>
++CC=3D&quot;$PTHREAD_CC&quot;<br>
++AC_CHECK_FUNCS([pthread_condattr_setclock])<br>
++<br>
+ AC_CHECK_FUNCS(clearenv fdatasync setnetgrent)<br>
+ <br>
+ if test &quot;x$GCC&quot; =3D &quot;xyes&quot;; then<br>
+@@ -581,6 +598,13 @@ echo &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAM support:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${have_pam}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemdsystemunitdir:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0${systemdsystemunitdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkitd user:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0${POLKITD_USER}&quot;<br>
++if test &quot;x${with_duktape}&quot; =3D xyes; then<br>
++echo &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Javascript engine:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Duktape&quot;<br>
++else<br>
++echo &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Javascript engine:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Mozjs&quot;<br>
++fi<br>
+ <br>
+ if test &quot;$have_pam&quot; =3D yes ; then<br>
+ echo &quot;<br>
+diff --git a/docs/man/polkit.xml b/docs/man/polkit.xml<br>
+index 99aa474..90715a5 100644<br>
+--- a/docs/man/polkit.xml<br>
++++ b/docs/man/polkit.xml<br>
+@@ -639,7 +639,9 @@ polkit.Result =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If user-provided code takes a long time =
to execute, an exception<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be thrown which normally results in=
 the function being<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0terminated (the current limit is 15 seco=
nds). This is used to<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 catch runaway scripts.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 catch runaway scripts. If the duktape JavaScr=
ipt backend is<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 compiled in, instead of mozjs, no exception w=
ill be thrown=E2=80=94the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 script will be killed right away (same timeou=
t).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
+diff --git a/meson.build b/meson.build<br>
+index b3702be..7506231 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -126,7 +126,18 @@ expat_dep =3D dependency(&#39;expat&#39;)<br>
+ assert(cc.has_header(&#39;expat.h&#39;, dependencies: expat_dep), &#39;Ca=
n\&#39;t find expat.h. Please install expat.&#39;)<br>
+ assert(cc.has_function(&#39;XML_ParserCreate&#39;, dependencies: expat_de=
p), &#39;Can\&#39;t find expat library. Please install expat.&#39;)<br>
+ <br>
+-mozjs_dep =3D dependency(&#39;mozjs-78&#39;)<br>
++duktape_req_version =3D &#39;&gt;=3D 2.2.0&#39;<br>
++<br>
++js_engine =3D get_option(&#39;js_engine&#39;)<br>
++if js_engine =3D=3D &#39;duktape&#39;<br>
++=C2=A0 js_dep =3D dependency(&#39;duktape&#39;, version: duktape_req_vers=
ion)<br>
++=C2=A0 libm_dep =3D cc.find_library(&#39;m&#39;)<br>
++=C2=A0 thread_dep =3D dependency(&#39;threads&#39;)<br>
++=C2=A0 func =3D &#39;pthread_condattr_setclock&#39;<br>
++=C2=A0 config_h.set(&#39;HAVE_&#39; + func.to_upper(), cc.has_function(fu=
nc, prefix : &#39;#include &lt;pthread.h&gt;&#39;))<br>
++elif js_engine =3D=3D &#39;mozjs&#39;<br>
++=C2=A0 js_dep =3D dependency(&#39;mozjs-78&#39;)<br>
++endif<br>
+ <br>
+ dbus_dep =3D dependency(&#39;dbus-1&#39;)<br>
+ dbus_confdir =3D dbus_dep.get_pkgconfig_variable(&#39;datadir&#39;, defin=
e_variable: [&#39;datadir&#39;, pk_prefix / pk_datadir])=C2=A0 =C2=A0#chang=
ed from sysconfdir with respect to commit#8eada3836465838<br>
+@@ -350,6 +361,9 @@ if enable_logind<br>
+=C2=A0 =C2=A0output +=3D &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemdsystemuni=
tdir:=C2=A0 =C2=A0 =C2=A0&#39; + systemd_systemdsystemunitdir + &#39;\n&#39=
;<br>
+ endif<br>
+ output +=3D &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 polkitd user:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39; + polkitd_user + &#39; \n&#39;<br>
++output +=3D &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Javascript engine:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39; + js_engine + &#39;\n&#39;<br>
++if enable_logind<br>
++endif<br>
+ output +=3D &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM support:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; + enable_pam.to_string() + &#39;\n=
\n&#39;<br>
+ if enable_pam<br>
+=C2=A0 =C2=A0output +=3D &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAM file auth:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; + pam_conf[&#39;PAM_FILE_IN=
CLUDE_AUTH&#39;] + &#39;\n&#39;<br>
+diff --git a/meson_options.txt b/meson_options.txt<br>
+index 25e3e77..76aa311 100644<br>
+--- a/meson_options.txt<br>
++++ b/meson_options.txt<br>
+@@ -16,3 +16,4 @@ option(&#39;introspection&#39;, type: &#39;boolean&#39;,=
 value: true, description: &#39;Enable intro<br>
+ <br>
+ option(&#39;gtk_doc&#39;, type: &#39;boolean&#39;, value: false, descript=
ion: &#39;use gtk-doc to build documentation&#39;)<br>
+ option(&#39;man&#39;, type: &#39;boolean&#39;, value: false, description:=
 &#39;build manual pages&#39;)<br>
++option(&#39;js_engine&#39;, type: &#39;combo&#39;, choices: [&#39;mozjs&#=
39;, &#39;duktape&#39;], value: &#39;duktape&#39;, description: &#39;javasc=
ript engine&#39;)<br>
+diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.am=
<br>
+index 7e3c080..935fb98 100644<br>
+--- a/src/polkitbackend/Makefile.am<br>
++++ b/src/polkitbackend/Makefile.am<br>
+@@ -17,6 +17,8 @@ AM_CPPFLAGS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPACKAGE_LIB_DIR=3D\&quot;&quot;$(libdi=
r)&quot;\&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_POSIX_PTHREAD_SEMANTICS=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_REENTRANT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_XOPEN_SOURCE=3D700=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -D_GNU_SOURCE=3D1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
+ <br>
+ noinst_LTLIBRARIES=3D<a href=3D"http://libpolkit-backend-1.la" rel=3D"nor=
eferrer" target=3D"_blank">libpolkit-backend-1.la</a><br>
+@@ -31,9 +33,10 @@ libpolkit_backend_1_la_SOURCES =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackend.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendtypes.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendprivate.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 polkitbackendcommon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendcommon.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendauthority.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkitbackendauthority.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendinteractiveauthority.h=C2=A0 =C2=
=A0 =C2=A0polkitbackendinteractiveauthority.c=C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 =C2=A0 polkitbackendjsauthority.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 polkitbackendjsauthority.cpp=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 polkitbackendjsauthority.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendactionpool.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendactionpool.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendactionlookup.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkitbackendactionlookup.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
+@@ -51,19 +54,27 @@ libpolkit_backend_1_la_CFLAGS =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D_POLKIT_BACKEND_COMPILATION=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GLIB_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBSYSTEMD_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+-=C2=A0 =C2=A0 =C2=A0 $(LIBJS_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 $(LIBJS_CFLAGS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
+ <br>
+ libpolkit_backend_1_la_CXXFLAGS =3D $(libpolkit_backend_1_la_CFLAGS)<br>
+ <br>
+ libpolkit_backend_1_la_LIBADD =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(GLIB_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DUKTAPE_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBSYSTEMD_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(top_builddir)/src/polkit/<a href=3D"http://li=
bpolkit-gobject-1.la" rel=3D"noreferrer" target=3D"_blank">libpolkit-gobjec=
t-1.la</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EXPAT_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+-=C2=A0 =C2=A0 =C2=A0 $(LIBJS_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
++=C2=A0 =C2=A0 =C2=A0 $(LIBJS_LIBS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
+ <br>
++if USE_DUKTAPE<br>
++libpolkit_backend_1_la_SOURCES +=3D polkitbackendduktapeauthority.c<br>
++libpolkit_backend_1_la_LIBADD +=3D -lm<br>
++else<br>
++libpolkit_backend_1_la_SOURCES +=3D polkitbackendjsauthority.cpp<br>
++endif<br>
++<br>
+ rulesdir =3D $(sysconfdir)/polkit-1/rules.d<br>
+ rules_DATA =3D 50-default.rules<br>
+ <br>
+diff --git a/src/polkitbackend/meson.build b/src/polkitbackend/meson.build=
<br>
+index 93c3c34..99f8e33 100644<br>
+--- a/src/polkitbackend/meson.build<br>
++++ b/src/polkitbackend/meson.build<br>
+@@ -4,8 +4,8 @@ sources =3D files(<br>
+=C2=A0 =C2=A0&#39;polkitbackendactionlookup.c&#39;,<br>
+=C2=A0 =C2=A0&#39;polkitbackendactionpool.c&#39;,<br>
+=C2=A0 =C2=A0&#39;polkitbackendauthority.c&#39;,<br>
++=C2=A0 &#39;polkitbackendcommon.c&#39;,<br>
+=C2=A0 =C2=A0&#39;polkitbackendinteractiveauthority.c&#39;,<br>
+-=C2=A0 &#39;polkitbackendjsauthority.cpp&#39;,<br>
+ )<br>
+ <br>
+ output =3D &#39;initjs.h&#39;<br>
+@@ -21,7 +21,7 @@ sources +=3D custom_target(<br>
+ deps =3D [<br>
+=C2=A0 =C2=A0expat_dep,<br>
+=C2=A0 =C2=A0libpolkit_gobject_dep,<br>
+-=C2=A0 mozjs_dep,<br>
++=C2=A0 js_dep,<br>
+ ]<br>
+ <br>
+ c_flags =3D [<br>
+@@ -29,8 +29,18 @@ c_flags =3D [<br>
+=C2=A0 =C2=A0&#39;-D_POLKIT_BACKEND_COMPILATION&#39;,<br>
+=C2=A0 =C2=A0&#39;-DPACKAGE_DATA_DIR=3D&quot;@0@&quot;&#39;.format(pk_pref=
ix / pk_datadir),<br>
+=C2=A0 =C2=A0&#39;-DPACKAGE_SYSCONF_DIR=3D&quot;@0@&quot;&#39;.format(pk_p=
refix / pk_sysconfdir),<br>
++=C2=A0 &#39;-D_XOPEN_SOURCE=3D700&#39;,<br>
++=C2=A0 &#39;-D_GNU_SOURCE=3D1&#39;,<br>
+ ]<br>
+ <br>
++if js_engine =3D=3D &#39;duktape&#39;<br>
++=C2=A0 sources +=3D files(&#39;polkitbackendduktapeauthority.c&#39;)<br>
++=C2=A0 deps +=3D libm_dep<br>
++=C2=A0 deps +=3D thread_dep<br>
++elif js_engine =3D=3D &#39;mozjs&#39;<br>
++=C2=A0 sources +=3D files(&#39;polkitbackendjsauthority.cpp&#39;)<br>
++endif<br>
++<br>
+ if enable_logind<br>
+=C2=A0 =C2=A0sources +=3D files(&#39;polkitbackendsessionmonitor-systemd.c=
&#39;)<br>
+ <br>
+diff --git a/src/polkitbackend/polkitbackendcommon.c b/src/polkitbackend/p=
olkitbackendcommon.c<br>
+new file mode 100644<br>
+index 0000000..6783dff<br>
+--- /dev/null<br>
++++ b/src/polkitbackend/polkitbackendcommon.c<br>
+@@ -0,0 +1,530 @@<br>
++/*<br>
++ * Copyright (C) 2008 Red Hat, Inc.<br>
++ *<br>
++ * This library is free software; you can redistribute it and/or<br>
++ * modify it under the terms of the GNU Lesser General Public<br>
++ * License as published by the Free Software Foundation; either<br>
++ * version 2 of the License, or (at your option) any later version.<br>
++ *<br>
++ * This library is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
<br>
++ * Lesser General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU Lesser General<br>
++ * Public License along with this library; if not, write to the<br>
++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,<br>
++ * Boston, MA 02111-1307, USA.<br>
++ *<br>
++ * Author: David Zeuthen &lt;<a href=3D"mailto:davidz@redhat.com" target=
=3D"_blank">davidz@redhat.com</a>&gt;<br>
++ */<br>
++<br>
++#include &quot;polkitbackendcommon.h&quot;<br>
++<br>
++static void<br>
++utils_child_watch_from_release_cb (GPid=C2=A0 =C2=A0 =C2=A0pid,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=
=A0status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer user_data)<br>
++{<br>
++}<br>
++<br>
++static void<br>
++utils_spawn_data_free (UtilsSpawnData *data)<br>
++{<br>
++=C2=A0 if (data-&gt;timeout_source !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;timeout_source);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;timeout_source =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 /* Nuke the child, if necessary */<br>
++=C2=A0 if (data-&gt;child_watch_source !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_watch_source);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_watch_source =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_pid !=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 GSource *source;<br>
++=C2=A0 =C2=A0 =C2=A0 kill (data-&gt;child_pid, SIGTERM);<br>
++=C2=A0 =C2=A0 =C2=A0 /* OK, we need to reap for the child ourselves - we =
don&#39;t want<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* to use waitpid() because that might block th=
e calling<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* thread (the child might handle SIGTERM and u=
se several<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* seconds for cleanup/rollback).<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* So we use GChildWatch instead.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Avoid taking a references to ourselves. but =
note that we need<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* to pass the GSource so we can nuke it once h=
andled.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 source =3D g_child_watch_source_new (data-&gt;child_=
pid);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_set_callback (source,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(GSourceFunc) utils_child_watch_from_release=
_cb,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(GDestroyNotify) g_source_destroy);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_attach (source, data-&gt;main_context);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_unref (source);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_pid =3D 0;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_stdout !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_free (data-&gt;child_stdout, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_stderr !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_free (data-&gt;child_stderr, TRUE);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_stdout_channel !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_io_channel_unref (data-&gt;child_stdout_channel);<=
br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_channel =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (data-&gt;child_stderr_channel !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_io_channel_unref (data-&gt;child_stderr_channel);<=
br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_channel =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_stdout_source !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_stdout_source);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_source =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (data-&gt;child_stderr_source !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_stderr_source);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_source =3D NULL;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;child_stdout_fd !=3D -1)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_warn_if_fail (close (data-&gt;child_stdout_fd) =3D=
=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_fd =3D -1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (data-&gt;child_stderr_fd !=3D -1)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_warn_if_fail (close (data-&gt;child_stderr_fd) =3D=
=3D 0);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_fd =3D -1;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;cancellable_handler_id &gt; 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_cancellable_disconnect (data-&gt;cancellable, data=
-&gt;cancellable_handler_id);<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;cancellable_handler_id =3D 0;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (data-&gt;main_context !=3D NULL)<br>
++=C2=A0 =C2=A0 g_main_context_unref (data-&gt;main_context);<br>
++<br>
++=C2=A0 if (data-&gt;cancellable !=3D NULL)<br>
++=C2=A0 =C2=A0 g_object_unref (data-&gt;cancellable);<br>
++<br>
++=C2=A0 g_slice_free (UtilsSpawnData, data);<br>
++}<br>
++<br>
++/* called in the thread where @cancellable was cancelled */<br>
++static void<br>
++utils_on_cancelled (GCancellable *cancellable,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpo=
inter=C2=A0 =C2=A0 =C2=A0 user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
++=C2=A0 GError *error;<br>
++<br>
++=C2=A0 error =3D NULL;<br>
++=C2=A0 g_warn_if_fail (g_cancellable_set_error_if_cancelled (cancellable,=
 &amp;error));<br>
++=C2=A0 g_simple_async_result_take_error (data-&gt;simple, error);<br>
++=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
++=C2=A0 g_object_unref (data-&gt;simple);<br>
++}<br>
++<br>
++static gboolean<br>
++utils_timeout_cb (gpointer user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
++<br>
++=C2=A0 data-&gt;timed_out =3D TRUE;<br>
++<br>
++=C2=A0 /* ok, timeout is history, make sure we don&#39;t free it in spawn=
_data_free() */<br>
++=C2=A0 data-&gt;timeout_source =3D NULL;<br>
++<br>
++=C2=A0 /* we&#39;re done */<br>
++=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
++=C2=A0 g_object_unref (data-&gt;simple);<br>
++<br>
++=C2=A0 return FALSE; /* remove source */<br>
++}<br>
++<br>
++static void<br>
++utils_child_watch_cb (GPid=C2=A0 =C2=A0 =C2=A0pid,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gint=C2=A0 =C2=A0 =C2=A0status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpointer user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
++=C2=A0 gchar *buf;<br>
++=C2=A0 gsize buf_size;<br>
++<br>
++=C2=A0 if (g_io_channel_read_to_end (data-&gt;child_stdout_channel, &amp;=
buf, &amp;buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_append_len (data-&gt;child_stdout, buf, buf=
_size);<br>
++=C2=A0 =C2=A0 =C2=A0 g_free (buf);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (g_io_channel_read_to_end (data-&gt;child_stderr_channel, &amp;=
buf, &amp;buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_append_len (data-&gt;child_stderr, buf, buf=
_size);<br>
++=C2=A0 =C2=A0 =C2=A0 g_free (buf);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 data-&gt;exit_status =3D status;<br>
++<br>
++=C2=A0 /* ok, child watch is history, make sure we don&#39;t free it in s=
pawn_data_free() */<br>
++=C2=A0 data-&gt;child_pid =3D 0;<br>
++=C2=A0 data-&gt;child_watch_source =3D NULL;<br>
++<br>
++=C2=A0 /* we&#39;re done */<br>
++=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
++=C2=A0 g_object_unref (data-&gt;simple);<br>
++}<br>
++<br>
++static gboolean<br>
++utils_read_child_stderr (GIOChannel *channel,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GIOCondition condition,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpointer user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
++=C2=A0 gchar buf[1024];<br>
++=C2=A0 gsize bytes_read;<br>
++<br>
++=C2=A0 g_io_channel_read_chars (channel, buf, sizeof buf, &amp;bytes_read=
, NULL);<br>
++=C2=A0 g_string_append_len (data-&gt;child_stderr, buf, bytes_read);<br>
++=C2=A0 return TRUE;<br>
++}<br>
++<br>
++static gboolean<br>
++utils_read_child_stdout (GIOChannel *channel,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GIOCondition condition,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpointer user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
++=C2=A0 gchar buf[1024];<br>
++=C2=A0 gsize bytes_read;<br>
++<br>
++=C2=A0 g_io_channel_read_chars (channel, buf, sizeof buf, &amp;bytes_read=
, NULL);<br>
++=C2=A0 g_string_append_len (data-&gt;child_stdout, buf, bytes_read);<br>
++=C2=A0 return TRUE;<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_spawn (const gchar *const=C2=A0 *argv,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 timeout_seconds,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCancellable=C2=A0 =C2=A0 =C2=A0 =C2=A0 *can=
cellable,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GAsyncReadyCallback=C2=A0 callback,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0user_data)<br>
++{<br>
++=C2=A0 UtilsSpawnData *data;<br>
++=C2=A0 GError *error;<br>
++<br>
++=C2=A0 data =3D g_slice_new0 (UtilsSpawnData);<br>
++=C2=A0 data-&gt;timeout_seconds =3D timeout_seconds;<br>
++=C2=A0 data-&gt;simple =3D g_simple_async_result_new (NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 callback,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 user_data,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (gpointer*)polkit_backend_common_spawn);<br>
++=C2=A0 data-&gt;main_context =3D g_main_context_get_thread_default ();<br=
>
++=C2=A0 if (data-&gt;main_context !=3D NULL)<br>
++=C2=A0 =C2=A0 g_main_context_ref (data-&gt;main_context);<br>
++<br>
++=C2=A0 data-&gt;cancellable =3D cancellable !=3D NULL ? (GCancellable*)g_=
object_ref (cancellable) : NULL;<br>
++<br>
++=C2=A0 data-&gt;child_stdout =3D g_string_new (NULL);<br>
++=C2=A0 data-&gt;child_stderr =3D g_string_new (NULL);<br>
++=C2=A0 data-&gt;child_stdout_fd =3D -1;<br>
++=C2=A0 data-&gt;child_stderr_fd =3D -1;<br>
++<br>
++=C2=A0 /* the life-cycle of UtilsSpawnData is tied to its GSimpleAsyncRes=
ult */<br>
++=C2=A0 g_simple_async_result_set_op_res_gpointer (data-&gt;simple, data, =
(GDestroyNotify) utils_spawn_data_free);<br>
++<br>
++=C2=A0 error =3D NULL;<br>
++=C2=A0 if (data-&gt;cancellable !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* could already be cancelled */<br>
++=C2=A0 =C2=A0 =C2=A0 error =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 if (g_cancellable_set_error_if_cancelled (data-&gt;c=
ancellable, &amp;error))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_simple_async_result_take_error (data=
-&gt;simple, error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_simple_async_result_complete_in_idle=
 (data-&gt;simple);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (data-&gt;simple);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;cancellable_handler_id =3D g_cancellable_co=
nnect (data-&gt;cancellable,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_CALLBACK (=
utils_on_cancelled),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 error =3D NULL;<br>
++=C2=A0 if (!g_spawn_async_with_pipes (NULL, /* working directory */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(gchar **) argv,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* envp */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_SPAWN_SEARCH_PATH | G_SPAWN_=
DO_NOT_REAP_CHILD,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* child_setup */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* child_setup&#39;s use=
r_data */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_pid),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* gint *stdin_fd */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_stdout_fd=
),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_stderr_fd=
),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_prefix_error (&amp;error, &quot;Error spawning: &q=
uot;);<br>
++=C2=A0 =C2=A0 =C2=A0 g_simple_async_result_take_error (data-&gt;simple, e=
rror);<br>
++=C2=A0 =C2=A0 =C2=A0 g_simple_async_result_complete_in_idle (data-&gt;sim=
ple);<br>
++=C2=A0 =C2=A0 =C2=A0 g_object_unref (data-&gt;simple);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (timeout_seconds &gt; 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 data-&gt;timeout_source =3D g_timeout_source_new_sec=
onds (timeout_seconds);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_set_priority (data-&gt;timeout_source, G_PR=
IORITY_DEFAULT);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_set_callback (data-&gt;timeout_source, util=
s_timeout_cb, data, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_attach (data-&gt;timeout_source, data-&gt;m=
ain_context);<br>
++=C2=A0 =C2=A0 =C2=A0 g_source_unref (data-&gt;timeout_source);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 data-&gt;child_watch_source =3D g_child_watch_source_new (data-&gt=
;child_pid);<br>
++=C2=A0 g_source_set_callback (data-&gt;child_watch_source, (GSourceFunc) =
utils_child_watch_cb, data, NULL);<br>
++=C2=A0 g_source_attach (data-&gt;child_watch_source, data-&gt;main_contex=
t);<br>
++=C2=A0 g_source_unref (data-&gt;child_watch_source);<br>
++<br>
++=C2=A0 data-&gt;child_stdout_channel =3D g_io_channel_unix_new (data-&gt;=
child_stdout_fd);<br>
++=C2=A0 g_io_channel_set_flags (data-&gt;child_stdout_channel, G_IO_FLAG_N=
ONBLOCK, NULL);<br>
++=C2=A0 data-&gt;child_stdout_source =3D g_io_create_watch (data-&gt;child=
_stdout_channel, G_IO_IN);<br>
++=C2=A0 g_source_set_callback (data-&gt;child_stdout_source, (GSourceFunc)=
 utils_read_child_stdout, data, NULL);<br>
++=C2=A0 g_source_attach (data-&gt;child_stdout_source, data-&gt;main_conte=
xt);<br>
++=C2=A0 g_source_unref (data-&gt;child_stdout_source);<br>
++<br>
++=C2=A0 data-&gt;child_stderr_channel =3D g_io_channel_unix_new (data-&gt;=
child_stderr_fd);<br>
++=C2=A0 g_io_channel_set_flags (data-&gt;child_stderr_channel, G_IO_FLAG_N=
ONBLOCK, NULL);<br>
++=C2=A0 data-&gt;child_stderr_source =3D g_io_create_watch (data-&gt;child=
_stderr_channel, G_IO_IN);<br>
++=C2=A0 g_source_set_callback (data-&gt;child_stderr_source, (GSourceFunc)=
 utils_read_child_stderr, data, NULL);<br>
++=C2=A0 g_source_attach (data-&gt;child_stderr_source, data-&gt;main_conte=
xt);<br>
++=C2=A0 g_source_unref (data-&gt;child_stderr_source);<br>
++<br>
++ out:<br>
++=C2=A0 ;<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_on_dir_monitor_changed (GFileMonitor=C2=A0 =C2=A0 =
=C2=A0*monitor,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *file,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *other_file,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 GFileMonitorEvent event_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_data)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (user_data);<br>
++<br>
++=C2=A0 /* TODO: maybe rate-limit so storms of events are collapsed into o=
ne with a 500ms resolution?<br>
++=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0Because when editing a file with=
 emacs we get 4-8 events..<br>
++=C2=A0 =C2=A0*/<br>
++<br>
++=C2=A0 if (file !=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 gchar *name;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 name =3D g_file_get_basename (file);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* g_print (&quot;event_type=3D%d file=3D%p name=3D%=
s\n&quot;, event_type, file, name); */<br>
++=C2=A0 =C2=A0 =C2=A0 if (!g_str_has_prefix (name, &quot;.&quot;) &amp;&am=
p;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !g_str_has_prefix (name, &quot;#&quot;=
) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_str_has_suffix (name, &quot;.rules&q=
uot;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (event_type =3D=3D G_FILE_MONITOR_EVEN=
T_CREATED ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_type =3D=3D G_FILE_MONITOR=
_EVENT_DELETED ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_type =3D=3D G_FILE_MONITOR=
_EVENT_CHANGES_DONE_HINT))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_B=
ACKEND_AUTHORITY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Re=
loading rules&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_common_reload_scripts (=
authority);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 g_free (name);<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++gboolean<br>
++polkit_backend_common_spawn_finish (GAsyncResult=C2=A0 =C2=A0*res,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gint=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*out_exit_status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0**out_standard_output,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0**out_standard_error,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GError=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 **error)<br>
++{<br>
++=C2=A0 GSimpleAsyncResult *simple =3D G_SIMPLE_ASYNC_RESULT (res);<br>
++=C2=A0 UtilsSpawnData *data;<br>
++=C2=A0 gboolean ret =3D FALSE;<br>
++<br>
++=C2=A0 g_return_val_if_fail (G_IS_ASYNC_RESULT (res), FALSE);<br>
++=C2=A0 g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, FAL=
SE);<br>
++<br>
++=C2=A0 g_warn_if_fail (g_simple_async_result_get_source_tag (simple) =3D=
=3D polkit_backend_common_spawn);<br>
++<br>
++=C2=A0 if (g_simple_async_result_propagate_error (simple, error))<br>
++=C2=A0 =C2=A0 goto out;<br>
++<br>
++=C2=A0 data =3D (UtilsSpawnData*)g_simple_async_result_get_op_res_gpointe=
r (simple);<br>
++<br>
++=C2=A0 if (data-&gt;timed_out)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_set_error (error,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_IO=
_ERROR,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_IO=
_ERROR_TIMED_OUT,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quo=
t;Timed out after %d seconds&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data=
-&gt;timeout_seconds);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (out_exit_status !=3D NULL)<br>
++=C2=A0 =C2=A0 *out_exit_status =3D data-&gt;exit_status;<br>
++<br>
++=C2=A0 if (out_standard_output !=3D NULL)<br>
++=C2=A0 =C2=A0 *out_standard_output =3D g_strdup (data-&gt;child_stdout-&g=
t;str);<br>
++<br>
++=C2=A0 if (out_standard_error !=3D NULL)<br>
++=C2=A0 =C2=A0 *out_standard_error =3D g_strdup (data-&gt;child_stderr-&gt=
;str);<br>
++<br>
++=C2=A0 ret =3D TRUE;<br>
++<br>
++ out:<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++static const gchar *<br>
++polkit_backend_js_authority_get_name (PolkitBackendAuthority *authority)<=
br>
++{<br>
++=C2=A0 return &quot;js&quot;;<br>
++}<br>
++<br>
++static const gchar *<br>
++polkit_backend_js_authority_get_version (PolkitBackendAuthority *authorit=
y)<br>
++{<br>
++=C2=A0 return PACKAGE_VERSION;<br>
++}<br>
++<br>
++static PolkitAuthorityFeatures<br>
++polkit_backend_js_authority_get_features (PolkitBackendAuthority *authori=
ty)<br>
++{<br>
++=C2=A0 return POLKIT_AUTHORITY_FEATURES_TEMPORARY_AUTHORIZATION;<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_js_authority_class_init_common (PolkitBackendJsAuth=
orityClass *klass)<br>
++{<br>
++=C2=A0 GObjectClass *gobject_class;<br>
++=C2=A0 PolkitBackendAuthorityClass *authority_class;<br>
++=C2=A0 PolkitBackendInteractiveAuthorityClass *interactive_authority_clas=
s;<br>
++<br>
++=C2=A0 gobject_class =3D G_OBJECT_CLASS (klass);<br>
++=C2=A0 gobject_class-&gt;finalize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D polkit_backend_common_js_authority_finalize;<br>
++=C2=A0 gobject_class-&gt;set_property=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polkit_ba=
ckend_common_js_authority_set_property;<br>
++=C2=A0 gobject_class-&gt;constructed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D polkit_b=
ackend_common_js_authority_constructed;<br>
++<br>
++=C2=A0 authority_class =3D POLKIT_BACKEND_AUTHORITY_CLASS (klass);<br>
++=C2=A0 authority_class-&gt;get_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polki=
t_backend_js_authority_get_name;<br>
++=C2=A0 authority_class-&gt;get_version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D polkit_backend_=
js_authority_get_version;<br>
++=C2=A0 authority_class-&gt;get_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polkit_backend_=
js_authority_get_features;<br>
++<br>
++=C2=A0 interactive_authority_class =3D POLKIT_BACKEND_INTERACTIVE_AUTHORI=
TY_CLASS (klass);<br>
++=C2=A0 interactive_authority_class-&gt;get_admin_identities=C2=A0 =C2=A0 =
=C2=A0=3D polkit_backend_common_js_authority_get_admin_auth_identities;<br>
++=C2=A0 interactive_authority_class-&gt;check_authorization_sync =3D polki=
t_backend_common_js_authority_check_authorization_sync;<br>
++<br>
++=C2=A0 g_object_class_install_property (gobject_class,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROP_RULES_DIRS,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_param_spec_boxed (&qu=
ot;rules-dirs&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_TYPE_STRV,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_PARAM_CONSTRUCT_ONLY | G_=
PARAM_WRITABLE));<br>
++}<br>
++<br>
++gint<br>
++polkit_backend_common_rules_file_name_cmp (const gchar *a,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0const gchar *b)<br>
++{<br>
++=C2=A0 gint ret;<br>
++=C2=A0 const gchar *a_base;<br>
++=C2=A0 const gchar *b_base;<br>
++<br>
++=C2=A0 a_base =3D strrchr (a, &#39;/&#39;);<br>
++=C2=A0 b_base =3D strrchr (b, &#39;/&#39;);<br>
++<br>
++=C2=A0 g_assert (a_base !=3D NULL);<br>
++=C2=A0 g_assert (b_base !=3D NULL);<br>
++=C2=A0 a_base +=3D 1;<br>
++=C2=A0 b_base +=3D 1;<br>
++<br>
++=C2=A0 ret =3D g_strcmp0 (a_base, b_base);<br>
++=C2=A0 if (ret =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /* /etc wins over /usr */<br>
++=C2=A0 =C2=A0 =C2=A0 ret =3D g_strcmp0 (a, b);<br>
++=C2=A0 =C2=A0 =C2=A0 g_assert (ret !=3D 0);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++const gchar *<br>
++polkit_backend_common_get_signal_name (gint signal_number)<br>
++{<br>
++=C2=A0 switch (signal_number)<br>
++=C2=A0 =C2=A0 {<br>
++#define _HANDLE_SIG(sig) case sig: return #sig;<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGHUP);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGINT);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGQUIT);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGILL);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGABRT);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGFPE);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGKILL);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGSEGV);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGPIPE);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGALRM);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGTERM);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGUSR1);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGUSR2);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGCHLD);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGCONT);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGSTOP);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGTSTP);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGTTIN);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGTTOU);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGBUS);<br>
++#ifdef SIGPOLL<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGPOLL);<br>
++#endif<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGPROF);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGSYS);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGTRAP);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGURG);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGVTALRM);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGXCPU);<br>
++=C2=A0 =C2=A0 _HANDLE_SIG (SIGXFSZ);<br>
++#undef _HANDLE_SIG<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 return &quot;UNKNOWN_SIGNAL&quot;;<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_spawn_cb (GObject=C2=A0 =C2=A0 =C2=A0 =C2=A0*source=
_object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GAsyncResult=C2=A0 *res,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0u=
ser_data)<br>
++{<br>
++=C2=A0 SpawnData *data =3D (SpawnData *)user_data;<br>
++=C2=A0 data-&gt;res =3D (GAsyncResult*)g_object_ref (res);<br>
++=C2=A0 g_main_loop_quit (data-&gt;loop);<br>
++}<br>
+diff --git a/src/polkitbackend/polkitbackendcommon.h b/src/polkitbackend/p=
olkitbackendcommon.h<br>
+new file mode 100644<br>
+index 0000000..dd700fc<br>
+--- /dev/null<br>
++++ b/src/polkitbackend/polkitbackendcommon.h<br>
+@@ -0,0 +1,158 @@<br>
++/*<br>
++ * Copyright (C) 2008 Red Hat, Inc.<br>
++ *<br>
++ * This library is free software; you can redistribute it and/or<br>
++ * modify it under the terms of the GNU Lesser General Public<br>
++ * License as published by the Free Software Foundation; either<br>
++ * version 2 of the License, or (at your option) any later version.<br>
++ *<br>
++ * This library is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
<br>
++ * Lesser General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU Lesser General<br>
++ * Public License along with this library; if not, write to the<br>
++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,<br>
++ * Boston, MA 02111-1307, USA.<br>
++ *<br>
++ * Author: David Zeuthen &lt;<a href=3D"mailto:davidz@redhat.com" target=
=3D"_blank">davidz@redhat.com</a>&gt;<br>
++ */<br>
++<br>
++#if !defined (_POLKIT_BACKEND_COMPILATION) &amp;&amp; !defined(_POLKIT_BA=
CKEND_INSIDE_POLKIT_BACKEND_H)<br>
++#error &quot;Only &lt;polkitbackend/polkitbackend.h&gt; can be included d=
irectly, this file may disappear or change contents.&quot;<br>
++#endif<br>
++<br>
++#ifndef __POLKIT_BACKEND_COMMON_H<br>
++#define __POLKIT_BACKEND_COMMON_H<br>
++<br>
++#include &quot;config.h&quot;<br>
++#include &lt;sys/wait.h&gt;<br>
++#include &lt;errno.h&gt;<br>
++#include &lt;pwd.h&gt;<br>
++#include &lt;grp.h&gt;<br>
++#ifdef HAVE_NETGROUP_H<br>
++#include &lt;netgroup.h&gt;<br>
++#else<br>
++#include &lt;netdb.h&gt;<br>
++#endif<br>
++#include &lt;string.h&gt;<br>
++#include &lt;glib/gstdio.h&gt;<br>
++#include &lt;locale.h&gt;<br>
++#include &lt;glib/gi18n-lib.h&gt; //here, all things glib via glib.h (inc=
luding -&gt; gspawn.h)<br>
++<br>
++#include &lt;polkit/polkit.h&gt;<br>
++#include &quot;polkitbackendjsauthority.h&quot;<br>
++<br>
++#include &lt;polkit/polkitprivate.h&gt;<br>
++<br>
++#ifdef HAVE_LIBSYSTEMD<br>
++#include &lt;systemd/sd-login.h&gt;<br>
++#endif /* HAVE_LIBSYSTEMD */<br>
++<br>
++#define RUNAWAY_KILLER_TIMEOUT (15)<br>
++<br>
++#ifdef __cplusplus<br>
++extern &quot;C&quot; {<br>
++#endif<br>
++<br>
++enum<br>
++{<br>
++=C2=A0 PROP_0,<br>
++=C2=A0 PROP_RULES_DIRS,<br>
++};<br>
++<br>
++typedef struct<br>
++{<br>
++=C2=A0 GSimpleAsyncResult *simple; /* borrowed reference */<br>
++=C2=A0 GMainContext *main_context; /* may be NULL */<br>
++<br>
++=C2=A0 GCancellable *cancellable;=C2=A0 /* may be NULL */<br>
++=C2=A0 gulong cancellable_handler_id;<br>
++<br>
++=C2=A0 GPid child_pid;<br>
++=C2=A0 gint child_stdout_fd;<br>
++=C2=A0 gint child_stderr_fd;<br>
++<br>
++=C2=A0 GIOChannel *child_stdout_channel;<br>
++=C2=A0 GIOChannel *child_stderr_channel;<br>
++<br>
++=C2=A0 GSource *child_watch_source;<br>
++=C2=A0 GSource *child_stdout_source;<br>
++=C2=A0 GSource *child_stderr_source;<br>
++<br>
++=C2=A0 guint timeout_seconds;<br>
++=C2=A0 gboolean timed_out;<br>
++=C2=A0 GSource *timeout_source;<br>
++<br>
++=C2=A0 GString *child_stdout;<br>
++=C2=A0 GString *child_stderr;<br>
++<br>
++=C2=A0 gint exit_status;<br>
++} UtilsSpawnData;<br>
++<br>
++typedef struct<br>
++{<br>
++=C2=A0 GMainLoop *loop;<br>
++=C2=A0 GAsyncResult *res;<br>
++} SpawnData;<br>
++<br>
++void polkit_backend_common_spawn (const gchar *const=C2=A0 *argv,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout_seconds,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GCancellable=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *cancellable,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GAsyncReadyCallback=C2=A0 cal=
lback,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0user_data);<br>
++void polkit_backend_common_spawn_cb (GObject=C2=A0 =C2=A0 =C2=A0 =C2=A0*s=
ource_object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GAsyncResult=C2=
=A0 *res,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer=C2=A0 =
=C2=A0 =C2=A0 =C2=A0user_data);<br>
++gboolean polkit_backend_common_spawn_finish (GAsyncResult=C2=A0 =C2=A0*re=
s,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_exit_status,=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out_standard_output,<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out_standard_error,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0GError=C2=A0 =C2=A0 =C2=A0 =C2=A0 **error);<br>
++<br>
++void polkit_backend_common_on_dir_monitor_changed (GFileMonitor=C2=A0 =C2=
=A0 =C2=A0*monitor,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *file,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *other_file,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFileMonitorEvent event_type,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 user_data);<br>
++<br>
++void polkit_backend_common_js_authority_class_init_common (PolkitBackendJ=
sAuthorityClass *klass);<br>
++<br>
++gint polkit_backend_common_rules_file_name_cmp (const gchar *a,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 const gchar *b);<br>
++<br>
++const gchar *polkit_backend_common_get_signal_name (gint signal_number);<=
br>
++<br>
++/* To be provided by each JS backend, from here onwards=C2=A0 -----------=
----------------------------------- */<br>
++<br>
++void polkit_backend_common_reload_scripts (PolkitBackendJsAuthority *auth=
ority);<br>
++void polkit_backend_common_js_authority_finalize (GObject *object);<br>
++void polkit_backend_common_js_authority_constructed (GObject *object);<br=
>
++GList *polkit_backend_common_js_authority_get_admin_auth_identities (Polk=
itBackendInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitIdentity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*details);<br>
++void polkit_backend_common_js_authority_set_property (GObject=C2=A0 =C2=
=A0 =C2=A0 *object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0property_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const GValue *value,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GParamSpec=C2=A0 =C2=A0*pspec);<b=
r>
++PolkitImplicitAuthorization polkit_backend_common_js_authority_check_auth=
orization_sync (PolkitBackendInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PolkitIdentity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0const gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PolkitDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*details,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PolkitImplicitAuthorization=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
implicit);<br>
++#ifdef __cplusplus<br>
++}<br>
++#endif<br>
++<br>
++#endif /* __POLKIT_BACKEND_COMMON_H */<br>
++<br>
+diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polki=
tbackend/polkitbackendduktapeauthority.c<br>
+new file mode 100644<br>
+index 0000000..c89dbcf<br>
+--- /dev/null<br>
++++ b/src/polkitbackend/polkitbackendduktapeauthority.c<br>
+@@ -0,0 +1,1051 @@<br>
++/*<br>
++ * Copyright (C) 2008-2012 Red Hat, Inc.<br>
++ * Copyright (C) 2015 Tangent Space &lt;<a href=3D"mailto:jstpierre@meche=
ye.net" target=3D"_blank">jstpierre@mecheye.net</a>&gt;<br>
++ * Copyright (C) 2019 Wu Xiaotian &lt;<a href=3D"mailto:yetist@gmail.com"=
 target=3D"_blank">yetist@gmail.com</a>&gt;<br>
++ *<br>
++ * This library is free software; you can redistribute it and/or<br>
++ * modify it under the terms of the GNU Lesser General Public<br>
++ * License as published by the Free Software Foundation; either<br>
++ * version 2 of the License, or (at your option) any later version.<br>
++ *<br>
++ * This library is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
<br>
++ * Lesser General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU Lesser General<br>
++ * Public License along with this library; if not, write to the<br>
++ * Free Software Foundation, Inc., 59 Temple Place, Suite 330,<br>
++ * Boston, MA 02111-1307, USA.<br>
++ *<br>
++ * Author: David Zeuthen &lt;<a href=3D"mailto:davidz@redhat.com" target=
=3D"_blank">davidz@redhat.com</a>&gt;<br>
++ */<br>
++<br>
++#include &lt;pthread.h&gt;<br>
++<br>
++#include &quot;polkitbackendcommon.h&quot;<br>
++<br>
++#include &quot;duktape.h&quot;<br>
++<br>
++/* Built source and not too big to worry about deduplication */<br>
++#include &quot;initjs.h&quot; /* init.js */<br>
++<br>
++/**<br>
++ * SECTION:polkitbackendjsauthority<br>
++ * @title: PolkitBackendJsAuthority<br>
++ * @short_description: JS Authority<br>
++ * @stability: Unstable<br>
++ *<br>
++ * An (Duktape-based) implementation of #PolkitBackendAuthority that read=
s and<br>
++ * evaluates Javascript files and supports interaction with authenticatio=
n<br>
++ * agents (virtue of being based on #PolkitBackendInteractiveAuthority).<=
br>
++ */<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++struct _PolkitBackendJsAuthorityPrivate<br>
++{<br>
++=C2=A0 gchar **rules_dirs;<br>
++=C2=A0 GFileMonitor **dir_monitors; /* NULL-terminated array of GFileMoni=
tor instances */<br>
++<br>
++=C2=A0 duk_context *cx;<br>
++<br>
++=C2=A0 pthread_t runaway_killer_thread;<br>
++};<br>
++<br>
++enum<br>
++{<br>
++=C2=A0 RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET,<br>
++=C2=A0 RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS,<br>
++=C2=A0 RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE,<br>
++};<br>
++<br>
++static gboolean execute_script_with_runaway_killer(PolkitBackendJsAuthori=
ty *authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar *filename);<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++G_DEFINE_TYPE (PolkitBackendJsAuthority, polkit_backend_js_authority, POL=
KIT_BACKEND_TYPE_INTERACTIVE_AUTHORITY);<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static duk_ret_t js_polkit_log (duk_context *cx);<br>
++static duk_ret_t js_polkit_spawn (duk_context *cx);<br>
++static duk_ret_t js_polkit_user_is_in_netgroup (duk_context *cx);<br>
++<br>
++static const duk_function_list_entry js_polkit_functions[] =3D<br>
++{<br>
++=C2=A0 { &quot;log&quot;, js_polkit_log, 1 },<br>
++=C2=A0 { &quot;spawn&quot;, js_polkit_spawn, 1 },<br>
++=C2=A0 { &quot;_userIsInNetGroup&quot;, js_polkit_user_is_in_netgroup, 2 =
},<br>
++=C2=A0 { NULL, NULL, 0 },<br>
++};<br>
++<br>
++static void report_error (void=C2=A0 =C2=A0 =C2=A0*udata,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *msg)<br>
++{<br>
++=C2=A0 =C2=A0 PolkitBackendJsAuthority *authority =3D udata;<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fatal Duktape JS backen=
d error: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (msg ? msg : &quot;no message=
&quot;));<br>
++}<br>
++<br>
++static void<br>
++polkit_backend_js_authority_init (PolkitBackendJsAuthority *authority)<br=
>
++{<br>
++=C2=A0 authority-&gt;priv =3D G_TYPE_INSTANCE_GET_PRIVATE (authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0POLKIT_BACKEND_TYPE_JS_AUTHORITY,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PolkitBackendJsAuthorityPrivate);<br>
++}<br>
++<br>
++static void<br>
++load_scripts (PolkitBackendJsAuthority=C2=A0 *authority)<br>
++{<br>
++=C2=A0 GList *files =3D NULL;<br>
++=C2=A0 GList *l;<br>
++=C2=A0 guint num_scripts =3D 0;<br>
++=C2=A0 GError *error =3D NULL;<br>
++=C2=A0 guint n;<br>
++<br>
++=C2=A0 files =3D NULL;<br>
++<br>
++=C2=A0 for (n =3D 0; authority-&gt;priv-&gt;rules_dirs !=3D NULL &amp;&am=
p; authority-&gt;priv-&gt;rules_dirs[n] !=3D NULL; n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 const gchar *dir_name =3D authority-&gt;priv-&gt;rul=
es_dirs[n];<br>
++=C2=A0 =C2=A0 =C2=A0 GDir *dir =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Loading rules fr=
om directory %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_name);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 dir =3D g_dir_open (dir_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 if (dir =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_B=
ACKEND_AUTHORITY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Er=
ror opening rules directory: %s (%s, %d)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error-&g=
t;message, g_quark_to_string (error-&gt;domain), error-&gt;code);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar *name;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((name =3D g_dir_read_name (dir)=
) !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_suffix (na=
me, &quot;.rules&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D g_list_=
prepend (files, g_strdup_printf (&quot;%s/%s&quot;, dir_name, name));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_dir_close (dir);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 files =3D g_list_sort (files, (GCompareFunc) polkit_backend_common=
_rules_file_name_cmp);<br>
++<br>
++=C2=A0 for (l =3D files; l !=3D NULL; l =3D l-&gt;next)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 const gchar *filename =3D (gchar *)l-&gt;data;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (!execute_script_with_runaway_killer(authority, f=
ilename))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 num_scripts++;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority)=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Finished loading, compiling an=
d executing %d rules&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_scripts);<br>
++=C2=A0 g_list_free_full (files, g_free);<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_reload_scripts (PolkitBackendJsAuthority *authority=
)<br>
++{<br>
++=C2=A0 duk_context *cx =3D authority-&gt;priv-&gt;cx;<br>
++<br>
++=C2=A0 duk_set_top (cx, 0);<br>
++=C2=A0 if (!duk_get_global_string (cx, &quot;polkit&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error deleting o=
ld rules, not loading new ones&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 }<br>
++=C2=A0 duk_push_string (cx, &quot;_deleteRules&quot;);<br>
++<br>
++=C2=A0 duk_call_prop (cx, 0, 0);<br>
++<br>
++=C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (authority)=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Collecting garbage uncondition=
ally...&quot;);<br>
++<br>
++=C2=A0 load_scripts (authority);<br>
++<br>
++=C2=A0 /* Let applications know we have new rules... */<br>
++=C2=A0 g_signal_emit_by_name (authority, &quot;changed&quot;);<br>
++}<br>
++<br>
++static void<br>
++setup_file_monitors (PolkitBackendJsAuthority *authority)<br>
++{<br>
++=C2=A0 guint n;<br>
++=C2=A0 GPtrArray *p;<br>
++<br>
++=C2=A0 p =3D g_ptr_array_new ();<br>
++=C2=A0 for (n =3D 0; authority-&gt;priv-&gt;rules_dirs !=3D NULL &amp;&am=
p; authority-&gt;priv-&gt;rules_dirs[n] !=3D NULL; n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 GFile *file;<br>
++=C2=A0 =C2=A0 =C2=A0 GError *error;<br>
++=C2=A0 =C2=A0 =C2=A0 GFileMonitor *monitor;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 file =3D g_file_new_for_path (authority-&gt;priv-&gt=
;rules_dirs[n]);<br>
++=C2=A0 =C2=A0 =C2=A0 error =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 monitor =3D g_file_monitor_directory (file,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
_FILE_MONITOR_NONE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N=
ULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 g_object_unref (file);<br>
++=C2=A0 =C2=A0 =C2=A0 if (monitor =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_warning (&quot;Error monitoring dire=
ctory %s: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0authority-&gt;priv-&gt;rules_dirs[n],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0error-&gt;message);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_signal_connect (monitor,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;changed&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 G_CALLBACK (polkit_backend_common_on_dir_monitor_c=
hanged),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 authority);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_ptr_array_add (p, monitor);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g_ptr_array_add (p, NULL);<br>
++=C2=A0 authority-&gt;priv-&gt;dir_monitors =3D (GFileMonitor**) g_ptr_arr=
ay_free (p, FALSE);<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_js_authority_constructed (GObject *object)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (object);<br>
++=C2=A0 duk_context *cx;<br>
++<br>
++=C2=A0 cx =3D duk_create_heap (NULL, NULL, NULL, authority, report_error)=
;<br>
++=C2=A0 if (cx =3D=3D NULL)<br>
++=C2=A0 =C2=A0 goto fail;<br>
++<br>
++=C2=A0 authority-&gt;priv-&gt;cx =3D cx;<br>
++<br>
++=C2=A0 duk_push_global_object (cx);<br>
++=C2=A0 duk_push_object (cx);<br>
++=C2=A0 duk_put_function_list (cx, -1, js_polkit_functions);<br>
++=C2=A0 duk_put_prop_string (cx, -2, &quot;polkit&quot;);<br>
++<br>
++=C2=A0 /* load polkit objects/functions into JS context (e.g. addRule(),<=
br>
++=C2=A0 =C2=A0* _deleteRules(), _runRules() et al)<br>
++=C2=A0 =C2=A0*/<br>
++=C2=A0 duk_eval_string (cx, init_js);<br>
++<br>
++=C2=A0 if (authority-&gt;priv-&gt;rules_dirs =3D=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 authority-&gt;priv-&gt;rules_dirs =3D g_new0 (gchar =
*, 3);<br>
++=C2=A0 =C2=A0 =C2=A0 authority-&gt;priv-&gt;rules_dirs[0] =3D g_strdup (P=
ACKAGE_SYSCONF_DIR &quot;/polkit-1/rules.d&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 authority-&gt;priv-&gt;rules_dirs[1] =3D g_strdup (P=
ACKAGE_DATA_DIR &quot;/polkit-1/rules.d&quot;);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 setup_file_monitors (authority);<br>
++=C2=A0 load_scripts (authority);<br>
++<br>
++=C2=A0 G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)-&gt;cons=
tructed (object);<br>
++=C2=A0 return;<br>
++<br>
++ fail:<br>
++=C2=A0 g_critical (&quot;Error initializing JavaScript environment&quot;)=
;<br>
++=C2=A0 g_assert_not_reached ();<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_js_authority_finalize (GObject *object)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (object);<br>
++=C2=A0 guint n;<br>
++<br>
++=C2=A0 for (n =3D 0; authority-&gt;priv-&gt;dir_monitors !=3D NULL &amp;&=
amp; authority-&gt;priv-&gt;dir_monitors[n] !=3D NULL; n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 GFileMonitor *monitor =3D authority-&gt;priv-&gt;dir=
_monitors[n];<br>
++=C2=A0 =C2=A0 =C2=A0 g_signal_handlers_disconnect_by_func (monitor,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 G_CALLBACK (polkit_backend_common_on_dir_monitor_changed),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 authority);<br>
++=C2=A0 =C2=A0 =C2=A0 g_object_unref (monitor);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g_free (authority-&gt;priv-&gt;dir_monitors);<br>
++=C2=A0 g_strfreev (authority-&gt;priv-&gt;rules_dirs);<br>
++<br>
++=C2=A0 duk_destroy_heap (authority-&gt;priv-&gt;cx);<br>
++<br>
++=C2=A0 G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)-&gt;fina=
lize (object);<br>
++}<br>
++<br>
++void<br>
++polkit_backend_common_js_authority_set_property (GObject=C2=A0 =C2=A0 =C2=
=A0 *object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0guint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property_=
id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const GValue *value,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GParamSpec=C2=A0 =C2=A0*pspec)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (object);<br>
++<br>
++=C2=A0 switch (property_id)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 case PROP_RULES_DIRS:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert (authority-&gt;priv-&gt;rules_dirs =
=3D=3D NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 authority-&gt;priv-&gt;rules_dirs =3D (gchar =
**) g_value_dup_boxed (value);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 G_OBJECT_WARN_INVALID_PROPERTY_ID (object, pr=
operty_id, pspec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
++static void<br>
++polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass *kl=
ass)<br>
++{<br>
++=C2=A0 polkit_backend_common_js_authority_class_init_common (klass);<br>
++=C2=A0 g_type_class_add_private (klass, sizeof (PolkitBackendJsAuthorityP=
rivate));<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static void<br>
++set_property_str (duk_context *cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gcha=
r *name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gcha=
r *value)<br>
++{<br>
++=C2=A0 duk_push_string (cx, value);<br>
++=C2=A0 duk_put_prop_string (cx, -2, name);<br>
++}<br>
++<br>
++static void<br>
++set_property_strv (duk_context *cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t gchar *name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPtr=
Array=C2=A0 =C2=A0*value)<br>
++{<br>
++=C2=A0 guint n;<br>
++=C2=A0 duk_push_array (cx);<br>
++=C2=A0 for (n =3D 0; n &lt; value-&gt;len; n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 duk_push_string (cx, g_ptr_array_index (value, n));<=
br>
++=C2=A0 =C2=A0 =C2=A0 duk_put_prop_index (cx, -2, n);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 duk_put_prop_string (cx, -2, name);<br>
++}<br>
++<br>
++static void<br>
++set_property_int32 (duk_context *cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 con=
st gchar *name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gin=
t32=C2=A0 =C2=A0 =C2=A0 =C2=A0value)<br>
++{<br>
++=C2=A0 duk_push_int (cx, value);<br>
++=C2=A0 duk_put_prop_string (cx, -2, name);<br>
++}<br>
++<br>
++static void<br>
++set_property_bool (duk_context *cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cons=
t char=C2=A0 *name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboo=
lean=C2=A0 =C2=A0 =C2=A0value)<br>
++{<br>
++=C2=A0 duk_push_boolean (cx, value);<br>
++=C2=A0 duk_put_prop_string (cx, -2, name);<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static gboolean<br>
++push_subject (duk_context=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitSubject=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitIdentity=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GError=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**error)<br>
++{<br>
++=C2=A0 gboolean ret =3D FALSE;<br>
++=C2=A0 pid_t pid;<br>
++=C2=A0 uid_t uid;<br>
++=C2=A0 gchar *user_name =3D NULL;<br>
++=C2=A0 GPtrArray *groups =3D NULL;<br>
++=C2=A0 struct passwd *passwd;<br>
++=C2=A0 char *seat_str =3D NULL;<br>
++=C2=A0 char *session_str =3D NULL;<br>
++<br>
++=C2=A0 if (!duk_get_global_string (cx, &quot;Subject&quot;)) {<br>
++=C2=A0 =C2=A0 return FALSE;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 duk_new (cx, 0);<br>
++<br>
++=C2=A0 if (POLKIT_IS_UNIX_PROCESS (subject))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 pid =3D polkit_unix_process_get_pid (POLKIT_UNIX_PRO=
CESS (subject));<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else if (POLKIT_IS_SYSTEM_BUS_NAME (subject))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 PolkitSubject *process;<br>
++=C2=A0 =C2=A0 =C2=A0 process =3D polkit_system_bus_name_get_process_sync =
(POLKIT_SYSTEM_BUS_NAME (subject), NULL, error);<br>
++=C2=A0 =C2=A0 =C2=A0 if (process =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 =C2=A0 pid =3D polkit_unix_process_get_pid (POLKIT_UNIX_PRO=
CESS (process));<br>
++=C2=A0 =C2=A0 =C2=A0 g_object_unref (process);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_assert_not_reached ();<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++#ifdef HAVE_LIBSYSTEMD<br>
++=C2=A0 if (sd_pid_get_session (pid, &amp;session_str) =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (sd_session_get_seat (session_str, &amp;seat_str)=
 =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* do nothing */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++#endif /* HAVE_LIBSYSTEMD */<br>
++<br>
++=C2=A0 g_assert (POLKIT_IS_UNIX_USER (user_for_subject));<br>
++=C2=A0 uid =3D polkit_unix_user_get_uid (POLKIT_UNIX_USER (user_for_subje=
ct));<br>
++<br>
++=C2=A0 groups =3D g_ptr_array_new_with_free_func (g_free);<br>
++<br>
++=C2=A0 passwd =3D getpwuid (uid);<br>
++=C2=A0 if (passwd =3D=3D NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 user_name =3D g_strdup_printf (&quot;%d&quot;, (gint=
) uid);<br>
++=C2=A0 =C2=A0 =C2=A0 g_warning (&quot;Error looking up info for uid %d: %=
m&quot;, (gint) uid);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 gid_t gids[512];<br>
++=C2=A0 =C2=A0 =C2=A0 int num_gids =3D 512;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 user_name =3D g_strdup (passwd-&gt;pw_name);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (getgrouplist (passwd-&gt;pw_name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 passwd-&gt;pw_gid,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gids,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;num_gids) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_warning (&quot;Error looking up grou=
ps for uid %d: %m&quot;, (gint) uid);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gint n;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (n =3D 0; n &lt; num_gids; n++)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct group *group;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 group =3D getgrgid (gids=
[n]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (group =3D=3D NULL)<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_ptr_arra=
y_add (groups, g_strdup_printf (&quot;%d&quot;, (gint) gids[n]));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_ptr_arra=
y_add (groups, g_strdup (group-&gt;gr_name));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 set_property_int32 (cx, &quot;pid&quot;, pid);<br>
++=C2=A0 set_property_str (cx, &quot;user&quot;, user_name);<br>
++=C2=A0 set_property_strv (cx, &quot;groups&quot;, groups);<br>
++=C2=A0 set_property_str (cx, &quot;seat&quot;, seat_str);<br>
++=C2=A0 set_property_str (cx, &quot;session&quot;, session_str);<br>
++=C2=A0 set_property_bool (cx, &quot;local&quot;, subject_is_local);<br>
++=C2=A0 set_property_bool (cx, &quot;active&quot;, subject_is_active);<br>
++<br>
++=C2=A0 ret =3D TRUE;<br>
++<br>
++ out:<br>
++=C2=A0 free (session_str);<br>
++=C2=A0 free (seat_str);<br>
++=C2=A0 g_free (user_name);<br>
++=C2=A0 if (groups !=3D NULL)<br>
++=C2=A0 =C2=A0 g_ptr_array_unref (groups);<br>
++<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static gboolean<br>
++push_action_and_details (duk_context=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*cx,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PolkitDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*details,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GError=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0**error)<br>
++{<br>
++=C2=A0 gchar **keys;<br>
++=C2=A0 guint n;<br>
++<br>
++=C2=A0 if (!duk_get_global_string (cx, &quot;Action&quot;)) {<br>
++=C2=A0 =C2=A0 return FALSE;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 duk_new (cx, 0);<br>
++<br>
++=C2=A0 set_property_str (cx, &quot;id&quot;, action_id);<br>
++<br>
++=C2=A0 keys =3D polkit_details_get_keys (details);<br>
++=C2=A0 for (n =3D 0; keys !=3D NULL &amp;&amp; keys[n] !=3D NULL; n++)<br=
>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 gchar *key;<br>
++=C2=A0 =C2=A0 =C2=A0 const gchar *value;<br>
++=C2=A0 =C2=A0 =C2=A0 key =3D g_strdup_printf (&quot;_detail_%s&quot;, key=
s[n]);<br>
++=C2=A0 =C2=A0 =C2=A0 value =3D polkit_details_lookup (details, keys[n]);<=
br>
++=C2=A0 =C2=A0 =C2=A0 set_property_str (cx, key, value);<br>
++=C2=A0 =C2=A0 =C2=A0 g_free (key);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 g_strfreev (keys);<br>
++<br>
++=C2=A0 return TRUE;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++typedef struct {<br>
++=C2=A0 PolkitBackendJsAuthority *authority;<br>
++=C2=A0 const gchar *filename;<br>
++=C2=A0 pthread_cond_t cond;<br>
++=C2=A0 pthread_mutex_t mutex;<br>
++=C2=A0 gint ret;<br>
++} RunawayKillerCtx;<br>
++<br>
++static gpointer<br>
++runaway_killer_thread_execute_js (gpointer user_data)<br>
++{<br>
++=C2=A0 RunawayKillerCtx *ctx =3D user_data;<br>
++=C2=A0 duk_context *cx =3D ctx-&gt;authority-&gt;priv-&gt;cx;<br>
++<br>
++=C2=A0 int oldtype, pthread_err;<br>
++<br>
++=C2=A0 if ((pthread_err =3D pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRO=
NOUS, &amp;oldtype))) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (ctx=
-&gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error setting thread ca=
ncel type: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 GFile *file =3D g_file_new_for_path(ctx-&gt;filename);<br>
++=C2=A0 char *contents;<br>
++=C2=A0 gsize len;<br>
++<br>
++=C2=A0 if (!g_file_load_contents(file, NULL, &amp;contents, &amp;len, NUL=
L, NULL)) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log(POLKIT_BACKEND_AUTHORITY(ctx-&=
gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error loading script %s&=
quot;, ctx-&gt;filename);<br>
++=C2=A0 =C2=A0 g_object_unref(file);<br>
++=C2=A0 =C2=A0 goto err;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 g_object_unref(file);<br>
++<br>
++=C2=A0 /* evaluate the script, trying to print context in any syntax erro=
rs<br>
++=C2=A0 =C2=A0 =C2=A0found */<br>
++=C2=A0 if (duk_peval_lstring(cx, contents, len) !=3D 0)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log(POLKIT_BACKEND_AUTHORITY(ctx-&=
gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error compiling script %=
s: %s&quot;, ctx-&gt;filename,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0duk_safe_to_string(cx, -1));<b=
r>
++=C2=A0 =C2=A0 duk_pop(cx);<br>
++=C2=A0 =C2=A0 goto free_err;<br>
++=C2=A0 }<br>
++=C2=A0 g_free(contents);<br>
++<br>
++=C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS;<br>
++=C2=A0 goto end;<br>
++<br>
++free_err:<br>
++=C2=A0 g_free(contents);<br>
++err:<br>
++=C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;<br>
++end:<br>
++=C2=A0 if ((pthread_err =3D pthread_cond_signal(&amp;ctx-&gt;cond))) {<br=
>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (ctx=
-&gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error signaling on cond=
ition variable: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;<=
br>
++=C2=A0 }<br>
++=C2=A0 return NULL;<br>
++}<br>
++<br>
++static gpointer<br>
++runaway_killer_thread_call_js (gpointer user_data)<br>
++{<br>
++=C2=A0 RunawayKillerCtx *ctx =3D user_data;<br>
++=C2=A0 duk_context *cx =3D ctx-&gt;authority-&gt;priv-&gt;cx;<br>
++=C2=A0 int oldtype, pthread_err;<br>
++<br>
++=C2=A0 if ((pthread_err =3D pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRO=
NOUS, &amp;oldtype))) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (ctx=
-&gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error setting thread ca=
ncel type: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (duk_pcall_prop (cx, 0, 2) !=3D DUK_EXEC_SUCCESS)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (ctx-&gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error evaluating=
 admin rules: &quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duk_safe_to_string (cx=
, -1));<br>
++=C2=A0 =C2=A0 =C2=A0 goto err;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCESS;<br>
++=C2=A0 goto end;<br>
++<br>
++err:<br>
++=C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;<br>
++end:<br>
++=C2=A0 if ((pthread_err =3D pthread_cond_signal(&amp;ctx-&gt;cond))) {<br=
>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (ctx=
-&gt;authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error signaling on cond=
ition variable: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 ctx-&gt;ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE;<=
br>
++=C2=A0 }<br>
++=C2=A0 return NULL;<br>
++}<br>
++<br>
++#if defined (HAVE_PTHREAD_CONDATTR_SETCLOCK)<br>
++#=C2=A0 if defined(CLOCK_MONOTONIC)<br>
++#=C2=A0 =C2=A0 define PK_CLOCK CLOCK_MONOTONIC<br>
++#=C2=A0 elif defined(CLOCK_BOOTTIME)<br>
++#=C2=A0 =C2=A0 define PK_CLOCK CLOCK_BOOTTIME<br>
++#=C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0/* No suitable clock */<br>
++#=C2=A0 =C2=A0 undef HAVE_PTHREAD_CONDATTR_SETCLOCK<br>
++#=C2=A0 =C2=A0 define PK_CLOCK CLOCK_REALTIME<br>
++#=C2=A0 endif<br>
++#else=C2=A0 /* ! HAVE_PTHREAD_CONDATTR_SETCLOCK */<br>
++#=C2=A0 define PK_CLOCK CLOCK_REALTIME<br>
++#endif /* ! HAVE_PTHREAD_CONDATTR_SETCLOCK */<br>
++<br>
++static gboolean<br>
++runaway_killer_common(PolkitBackendJsAuthority *authority, RunawayKillerC=
tx *ctx, void *js_context_cb (void *user_data))<br>
++{<br>
++=C2=A0 int pthread_err;<br>
++=C2=A0 gboolean cancel =3D FALSE;<br>
++=C2=A0 pthread_condattr_t attr;<br>
++=C2=A0 struct timespec abs_time;<br>
++<br>
++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK<br>
++=C2=A0 if ((pthread_err =3D pthread_condattr_init(&amp;attr))) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error initializing cond=
ition variable attributes: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 return FALSE;<br>
++=C2=A0 }<br>
++=C2=A0 if ((pthread_err =3D pthread_condattr_setclock(&amp;attr, PK_CLOCK=
))) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error setting condition=
 variable attributes: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err_clean_condattr;<br>
++=C2=A0 }<br>
++=C2=A0 /* Init again, with needed attr */<br>
++=C2=A0 if ((pthread_err =3D pthread_cond_init(&amp;ctx-&gt;cond, &amp;att=
r))) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error initializing cond=
ition variable: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err_clean_condattr;<br>
++=C2=A0 }<br>
++#endif<br>
++<br>
++=C2=A0 if ((pthread_err =3D pthread_mutex_lock(&amp;ctx-&gt;mutex))) {<br=
>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error locking mutex: %s=
&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (clock_gettime(PK_CLOCK, &amp;abs_time)) {<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error getting system&#3=
9;s monotonic time: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(errno));<br>
++=C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 }<br>
++=C2=A0 abs_time.tv_sec +=3D RUNAWAY_KILLER_TIMEOUT;<br>
++<br>
++=C2=A0 if ((pthread_err =3D pthread_create(&amp;authority-&gt;priv-&gt;ru=
naway_killer_thread, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 js_context_cb, ctx))) =
{<br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error creating runaway =
JS killer thread: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 while (ctx-&gt;ret =3D=3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET)=
 /* loop to treat spurious wakeups */<br>
++=C2=A0 =C2=A0 if (pthread_cond_timedwait(&amp;ctx-&gt;cond, &amp;ctx-&gt;=
mutex, &amp;abs_time) =3D=3D ETIMEDOUT) {<br>
++=C2=A0 =C2=A0 =C2=A0 cancel =3D TRUE;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 /* Log that we are terminating the script */<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Terminating runa=
way script after %d seconds&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUNAWAY_KILLER_TIMEOUT=
);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if ((pthread_err =3D pthread_mutex_unlock(&amp;ctx-&gt;mutex))) {<=
br>
++=C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORITY (aut=
hority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error unlocking mutex: =
%s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err));<br>
++=C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (cancel) {<br>
++=C2=A0 =C2=A0 if ((pthread_err =3D pthread_cancel (authority-&gt;priv-&gt=
;runaway_killer_thread))) {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error cancelling=
 runaway JS killer thread: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err))=
;<br>
++=C2=A0 =C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
++=C2=A0 if ((pthread_err =3D pthread_join (authority-&gt;priv-&gt;runaway_=
killer_thread, NULL))) {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error joining ru=
naway JS killer thread: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strerror(pthread_err))=
;<br>
++=C2=A0 =C2=A0 =C2=A0 goto err_clean_cond;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 return ctx-&gt;ret =3D=3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_SUCCES=
S;<br>
++<br>
++=C2=A0 =C2=A0 err_clean_cond:<br>
++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK<br>
++=C2=A0 pthread_cond_destroy(&amp;ctx-&gt;cond);<br>
++#endif<br>
++=C2=A0 =C2=A0 err_clean_condattr:<br>
++#ifdef HAVE_PTHREAD_CONDATTR_SETCLOCK<br>
++=C2=A0 pthread_condattr_destroy(&amp;attr);<br>
++#endif<br>
++=C2=A0 return FALSE;<br>
++}<br>
++<br>
++/* Blocking for at most RUNAWAY_KILLER_TIMEOUT */<br>
++static gboolean<br>
++execute_script_with_runaway_killer(PolkitBackendJsAuthority *authority,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar *filename)<=
br>
++{<br>
++=C2=A0 RunawayKillerCtx ctx =3D {.authority =3D authority, .filename =3D =
filename,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .mutex =3D PTHREAD_MUTEX_INITIALIZER,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .cond =3D PTHREAD_COND_INITIALIZER};<br>
++<br>
++=C2=A0 return runaway_killer_common(authority, &amp;ctx, &amp;runaway_kil=
ler_thread_execute_js);<br>
++}<br>
++<br>
++/* Calls already stacked function and args. Blocking for at most<br>
++ * RUNAWAY_KILLER_TIMEOUT. If timeout is the case, ctx.ret will be<br>
++ * RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET, thus returning FALSE.<br>
++ */<br>
++static gboolean<br>
++call_js_function_with_runaway_killer(PolkitBackendJsAuthority *authority)=
<br>
++{<br>
++=C2=A0 RunawayKillerCtx ctx =3D {.authority =3D authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .ret =3D RUNAWAY_KILLER_THREAD_EXIT_STATUS_UNSET,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .mutex =3D PTHREAD_MUTEX_INITIALIZER,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 .cond =3D PTHREAD_COND_INITIALIZER};<br>
++<br>
++=C2=A0 return runaway_killer_common(authority, &amp;ctx, &amp;runaway_kil=
ler_thread_call_js);<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++GList *<br>
++polkit_backend_common_js_authority_get_admin_auth_identities (PolkitBacke=
ndInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tIdentity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gbool=
ean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gbool=
ean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const=
 gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*details)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (_authority);<br>
++=C2=A0 GList *ret =3D NULL;<br>
++=C2=A0 guint n;<br>
++=C2=A0 GError *error =3D NULL;<br>
++=C2=A0 const char *ret_str =3D NULL;<br>
++=C2=A0 gchar **ret_strs =3D NULL;<br>
++=C2=A0 duk_context *cx =3D authority-&gt;priv-&gt;cx;<br>
++<br>
++=C2=A0 duk_set_top (cx, 0);<br>
++=C2=A0 if (!duk_get_global_string (cx, &quot;polkit&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error deleting o=
ld rules, not loading new ones&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 duk_push_string (cx, &quot;_runAdminRules&quot;);<br>
++<br>
++=C2=A0 if (!push_action_and_details (cx, action_id, details, &amp;error))=
<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error converting=
 action and details to JS object: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error-&gt;message);<br=
>
++=C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (!push_subject (cx, subject, user_for_subject, subject_is_local=
, subject_is_active, &amp;error))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error converting=
 subject to JS object: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error-&gt;message);<br=
>
++=C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (!call_js_function_with_runaway_killer (authority))<br>
++=C2=A0 =C2=A0 goto out;<br>
++<br>
++=C2=A0 ret_str =3D duk_require_string (cx, -1);<br>
++<br>
++=C2=A0 ret_strs =3D g_strsplit (ret_str, &quot;,&quot;, -1);<br>
++=C2=A0 for (n =3D 0; ret_strs !=3D NULL &amp;&amp; ret_strs[n] !=3D NULL;=
 n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 const gchar *identity_str =3D ret_strs[n];<br>
++=C2=A0 =C2=A0 =C2=A0 PolkitIdentity *identity;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 error =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 identity =3D polkit_identity_from_string (identity_s=
tr, &amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 if (identity =3D=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_B=
ACKEND_AUTHORITY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Id=
entity `%s&#39; is not valid, ignoring: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 identity=
_str, error-&gt;message);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D g_list_prepend (ret, identity)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 ret =3D g_list_reverse (ret);<br>
++<br>
++ out:<br>
++=C2=A0 g_strfreev (ret_strs);<br>
++=C2=A0 /* fallback to root password auth */<br>
++=C2=A0 if (ret =3D=3D NULL)<br>
++=C2=A0 =C2=A0 ret =3D g_list_prepend (ret, polkit_unix_user_new (0));<br>
++<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++PolkitImplicitAuthorization<br>
++polkit_backend_common_js_authority_check_authorization_sync (PolkitBacken=
dInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Subject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Subject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Identity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboole=
an=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboole=
an=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Details=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*details,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
ImplicitAuthorization=C2=A0 =C2=A0 =C2=A0 =C2=A0 implicit)<br>
++{<br>
++=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (_authority);<br>
++=C2=A0 PolkitImplicitAuthorization ret =3D implicit;<br>
++=C2=A0 GError *error =3D NULL;<br>
++=C2=A0 gchar *ret_str =3D NULL;<br>
++=C2=A0 gboolean good =3D FALSE;<br>
++=C2=A0 duk_context *cx =3D authority-&gt;priv-&gt;cx;<br>
++<br>
++=C2=A0 duk_set_top (cx, 0);<br>
++=C2=A0 if (!duk_get_global_string (cx, &quot;polkit&quot;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 duk_push_string (cx, &quot;_runRules&quot;);<br>
++<br>
++=C2=A0 if (!push_action_and_details (cx, action_id, details, &amp;error))=
<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error converting=
 action and details to JS object: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error-&gt;message);<br=
>
++=C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (!push_subject (cx, subject, user_for_subject, subject_is_local=
, subject_is_active, &amp;error))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Error converting=
 subject to JS object: %s&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error-&gt;message);<br=
>
++=C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 // If any error is the js context happened (ctx.ret =3D=3D<br>
++=C2=A0 // RUNAWAY_KILLER_THREAD_EXIT_STATUS_FAILURE) or it never properly=
 returned<br>
++=C2=A0 // (runaway scripts or ctx.ret =3D=3D RUNAWAY_KILLER_THREAD_EXIT_S=
TATUS_UNSET),<br>
++=C2=A0 // unauthorize<br>
++=C2=A0 if (!call_js_function_with_runaway_killer (authority))<br>
++=C2=A0 =C2=A0 goto out;<br>
++<br>
++=C2=A0 if (duk_is_null(cx, -1)) {<br>
++=C2=A0 =C2=A0 /* this is fine, means there was no match, use implicit aut=
horizations */<br>
++=C2=A0 =C2=A0 good =3D TRUE;<br>
++=C2=A0 =C2=A0 goto out;<br>
++=C2=A0 }<br>
++=C2=A0 ret_str =3D g_strdup (duk_require_string (cx, -1));<br>
++=C2=A0 if (!polkit_implicit_authorization_from_string (ret_str, &amp;ret)=
)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_BACKEND_AUTHORI=
TY (authority),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Returned result =
`%s&#39; is not valid&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret_str);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 good =3D TRUE;<br>
++<br>
++ out:<br>
++=C2=A0 if (!good)<br>
++=C2=A0 =C2=A0 ret =3D POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED;<br>
++=C2=A0 if (ret_str !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 g_free (ret_str);<br>
++<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static duk_ret_t<br>
++js_polkit_log (duk_context *cx)<br>
++{<br>
++=C2=A0 const char *str =3D duk_require_string (cx, 0);<br>
++=C2=A0 fprintf (stderr, &quot;%s\n&quot;, str);<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++static duk_ret_t<br>
++js_polkit_spawn (duk_context *cx)<br>
++{<br>
++=C2=A0 duk_ret_t ret =3D DUK_RET_ERROR;<br>
++=C2=A0 gchar *standard_output =3D NULL;<br>
++=C2=A0 gchar *standard_error =3D NULL;<br>
++=C2=A0 gint exit_status;<br>
++=C2=A0 GError *error =3D NULL;<br>
++=C2=A0 guint32 array_len;<br>
++=C2=A0 gchar **argv =3D NULL;<br>
++=C2=A0 GMainContext *context =3D NULL;<br>
++=C2=A0 GMainLoop *loop =3D NULL;<br>
++=C2=A0 SpawnData data =3D {0};<br>
++=C2=A0 char *err_str =3D NULL;<br>
++=C2=A0 guint n;<br>
++<br>
++=C2=A0 if (!duk_is_array (cx, 0))<br>
++=C2=A0 =C2=A0 goto out;<br>
++<br>
++=C2=A0 array_len =3D duk_get_length (cx, 0);<br>
++<br>
++=C2=A0 argv =3D g_new0 (gchar*, array_len + 1);<br>
++=C2=A0 for (n =3D 0; n &lt; array_len; n++)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 duk_get_prop_index (cx, 0, n);<br>
++=C2=A0 =C2=A0 =C2=A0 argv[n] =3D g_strdup (duk_to_string (cx, -1));<br>
++=C2=A0 =C2=A0 =C2=A0 duk_pop (cx);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 context =3D g_main_context_new ();<br>
++=C2=A0 loop =3D g_main_loop_new (context, FALSE);<br>
++<br>
++=C2=A0 g_main_context_push_thread_default (context);<br>
++<br>
++=C2=A0 data.loop =3D loop;<br>
++=C2=A0 polkit_backend_common_spawn ((const gchar *const *) argv,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010, /* timeout_seconds */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* cancellable */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkit_backend_common_spawn_cb,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data);<br>
++<br>
++=C2=A0 g_main_loop_run (loop);<br>
++<br>
++=C2=A0 g_main_context_pop_thread_default (context);<br>
++<br>
++=C2=A0 if (!polkit_backend_common_spawn_finish (data.res,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;exit_status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;standard_output,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;standard_error,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;error))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 err_str =3D g_strdup_printf (&quot;Error spawning he=
lper: %s (%s, %d)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error-&gt;message, g_quark_to_=
string (error-&gt;domain), error-&gt;code);<br>
++=C2=A0 =C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 if (!(WIFEXITED (exit_status) &amp;&amp; WEXITSTATUS (exit_status)=
 =3D=3D 0))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 GString *gstr;<br>
++=C2=A0 =C2=A0 =C2=A0 gstr =3D g_string_new (NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 if (WIFEXITED (exit_status))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf (gstr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Helper exited with non-=
zero exit status %d&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WEXITSTATUS (exit_status));<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (WIFSIGNALED (exit_status))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf (gstr,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Helper was signaled wit=
h signal %s (%d)&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_common_get_sig=
nal_name (WTERMSIG (exit_status)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WTERMSIG (exit_status));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 g_string_append_printf (gstr, &quot;, stdout=3D`%s&#=
39;, stderr=3D`%s&#39;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 standard_output, standard_error);<br>
++=C2=A0 =C2=A0 =C2=A0 err_str =3D g_string_free (gstr, FALSE);<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 duk_push_string (cx, standard_output);<br>
++=C2=A0 ret =3D 1;<br>
++<br>
++ out:<br>
++=C2=A0 g_strfreev (argv);<br>
++=C2=A0 g_free (standard_output);<br>
++=C2=A0 g_free (standard_error);<br>
++=C2=A0 g_clear_object (&amp;data.res);<br>
++=C2=A0 if (loop !=3D NULL)<br>
++=C2=A0 =C2=A0 g_main_loop_unref (loop);<br>
++=C2=A0 if (context !=3D NULL)<br>
++=C2=A0 =C2=A0 g_main_context_unref (context);<br>
++<br>
++=C2=A0 if (err_str)<br>
++=C2=A0 =C2=A0 duk_error (cx, DUK_ERR_ERROR, err_str);<br>
++<br>
++=C2=A0 return ret;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
++<br>
++<br>
++static duk_ret_t<br>
++js_polkit_user_is_in_netgroup (duk_context *cx)<br>
++{<br>
++=C2=A0 const char *user;<br>
++=C2=A0 const char *netgroup;<br>
++=C2=A0 gboolean is_in_netgroup =3D FALSE;<br>
++<br>
++=C2=A0 user =3D duk_require_string (cx, 0);<br>
++=C2=A0 netgroup =3D duk_require_string (cx, 1);<br>
++<br>
++=C2=A0 if (innetgr (netgroup,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,=C2=A0 /* hos=
t */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL)) /* domain *=
/<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 is_in_netgroup =3D TRUE;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 duk_push_boolean (cx, is_in_netgroup);<br>
++=C2=A0 return 1;<br>
++}<br>
++<br>
++/* ----------------------------------------------------------------------=
------------------------------ */<br>
+diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitba=
ckend/polkitbackendjsauthority.cpp<br>
+index ca17108..11e91c0 100644<br>
+--- a/src/polkitbackend/polkitbackendjsauthority.cpp<br>
++++ b/src/polkitbackend/polkitbackendjsauthority.cpp<br>
+@@ -19,29 +19,7 @@<br>
+=C2=A0 * Author: David Zeuthen &lt;<a href=3D"mailto:davidz@redhat.com" ta=
rget=3D"_blank">davidz@redhat.com</a>&gt;<br>
+=C2=A0 */<br>
+ <br>
+-#include &quot;config.h&quot;<br>
+-#include &lt;sys/wait.h&gt;<br>
+-#include &lt;errno.h&gt;<br>
+-#include &lt;pwd.h&gt;<br>
+-#include &lt;grp.h&gt;<br>
+-#ifdef HAVE_NETGROUP_H<br>
+-#include &lt;netgroup.h&gt;<br>
+-#else<br>
+-#include &lt;netdb.h&gt;<br>
+-#endif<br>
+-#include &lt;string.h&gt;<br>
+-#include &lt;glib/gstdio.h&gt;<br>
+-#include &lt;locale.h&gt;<br>
+-#include &lt;glib/gi18n-lib.h&gt;<br>
+-<br>
+-#include &lt;polkit/polkit.h&gt;<br>
+-#include &quot;polkitbackendjsauthority.h&quot;<br>
+-<br>
+-#include &lt;polkit/polkitprivate.h&gt;<br>
+-<br>
+-#ifdef HAVE_LIBSYSTEMD<br>
+-#include &lt;systemd/sd-login.h&gt;<br>
+-#endif /* HAVE_LIBSYSTEMD */<br>
++#include &quot;polkitbackendcommon.h&quot;<br>
+ <br>
+ #include &lt;js/CompilationAndEvaluation.h&gt;<br>
+ #include &lt;js/ContextOptions.h&gt;<br>
+@@ -52,6 +30,7 @@<br>
+ #include &lt;js/Array.h&gt;<br>
+ #include &lt;jsapi.h&gt;<br>
+ <br>
++/* Built source and not too big to worry about deduplication */<br>
+ #include &quot;initjs.h&quot; /* init.js */<br>
+ <br>
+ #ifdef JSGC_USE_EXACT_ROOTING<br>
+@@ -67,10 +46,9 @@<br>
+=C2=A0 * @short_description: JS Authority<br>
+=C2=A0 * @stability: Unstable<br>
+=C2=A0 *<br>
+- * An implementation of #PolkitBackendAuthority that reads and<br>
+- * evalates Javascript files and supports interaction with<br>
+- * authentication agents (virtue of being based on<br>
+- * #PolkitBackendInteractiveAuthority).<br>
++ * An (SpiderMonkey-based) implementation of #PolkitBackendAuthority that=
 reads<br>
++ * and evaluates Javascript files and supports interaction with authentic=
ation<br>
++ * agents (virtue of being based on #PolkitBackendInteractiveAuthority).<=
br>
+=C2=A0 */<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+@@ -100,57 +78,11 @@ static bool execute_script_with_runaway_killer (Polki=
tBackendJsAuthority *author<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JS::HandleScript=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JS::MutableHandl=
eValue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rval);<br>
+ <br>
+-static void utils_spawn (const gchar *const=C2=A0 *argv,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0guint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timeout_seconds,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GCancellable=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cancellable,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GAsyncReadyCallback=C2=A0 callback,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0us=
er_data);<br>
+-<br>
+-gboolean utils_spawn_finish (GAsyncResult=C2=A0 =C2=A0*res,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*out_exit_status,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out=
_standard_output,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out=
_standard_error,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GError=C2=A0 =C2=A0 =C2=A0 =C2=A0 **error);<=
br>
+-<br>
+-static void on_dir_monitor_changed (GFileMonitor=C2=A0 =C2=A0 =C2=A0*moni=
tor,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 *file,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 *other_file,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFileMonitorEvent even=
t_type,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 user_data);<br>
+-<br>
+-/* ----------------------------------------------------------------------=
------------------------------ */<br>
+-<br>
+-enum<br>
+-{<br>
+-=C2=A0 PROP_0,<br>
+-=C2=A0 PROP_RULES_DIRS,<br>
+-};<br>
+-<br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
+ static gpointer runaway_killer_thread_func (gpointer user_data);<br>
+ static void runaway_killer_terminate (PolkitBackendJsAuthority *authority=
);<br>
+ <br>
+-static GList *polkit_backend_js_authority_get_admin_auth_identities (Polk=
itBackendInteractiveAuthority *authority,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*caller,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitIdentity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*action_id,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PolkitDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*details);<br>
+-<br>
+-static PolkitImplicitAuthorization polkit_backend_js_authority_check_auth=
orization_sync (<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitBackendIntera=
ctiveAuthority *authority,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitSubject=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*call=
er,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitSubject=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subj=
ect,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitIdentity=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_fo=
r_subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0subject_is_local,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0subject_is_active,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*action_id,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitDetails=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*deta=
ils,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitImplicitAutho=
rization=C2=A0 =C2=A0 =C2=A0 =C2=A0 implicit);<br>
+-<br>
+ G_DEFINE_TYPE (PolkitBackendJsAuthority, polkit_backend_js_authority, POL=
KIT_BACKEND_TYPE_INTERACTIVE_AUTHORITY);<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+@@ -229,33 +161,6 @@ polkit_backend_js_authority_init (PolkitBackendJsAuth=
ority *authority)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitBackendJsAuthorityPrivate);<br>
+ }<br>
+ <br>
+-static gint<br>
+-rules_file_name_cmp (const gchar *a,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0const gchar *b)<br>
+-{<br>
+-=C2=A0 gint ret;<br>
+-=C2=A0 const gchar *a_base;<br>
+-=C2=A0 const gchar *b_base;<br>
+-<br>
+-=C2=A0 a_base =3D strrchr (a, &#39;/&#39;);<br>
+-=C2=A0 b_base =3D strrchr (b, &#39;/&#39;);<br>
+-<br>
+-=C2=A0 g_assert (a_base !=3D NULL);<br>
+-=C2=A0 g_assert (b_base !=3D NULL);<br>
+-=C2=A0 a_base +=3D 1;<br>
+-=C2=A0 b_base +=3D 1;<br>
+-<br>
+-=C2=A0 ret =3D g_strcmp0 (a_base, b_base);<br>
+-=C2=A0 if (ret =3D=3D 0)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 /* /etc wins over /usr */<br>
+-=C2=A0 =C2=A0 =C2=A0 ret =3D g_strcmp0 (a, b);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_assert (ret !=3D 0);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 return ret;<br>
+-}<br>
+-<br>
+ /* authority-&gt;priv-&gt;cx must be within a request */<br>
+ static void<br>
+ load_scripts (PolkitBackendJsAuthority=C2=A0 *authority)<br>
+@@ -299,7 +204,7 @@ load_scripts (PolkitBackendJsAuthority=C2=A0 *authorit=
y)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 files =3D g_list_sort (files, (GCompareFunc) rules_file_name_cmp);=
<br>
++=C2=A0 files =3D g_list_sort (files, (GCompareFunc) polkit_backend_common=
_rules_file_name_cmp);<br>
+ <br>
+=C2=A0 =C2=A0for (l =3D files; l !=3D NULL; l =3D l-&gt;next)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -365,8 +270,8 @@ load_scripts (PolkitBackendJsAuthority=C2=A0 *authorit=
y)<br>
+=C2=A0 =C2=A0g_list_free_full (files, g_free);<br>
+ }<br>
+ <br>
+-static void<br>
+-reload_scripts (PolkitBackendJsAuthority *authority)<br>
++void<br>
++polkit_backend_common_reload_scripts (PolkitBackendJsAuthority *authority=
)<br>
+ {<br>
+=C2=A0 =C2=A0JS::RootedValueArray&lt;1&gt; args(authority-&gt;priv-&gt;cx)=
;<br>
+=C2=A0 =C2=A0JS::RootedValue rval(authority-&gt;priv-&gt;cx);<br>
+@@ -395,42 +300,6 @@ reload_scripts (PolkitBackendJsAuthority *authority)<=
br>
+=C2=A0 =C2=A0g_signal_emit_by_name (authority, &quot;changed&quot;);<br>
+ }<br>
+ <br>
+-static void<br>
+-on_dir_monitor_changed (GFileMonitor=C2=A0 =C2=A0 =C2=A0*monitor,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *file,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GFile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *other_file,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GFileMonitorEvent event_type,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_data)<br>
+-{<br>
+-=C2=A0 PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUTHORIT=
Y (user_data);<br>
+-<br>
+-=C2=A0 /* TODO: maybe rate-limit so storms of events are collapsed into o=
ne with a 500ms resolution?<br>
+-=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0Because when editing a file with=
 emacs we get 4-8 events..<br>
+-=C2=A0 =C2=A0*/<br>
+-<br>
+-=C2=A0 if (file !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 gchar *name;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 name =3D g_file_get_basename (file);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 /* g_print (&quot;event_type=3D%d file=3D%p name=3D%=
s\n&quot;, event_type, file, name); */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (!g_str_has_prefix (name, &quot;.&quot;) &amp;&am=
p;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !g_str_has_prefix (name, &quot;#&quot;=
) &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_str_has_suffix (name, &quot;.rules&q=
uot;) &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (event_type =3D=3D G_FILE_MONITOR_EVEN=
T_CREATED ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_type =3D=3D G_FILE_MONITOR=
_EVENT_DELETED ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_type =3D=3D G_FILE_MONITOR=
_EVENT_CHANGES_DONE_HINT))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_authority_log (POLKIT_B=
ACKEND_AUTHORITY (authority),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Re=
loading rules&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reload_scripts (authority);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free (name);<br>
+-=C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-<br>
+ static void<br>
+ setup_file_monitors (PolkitBackendJsAuthority *authority)<br>
+ {<br>
+@@ -462,7 +331,7 @@ setup_file_monitors (PolkitBackendJsAuthority *authori=
ty)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_connect (monitor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;changed&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 G_CALLBACK (on_dir_monitor_changed),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 G_CALLBACK (polkit_backend_common_on_dir_monitor_c=
hanged),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0authority);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_ptr_array_add (p, monitor);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -471,8 +340,8 @@ setup_file_monitors (PolkitBackendJsAuthority *authori=
ty)<br>
+=C2=A0 =C2=A0authority-&gt;priv-&gt;dir_monitors =3D (GFileMonitor**) g_pt=
r_array_free (p, FALSE);<br>
+ }<br>
+ <br>
+-static void<br>
+-polkit_backend_js_authority_constructed (GObject *object)<br>
++void<br>
++polkit_backend_common_js_authority_constructed (GObject *object)<br>
+ {<br>
+=C2=A0 =C2=A0PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUT=
HORITY (object);<br>
+ <br>
+@@ -561,8 +430,8 @@ polkit_backend_js_authority_constructed (GObject *obje=
ct)<br>
+=C2=A0 =C2=A0g_assert_not_reached ();<br>
+ }<br>
+ <br>
+-static void<br>
+-polkit_backend_js_authority_finalize (GObject *object)<br>
++void<br>
++polkit_backend_common_js_authority_finalize (GObject *object)<br>
+ {<br>
+=C2=A0 =C2=A0PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUT=
HORITY (object);<br>
+=C2=A0 =C2=A0guint n;<br>
+@@ -577,7 +446,7 @@ polkit_backend_js_authority_finalize (GObject *object)=
<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GFileMonitor *monitor =3D authority-&gt;priv-&g=
t;dir_monitors[n];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_signal_handlers_disconnect_by_func (monitor,<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (gpointer*)G_CALLBACK (on_dir_monitor_changed),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (gpointer*)G_CALLBACK (polkit_backend_common_on_dir_monitor_changed)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0authority);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_object_unref (monitor);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -594,11 +463,11 @@ polkit_backend_js_authority_finalize (GObject *objec=
t)<br>
+=C2=A0 =C2=A0G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)-&gt=
;finalize (object);<br>
+ }<br>
+ <br>
+-static void<br>
+-polkit_backend_js_authority_set_property (GObject=C2=A0 =C2=A0 =C2=A0 *ob=
ject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
uint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property_id,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onst GValue *value,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
ParamSpec=C2=A0 =C2=A0*pspec)<br>
++void<br>
++polkit_backend_common_js_authority_set_property (GObject=C2=A0 =C2=A0 =C2=
=A0 *object,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0guint=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0property_=
id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const GValue *value,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GParamSpec=C2=A0 =C2=A0*pspec)<br>
+ {<br>
+=C2=A0 =C2=A0PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUT=
HORITY (object);<br>
+ <br>
+@@ -615,57 +484,12 @@ polkit_backend_js_authority_set_property (GObject=C2=
=A0 =C2=A0 =C2=A0 *object,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+ <br>
+-static const gchar *<br>
+-polkit_backend_js_authority_get_name (PolkitBackendAuthority *authority)<=
br>
+-{<br>
+-=C2=A0 return &quot;js&quot;;<br>
+-}<br>
+-<br>
+-static const gchar *<br>
+-polkit_backend_js_authority_get_version (PolkitBackendAuthority *authorit=
y)<br>
+-{<br>
+-=C2=A0 return PACKAGE_VERSION;<br>
+-}<br>
+-<br>
+-static PolkitAuthorityFeatures<br>
+-polkit_backend_js_authority_get_features (PolkitBackendAuthority *authori=
ty)<br>
+-{<br>
+-=C2=A0 return POLKIT_AUTHORITY_FEATURES_TEMPORARY_AUTHORIZATION;<br>
+-}<br>
+-<br>
+ static void<br>
+ polkit_backend_js_authority_class_init (PolkitBackendJsAuthorityClass *kl=
ass)<br>
+ {<br>
+-=C2=A0 GObjectClass *gobject_class;<br>
+-=C2=A0 PolkitBackendAuthorityClass *authority_class;<br>
+-=C2=A0 PolkitBackendInteractiveAuthorityClass *interactive_authority_clas=
s;<br>
+-<br>
+-<br>
+-=C2=A0 gobject_class =3D G_OBJECT_CLASS (klass);<br>
+-=C2=A0 gobject_class-&gt;finalize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D polkit_backend_js_authority_finalize;<br>
+-=C2=A0 gobject_class-&gt;set_property=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polkit_ba=
ckend_js_authority_set_property;<br>
+-=C2=A0 gobject_class-&gt;constructed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D polkit_b=
ackend_js_authority_constructed;<br>
+-<br>
+-=C2=A0 authority_class =3D POLKIT_BACKEND_AUTHORITY_CLASS (klass);<br>
+-=C2=A0 authority_class-&gt;get_name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polki=
t_backend_js_authority_get_name;<br>
+-=C2=A0 authority_class-&gt;get_version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D polkit_backend_=
js_authority_get_version;<br>
+-=C2=A0 authority_class-&gt;get_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D polkit_backend_=
js_authority_get_features;<br>
+-<br>
+-=C2=A0 interactive_authority_class =3D POLKIT_BACKEND_INTERACTIVE_AUTHORI=
TY_CLASS (klass);<br>
+-=C2=A0 interactive_authority_class-&gt;get_admin_identities=C2=A0 =C2=A0 =
=C2=A0=3D polkit_backend_js_authority_get_admin_auth_identities;<br>
+-=C2=A0 interactive_authority_class-&gt;check_authorization_sync =3D polki=
t_backend_js_authority_check_authorization_sync;<br>
+-<br>
+-=C2=A0 g_object_class_install_property (gobject_class,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROP_RULES_DIRS,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_param_spec_boxed (&qu=
ot;rules-dirs&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_TYPE_STRV,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GParamFlags(G_PARAM_CONSTRU=
CT_ONLY | G_PARAM_WRITABLE)));<br>
+-<br>
++=C2=A0 polkit_backend_common_js_authority_class_init_common (klass);<br>
+ <br>
+=C2=A0 =C2=A0g_type_class_add_private (klass, sizeof (PolkitBackendJsAutho=
rityPrivate));<br>
+-<br>
+=C2=A0 =C2=A0JS_Init ();<br>
+ }<br>
+ <br>
+@@ -1005,11 +829,14 @@ runaway_killer_setup (PolkitBackendJsAuthority *aut=
hority)<br>
+ {<br>
+=C2=A0 =C2=A0g_assert (authority-&gt;priv-&gt;rkt_source =3D=3D NULL);<br>
+ <br>
+-=C2=A0 /* set-up timer for runaway scripts, will be executed in runaway_k=
iller_thread */<br>
++=C2=A0 /* set-up timer for runaway scripts, will be executed in<br>
++=C2=A0 =C2=A0 =C2=A0runaway_killer_thread, that is one, permanent thread =
running a glib<br>
++=C2=A0 =C2=A0 =C2=A0mainloop (rkt_loop) whose context (rkt_context) has a=
 timeout source<br>
++=C2=A0 =C2=A0 =C2=A0(rkt_source) */<br>
+=C2=A0 =C2=A0g_mutex_lock (&amp;authority-&gt;priv-&gt;rkt_timeout_pending=
_mutex);<br>
+=C2=A0 =C2=A0authority-&gt;priv-&gt;rkt_timeout_pending =3D FALSE;<br>
+=C2=A0 =C2=A0g_mutex_unlock (&amp;authority-&gt;priv-&gt;rkt_timeout_pendi=
ng_mutex);<br>
+-=C2=A0 authority-&gt;priv-&gt;rkt_source =3D g_timeout_source_new_seconds=
 (15);<br>
++=C2=A0 authority-&gt;priv-&gt;rkt_source =3D g_timeout_source_new_seconds=
 (RUNAWAY_KILLER_TIMEOUT);<br>
+=C2=A0 =C2=A0g_source_set_callback (authority-&gt;priv-&gt;rkt_source, rkt=
_on_timeout, authority, NULL);<br>
+=C2=A0 =C2=A0g_source_attach (authority-&gt;priv-&gt;rkt_source, authority=
-&gt;priv-&gt;rkt_context);<br>
+ <br>
+@@ -1069,6 +896,9 @@ execute_script_with_runaway_killer (PolkitBackendJsAu=
thority *authority,<br>
+ {<br>
+=C2=A0 =C2=A0bool ret;<br>
+ <br>
++=C2=A0 // tries to JS_ExecuteScript(), may hang for &gt; RUNAWAY_KILLER_T=
IMEOUT,<br>
++=C2=A0 // runaway_killer_thread makes sure the call returns, due to excep=
tion<br>
++=C2=A0 // injection<br>
+=C2=A0 =C2=A0runaway_killer_setup (authority);<br>
+=C2=A0 =C2=A0ret =3D JS_ExecuteScript (authority-&gt;priv-&gt;cx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0script,<br>
+@@ -1099,15 +929,15 @@ call_js_function_with_runaway_killer (PolkitBackend=
JsAuthority *authority,<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
+-static GList *<br>
+-polkit_backend_js_authority_get_admin_auth_identities (PolkitBackendInter=
activeAuthority *_authority,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*caller,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PolkitSubject=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PolkitIdentity=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0subject_is_local,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboolean=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0subject_is_active,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*actio=
n_id,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PolkitDetails=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*details)<br>
++GList *<br>
++polkit_backend_common_js_authority_get_admin_auth_identities (PolkitBacke=
ndInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tSubject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tIdentity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gbool=
ean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gbool=
ean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const=
 gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Polki=
tDetails=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*details)<br>
+ {<br>
+=C2=A0 =C2=A0PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUT=
HORITY (_authority);<br>
+=C2=A0 =C2=A0GList *ret =3D NULL;<br>
+@@ -1202,16 +1032,16 @@ polkit_backend_js_authority_get_admin_auth_identit=
ies (PolkitBackendInteractiveA<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
+-static PolkitImplicitAuthorization<br>
+-polkit_backend_js_authority_check_authorization_sync (PolkitBackendIntera=
ctiveAuthority *_authority,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitSubject=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*caller,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitSubject=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitIdentity=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *user_for_subject,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
bject_is_local,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gboolean=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
bject_is_active,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const gchar=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*action_id,<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitDetails=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*details,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PolkitImplicitAuthorization=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 implicit)<br>
++PolkitImplicitAuthorization<br>
++polkit_backend_common_js_authority_check_authorization_sync (PolkitBacken=
dInteractiveAuthority *_authority,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Subject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*caller,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Subject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Identity=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *user_for_subject,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboole=
an=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0subject_is_local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gboole=
an=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0subject_is_active,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const =
gchar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*action_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
Details=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*details,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Polkit=
ImplicitAuthorization=C2=A0 =C2=A0 =C2=A0 =C2=A0 implicit)<br>
+ {<br>
+=C2=A0 =C2=A0PolkitBackendJsAuthority *authority =3D POLKIT_BACKEND_JS_AUT=
HORITY (_authority);<br>
+=C2=A0 =C2=A0PolkitImplicitAuthorization ret =3D implicit;<br>
+@@ -1324,65 +1154,6 @@ js_polkit_log (JSContext=C2=A0 *cx,<br>
+ <br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
+-static const gchar *<br>
+-get_signal_name (gint signal_number)<br>
+-{<br>
+-=C2=A0 switch (signal_number)<br>
+-=C2=A0 =C2=A0 {<br>
+-#define _HANDLE_SIG(sig) case sig: return #sig;<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGHUP);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGINT);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGQUIT);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGILL);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGABRT);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGFPE);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGKILL);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGSEGV);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGPIPE);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGALRM);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGTERM);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGUSR1);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGUSR2);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGCHLD);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGCONT);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGSTOP);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGTSTP);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGTTIN);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGTTOU);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGBUS);<br>
+-#ifdef SIGPOLL<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGPOLL);<br>
+-#endif<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGPROF);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGSYS);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGTRAP);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGURG);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGVTALRM);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGXCPU);<br>
+-=C2=A0 =C2=A0 _HANDLE_SIG (SIGXFSZ);<br>
+-#undef _HANDLE_SIG<br>
+-=C2=A0 =C2=A0 default:<br>
+-=C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 return &quot;UNKNOWN_SIGNAL&quot;;<br>
+-}<br>
+-<br>
+-typedef struct<br>
+-{<br>
+-=C2=A0 GMainLoop *loop;<br>
+-=C2=A0 GAsyncResult *res;<br>
+-} SpawnData;<br>
+-<br>
+-static void<br>
+-spawn_cb (GObject=C2=A0 =C2=A0 =C2=A0 =C2=A0*source_object,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GAsyncResult=C2=A0 *res,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =C2=A0use=
r_data)<br>
+-{<br>
+-=C2=A0 SpawnData *data =3D (SpawnData *)user_data;<br>
+-=C2=A0 data-&gt;res =3D (GAsyncResult*)g_object_ref (res);<br>
+-=C2=A0 g_main_loop_quit (data-&gt;loop);<br>
+-}<br>
+-<br>
+ static bool<br>
+ js_polkit_spawn (JSContext=C2=A0 *cx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=C2=
=A0 =C2=A0 js_argc,<br>
+@@ -1440,21 +1211,21 @@ js_polkit_spawn (JSContext=C2=A0 *cx,<br>
+=C2=A0 =C2=A0g_main_context_push_thread_default (context);<br>
+ <br>
+=C2=A0 =C2=A0data.loop =3D loop;<br>
+-=C2=A0 utils_spawn ((const gchar *const *) argv,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010, /* timeout_sec=
onds */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* cancellab=
le */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spawn_cb,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data);<br>
++=C2=A0 polkit_backend_common_spawn ((const gchar *const *) argv,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010, /* timeout_seconds */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* cancellable */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0polkit_backend_common_spawn_cb,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data);<br>
+ <br>
+=C2=A0 =C2=A0g_main_loop_run (loop);<br>
+ <br>
+=C2=A0 =C2=A0g_main_context_pop_thread_default (context);<br>
+ <br>
+-=C2=A0 if (!utils_spawn_finish (data.res,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;exit_status,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;standard_output,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;standard_error,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;error))<br>
++=C2=A0 if (!polkit_backend_common_spawn_finish (data.res,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;exit_status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;standard_output,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;standard_error,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;error))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0JS_ReportErrorUTF8 (cx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error spawning helper: %s (%s, %d)&quot;,<br>
+@@ -1477,7 +1248,7 @@ js_polkit_spawn (JSContext=C2=A0 *cx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_printf (gstr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Helper was signal=
ed with signal %s (%d)&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_signal_name (WTERMSIG (ex=
it_status)),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 polkit_backend_common_get_sig=
nal_name (WTERMSIG (exit_status)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WTERMSIG (exit_status))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0g_string_append_printf (gstr, &quot;, stdout=3D=
`%s&#39;, stderr=3D`%s&#39;&quot;,<br>
+@@ -1542,381 +1313,5 @@ js_polkit_user_is_in_netgroup (JSContext=C2=A0 *cx=
,<br>
+=C2=A0 =C2=A0return ret;<br>
+ }<br>
+ <br>
+-<br>
+-<br>
+ /* ----------------------------------------------------------------------=
------------------------------ */<br>
+ <br>
+-typedef struct<br>
+-{<br>
+-=C2=A0 GSimpleAsyncResult *simple; /* borrowed reference */<br>
+-=C2=A0 GMainContext *main_context; /* may be NULL */<br>
+-<br>
+-=C2=A0 GCancellable *cancellable;=C2=A0 /* may be NULL */<br>
+-=C2=A0 gulong cancellable_handler_id;<br>
+-<br>
+-=C2=A0 GPid child_pid;<br>
+-=C2=A0 gint child_stdout_fd;<br>
+-=C2=A0 gint child_stderr_fd;<br>
+-<br>
+-=C2=A0 GIOChannel *child_stdout_channel;<br>
+-=C2=A0 GIOChannel *child_stderr_channel;<br>
+-<br>
+-=C2=A0 GSource *child_watch_source;<br>
+-=C2=A0 GSource *child_stdout_source;<br>
+-=C2=A0 GSource *child_stderr_source;<br>
+-<br>
+-=C2=A0 guint timeout_seconds;<br>
+-=C2=A0 gboolean timed_out;<br>
+-=C2=A0 GSource *timeout_source;<br>
+-<br>
+-=C2=A0 GString *child_stdout;<br>
+-=C2=A0 GString *child_stderr;<br>
+-<br>
+-=C2=A0 gint exit_status;<br>
+-} UtilsSpawnData;<br>
+-<br>
+-static void<br>
+-utils_child_watch_from_release_cb (GPid=C2=A0 =C2=A0 =C2=A0pid,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gint=C2=A0 =C2=A0 =C2=
=A0status,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer user_data)<br>
+-{<br>
+-}<br>
+-<br>
+-static void<br>
+-utils_spawn_data_free (UtilsSpawnData *data)<br>
+-{<br>
+-=C2=A0 if (data-&gt;timeout_source !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;timeout_source);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;timeout_source =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 /* Nuke the child, if necessary */<br>
+-=C2=A0 if (data-&gt;child_watch_source !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_watch_source);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_watch_source =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_pid !=3D 0)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 GSource *source;<br>
+-=C2=A0 =C2=A0 =C2=A0 kill (data-&gt;child_pid, SIGTERM);<br>
+-=C2=A0 =C2=A0 =C2=A0 /* OK, we need to reap for the child ourselves - we =
don&#39;t want<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* to use waitpid() because that might block th=
e calling<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* thread (the child might handle SIGTERM and u=
se several<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* seconds for cleanup/rollback).<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* So we use GChildWatch instead.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* Avoid taking a references to ourselves. but =
note that we need<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0* to pass the GSource so we can nuke it once h=
andled.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 source =3D g_child_watch_source_new (data-&gt;child_=
pid);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_set_callback (source,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(GSourceFunc) utils_child_watch_from_release=
_cb,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(GDestroyNotify) g_source_destroy);<br>
+-=C2=A0 =C2=A0 =C2=A0 /* attach source to the global default main context =
*/<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_attach (source, NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_unref (source);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_pid =3D 0;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_stdout !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_string_free (data-&gt;child_stdout, TRUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_stderr !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_string_free (data-&gt;child_stderr, TRUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_stdout_channel !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_io_channel_unref (data-&gt;child_stdout_channel);<=
br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_channel =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 if (data-&gt;child_stderr_channel !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_io_channel_unref (data-&gt;child_stderr_channel);<=
br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_channel =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_stdout_source !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_stdout_source);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_source =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 if (data-&gt;child_stderr_source !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_destroy (data-&gt;child_stderr_source);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_source =3D NULL;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;child_stdout_fd !=3D -1)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_warn_if_fail (close (data-&gt;child_stdout_fd) =3D=
=3D 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stdout_fd =3D -1;<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 if (data-&gt;child_stderr_fd !=3D -1)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_warn_if_fail (close (data-&gt;child_stderr_fd) =3D=
=3D 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;child_stderr_fd =3D -1;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;cancellable_handler_id &gt; 0)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_cancellable_disconnect (data-&gt;cancellable, data=
-&gt;cancellable_handler_id);<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;cancellable_handler_id =3D 0;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (data-&gt;main_context !=3D NULL)<br>
+-=C2=A0 =C2=A0 g_main_context_unref (data-&gt;main_context);<br>
+-<br>
+-=C2=A0 if (data-&gt;cancellable !=3D NULL)<br>
+-=C2=A0 =C2=A0 g_object_unref (data-&gt;cancellable);<br>
+-<br>
+-=C2=A0 g_slice_free (UtilsSpawnData, data);<br>
+-}<br>
+-<br>
+-/* called in the thread where @cancellable was cancelled */<br>
+-static void<br>
+-utils_on_cancelled (GCancellable *cancellable,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpo=
inter=C2=A0 =C2=A0 =C2=A0 user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
+-=C2=A0 GError *error;<br>
+-<br>
+-=C2=A0 error =3D NULL;<br>
+-=C2=A0 g_warn_if_fail (g_cancellable_set_error_if_cancelled (cancellable,=
 &amp;error));<br>
+-=C2=A0 g_simple_async_result_take_error (data-&gt;simple, error);<br>
+-=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
+-=C2=A0 g_object_unref (data-&gt;simple);<br>
+-}<br>
+-<br>
+-static gboolean<br>
+-utils_read_child_stderr (GIOChannel *channel,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GIOCondition condition,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpointer user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
+-=C2=A0 gchar buf[1024];<br>
+-=C2=A0 gsize bytes_read;<br>
+-<br>
+-=C2=A0 g_io_channel_read_chars (channel, buf, sizeof buf, &amp;bytes_read=
, NULL);<br>
+-=C2=A0 g_string_append_len (data-&gt;child_stderr, buf, bytes_read);<br>
+-=C2=A0 return TRUE;<br>
+-}<br>
+-<br>
+-static gboolean<br>
+-utils_read_child_stdout (GIOChannel *channel,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GIOCondition condition,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gpointer user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
+-=C2=A0 gchar buf[1024];<br>
+-=C2=A0 gsize bytes_read;<br>
+-<br>
+-=C2=A0 g_io_channel_read_chars (channel, buf, sizeof buf, &amp;bytes_read=
, NULL);<br>
+-=C2=A0 g_string_append_len (data-&gt;child_stdout, buf, bytes_read);<br>
+-=C2=A0 return TRUE;<br>
+-}<br>
+-<br>
+-static void<br>
+-utils_child_watch_cb (GPid=C2=A0 =C2=A0 =C2=A0pid,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gint=C2=A0 =C2=A0 =C2=A0status,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gpointer user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
+-=C2=A0 gchar *buf;<br>
+-=C2=A0 gsize buf_size;<br>
+-<br>
+-=C2=A0 if (g_io_channel_read_to_end (data-&gt;child_stdout_channel, &amp;=
buf, &amp;buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_string_append_len (data-&gt;child_stdout, buf, buf=
_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free (buf);<br>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 if (g_io_channel_read_to_end (data-&gt;child_stderr_channel, &amp;=
buf, &amp;buf_size, NULL) =3D=3D G_IO_STATUS_NORMAL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_string_append_len (data-&gt;child_stderr, buf, buf=
_size);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_free (buf);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 data-&gt;exit_status =3D status;<br>
+-<br>
+-=C2=A0 /* ok, child watch is history, make sure we don&#39;t free it in s=
pawn_data_free() */<br>
+-=C2=A0 data-&gt;child_pid =3D 0;<br>
+-=C2=A0 data-&gt;child_watch_source =3D NULL;<br>
+-<br>
+-=C2=A0 /* we&#39;re done */<br>
+-=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
+-=C2=A0 g_object_unref (data-&gt;simple);<br>
+-}<br>
+-<br>
+-static gboolean<br>
+-utils_timeout_cb (gpointer user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data =3D (UtilsSpawnData *)user_data;<br>
+-<br>
+-=C2=A0 data-&gt;timed_out =3D TRUE;<br>
+-<br>
+-=C2=A0 /* ok, timeout is history, make sure we don&#39;t free it in spawn=
_data_free() */<br>
+-=C2=A0 data-&gt;timeout_source =3D NULL;<br>
+-<br>
+-=C2=A0 /* we&#39;re done */<br>
+-=C2=A0 g_simple_async_result_complete_in_idle (data-&gt;simple);<br>
+-=C2=A0 g_object_unref (data-&gt;simple);<br>
+-<br>
+-=C2=A0 return FALSE; /* remove source */<br>
+-}<br>
+-<br>
+-static void<br>
+-utils_spawn (const gchar *const=C2=A0 *argv,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout_seconds,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GCancellable=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *cancellable,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GAsyncReadyCallback=C2=A0=
 callback,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user_data)<br>
+-{<br>
+-=C2=A0 UtilsSpawnData *data;<br>
+-=C2=A0 GError *error;<br>
+-<br>
+-=C2=A0 data =3D g_slice_new0 (UtilsSpawnData);<br>
+-=C2=A0 data-&gt;timeout_seconds =3D timeout_seconds;<br>
+-=C2=A0 data-&gt;simple =3D g_simple_async_result_new (NULL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 callback,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 user_data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (gpointer*)utils_spawn);<br>
+-=C2=A0 data-&gt;main_context =3D g_main_context_get_thread_default ();<br=
>
+-=C2=A0 if (data-&gt;main_context !=3D NULL)<br>
+-=C2=A0 =C2=A0 g_main_context_ref (data-&gt;main_context);<br>
+-<br>
+-=C2=A0 data-&gt;cancellable =3D cancellable !=3D NULL ? (GCancellable*)g_=
object_ref (cancellable) : NULL;<br>
+-<br>
+-=C2=A0 data-&gt;child_stdout =3D g_string_new (NULL);<br>
+-=C2=A0 data-&gt;child_stderr =3D g_string_new (NULL);<br>
+-=C2=A0 data-&gt;child_stdout_fd =3D -1;<br>
+-=C2=A0 data-&gt;child_stderr_fd =3D -1;<br>
+-<br>
+-=C2=A0 /* the life-cycle of UtilsSpawnData is tied to its GSimpleAsyncRes=
ult */<br>
+-=C2=A0 g_simple_async_result_set_op_res_gpointer (data-&gt;simple, data, =
(GDestroyNotify) utils_spawn_data_free);<br>
+-<br>
+-=C2=A0 error =3D NULL;<br>
+-=C2=A0 if (data-&gt;cancellable !=3D NULL)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 /* could already be cancelled */<br>
+-=C2=A0 =C2=A0 =C2=A0 error =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (g_cancellable_set_error_if_cancelled (data-&gt;c=
ancellable, &amp;error))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_simple_async_result_take_error (data=
-&gt;simple, error);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_simple_async_result_complete_in_idle=
 (data-&gt;simple);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (data-&gt;simple);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;cancellable_handler_id =3D g_cancellable_co=
nnect (data-&gt;cancellable,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_CALLBACK (=
utils_on_cancelled),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 error =3D NULL;<br>
+-=C2=A0 if (!g_spawn_async_with_pipes (NULL, /* working directory */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(gchar **) argv,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* envp */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GSpawnFlags(G_SPAWN_SEARCH_PAT=
H | G_SPAWN_DO_NOT_REAP_CHILD),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* child_setup */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* child_setup&#39;s use=
r_data */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_pid),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, /* gint *stdin_fd */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_stdout_fd=
),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(data-&gt;child_stderr_fd=
),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error))<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_prefix_error (&amp;error, &quot;Error spawning: &q=
uot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_simple_async_result_take_error (data-&gt;simple, e=
rror);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_simple_async_result_complete_in_idle (data-&gt;sim=
ple);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_object_unref (data-&gt;simple);<br>
+-=C2=A0 =C2=A0 =C2=A0 goto out;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (timeout_seconds &gt; 0)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 data-&gt;timeout_source =3D g_timeout_source_new_sec=
onds (timeout_seconds);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_set_priority (data-&gt;timeout_source, G_PR=
IORITY_DEFAULT);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_set_callback (data-&gt;timeout_source, util=
s_timeout_cb, data, NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_attach (data-&gt;timeout_source, data-&gt;m=
ain_context);<br>
+-=C2=A0 =C2=A0 =C2=A0 g_source_unref (data-&gt;timeout_source);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 data-&gt;child_watch_source =3D g_child_watch_source_new (data-&gt=
;child_pid);<br>
+-=C2=A0 g_source_set_callback (data-&gt;child_watch_source, (GSourceFunc) =
utils_child_watch_cb, data, NULL);<br>
+-=C2=A0 g_source_attach (data-&gt;child_watch_source, data-&gt;main_contex=
t);<br>
+-=C2=A0 g_source_unref (data-&gt;child_watch_source);<br>
+-<br>
+-=C2=A0 data-&gt;child_stdout_channel =3D g_io_channel_unix_new (data-&gt;=
child_stdout_fd);<br>
+-=C2=A0 g_io_channel_set_flags (data-&gt;child_stdout_channel, G_IO_FLAG_N=
ONBLOCK, NULL);<br>
+-=C2=A0 data-&gt;child_stdout_source =3D g_io_create_watch (data-&gt;child=
_stdout_channel, G_IO_IN);<br>
+-=C2=A0 g_source_set_callback (data-&gt;child_stdout_source, (GSourceFunc)=
 utils_read_child_stdout, data, NULL);<br>
+-=C2=A0 g_source_attach (data-&gt;child_stdout_source, data-&gt;main_conte=
xt);<br>
+-=C2=A0 g_source_unref (data-&gt;child_stdout_source);<br>
+-<br>
+-=C2=A0 data-&gt;child_stderr_channel =3D g_io_channel_unix_new (data-&gt;=
child_stderr_fd);<br>
+-=C2=A0 g_io_channel_set_flags (data-&gt;child_stderr_channel, G_IO_FLAG_N=
ONBLOCK, NULL);<br>
+-=C2=A0 data-&gt;child_stderr_source =3D g_io_create_watch (data-&gt;child=
_stderr_channel, G_IO_IN);<br>
+-=C2=A0 g_source_set_callback (data-&gt;child_stderr_source, (GSourceFunc)=
 utils_read_child_stderr, data, NULL);<br>
+-=C2=A0 g_source_attach (data-&gt;child_stderr_source, data-&gt;main_conte=
xt);<br>
+-=C2=A0 g_source_unref (data-&gt;child_stderr_source);<br>
+-<br>
+- out:<br>
+-=C2=A0 ;<br>
+-}<br>
+-<br>
+-gboolean<br>
+-utils_spawn_finish (GAsyncResult=C2=A0 =C2=A0*res,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gin=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*out_exit_status,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gch=
ar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out_standard_output,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gch=
ar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0**out_standard_error,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GEr=
ror=C2=A0 =C2=A0 =C2=A0 =C2=A0 **error)<br>
+-{<br>
+-=C2=A0 GSimpleAsyncResult *simple =3D G_SIMPLE_ASYNC_RESULT (res);<br>
+-=C2=A0 UtilsSpawnData *data;<br>
+-=C2=A0 gboolean ret =3D FALSE;<br>
+-<br>
+-=C2=A0 g_return_val_if_fail (G_IS_ASYNC_RESULT (res), FALSE);<br>
+-=C2=A0 g_return_val_if_fail (error =3D=3D NULL || *error =3D=3D NULL, FAL=
SE);<br>
+-<br>
+-=C2=A0 g_warn_if_fail (g_simple_async_result_get_source_tag (simple) =3D=
=3D utils_spawn);<br>
+-<br>
+-=C2=A0 if (g_simple_async_result_propagate_error (simple, error))<br>
+-=C2=A0 =C2=A0 goto out;<br>
+-<br>
+-=C2=A0 data =3D (UtilsSpawnData*)g_simple_async_result_get_op_res_gpointe=
r (simple);<br>
+-<br>
+-=C2=A0 if (data-&gt;timed_out)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 g_set_error (error,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_IO=
_ERROR,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0G_IO=
_ERROR_TIMED_OUT,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quo=
t;Timed out after %d seconds&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data=
-&gt;timeout_seconds);<br>
+-=C2=A0 =C2=A0 =C2=A0 goto out;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 if (out_exit_status !=3D NULL)<br>
+-=C2=A0 =C2=A0 *out_exit_status =3D data-&gt;exit_status;<br>
+-<br>
+-=C2=A0 if (out_standard_output !=3D NULL)<br>
+-=C2=A0 =C2=A0 *out_standard_output =3D g_strdup (data-&gt;child_stdout-&g=
t;str);<br>
+-<br>
+-=C2=A0 if (out_standard_error !=3D NULL)<br>
+-=C2=A0 =C2=A0 *out_standard_error =3D g_strdup (data-&gt;child_stderr-&gt=
;str);<br>
+-<br>
+-=C2=A0 ret =3D TRUE;<br>
+-<br>
+- out:<br>
+-=C2=A0 return ret;<br>
+-}<br>
+diff --git a/test/data/etc/polkit-1/rules.d/10-testing.rules b/test/data/e=
tc/polkit-1/rules.d/10-testing.rules<br>
+index 98bf062..e346b5d 100644<br>
+--- a/test/data/etc/polkit-1/rules.d/10-testing.rules<br>
++++ b/test/data/etc/polkit-1/rules.d/10-testing.rules<br>
+@@ -189,8 +189,10 @@ polkit.addRule(function(action, subject) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} catch (error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error =3D=3D &quot;Ter=
minating runaway script&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return polkit.Res=
ult.YES;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://polkit=
.Result.NO" rel=3D"noreferrer" target=3D"_blank">polkit.Result.NO</a>;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Inverted logic=
 to accomodate Duktape&#39;s model as well, which<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // will always fa=
il with negation, on timeouts<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D=
"http://polkit.Result.NO" rel=3D"noreferrer" target=3D"_blank">polkit.Resul=
t.NO</a>;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return polkit.Result.YES;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ });<br>
+diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/pol=
kitbackend/test-polkitbackendjsauthority.c<br>
+index f97e0e0..2103b17 100644<br>
+--- a/test/polkitbackend/test-polkitbackendjsauthority.c<br>
++++ b/test/polkitbackend/test-polkitbackendjsauthority.c<br>
+@@ -328,7 +328,7 @@ static const RulesTestCase rules_test_cases[] =3D {<br=
>
+=C2=A0 =C2=A0 =C2=A0&quot;net.company.run_away_script&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;unix-user:root&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0NULL,<br>
+-=C2=A0 =C2=A0 POLKIT_IMPLICIT_AUTHORIZATION_AUTHORIZED,<br>
++=C2=A0 =C2=A0 POLKIT_IMPLICIT_AUTHORIZATION_NOT_AUTHORIZED,<br>
+=C2=A0 =C2=A0},<br>
+ <br>
+=C2=A0 =C2=A0{<br>
+-- <br>
+2.20.1<br>
+<br>
diff --git a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure=
-to-call-JS_Init-and-JS_ShutDown-e.patch b/meta-oe/recipes-extended/polkit/=
polkit/0003-jsauthority-ensure-to-call-JS_Init-and-JS_ShutDown-e.patch<br>
deleted file mode 100644<br>
index 9e9755e44..000000000<br>
--- a/meta-oe/recipes-extended/polkit/polkit/0003-jsauthority-ensure-to-cal=
l-JS_Init-and-JS_ShutDown-e.patch<br>
+++ /dev/null<br>
@@ -1,63 +0,0 @@<br>
-From 7799441b9aa55324160deefbc65f9d918b8c94c1 Mon Sep 17 00:00:00 2001<br>
-From: Xi Ruoyao &lt;xry111@mengyan1223.wang&gt;<br>
-Date: Tue, 10 Aug 2021 18:52:56 +0800<br>
-Subject: [PATCH] jsauthority: ensure to call JS_Init() and JS_ShutDown()<b=
r>
- exactly once<br>
-<br>
-Before this commit, we were calling JS_Init() in<br>
-polkit_backend_js_authority_class_init and never called JS_ShutDown.<br>
-This is actually a misusage of SpiderMonkey API.=C2=A0 Quote from a commen=
t<br>
-in js/Initialization.h (both mozjs-78 and mozjs-91):<br>
-<br>
-=C2=A0 =C2=A0 It is currently not possible to initialize SpiderMonkey mult=
iple<br>
-=C2=A0 =C2=A0 times (that is, calling JS_Init/JSAPI methods/JS_ShutDown in=
 that<br>
-=C2=A0 =C2=A0 order, then doing so again).<br>
-<br>
-This misusage does not cause severe issues with mozjs-78.=C2=A0 However, w=
hen<br>
-we eventually port jsauthority to use mozjs-91, bad thing will happen:<br>
-see the test failure mentioned in #150.<br>
-<br>
-This commit is tested with both mozjs-78 and mozjs-91, all tests pass<br>
-with it.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/polk=
it/polkit/-/merge_requests/91" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/polkit/polkit/-/merge_requests/91</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- src/polkitbackend/polkitbackendjsauthority.cpp | 10 +++++++---<br>
- 1 file changed, 7 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitba=
ckend/polkitbackendjsauthority.cpp<br>
-index 41d8d5c..38dc001 100644<br>
---- a/src/polkitbackend/polkitbackendjsauthority.cpp<br>
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp<br>
-@@ -75,6 +75,13 @@<br>
- <br>
- /* ----------------------------------------------------------------------=
------------------------------ */<br>
- <br>
-+static class JsInitHelperType<br>
-+{<br>
-+public:<br>
-+=C2=A0 =C2=A0 =C2=A0 JsInitHelperType() { JS_Init(); }<br>
-+=C2=A0 =C2=A0 =C2=A0 ~JsInitHelperType() { JS_ShutDown(); }<br>
-+} JsInitHelper;<br>
-+<br>
- struct _PolkitBackendJsAuthorityPrivate<br>
- {<br>
-=C2=A0 =C2=A0gchar **rules_dirs;<br>
-@@ -589,7 +596,6 @@ polkit_backend_js_authority_finalize (GObject *object)=
<br>
-=C2=A0 =C2=A0delete authority-&gt;priv-&gt;js_polkit;<br>
- <br>
-=C2=A0 =C2=A0JS_DestroyContext (authority-&gt;priv-&gt;cx);<br>
--=C2=A0 /* JS_ShutDown (); */<br>
- <br>
-=C2=A0 =C2=A0G_OBJECT_CLASS (polkit_backend_js_authority_parent_class)-&gt=
;finalize (object);<br>
- }<br>
-@@ -665,8 +671,6 @@ polkit_backend_js_authority_class_init (PolkitBackendJ=
sAuthorityClass *klass)<br>
- <br>
- <br>
-=C2=A0 =C2=A0g_type_class_add_private (klass, sizeof (PolkitBackendJsAutho=
rityPrivate));<br>
--<br>
--=C2=A0 JS_Init ();<br>
- }<br>
- <br>
- /* ----------------------------------------------------------------------=
------------------------------ */<br>
diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119=
.bb" rel=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a> b/meta-oe/rec=
ipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" rel=3D"noreferrer" =
target=3D"_blank">polkit_0.119.bb</a><br>
index a9559c4db..186801a09 100644<br>
--- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" re=
l=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a><br>
+++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.119.bb" re=
l=3D"noreferrer" target=3D"_blank">polkit_0.119.bb</a><br>
@@ -5,7 +5,7 @@ LICENSE =3D &quot;LGPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D155db86cdbafa7532b41f=
390409283eb \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b01331=
76d0504c87a0ded39db4&quot;<br>
<br>
-DEPENDS =3D &quot;expat glib-2.0 intltool-native mozjs-91&quot;<br>
+DEPENDS =3D &quot;expat glib-2.0 intltool-native duktape&quot;<br>
<br>
=C2=A0inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspec=
tion features_check<br>
<br>
@@ -25,16 +25,16 @@ PAM_SRC_URI =3D &quot;file://polkit-1_pam.patch&quot;<b=
r>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/software/polk=
it/releases/polkit-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-make-netgroup-support=
-optional.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-jsauthority-port-to-m=
ozjs-91.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-jsauthority-ensure-to=
-call-JS_Init-and-JS_ShutDown-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-pkexec-local-privileg=
e-escalation-CVE-2021-4034.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-CVE-2021-4115-GHSL-20=
21-077-fix.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Added-support-for-duk=
tape-as-JS-engine.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c8579fdb86e94295404211285fee0722ad04893f=
0213e571bd75c00972fd1f5c&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-os-type=3Dmoblin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-man=
-pages \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-lib=
elogind \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-duktape \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0do_compile:prepend () {<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96194): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96194" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96194</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89996103/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89996103/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000003753eb05daf48c32--

