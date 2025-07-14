Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D9C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:56:54 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.84745.1752515812884881290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z1QpQf7M;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7dc89108bfso3950128276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515812; x=1753120612; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GSzjsluvCZgN4wAc9Lh6uhHPuAWNZVmRCq0U6biQmY=;
        b=Z1QpQf7MCEHdARyOoA1ZDTO6lreRprdazdJgsZOgYlYOXXsblaWMn0iXG7Yho8raiC
         gwGLNEUSlX4ZELEkZ1xcMD9fo1eXiSB/fwEKHSCaAjn22kyVjvlXzx65JdnKsUVBex3t
         x5NYnnGQpNQghStWaZ9rRh9iCD+mNM823UwAlVdaGgPYOIEr0Fn7KmEKOcDWXdGk+DLP
         bK8Fu0HudNG4A2xlRJ5TNdYGDfMxxY/P+x37iCwRTfJyvSWyv7pOamrAiKk2r4LQt3uJ
         OlsLpRKlAHMWqPsyJPd+eW5pTd7O2QufYY0YCs3IdvUTk02qCVgIaFQwwq8fSRDFwoXO
         E+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515812; x=1753120612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GSzjsluvCZgN4wAc9Lh6uhHPuAWNZVmRCq0U6biQmY=;
        b=Qv8LBvaSEp37ojphrdHjR7v9LB+mw6obaIYT/10kDHOvkyr8dtPm6OsQo/5j6uQNlo
         Wd0pmm9IbNpvqrM7xNk+tXYeBAUBq//YvYdIeKgSZL8Z4N1HZWHvQ8dbXpDoLsicGXeJ
         3vqgPOFyg/Mbv3B2mg/uGyT3LCQ2UHCVbe+4C9RADG/7NaWPQ1yToI9w3saQMG9SNgby
         POowzvw0d5/ayoZ9i+kplEQeDfbvSXe4aTepgDeCMVEnThZAFVVV5Qumv95n7kCERgl1
         +gke3dFpx8gy72My5NlpeELKZlTRGMXoAAvj3/DdeuVpZshaP/ox9w0q7nbKIVZ+BMNz
         bGwA==
X-Gm-Message-State: AOJu0YzTa12qaUNxXgBBZocCHJGCMLA80nIcFQAXqMRZYMVeJJATjDAH
	vPIHqTGg7+c/iao7gC2EpycULv77r1Pru4oNqjjP5NeXO4CPbM1Mwp49Yfp/SUw9NMH3Z9pDZqs
	igmpOkCOJ2LznFOBm+9zjitGflcGrjcChnV2g
X-Gm-Gg: ASbGncsQwgd5Hra8C929JfN/eGwEpvk41eOA0NQ94Z2RMG6iPbqkgoQsAYrfbq+fWk+
	WU5lVRkd4G3royV6AH0Umicf5Pa//WG6jDsWpLvSNMr/pdaG6MwJ47ykwcgCwF5ma5WiAEkwgKs
	ShEiwyW6c3vUk4x/+H8vOjSvrzfsBINVAERF31K/l1AM1Bg9VgjBAULbGDXFDRL4T9dU2MSU6Xb
	BdrRv8Iu85b5v+bT12YZIBeEYWerMaUX9rW
X-Google-Smtp-Source: AGHT+IGKz7WEEAWVlvStxux4072M5agNHrS5P0voptyqitjySiPbYVLMo1s4di+yPFiRhaV9StiWP1HsHzVFRvoooMk=
X-Received: by 2002:a05:690c:6ac2:b0:70e:73ce:80de with SMTP id
 00721157ae682-717daeb302dmr174456017b3.25.1752515811751; Mon, 14 Jul 2025
 10:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jul 2025 10:56:25 -0700
X-Gm-Features: Ac12FXwKEpzIiABdg48pVl9S_KMr2lHMMOTYW4dQgWs0vJAieeQ_79NLBA1h-ak
Message-ID: <CAMKF1spxFM0-inrTcpdmCNTvnNueFMw=k3_RB1q2+FYy+Tv73Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 01/10] leveldb: Disable ptests to allow to
 build with CMake 4+
To: Moritz.Haase@bmw.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 17:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118544

On Mon, Jul 14, 2025 at 4:27=E2=80=AFAM Moritz Haase via
lists.openembedded.org <Moritz.Haase=3Dbmw.de@lists.openembedded.org>
wrote:
>
> The component itself builds just fine with CMake 4, but the tests don't a=
s they
> rely on a bundled version of GTest that is six years old. Since upstream =
is
> inactive, the simplest course of action is to not build the tests and dis=
able
> ptest support.

is it possible to try using system gtest ?

>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  ...s.txt-fix-googletest-related-options.patch | 55 -------------------
>  meta-oe/recipes-dbs/leveldb/leveldb/run-ptest | 10 ----
>  meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb   | 10 +---
>  3 files changed, 2 insertions(+), 73 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.t=
xt-fix-googletest-related-options.patch
>  delete mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
>
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-=
googletest-related-options.patch b/meta-oe/recipes-dbs/leveldb/leveldb/0001=
-CMakeLists.txt-fix-googletest-related-options.patch
> deleted file mode 100644
> index b0bfb8bf16..0000000000
> --- a/meta-oe/recipes-dbs/leveldb/leveldb/0001-CMakeLists.txt-fix-googlet=
est-related-options.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 77da477840f89da7ced29da315de77571e8f190e Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Fri, 20 Oct 2023 22:57:48 +0200
> -Subject: [PATCH] CMakeLists.txt: fix googletest related options
> -
> -* https://cmake.org/cmake/help/book/mastering-cmake/chapter/Writing%20CM=
akeLists%20Files.html
> -  says that CMake options are case-sensitive and I don't see lower-case =
version in
> -  currently used googletest submodules and gtest is indeed installed wit=
h leveldb
> -
> -* install_gmock option I don't see at all, so I've kept it as is, INSTAL=
L_GTEST, BUILD_GMOCK
> -  do exist as upper-case
> -
> -$ grep -Ri install_.*mock .
> -./CMakeLists.txt:  set(install_gmock OFF)
> -./third_party/googletest/googlemock/CMakeLists.txt:install_project(gmock=
 gmock_main)
> -$ grep -Ri build_gmock .
> -./CMakeLists.txt:  set(BUILD_GMOCK ON)
> -./third_party/googletest/googletest/README.md:cmake .. -DBUILD_GMOCK=3DO=
FF
> -./third_party/googletest/CMakeLists.txt:option(BUILD_GMOCK "Builds the g=
ooglemock subproject" ON)
> -./third_party/googletest/CMakeLists.txt:if(BUILD_GMOCK)
> -$ grep -Ri install_gtest .
> -./CMakeLists.txt:  set(INSTALL_GTEST OFF)
> -./third_party/googletest/googletest/cmake/internal_utils.cmake:  if(INST=
ALL_GTEST)
> -./third_party/googletest/googletest/CMakeLists.txt:if (INSTALL_GTEST)
> -./third_party/googletest/CMakeLists.txt:option(INSTALL_GTEST "Enable ins=
tallation of googletest. (Projects embedding googletest may want to turn th=
is OFF.)" ON)
> -
> -* also use CACHE and FORCE as sugested in:
> -  https://cmake.org/cmake/help/latest/command/set.html
> -  https://stackoverflow.com/questions/20239334/cmake-set-subdirectory-op=
tions
> -  for the value to correctly propagate into third_party/googletest subdi=
rectory
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ----
> -Upstream-Status: Submitted [https://github.com/google/leveldb/pull/1152]
> -
> - CMakeLists.txt | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index fda9e01..f8a2629 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -295,9 +295,9 @@ if(LEVELDB_BUILD_TESTS)
> -
> -   # Prevent overriding the parent project's compiler/linker settings on=
 Windows.
> -   set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
> --  set(install_gtest OFF)
> --  set(install_gmock OFF)
> --  set(build_gmock ON)
> -+  set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)
> -+  set(install_gmock OFF CACHE BOOL "" FORCE)
> -+  set(BUILD_GMOCK ON CACHE BOOL "" FORCE)
> -
> -   # This project is tested using GoogleTest.
> -   add_subdirectory("third_party/googletest")
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest b/meta-oe/reci=
pes-dbs/leveldb/leveldb/run-ptest
> deleted file mode 100644
> index 9ae70c1284..0000000000
> --- a/meta-oe/recipes-dbs/leveldb/leveldb/run-ptest
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#!/bin/sh
> -
> -for test in *_test; do
> -    if ./${test}; then
> -        echo "PASS: ${test}"
> -    else
> -        echo "FAIL: ${test}"
> -    fi
> -done
> -
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb b/meta-oe/recipe=
s-dbs/leveldb/leveldb_1.23.bb
> index 9cefc528ae..0ee0c8c075 100644
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb
> @@ -5,30 +5,24 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92d1b128950b11ba8495b64938fc1=
64d"
>
>  SRC_URI =3D "gitsm://github.com/google/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps \
> -    file://0001-CMakeLists.txt-fix-googletest-related-options.patch \
>      file://0001-Fix-printing-64-bit-integer-types.patch \
> -    file://run-ptest \
>  "
>
>  SRCREV =3D "068d5ee1a3ac40dabd00d211d5013af44be55bea"
>
> -inherit cmake ptest
> +inherit cmake
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[benchmarks] =3D "-DLEVELDB_BUILD_BENCHMARKS=3DON,-DLEVELDB=
_BUILD_BENCHMARKS=3DOFF,sqlite"
>  PACKAGECONFIG[snappy] =3D ",,snappy"
>  PACKAGECONFIG[tcmalloc] =3D ",,gperftools"
>
>  EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo -DBUILD_SHARED_LI=
BS=3DON -DCMAKE_SKIP_RPATH=3DON \
> -                 -DLEVELDB_BUILD_TESTS=3D${@bb.utils.contains('DISTRO_FE=
ATURES', 'ptest', 'ON', 'OFF', d)}"
> +                 -DLEVELDB_BUILD_TESTS=3DOFF"
>
>  do_install:append() {
>      install -D -m 0755 ${B}/leveldbutil ${D}${bindir}/leveldbutil
>  }
>
> -do_install_ptest() {
> -    install -m 0755 ${B}/*_test ${D}${PTEST_PATH}
> -}
> -
>  # Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb=
.
>  #
>  COMPATIBLE_HOST:mipsarcho32:pn-lib32-leveldb =3D "null"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118519): https://lists.openembedded.org/g/openembedde=
d-devel/message/118519
> Mute This Topic: https://lists.openembedded.org/mt/114145341/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

