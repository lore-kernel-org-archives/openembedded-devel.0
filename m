Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1541AF433CD
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 22:07:42 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6953.1776290854970646735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 15:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J43GibOZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651b6a003f6so2745003d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 15:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776290854; cv=none;
        d=google.com; s=arc-20240605;
        b=FgRMngGBCTsCwxSCUPQ0rJddfEJnv7+NjdQ7dRqR8NDSh0j/PSD48vtANGbM+3zSVW
         hjvoyu7voUgr4H6NDBY7X3QISFw9yX0sOnduFSI6DegMz7buCyi1qnw08v67hnsXaEo3
         ZbUpFZK9rizyQkYA4XiHZTQuc2vGkUHajxD51bmVloGos30lwzwQlkI7aC7UXYyvTUCk
         DfHv1Nbi03FUoSfE9DP0WJswTmmCWwomr5sL+fkeztYCC8HTauDMYybsPiokfu84Idte
         SySMOKURr11+8J1FXF/IRhyDM0yUl8ssI5iOG+Jha+bc6ZTGq56Mistk24KZVM0lfkBO
         qLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gJaTJyOKs8wiI2YVfzNy1yttTQ82uKNEwiH1VqNiHaM=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=AknB346a05qhCdIELYR864jcc86FzhtrjOqvmPKr3OMVXlpIhSkTN+JSHd2djCClyn
         tvR0csOD6qHNGxB8xsofFJML8cUSyLd2R+DJWVR288kzSz3p/PtxyfIBVhOa1NzTOjxq
         ULOYfcuoZIqPIQ0+coLFt5WYwkvH+DnfVkFq6no+45GTS2VMD1krb652sAmfGbI+d96p
         3NRb/jlVkMt3k4S88FxFuxB/vBpgYeYEEFp+Gj9I3sX9ytoFSoD+mJnZvyN9gCfqItzv
         hvS/XchTDryRrg5vBarGrBbBc6fDI5fH1qBDMdPiAY+I7v5SQXBwXcWFFZVA0rvTKomp
         Ay9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776290854; x=1776895654; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gJaTJyOKs8wiI2YVfzNy1yttTQ82uKNEwiH1VqNiHaM=;
        b=J43GibOZIJcLsnMJpXhkdhwgCNM6SyskbUec3nVSaSXV9TLcXl0bc0bpuenCD++NY2
         PS0d/vrNO98HU9Nb9BPZevHfeJD645EnXotyo/Y3TLGbixiAWtL3iWcrRVWM+nJRhJOz
         poi4Vljtu2H0CcRQHZFS9Dcx08Ok+0bdWLIgMCiJx0TY4arhG1TJk3WgRn4daHkN9Fqq
         I50EawSzU/dhaDGswfGOWaTuazeGdcjk3g3Pzb5pdUCXpHiR9vCwBrGPTzzj4un5yVJz
         2iufUpf+2rFglQaTAz7zR1V/sM0shMcu4ZevqYCOdHcFKG9YyKlwzV8urmCH7Gb1n4pO
         pZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776290854; x=1776895654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJaTJyOKs8wiI2YVfzNy1yttTQ82uKNEwiH1VqNiHaM=;
        b=E+FfYHImchpSJWd/+uYQAAZQCF4L4HyXVMNr6pLtTM82t2kTySDUh7KLQpDyEmk+S+
         3tzj4FTaNcbZuCLREAJRybZYZkyhB7dsjcInUnVTxZMMAI21aZqULhUX2EqG9LOgpIg6
         N+VRLYhaivhvHJS7fp9JDbUpFTbnkFJ3/4P33kvJex0OhFdi2E8F5whxVbEBcvKKcUrx
         u/urwTvxE+PuMZ3WNKzCAHkFnINy/03gtTBd15cqSbStjFcax5iU+DOZ9SlEZNG6TNR5
         4xT6A6MhQXhXjMDUcqd/yplTqY8vXlEU/8iQtPJA/vjcge4wytpAuIDmTaZpP73TiFoz
         8xzg==
X-Gm-Message-State: AOJu0YzJZ0Tdrj3phyReev43pXrNDo/wHYh57TU0C/noIXgcWDqgJwo+
	M6AJ0YSwjSYaWseM/HM/0smjUDoNZqRS6Zq/xAyrngb4jJZLjM/GcXlj782MwDu/rHAdAvd/LGA
	TYNCc0G8JEAQ4CjuqlqRGu6SB4cFevTE=
X-Gm-Gg: AeBDieuHuzdoAiotK+uZhwPachYqBjhnX+nsa44WgH6ViJmEynZq9GhRyOg97kqQsT6
	3GXeP1tj1txVoSirtw6hKLtkGu6rrtxM90RQhcHwa9Fwz0F7tDJliFkF4b6Uq6IMkcc0eoX8dTN
	uBEyKPWayUGC52LOZyc23WQBsRz1eMa1FqllXxm0q5VY4iiHBxFrMTWajMrMtu3A3oLjRwHHIn1
	zoM1Deea4ajnUu03LmhA0paF+SqnbD2qu1Bm7O4SIjMfetG9kQA0b7BhRYCOpqlcX8oZk9np83H
	1nHXSQrfdgjawRb6qdQG/uI+EEgTPt+eqS6xVzaw10jLkuvOfZtYEaAFaNtKDWVBsHLyyfl7XIK
	2G2WwWlNRkIrN1pVXMtYj3optc+3++OsdNeBAtjzFkB3d5/OOGyBrqTLHeeSbXvGbeiJE1XdF7q
	B6ephpHrHyBXQNiWY=
X-Received: by 2002:a05:690e:259a:b0:650:8958:5d62 with SMTP id
 956f58d0204a3-65198874695mr15686920d50.0.1776290853817; Wed, 15 Apr 2026
 15:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260415110857.28317-1-mail@michael-fitzmayer.de>
In-Reply-To: <20260415110857.28317-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 15:07:06 -0700
X-Gm-Features: AQROBzDfxbw1w4qYh3tDi30ftpjy9VJHdl7VyZn0MAhJ_-QzpAMl8iDI9imIOk0
Message-ID: <CAMKF1sqRqM_7By=0ntP2AWyfricTQMn34i-hZv-4xSfCvLHTxA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c12f9064f86f130"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126373

--0000000000005c12f9064f86f130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing a patch fuzz. Did you do a build test ?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1470/ste=
ps/15/logs/errors

On Wed, Apr 15, 2026 at 4:09=E2=80=AFAM Michael Fitzmayer via lists.openemb=
edded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

> - Introduced a new API function: print_result()
> - Added support for configuring a dynamic number of filters when executin=
g
> replay.lua
> - Added script to interact with the STM32 CAN bootloader (stm32.lua)
> - Add Unified Diagnostic Services (ISO 14229-1) script written in Lua
> (uds.lua)
> - Various updates and fixes required by the Debian package and to be able
> to get certified by Microsoft
> - Added manpages
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  ...-C-include-path-for-pocketpy-headers.patch | 135 ++++++++++++++++++
>  ...e-search-paths-in-Findpocketpy.cmake.patch |  57 ++++++++
>  ...anopenterm_2.01.bb =3D> canopenterm_2.02.bb} |   9 +-
>  3 files changed, 198 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-path-=
for-pocketpy-headers.patch
>  create mode 100644
> meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-paths=
-in-Findpocketpy.cmake.patch
>  rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.01.bb =3D>
> canopenterm_2.02.bb} (76%)
>
> diff --git
> a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-pat=
h-for-pocketpy-headers.patch
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-pat=
h-for-pocketpy-headers.patch
> new file mode 100644
> index 0000000000..b76ba44166
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-pat=
h-for-pocketpy-headers.patch
> @@ -0,0 +1,135 @@
> +From 9a7a39e6cb1e5683d6354c33e74894b58829cc12 Mon Sep 17 00:00:00 2001
> +From: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +Date: Wed, 15 Apr 2026 11:57:58 +0200
> +Subject: [PATCH] Fix C include path for pocketpy headers
> +Upstream-Status: Submitted [
> https://github.com/CANopenTerm/CANopenTerm/commit/cbe8d8e6d5787636a32862b=
20f7c7cf342bb764b
> ]
> +
> +Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +---
> + src/api/python_can.c         | 2 +-
> + src/api/python_dbc.c         | 2 +-
> + src/api/python_misc.c        | 2 +-
> + src/api/python_nmt.c         | 2 +-
> + src/api/python_pdo.c         | 2 +-
> + src/api/python_sdo.c         | 2 +-
> + src/api/python_test_report.c | 2 +-
> + src/api/python_widget.c      | 2 +-
> + src/core/scripts.c           | 2 +-
> + 9 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/api/python_can.c b/src/api/python_can.c
> +index d1c5c6a..c6ee023 100644
> +--- a/src/api/python_can.c
> ++++ b/src/api/python_can.c
> +@@ -11,7 +11,7 @@
> + #include "core.h"
> + #include "dict.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +
> +diff --git a/src/api/python_dbc.c b/src/api/python_dbc.c
> +index f688796..3f3e3d3 100644
> +--- a/src/api/python_dbc.c
> ++++ b/src/api/python_dbc.c
> +@@ -10,7 +10,7 @@
> + #include "core.h"
> + #include "dbc.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +
> +diff --git a/src/api/python_misc.c b/src/api/python_misc.c
> +index a71c39d..da14c01 100644
> +--- a/src/api/python_misc.c
> ++++ b/src/api/python_misc.c
> +@@ -10,7 +10,7 @@
> + #include "python_misc.h"
> + #include "core.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> + #include "scripts.h"
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +diff --git a/src/api/python_nmt.c b/src/api/python_nmt.c
> +index 293d2e1..8e467fe 100644
> +--- a/src/api/python_nmt.c
> ++++ b/src/api/python_nmt.c
> +@@ -11,7 +11,7 @@
> + #include "core.h"
> + #include "nmt.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +
> +diff --git a/src/api/python_pdo.c b/src/api/python_pdo.c
> +index fe34bc9..a307b0d 100644
> +--- a/src/api/python_pdo.c
> ++++ b/src/api/python_pdo.c
> +@@ -10,7 +10,7 @@
> + #include "core.h"
> + #include "os.h"
> + #include "pdo.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +
> +diff --git a/src/api/python_sdo.c b/src/api/python_sdo.c
> +index 3378fc2..2d7b583 100644
> +--- a/src/api/python_sdo.c
> ++++ b/src/api/python_sdo.c
> +@@ -10,7 +10,7 @@
> + #include "core.h"
> + #include "dict.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> + #include "sdo.h"
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +diff --git a/src/api/python_test_report.c b/src/api/python_test_report.c
> +index 59cc7b1..3ca7536 100644
> +--- a/src/api/python_test_report.c
> ++++ b/src/api/python_test_report.c
> +@@ -10,7 +10,7 @@
> + #include "core.h"
> + #include "eds.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> + #include "test_report.h"
> +
> + typedef bool (*py_CFunction)(int argc, py_Ref argv);
> +diff --git a/src/api/python_widget.c b/src/api/python_widget.c
> +index 92891c0..c176ca8 100644
> +--- a/src/api/python_widget.c
> ++++ b/src/api/python_widget.c
> +@@ -13,7 +13,7 @@
> + #include "core.h"
> + #include "led.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> + #include "tachometer.h"
> + #include "window.h"
> +
> +diff --git a/src/core/scripts.c b/src/core/scripts.c
> +index 4dbdac3..1f37b7c 100644
> +--- a/src/core/scripts.c
> ++++ b/src/core/scripts.c
> +@@ -14,7 +14,7 @@
> + #include "lua.h"
> + #include "lualib.h"
> + #include "os.h"
> +-#include "pocketpy.h"
> ++#include <pocketpy.h>
> + #include "table.h"
> +
> + extern const uint8 max_script_search_paths;
> diff --git
> a/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-pat=
hs-in-Findpocketpy.cmake.patch
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-pat=
hs-in-Findpocketpy.cmake.patch
> new file mode 100644
> index 0000000000..9d26a10e34
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-pat=
hs-in-Findpocketpy.cmake.patch
> @@ -0,0 +1,57 @@
> +From ba48c303e12d6b546fd852527b4b954e28f889f7 Mon Sep 17 00:00:00 2001
> +From: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +Date: Wed, 15 Apr 2026 12:31:17 +0200
> +Subject: [PATCH] Update search paths in Findpocketpy.cmake
> +Upstream-Status: Submitted [
> https://github.com/CANopenTerm/CANopenTerm/commit/7a9466029a6e88345e65e79=
4ff1779f778c9358a
> ]
> +
> +
> +Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +---
> + cmake/Findpocketpy.cmake | 30 ++++++++++++++++++++++++------
> + 1 file changed, 24 insertions(+), 6 deletions(-)
> +
> +diff --git a/cmake/Findpocketpy.cmake b/cmake/Findpocketpy.cmake
> +index 459160f..8083270 100644
> +--- a/cmake/Findpocketpy.cmake
> ++++ b/cmake/Findpocketpy.cmake
> +@@ -3,18 +3,36 @@ cmake_minimum_required(VERSION 3.16)
> + # Findpocketpy.cmake
> + # Locate pocketpy library and include directories
> +
> +-find_path(pocketpy_INCLUDE_DIR NAMES pocketpy/pocketpy.h PATHS
> /usr/include)
> +-find_library(pocketpy_LIBRARY NAMES libpocketpy.so PATHS /usr/lib)
> ++find_path(pocketpy_INCLUDE_DIR
> ++  NAMES pocketpy.h
> ++  PATH_SUFFIXES pocketpy
> ++  PATHS
> ++    /usr/include
> ++    /usr/local/include
> ++    /opt/local/include
> ++    /opt/homebrew/include
> ++)
> ++
> ++find_library(pocketpy_LIBRARY
> ++  NAMES pocketpy
> ++  PATHS
> ++    /usr/lib
> ++    /usr/local/lib
> ++    /opt/local/lib
> ++    /opt/homebrew/lib
> ++)
> +
> + message(STATUS "pocketpy_INCLUDE_DIR: ${pocketpy_INCLUDE_DIR}")
> + message(STATUS "pocketpy_LIBRARY: ${pocketpy_LIBRARY}")
> +
> +-if (pocketpy_INCLUDE_DIR AND pocketpy_LIBRARY)
> +-  set(pocketpy_FOUND TRUE)
> ++include(FindPackageHandleStandardArgs)
> ++find_package_handle_standard_args(pocketpy
> ++  REQUIRED_VARS pocketpy_LIBRARY pocketpy_INCLUDE_DIR
> ++)
> ++
> ++if (pocketpy_FOUND)
> +   set(pocketpy_INCLUDE_DIRS ${pocketpy_INCLUDE_DIR})
> +   set(pocketpy_LIBRARIES ${pocketpy_LIBRARY})
> +-else()
> +-  set(pocketpy_FOUND FALSE)
> + endif()
> +
> + mark_as_advanced(pocketpy_INCLUDE_DIR pocketpy_LIBRARY)
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
> b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> similarity index 76%
> rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
> rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> index f44312a6e4..a83d3bee69 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> @@ -15,13 +15,16 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
>
>  DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
>
> -SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> "
> -SRCREV  =3D "4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19"
> +SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> \
> +           file://0001-Fix-C-include-path-for-pocketpy-headers.patch \
> +           file://0002-Update-search-paths-in-Findpocketpy.cmake.patch \
> +           "
> +SRCREV  =3D "a6a9cd4fdbfaffea01b3eeeaf3c4830d4ee4b313"
>
>
>  inherit cmake ptest
>
> -EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
> +EXTRA_OECMAKE +=3D "-DUSE_SYSTEM_LIBS=3DON"
>
>  FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126354):
> https://lists.openembedded.org/g/openembedded-devel/message/126354
> Mute This Topic: https://lists.openembedded.org/mt/118838261/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005c12f9064f86f130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing a patch fuzz. Did you do a build test ?<div><br></d=
iv><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/81/builds/1470/steps/15/logs/errors">https://autobuilder.yoctoproject.org/=
valkyrie/#/builders/81/builds/1470/steps/15/logs/errors</a></div></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Apr 15, 2026 at 4:09=E2=80=AFAM Michael Fitzmayer via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;mai=
l=3D<a href=3D"mailto:michael-fitzmayer.de@lists.openembedded.org">michael-=
fitzmayer.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">- Introduced a new API function: print_r=
esult()<br>
- Added support for configuring a dynamic number of filters when executing =
replay.lua<br>
- Added script to interact with the STM32 CAN bootloader (stm32.lua)<br>
- Add Unified Diagnostic Services (ISO 14229-1) script written in Lua (uds.=
lua)<br>
- Various updates and fixes required by the Debian package and to be able t=
o get certified by Microsoft<br>
- Added manpages<br>
<br>
Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmay=
er.de" target=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
---<br>
=C2=A0...-C-include-path-for-pocketpy-headers.patch | 135 +++++++++++++++++=
+<br>
=C2=A0...e-search-paths-in-Findpocketpy.cmake.patch |=C2=A0 57 ++++++++<br>
=C2=A0...<a href=3D"http://anopenterm_2.01.bb" rel=3D"noreferrer" target=3D=
"_blank">anopenterm_2.01.bb</a> =3D&gt; <a href=3D"http://canopenterm_2.02.=
bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A03 files changed, 198 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0=
001-Fix-C-include-path-for-pocketpy-headers.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0=
002-Update-search-paths-in-Findpocketpy.cmake.patch<br>
=C2=A0rename meta-oe/recipes-extended/canopenterm/{<a href=3D"http://canope=
nterm_2.01.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.01.bb</a>=
 =3D&gt; <a href=3D"http://canopenterm_2.02.bb" rel=3D"noreferrer" target=
=3D"_blank">canopenterm_2.02.bb</a>} (76%)<br>
<br>
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-in=
clude-path-for-pocketpy-headers.patch b/meta-oe/recipes-extended/canopenter=
m/canopenterm/0001-Fix-C-include-path-for-pocketpy-headers.patch<br>
new file mode 100644<br>
index 0000000000..b76ba44166<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-p=
ath-for-pocketpy-headers.patch<br>
@@ -0,0 +1,135 @@<br>
+From 9a7a39e6cb1e5683d6354c33e74894b58829cc12 Mon Sep 17 00:00:00 2001<br>
+From: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmayer.de" t=
arget=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+Date: Wed, 15 Apr 2026 11:57:58 +0200<br>
+Subject: [PATCH] Fix C include path for pocketpy headers<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/CANopenTerm/CANo=
penTerm/commit/cbe8d8e6d5787636a32862b20f7c7cf342bb764b" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/CANopenTerm/CANopenTerm/commit/cbe8d8=
e6d5787636a32862b20f7c7cf342bb764b</a>]<br>
+<br>
+Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzma=
yer.de" target=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+---<br>
+ src/api/python_can.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/api/python_dbc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/api/python_misc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ src/api/python_nmt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/api/python_pdo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/api/python_sdo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/api/python_test_report.c | 2 +-<br>
+ src/api/python_widget.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ src/core/scripts.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ 9 files changed, 9 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/src/api/python_can.c b/src/api/python_can.c<br>
+index d1c5c6a..c6ee023 100644<br>
+--- a/src/api/python_can.c<br>
++++ b/src/api/python_can.c<br>
+@@ -11,7 +11,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;dict.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+ <br>
+diff --git a/src/api/python_dbc.c b/src/api/python_dbc.c<br>
+index f688796..3f3e3d3 100644<br>
+--- a/src/api/python_dbc.c<br>
++++ b/src/api/python_dbc.c<br>
+@@ -10,7 +10,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;dbc.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+ <br>
+diff --git a/src/api/python_misc.c b/src/api/python_misc.c<br>
+index a71c39d..da14c01 100644<br>
+--- a/src/api/python_misc.c<br>
++++ b/src/api/python_misc.c<br>
+@@ -10,7 +10,7 @@<br>
+ #include &quot;python_misc.h&quot;<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ #include &quot;scripts.h&quot;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+diff --git a/src/api/python_nmt.c b/src/api/python_nmt.c<br>
+index 293d2e1..8e467fe 100644<br>
+--- a/src/api/python_nmt.c<br>
++++ b/src/api/python_nmt.c<br>
+@@ -11,7 +11,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;nmt.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+ <br>
+diff --git a/src/api/python_pdo.c b/src/api/python_pdo.c<br>
+index fe34bc9..a307b0d 100644<br>
+--- a/src/api/python_pdo.c<br>
++++ b/src/api/python_pdo.c<br>
+@@ -10,7 +10,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+ #include &quot;pdo.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+ <br>
+diff --git a/src/api/python_sdo.c b/src/api/python_sdo.c<br>
+index 3378fc2..2d7b583 100644<br>
+--- a/src/api/python_sdo.c<br>
++++ b/src/api/python_sdo.c<br>
+@@ -10,7 +10,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;dict.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ #include &quot;sdo.h&quot;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+diff --git a/src/api/python_test_report.c b/src/api/python_test_report.c<b=
r>
+index 59cc7b1..3ca7536 100644<br>
+--- a/src/api/python_test_report.c<br>
++++ b/src/api/python_test_report.c<br>
+@@ -10,7 +10,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;eds.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ #include &quot;test_report.h&quot;<br>
+ <br>
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);<br>
+diff --git a/src/api/python_widget.c b/src/api/python_widget.c<br>
+index 92891c0..c176ca8 100644<br>
+--- a/src/api/python_widget.c<br>
++++ b/src/api/python_widget.c<br>
+@@ -13,7 +13,7 @@<br>
+ #include &quot;core.h&quot;<br>
+ #include &quot;led.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ #include &quot;tachometer.h&quot;<br>
+ #include &quot;window.h&quot;<br>
+ <br>
+diff --git a/src/core/scripts.c b/src/core/scripts.c<br>
+index 4dbdac3..1f37b7c 100644<br>
+--- a/src/core/scripts.c<br>
++++ b/src/core/scripts.c<br>
+@@ -14,7 +14,7 @@<br>
+ #include &quot;lua.h&quot;<br>
+ #include &quot;lualib.h&quot;<br>
+ #include &quot;os.h&quot;<br>
+-#include &quot;pocketpy.h&quot;<br>
++#include &lt;pocketpy.h&gt;<br>
+ #include &quot;table.h&quot;<br>
+ <br>
+ extern const uint8 max_script_search_paths;<br>
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-s=
earch-paths-in-Findpocketpy.cmake.patch b/meta-oe/recipes-extended/canopent=
erm/canopenterm/0002-Update-search-paths-in-Findpocketpy.cmake.patch<br>
new file mode 100644<br>
index 0000000000..9d26a10e34<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-p=
aths-in-Findpocketpy.cmake.patch<br>
@@ -0,0 +1,57 @@<br>
+From ba48c303e12d6b546fd852527b4b954e28f889f7 Mon Sep 17 00:00:00 2001<br>
+From: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmayer.de" t=
arget=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+Date: Wed, 15 Apr 2026 12:31:17 +0200<br>
+Subject: [PATCH] Update search paths in Findpocketpy.cmake<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/CANopenTerm/CANo=
penTerm/commit/7a9466029a6e88345e65e794ff1779f778c9358a" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/CANopenTerm/CANopenTerm/commit/7a9466=
029a6e88345e65e794ff1779f778c9358a</a>]<br>
+<br>
+<br>
+Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzma=
yer.de" target=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+---<br>
+ cmake/Findpocketpy.cmake | 30 ++++++++++++++++++++++++------<br>
+ 1 file changed, 24 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/cmake/Findpocketpy.cmake b/cmake/Findpocketpy.cmake<br>
+index 459160f..8083270 100644<br>
+--- a/cmake/Findpocketpy.cmake<br>
++++ b/cmake/Findpocketpy.cmake<br>
+@@ -3,18 +3,36 @@ cmake_minimum_required(VERSION 3.16)<br>
+ # Findpocketpy.cmake<br>
+ # Locate pocketpy library and include directories<br>
+ <br>
+-find_path(pocketpy_INCLUDE_DIR NAMES pocketpy/pocketpy.h PATHS /usr/inclu=
de)<br>
+-find_library(pocketpy_LIBRARY NAMES libpocketpy.so PATHS /usr/lib)<br>
++find_path(pocketpy_INCLUDE_DIR<br>
++=C2=A0 NAMES pocketpy.h<br>
++=C2=A0 PATH_SUFFIXES pocketpy<br>
++=C2=A0 PATHS<br>
++=C2=A0 =C2=A0 /usr/include<br>
++=C2=A0 =C2=A0 /usr/local/include<br>
++=C2=A0 =C2=A0 /opt/local/include<br>
++=C2=A0 =C2=A0 /opt/homebrew/include<br>
++)<br>
++<br>
++find_library(pocketpy_LIBRARY<br>
++=C2=A0 NAMES pocketpy<br>
++=C2=A0 PATHS<br>
++=C2=A0 =C2=A0 /usr/lib<br>
++=C2=A0 =C2=A0 /usr/local/lib<br>
++=C2=A0 =C2=A0 /opt/local/lib<br>
++=C2=A0 =C2=A0 /opt/homebrew/lib<br>
++)<br>
+ <br>
+ message(STATUS &quot;pocketpy_INCLUDE_DIR: ${pocketpy_INCLUDE_DIR}&quot;)=
<br>
+ message(STATUS &quot;pocketpy_LIBRARY: ${pocketpy_LIBRARY}&quot;)<br>
+ <br>
+-if (pocketpy_INCLUDE_DIR AND pocketpy_LIBRARY)<br>
+-=C2=A0 set(pocketpy_FOUND TRUE)<br>
++include(FindPackageHandleStandardArgs)<br>
++find_package_handle_standard_args(pocketpy<br>
++=C2=A0 REQUIRED_VARS pocketpy_LIBRARY pocketpy_INCLUDE_DIR<br>
++)<br>
++<br>
++if (pocketpy_FOUND)<br>
+=C2=A0 =C2=A0set(pocketpy_INCLUDE_DIRS ${pocketpy_INCLUDE_DIR})<br>
+=C2=A0 =C2=A0set(pocketpy_LIBRARIES ${pocketpy_LIBRARY})<br>
+-else()<br>
+-=C2=A0 set(pocketpy_FOUND FALSE)<br>
+ endif()<br>
+ <br>
+ mark_as_advanced(pocketpy_INCLUDE_DIR pocketpy_LIBRARY)<br>
diff --git a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopen=
term_2.01.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.01.bb</a> =
b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.02.b=
b" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a><br>
similarity index 76%<br>
rename from meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopent=
erm_2.01.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.01.bb</a><b=
r>
rename to meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenter=
m_2.02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a><br>
index f44312a6e4..a83d3bee69 100644<br>
--- a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
01.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.01.bb</a><br>
+++ b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
02.bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a><br>
@@ -15,13 +15,16 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dbd2e=
dc721b4a0289efe949bdbe7dda79&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;canvenient cjson isocline libinih libsdl3 lua pocke=
tpy&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV}</a>&quot;<br>
-SRCREV=C2=A0 =3D &quot;4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-C-include-path-fo=
r-pocketpy-headers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Update-search-paths-i=
n-Findpocketpy.cmake.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRCREV=C2=A0 =3D &quot;a6a9cd4fdbfaffea01b3eeeaf3c4830d4ee4b313&quot;<br>
<br>
<br>
=C2=A0inherit cmake ptest<br>
<br>
-EXTRA_OECMAKE +=3D &quot;-DBUILD_YOCTO=3DON&quot;<br>
+EXTRA_OECMAKE +=3D &quot;-DUSE_SYSTEM_LIBS=3DON&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${bindir}/CANopenTerm ${bindir}/codb2json ${da=
tadir}&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126354): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126354" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126354</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118838261/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118838261/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005c12f9064f86f130--

