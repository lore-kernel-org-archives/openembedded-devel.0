Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32355C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 06:06:24 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.8960.1739340380671398444
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 22:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/dPV1sE;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fc9789a258so334512eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739340379; x=1739945179; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gryk9WXwklxPbobsJKQgtn6DF11DCKoGv8SIswqLtkY=;
        b=L/dPV1sERvgOreQ0oXO+rhPShFLid9roVFqNBKFEhSc82Shapb+1yYdSerDxsRF6Aj
         vfs5lk3Cmhv/EnoBzn3KnFuMk7Uk1o759KQo0HQSNjrHXGdCl9Itpgts9nrFcxwmjaYz
         kBpdhkvTy6kX3RyBM4zIjJ+CYT2nM+2paReeHkU8B2ww/Q4bSndra/mLPZ+9nDh9kIGd
         vuc1BHLZijQu3z4E69zExD7/wxJxBumGNFn7y3Cku3ZcKxyc3bx9VSOWk3hSkqh4zfnk
         2MgZz0f7YhjCL4g6UkWBCE3N6pp4OtZxXuDfjbhKuJV5uol3DNkb9xNVWwXLl8hhpk26
         DuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739340379; x=1739945179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gryk9WXwklxPbobsJKQgtn6DF11DCKoGv8SIswqLtkY=;
        b=BMm3+mZIu9ZhFTB94h/nRpRbJgNU0Kx/cLyUtwghcdANDd6E7zIjQGi2HExwkwMGmd
         nRKBHzQyEtKcJypRYp6DMWQK+8S+ZgyTDLDBMQBut1PcPgC0aDDVHEZR8TW43I0txL5H
         eyqZcyEx+15lZLkQShi1mX2VNK0lfCrGdm5nBae/Z3nJaTVK78PtxEMa0qZ5zdJrwOQq
         PMZkCYzjJMHVNn/saAIq9NI7eA946Xo7MpWNdt3uD+kyCk0saZ7qPMpvbQfljHpkswCG
         gF0N9PajRn+Zo5cTxetNaDleRE7hj2MWwyi3uL8I8UCwu5uK1aNUjs0GiXTjhDOx0WWV
         vp2g==
X-Gm-Message-State: AOJu0YxAvAjrVgVAbGsVAiLd1BXrQJxEjYzirKu2jyhNyP8mX5eLRHhs
	MaGMwvQPpTY+Rl626Gj41u46BpJQMnIHju7BEq/ftRqEw6LkGjh+MAEM7Akspma3ZD/Km8/IpNl
	9DCMVAWA3gfLJsaLvH7ABrK7gnwaMJc4Xxuk=
X-Gm-Gg: ASbGncs+bt+LCIKd5KsqQt4MpaPxW4RVHHuY/xhksx8dHtgK9rTkWwCdUSdqf51y/Ai
	ImKE/AfQH20anDe/FlSDsmde2mzDAgzkAseH+8kk+UZcYn9WN9TkezC/tQFXQXtfzCje7y9FDE/
	+sCYFgUQDeQko=
X-Google-Smtp-Source: AGHT+IHBOaJmFU4YAGDhY4W3iWhPULLIpg3nXtY6nBgI2IZxASt4y8o20NPSmetlvKLkhNdp4Ag2o6t4oU0OU0r3nM8=
X-Received: by 2002:a05:6870:2012:b0:2b7:f6c5:3c78 with SMTP id
 586e51a60fabf-2b8d8681775mr1027814fac.8.1739340379594; Tue, 11 Feb 2025
 22:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20250210071226.1880278-1-yi.zhao@windriver.com>
 <CAMKF1sqHBDmaQVAuSOcML_cQ8nU-NcMEiMzSQ_3KCP76sHvRFw@mail.gmail.com> <378d336d-7c88-4ddf-a791-a131a0dbcc0c@windriver.com>
In-Reply-To: <378d336d-7c88-4ddf-a791-a131a0dbcc0c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2025 22:05:53 -0800
X-Gm-Features: AWEUYZkRtEoDDCT9FrBglR6fly3iFRjuVbTcvOz8taaARQqk3UMEmb-jT-exHTY
Message-ID: <CAMKF1sqeuM_CN7mgNXq83y1CtC=43v41JH0jU9thcrLtKa3Dcw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opencv: fix build for ppc64
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 06:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115437

On Tue, Feb 11, 2025 at 10:00=E2=80=AFPM Yi Zhao <yi.zhao@windriver.com> wr=
ote:
>
>
> On 2/11/25 01:19, Khem Raj wrote:
> > On Sun, Feb 9, 2025 at 11:12=E2=80=AFPM Yi Zhao via lists.openembedded.=
org
> > <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
> >> Backport a patch to fix build for ppc64:
> >> modules/core/include/opencv2/core/hal/intrin_vsx.hpp:265:75: error: ex=
pected primary-expression before 'v'
> >>    265 | template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_=
##suffix(_Tp v); }       \
> >>        |
> >>
> >> Also fix QA issue:
> >> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/arithm=
.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
> >> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/conver=
t.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpaths]
> >>
> >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> ---
> >>   ...-fixed-VSX-intrinsics-implementation.patch | 61 +++++++++++++++++=
++
> >>   .../recipes-support/opencv/opencv_4.11.0.bb   |  7 +++
> >>   2 files changed, 68 insertions(+)
> >>   create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-f=
ixed-VSX-intrinsics-implementation.patch
> >>
> >> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX=
-intrinsics-implementation.patch b/meta-oe/recipes-support/opencv/opencv/00=
01-core-fixed-VSX-intrinsics-implementation.patch
> >> new file mode 100644
> >> index 0000000000..9fc89e4244
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrin=
sics-implementation.patch
> >> @@ -0,0 +1,61 @@
> >> +From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 200=
1
> >> +From: Maksim Shabunin <maksim.shabunin@gmail.com>
> >> +Date: Fri, 10 Jan 2025 18:34:11 +0300
> >> +Subject: [PATCH] core: fixed VSX intrinsics implementation
> >> +
> >> +Upstream-Status: Backport
> >> +[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b89=
eb4383ce8528]
> >> +
> >> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> +---
> >> + modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++-----
> >> + 1 file changed, 5 insertions(+), 5 deletions(-)
> >> +
> >> +diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b/m=
odules/core/include/opencv2/core/hal/intrin_vsx.hpp
> >> +index 2157e1e870..0a0915a22f 100644
> >> +--- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
> >> ++++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
> >> +@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, double=
)
> >> + inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp)0=
)); }             \
> >> + inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats((_=
Tp)v));}          \
> >> + template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix()=
; }               \
> >> +-template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffi=
x(_Tp v); }       \
> >> ++template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffi=
x(v); }       \
> >> + template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix(c=
onst _Tpvec0 &a)  \
> >> + { return _Tpvec((cast)a.val); }
> >> +
> >> +@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_bdw=
ord2_c)
> >> + #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
> >> + inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
> >> + { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
> >> +-inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
> >> ++inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
> >> + { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
> >> + inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
> >> + { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
> >> +-inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
> >> ++inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
> >> + { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
> >> + inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
> >> + { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
> >> +@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_int=
32x4& a, const v_int32x4& b, cons
> >> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8&=
 b)
> >> + { return v_dotprod(a, b); }
> >> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8&=
 b, const v_int32x4& c)
> >> +-{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
> >> ++{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); }
> >> + // 32 >> 64
> >> + inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4&=
 b)
> >> + { return v_dotprod(a, b); }
> >> +@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32x4=
& a, const v_int32x4& b, const v_
> >> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v=
_uint8x16& b)
> >> + { return v_dotprod_expand(a, b); }
> >> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v=
_uint8x16& b, const v_uint32x4& c)
> >> +-{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
> >> ++{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c); =
}
> >> +
> >> + inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v_i=
nt8x16& b)
> >> + {
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe=
/recipes-support/opencv/opencv_4.11.0.bb
> >> index 07b3a9d9e6..1613b6a3ed 100644
> >> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> >> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> >> @@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=
=3Dopencv;branch=3D4.x;protocol=3Dht
> >>              file://download.patch \
> >>              file://0001-Make-ts-module-external.patch \
> >>              file://0008-Do-not-embed-build-directory-in-binaries.patc=
h \
> >> +           file://0001-core-fixed-VSX-intrinsics-implementation.patch=
 \
> >>              "
> >>   SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.=
cpp.patch;patchdir=3Dcontrib"
> >>
> >> @@ -208,4 +209,10 @@ do_install:append() {
> >>       if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
> >>           rm -rf ${D}${bindir}/setup_vars_opencv4.sh
> >>       fi
> >> +
> >> +    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
> >> +        if [ -f ${B}/modules/core/$fn ]; then
> >> +            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modu=
les/core/$fn
> >> +        fi
> > Do we know why the absolute paths are being emitted ?
>
>
> arithm.vsx3.cpp and convert.vsx3.cpp are wrapper files generated during
> build to include other header files with absolute paths. This is because
> VSX3 feature is enabled by default on ppc64 cpu.

OK. Are they generated using flex/lex ? there are options in flex
called --noline to remove them during generation phase

