Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11ABC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 19:26:21 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web10.12786.1705519328700479954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 11:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=Zcf9l/s3;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f1e2400a82d5affb25f13e4.dip0.t-ipconnect.de [IPv6:2003:e2:7f1e:2400:a82d:5aff:b25f:13e4])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id 9DC3232CA3F;
	Wed, 17 Jan 2024 19:22:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1705519324; bh=7Ld86oVNjxCbSJr89P7XDq/ENVtCyDdcUiCZsaVGvPM=;
	h=From:To:Cc:Subject:Date:From;
	b=Zcf9l/s3+6WDESJTjk4wrdBvQNeIV0VYRD70DxpBACC9CDt+Qi+KR1gk2See+wd2l
	 NJZvCH4n2PdLYRpuPm5jnJ2ns2gQ6oanNATAgjr+5IMYImi9OeIG4uxswWn6WzrArL
	 EPQor/wZq6uYxJF+u+3AIMKBb8NiqfvyOhhrzAg/UCpVY4S5G42Tu/Qx/ReyWXRjql
	 CH0uF0hYRE3emvjBdfkMn57mKWNwZHn4KhmNxXUJlmTkdZobOOYnw5Cx58Kb+T7PVv
	 Zm1OWv03Q+XstQqeLctwgWPvf8DLnTg/yv1vq+5gor1fjn4PXmj79QtvZsdVLPfSRw
	 FvUF4Tan3OX4g==
From: "Andreas Cord-Landwehr" <cordlandwehr@kde.org>
To: openembedded-devel@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [meta-oe][PATCH] freerdp: provide cmake integration
Date: Wed, 17 Jan 2024 20:21:32 +0100
Message-Id: <20240117192132.905323-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 19:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108337

Do not delete the cmake config and target files to allow easy
integration with cmake based libraries/applications.

Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
---
 ...Do-not-install-tools-a-CMake-targets.patch | 45 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.2.bb |  2 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-i=
nstall-tools-a-CMake-targets.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-=
tools-a-CMake-targets.patch b/meta-oe/recipes-support/freerdp/freerdp/000=
2-Do-not-install-tools-a-CMake-targets.patch
new file mode 100644
index 000000000..2e5e6a424
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0002-Do-not-install-tools-a=
-CMake-targets.patch
@@ -0,0 +1,45 @@
+From 0ddaeae351295e48365657482f165652051bbca2 Mon Sep 17 00:00:00 2001
+From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
+Date: Wed, 17 Jan 2024 20:00:58 +0100
+Subject: [PATCH] Do not install tools a CMake targets
+
+The cli tools are installed manually and thus are missing in the sysroot
+folder. Do not export their targets because they do not exist and make
+CMake fail when searching for the library.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
+---
+ winpr/tools/hash-cli/CMakeLists.txt     | 2 +-
+ winpr/tools/makecert-cli/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/winpr/tools/hash-cli/CMakeLists.txt b/winpr/tools/hash-cli/=
CMakeLists.txt
+index 9f8c7a8a0..b6d048fec 100644
+--- a/winpr/tools/hash-cli/CMakeLists.txt
++++ b/winpr/tools/hash-cli/CMakeLists.txt
+@@ -43,7 +43,7 @@ set(${MODULE_PREFIX}_LIBS winpr)
+=20
+ target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
+=20
+-install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMP=
ONENT tools EXPORT WinPRTargets)
++install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMP=
ONENT tools)
+=20
+ if (WITH_DEBUG_SYMBOLS AND MSVC)
+ 	install(FILES ${CMAKE_BINARY_DIR}/${MODULE_NAME}.pdb DESTINATION ${CMA=
KE_INSTALL_BINDIR} COMPONENT symbols)
+diff --git a/winpr/tools/makecert-cli/CMakeLists.txt b/winpr/tools/makec=
ert-cli/CMakeLists.txt
+index 48fda5b5e..c7cf4bfaf 100644
+--- a/winpr/tools/makecert-cli/CMakeLists.txt
++++ b/winpr/tools/makecert-cli/CMakeLists.txt
+@@ -46,7 +46,7 @@ target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX=
}_LIBS} winpr)
+=20
+ set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
+=20
+-install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMP=
ONENT tools EXPORT WinPRTargets)
++install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMP=
ONENT tools)
+ if (WITH_DEBUG_SYMBOLS AND MSVC)
+     install(FILES ${CMAKE_PDB_BINARY_DIR}/${MODULE_NAME}.pdb DESTINATIO=
N ${CMAKE_INSTALL_BINDIR} COMPONENT symbols)
+ endif()
+--=20
+2.40.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.2.bb
index c8d996d41..8de0e39ad 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
@@ -17,6 +17,7 @@ SRCREV =3D "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
 SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
            file://winpr-makecert-Build-with-install-RPATH.patch \
            file://0001-Fix-const-qualifier-error.patch \
+           file://0002-Do-not-install-tools-a-CMake-targets.patch \
            "
=20
 S =3D "${WORKDIR}/git"
@@ -63,7 +64,6 @@ do_configure:append() {
 do_install:append () {
     install -d ${D}${bindir}
     install -m755 winpr/tools/makecert-cli/winpr-makecert ${D}${bindir}
-    rm -rf ${D}${libdir}/cmake
     rm -rf ${D}${libdir}/freerdp
 }
=20
--=20
2.40.1


