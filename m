Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EDEEE36B4
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 17:54:36 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51343.1770918868135382632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 09:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=JjQrFcVw;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A0018802F4;
	Thu, 12 Feb 2026 18:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1770918865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NKguWops62h8esxDBHaJTGvtmLNea7S9HOWMixEkd7k=;
	b=JjQrFcVwMvI0vRIZLfmpeLd0P/0HyV/BZE6v/10OH6FOYjKYLy4M9q4opNIizuoAx3V4UO
	MZFihZFX9HleqI/I78ARN1iHd+VkkFKSXXgqVmPQtSX0/piKpDUhaPGRj9FGr+6WTDSiK1
	vC2DAnM3jeZ0mj1czT1mp4eXy/+Dmk0T6PXL9n1QD45P5fU1eOqqGPSq0vFVSoS1EYrHrZ
	Km+F5vsWIpD6hx0qMJss8dMp2KO1hSgJ+ekgOFYuAKR4Jv51Rv2v91weR9NGd/6XAVBQdU
	dV/1pY6WRKaQGMN8bx2J1rWFR7fKF8tY5RoIPXnvI/nqQ36OWGDfIzKqG9W+0g==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-python][PATCH] python3-pybind11-json: fix Targets.cmake trying to reference host
Date: Thu, 12 Feb 2026 18:54:08 +0100
Message-ID: <20260212175408.146005-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 17:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124359

The resulting pybind11_jsonTargets.cmake in the dev-package adds an
absolute path to python include directories in the target properties:

  set_target_properties(pybind11_json PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "/usr/include/python3.13;${_IMPORT_PREF=
IX}/include"
  )

The patch removes ${PYTHON_INCLUDE_DIRS} which is set by pybind11 from
set_target_properties to remove the poisonous host path.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 ...p-PYTHON_INCLUDE_DIRS-from-interface.patch | 34 +++++++++++++++++++
 .../python/python3-pybind11-json_0.2.15.bb    |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-=
json/0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json/00=
01-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch b/meta-python=
/recipes-devtools/python/python3-pybind11-json/0001-CMakeLists-drop-PYTHO=
N_INCLUDE_DIRS-from-interface.patch
new file mode 100644
index 0000000000..e1bf82e506
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json/0001-CMak=
eLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch
@@ -0,0 +1,34 @@
+From 6d4af27d1b43860d8deb3d1d2b2a910e82618ac1 Mon Sep 17 00:00:00 2001
+From: Tafil Avdyli <tafil@tafhub.de>
+Date: Sat, 24 Jan 2026 09:14:03 +0100
+Subject: [PATCH] CMakeLists: drop PYTHON_INCLUDE_DIRS from interface
+
+Including PYTHON_INCLUDE_DIRS in the INTERFACE list caused a hard-coded
+Python include directory (e.g. /usr/include/python3.13) to appear in the
+generated Targets.cmake file. This resulted in a CMake configuration
+error when the path did not exist:
+
+    Imported target "pybind11_json" includes non-existent path
+      "/usr/include/python3.13"
+
+pybind11_json is header-only and does not use Python headers, so the
+include path should not be exported.
+
+Upstream-Status: Submitted [https://github.com/pybind/pybind11_json/pull=
/77]
+Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0be4838..4b305e4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -45,7 +45,6 @@ add_library(${PROJECT_NAME} INTERFACE)
+=20
+ target_include_directories(${PROJECT_NAME}
+                            INTERFACE
+-                           ${PYTHON_INCLUDE_DIRS}
+                            $<BUILD_INTERFACE:${PYBIND11_JSON_INCLUDE_DI=
R}>
+                            $<INSTALL_INTERFACE:include>)
+=20
diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.=
2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.1=
5.bb
index 8ad7dba76a..2a030af988 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0e25ff0ec476d0=
6d366439e1120cce98"
=20
 SRCREV =3D "32043f433ed987b2c2ce99d689ec337bcbd4ba95"
 SRC_URI =3D "git://github.com/pybind/pybind11_json;branch=3Dmaster;proto=
col=3Dhttps \
-           file://d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch"
+           file://d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch \
+           file://0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interfac=
e.patch"
=20
 DEPENDS +=3D "nlohmann-json python3-pybind11"
=20

