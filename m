Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEC6C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:21:37 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.20376.1743517287493750087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqNULo5u;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60297d7ab47so1269817eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517287; x=1744122087; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xSibSrNC1+ubTfaPzMy8q8ENk3SMcU2PiWkXMWfXpg=;
        b=hqNULo5uU716KxiA+CRxw9wpX+YqCkL1gb5hnwAWr16gi00F9KBX6Ih298CrL85RZu
         duPujLkDgvVylUBVnMvLttLGXslW2yntTHKTgueO/G3VKZy925fofmilFmjL/dRY3lz1
         ylHlkA2ezIJCIW1nMDpq5EjIUpcmszckR6ZFrBvU70MJtE/tvpqS5S0uwNQPZc4FOovT
         PKMo1XkNIMNaJn/tpzYd2xM4GoqSJX3P3J7y8IN5wYB3bBCuTXDFSGtRRA3zfXSJVDbx
         FYfGXjKvnAn9VXa4r4niolrSMIIs2XWltnSOh2F90v4N1x7xb2HHWSPFATibsAsO+IHn
         7PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517287; x=1744122087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xSibSrNC1+ubTfaPzMy8q8ENk3SMcU2PiWkXMWfXpg=;
        b=ElgikCbz1LnEQzjhXOuMcQ8M1PR6CXDW27N1w6uYyWcr0gn0LZ/kNh3QwkZZcPnYYS
         cSLe1dK+sUNj3Vm7NdSjzJd1v6JFtgNx0HjjIIqjg5buoYv06XMeq8Ik4nTTn+ipw0H9
         2h3/Rc6DwK8XVfovpiHMHyCsobQQnCeGS3pGnk3odn1e3UzZ8mmKjgsA+Wnxle6aQ2sz
         RyD2oVRwnBYqOqh2a9Ah2vU8n6pI62AkXQg0P2s42fbe/BSScsRknF3BtKO9Ql7se5sb
         ryUv2og7kWvYs/pXqD7rrKY0co8Zelr5mKqLoNIRONZqJfZNV1UWI7diFtEzEjMlJtcC
         nWcA==
X-Gm-Message-State: AOJu0YzYqoRU58R2D0VGgWlzHqMDkA7Q0ch7CNQecQFTNLX0LL5CZIIx
	n1qWEnshHYAKCBC2z3wXSraKhrHrpd0jhfmQ9eVvfcOJShnZLGnlSMisTKCrUndKHPsPFm2zO1z
	0GerfDrTySF+cW/0Yc6X0GQ/o6O1Be5u9
X-Gm-Gg: ASbGncu+RVE3LPTQ6qm55r3Sr/G4ZzraSPhBAawOArkSKkmOd2KMKUO3sGjnr4SrO2l
	JkIbyQtevo5wGpyd+HAqcG2SQn8KeIbJsIEwIPUkbL5KDQuduUC+vuyImKho+KKoKSPEVsBlouO
	Ync45Jba5k5KNVDXRWJhXoBb6kC8itIkoxaIQzssKP
X-Google-Smtp-Source: AGHT+IEfHevsmbkmyDX1GfTX1+T+AFBvPcMx3dlQVqMInU/eg3+TBq0FcSYW7GbDOASJhOYjILGqM8x2tqOFoNb9LI0=
X-Received: by 2002:a05:6820:c8a:b0:603:f526:ce1 with SMTP id
 006d021491bc7-603f5260fc9mr1434222eaf.8.1743517286629; Tue, 01 Apr 2025
 07:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250401071820.872584-1-mark.yang@lge.com>
In-Reply-To: <20250401071820.872584-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:20:58 -0700
X-Gm-Features: AQ5f1JojYXVWI002SRLAMOCyv0kxX3lnNNq_RZOUtvbzwNVC3TSyQwmTSy-O-4I
Message-ID: <CAMKF1sqkcFy3qFyPYGkQhZtYUVbMR6ZSbVPurZ+K9KtDaFZOyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] linpack: fix build with gcc-15.0.1
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 14:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116477

Hello Mark

Thanks for these fixes. Do you intend to send this patch upstream as well ?

On Tue, Apr 1, 2025 at 12:18=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * fix following error:
>     linpacknew.c: In function 'dgefa':
>     linpacknew.c:257:9: error: conflicting types for 'idamax'; have 'int(=
void)'
>     257 |     int idamax(),j,k,kp1,l,nm1;
>         |         ^~~~~~
>     linpacknew.c:63:13: note: previous declaration of 'idamax' with type =
'int(int,  REAL *, int)' {aka 'int(int,  double *, int)'}
>     63 | static int  idamax   (int n,REAL *dx,int incx);
>         |             ^~~~~~
>     linpacknew.c:272:21: error: too many arguments to function 'idamax'; =
expected 0, have 3
>     272 |                 l =3D idamax(n-k,&a[lda*k+k],1) + k;
>         |                     ^~~~~~ ~~~
>     linpacknew.c:257:9: note: declared here
>     257 |     int idamax(),j,k,kp1,l,nm1;
>         |         ^~~~~~
>     linpacknew.c:326:21: error: too many arguments to function 'idamax'; =
expected 0, have 3
>     326 |                 l =3D idamax(n-k,&a[lda*k+k],1) + k;
>         |                     ^~~~~~ ~~~
>     linpacknew.c:257:9: note: declared here
>     257 |     int idamax(),j,k,kp1,l,nm1;
>         |         ^~~~~~
>
>     The function was already declared as static int idamax(int n, REAL *d=
x, int incx);
>     on line 63, but it was redeclared as int idamax() inside the dgefa fu=
nction on line 257,
>     causing a conflict.
>     where functions are redeclared without parameters,
>     causing conflicts with the original function definitions.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  ...in-gcc-15.0.1-due-to-function-redecl.patch | 55 +++++++++++++++++++
>  .../recipes-benchmark/linpack/linpack_1.0.bb  |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-bu=
ild-error-in-gcc-15.0.1-due-to-function-redecl.patch
>
> diff --git a/meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-err=
or-in-gcc-15.0.1-due-to-function-redecl.patch b/meta-oe/recipes-benchmark/l=
inpack/linpack/0001-Fix-build-error-in-gcc-15.0.1-due-to-function-redecl.pa=
tch
> new file mode 100644
> index 0000000000..783a98f114
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/linpack/linpack/0001-Fix-build-error-in-g=
cc-15.0.1-due-to-function-redecl.patch
> @@ -0,0 +1,55 @@
> +From a1c1211fd6fc8d82053074c6dc531340f046c8d4 Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Tue, 1 Apr 2025 16:06:56 +0900
> +Subject: [PATCH] Fix build error in gcc 15.0.1 due to function redeclara=
tion.
> +
> +Fix build error:
> +linpacknew.c: In function 'dgefa':
> +linpacknew.c:257:9: error: conflicting types for 'idamax'; have 'int(voi=
d)'
> +  257 |     int idamax(),j,k,kp1,l,nm1;
> +      |         ^~~~~~
> +linpacknew.c:63:13: note: previous declaration of 'idamax' with type 'in=
t(int,  REAL *, int)' {aka 'int(int,  double *, int)'}
> +   63 | static int  idamax   (int n,REAL *dx,int incx);
> +      |             ^~~~~~
> +linpacknew.c:272:21: error: too many arguments to function 'idamax'; exp=
ected 0, have 3
> +  272 |                 l =3D idamax(n-k,&a[lda*k+k],1) + k;
> +      |                     ^~~~~~ ~~~
> +linpacknew.c:257:9: note: declared here
> +  257 |     int idamax(),j,k,kp1,l,nm1;
> +      |         ^~~~~~
> +linpacknew.c:326:21: error: too many arguments to function 'idamax'; exp=
ected 0, have 3
> +  326 |                 l =3D idamax(n-k,&a[lda*k+k],1) + k;
> +      |                     ^~~~~~ ~~~
> +linpacknew.c:257:9: note: declared here
> +  257 |     int idamax(),j,k,kp1,l,nm1;
> +      |         ^~~~~~
> +
> +The function was already declared as static int idamax(int n, REAL *dx, =
int incx);
> +on line 63, but it was redeclared as int idamax() inside the dgefa funct=
ion on line 257,
> +causing a conflict.
> +where functions are redeclared without parameters,
> +causing conflicts with the original function definitions.
> +
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Pending
> +---
> + linpacknew.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/linpacknew.c b/linpacknew.c
> +index c656082..5c8687b 100644
> +--- a/linpacknew.c
> ++++ b/linpacknew.c
> +@@ -254,7 +254,7 @@ static void dgefa(REAL *a,int lda,int n,int *ipvt,in=
t *info,int roll)
> +
> +     {
> +     REAL t;
> +-    int idamax(),j,k,kp1,l,nm1;
> ++    int j,k,kp1,l,nm1;
> +
> +     /* gaussian elimination with partial pivoting */
> +
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/r=
ecipes-benchmark/linpack/linpack_1.0.bb
> index fe540749b5..735b5560e0 100644
> --- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> +++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/linpacknew.c;be=
ginline=3D1;endline=3D23;md5=3D
>
>  SRC_URI =3D "http://www.netlib.org/benchmark/linpackc.new;downloadfilena=
me=3Dlinpacknew.c \
>             file://0001-linpack-Define-DP-only-when-SP-is-not-defined.pat=
ch \
> +                  file://0001-Fix-build-error-in-gcc-15.0.1-due-to-funct=
ion-redecl.patch \
>            "
>  SRC_URI[sha256sum] =3D "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae=
3af374d48745e97e"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116466): https://lists.openembedded.org/g/openembedde=
d-devel/message/116466
> Mute This Topic: https://lists.openembedded.org/mt/112020897/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

