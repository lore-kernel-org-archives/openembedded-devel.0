Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EFEF428FF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:21:40 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7434.1776320499304017850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 536E9606D2; Thu, 16 Apr 2026 06:21:37 +0000 (UTC)
Received: from NB10174-DEV.jetter.local (unknown [217.78.170.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 4526260622;
	Thu, 16 Apr 2026 06:21:37 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [PATCH] [meta-oe][PATCH] canopenterm: upgrade to 2.02 and refresh patches
Date: Thu, 16 Apr 2026 08:21:33 +0200
Message-ID: <20260416062133.38204-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 06:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126398

- Introduced a new API function: print_result()
- Added support for configuring a dynamic number of filters when executin=
g
  replay.lua
- Added script to interact with the STM32 CAN bootloader (stm32.lua)
- Add Unified Diagnostic Services (ISO 14229-1) script written in Lua (ud=
s.lua)
- Various updates and fixes required by the Debian package and to be able=
to get
  certified by Microsoft
- Added manpages

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 ...-C-include-path-for-pocketpy-headers.patch | 137 ++++++++++++++++++
 ...e-search-paths-in-Findpocketpy.cmake.patch |  59 ++++++++
 ...anopenterm_2.01.bb =3D> canopenterm_2.02.bb} |   9 +-
 3 files changed, 202 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001=
-Fix-C-include-path-for-pocketpy-headers.patch
 create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0002=
-Update-search-paths-in-Findpocketpy.cmake.patch
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.01.bb =3D> ca=
nopenterm_2.02.bb} (76%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-=
include-path-for-pocketpy-headers.patch b/meta-oe/recipes-extended/canope=
nterm/canopenterm/0001-Fix-C-include-path-for-pocketpy-headers.patch
new file mode 100644
index 0000000000..b5b70fe378
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-Fix-C-include=
-path-for-pocketpy-headers.patch
@@ -0,0 +1,137 @@
+From 578d5805f73e3f38b5fff7f6b8d11b3d9ff6b9e3 Mon Sep 17 00:00:00 2001
+From: Michael Fitzmayer <mail@michael-fitzmayer.de>
+Date: Wed, 15 Apr 2026 11:57:58 +0200
+Subject: [PATCH] Fix C include path for pocketpy headers
+
+Upstream-Status: Submitted [https://github.com/CANopenTerm/CANopenTerm/c=
ommit/cbe8d8e6d5787636a32862b20f7c7cf342bb764b]
+
+Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
+---
+ src/api/python_can.c         | 2 +-
+ src/api/python_dbc.c         | 2 +-
+ src/api/python_misc.c        | 2 +-
+ src/api/python_nmt.c         | 2 +-
+ src/api/python_pdo.c         | 2 +-
+ src/api/python_sdo.c         | 2 +-
+ src/api/python_test_report.c | 2 +-
+ src/api/python_widget.c      | 2 +-
+ src/core/scripts.c           | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/api/python_can.c b/src/api/python_can.c
+index d1c5c6a..c6ee023 100644
+--- a/src/api/python_can.c
++++ b/src/api/python_can.c
+@@ -11,7 +11,7 @@
+ #include "core.h"
+ #include "dict.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+=20
+diff --git a/src/api/python_dbc.c b/src/api/python_dbc.c
+index f688796..3f3e3d3 100644
+--- a/src/api/python_dbc.c
++++ b/src/api/python_dbc.c
+@@ -10,7 +10,7 @@
+ #include "core.h"
+ #include "dbc.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+=20
+diff --git a/src/api/python_misc.c b/src/api/python_misc.c
+index a71c39d..da14c01 100644
+--- a/src/api/python_misc.c
++++ b/src/api/python_misc.c
+@@ -10,7 +10,7 @@
+ #include "python_misc.h"
+ #include "core.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+ #include "scripts.h"
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+diff --git a/src/api/python_nmt.c b/src/api/python_nmt.c
+index 293d2e1..8e467fe 100644
+--- a/src/api/python_nmt.c
++++ b/src/api/python_nmt.c
+@@ -11,7 +11,7 @@
+ #include "core.h"
+ #include "nmt.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+=20
+diff --git a/src/api/python_pdo.c b/src/api/python_pdo.c
+index fe34bc9..a307b0d 100644
+--- a/src/api/python_pdo.c
++++ b/src/api/python_pdo.c
+@@ -10,7 +10,7 @@
+ #include "core.h"
+ #include "os.h"
+ #include "pdo.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+=20
+diff --git a/src/api/python_sdo.c b/src/api/python_sdo.c
+index 3378fc2..2d7b583 100644
+--- a/src/api/python_sdo.c
++++ b/src/api/python_sdo.c
+@@ -10,7 +10,7 @@
+ #include "core.h"
+ #include "dict.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+ #include "sdo.h"
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+diff --git a/src/api/python_test_report.c b/src/api/python_test_report.c
+index 59cc7b1..3ca7536 100644
+--- a/src/api/python_test_report.c
++++ b/src/api/python_test_report.c
+@@ -10,7 +10,7 @@
+ #include "core.h"
+ #include "eds.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+ #include "test_report.h"
+=20
+ typedef bool (*py_CFunction)(int argc, py_Ref argv);
+diff --git a/src/api/python_widget.c b/src/api/python_widget.c
+index 92891c0..c176ca8 100644
+--- a/src/api/python_widget.c
++++ b/src/api/python_widget.c
+@@ -13,7 +13,7 @@
+ #include "core.h"
+ #include "led.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+ #include "tachometer.h"
+ #include "window.h"
+=20
+diff --git a/src/core/scripts.c b/src/core/scripts.c
+index 4dbdac3..1f37b7c 100644
+--- a/src/core/scripts.c
++++ b/src/core/scripts.c
+@@ -14,7 +14,7 @@
+ #include "lua.h"
+ #include "lualib.h"
+ #include "os.h"
+-#include "pocketpy.h"
++#include <pocketpy.h>
+ #include "table.h"
+=20
+ extern const uint8 max_script_search_paths;
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update=
-search-paths-in-Findpocketpy.cmake.patch b/meta-oe/recipes-extended/cano=
penterm/canopenterm/0002-Update-search-paths-in-Findpocketpy.cmake.patch
new file mode 100644
index 0000000000..5dfb426bb5
--- /dev/null
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0002-Update-search=
-paths-in-Findpocketpy.cmake.patch
@@ -0,0 +1,59 @@
+From ec8c7459cdca2e94ee5fcce514d4f116ac7e039b Mon Sep 17 00:00:00 2001
+From: Michael Fitzmayer <mail@michael-fitzmayer.de>
+Date: Wed, 15 Apr 2026 12:31:17 +0200
+Subject: [PATCH] Update search paths in Findpocketpy.cmake
+
+Upstream-Status: Submitted [https://github.com/CANopenTerm/CANopenTerm/c=
ommit/7a9466029a6e88345e65e794ff1779f778c9358a]
+
+Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
+---
+ cmake/Findpocketpy.cmake | 30 ++++++++++++++++++++++++------
+ 1 file changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/cmake/Findpocketpy.cmake b/cmake/Findpocketpy.cmake
+index 459160f..8083270 100644
+--- a/cmake/Findpocketpy.cmake
++++ b/cmake/Findpocketpy.cmake
+@@ -3,18 +3,36 @@ cmake_minimum_required(VERSION 3.16)
+ # Findpocketpy.cmake
+ # Locate pocketpy library and include directories
+=20
+-find_path(pocketpy_INCLUDE_DIR NAMES pocketpy/pocketpy.h PATHS /usr/inc=
lude)
+-find_library(pocketpy_LIBRARY NAMES libpocketpy.so PATHS /usr/lib)
++find_path(pocketpy_INCLUDE_DIR
++  NAMES pocketpy.h
++  PATH_SUFFIXES pocketpy
++  PATHS
++    /usr/include
++    /usr/local/include
++    /opt/local/include
++    /opt/homebrew/include
++)
++
++find_library(pocketpy_LIBRARY
++  NAMES pocketpy
++  PATHS
++    /usr/lib
++    /usr/local/lib
++    /opt/local/lib
++    /opt/homebrew/lib
++)
+=20
+ message(STATUS "pocketpy_INCLUDE_DIR: ${pocketpy_INCLUDE_DIR}")
+ message(STATUS "pocketpy_LIBRARY: ${pocketpy_LIBRARY}")
+=20
+-if (pocketpy_INCLUDE_DIR AND pocketpy_LIBRARY)
+-  set(pocketpy_FOUND TRUE)
++include(FindPackageHandleStandardArgs)
++find_package_handle_standard_args(pocketpy
++  REQUIRED_VARS pocketpy_LIBRARY pocketpy_INCLUDE_DIR
++)
++
++if (pocketpy_FOUND)
+   set(pocketpy_INCLUDE_DIRS ${pocketpy_INCLUDE_DIR})
+   set(pocketpy_LIBRARIES ${pocketpy_LIBRARY})
+-else()
+-  set(pocketpy_FOUND FALSE)
+ endif()
+=20
+ mark_as_advanced(pocketpy_INCLUDE_DIR pocketpy_LIBRARY)
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb b/m=
eta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
similarity index 76%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
index f44312a6e4..a83d3bee69 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.01.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
@@ -15,13 +15,16 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc7=
21b4a0289efe949bdbe7dda79"
=20
 DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"
-SRCREV  =3D "4196097f71c7e59b27e9d8ac3c6cf58f44fa9f19"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV} \
+           file://0001-Fix-C-include-path-for-pocketpy-headers.patch \
+           file://0002-Update-search-paths-in-Findpocketpy.cmake.patch \
+           "
+SRCREV  =3D "a6a9cd4fdbfaffea01b3eeeaf3c4830d4ee4b313"
=20
=20
 inherit cmake ptest
=20
-EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
+EXTRA_OECMAKE +=3D "-DUSE_SYSTEM_LIBS=3DON"
=20
 FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
=20

