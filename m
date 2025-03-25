Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE6C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 06:02:08 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.59701.1742882523297024907
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 23:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 560F5108B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 07:01:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.137]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twxM0-4fksAT0; Tue, 25 Mar 2025 07:01:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcec: update 6.0.2 -> 7.0.0
Date: Tue, 25 Mar 2025 07:02:18 +0100
Message-ID: <20250325060218.222815-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742882496-897ECB7D-79A13ADF/10/3626336762 SUSPECT URL
X-TOI-MSGID: ff667667-777d-439b-ac71-ace3c48903df
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 06:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116223

Changelog

    modernise CMakeLists.txt
    Use cmake TIMESTAMP function to be more portable and to allow for rep=
roducible builds
    fixed: potential null deref. closes #556
    python 3.13 compatibility
    added: vs2022 support
    fixed: creating (unsigned) windows installer
    fixed: nsis installer not creating start menu icons and uninstaller
    bump to .net framework 4.5 and .net 8.0
    fixed: null terminate .net device language field. added CecLogicalAdd=
resses::Unset()
    fixed: don't call the config updated callback if nothing has changed.=
 auto set wake devices or activate source so these values match what happ=
ens on the tv
    fixed: tv would power on even if the options to power on were disable=
d in cec-tray
    changed/fixed: windows installer, eventghost plugin, .net libraries, =
python imports, debug builds
    fixed: use input() for python3 and raw_input() for python2
    changed: debian python install to match arch specific too
    fixed: libusb0.dll wasn't included in the installer
    fixed: remove call to PyEcal_InitThreads(). swig already includes SWI=
G_PYTHON_INITIALIZE_THREADS in SWIG_init()
    CheckPlatformSupport.cmake: various improvements
    Ease copy-paste by invoking apt noninteractively
    Rename COPYING to LICENSE.md so follow standard naming conversion
    cecloader.h: fix null return
    Mark all devices as inactive when new active source is unknown
    Fix use after free in callbacks with results.
    Add a commandHandler callback to allow external libs to handle CEC co=
mmands themselves.
    Remove debug printfs.
    Attempt to fix race condition when freeing the callback wrapper.
    Allow command handler callback to intercept broadcast messages and fi=
x inconsistent callback wrapper deletion again.
    Remove useless mutex.
    Remove useless 'keepResult' parameter and make sure the CCallbackWrap=
 is only deleted once even in case of timeout.
    Fix Python module import
    fix assert issue with systemd udev
    tegra-cec support. closes #636
    Add support for Windows ARM64.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...pport.cmake-Do-not-hardcode-lib-path.patch | 42 -------------------
 ...buggy-test-confusing-host-and-target.patch | 33 ---------------
 ...return-type-of-function-LibCecBootlo.patch | 41 ------------------
 .../{libcec_6.0.2.bb =3D> libcec_7.0.0.bb}      |  7 +---
 4 files changed, 2 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-CheckPlat=
formSupport.cmake-Do-not-hardcode-lib-path.patch
 delete mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-Remove-bu=
ggy-test-confusing-host-and-target.patch
 delete mode 100644 meta-oe/recipes-extended/libcec/libcec/0001-cecloader=
-Match-return-type-of-function-LibCecBootlo.patch
 rename meta-oe/recipes-extended/libcec/{libcec_6.0.2.bb =3D> libcec_7.0.=
0.bb} (80%)

diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSup=
port.cmake-Do-not-hardcode-lib-path.patch b/meta-oe/recipes-extended/libc=
ec/libcec/0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-path.patch
deleted file mode 100644
index 3ecbfce250..0000000000
--- a/meta-oe/recipes-extended/libcec/libcec/0001-CheckPlatformSupport.cm=
ake-Do-not-hardcode-lib-path.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 95d4df3b713925e2c4894a2e4d50b06df861d9ef Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Dec 2019 23:37:40 -0800
-Subject: [PATCH] CheckPlatformSupport.cmake: Do not hardcode lib path
-
-Using CMAKE_INSTALL_LIBDIR ensures that we can build for multilib env
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libcec/cmake/CheckPlatformSupport.cmake | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cm=
ake/CheckPlatformSupport.cmake
-index 2d7102f..55e78f8 100644
---- a/src/libcec/cmake/CheckPlatformSupport.cmake
-+++ b/src/libcec/cmake/CheckPlatformSupport.cmake
-@@ -224,16 +224,16 @@ else()
-=20
-       if (${PYTHON_MAJOR_VERSION} EQUAL 2)
-         install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
--                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DI=
R}/${PYTHON_LIB_INSTALL_PATH}/cec)
-+                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERS=
ION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH}/cec)
-         install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
--                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DI=
R})
-+                DESTINATION l${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VER=
SION}/${PYTHON_PKG_DIR})
-         install(FILES ${CMAKE_SOURCE_DIR}/src/libcec/cmake/__init__.py
--                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DI=
R}/cec)
-+                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERS=
ION}/${PYTHON_PKG_DIR}/cec)
-       else()
-         install(TARGETS     ${SWIG_MODULE_cec_REAL_NAME}
--                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DI=
R}/${PYTHON_LIB_INSTALL_PATH})
-+                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERS=
ION}/${PYTHON_PKG_DIR}/${PYTHON_LIB_INSTALL_PATH})
-         install(FILES       ${CMAKE_BINARY_DIR}/src/libcec/cec.py
--                DESTINATION lib/python${PYTHON_VERSION}/${PYTHON_PKG_DI=
R})
-+                DESTINATION ${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERS=
ION}/${PYTHON_PKG_DIR})
-       endif()
-     endif()
-   endif()
---=20
-2.24.1
-
diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-tes=
t-confusing-host-and-target.patch b/meta-oe/recipes-extended/libcec/libce=
c/0001-Remove-buggy-test-confusing-host-and-target.patch
deleted file mode 100644
index 07277f7064..0000000000
--- a/meta-oe/recipes-extended/libcec/libcec/0001-Remove-buggy-test-confu=
sing-host-and-target.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8ce50bf569ec2d931735180079bbe507730626c8 Mon Sep 17 00:00:00 2001
-From: Yann Dirson <yann@blade-group.com>
-Date: Mon, 7 Sep 2020 18:17:21 +0200
-Subject: [PATCH] Remove buggy test confusing host and target
-
----
-Upstream-Status: Pending
-
- src/libcec/cmake/CheckPlatformSupport.cmake | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/src/libcec/cmake/CheckPlatformSupport.cmake b/src/libcec/cm=
ake/CheckPlatformSupport.cmake
-index 1d99bd8..31dac4f 100644
---- a/src/libcec/cmake/CheckPlatformSupport.cmake
-+++ b/src/libcec/cmake/CheckPlatformSupport.cmake
-@@ -266,14 +266,6 @@ else()
-                 DESTINATION python/cec)
-       endif()
-     else()
--      if(EXISTS "/etc/os-release")
--        file(READ "/etc/os-release" OS_RELEASE)
--        string(REGEX MATCH "ID(_LIKE)?=3Ddebian" IS_DEBIAN ${OS_RELEASE=
})
--        if (IS_DEBIAN)
--          SET(PYTHON_PKG_DIR "dist-packages")
--        endif()
--      endif()
--
-       if (NOT PYTHON_PKG_DIR)
-         SET(PYTHON_PKG_DIR "site-packages")
-       endif()
---=20
-2.28.0
-
diff --git a/meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-=
return-type-of-function-LibCecBootlo.patch b/meta-oe/recipes-extended/lib=
cec/libcec/0001-cecloader-Match-return-type-of-function-LibCecBootlo.patc=
h
deleted file mode 100644
index ab1ab5b8eb..0000000000
--- a/meta-oe/recipes-extended/libcec/libcec/0001-cecloader-Match-return-=
type-of-function-LibCecBootlo.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2241edc8b70c2a54d109ac9c0e821889ac138d40 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 27 Jan 2022 22:49:52 -0800
-Subject: [PATCH] cecloader: Match return type of function LibCecBootload=
er
-
-Fixes
-include/cecloader.h:175:14: error: cannot initialize return object of ty=
pe 'bool' with an rvalue of type 'nullptr_t'
-      return NULL;
-             ^~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/cecloader.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/cecloader.h b/include/cecloader.h
-index be76468f..550f598e 100644
---- a/include/cecloader.h
-+++ b/include/cecloader.h
-@@ -172,7 +172,7 @@ bool LibCecBootloader(const char *strLib =3D NULL)
-     if (!g_libCEC)
-     {
-       std::cout << dlerror() << std::endl;
--      return NULL;
-+      return false;
-     }
-   }
-=20
-@@ -181,7 +181,7 @@ bool LibCecBootloader(const char *strLib =3D NULL)
-   if (!LibCecBootloader)
-   {
-     std::cout << "cannot find CECStartBootloader" << std::endl;
--    return NULL;
-+    return false;
-   }
-=20
-   bool bReturn =3D LibCecBootloader();
---=20
-2.35.0
-
diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/re=
cipes-extended/libcec/libcec_7.0.0.bb
similarity index 80%
rename from meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
rename to meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
index 22155e534c..532179a9bb 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
@@ -2,19 +2,16 @@ SUMMARY =3D "USB CEC Adaptor communication Library"
 HOMEPAGE =3D "http://libcec.pulse-eight.com/"
=20
 LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db3a719e97f49e4841e90573f9b1a9=
8ac"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Db3a719e97f49e4841e90573f9b=
1a98ac"
=20
 DEPENDS =3D "p8platform udev ncurses swig-native python3"
=20
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 lib=
xrandr', '', d)}"
 DEPENDS:append:rpi =3D "${@bb.utils.contains('MACHINE_FEATURES', 'vc4gra=
phics', '', ' userland', d)}"
=20
-SRCREV =3D "29d82c80bcc62be2878a9ac080de7eb286c4beb9"
+SRCREV =3D "ceeec8bfd2242792b6de59ce8fb854437208dc11"
 SRC_URI =3D "git://github.com/Pulse-Eight/libcec.git;branch=3Drelease;pr=
otocol=3Dhttps \
-           file://0001-CheckPlatformSupport.cmake-Do-not-hardcode-lib-pa=
th.patch \
            file://0001-Enhance-reproducibility.patch \
-           file://0001-Remove-buggy-test-confusing-host-and-target.patch=
 \
-           file://0001-cecloader-Match-return-type-of-function-LibCecBoo=
tlo.patch \
           "
=20
 S =3D "${WORKDIR}/git"
--=20
2.49.0


