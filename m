Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2932BCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 21:54:45 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31461.1780523683062317611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 14:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Mwb+mKQK;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 096FF380CA
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2026 23:54:40 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.172.112]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wUtXq-10JmCH0; Wed, 3 Jun 2026 23:54:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-net: remove backport patch
Date: Wed,  3 Jun 2026 23:54:27 +0200
Message-ID: <20260603215427.319623-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780523678-71FF9408-037BB4B0/0/0 CLEAN NORMAL
X-TOI-MSGID: 040fda62-40ae-4a43-8771-63606490406b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780523679; i=f_l_k@t-online.de;
	bh=9cwrxHtl8V7OgZNbnfTUr5jLrSWEnkg9jGqBCWg8ptI=;
	h=From:To:Subject:Date;
	b=Mwb+mKQKVe8S36kvZ0dwHON2QPAQCYmv4+pJIwccHodUeAm0MbPGSoGw2NYPC1T0K
	 41hfP+jCYH/H3Yvp92ghqS8rXeKXM7Gzqc0YDMaTLw2wM3kArxj5qhiKrcwggq/E5B
	 X94b8w0/iclAmvPaybluPIqQsqafI5+4IrXRkK8PmSThZZSgs6GV/IxauAPBPAF7A5
	 9AZHzkCRg7pQYzo04ZImmHOtfG0PwF3B8ziVz1uNelwZODBg76Xi3AayQcLRtJmLFp
	 PsydGBEYp+z6vViUWWyq2JFvuYXbhEqfsf3Bb9AWn6YXVZ/cR6G2spjZXD/+cf3fFW
	 td5BiUz3eWucw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 21:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127389

Currently build fails with:

Hunk #1 FAILED at 204.
1 out of 1 hunk FAILED -- rejects in file CMakeLists.txt
Patch 0001-cmake-always-install-SDL2_net.pc.patch does not apply (enforce=
 with -f)

Remove the patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-cmake-always-install-SDL2_net.pc.patch | 93 -------------------
 .../libsdl/libsdl2-net_2.4.0.bb               |  4 +-
 2 files changed, 1 insertion(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmak=
e-always-install-SDL2_net.pc.patch

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-alway=
s-install-SDL2_net.pc.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-net=
/0001-cmake-always-install-SDL2_net.pc.patch
deleted file mode 100644
index 0a717a60ae..0000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net/0001-cmake-always-insta=
ll-SDL2_net.pc.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 6aceea847131f8ee208d8b8adec336fafcf30d48 Mon Sep 17 00:00:00 2001
-From: Anonymous Maarten <anonymous.maarten@gmail.com>
-Date: Wed, 31 Aug 2022 15:15:43 +0200
-Subject: [PATCH] cmake: always install SDL2_net.pc
-
-Upstream-Status: Backport [https://github.com/libsdl-org/SDL_net/commit/=
fb8031364ad852d51faf5b64040440857f5e8f26]
-
-Signed-off-by: Mark Jonas <toertel@gmail.com>
----
- CMakeLists.txt | 67 ++++++++++++++++++++++++++++----------------------
- 1 file changed, 37 insertions(+), 30 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bf30a70..c34e3f0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -204,39 +204,46 @@ if(SDL2NET_INSTALL)
-         COMPONENT devel
-     )
-
--    if(SDL2NET_BUILD_SHARED_LIBS)
--        # Only create a .pc file for a shared SDL2_net
--        set(prefix "${CMAKE_INSTALL_PREFIX}")
--        set(exec_prefix "\${prefix}")
--        set(libdir "\${exec_prefix}/${CMAKE_INSTALL_LIBDIR}")
--        set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
--        set(PACKAGE "${PROJECT_NAME}")
--        set(VERSION "${FULL_VERSION}")
--        set(SDL_VERSION "${SDL_REQUIRED_VERSION}")
--        string(JOIN " " PC_REQUIRES ${PC_REQUIRES})
--        string(JOIN " " PC_LIBS ${PC_LIBS})
--        configure_file("${PROJECT_SOURCE_DIR}/SDL2_net.pc.in" "${CMAKE_=
CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate" @ONLY)
--        file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CO=
NFIG>.pc" INPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate")
--
--        set(PC_DESTDIR)
--        if(CMAKE_SYSTEM_NAME MATCHES FreeBSD)
--            # FreeBSD uses ${PREFIX}/libdata/pkgconfig
--            set(PC_DESTDIR "libdata/pkgconfig")
-+        if(SDL2NET_BUILD_SHARED_LIBS)
-+            set(ENABLE_SHARED_TRUE "")
-+            set(ENABLE_SHARED_FALSE "#")
-+            set(ENABLE_STATIC_TRUE "#")
-+            set(ENABLE_STATIC_FALSE "")
-         else()
--            set(PC_DESTDIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-+            set(ENABLE_SHARED_TRUE "#")
-+            set(ENABLE_SHARED_FALSE "")
-+            set(ENABLE_STATIC_TRUE "")
-+            set(ENABLE_STATIC_FALSE "#")
-         endif()
--        # Only install a SDL2_net.pc file in Release mode
--        install(CODE "
--            if(CMAKE_INSTALL_CONFIG_NAME MATCHES \"Release\")
--                # FIXME: use file(COPY_FILE) if minimum CMake version >=
=3D 3.21
--                execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy_i=
f_different
--                    \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc=
\"
--                    \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
--                file(INSTALL DESTINATION \"\${CMAKE_INSTALL_PREFIX}/${P=
C_DESTDIR}\"
--                    TYPE FILE
--                    FILES \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
--            endif()" COMPONENT devel)
-+
-+    set(prefix "${CMAKE_INSTALL_PREFIX}")
-+    set(exec_prefix "\${prefix}")
-+    set(libdir "\${exec_prefix}/${CMAKE_INSTALL_LIBDIR}")
-+    set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
-+    set(PACKAGE "${PROJECT_NAME}")
-+    set(VERSION "${FULL_VERSION}")
-+    set(SDL_VERSION "${SDL_REQUIRED_VERSION}")
-+    string(JOIN " " PC_REQUIRES ${PC_REQUIRES})
-+    string(JOIN " " PC_LIBS ${PC_LIBS})
-+    configure_file("${PROJECT_SOURCE_DIR}/SDL2_net.pc.in" "${CMAKE_CURR=
ENT_BINARY_DIR}/SDL2_net.pc.intermediate" @ONLY)
-+    file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG=
>.pc" INPUT "${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc.intermediate")
-+
-+    set(PC_DESTDIR)
-+    if(CMAKE_SYSTEM_NAME MATCHES FreeBSD)
-+        # FreeBSD uses ${PREFIX}/libdata/pkgconfig
-+        set(PC_DESTDIR "libdata/pkgconfig")
-+    else()
-+        set(PC_DESTDIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-     endif()
-+    # Always install SDL2_net.pc: libraries might be different between =
config modes
-+    install(CODE "
-+        # FIXME: use file(COPY_FILE) if minimum CMake version >=3D 3.21
-+        execute_process(COMMAND \"\${CMAKE_COMMAND}\" -E copy_if_differ=
ent
-+            \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net-$<CONFIG>.pc\"
-+            \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")
-+        file(INSTALL DESTINATION \"\${CMAKE_INSTALL_PREFIX}/${PC_DESTDI=
R}\"
-+            TYPE FILE
-+            FILES \"${CMAKE_CURRENT_BINARY_DIR}/SDL2_net.pc\")" COMPONE=
NT devel)
-
-     if(SDL2NET_BUILD_SHARED_LIBS AND (APPLE OR (UNIX AND NOT ANDROID)))
-         install(
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb b/meta-=
oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
index dbaf35ff38..abdfd94122 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
@@ -4,9 +4,7 @@ LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D036a54229112040a743509a86=
b30c80c"
=20
 SRC_URI =3D " \
-  https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz =
\
-  file://0001-cmake-always-install-SDL2_net.pc.patch \
-"
+  https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz"
 S =3D "${UNPACKDIR}/SDL2_net-${PV}"
=20
 inherit cmake pkgconfig
--=20
2.54.0


