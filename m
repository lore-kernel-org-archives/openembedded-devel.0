Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB8DCCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 18:34:40 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web11.3180.1759775671818150376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 11:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GyVRyWxd;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-633c1b740c5so6019198d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759775671; x=1760380471; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xIRBG9s6v1zSCjPb+1025rPHtKCvqLt2cgfWbXISVI=;
        b=GyVRyWxdCUMXa0IE3XSFAZwZt5YYiotMKzsgTqSDJ203LPptxAUFqSrCXCcuRc5B/m
         EgxT5dfFSh6DYRiZpX61eq4acCupmjZU+K3ihiJNZYBEZNa+WDcoLx0EpNyiQgfhn7tJ
         fX72ofQ8gHsN+u0qlNQ++qOAiAViUi1zkLwKhuq29Mo9KNJ7ycriqA+KkCCzocBfym+o
         hCH+lmj+cyuie3xi98t0gaSVPEPNBjj16pW8MzrdZB0K6LvYVf5ZlFVuze+OA1bf0HBq
         bndCIaNTrybe/u51GYWsAZwqy/BfY0B4qAeldAK51HaNnvH9/lvBRcQwptwLHmE9eg83
         UBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775671; x=1760380471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xIRBG9s6v1zSCjPb+1025rPHtKCvqLt2cgfWbXISVI=;
        b=F1YVIQLfH3rJkHJgFhQiESXXhbuxnGHYF4uvdbzhpvpILNHcmjXHZXGBf/M1cymSMc
         eX84LsHErJONsQ6COuQ3cFyvgE7SipyIGgu1yrw3U6dKiyvPlCL2qbgdwjy1uBdJIADI
         3N7zL49/NYinHD8yAV4l5XJqw1R4Bac31CUAjuqo+N2GlcqaKDIaD8l5s7RRjI3nmK5N
         FfLQWAA2J+3DJaGn62F7PwIn2i3r5U5vZTSpnIS866nOJQEmTpDmE4pe0p9scPrVqpk6
         zEZaKE39n3reKX4ukzpCLrtmYcgn2ZtwiOuO8tunoETEzcLyNQKQSgbD7FXKFnIKjV+u
         +pag==
X-Gm-Message-State: AOJu0YxIf4cctHXeNf9oaIR1jKFsV7ji0hsdN7jAU/1FJtvSMIp4N4eG
	fbo9QYe8RT/BdBcTQxXkKS6NpXj0V0jRd2ROXhmBYgxnLxaN/vfEHupzsUGir9NrtoagELCEEUO
	HfTeR/b9BGmMz5lB1+aOOtAH1NS5a7FfqzTtA4F0=
X-Gm-Gg: ASbGncvuto2gQBQsx2vTPNooCpuwTFTTmehL/B7Cfz+q9KA55z8ofA+8EwHPz3cNK99
	rhF16yvt+hXyhbadMap+WAPsqCTbPWu2j4UYm5A2Ewnqv46XKsr6DcJLCJEko5b2a4fDhzZ2woN
	yvm+j0x4SRzM3WapfyONYxAHh6Ln1p9EQlIwzPocXXmxkFyNJnmO3799YI41P+6Q8vPWjMmMeSO
	3c5UQFs+/siYd5qG4lgbGimYH+WBO1PsKBjNC7js6fb3BdSAsCz812F5f72eGAxqDTGqpejdDgB
	qeRb3vyeGNQovN5oRM4PYu5ABmUCSJaKTHq22OsnEHUmgDhRkbYI0mgASgspsCvMtIyhWoW/3B6
	4PKKWmw==
X-Google-Smtp-Source: AGHT+IENXg16Dw+kSAwGJXMg71V96Q79nIV21jYg7b7Ny4+ATXIDCx0VImL6S+vO8Mbo18RqZrQHg0IijBp5vtcZYRY=
X-Received: by 2002:a53:a10f:0:b0:633:a95e:ef08 with SMTP id
 956f58d0204a3-63b9a05f5e8mr10225388d50.5.1759775670788; Mon, 06 Oct 2025
 11:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251005101311.1483435-1-skandigraun@gmail.com>
In-Reply-To: <20251005101311.1483435-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Oct 2025 11:34:02 -0700
X-Gm-Features: AS18NWAX4d_n2LDoUECB5wJR52f1oz2w6yuGnySDyCCA-79rfPB0kYwdAF9OgEs
Message-ID: <CAMKF1sqgoCoZFFO9FWTmzAjECgsk7hCMdhNzZQXcTRzzkjk41A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] dovecot: upgrade 2.3.21.1 -> 2.4.1-4
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 18:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120310

fails to build on musl
https://errors.yoctoproject.org/Errors/Details/884664/

On Sun, Oct 5, 2025 at 3:13=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Remove obsolete CVE_STATUS variable: CVE-2016-4983 is marked for v2.3.
>
> Drop 0001-not-check-pandoc.patch because it became obsolete, pandoc is
> not used anymore.
> Drop 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch, because it is
> included in this release.
>
> Changelog:
> 2.4: https://github.com/dovecot/core/releases/tag/2.4.0
> 2.4.1: https://github.com/dovecot/core/releases/tag/2.4.1
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...vert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch | 59 ++++---------------
>  ...bunwind-instead-of-libunwind-generic.patch | 21 +++----
>  .../dovecot/0001-not-check-pandoc.patch       | 28 ---------
>  ...5b54a408d12fce0c94ab0bbaedbb5ef69830.patch | 24 --------
>  ...dovecot_2.3.21.1.bb =3D> dovecot_2.4.1-4.bb} | 14 ++---
>  5 files changed, 29 insertions(+), 117 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-=
not-check-pandoc.patch
>  delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/1ccd5=
b54a408d12fce0c94ab0bbaedbb5ef69830.patch
>  rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.1.bb =3D>=
 dovecot_2.4.1-4.bb} (81%)
>
> diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-configu=
re.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch b/meta-networking/recip=
es-support/dovecot/dovecot/0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_L=
INK-state.patch
> index 4fcfa48b99..abcf727a3b 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-c=
onvert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
> +++ b/meta-networking/recipes-support/dovecot/dovecot/0001-configure.ac-c=
onvert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch
> @@ -16,58 +16,25 @@ Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
>   m4/ioloop.m4 | 9 +++------
>   2 files changed, 5 insertions(+), 10 deletions(-)
>
> -diff --git a/m4/glibc.m4 b/m4/glibc.m4
> -index 5d722aa..ce088d3 100644
> ---- a/m4/glibc.m4
> -+++ b/m4/glibc.m4
> -@@ -17,7 +17,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
> +--- ./m4/glibc.m4      2025-10-04 22:42:24.336965366 +0200
> ++++ ./m4/glibc.m4      2025-10-04 22:47:30.578745494 +0200
> +@@ -2,7 +2,7 @@
>     dnl * Old glibcs have broken posix_fallocate(). Make sure not to use =
it.
>     dnl * It may also be broken in AIX.
>     AC_CACHE_CHECK([whether posix_fallocate() works],i_cv_posix_fallocate=
_works,[
> --    AC_TRY_RUN([
> -+    AC_TRY_LINK([
> +-    AC_RUN_IFELSE([AC_LANG_PROGRAM([[
> ++    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
>         #define _XOPEN_SOURCE 600
>         #include <stdio.h>
>         #include <stdlib.h>
> -@@ -26,7 +26,7 @@ AC_DEFUN([DOVECOT_GLIBC], [
> -       #if defined(__GLIBC__) && (__GLIBC__ < 2 || __GLIBC_MINOR__ < 7)
> -         possibly broken posix_fallocate
> -       #endif
> --      int main() {
> -+      ], [
> -         int fd =3D creat("conftest.temp", 0600);
> -         int ret;
> -         if (fd =3D=3D -1) {
> -@@ -35,8 +35,6 @@ AC_DEFUN([DOVECOT_GLIBC], [
> -         }
> -         ret =3D posix_fallocate(fd, 1024, 1024) < 0 ? 1 : 0;
> -         unlink("conftest.temp");
> --        return ret;
> --      }
> -     ], [
> -       i_cv_posix_fallocate_works=3Dyes
> -     ], [
> -diff --git a/m4/ioloop.m4 b/m4/ioloop.m4
> -index 0f7dde0..f40fd62 100644
> ---- a/m4/ioloop.m4
> -+++ b/m4/ioloop.m4
> -@@ -4,13 +4,10 @@ AC_DEFUN([DOVECOT_IOLOOP], [
> +--- ./m4/ioloop.m4.orig        2025-10-04 22:47:44.656705137 +0200
> ++++ ./m4/ioloop.m4     2025-10-04 22:48:32.379618966 +0200
> +@@ -4,7 +4,7 @@
>
> -   if test "$ioloop" =3D "best" || test "$ioloop" =3D "epoll"; then
> +   AS_IF([test "$ioloop" =3D "best" || test "$ioloop" =3D "epoll"], [
>       AC_CACHE_CHECK([whether we can use epoll],i_cv_epoll_works,[
> --      AC_TRY_RUN([
> -+      AC_TRY_LINK([
> +-      AC_RUN_IFELSE([AC_LANG_PROGRAM([[
> ++      AC_LINK_IFELSE([AC_LANG_PROGRAM([[
>           #include <sys/epoll.h>
> --
> --        int main()
> --        {
> --      return epoll_create(5) < 1;
> --        }
> -+      ], [
> -+      epoll_create(5) < 1;
> -       ], [
> -         i_cv_epoll_works=3Dyes
> -       ], [
> ---
> -2.25.1
> -
> +       ]], [[
> +         return epoll_create(5) < 1;
> diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Chec=
k-for-libunwind-instead-of-libunwind-generic.patch b/meta-networking/recipe=
s-support/dovecot/dovecot/0001-m4-Check-for-libunwind-instead-of-libunwind-=
generic.patch
> index ec7a26a329..697fc02193 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-l=
ibunwind-instead-of-libunwind-generic.patch
> +++ b/meta-networking/recipes-support/dovecot/dovecot/0001-m4-Check-for-l=
ibunwind-instead-of-libunwind-generic.patch
> @@ -14,17 +14,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  diff --git a/m4/want_unwind.m4 b/m4/want_unwind.m4
>  index cadb62b..5517314 100644
> ---- a/m4/want_unwind.m4
> -+++ b/m4/want_unwind.m4
> -@@ -2,7 +2,7 @@ AC_DEFUN([DOVECOT_WANT_UNWIND], [
> +--- ./m4/want_unwind.m4        2025-10-04 22:57:09.371034202 +0200
> ++++ ./m4/want_unwind.m4        2025-10-04 22:57:30.954794164 +0200
> +@@ -2,7 +2,7 @@
>     have_libunwind=3Dno
> +
>     AS_IF([test "$want_libunwind" !=3D "no"], [
> -     PKG_CHECK_EXISTS([libunwind], [
> --      PKG_CHECK_MODULES([LIBUNWIND], [libunwind-generic],[
> -+      PKG_CHECK_MODULES([LIBUNWIND], [libunwind],[
> -         have_libunwind=3Dyes
> -       AC_DEFINE([HAVE_LIBUNWIND],,[Define this if you have libunwind])
> -       ])
> ---
> -2.31.1
> -
> +-    PKG_CHECK_MODULES([LIBUNWIND], [libunwind-generic], [have_libunwind=
=3Dyes], [
> ++    PKG_CHECK_MODULES([LIBUNWIND], [libunwind], [have_libunwind=3Dyes],=
 [
> +       have_libunwind=3Dno
> +
> +       AS_IF([test "$want_libunwind" =3D "yes"], [
> diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-not-che=
ck-pandoc.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-not-=
check-pandoc.patch
> deleted file mode 100644
> index af69c82f0f..0000000000
> --- a/meta-networking/recipes-support/dovecot/dovecot/0001-not-check-pand=
oc.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 8c7d143ff28441c8b74b0f518dd2281239aede3d Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@cn.fujitsu.com>
> -Date: Fri, 15 Jan 2021 11:10:22 +0900
> -Subject: [PATCH] not check pandoc
> -
> -Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ----
> -Upstream-Status: Pending
> -
> - m4/dovecot.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/m4/dovecot.m4 b/m4/dovecot.m4
> -index 2b5d895..ece8489 100644
> ---- a/m4/dovecot.m4
> -+++ b/m4/dovecot.m4
> -@@ -447,7 +447,7 @@ AC_DEFUN([DC_PANDOC], [
> -   dnl Optional tool for making documentation
> -   AC_CHECK_PROGS(PANDOC, [pandoc], [true])
> -
> --  AS_IF([test "$PANDOC" =3D "true"], [
> -+  AS_IF([test "$PANDOC" =3D "false"], [
> -    AS_IF([test ! -e README], [
> -      AC_MSG_ERROR([Cannot produce documentation without pandoc - disabl=
e with PANDOC=3Dfalse ./configure])
> -    ])
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408=
d12fce0c94ab0bbaedbb5ef69830.patch b/meta-networking/recipes-support/doveco=
t/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
> deleted file mode 100644
> index 0765d963c1..0000000000
> --- a/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0=
c94ab0bbaedbb5ef69830.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
> -From: fundawang <fundawang@yeah.net>
> -Date: Sun, 27 Oct 2024 22:11:21 +0800
> -Subject: [PATCH] configure: Explicitly check for icu-uc
> -
> -Ensure we link against libicu-uc when it's split in v76.
> -
> -Upstream-Status: Backport [https://github.com/dovecot/core/commit/1ccd5b=
54a408d12fce0c94ab0bbaedbb5ef69830]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - m4/want_icu.m4 | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/m4/want_icu.m4
> -+++ b/m4/want_icu.m4
> -@@ -1,7 +1,7 @@
> - AC_DEFUN([DOVECOT_WANT_ICU], [
> -   if test "$want_icu" !=3D "no"; then
> -     if test "$PKG_CONFIG" !=3D "" && $PKG_CONFIG --exists icu-i18n 2>/d=
ev/null; then
> --      PKG_CHECK_MODULES(LIBICU, icu-i18n)
> -+      PKG_CHECK_MODULES(LIBICU, [icu-i18n icu-uc])
> -       have_icu=3Dyes
> -       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization sup=
port for FTS])
> -     elif test "$want_icu" =3D "yes"; then
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb =
b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> similarity index 81%
> rename from meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
> rename to meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> index 3177cdb1d7..aaa2d8a1a1 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
> @@ -1,19 +1,21 @@
>  SUMMARY =3D "Dovecot is an open source IMAP and POP3 email server"
>  HOMEPAGE =3D "https://www.dovecot.org/"
> -DESCRIPTION =3D "Dovecot is an open source IMAP and POP3 email server fo=
r Linux/UNIX-like systems, written with security primarily in mind. Dovecot=
 is an excellent choice for both small and large installations. It's fast, =
simple to set up, requires no special administration and it uses very littl=
e memory."
> +DESCRIPTION =3D "Dovecot is an open source IMAP and POP3 email \
> +server for Linux/UNIX-like systems, written with security primarily \
> +in mind. Dovecot is an excellent choice for both small and large \
> +installations. It's fast, simple to set up, requires no special \
> +administration and it uses very little memory."
>  SECTION =3D "mail"
>  LICENSE =3D "LGPL-2.1-only & MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2956560272e5b31d9d64f03111732=
048"
>
> -SRC_URI =3D "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
> +SRC_URI =3D "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
>             file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-st=
ate.patch \
>             file://dovecot.service \
>             file://dovecot.socket \
> -           file://0001-not-check-pandoc.patch \
>             file://0001-m4-Check-for-libunwind-instead-of-libunwind-gener=
ic.patch \
> -           file://1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch \
>             "
> -SRC_URI[sha256sum] =3D "2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a03=
2eb425d2c249097e"
> +SRC_URI[sha256sum] =3D "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0e=
fe24948cbb32ae00"
>
>  DEPENDS =3D "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
>  CFLAGS +=3D "-I${STAGING_INCDIR}/tirpc"
> @@ -72,5 +74,3 @@ FILES:${PN} +=3D "${libdir}/dovecot/*plugin.so \
>  FILES:${PN}-staticdev +=3D "${libdir}/dovecot/*/*.a"
>  FILES:${PN}-dev +=3D "${libdir}/dovecot/libdovecot*.so"
>  FILES:${PN}-dbg +=3D "${libdir}/dovecot/*/.debug"
> -
> -CVE_STATUS[CVE-2016-4983] =3D "not-applicable-platform: Affects only pos=
tinstall script on specific distribution."
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120242): https://lists.openembedded.org/g/openembedde=
d-devel/message/120242
> Mute This Topic: https://lists.openembedded.org/mt/115598694/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

