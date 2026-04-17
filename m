Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49711F436B8
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:30 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47702.1776439340769640553
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 08:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XfvydQ1t;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eb84d1e37so727244d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 08:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776439340; cv=none;
        d=google.com; s=arc-20240605;
        b=XMmAzoE3GDavo7TS44HpRTFOYdmc+axXkm6NL6hYr3npU623ItAJz9b1g9KH8wPuBI
         GanN1fouY8zpqMb+nqVUhlnMufxQW+x4+lBp+Bb5kCwPLMnUDOHcJQ6IoWRj+QJMuYoP
         u/3kl51HvQR+olC3RzP06GmDe9IghQ9cLEAJJOotWycap8HzoIjoTxAw0pvhU1izYlYO
         8xPbGSWWnAkwiwzrqSpMlzrete6TEQ/NwYPTETaIqrieytOWt81eYS1aoNOkrorsNQ3f
         VuPPsJrNfj3AxpUbQ80pBjJY6GRcySO/OeU7RDgE2Q/wsXWNr0s0XT2HWhKRbA3wEs1l
         kPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p0MKNnxzvjaxhu+e8PAW72izAIolW1990z1j490oIEs=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=FzVHUex0AnnTOyMJj6c2tdveVn4amz+0wQGMxSa/o3nBhCbDMhIqXvMwrAnwO9l2ya
         K4dWcSft9sXQ3ZFUO4o+GIgYAr+v6pAY1JtSy7Ycbh5+CtLLOww3HFHHewoN+HK43GGZ
         /hoesdkMu/jHB4xBPyqdBAo/b8kDTKHI++jX7qvW2NZLFVkkSos0MEVcqInXcp8WVU/x
         tJRQJmnTdRAUSm3g3c8+if9lC1LLcKR9etIvigvKgfip1O3ZrcIapmjVR0N1NLvnemJd
         LJAf7V6AYTsEHeNU8bQXaFHZY5z7J3HxcH1IPJQyoojv8CGTRcnJnhhutRmm5Q4oAzey
         cY4w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439340; x=1777044140; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p0MKNnxzvjaxhu+e8PAW72izAIolW1990z1j490oIEs=;
        b=XfvydQ1taI+PtW6tpa0Ezm2QktnZGmq+gZ7gcECcbu5sWNHdvOZDUBUjmN6/Y3OnVS
         emGBep083LYar+eQZEUn+DuauJ2+btUz07xI4dIDU/Olj0Gaqdvu1fA6bHADdKTMjVTR
         6dMl0XN4Gf6DGF5mc+lHM1ISN4lPo1a04XsSwR5j0fihG5X82OX6Y/yjreCV3BrE9Pwb
         YZKlOt3G6Ti6QF3eoQTZECq4uO5sBFlxpMX47CXoBey9L4CN+rNgN8mzW5Q5oN1rBDZF
         xL8o9FUlBAO6JQmtFnJEjSX6W/HBjS0p3DeVAt6Ki6OyfiiVY2ADks/T8vZtFS+bEwvx
         zA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439340; x=1777044140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0MKNnxzvjaxhu+e8PAW72izAIolW1990z1j490oIEs=;
        b=QijnlWwMr8oau5e9dL/IV4sbn8aMgE6N6rWQpDLJeBTpvTtieK2mKcoljurp4H78Qj
         ruRaa05WNdLvuEVTtDV7LvGF8CbKIK0NYNU69+BebuHpaTEvP4O+vRf+nOAlQq8PaI8f
         78jWQ7amEQlmkJp2HdmtzywUzyn7DbA9JFHdMQeiSgJQIV0eJl/F2EBoMrA9r0Kr1JTt
         T8kRcyvrFhcRkJWPPdM6Y/OVWiOAy1SX5U8rhU16w3OEeU/0YHMfDBuRqhdw4e5AbyZE
         /jhvBLS5CaAs8buhh2iMjmVQEKZ6o3Yb8SLN/0tQUsUQInWC6+FNHaGqyknrSJpEd969
         3bug==
X-Gm-Message-State: AOJu0YyOLk57viEK52az09dhza9x7XzG8MCY9fibqTJgMqQk5aUpiY9C
	arNhHa4aZEQDzkiym+7WZUdAAjF+p08cgy+emMtfeJ1scVnFhGoaHP9JbrJ1G42L7WSigr5cc00
	n1WDwOpywC0UWtU0ifHKRyUSGInUBodZ+Ixtq
X-Gm-Gg: AeBDieum+6Zg1NnX/aqwQyMAlAnM3no9gLHD8XrC9H9NHoqxJgDiVLSIdcA/6Q4xcqV
	tM8xbv6tpRxVGhqXCRUO+O4UWK0EhhlBkttCqr58/EI4PHV7rIsqMglL/Iky/6zcyDJFJOep/+b
	GjMYSgMd+IRLVBVzk5kQjcgoQNsXxUrwmClUUeaf8oiaWhPjz0NTsEKWpCT11Z+l5fUv1ON0CtW
	K1LEq4u6+/EcdPA2xunpSY4YDxFChkOFTOetsSCMy7/m+63BUlhZXL1BfnJ8lG4C7UCHcxqbF50
	2mZd8+jytoWkeXKCvlyii/vd0EVmxIut38FkwC6i0w+B8xVd1gTGBKhcCspQoxJIeINmbpGg+Lc
	ogXuca8+BqUCSWg/1TeWyC23997e35bVKGNJE/w0VbdjgU7LrvTOZtnq8ZA0KBufpGlLEtZ7/g6
	nAiqZKzWwEFwAo9As=
X-Received: by 2002:a53:5a09:0:b0:651:d2e3:394 with SMTP id
 956f58d0204a3-653109b467emr2270335d50.34.1776439339590; Fri, 17 Apr 2026
 08:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260416062133.38204-1-mail@michael-fitzmayer.de>
In-Reply-To: <20260416062133.38204-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Apr 2026 08:21:53 -0700
X-Gm-Features: AQROBzAhdASSuks1NFb-9lVd0RHP7OwC7AQLxqk6k3xc4Ri2xPnduMncK-WwU7c
Message-ID: <CAMKF1sqLBSyhnnpAA8LRO==UO+8+BLnn00QFP_CAr84fN_RXog@mail.gmail.com>
Subject: Re: [oe] [PATCH] [meta-oe][PATCH] canopenterm: upgrade to 2.02 and
 refresh patches
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd28bb064fa983ab"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 15:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126445

--000000000000cd28bb064fa983ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please address Gyorgy's feedback mentioned in the v1 thread, asking to bump
the SRCREV instead of apply patches to bring it to tip of trunk

On Wed, Apr 15, 2026 at 11:21=E2=80=AFPM Michael Fitzmayer via
lists.openembedded.org <mail=3Dmichael-fitzmayer.de@lists.openembedded.org>
wrote:

> - Introduced a new API function: print_result()
> - Added support for configuring a dynamic number of filters when executin=
g
>   replay.lua
> - Added script to interact with the STM32 CAN bootloader (stm32.lua)
> - Add Unified Diagnostic Services (ISO 14229-1) script written in Lua
> (uds.lua)
> - Various updates and fixes required by the Debian package and to be
> ableto get
>   certified by Microsoft
> - Added manpages
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  ...-C-include-path-for-pocketpy-headers.patch | 137 ++++++++++++++++++
>  ...e-search-paths-in-Findpocketpy.cmake.patch |  59 ++++++++
>  ...anopenterm_2.01.bb =3D> canopenterm_2.02.bb} |   9 +-
>  3 files changed, 202 insertions(+), 3 deletions(-)
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
> index 0000000000..b5b70fe378
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-pat=
h-for-pocketpy-headers.patch
> @@ -0,0 +1,137 @@
> +From 578d5805f73e3f38b5fff7f6b8d11b3d9ff6b9e3 Mon Sep 17 00:00:00 2001
> +From: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +Date: Wed, 15 Apr 2026 11:57:58 +0200
> +Subject: [PATCH] Fix C include path for pocketpy headers
> +
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
> index 0000000000..5dfb426bb5
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-pat=
hs-in-Findpocketpy.cmake.patch
> @@ -0,0 +1,59 @@
> +From ec8c7459cdca2e94ee5fcce514d4f116ac7e039b Mon Sep 17 00:00:00 2001
> +From: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +Date: Wed, 15 Apr 2026 12:31:17 +0200
> +Subject: [PATCH] Update search paths in Findpocketpy.cmake
> +
> +Upstream-Status: Submitted [
> https://github.com/CANopenTerm/CANopenTerm/commit/7a9466029a6e88345e65e79=
4ff1779f778c9358a
> ]
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
> View/Reply Online (#126398):
> https://lists.openembedded.org/g/openembedded-devel/message/126398
> Mute This Topic: https://lists.openembedded.org/mt/118854329/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cd28bb064fa983ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please address=C2=A0Gyorgy&#39;s feedback=C2=A0mentioned i=
n the v1 thread, asking to bump the SRCREV instead of apply patches to brin=
g it to tip of trunk</div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15, 2026 at 11:21=E2=
=80=AFPM Michael Fitzmayer via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@=
lists.openembedded.org">michael-fitzmayer.de@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Introd=
uced a new API function: print_result()<br>
- Added support for configuring a dynamic number of filters when executing<=
br>
=C2=A0 replay.lua<br>
- Added script to interact with the STM32 CAN bootloader (stm32.lua)<br>
- Add Unified Diagnostic Services (ISO 14229-1) script written in Lua (uds.=
lua)<br>
- Various updates and fixes required by the Debian package and to be ableto=
 get<br>
=C2=A0 certified by Microsoft<br>
- Added manpages<br>
<br>
Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmay=
er.de" target=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
---<br>
=C2=A0...-C-include-path-for-pocketpy-headers.patch | 137 +++++++++++++++++=
+<br>
=C2=A0...e-search-paths-in-Findpocketpy.cmake.patch |=C2=A0 59 ++++++++<br>
=C2=A0...<a href=3D"http://anopenterm_2.01.bb" rel=3D"noreferrer" target=3D=
"_blank">anopenterm_2.01.bb</a> =3D&gt; <a href=3D"http://canopenterm_2.02.=
bb" rel=3D"noreferrer" target=3D"_blank">canopenterm_2.02.bb</a>} |=C2=A0 =
=C2=A09 +-<br>
=C2=A03 files changed, 202 insertions(+), 3 deletions(-)<br>
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
index 0000000000..b5b70fe378<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include-p=
ath-for-pocketpy-headers.patch<br>
@@ -0,0 +1,137 @@<br>
+From 578d5805f73e3f38b5fff7f6b8d11b3d9ff6b9e3 Mon Sep 17 00:00:00 2001<br>
+From: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmayer.de" t=
arget=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+Date: Wed, 15 Apr 2026 11:57:58 +0200<br>
+Subject: [PATCH] Fix C include path for pocketpy headers<br>
+<br>
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
index 0000000000..5dfb426bb5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search-p=
aths-in-Findpocketpy.cmake.patch<br>
@@ -0,0 +1,59 @@<br>
+From ec8c7459cdca2e94ee5fcce514d4f116ac7e039b Mon Sep 17 00:00:00 2001<br>
+From: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmayer.de" t=
arget=3D"_blank">mail@michael-fitzmayer.de</a>&gt;<br>
+Date: Wed, 15 Apr 2026 12:31:17 +0200<br>
+Subject: [PATCH] Update search paths in Findpocketpy.cmake<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/CANopenTerm/CANo=
penTerm/commit/7a9466029a6e88345e65e794ff1779f778c9358a" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/CANopenTerm/CANopenTerm/commit/7a9466=
029a6e88345e65e794ff1779f778c9358a</a>]<br>
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
View/Reply Online (#126398): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126398" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126398</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118854329/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118854329/1997914</a><br>
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

--000000000000cd28bb064fa983ab--

