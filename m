Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3617C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 10:20:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48315.1703154018599242562
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86AE02F4
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 02:21:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 59AF93F5A1
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 02:20:17 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] renderdoc: no need to depend on vim-native
Date: Thu, 21 Dec 2023 10:20:15 +0000
Message-Id: <20231221102015.1080653-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107705

From: Ross Burton <ross.burton@arm.com>

Remove the patch to bring back the user of xxd from vim-native, the
patch claimed that the cross-compiling rules were broken. However they
work just fine if you tell it what compiler to use, as the default is
"c++" and that isn't in HOSTTOOLS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...d-instead-of-cross-compiling-shim-bi.patch | 57 -------------------
 .../renderdoc/renderdoc_1.27.bb               |  2 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/renderdoc/renderdoc/0001-ren=
derdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-=
use-xxd-instead-of-cross-compiling-shim-bi.patch b/meta-oe/recipes-graphi=
cs/renderdoc/renderdoc/0001-renderdoc-use-xxd-instead-of-cross-compiling-=
shim-bi.patch
deleted file mode 100644
index e96dedfc39..0000000000
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc/0001-renderdoc-use-xxd=
-instead-of-cross-compiling-shim-bi.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 41a8c9b5ac13066770baee476ebf9828371f4dad Mon Sep 17 00:00:00 2001
-From: Adrian Ratiu <adrian.ratiu@collabora.com>
-Date: Tue, 24 Sep 2019 16:07:18 +0300
-Subject: [PATCH] renderdoc: use xxd instead of cross-compiling shim bina=
ry
-
-Renderdoc's attempt to cross compile an xxd replacement by directly
-calling a host cross-compiler breaks under OE's recipe specific
-sysroots protection because this is not a native recipe, so we just
-use xxd-native instead.
-
-Upstream-Status: Inappropriate [embedded-specific]
-
----
- renderdoc/CMakeLists.txt | 23 +----------------------
- 1 file changed, 1 insertion(+), 22 deletions(-)
-
-diff --git a/renderdoc/CMakeLists.txt b/renderdoc/CMakeLists.txt
-index 5cb7440a4..453a034ba 100644
---- a/renderdoc/CMakeLists.txt
-+++ b/renderdoc/CMakeLists.txt
-@@ -370,26 +370,6 @@ set(data
- set(data_objects)
-=20
- if(UNIX)
--    # If we're cross-compiling, include-bin will get built for the targ=
et and we
--    # then can't execute it. Instead, we force calling c++ (which we ca=
n safely
--    # assume is present) directly to build the binary
--
--    if(CMAKE_CROSSCOMPILING)
--        set(HOST_NATIVE_CPP_COMPILER c++ CACHE STRING "Command to run t=
o compile a .cpp into an executable. Default is just c++")
--
--        add_custom_command(OUTPUT ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/inc=
lude-bin
--            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
--            COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_RUNTIME_=
OUTPUT_DIRECTORY}
--            COMMAND ${HOST_NATIVE_CPP_COMPILER} 3rdparty/include-bin/ma=
in.cpp -o ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-bin
--            DEPENDS 3rdparty/include-bin/main.cpp)
--        set(INCLUDE_BIN_EXE "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-=
bin")
--        set(INCLUDE_BIN_DEP "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/include-=
bin")
--    else()
--        add_executable(include-bin 3rdparty/include-bin/main.cpp)
--        set(INCLUDE_BIN_EXE $<TARGET_FILE:include-bin>)
--        set(INCLUDE_BIN_DEP include-bin)
--    endif()
--
-     foreach(res ${data})
-         set(in ${res})
-         set(working_dir ${CMAKE_CURRENT_SOURCE_DIR})
-@@ -399,8 +379,7 @@ if(UNIX)
-         add_custom_command(OUTPUT ${out_src}
-             WORKING_DIRECTORY ${working_dir}
-             COMMAND ${CMAKE_COMMAND} -E make_directory ${out_src_dir}
--            COMMAND ${INCLUDE_BIN_EXE} ${in} ${out_src}
--            DEPENDS ${INCLUDE_BIN_DEP}
-+            COMMAND xxd -i ${in} ${out_src}
-             DEPENDS ${res})
-=20
-         list(APPEND data_objects ${out_src})
diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb b/meta-=
oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
index 112f0ddcbe..58f2275736 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D36d34a46cb7=
1546195d2b0c626a52e5d"
 SRCREV =3D "35b13a8e8fd2a331854dba6da81a20452e142d6f"
 SRC_URI =3D " \
     git://github.com/baldurk/${BPN}.git;protocol=3Dhttps;branch=3Dv1.x \
-    file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.pat=
ch \
 "
 S =3D "${WORKDIR}/git"
=20
@@ -32,6 +31,7 @@ EXTRA_OECMAKE +=3D "\
     -DENABLE_PYRENDERDOC=3DOFF \
     -DENABLE_RENDERDOCCMD=3DON \
     -DCMAKE_BUILD_TYPE=3DRelease \
+    -DHOST_NATIVE_CPP_COMPILER=3D"${BUILD_CXX}" \
 "
=20
 FILES:${PN} +=3D "${libdir}"
--=20
2.34.1


