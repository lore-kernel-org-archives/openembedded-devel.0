Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77D1CC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:37:55 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33161.1792042670122741907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KYm7755F;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6c8f6a53fabso6023885eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792042669; cv=none;
        d=google.com; s=arc-20260327;
        b=m9YACrLaEk47OmHZOTcv4AIj7lUDKjG/vfQnTIAdtNJLMj7BUaP3qeSIPjPvfjKv7q
         /gw3f8mQ60NBRYT0JKS+2z0e7k9sK9uqGgqapJ7C0W5w8x6J5NCw3uUiBEKqYjNsacIA
         /WzkxyWhV0sAV82JWUWqyZ5OoyQaIsgpGKiFibQx0A4Ai+ZwoOJSPT2ULr+F2n6r+oN6
         RftOum4TLpU3BwdYW0yTuRanoxnlyZ1uoJxrgTy5xR9gBYDkM2dkpR9d0GwwB9VtDOlk
         UN4Li70giOYUbHmu5Y+l+6TMdLQNREFeKYEBwKhSS/3pAKd37r2LYD8uUp8tkjJn/Ocu
         g1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qOPYOPJKkIS+7+kO3FFfEbAwvNt2n/4M+Zp9TUoEuA=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=YYjB7tXwzUreSC804vCCVzMcMNnovqmgnBA76n8e2QBpmGtg/8qxd4V6iyRi59dZ5y
         mQ+dmycl13uKxqluXEW4AVQWoO+2yOVEbOJ/h4hmv+ivDCXNfBxnOkH9xtffB64khb/u
         BHiER0tJFrxoD9QSiu7Bvklz7Ur6aLBnH1AYl/6oE2DNbvgoqzfHCB5pEMsPmkK9bvX5
         cjOORLDmgWnUIehlgonYPUSiT72DFrlrGqz2rYT9dTVuFbjeH1D7jTO8j2NmQUqDCY3m
         u8E6q8lJL0Vt73wbf6m8XeO5c/+HRsytCzutUMoiKIfqCB+GXbaAq7Y5OrSTWWrCWVr0
         ygng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042669; x=1792647469; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qOPYOPJKkIS+7+kO3FFfEbAwvNt2n/4M+Zp9TUoEuA=;
        b=KYm7755F/jXB/PIfjaQmRGTzv4O8vx0+eE8s5JbTVMhyTa//925D5lHDoPyjtpoWLw
         hQ16iKoPNJvvYtlbdt/3ncST7FLMy/6yMyhmFKHfxxiPjTuQTA9YuIDDQZ1AhKE8C0sH
         bGgbsWLdsHUrl+D8YX4LVOWiAPuk22Gw5lTbOmAhNFgg0T5v98ckHT0KD6yEtKhish2A
         FmWSKy5g+rcUD+45rozuIBIQkBPlCFlzSPO9AdxiXN9P7JDh3rlyeb64EnYnlu9P6Uql
         Nk7BGG6qy9T+oWoQ301WAGwIe0LhI9C6/5UpR7sxl7oXuCSGO8ybb2+3x1mPJJmA69RY
         /RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042669; x=1792647469;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qOPYOPJKkIS+7+kO3FFfEbAwvNt2n/4M+Zp9TUoEuA=;
        b=Lsyaq4ro844lBG+d6s5w18mMIAK4yw1YpbLHY9EHljgo8CuJGfavl5DEWTPWE8rY3o
         eUnW8CDEPwC/I+EIWPx0u/4uGQvO4YcT3Amh/RTwd78zytBVLH8CQHWfh75Hc5e4uHY/
         lp4aqXqcS/JC0mlC0XmrfWw5v6LCDEoQ+OwfKHmqNxBoTUMbvwWLvJpGRYndB3VnhQEA
         NdHeuZcdT5UqHPWxO9CpLDZpKQmGqFMjieWgCTyzJXx/+Mjk9RdU9yJrgLmTiIxvmzPi
         LmbEoQU+GmDRDxvaLOnjSjieCXsGw5/owlONzdX/pa/WeTQm3wK/QLVinvEKQhjIlzSi
         jhWg==
X-Gm-Message-State: AFq9FYJB6+ADXcPl/QdyQcp033X7uhVsdrs0qIVUZDYIwtYjuVjDo4wD
	tnUAqPH2Bk/qB6JnWPYopz7kPkvBjU3WmN+0B+h7Ke63DM8xz2/ZDwnIWVShh6fD+PzrcyBNVET
	R9BXnOFn/G3XcojnHpgBrhipxFzEiZHCx1w==
X-Gm-Gg: AYBFou2B6l7zxAJBatLnieZjX7FT8TcdjHOhvNOTzQng7uPr4sWeBkPj1aBGfHou6a8
	nOpd8p28FdqeNItz+7ESs3sfF54CWOijNXl9AtA0OeYlrzAac5NERmnxKJ4aNx1B32QJauC94ce
	1lJM57uatsSDIowdXeMk/wglFhegzBnzK20fCRbTsvJjkYbUeD7DR5yQBrgqWK0L7xpLU/Hd7gW
	fyo2QTT/Bo5tbArAz1pDWs7DKYOXeBR0uyx85RbVBXCPBLUXVKg0CczVXOsrximBiTDwLK0ysdh
	XJbDlDJdrY9Q0KzcuYJjD4M+WOY2jGhzLwtNXiLl6+3zvV3i0mvaM1IFxVEgwOhJmRHS9w==
X-Received: by 2002:a05:6820:180c:b0:6d6:f31e:2b57 with SMTP id
 006d021491bc7-6eee59ed93fmr10686349eaf.69.1792042669028; Wed, 14 Oct 2026
 22:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com> <20261015012752.1650544-5-ankur.tyagi85@gmail.com>
In-Reply-To: <20261015012752.1650544-5-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 15 Oct 2026 18:37:38 +1300
X-Gm-Features: AclHuK809K-5Y0zjDEyZS5-1LCvgn2erTv_KRXDPpYJvbEO5f8B2gDbv4FZse7Y
Message-ID: <CADySD0G2Cr8pr+11i86Q-EFO27NcdUGiK4KHjC-vbgWSrkBptg@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH 5/6] x65: upgrade 4.2 -> 4.3
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130919

typo in the commit message, sent v2

On Thu, Oct 15, 2026 at 2:28=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> - Update SRC_URI as official repository moved to GitHub[1]
> - Replace 0001-json11.cpp-Include-cstdint.patch with upstream backport
> - Refresh 0002-x265-fix-build-with-cmake-4.patch
>
> Changelog:
> https://github.com/Multicorewareinc/x265/blob/4.3/doc/reST/releasenotes.r=
st
>
> [1] https://www.x265.org/#contribute
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...1-fix-dynamicHDR10-undefined-uint8_t.patch | 23 +++++++++++++
>  .../0001-json11.cpp-Include-cstdint.patch     | 33 -------------------
>  ...=3D> 0002-x265-fix-build-with-cmake-4.patch} | 31 +++++++----------
>  .../x265/{x265_4.2.bb =3D> x265_4.3.bb}         | 13 ++++----
>  4 files changed, 40 insertions(+), 60 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-fix=
-dynamicHDR10-undefined-uint8_t.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-jso=
n11.cpp-Include-cstdint.patch
>  rename meta-multimedia/recipes-multimedia/x265/x265/{0001-x265-fix-build=
-with-cmake-4.patch =3D> 0002-x265-fix-build-with-cmake-4.patch} (61%)
>  rename meta-multimedia/recipes-multimedia/x265/{x265_4.2.bb =3D> x265_4.=
3.bb} (72%)
>
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynami=
cHDR10-undefined-uint8_t.patch b/meta-multimedia/recipes-multimedia/x265/x2=
65/0001-fix-dynamicHDR10-undefined-uint8_t.patch
> new file mode 100644
> index 0000000000..cce6c8f6f2
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-=
undefined-uint8_t.patch
> @@ -0,0 +1,23 @@
> +From 3b7d8d1e6134db80db46a927c06c33074dcb4bda Mon Sep 17 00:00:00 2001
> +From: ReenigneArcher <reenignearcher@gmail.com>
> +Date: Wed, 9 Jul 2025 14:41:33 +0000
> +Subject: [PATCH] fix(dynamicHDR10): undefined-uint8_t
> +
> +(cherry picked from commit 98eec4057fc20850b59ed292b3f13ddeefc2f93f)
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + source/dynamicHDR10/json11/json11.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/source/dynamicHDR10/json11/json11.cpp b/source/dynamicHDR10=
/json11/json11.cpp
> +index 762577735..c111ebb82 100644
> +--- a/source/dynamicHDR10/json11/json11.cpp
> ++++ b/source/dynamicHDR10/json11/json11.cpp
> +@@ -22,6 +22,7 @@
> + #include "json11.h"
> + #include <cassert>
> + #include <cmath>
> ++#include <cstdint>
> + #include <cstdlib>
> + #include <cstdio>
> + #include <limits>
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp=
-Include-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-=
json11.cpp-Include-cstdint.patch
> deleted file mode 100644
> index f32316009f..0000000000
> --- a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Includ=
e-cstdint.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001
> -From: Leon Anavi <leon.anavi@konsulko.com>
> -Date: Mon, 5 May 2025 14:08:36 +0000
> -Subject: [PATCH] json11.cpp: Include cstdint
> -
> -Fixes:
> -
> -json11.cpp:101:32: error: 'uint8_t' does not name a type
> -
> -This work was sponsored by GOVCERT.LU.
> -
> -Upstream-Status: Pending [https://bitbucket.org/multicoreware/x265_git/p=
ull-requests/33]
> -
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ----
> - dynamicHDR10/json11/json11.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11=
.cpp
> -index 7625777..74f990a 100644
> ---- a/dynamicHDR10/json11/json11.cpp
> -+++ b/dynamicHDR10/json11/json11.cpp
> -@@ -25,6 +25,7 @@
> - #include <cstdlib>
> - #include <cstdio>
> - #include <limits>
> -+#include <cstdint>
> -
> - #if _MSC_VER
> - #pragma warning(disable: 4510) //const member cannot be default initial=
ized
> ---
> -2.39.5
> -
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-b=
uild-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/0002=
-x265-fix-build-with-cmake-4.patch
> similarity index 61%
> rename from meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-bu=
ild-with-cmake-4.patch
> rename to meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-buil=
d-with-cmake-4.patch
> index 7d301777f0..64da2c31e0 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-wi=
th-cmake-4.patch
> +++ b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-wi=
th-cmake-4.patch
> @@ -1,4 +1,4 @@
> -From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001
> +From 5e759128b016cb03866ada875166560155b9d21e Mon Sep 17 00:00:00 2001
>  From: Markus Volk <f_l_k@t-online.de>
>  Date: Thu, 10 Jul 2025 09:04:27 +0200
>  Subject: [PATCH] x265: fix build with cmake 4
> @@ -8,16 +8,17 @@ with 4.0
>
>  Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
> -Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
> +Upstream-Status: Submitted [https://github.com/Multicorewareinc/x265/pul=
l/996]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>  ---
>   source/CMakeLists.txt              | 2 +-
> - source/dynamicHDR10/CMakeLists.txt | 4 ++--
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> + source/dynamicHDR10/CMakeLists.txt | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
> -index 2e3beaaf3..45df2e9fd 100755
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> +index 3177af99a..f1364b886 100755
> +--- a/source/CMakeLists.txt
> ++++ b/source/CMakeLists.txt
>  @@ -11,7 +11,7 @@ if(POLICY CMP0042)
>       cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
>   endif()
> @@ -28,9 +29,9 @@ index 2e3beaaf3..45df2e9fd 100755
>   if (POLICY CMP0075)
>       cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES warning
>  diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10/CM=
akeLists.txt
> -index 4243338c6..03c866b1f 100644
> ---- a/dynamicHDR10/CMakeLists.txt
> -+++ b/dynamicHDR10/CMakeLists.txt
> +index 4243338c6..2c3af4f00 100644
> +--- a/source/dynamicHDR10/CMakeLists.txt
> ++++ b/source/dynamicHDR10/CMakeLists.txt
>  @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
>       hdr10plus.h
>       api.cpp )
> @@ -40,13 +41,3 @@ index 4243338c6..03c866b1f 100644
>   project(dynamicHDR10)
>   include(CheckIncludeFiles)
>   include(CheckFunctionExists)
> -@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING "Install locati=
on of executables")
> - option(ENABLE_SHARED "Build shared library" OFF)
> -
> - install(FILES hdr10plus.h DESTINATION include)
> --endif()
> -\ No newline at end of file
> -+endif()
> ---
> -2.43.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb b/meta-m=
ultimedia/recipes-multimedia/x265/x265_4.3.bb
> similarity index 72%
> rename from meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> rename to meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
> index 9bef2b8bd2..6459fbc8cf 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "H.265/HEVC video encoder"
>  DESCRIPTION =3D "A free software library and application for encoding vi=
deo streams into the H.265/HEVC format."
> -HOMEPAGE =3D "https://bitbucket.org/multicoreware/x265_git"
> +HOMEPAGE =3D "https://github.com/Multicorewareinc/x265"
>
>  LICENSE =3D "GPL-2.0-only"
>  LICENSE_FLAGS =3D "commercial"
> @@ -9,12 +9,12 @@ LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc=
58f129f99728c62d4ad4091"
>  DEPENDS =3D "nasm-native gnutls zlib libpcre numactl"
>
>  SRC_URI =3D " \
> -    https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.t=
ar.gz \
> -    file://0001-json11.cpp-Include-cstdint.patch \
> -    file://0001-x265-fix-build-with-cmake-4.patch \
> +    git://github.com/Multicorewareinc/x265.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV} \
> +    file://0001-fix-dynamicHDR10-undefined-uint8_t.patch \
> +    file://0002-x265-fix-build-with-cmake-4.patch \
>  "
> -SRC_URI[sha256sum] =3D "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e889=
4e8f1c1c8d5e1210"
> -S =3D "${UNPACKDIR}/x265_${PV}/source"
> +SRCREV =3D "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
> +S =3D "${UNPACKDIR}/x265-${PV}/source"
>
>  inherit lib_package cmake pkgconfig
>
> @@ -30,4 +30,3 @@ PACKAGECONFIG[10bit] =3D "-DHIGH_BIT_DEPTH=3DON,-DHIGH_=
BIT_DEPTH=3DOFF"
>
>  FILES:${PN} +=3D "${libdir}/libhdr10plus.so"
>  FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig ${libdir}/libx265=
.so"
> -

