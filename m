Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D553CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 15:54:10 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web10.1131.1759938840334344824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 08:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+ww34+U;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-635fde9cd06so59026d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759938839; x=1760543639; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpOr1xiSdPJiqbbDFNR113+njBoFmzGu/ggpXOCWSyI=;
        b=W+ww34+UzkjkqDb6g8k+vtsTf6mWJ8zKaGHjMQ/GS1CSnlKoVc5dzO6sF2CFer8Ask
         IQptl0SUK2DiXaC/JGCl9f5x/5aiRLVvB6mxFvyMHezGfRnFHuN06p5wzctLgU13bc8y
         wfG9nSsCGfUBTVF/LWYrtxmwvfVSKB7v6QfXg/vpBbiK1LLtGuYxIWvo0JGYTyEkyj7z
         NnpxF6hAIxyBfuLy5jcTiioGs4uthaihkqNs7OjNIRrVEdf6gMlUZFr7Kj1MT/wHTRVG
         yvuocVjJmDKkcZSg+y4BMdL99hvhWSweChEuk7kg0WqOC8pSrUFQmbCJl+R4EUX2N78+
         xTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938839; x=1760543639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpOr1xiSdPJiqbbDFNR113+njBoFmzGu/ggpXOCWSyI=;
        b=j6mhZh1RjCFZNnIJEXY2l+25KIpLOeklpiqvFtzkaH6qEWanKBzgkljQ14Gwg0kyuj
         8wZuTGGoyKXBtbDHrM2q74oYOnZUOrO/5Wwb1F6TgVhQSIM6OtwxYEU4TlM5FuknFcTu
         5eiGvtg8xn2APm6twbC5X4HUAsTVrHm7VldgoYRbxw1hw6mf8B+qWl3iHmgagOQxGTyg
         WwfeLtFmqzRSph+TAkD9rXNu8vr9tl6l3w5WJz3DWYXn/GrARZMdnJ1kjkD3hDMc4aLL
         631y9lqsy9NcF0AjF7jv+dykWb7h1T6+BssE+DtRvLWtEAt9Vo9KdyzSytiso+45CAhz
         DgEg==
X-Gm-Message-State: AOJu0YxU3oCHAyg1NTXIfHY/38nFpwuURhzfIqct2LA+Bgrw0WuKRoi3
	B4F/SVd+UfjLXRBnTpIqdvj/1TKyUoyOx8d3S7WEmqiAuKFFf7nTuVBwswKyGfrzGBR42hxwHnC
	jMeq6KLOSkvq/hrcuVjZUcFtwf5NkqN8=
X-Gm-Gg: ASbGncvkoiaGvMnTPPkC3GoQ/KRXc9w6vymFkSELZhlVVxl9mNZRchFrvg0BjioTh88
	NyPhcbDEN9bMgiHBc0SytPQBg1CnnF7M1HOXwDcoqHrjLkpQQ03KO+NyWNi8fZOCa2xYZGGoYI1
	N1eFtGhVyK6MbMndcVASH/16ooOOmY6T4XNTbu9UV3YCQRPEBiwhQUmatXc6mZ/4dEj3sT9BDqT
	mTrvK3gILEyQq3mmc8CYbi+9DUWX7Nag171PR5pbdClJVFltuDCA+ry9wLd80BxdYKW5Ehi7fkD
	pUvHQzosJ1r8jyTgbC6Cd/NOhYrZGn4+z/xta9T0/9ORlLOTTKaZNGAzrar1aFLfeVx69L8jzX7
	Nd4w/mg==
X-Google-Smtp-Source: AGHT+IFp0uNnbbLNBJ7QReYbcb96h3FoKPPSNuy4K6Lak5b/UK86qpMG43brhlof+sjzI969l25BpPoaB6OA/60/ES0=
X-Received: by 2002:a53:ec0f:0:b0:636:a6de:9c50 with SMTP id
 956f58d0204a3-63ccb8eeb70mr2836734d50.43.1759938839211; Wed, 08 Oct 2025
 08:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251007174858.87288-1-skandigraun@gmail.com>
In-Reply-To: <20251007174858.87288-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Oct 2025 08:53:32 -0700
X-Gm-Features: AS18NWATe_gFCPFKDWiCx9RCcPGW3bn_mzjNfCtq4E8HS2d0AYNhTTo7GujmAeQ
Message-ID: <CAMKF1sp1koMAGbD4fthXFfvKRBu04-cppJhw8-kOQ9-WZbWxGg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libiec61850: upgrade 1.5.3 -> 1.6.1
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 15:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120371

seeing failures on qemux86

https://errors.yoctoproject.org/Errors/Details/884900/

qemuarm

https://errors.yoctoproject.org/Errors/Details/884889/

I think it is related to target being 32bit.

On Tue, Oct 7, 2025 at 10:49=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-202=
4-45971
>
> Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHANGEL=
OG
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 -------------------
>  ...iec61850_1.5.3.bb =3D> libiec61850_1.6.1.bb} | 10 ++---
>  3 files changed, 20 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/libiec61850/file=
s/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5=
.3.bb =3D> libiec61850_1.6.1.bb} (77%)
>
> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-=
pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networkin=
g/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_=
LIBDIR-from-GNUInstallD.patch
> index e778e8158b..a33a6248a7 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61=
850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61=
850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> @@ -7,7 +7,7 @@ Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR fro=
m GNUInstallDirs in
>  This ensures that it gets installed in platform specified system libdir
>  all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib64
>
> -Upstream-Status: Submitted [https://github.com/mz-automation/libiec61850=
/pull/376]
> +Upstream-Status: Denied [https://github.com/mz-automation/libiec61850/pu=
ll/376 - closed without a word]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   pyiec61850/CMakeLists.txt | 6 ++++--
> @@ -15,15 +15,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  --- a/pyiec61850/CMakeLists.txt
>  +++ b/pyiec61850/CMakeLists.txt
> -@@ -31,7 +31,9 @@ endif()
> +@@ -31,14 +31,9 @@ swig_add_library(pyiec61850
>
> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
> + swig_link_libraries(pyiec61850 ${LIBS})
>
> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/=
lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> --install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_V=
ERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> +-# Finding python modules install path
> +-execute_process(
> +-      COMMAND ${Python_EXECUTABLE} -c
> +-      "from sysconfig import get_path; import sys; sys.stdout.write(get=
_path('platlib'))"
> +-      OUTPUT_VARIABLE PYTHON_SITE_DIR
> +-)
>  +include(GNUInstallDirs)
> -+
> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${CMA=
KE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}.${=
PYTHON_VERSION_MINOR}/site-packages)
> -+install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/$=
{CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINO=
R}/site-packages)
>
> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}=
/test_pyiec61850.py)
> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${P=
YTHON_SITE_DIR})
> +-install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
> ++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${C=
MAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/si=
te-packages)
> ++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/=
${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
> +
> + add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}=
/test_pyiec61850.py)
> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-=
pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networkin=
g/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_=
INSTALL_PATH-by-trying-.patch
> deleted file mode 100644
> index 3f0490cb80..0000000000
> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61=
850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Fri, 10 Jul 2020 17:08:34 +0200
> -Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to=
 find
> - python modules install path (site-packages)
> -
> -https://stackoverflow.com/questions/1242904/finding-python-site-packages=
-directory-with-cmake
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> -Upstream-Status: Pending
> -
> - pyiec61850/CMakeLists.txt | 11 ++---------
> - 1 file changed, 2 insertions(+), 9 deletions(-)
> -
> -diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
> -index 159ef4b..d1732a1 100644
> ---- a/pyiec61850/CMakeLists.txt
> -+++ b/pyiec61850/CMakeLists.txt
> -@@ -31,14 +31,7 @@ endif()
> -
> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
> -
> --# Finding python modules install path
> --execute_process(
> --      COMMAND ${PYTHON_EXECUTABLE} -c
> --      "from distutils.sysconfig import get_python_lib; import sys; sys.=
stdout.write(get_python_lib())"
> --      OUTPUT_VARIABLE PYTHON_SITE_DIR
> --)
> --
> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${PYT=
HON_SITE_DIR})
> --install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/=
lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> -+install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_V=
ERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> -
> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}=
/test_pyiec61850.py)
> ---
> -2.31.1
> -
> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.=
6.1.bb
> similarity index 77%
> rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_=
1.5.3.bb
> rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.=
6.1.bb
> index cfded66e41..eb9ab9b4fe 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.=
bb
> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.=
bb
> @@ -13,10 +13,9 @@ SECTION =3D "console/network"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>  DEPENDS =3D "swig-native python3"
> -SRCREV =3D "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
> +SRCREV =3D "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
>
> -SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.5;pro=
tocol=3Dhttps \
> -           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-tryi=
ng-.patch \
> +SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.6;pro=
tocol=3Dhttps;tag=3Dv${PV} \
>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInsta=
llD.patch \
>  "
>
> @@ -26,12 +25,13 @@ inherit cmake pkgconfig python3-dir python3native sit=
einfo
>  EXTRA_OECMAKE =3D " \
>      -DBUILD_EXAMPLES=3DOFF \
>      -DBUILD_PYTHON_BINDINGS=3DON \
> +    -DPYTHON_BASEVERSION=3D${PYTHON_BASEVERSION} \
>  "
>
>  RDEPENDS:${PN}-python =3D " python3-core "
>  RDEPENDS:${PN} =3D " python3-core "
>
>  FILES:${PN} +=3D " \
> -    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
> -    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
> +    ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
> +    ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
>  "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120342): https://lists.openembedded.org/g/openembedde=
d-devel/message/120342
> Mute This Topic: https://lists.openembedded.org/mt/115640790/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

