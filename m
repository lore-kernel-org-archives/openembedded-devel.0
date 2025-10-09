Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1C1CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 12:45:27 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.11250.1760013924736949772
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 05:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EakB65of;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-36527ac0750so7536461fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760013923; x=1760618723; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEPpMgTv1CZlEPYnWovBVivYHr9fQZ1ISQRhshTRfNI=;
        b=EakB65of25vFhiHGTFTCjcltj+apt4ir99X/2Lq+7RS9DdhJpZENrBdIq+ghJI9FGA
         0et7o8rgZkfJu+Oif+S3ladsOP+0PRQtv70IfdVXAs7KuRkPSFO6xrrQ/rUmkVYkCfNJ
         GYMXHxZOd+u4pxhsOLAEQWp/hQLgdlZHQVGCV8oCu/jTwwFIdflxwfdu9ZMouq/zElFp
         vl9jWmW3WSOyqvpo9Y1a1GRSYkayOrY4/VHsHAamUo3Pbi6DsOpsA0GF5A17Q1AUtWmI
         CWeAKnJwIKQIdYopFbZJ0Vwsll0lk5CBwXUDklRumubpZspirQPjHonizD02I5jKFtlO
         OANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013923; x=1760618723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEPpMgTv1CZlEPYnWovBVivYHr9fQZ1ISQRhshTRfNI=;
        b=fx+ZDzbbZjseryi4dr0VB3D+OQtw/RkVK0X4qjIA/1hTEckXM3ZyZh2NZlb2/YRFpN
         VcUtx7P016obuNfvD9uTdfe7kTqMsrYr3iQu8G9FghmSuaQF6eoV+Lxeiuvkprg2rC32
         7TjheDtKlOz9ZpuitWSZyyqVz3Ma4MAJxCdwtfPxilb8FAc5K6QXPVBpY1TCrdUHxdmc
         0BXVgv4zELzSZVzvXm+KLKme95JFFb1VD/F8K+akNeU09V5/8nd84vLSHsK9ZPtxRHVP
         VmJW5MwVYHgZgbm5GyBLP68ezpDDVVuChZXzkRY3/rjmuDPoPHCyI5CU3Ol7ulEDQ5DI
         XHoQ==
X-Gm-Message-State: AOJu0YzkwFwD6MyBEtoC8OhSAmXnP0WH3YWW6Y/Y51/pULdZWHl06nNA
	QKRCoAJFLJ5YMANTnSBGGCKHHrzyWTnfqBWZTfGkvLQLfq1gJeOSVePJyooYSJfrFXzHQJ1gV8y
	nkzOz65pfPzvdVf4NSb5gUgXb6fX+TaY=
X-Gm-Gg: ASbGncukyrT8zWVmUPUPq0QDlgvsDvWgr/WUTMaK9n+6knZvmZ04cuqgOdllHTxYBQR
	0ptEAuGWIBuOpMBn7l/RYaGVwsd35Rtk6+TQ2TbViCFTx+dBOJflQHGrIqlJbgrJ2jNaLMz6KwO
	LzYqoifIoJBEJh9cw5+qkbnh83qrbOf4WRr2+vfakpa13iwbq0EvPYPpAm8l8LJ7qe8SAvg/Aer
	tKQ0xGIw/LOuCECb+OLC2iE3lheoBU=
X-Google-Smtp-Source: AGHT+IFx0qeCcaO/THGn1WNGNF3zoeSrSu967ZIDV0SRPngm7qmbPQUB9duwdVYxKntUCdeZScbVG28eS7xl3rgskqE=
X-Received: by 2002:a05:651c:222c:b0:36d:e147:3f34 with SMTP id
 38308e7fff4ca-37609cea8d5mr19355311fa.2.1760013922458; Thu, 09 Oct 2025
 05:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251009113247.27517-1-peron.clem@gmail.com> <3adb1e0e-11ca-46cc-afdb-5a84520737ec@gmail.com>
 <CAJiuCcegqhygMvO=ivhTn9uQDk=mknpsBTDom2cPJcwKV_Q55A@mail.gmail.com> <b3c1fbd0-327e-45f6-9a78-30220e400d26@gmail.com>
In-Reply-To: <b3c1fbd0-327e-45f6-9a78-30220e400d26@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 9 Oct 2025 14:45:10 +0200
X-Gm-Features: AS18NWCGgY-WNhp_ftOz35Kn_8alToFSJfx4j59kAXM1_soOtRquKlVO7_L8H5k
Message-ID: <CAJiuCcfwrtSkJ=F_cwGHi8VRe3vgBKp-TPOg9+6bctv5H5PGwg@mail.gmail.com>
Subject: Re: [oe] [PATCH] libeigen: upgrade 3.4.0 -> 3.4.1
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 12:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120431

On Thu, 9 Oct 2025 at 14:35, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>
> On 10/9/25 14:22, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Thu, 9 Oct 2025 at 14:15, Gyorgy Sarvari <skandigraun@gmail.com> wro=
te:
> >> On 10/9/25 13:32, Cl=C3=A9ment P=C3=A9ron via lists.openembedded.org w=
rote:
> >>> - Disable building BLAS, LAPACK and TESTING
> >> Why? Could they rather be PACKAGECONFIG options?
> > They require a Fortran compiler, which if I leave enabled, triggers a
> > CMake FatalError at the moment.
> > https://gitlab.com/libeigen/eigen/-/blob/3.4.1/CMakeLists.txt?ref_type=
=3Dtags#L62
> >
>
> Does it fail because it can't find a Fortran compiler? If yes, then that
> should be a non-issue: oe-core comes with a Fortran compiler (though
> it's not exactly straightforward to enable it).
> You can see how this optional Fortran requirement handled in other
> recipes, like the PACKAGECONFIG of mpich[1].
>
> Or is this an upstream issue?

It can't find a Fortran compiler but in Eigen 3.4.0 it was silently
disabled, now it generates a FATAL_ERROR

I will send a v2 with the package config for Fortran

Regards,

>
> [1]:
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devto=
ols/mpich/mpich_4.3.1.bb#n25
>
> >>> - Remove patch that has been merged
> >>>
> >>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >>> ---
> >>>  ...ult-eigen_packet_wrapper-constructor.patch | 72 -----------------=
--
> >>>  ...001-Remove-LGPL-Code-and-references.patch} | 28 +++-----
> >>>  .../{libeigen_3.4.0.bb =3D> libeigen_3.4.1.bb}  | 11 ++-
> >>>  3 files changed, 17 insertions(+), 94 deletions(-)
> >>>  delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-De=
fault-eigen_packet_wrapper-constructor.patch
> >>>  rename meta-oe/recipes-support/libeigen/libeigen/{0002-Remove-LGPL-C=
ode-and-references.patch =3D> 0001-Remove-LGPL-Code-and-references.patch} (=
98%)
> >>>  rename meta-oe/recipes-support/libeigen/{libeigen_3.4.0.bb =3D> libe=
igen_3.4.1.bb} (84%)
> >>>
> >>> diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-e=
igen_packet_wrapper-constructor.patch b/meta-oe/recipes-support/libeigen/li=
beigen/0001-Default-eigen_packet_wrapper-constructor.patch
> >>> deleted file mode 100644
> >>> index 84b5a4da9f..0000000000
> >>> --- a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_pa=
cket_wrapper-constructor.patch
> >>> +++ /dev/null
> >>> @@ -1,72 +0,0 @@
> >>> -From cb507309937958c632147de87e8f1231d6698847 Mon Sep 17 00:00:00 20=
01
> >>> -From: Antonio Sanchez <cantonios@google.com>
> >>> -Date: Tue, 14 Sep 2021 10:57:22 -0700
> >>> -Subject: [PATCH] Default eigen_packet_wrapper constructor.
> >>> -
> >>> -This makes it trivial, allowing use of `memcpy`.
> >>> -
> >>> -Fixes #2326
> >>> -
> >>> -Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/merge=
_requests/645/diffs?commit_id=3Dcb507309937958c632147de87e8f1231d6698847]
> >>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> -
> >>> -* fixes build failures for arm targets with NEON enabled (e.g. -mfpu=
=3Dneon-vfpv4)
> >>> -  for recipes with -Werror enabled and gcc-11, e.g. fuse-core, robot=
-localization,
> >>> -  prbt-ikfast-manipulator-plugin, rm-chassis-controllers in meta-ros=
1-noetic:
> >>> -
> >>> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/reci=
pe-sysroot/usr/include/eigen3/Eigen/Core:214,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/macros.h:63,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/loss.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/constraint.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
src/constraint.cpp:34:
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::i=
nternal::pload(const typename Eigen::internal::unpacket_traits<T>::type*) [=
with Packet =3D Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eig=
en::internal::unpacket_traits<T>::type =3D signed char]':
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1671:9: error: 'void* memcpy(=
void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::=
internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int,=
 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=3D=
class-memaccess]
> >>> - 1671 |   memcpy(&res, from, sizeof(Packet4c));
> >>> -      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/reci=
pe-sysroot/usr/include/eigen3/Eigen/Core:172,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/macros.h:63,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/loss.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/constraint.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
src/constraint.cpp:34:
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::P=
acket4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} decla=
red here
> >>> -  159 | struct eigen_packet_wrapper
> >>> -      |        ^~~~~~~~~~~~~~~~~~~~
> >>> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/reci=
pe-sysroot/usr/include/eigen3/Eigen/Core:214,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/macros.h:63,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/loss.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/constraint.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
src/constraint.cpp:34:
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::i=
nternal::ploadu(const typename Eigen::internal::unpacket_traits<T>::type*) =
[with Packet =3D Eigen::internal::eigen_packet_wrapper<int, 2>; typename Ei=
gen::internal::unpacket_traits<T>::type =3D signed char]':
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1716:9: error: 'void* memcpy(=
void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::=
internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int,=
 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=3D=
class-memaccess]
> >>> - 1716 |   memcpy(&res, from, sizeof(Packet4c));
> >>> -      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/reci=
pe-sysroot/usr/include/eigen3/Eigen/Core:172,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/macros.h:63,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/loss.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
include/fuse_core/constraint.h:37,
> >>> -                 from /jenkins/mjansa/build/ros/webos-noetic-honiste=
r/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/=
src/constraint.cpp:34:
> >>> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspb=
errypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include=
/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::P=
acket4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} decla=
red here
> >>> -  159 | struct eigen_packet_wrapper
> >>> -      |        ^~~~~~~~~~~~~~~~~~~~
> >>> -cc1plus: all warnings being treated as errors
> >>> -
> >>> ----
> >>> - Eigen/src/Core/GenericPacketMath.h | 2 +-
> >>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> -
> >>> -diff --git a/Eigen/src/Core/GenericPacketMath.h b/Eigen/src/Core/Gen=
ericPacketMath.h
> >>> -index 8f8f64f15..72234288e 100644
> >>> ---- a/Eigen/src/Core/GenericPacketMath.h
> >>> -+++ b/Eigen/src/Core/GenericPacketMath.h
> >>> -@@ -162,7 +162,7 @@ struct eigen_packet_wrapper
> >>> - {
> >>> -   EIGEN_ALWAYS_INLINE operator T&() { return m_val; }
> >>> -   EIGEN_ALWAYS_INLINE operator const T&() const { return m_val; }
> >>> --  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() {}
> >>> -+  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() =3D default;
> >>> -   EIGEN_ALWAYS_INLINE eigen_packet_wrapper(const T &v) : m_val(v) {=
}
> >>> -   EIGEN_ALWAYS_INLINE eigen_packet_wrapper& operator=3D(const T &v)=
 {
> >>> -     m_val =3D v;
> >>> ---
> >>> -2.17.1
> >>> -
> >>> diff --git a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LG=
PL-Code-and-references.patch b/meta-oe/recipes-support/libeigen/libeigen/00=
01-Remove-LGPL-Code-and-references.patch
> >>> similarity index 98%
> >>> rename from meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGP=
L-Code-and-references.patch
> >>> rename to meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-=
Code-and-references.patch
> >>> index 2d19bc23c8..697f3dfa82 100644
> >>> --- a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code=
-and-references.patch
> >>> +++ b/meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code=
-and-references.patch
> >>> @@ -1,4 +1,4 @@
> >>> -From e63a6950dbebf4dd95e5c74c423c06fd65df5182 Mon Sep 17 00:00:00 20=
01
> >>> +From 5e7b53a3268e7cdc81e358825a8c84f06289866c Mon Sep 17 00:00:00 20=
01
> >>>  From: =3D?UTF-8?q?Antonio=3D20S=3DC3=3DA1nchez?=3D <cantonios@google=
.com>
> >>>  Date: Wed, 8 Feb 2023 01:25:06 +0000
> >>>  Subject: [PATCH] Remove LGPL Code and references.
> >>> @@ -12,12 +12,11 @@ Upstream-Status: Backport [https://gitlab.com/lib=
eigen/eigen/-/commit/e256ad1823
> >>>   bench/tensors/eigen_sycl_bench.sh             |   1 -
> >>>   bench/tensors/eigen_sycl_bench_contract.sh    |   2 +-
> >>>   doc/PreprocessorDirectives.dox                |   3 -
> >>> - test/CMakeLists.txt                           |   1 -
> >>>   test/mpl2only.cpp                             |  24 -
> >>>   unsupported/Eigen/IterativeSolvers            |   6 -
> >>>   .../IterativeSolvers/ConstrainedConjGrad.h    | 187 -------
> >>>   .../IterativeSolvers/IterationController.h    | 154 ------
> >>> - 12 files changed, 4 insertions(+), 898 deletions(-)
> >>> + 11 files changed, 4 insertions(+), 897 deletions(-)
> >>>   delete mode 100644 COPYING.LGPL
> >>>   delete mode 100644 Eigen/src/Core/util/NonMPL2.h
> >>>   delete mode 100644 test/mpl2only.cpp
> >>> @@ -567,7 +566,7 @@ index 1af67cf18..000000000
> >>>  -#error Including non-MPL2 code in EIGEN_MPL2_ONLY mode
> >>>  -#endif
> >>>  diff --git a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h b=
/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
> >>> -index 7803fd817..1a5d7faeb 100644
> >>> +index 5e632c4e2..8b6077601 100644
> >>>  --- a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
> >>>  +++ b/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
> >>>  @@ -24,8 +24,7 @@ namespace Eigen {
> >>> @@ -606,7 +605,7 @@ index 73fd6c4a0..3ab0138a1 100644
> >>>   ./tensor_contract_sycl_bench
> >>>
> >>>  diff --git a/doc/PreprocessorDirectives.dox b/doc/PreprocessorDirect=
ives.dox
> >>> -index 0f545b086..b7d59ccbc 100644
> >>> +index eda0d1961..2b5cb1b92 100644
> >>>  --- a/doc/PreprocessorDirectives.dox
> >>>  +++ b/doc/PreprocessorDirectives.dox
> >>>  @@ -92,9 +92,6 @@ run time. However, these assertions do cost time a=
nd can thus be turned off.
> >>> @@ -619,18 +618,6 @@ index 0f545b086..b7d59ccbc 100644
> >>>
> >>>   \section TopicPreprocessorDirectivesPerformance Alignment, vectoriz=
ation and performance tweaking
> >>>
> >>> -diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> >>> -index 5136f82aa..9f557743a 100644
> >>> ---- a/test/CMakeLists.txt
> >>> -+++ b/test/CMakeLists.txt
> >>> -@@ -277,7 +277,6 @@ ei_add_test(special_numbers)
> >>> - ei_add_test(rvalue_types)
> >>> - ei_add_test(dense_storage)
> >>> - ei_add_test(ctorleak)
> >>> --ei_add_test(mpl2only)
> >>> - ei_add_test(inplace_decomposition)
> >>> - ei_add_test(half_float)
> >>> - ei_add_test(bfloat16_float)
> >>>  diff --git a/test/mpl2only.cpp b/test/mpl2only.cpp
> >>>  deleted file mode 100644
> >>>  index 296350d08..000000000
> >>> @@ -662,11 +649,11 @@ index 296350d08..000000000
> >>>  -  return 0;
> >>>  -}
> >>>  diff --git a/unsupported/Eigen/IterativeSolvers b/unsupported/Eigen/=
IterativeSolvers
> >>> -index a3f58d676..f045fb607 100644
> >>> +index b53f10937..3ac64e9f8 100644
> >>>  --- a/unsupported/Eigen/IterativeSolvers
> >>>  +++ b/unsupported/Eigen/IterativeSolvers
> >>>  @@ -19,7 +19,6 @@
> >>> -   * \defgroup IterativeLinearSolvers_Module Iterative solvers modul=
e
> >>> +   * \defgroup IterativeLinearSolvers_Module IterativeLinearSolvers =
module
> >>>     * This module aims to provide various iterative linear and non li=
near solver algorithms.
> >>>     * It currently provides:
> >>>  -  *  - a constrained conjugate gradient
> >>> @@ -1038,3 +1025,6 @@ index a116e09e2..000000000
> >>>  -} // end namespace Eigen
> >>>  -
> >>>  -#endif // EIGEN_ITERATION_CONTROLLER_H
> >>> +--
> >>> +2.48.1
> >>> +
> >>> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/met=
a-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> >>> similarity index 84%
> >>> rename from meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> >>> rename to meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> >>> index f5f874941a..520244ec7a 100644
> >>> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> >>> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> >>> @@ -13,15 +13,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D8=
15ca599c9df247a0c7f619bab123dad \
> >>>  "
> >>>
> >>>  SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;bra=
nch=3D3.4 \
> >>> -    file://0001-Default-eigen_packet_wrapper-constructor.patch \
> >>> -    file://0002-Remove-LGPL-Code-and-references.patch \
> >>> +    file://0001-Remove-LGPL-Code-and-references.patch \
> >>>  "
> >>>
> >>> -SRCREV =3D "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
> >>> +SRCREV =3D "d71c30c47858effcbd39967097a2d99ee48db464"
> >>>
> >>>
> >>>  inherit cmake
> >>>
> >>> +EXTRA_OECMAKE +=3D " \
> >>> +    -DEIGEN_BUILD_BLAS=3DOFF \
> >>> +    -DEIGEN_BUILD_LAPACK=3DOFF \
> >>> +    -DEIGEN_BUILD_TESTING=3DOFF \
> >>> +"
> >>> +
> >>>  FILES:${PN}-dev +=3D "${datadir}/eigen3/cmake"
> >>>
> >>>  # ${PN} is empty so we need to tweak -dev and -dbg package dependenc=
ies
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#120427): https://lists.openembedded.org/g/openemb=
edded-devel/message/120427
> >>> Mute This Topic: https://lists.openembedded.org/mt/115669722/6084445
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [skandigraun@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
>

