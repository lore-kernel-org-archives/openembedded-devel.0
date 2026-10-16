Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9166DCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:26:56 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15433.1792128412275645101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ObFMqYpQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ac4806e210so44617527b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 22:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792128411; cv=none;
        d=google.com; s=arc-20260327;
        b=WZnAKm4XIpXYsbpnpgg5aiwTbbNipGNrS7zk//wkOktMa+3e4qVuPW/qySO62zjHXW
         +gu/gtjeFV/PSGyl6/uoNC8gW4KKWSnQeQcitp38+Agv7rhufkb82hCMC40cAnZRUjN2
         3QnBpxufca5xYBVJRKF6EGFIY0LpuJHSb8BWDag/pg4decRhcZNRE64ya9RpJXHPcKKu
         ASelM7keJKrdCckwr6EvcBgBt/KTteKxwaMHg4herwEMXE70pI7/niB59G+n8u7Vne1m
         WUhWjFvPFG6SOom3VXcDYHs/68bMFd5gHwk1/ddjvxnjPTMaNYbZ6+JBiwCQZY4g9nNv
         kgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VVEW+d0UqAhXjYTxXdS0vOm2ywOLQEZn4fc3zFqX9G0=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=bSOz1ndH9Zhd77MV/qqtHZjoSCp81KjkPt3Do7oiO+JSLNtFULzxxzZH0BiiZ6Gw5N
         JZ/nBaOyG2EwcCAQ3IsldG4rVU1sEkuwTtd1jT+5lS2J40MvVFiYWaUuAnugLHzSehmW
         fHsyLQIcUxFfu4F59GkZvTG0VPzi5kWcDOe5adNSEWS5Oq0oeNac0bBz5usCCU6xKCeD
         uQvvTVmNMoA1IZ6FgxzuwcgRNj3lXMHE8K/D6qa5TqBuZ5YR7+sK8z3aShjAFFk9knV8
         MJO+koE+uYpHm49hS1OMRUmYno7BgX/DUu6+bs3CPM2TwRy/rLpRrcvMTfhFNyFAh2Yo
         VqqA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792128411; x=1792733211; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVEW+d0UqAhXjYTxXdS0vOm2ywOLQEZn4fc3zFqX9G0=;
        b=ObFMqYpQUVF8JQRm6BvZSWkDNIGoeinp3F7z9goQoKd+GR3l8G3/tz/f4YSa7yqDmw
         TJce0Y8Uefel0gidCV4DgVMOb2SWC6iSwN0gHl7UAuRgHL+gNuBhfgNBYCsuqCxXodxb
         bFpVhpHcusigrBdQUN2FFMLYaH/myJSnc7dshKs8RR+C2cEyBl4aEKAkWDZbLw5EZlmw
         5a0CRGrbZ3a5OrgAoulOH0e9bzIrT1TSh86k8fMJh9rR0+P4D32XnT7NG3ZeZ1dki3r/
         xB9PuI2s9CTZFvte0YwK5tePDeDCz3t9K5kON4QQAIf6voZcAxlbFV0dz2lIeOPohDGO
         lzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128411; x=1792733211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VVEW+d0UqAhXjYTxXdS0vOm2ywOLQEZn4fc3zFqX9G0=;
        b=kOR+deM+5Sa9L8NjQm2t6bSis5ONbxTqYMq6cOedfJ9tPwCOkZdVc6t992aVzdp8Nr
         C7Fo6Ob7Q8hIvRDC8DTd4m5xoQJwgQcjhvtqz4Kc6ohiaK0olKP/Eo2pcG/vrZ+NnPuF
         vIxXgoVYAv7LAEYZJGUWcJHvWYbzUrPV8FGPDMoaXzi1JWQluMTRaowm8KuB18bzNQeY
         6zIENw5JEOH+3DM7xLyrc6cmM/uezdpRXQfNmInrN8ZW1bhvI7N301UtNi1ATbm8MZYN
         ozoB4Bn8WfI3F1k8V1cVlSAapFxpeav4BjVXqTnnVy8xCHo+qbPbrWkpYFvnbRYsmIJZ
         7TOw==
X-Gm-Message-State: AFq9FYI2FiQ9ZGRoRxGR8GaMp1WyKCZ5buELYqox6edfflUbA8/kXv1t
	zUS5cfrj4x4TNPsDcQuLli2U55pF59wFi0n9yTRumSNQEKG96Grqd2en4Di1zI6VKYV8wm6y/5W
	5TqRJEs8gWchGZzPh9x1t1txuj1+Lhzk=
X-Gm-Gg: AYBFou3hAaCb3EVhz38e1dLy1EVZJyzJas5YN0NvX9ujGSTYkW5RyQWX7T3eepnwP8c
	i8VetgrTXWv+/UVr5LGXZm+ad/RES8zORskSell/fGkmV2Tw8m8KpDzG8mjjg2QPLWYyXhW1scm
	fv3cc6jXLOIY5NZL4MBDUa99lsS3IP1CwOvTSRGB9vkykTJHWAbdRu2k2hh9XxhFVdmtv4g4quJ
	WneMANoKfln32JmwYw3D19kNWHaNMQ6YA0sBDrS2ktSaJMU4mk3Nx+F49Pg69ibeMRnHtNVH7iM
	50vxL1kkfJHlVH3Yvvkpx7i7av4bgUCLoNu/tWAWlBNRR0O/hQSPIZU8lrnoG/t4ct3hJNsBp2w
	lKmYZewwBR3m6geG4RA1fpovRJ0dqYofYIMd7t8u8uhNgA+7ias4Cu3Ob0DbBqVJypup7pGyd4K
	7b+4NHt35box/LgEjFfeurz4CAaZ1q0+934bLnSFM+zPhzvAclONehd068na4uqXHqz4wODEoxB
	9D5282zyVFp5pmZLxXMF18mo/vLhAfQpQC49SfKXF4Cm+qmraJFwkgVwW+WI6UmH4hE5xUt07nS
	iUGHY1xM
X-Received: by 2002:a05:690c:11:b0:8b0:8a9c:fac9 with SMTP id
 00721157ae682-8b08a9d038dmr70796477b3.28.1792128411036; Thu, 15 Oct 2026
 22:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261015053702.2069346-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20261015053702.2069346-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Oct 2026 22:26:24 -0700
X-Gm-Features: AclHuK9i172LKSvMnBg6asLgsg2vUCgoIbUA5WN_zoJpzIq8k9knevU9YC0YhZ4
Message-ID: <CAMKF1so9_9RirME-WZ9JOotDwYV-3OOB2rDtm52uew+YPSn7Uw@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH v2 1/1] x265: upgrade 4.2 -> 4.3
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054f1e8065dee6935"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131051

--00000000000054f1e8065dee6935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:37=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

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
>  create mode 100644
> meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-undefi=
ned-uint8_t.patch
>  delete mode 100644
> meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cstd=
int.patch
>  rename
> meta-multimedia/recipes-multimedia/x265/x265/{0001-x265-fix-build-with-cm=
ake-4.patch
> =3D> 0002-x265-fix-build-with-cmake-4.patch} (61%)
>  rename meta-multimedia/recipes-multimedia/x265/{x265_4.2.bb =3D>
> x265_4.3.bb} (72%)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-unde=
fined-uint8_t.patch
> b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-unde=
fined-uint8_t.patch
> new file mode 100644
> index 0000000000..cce6c8f6f2
> --- /dev/null
> +++
> b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-unde=
fined-uint8_t.patch
> @@ -0,0 +1,23 @@
> +From 3b7d8d1e6134db80db46a927c06c33074dcb4bda Mon Sep 17 00:00:00 2001
> +From: ReenigneArcher <reenignearcher@gmail.com>
> +Date: Wed, 9 Jul 2025 14:41:33 +0000
> +Subject: [PATCH] fix(dynamicHDR10): undefined-uint8_t
> +
> +(cherry picked from commit 98eec4057fc20850b59ed292b3f13ddeefc2f93f)
>

This needs the Upstream-Status tag added.


> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + source/dynamicHDR10/json11/json11.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/source/dynamicHDR10/json11/json11.cpp
> b/source/dynamicHDR10/json11/json11.cpp
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
> diff --git
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cs=
tdint.patch
> b/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cs=
tdint.patch
> deleted file mode 100644
> index f32316009f..0000000000
> ---
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-cs=
tdint.patch
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
> -Upstream-Status: Pending [
> https://bitbucket.org/multicoreware/x265_git/pull-requests/33]
> -
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ----
> - dynamicHDR10/json11/json11.cpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/dynamicHDR10/json11/json11.cpp
> b/dynamicHDR10/json11/json11.cpp
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
> - #pragma warning(disable: 4510) //const member cannot be default
> initialized
> ---
> -2.39.5
> -
> diff --git
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-c=
make-4.patch
> similarity index 61%
> rename from
> meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cma=
ke-4.patch
> rename to
> meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-cma=
ke-4.patch
> index 7d301777f0..64da2c31e0 100644
> ---
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> +++
> b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with-c=
make-4.patch
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
> +Upstream-Status: Submitted [
> https://github.com/Multicorewareinc/x265/pull/996]
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
>  diff --git a/source/dynamicHDR10/CMakeLists.txt
> b/source/dynamicHDR10/CMakeLists.txt
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
> -@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING "Install
> location of executables")
> - option(ENABLE_SHARED "Build shared library" OFF)
> -
> - install(FILES hdr10plus.h DESTINATION include)
> --endif()
> -\ No newline at end of file
> -+endif()
> ---
> -2.43.0
> -
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
> similarity index 72%
> rename from meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> rename to meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
> index 9bef2b8bd2..6459fbc8cf 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "H.265/HEVC video encoder"
>  DESCRIPTION =3D "A free software library and application for encoding vi=
deo
> streams into the H.265/HEVC format."
> -HOMEPAGE =3D "https://bitbucket.org/multicoreware/x265_git"
> +HOMEPAGE =3D "https://github.com/Multicorewareinc/x265"
>
>  LICENSE =3D "GPL-2.0-only"
>  LICENSE_FLAGS =3D "commercial"
> @@ -9,12 +9,12 @@ LIC_FILES_CHKSUM =3D
> "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4ad4091"
>  DEPENDS =3D "nasm-native gnutls zlib libpcre numactl"
>
>  SRC_URI =3D " \
> -
> https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz
> \
> -    file://0001-json11.cpp-Include-cstdint.patch \
> -    file://0001-x265-fix-build-with-cmake-4.patch \
> +    git://
> github.com/Multicorewareinc/x265.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3D${PV}
> <http://github.com/Multicorewareinc/x265.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3D$%7BPV%7D>
> \
> +    file://0001-fix-dynamicHDR10-undefined-uint8_t.patch \
> +    file://0002-x265-fix-build-with-cmake-4.patch \
>  "
> -SRC_URI[sha256sum] =3D
> "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
> -S =3D "${UNPACKDIR}/x265_${PV}/source"
> +SRCREV =3D "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
> +S =3D "${UNPACKDIR}/x265-${PV}/source"
>
>  inherit lib_package cmake pkgconfig
>
> @@ -30,4 +30,3 @@ PACKAGECONFIG[10bit] =3D
> "-DHIGH_BIT_DEPTH=3DON,-DHIGH_BIT_DEPTH=3DOFF"
>
>  FILES:${PN} +=3D "${libdir}/libhdr10plus.so"
>  FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig ${libdir}/libx265=
.so"
> -
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130918):
> https://lists.openembedded.org/g/openembedded-devel/message/130918
> Mute This Topic: https://lists.openembedded.org/mt/121764990/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000054f1e8065dee6935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 14,=
 2026 at 10:37=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Anku=
r Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">an=
kur.tyagi85@gmail.com</a>&gt;<br>
<br>
- Update SRC_URI as official repository moved to GitHub[1]<br>
- Replace 0001-json11.cpp-Include-cstdint.patch with upstream backport<br>
- Refresh 0002-x265-fix-build-with-cmake-4.patch<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/Multicorewareinc/x265/blob/4.3/doc/reST/relea=
senotes.rst" rel=3D"noreferrer" target=3D"_blank">https://github.com/Multic=
orewareinc/x265/blob/4.3/doc/reST/releasenotes.rst</a><br>
<br>
[1] <a href=3D"https://www.x265.org/#contribute" rel=3D"noreferrer" target=
=3D"_blank">https://www.x265.org/#contribute</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0...1-fix-dynamicHDR10-undefined-uint8_t.patch | 23 +++++++++++++<br>
=C2=A0.../0001-json11.cpp-Include-cstdint.patch=C2=A0 =C2=A0 =C2=A0| 33 ---=
----------------<br>
=C2=A0...=3D&gt; 0002-x265-fix-build-with-cmake-4.patch} | 31 +++++++------=
----<br>
=C2=A0.../x265/{<a href=3D"http://x265_4.2.bb" rel=3D"noreferrer" target=3D=
"_blank">x265_4.2.bb</a> =3D&gt; <a href=3D"http://x265_4.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">x265_4.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 13 ++++----<br>
=C2=A04 files changed, 40 insertions(+), 60 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-=
fix-dynamicHDR10-undefined-uint8_t.patch<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0001-=
json11.cpp-Include-cstdint.patch<br>
=C2=A0rename meta-multimedia/recipes-multimedia/x265/x265/{0001-x265-fix-bu=
ild-with-cmake-4.patch =3D&gt; 0002-x265-fix-build-with-cmake-4.patch} (61%=
)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/x265/{<a href=3D"http://x26=
5_4.2.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a> =3D&gt; <a h=
ref=3D"http://x265_4.3.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.3.bb=
</a>} (72%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicH=
DR10-undefined-uint8_t.patch b/meta-multimedia/recipes-multimedia/x265/x265=
/0001-fix-dynamicHDR10-undefined-uint8_t.patch<br>
new file mode 100644<br>
index 0000000000..cce6c8f6f2<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-fix-dynamicHDR10-un=
defined-uint8_t.patch<br>
@@ -0,0 +1,23 @@<br>
+From 3b7d8d1e6134db80db46a927c06c33074dcb4bda Mon Sep 17 00:00:00 2001<br>
+From: ReenigneArcher &lt;<a href=3D"mailto:reenignearcher@gmail.com" targe=
t=3D"_blank">reenignearcher@gmail.com</a>&gt;<br>
+Date: Wed, 9 Jul 2025 14:41:33 +0000<br>
+Subject: [PATCH] fix(dynamicHDR10): undefined-uint8_t<br>
+<br>
+(cherry picked from commit 98eec4057fc20850b59ed292b3f13ddeefc2f93f)<br></=
blockquote><div><br></div><div>This needs the Upstream-Status tag added.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+---<br>
+ source/dynamicHDR10/json11/json11.cpp | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/source/dynamicHDR10/json11/json11.cpp b/source/dynamicHDR10/j=
son11/json11.cpp<br>
+index 762577735..c111ebb82 100644<br>
+--- a/source/dynamicHDR10/json11/json11.cpp<br>
++++ b/source/dynamicHDR10/json11/json11.cpp<br>
+@@ -22,6 +22,7 @@<br>
+ #include &quot;json11.h&quot;<br>
+ #include &lt;cassert&gt;<br>
+ #include &lt;cmath&gt;<br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;cstdlib&gt;<br>
+ #include &lt;cstdio&gt;<br>
+ #include &lt;limits&gt;<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-I=
nclude-cstdint.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-js=
on11.cpp-Include-cstdint.patch<br>
deleted file mode 100644<br>
index f32316009f..0000000000<br>
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-json11.cpp-Include-=
cstdint.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 6cbd417be3f6bcbda77464db6a4d83cef3df8904 Mon Sep 17 00:00:00 2001<br>
-From: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" target=3D"=
_blank">leon.anavi@konsulko.com</a>&gt;<br>
-Date: Mon, 5 May 2025 14:08:36 +0000<br>
-Subject: [PATCH] json11.cpp: Include cstdint<br>
-<br>
-Fixes:<br>
-<br>
-json11.cpp:101:32: error: &#39;uint8_t&#39; does not name a type<br>
-<br>
-This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer=
" target=3D"_blank">GOVCERT.LU</a>.<br>
-<br>
-Upstream-Status: Pending [<a href=3D"https://bitbucket.org/multicoreware/x=
265_git/pull-requests/33" rel=3D"noreferrer" target=3D"_blank">https://bitb=
ucket.org/multicoreware/x265_git/pull-requests/33</a>]<br>
-<br>
-Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
----<br>
- dynamicHDR10/json11/json11.cpp | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/dynamicHDR10/json11/json11.cpp b/dynamicHDR10/json11/json11.c=
pp<br>
-index 7625777..74f990a 100644<br>
---- a/dynamicHDR10/json11/json11.cpp<br>
-+++ b/dynamicHDR10/json11/json11.cpp<br>
-@@ -25,6 +25,7 @@<br>
- #include &lt;cstdlib&gt;<br>
- #include &lt;cstdio&gt;<br>
- #include &lt;limits&gt;<br>
-+#include &lt;cstdint&gt;<br>
- <br>
- #if _MSC_VER<br>
- #pragma warning(disable: 4510) //const member cannot be default initializ=
ed<br>
--- <br>
-2.39.5<br>
-<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-bui=
ld-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/0002-x=
265-fix-build-with-cmake-4.patch<br>
similarity index 61%<br>
rename from meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-buil=
d-with-cmake-4.patch<br>
rename to meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-=
with-cmake-4.patch<br>
index 7d301777f0..64da2c31e0 100644<br>
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with=
-cmake-4.patch<br>
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0002-x265-fix-build-with=
-cmake-4.patch<br>
@@ -1,4 +1,4 @@<br>
-From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001<br>
+From 5e759128b016cb03866ada875166560155b9d21e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a>&gt;<br>
=C2=A0Date: Thu, 10 Jul 2025 09:04:27 +0200<br>
=C2=A0Subject: [PATCH] x265: fix build with cmake 4<br>
@@ -8,16 +8,17 @@ with 4.0<br>
<br>
=C2=A0Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" t=
arget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/videolan/x265/pu=
ll/17" rel=3D"noreferrer" target=3D"_blank">https://github.com/videolan/x26=
5/pull/17</a>]<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/Multicorewareinc=
/x265/pull/996" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mul=
ticorewareinc/x265/pull/996</a>]<br>
+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 source/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
- source/dynamicHDR10/CMakeLists.txt | 4 ++--<br>
- 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+ source/dynamicHDR10/CMakeLists.txt | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt<br>
-index 2e3beaaf3..45df2e9fd 100755<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
+index 3177af99a..f1364b886 100755<br>
+--- a/source/CMakeLists.txt<br>
++++ b/source/CMakeLists.txt<br>
=C2=A0@@ -11,7 +11,7 @@ if(POLICY CMP0042)<br>
=C2=A0 =C2=A0 =C2=A0 cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH<br>
=C2=A0 endif()<br>
@@ -28,9 +29,9 @@ index 2e3beaaf3..45df2e9fd 100755<br>
=C2=A0 if (POLICY CMP0075)<br>
=C2=A0 =C2=A0 =C2=A0 cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARI=
ES warning<br>
=C2=A0diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10=
/CMakeLists.txt<br>
-index 4243338c6..03c866b1f 100644<br>
---- a/dynamicHDR10/CMakeLists.txt<br>
-+++ b/dynamicHDR10/CMakeLists.txt<br>
+index 4243338c6..2c3af4f00 100644<br>
+--- a/source/dynamicHDR10/CMakeLists.txt<br>
++++ b/source/dynamicHDR10/CMakeLists.txt<br>
=C2=A0@@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT<br>
=C2=A0 =C2=A0 =C2=A0 hdr10plus.h<br>
=C2=A0 =C2=A0 =C2=A0 api.cpp )<br>
@@ -40,13 +41,3 @@ index 4243338c6..03c866b1f 100644<br>
=C2=A0 project(dynamicHDR10)<br>
=C2=A0 include(CheckIncludeFiles)<br>
=C2=A0 include(CheckFunctionExists)<br>
-@@ -150,4 +150,4 @@ set(BIN_INSTALL_DIR bin CACHE STRING &quot;Install loc=
ation of executables&quot;)<br>
- option(ENABLE_SHARED &quot;Build shared library&quot; OFF)<br>
- <br>
- install(FILES hdr10plus.h DESTINATION include)<br>
--endif()<br>
-\ No newline at end of file<br>
-+endif()<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265=
_4.2.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a> b/meta-multim=
edia/recipes-multimedia/x265/<a href=3D"http://x265_4.3.bb" rel=3D"noreferr=
er" target=3D"_blank">x265_4.3.bb</a><br>
similarity index 72%<br>
rename from meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_=
4.2.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a><br>
rename to meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.=
3.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.3.bb</a><br>
index 9bef2b8bd2..6459fbc8cf 100644<br>
--- a/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.2.bb=
" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.3.bb=
" rel=3D"noreferrer" target=3D"_blank">x265_4.3.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0SUMMARY =3D &quot;H.265/HEVC video encoder&quot;<br>
=C2=A0DESCRIPTION =3D &quot;A free software library and application for enc=
oding video streams into the H.265/HEVC format.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://bitbucket.org/multicoreware/x265_git=
" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.org/multicoreware/=
x265_git</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/Multicorewareinc/x265" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Multicorewareinc/x265=
</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LICENSE_FLAGS =3D &quot;commercial&quot;<br>
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM =3D &quot;file://../COPYING;md5=3Dc9e042=
7bc58f129f99728c62d4ad4091&quot;<br>
=C2=A0DEPENDS =3D &quot;nasm-native gnutls zlib libpcre numactl&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"https://download.videolan.org/pub/pub/videolan/$%=
7BBPN%7D/$%7BBPN%7D_$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz</=
a> \<br>
-=C2=A0 =C2=A0 file://0001-json11.cpp-Include-cstdint.patch \<br>
-=C2=A0 =C2=A0 file://0001-x265-fix-build-with-cmake-4.patch \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/Multicorewareinc/x265.git=
;protocol=3Dhttps;branch=3Dmaster;tag=3D$%7BPV%7D" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/Multicorewareinc/x265.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 file://0001-fix-dynamicHDR10-undefined-uint8_t.patch \<br>
+=C2=A0 =C2=A0 file://0002-x265-fix-build-with-cmake-4.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;40b1ea0453e0309f0eba934e0ddf533f8f6295966679e=
8894e8f1c1c8d5e1210&quot;<br>
-S =3D &quot;${UNPACKDIR}/x265_${PV}/source&quot;<br>
+SRCREV =3D &quot;e9b88125dc21393b3fd8d68e98083bdfb89778a8&quot;<br>
+S =3D &quot;${UNPACKDIR}/x265-${PV}/source&quot;<br>
<br>
=C2=A0inherit lib_package cmake pkgconfig<br>
<br>
@@ -30,4 +30,3 @@ PACKAGECONFIG[10bit] =3D &quot;-DHIGH_BIT_DEPTH=3DON,-DHI=
GH_BIT_DEPTH=3DOFF&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${libdir}/libhdr10plus.so&quot;<br>
=C2=A0FILES:${PN}-dev =3D &quot;${includedir} ${libdir}/pkgconfig ${libdir}=
/libx265.so&quot;<br>
-<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130918): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130918" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130918</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121764990/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121764990/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000054f1e8065dee6935--

