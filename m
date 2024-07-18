Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6B6C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:29:49 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.10590.1721291380185198886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 01:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMxlE377;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso74684e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721291378; x=1721896178; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaaX/BETxh4vMW24vBJC/SG01P3KYEPitOWOD5MqUrQ=;
        b=NMxlE37735QWVVI4aBaXdFKjwoTZ9p90FccvPj7eCt/coNyCVd+sIcLpcQdGx73AVj
         R8pxg5MuW9wdmmXaoidoMmufGoGf0j35Y/fzXw2ql1Kla08sWH/8aygZkhma/o/g0oHL
         bUh2k0eb2Xtm90Hj5dcUlwjULTazPqHq5SI8PsQqf+l4Qzwqzob2ymbupYag7vqxu2Xb
         oOj1Mpf2jRW9CuCr5nZJSFaLAL0XYRkfOBUod+/aQbCka7o4H1GmQJeDaISSqO3UT6hG
         IZHPuWpdvtPesKI1hdQfZNlqJ2eqGgC2G/W4vw2On8r1Mf8+QLoT+799yVns4vvHMyjK
         UNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721291378; x=1721896178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaaX/BETxh4vMW24vBJC/SG01P3KYEPitOWOD5MqUrQ=;
        b=edq9jjLmzoswLJKun85O2Qsd/ruBm+SJa4A4wb4T/cEq80lTXQo+IOElXYgS1wOtLt
         ov9Sw+T57ACRokOHXLmtNGO1JWq2fLH4EqlXaD/mM64QbsJw/h38bCGBocCANF5nQh1X
         MgGMZDH5yI0sbOCwKjxk5dsOzAktL38ntlxH620VqIG+6VpUvvJB+HDEgL/kzjJf1l6O
         zhQL9bkRqBV9RwnPCHr7qArFN0cLorwV3opJCZL0bRcBfWSdrqQWb3vEd9Qntj/DOzrB
         XHc/sKiM+4SwYeLRr6l+duK0WyqtqbzD+YCjIsGyn065Jl0TIfCoV010/y2SLChSbZJO
         enWg==
X-Gm-Message-State: AOJu0YwXRCactetDgCc3qPM3SON7T1CmSlvQUAyRBwN/kv0gDmlrkfLb
	phyMROSSOcu0a7MI57ZgeqckJfLesiMgv4tFEEbRnc2mjYIIm8J0HXHZTP80Wb0OKF51LW9tMIF
	WTJoDzBlZSmDbIaXfU79RXMWygx4=
X-Google-Smtp-Source: AGHT+IHAzP/DJEZ0go8MIYc+QBQnIVqNdJNjeFtYjotwHhcPsh+9kJkdqX32adiQC84Hwj7NC7dNwAK6wsWzSxCk1rE=
X-Received: by 2002:a05:6512:2247:b0:52e:9c63:5fe8 with SMTP id
 2adb3069b0e04-52ee543ca9amr2863074e87.54.1721291377810; Thu, 18 Jul 2024
 01:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240718031733.2868099-1-changqing.li@windriver.com>
In-Reply-To: <20240718031733.2868099-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Jul 2024 10:29:26 +0200
Message-ID: <CA+chaQdxdvV57g-E2RcvmhktjYDhTdLHfzK2AOrqBGi72NQw6w@mail.gmail.com>
Subject: Re: [oe] [scarthgap][meta-python][PATCH] python3-h5py: fix compile
 error with gcc 14
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 08:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111396

You should remove the -Wno-error flags from:
https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-dev=
tools/python/python3-h5py_3.11.0.bb?id=3Df0c767407d033e3f39ceeccc2f7e03a1ca=
7a6443
if your change fixes it.

On Thu, Jul 18, 2024 at 5:17=E2=80=AFAM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Backport two patches to fix following compile error:
>
> h5py/h5l.c: In function =E2=80=98__pyx_pf_4h5py_3h5l_9LinkProxy_12get_val=
=E2=80=99:
> h5py/h5l.c:8152:107: error: passing argument 4 of =E2=80=98__pyx_f_4h5py_=
4defs_H5Lunpack_elink_val=E2=80=99 from incompatible pointer type [-Wincomp=
atible-pointer-types]
>  8152 |       __pyx_t_2 =3D __pyx_f_4h5py_4defs_H5Lunpack_elink_val(__pyx=
_v_buf, __pyx_v_buf_size, (&__pyx_v_wtf), (&__pyx_v_ext_file_name), (&__pyx=
_v_ext_obj_name)); if (unlikely(__pyx_t_2 =3D=3D ((herr_t)((herr_t)-1L)))) =
__PYX_ERR(1, 187, __pyx_L5_error)
>       |                                                                  =
                                        ~^~~~~~~~~~~~~~~~~~~~~~~
>       |                                                                  =
                                         |
>       |
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...001-Use-libc.stdint-instead-of-numpy.patch | 27 +++++++++++++++++++
>  ...ast-arguments-to-H5Lunpack_elink_val.patch | 27 +++++++++++++++++++
>  .../python/python3-h5py_3.10.0.bb             |  5 +++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001=
-Use-libc.stdint-instead-of-numpy.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0002=
-Properly-cast-arguments-to-H5Lunpack_elink_val.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-Use-li=
bc.stdint-instead-of-numpy.patch b/meta-python/recipes-devtools/python/pyth=
on3-h5py/0001-Use-libc.stdint-instead-of-numpy.patch
> new file mode 100644
> index 000000000..3c55fa697
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-Use-libc.stdi=
nt-instead-of-numpy.patch
> @@ -0,0 +1,27 @@
> +From 434e1bf4ab9fa53ec1293cde86f4dbec6784e50f Mon Sep 17 00:00:00 2001
> +From: Orion Poplawski <orion@nwra.com>
> +Date: Thu, 22 Feb 2024 08:41:17 -0700
> +Subject: [PATCH 1/2] Use libc.stdint instead of numpy
> +
> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2382/commit=
s/387a22b8c1513800c0401f496b4ed512c1639798]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + h5py/api_types_ext.pxd                   | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/h5py/api_types_ext.pxd b/h5py/api_types_ext.pxd
> +index 91acb128..55a239f5 100644
> +--- a/h5py/api_types_ext.pxd
> ++++ b/h5py/api_types_ext.pxd
> +@@ -20,7 +20,7 @@ from libc.string cimport strlen, strchr, strcpy, strnc=
py, strcmp,\
> + ctypedef long size_t
> + from libc.time cimport time_t
> +
> +-from numpy cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_=
t, int64_t, uint64_t
> ++from libc.stdint cimport int8_t, uint8_t, int16_t, uint16_t, int32_t, u=
int32_t, int64_t, uint64_t
> +
> + IF UNAME_SYSNAME !=3D "Windows":
> +     cdef extern from "unistd.h":
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0002-Proper=
ly-cast-arguments-to-H5Lunpack_elink_val.patch b/meta-python/recipes-devtoo=
ls/python/python3-h5py/0002-Properly-cast-arguments-to-H5Lunpack_elink_val.=
patch
> new file mode 100644
> index 000000000..0f77f745a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0002-Properly-cast=
-arguments-to-H5Lunpack_elink_val.patch
> @@ -0,0 +1,27 @@
> +From 9ed4f80fd482e135119086fb2015ca97dce306ae Mon Sep 17 00:00:00 2001
> +From: Orion Poplawski <orion@nwra.com>
> +Date: Thu, 15 Feb 2024 20:47:50 -0700
> +Subject: [PATCH 2/2] Properly cast arguments to H5Lunpack_elink_val
> +
> +Upstream-Status: Backport [https://github.com/h5py/h5py/pull/2380/commit=
s/704e13ac83b42898514610c4df9f32f367e767e4]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + h5py/h5l.pyx         | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/h5py/h5l.pyx b/h5py/h5l.pyx
> +index 60b252fa..af725bdb 100644
> +--- a/h5py/h5l.pyx
> ++++ b/h5py/h5l.pyx
> +@@ -184,7 +184,7 @@ cdef class LinkProxy:
> +             if info.type =3D=3D H5L_TYPE_SOFT:
> +                 py_retval =3D buf
> +             else:
> +-                H5Lunpack_elink_val(buf, buf_size, &wtf, &ext_file_name=
, &ext_obj_name)
> ++                H5Lunpack_elink_val(buf, buf_size, &wtf, <const char **=
>&ext_file_name, <const char **>&ext_obj_name)
> +                 py_retval =3D (bytes(ext_file_name), bytes(ext_obj_name=
))
> +         finally:
> +             efree(buf)
> +--
> +2.25.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb b=
/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> index 8a9158525..d557a8188 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_3.10.0.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D113251d71fb03=
84712c719b567261c5c"
>  SRC_URI[sha256sum] =3D "d93adc48ceeb33347eb24a634fb787efc7ae4644e6ea4ba7=
33d099605045c049"
>
>  SRC_URI +=3D "file://0001-setup_build.py-avoid-absolute-path.patch \
> -            file://0001-Fix-Cython-3-compatibility.patch"
> +            file://0001-Fix-Cython-3-compatibility.patch \
> +            file://0001-Use-libc.stdint-instead-of-numpy.patch \
> +            file://0002-Properly-cast-arguments-to-H5Lunpack_elink_val.p=
atch \
> +"
>
>  inherit pkgconfig pypi setuptools3
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111389): https://lists.openembedded.org/g/openembedde=
d-devel/message/111389
> Mute This Topic: https://lists.openembedded.org/mt/107411257/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

