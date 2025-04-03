Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A01C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 15:53:42 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.17060.1743695618745216377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 08:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f8+iOmlO;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f6a92f2328so546782b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743695618; x=1744300418; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY8wl4kjZH9VltqwgGxxMNG4dD0D4YJRfkNsWnEcYIU=;
        b=f8+iOmlOq0mqCwRTaL9lpmxaPMJhsMreOG7YX3IUm+xGlkEVUieb7JOmE9t23zLbrO
         +IHPQDj/p5hghQBCcjVukBobcGQJmzv9J2IZxnGY5gj7f2S6wpoVy0IzNDCZDeiv5t7D
         a9ncVyAoVA7sCkPHoP2s8nw8VtM0ktIlP/qFM9l8qP1hxGQrXjzCWOPrLnb1eHkjSzOW
         Lv6+IjPpzDKl5clDGjV+KBFunYDHesx1+XiNzzwtl9D6nLnLC+qIjPDsfFjdZBI11Vl3
         YkN32QFqMotll9RcGM+1/caOty18mIE4N+f4rD/lcwRVJ91s7kuULbnaRict74axSwci
         wAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695618; x=1744300418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY8wl4kjZH9VltqwgGxxMNG4dD0D4YJRfkNsWnEcYIU=;
        b=O5NhPyqrddWqS+MWUE0dR1e7ae7A9gkZ+Vwdq4jBqz9YJ80JFLHgB5WIspuk/mKI2f
         4TEZlR0scmLbmhwR1j0Oli0/rwe8voSr7zMi3Sf7Enb0hwnmUim1moFl+NU+erXQrEQc
         NEZ6wl4zJc56jNvBRYciWplSZ4StqShkZq2M0KIThp2Hb7dfMDU3WaNl9/e2px6SJMqH
         Luu2ijGSgClA0fRa5KG5xXpMfk8mU5ZArORwAwma+PJMW5jhOGeXJQO6T8OYeDJked2h
         e9Rf35RaX5WalJ9dPBydxNrzEVIIMa3KjBt5N9gmJpNwM6bf0LcrtR5Mr8ljhUGuDhPk
         iorA==
X-Gm-Message-State: AOJu0Yx3K2Z03+I4DCyrhh3pHS1Cx1E7sr0sLxt597X0P0B+r7DEyZkf
	nOo5tuGvnRiOS35fVcpbuSIu385Z4z8JyvRq0eZt5zfT1xebmOldntC/5liv2pPiFpDGqkz0mHX
	TIwdY3MdsNyBaoWaTjIYrQ5xQuOU=
X-Gm-Gg: ASbGnctEwgx6Kf2C40PZ/nd+7PI7dY5vnCeQXvEpMyO80Zs/w+iXRswYTKXIb+3HMtO
	adm74jO9aCT1YhmLWbtUH47AKGNLZtOGsNsx7H5B1GA+uUdI8Rth5RiplUqNM3UhdVBkHPD3R8r
	L5neVTOcuMGAnc0fpISt23ewNl
X-Google-Smtp-Source: AGHT+IHl3o6oSKAo7KGkZTGPtlMxJvcP8jQiBMEtfv5rJrJ0dxtYJXACxcM4X3IC4jx6Gpve34uSC1Rxe/pVCoL+faA=
X-Received: by 2002:a05:6808:200a:b0:3fa:1d22:6d28 with SMTP id
 5614622812f47-4003d5c6b28mr2217328b6e.18.1743695617851; Thu, 03 Apr 2025
 08:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250403061351.922250-1-mark.yang@lge.com>
In-Reply-To: <20250403061351.922250-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 08:53:11 -0700
X-Gm-Features: AQ5f1JqSVG_DuLLIAKQRluma2dFudQl0Ho_SeQaHL--Kd-rYT6t4lMFntJs68bc
Message-ID: <CAMKF1sr4Q42aUneu0G=dyMSNibKvSbYkJDaQ_Ba+GdGnWqr-ig@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sharutils: fix build with gcc-15.0.1
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 15:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116544

On Wed, Apr 2, 2025 at 11:14=E2=80=AFPM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * gcc-15 uses gnu23 standard for c:
>   https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D55e3bd376b2214e=
200fa76d12b67ff259b06c212
>   bool is included as a reserved word, causing an error due to duplicate =
declaration.
>
>   Also, when parameters are empty, an error occurs. Therefore, when using
>   functions from the standard library, modify the defines in configure.ac
>   and source code to use standard library functions.
>
> * ../../sharutils-4.15.2/lib/system.h:51:36: error: expected ';', identif=
ier or '(' before 'bool'
>    51 | typedef enum {false =3D 0, true =3D 1} bool;
>       |                                    ^~~~
>   ../../sharutils-4.15.2/lib/system.h:79:7: error: conflicting types for =
'fdopen'; have 'FILE *(void)'
>    79 | FILE *fdopen ();
>       |       ^~~~~~
>   In file included from ../lib/stdio.h:43,
>                  from ../../sharutils-4.15.2/libopts/autoopts/options.h:4=
2,
>                  from ../../sharutils-4.15.2/src/shar-opts.h:49:
>   recipe-sysroot/usr/include/stdio.h:299:14: note: previous declaration o=
f 'fdopen' with type 'FILE *(int,  const char *)'
>   299 | extern FILE *fdopen (int __fd, const char *__modes) __THROW
>       |              ^~~~~~
>   ../../sharutils-4.15.2/lib/system.h:82:7: error: conflicting types for =
'popen'; have 'FILE *(void)'
>    82 | FILE *popen ();
>       |       ^~~~~
>   recipe-sysroot/usr/include/stdio.h:893:14: note: previous declaration o=
f 'popen' with type 'FILE *(const char *, const char *)'
>   893 | extern FILE *popen (const char *__command, const char *__modes)
>       |              ^~~~~
>   ../../sharutils-4.15.2/src/shar.c:112:12: error: conflicting types for =
'localtime'; have 'struct tm *(void)'
>   112 | struct tm *localtime ();
>       |            ^~~~~~~~~
>   In file included from ../lib/time.h:39,
>                  from ../lib/sys/stat.h:44,
>                  from ../../sharutils-4.15.2/lib/system.h:32:
>   recipe-sysroot/usr/include/time.h:136:19: note: previous declaration of=
 'localtime' with type 'struct tm *(const time_t *)' {aka 'struct tm *(cons=
t long int *)'}
>   136 | extern struct tm *localtime (const time_t *__timer) __THROW;
>       |                   ^~~~~~~~~
>   ../../sharutils-4.15.2/src/uudecode.c:85:16: error: conflicting types f=
or 'getpwnam'; have 'struct passwd *(void)'
>    85 | struct passwd *getpwnam ();
>       |                ^~~~~~~~
>   In file included from ../../sharutils-4.15.2/src/uudecode.c:76:
>   recipe-sysroot/usr/include/pwd.h:116:23: note: previous declaration of =
'getpwnam' with type 'struct passwd *(const char *)'
>   116 | extern struct passwd *getpwnam (const char *__name) __nonnull ((1=
));
>       |                       ^~~~~~~~
>       |            ^~~~~~~~~
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  ...0001-fix-build-with-gcc-15.0.1-error.patch | 166 ++++++++++++++++++
>  .../sharutils/sharutils_4.15.2.bb             |   1 +
>  2 files changed, 167 insertions(+)
>  create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-fix-=
build-with-gcc-15.0.1-error.patch
>
> diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-w=
ith-gcc-15.0.1-error.patch b/meta-oe/recipes-support/sharutils/sharutils/00=
01-fix-build-with-gcc-15.0.1-error.patch
> new file mode 100644
> index 0000000000..2d4d4196df
> --- /dev/null
> +++ b/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc=
-15.0.1-error.patch
> @@ -0,0 +1,166 @@
> +From dd953cb6db70493d113dd60e47ef90307bc3062d Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Thu, 3 Apr 2025 14:52:48 +0900
> +Subject: [PATCH] fix build with gcc-15.0.1 error
> +
> +* ../../sharutils-4.15.2/lib/system.h:51:36: error: expected ';', identi=
fier or '(' before 'bool'
> +   51 | typedef enum {false =3D 0, true =3D 1} bool;
> +      |                                    ^~~~
> +  ../../sharutils-4.15.2/lib/system.h:79:7: error: conflicting types for=
 'fdopen'; have 'FILE *(void)'
> +   79 | FILE *fdopen ();
> +      |       ^~~~~~
> +  In file included from ../lib/stdio.h:43,
> +                 from ../../sharutils-4.15.2/libopts/autoopts/options.h:=
42,
> +                 from ../../sharutils-4.15.2/src/shar-opts.h:49:
> +  recipe-sysroot/usr/include/stdio.h:299:14: note: previous declaration =
of 'fdopen' with type 'FILE *(int,  const char *)'
> +  299 | extern FILE *fdopen (int __fd, const char *__modes) __THROW
> +      |              ^~~~~~
> +  ../../sharutils-4.15.2/lib/system.h:82:7: error: conflicting types for=
 'popen'; have 'FILE *(void)'
> +   82 | FILE *popen ();
> +      |       ^~~~~
> +  recipe-sysroot/usr/include/stdio.h:893:14: note: previous declaration =
of 'popen' with type 'FILE *(const char *, const char *)'
> +  893 | extern FILE *popen (const char *__command, const char *__modes)
> +      |              ^~~~~
> +  ../../sharutils-4.15.2/src/shar.c:112:12: error: conflicting types for=
 'localtime'; have 'struct tm *(void)'
> +  112 | struct tm *localtime ();
> +      |            ^~~~~~~~~
> +  In file included from ../lib/time.h:39,
> +                 from ../lib/sys/stat.h:44,
> +                 from ../../sharutils-4.15.2/lib/system.h:32:
> +  recipe-sysroot/usr/include/time.h:136:19: note: previous declaration o=
f 'localtime' with type 'struct tm *(const time_t *)' {aka 'struct tm *(con=
st long int *)'}
> +  136 | extern struct tm *localtime (const time_t *__timer) __THROW;
> +      |                   ^~~~~~~~~
> +  ../../sharutils-4.15.2/src/uudecode.c:85:16: error: conflicting types =
for 'getpwnam'; have 'struct passwd *(void)'
> +   85 | struct passwd *getpwnam ();
> +      |                ^~~~~~~~
> +  In file included from ../../sharutils-4.15.2/src/uudecode.c:76:
> +  recipe-sysroot/usr/include/pwd.h:116:23: note: previous declaration of=
 'getpwnam' with type 'struct passwd *(const char *)'
> +  116 | extern struct passwd *getpwnam (const char *__name) __nonnull ((=
1));
> +      |                       ^~~~~~~~
> +      |            ^~~~~~~~~
> +
> +* gcc-15 uses gnu23 standard for c:
> +  https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D55e3bd376b2214=
e200fa76d12b67ff259b06c212
> +  bool is included as a reserved word, causing an error due to duplicate=
 declaration.
> +
> +  Also, when parameters are empty, an error occurs. Therefore, when usin=
g
> +  functions from the standard library, modify the defines in configure.a=
c
> +  and source code to use standard library functions.
> +
> +Upstream-Status: Inactive-Upstream [lastrelease: 2015]
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +---
> + configure.ac               | 2 +-
> + lib/system.h               | 6 ++++++
> + libopts/autoopts/options.h | 2 ++
> + libopts/compat/compat.h    | 2 ++
> + src/shar.c                 | 2 ++
> + src/uudecode.c             | 2 ++
> + 6 files changed, 15 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2ccaac9..fa66368 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -73,7 +73,7 @@ AC_HEADER_STDC
> + AC_STRUCT_TIMEZONE
> + AC_TYPE_SIZE_T
> + AC_TYPE_INTMAX_T
> +-AC_CHECK_FUNCS([fchmod isascii strchr])
> ++AC_CHECK_FUNCS([fchmod isascii strchr fdopen popen localtime getpwnam])
> + AC_FUNC_CLOSEDIR_VOID
> + AC_FUNC_FSEEKO
> + AC_REPLACE_FUNCS([memset mktime strftime xmalloc xstrdup])
> +diff --git a/lib/system.h b/lib/system.h
> +index 2b9846b..05864ac 100644
> +--- a/lib/system.h
> ++++ b/lib/system.h
> +@@ -48,7 +48,9 @@ typedef long intmax_t;
> + #ifdef HAVE_STDBOOL_H
> + #include <stdbool.h>
> + #else
> ++# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <=
=3D 201710L
> + typedef enum {false =3D 0, true =3D 1} bool;
> ++# endif
> + #endif
> +
> + #if !HAVE_DECL_STRTOIMAX && !defined strtoimax
> +@@ -75,8 +77,12 @@ intmax_t strtoimax ();
> + # include <unistd.h>
> + #endif
> +
> ++#ifndef HAVE_FDOPEN
> + FILE *fdopen ();

while the checks are ok, I think they still have problem of funciton
parameter signatures mismatch
which compiler is pointing out. So I think it will be good to change
them to have full prototype e.g.

FILE *fdopen(int fd, const char *mode);

look for the manpages of all these functions to see the correct prototype.

> ++#endif
> ++#ifndef HAVE_POPEN
> + FILE *popen ();
> ++#endif
> +
> + /* Global functions of the shar package.  */
> +
> +diff --git a/libopts/autoopts/options.h b/libopts/autoopts/options.h
> +index 0601d0f..2f86b5e 100644
> +--- a/libopts/autoopts/options.h
> ++++ b/libopts/autoopts/options.h
> +@@ -65,12 +65,14 @@
> + #  if defined(HAVE_STDBOOL_H)
> + #    include <stdbool.h>
> + #  else
> ++#    if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION_=
_ <=3D 201710L
> +      typedef enum { false =3D 0, true =3D 1 } _Bool;
> + #    define bool _Bool
> +
> +      /* The other macros must be usable in preprocessor directives.  */
> + #    define false 0
> + #    define true 1
> ++#    endif
> + #  endif /* HAVE_SYSEXITS_H */
> + #endif /* COMPAT_H_GUARD */
> + // END-CONFIGURED-HEADERS
> +diff --git a/libopts/compat/compat.h b/libopts/compat/compat.h
> +index 561d55d..2ffea7e 100644
> +--- a/libopts/compat/compat.h
> ++++ b/libopts/compat/compat.h
> +@@ -185,12 +185,14 @@
> + #ifdef HAVE_STDBOOL_H
> + #  include <stdbool.h>
> + #else
> ++# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <=
=3D 201710L
> +    typedef enum { false =3D 0, true =3D 1 } _Bool;
> + #  define bool _Bool
> +
> +    /* The other macros must be usable in preprocessor directives.  */
> + #  define false 0
> + #  define true 1
> ++# endif
> + #endif
> +
> + /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> +diff --git a/src/shar.c b/src/shar.c
> +index 6d7ed1d..af976ea 100644
> +--- a/src/shar.c
> ++++ b/src/shar.c
> +@@ -109,7 +109,9 @@ static inline unsigned char to_uchar (char ch) { ret=
urn ch; }
> + #define IS_GRAPH(_c) (isprint (to_uchar (_c)) && !isspace (to_uchar (_c=
)))
> + #endif
> +
> ++#ifndef HAVE_LOCALTIME
> + struct tm *localtime ();
> ++#endif
> +
> + #if MSDOS
> +           /* 1 extra for CR.  */
> +diff --git a/src/uudecode.c b/src/uudecode.c
> +index 0621c99..00a6345 100644
> +--- a/src/uudecode.c
> ++++ b/src/uudecode.c
> +@@ -82,7 +82,9 @@ static char const cright_years_z[] =3D
> + #define UU_CHMOD(_n, _fd, _m)   chmod ((_n), UU_MODE_BITS(_m))
> + #endif
> +
> ++#ifndef HAVE_GETPWNAM
> + struct passwd *getpwnam ();
> ++#endif
> +
> + static uudecode_exit_code_t read_stduu(
> +         const char *inname, const char *outname);
> diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta=
-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> index 1bded9f6d1..d98e49c97a 100644
> --- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> +++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
>             file://0001-configure.ac-Check-and-define-intmax_t-type.patch=
 \
>             file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environmen=
t-d.patch \
> +           file://0001-fix-build-with-gcc-15.0.1-error.patch \
>             "
>  SRC_URI[sha256sum] =3D "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78=
baca457116914637"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116530): https://lists.openembedded.org/g/openembedde=
d-devel/message/116530
> Mute This Topic: https://lists.openembedded.org/mt/112061181/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

