Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2EBC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:20:31 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.57497.1739208025152984791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HI93CVza;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2b863fdc25aso577719fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739208024; x=1739812824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgYjFtJEmkU3WbQLgk4N0rINKozNjDHQfWInFMKUCjE=;
        b=HI93CVza+DDi6fh3DtfshNtxvIlMjeUDCCKAxGFGQndd7huepHXsX06RkKQHyCi2RV
         yTxrX44NjAYy9f/VnwXCn8mojbSQEkbS1LJ1gxPQld/7Bqj/SQF41uec+S3J17zbYnRN
         k/rRSs7qlZfEnq8cMlrR7Q9ef1RhaCS4U/BR5KTCDjl9G0t9zKwGVO/4Q6fygvg35ZZQ
         22VY0SZAqMCGcYKD2AYC6mnOO3pMIbIMsSFDz6u6YjWvk5dhSoXnkNj9VI91ZPllIC6p
         i+pB6miW5RGLiHRlshzoEXQSjs7Xd+tec1LtPNE7n+I8MGcOX3zFPyyNgVIG3ZbGq9Hu
         3QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208024; x=1739812824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgYjFtJEmkU3WbQLgk4N0rINKozNjDHQfWInFMKUCjE=;
        b=I1s51Smd1ZWlR4SepHFXCMWoaCPLD6vJMGQZHSBZjJVKFkHHTu2q1A429KbfRCoBxi
         vGKvN4H69rhUQEAhGWVF4XSuskdUWGsNP/VbQ3M7cm7Z9IPMxecFiI+jwrgDfUDd8GRS
         Age9QBwzx2coD7eTA5JG7Te6xgZk8/m2ptZ8GkA4x0wIqN4CRYXHtnwOehAJWYXZivFq
         vmaA+ACKqBc+jzb6SgI1YFGPyNFCNmC8odLLn/9vz06TOZjGu84B9dmVM7/7UkpYwKY1
         fuAAVSULXXd2Jy24TxyQkV6TYwfnwBS3To3PrugZCmlo2PJEhRtVwVNnCWBQlcCZ9gEl
         VKAw==
X-Gm-Message-State: AOJu0Yyv+0QiX9iHIhH+bYPyXLGdMqgyTkUiVyeT721xyKoqeUahGQVR
	GSXX6R1K+Kn7aE6tHtpTF378XEuJSUUgpRmHG6I7RGVRl3jV+GW1L+RaR098IMG1W36islXprYx
	INJb/85cEqFYA1vwb4YTBeyDl/EHnKNmd
X-Gm-Gg: ASbGnctsJ/R+utM06x2EwjyNzz9JABF/Wu+cHX7UbP6TbwE45Tw1ysEw5f3nPvMBCgd
	dN7+naLG7amk0j5qzknRftJfxgVbcyeG+jWJ2e7TiuJDa3yTcHQd3vW9+aAovTSYpKg12HBuQFr
	6TP4Yv0v0NFRoyeJjQ5SM0cpLbWRB4pg==
X-Google-Smtp-Source: AGHT+IGyCafhXW/+b6HcHYa+GALlEZKIhuTmnIqI5xHkDJk0UEq/D358jroPPjlXSZWcLz77Gs0Xua/IJ25bTNwCmw0=
X-Received: by 2002:a05:6871:e40c:b0:29e:32e7:5f1f with SMTP id
 586e51a60fabf-2b83eeb8061mr9590038fac.27.1739208024256; Mon, 10 Feb 2025
 09:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20250210071226.1880278-1-yi.zhao@windriver.com>
In-Reply-To: <20250210071226.1880278-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2025 09:19:58 -0800
X-Gm-Features: AWEUYZlBjROGm-ggVw5BBO6YcM0M0hkSGJtRvly9Yr45qUtt4ZCfMij6byrriIc
Message-ID: <CAMKF1sqHBDmaQVAuSOcML_cQ8nU-NcMEiMzSQ_3KCP76sHvRFw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: fix build for ppc64
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 17:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115408

On Sun, Feb 9, 2025 at 11:12=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Backport a patch to fix build for ppc64:
> modules/core/include/opencv2/core/hal/intrin_vsx.hpp:265:75: error: expec=
ted primary-expression before 'v'
>   265 | template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##su=
ffix(_Tp v); }       \
>       |
>
> Also fix QA issue:
> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/arithm.vs=
x3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/convert.v=
sx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...-fixed-VSX-intrinsics-implementation.patch | 61 +++++++++++++++++++
>  .../recipes-support/opencv/opencv_4.11.0.bb   |  7 +++
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-fixed=
-VSX-intrinsics-implementation.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-in=
trinsics-implementation.patch b/meta-oe/recipes-support/opencv/opencv/0001-=
core-fixed-VSX-intrinsics-implementation.patch
> new file mode 100644
> index 0000000000..9fc89e4244
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsic=
s-implementation.patch
> @@ -0,0 +1,61 @@
> +From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 2001
> +From: Maksim Shabunin <maksim.shabunin@gmail.com>
> +Date: Fri, 10 Jan 2025 18:34:11 +0300
> +Subject: [PATCH] core: fixed VSX intrinsics implementation
> +
> +Upstream-Status: Backport
> +[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b89eb4=
383ce8528]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b/modu=
les/core/include/opencv2/core/hal/intrin_vsx.hpp
> +index 2157e1e870..0a0915a22f 100644
> +--- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
> ++++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
> +@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, double)
> + inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp)0));=
 }             \
> + inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats((_Tp)=
v));}          \
> + template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix(); }=
               \
> +-template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(_=
Tp v); }       \
> ++template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(v=
); }       \
> + template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix(cons=
t _Tpvec0 &a)  \
> + { return _Tpvec((cast)a.val); }
> +
> +@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_bdword=
2_c)
> + #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
> + inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
> + { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
> +-inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
> ++inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
> + { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
> + inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
> + { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
> +-inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
> ++inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
> + { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
> + inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
> + { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
> +@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_int32x=
4& a, const v_int32x4& b, cons
> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b)
> + { return v_dotprod(a, b); }
> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b,=
 const v_int32x4& c)
> +-{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
> ++{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); }
> + // 32 >> 64
> + inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4& b)
> + { return v_dotprod(a, b); }
> +@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32x4& a=
, const v_int32x4& b, const v_
> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_ui=
nt8x16& b)
> + { return v_dotprod_expand(a, b); }
> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_ui=
nt8x16& b, const v_uint32x4& c)
> +-{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
> ++{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c); }
> +
> + inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v_int8=
x16& b)
> + {
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> index 07b3a9d9e6..1613b6a3ed 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=3D=
opencv;branch=3D4.x;protocol=3Dht
>             file://download.patch \
>             file://0001-Make-ts-module-external.patch \
>             file://0008-Do-not-embed-build-directory-in-binaries.patch \
> +           file://0001-core-fixed-VSX-intrinsics-implementation.patch \
>             "
>  SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.cpp.=
patch;patchdir=3Dcontrib"
>
> @@ -208,4 +209,10 @@ do_install:append() {
>      if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
>          rm -rf ${D}${bindir}/setup_vars_opencv4.sh
>      fi
> +
> +    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
> +        if [ -f ${B}/modules/core/$fn ]; then
> +            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules=
/core/$fn
> +        fi

Do we know why the absolute paths are being emitted ?

>  }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115326): https://lists.openembedded.org/g/openembedde=
d-devel/message/115326
> Mute This Topic: https://lists.openembedded.org/mt/111098421/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

