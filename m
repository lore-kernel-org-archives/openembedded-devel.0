Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03243CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:25:39 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.274.1759951536309463642
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SACZ+Ff5;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-635349b6fe6so239781d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759951535; x=1760556335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqlOlXPjlOs56uCzuEeqDXlBOEV9QnBEvP/fdGnnnSw=;
        b=SACZ+Ff5ksSxpVJCHC5pjre78WRwxlSynQJ0Tb8YmFuA9oT9sPVX9ENRpdOCBMyDfU
         yH0DDaiDaR3yrqobW/YuUFdmzOgAsVBjM3VMpt8yhgVw9uV1NkMMaLxYNZB3QpQN9WTy
         jtWCMgJFixCHz4poQyx8b1ANHlmmJAVbo6GCXN+yYZ8g5nPZVFYp2e6mLJuJUdnw/3DE
         hKB3Wp6vA4pVTmhKWPVJAIirOaMdo5kKjVrPWeqtUqUMf98JxhGABArolNphiFBFJ41Z
         K6uBfckGa+7RI2I1zbnxU5eGiDuEo8/SU43sdJN7vm8fyPcKixB8xJlSmE9C/H0LAVYS
         InLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759951535; x=1760556335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqlOlXPjlOs56uCzuEeqDXlBOEV9QnBEvP/fdGnnnSw=;
        b=iu8gHxzf2f8HsnvXdnZlZ6TxkyrQSLqXj8w3yeSfUxA1qJGEiWF/DKsaHjEmMZbxLn
         mWLNYN0I4oVKvOil1pRTHZAOAXhNc5T5SYhpNe8f30rY3xbrNb9q5pQZzw3FM7tRZROu
         IoeKeoxqoauBYxi0TZmnl0Qob7ALgo+GOqDPCgSCHBr9ssbNVVAac9e9fAHlHv7OErZJ
         sEH5OuCjq8O7PIN4CyYR2uEoGbDLL3d8SbAAyQVCPgi76jQWVL+NlxZtQu7/uO2N3SOh
         LTobKMxdZ5HdmEEswhpO4WDZRcR0/Pm1XTy6ULr5EStFmtJ5T5avDenvWh4TERiPSTNi
         D1jQ==
X-Gm-Message-State: AOJu0Yzb+4G304XFDH1ZDJVugJ5OJcca5DSTv8IJb0PWH2WnOOveUitx
	BKsigHGgFyRyeMfcX1/oIwcHqxuz8Dgs8JwJOgPJLxOEVBfc1Z3Kg/nZc/jqDBJw7FNkZZoK/Hj
	0tGPWhLhUkZo7Ud5KXW8RSs2ScfWnXIhGSBacmpY=
X-Gm-Gg: ASbGnctPH6ikCvpt0jmJPkqxLlthURm0UR2GLXwyanG0CwNhIKsUyVFwhZsvqavs3e6
	ll3NkCVP5buLdVZdCoDwmHPutS3+7/x5wKreWR+VttlZHQmsCygbousgzRNaaP813qRf+HYoIVW
	dO9KDckyqLAE6WK9gVyAe8rttNMrlh19PoLvMI0M2lWDzXoULawhXl0XIxCXMQIUEivJYaVCMZF
	Bw5KXFnR/ztHPjl2J0FCMj3zwAC+hZqxBlDHtmxm5cJeIZSwzw1FfU3fmc8yIPARJXRMXQ82Sfk
	2I0eRwskxKKQfj9b1/Iaa0v9QZ8ZYQjI0t0skB88bof6LaaNt9rD11Asjpey1EPDkiR/z8tsn4g
	GNJ6DnooyCBg3MIvUQdVLWidvF7A=
X-Google-Smtp-Source: AGHT+IHpZuQcVB0vbrIi1UZpXNqMvYgcAQDhjJ1iPLZMSNCfewOdfzTCGm5JuHi+8agFMuPWhPNjhLduLkXZg5VZqYM=
X-Received: by 2002:a53:da04:0:b0:63a:f5:84f2 with SMTP id 956f58d0204a3-63ccb8920f6mr3367402d50.16.1759951535108;
 Wed, 08 Oct 2025 12:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251007174858.87288-1-skandigraun@gmail.com> <CAMKF1sp1koMAGbD4fthXFfvKRBu04-cppJhw8-kOQ9-WZbWxGg@mail.gmail.com>
 <f2c615a4-2559-42f4-8e79-883629e65a9e@gmail.com>
In-Reply-To: <f2c615a4-2559-42f4-8e79-883629e65a9e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Oct 2025 12:25:08 -0700
X-Gm-Features: AS18NWClgLSDCJlEkq_mCBxeNcc0zN9QfDZATBGAf2pbYQkO0b-DnP8kxcdfVaM
Message-ID: <CAMKF1sr2a7p9Sj0g3-qeXks+XW4yPFAcsCPFAH1+gkM4r743YA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libiec61850: upgrade 1.5.3 -> 1.6.1
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 19:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120380

On Wed, Oct 8, 2025 at 11:48=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 10/8/25 17:53, Khem Raj wrote:
> > seeing failures on qemux86
> >
> > https://errors.yoctoproject.org/Errors/Details/884900/
> >
> > qemuarm
> >
> > https://errors.yoctoproject.org/Errors/Details/884889/
> >
> > I think it is related to target being 32bit.
>
> Right, the cmake's findPython returns python from
> ${RECIPE_SYSROOT_NATIVE} instead of ${RECIPE_SYSROOT}... will look if I
> can solve it more elegantly than just patching the include path to the
> correct one.


adding

inherit python3targetconfig

might be all you need here.

>
> >
> > On Tue, Oct 7, 2025 at 10:49=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-=
2024-45971
> >>
> >> Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHAN=
GELOG
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
> >>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 ------------------=
-
> >>  ...iec61850_1.5.3.bb =3D> libiec61850_1.6.1.bb} | 10 ++---
> >>  3 files changed, 20 insertions(+), 53 deletions(-)
> >>  delete mode 100644 meta-networking/recipes-connectivity/libiec61850/f=
iles/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> >>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_=
1.5.3.bb =3D> libiec61850_1.6.1.bb} (77%)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/00=
01-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networ=
king/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTA=
LL_LIBDIR-from-GNUInstallD.patch
> >> index e778e8158b..a33a6248a7 100644
> >> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyie=
c61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> >> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyie=
c61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
> >> @@ -7,7 +7,7 @@ Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR =
from GNUInstallDirs in
> >>  This ensures that it gets installed in platform specified system libd=
ir
> >>  all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib=
64
> >>
> >> -Upstream-Status: Submitted [https://github.com/mz-automation/libiec61=
850/pull/376]
> >> +Upstream-Status: Denied [https://github.com/mz-automation/libiec61850=
/pull/376 - closed without a word]
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>  ---
> >>   pyiec61850/CMakeLists.txt | 6 ++++--
> >> @@ -15,15 +15,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>
> >>  --- a/pyiec61850/CMakeLists.txt
> >>  +++ b/pyiec61850/CMakeLists.txt
> >> -@@ -31,7 +31,9 @@ endif()
> >> +@@ -31,14 +31,9 @@ swig_add_library(pyiec61850
> >>
> >> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
> >> + swig_link_libraries(pyiec61850 ${LIBS})
> >>
> >> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /u=
sr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> >> --install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHO=
N_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> >> +-# Finding python modules install path
> >> +-execute_process(
> >> +-      COMMAND ${Python_EXECUTABLE} -c
> >> +-      "from sysconfig import get_path; import sys; sys.stdout.write(=
get_path('platlib'))"
> >> +-      OUTPUT_VARIABLE PYTHON_SITE_DIR
> >> +-)
> >>  +include(GNUInstallDirs)
> >> -+
> >> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${=
CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}=
.${PYTHON_VERSION_MINOR}/site-packages)
> >> -+install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX=
}/${CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_M=
INOR}/site-packages)
> >>
> >> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_D=
IR}/test_pyiec61850.py)
> >> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION =
${PYTHON_SITE_DIR})
> >> +-install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
> >> ++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION =
${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}=
/site-packages)
> >> ++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFI=
X}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
> >> +
> >> + add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_D=
IR}/test_pyiec61850.py)
> >> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/00=
01-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networ=
king/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMA=
KE_INSTALL_PATH-by-trying-.patch
> >> deleted file mode 100644
> >> index 3f0490cb80..0000000000
> >> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyie=
c61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
> >> +++ /dev/null
> >> @@ -1,39 +0,0 @@
> >> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 200=
1
> >> -From: Romain Naour <romain.naour@smile.fr>
> >> -Date: Fri, 10 Jul 2020 17:08:34 +0200
> >> -Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying=
 to find
> >> - python modules install path (site-packages)
> >> -
> >> -https://stackoverflow.com/questions/1242904/finding-python-site-packa=
ges-directory-with-cmake
> >> -
> >> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> >> ----
> >> -Upstream-Status: Pending
> >> -
> >> - pyiec61850/CMakeLists.txt | 11 ++---------
> >> - 1 file changed, 2 insertions(+), 9 deletions(-)
> >> -
> >> -diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
> >> -index 159ef4b..d1732a1 100644
> >> ---- a/pyiec61850/CMakeLists.txt
> >> -+++ b/pyiec61850/CMakeLists.txt
> >> -@@ -31,14 +31,7 @@ endif()
> >> -
> >> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
> >> -
> >> --# Finding python modules install path
> >> --execute_process(
> >> --      COMMAND ${PYTHON_EXECUTABLE} -c
> >> --      "from distutils.sysconfig import get_python_lib; import sys; s=
ys.stdout.write(get_python_lib())"
> >> --      OUTPUT_VARIABLE PYTHON_SITE_DIR
> >> --)
> >> --
> >> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${=
PYTHON_SITE_DIR})
> >> --install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
> >> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /u=
sr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> >> -+install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHO=
N_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
> >> -
> >> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_D=
IR}/test_pyiec61850.py)
> >> ---
> >> -2.31.1
> >> -
> >> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61=
850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.6.1.bb
> >> similarity index 77%
> >> rename from meta-networking/recipes-connectivity/libiec61850/libiec618=
50_1.5.3.bb
> >> rename to meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.6.1.bb
> >> index cfded66e41..eb9ab9b4fe 100644
> >> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5=
.3.bb
> >> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6=
.1.bb
> >> @@ -13,10 +13,9 @@ SECTION =3D "console/network"
> >>  LICENSE =3D "GPL-3.0-only"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47=
fae504"
> >>  DEPENDS =3D "swig-native python3"
> >> -SRCREV =3D "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
> >> +SRCREV =3D "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
> >>
> >> -SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.5;=
protocol=3Dhttps \
> >> -           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-t=
rying-.patch \
> >> +SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.6;=
protocol=3Dhttps;tag=3Dv${PV} \
> >>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUIn=
stallD.patch \
> >>  "
> >>
> >> @@ -26,12 +25,13 @@ inherit cmake pkgconfig python3-dir python3native =
siteinfo
> >>  EXTRA_OECMAKE =3D " \
> >>      -DBUILD_EXAMPLES=3DOFF \
> >>      -DBUILD_PYTHON_BINDINGS=3DON \
> >> +    -DPYTHON_BASEVERSION=3D${PYTHON_BASEVERSION} \
> >>  "
> >>
> >>  RDEPENDS:${PN}-python =3D " python3-core "
> >>  RDEPENDS:${PN} =3D " python3-core "
> >>
> >>  FILES:${PN} +=3D " \
> >> -    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
> >> -    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
> >> +    ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
> >> +    ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
> >>  "
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#120342): https://lists.openembedded.org/g/openembe=
dded-devel/message/120342
> >> Mute This Topic: https://lists.openembedded.org/mt/115640790/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

