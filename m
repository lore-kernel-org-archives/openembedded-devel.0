Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EEFE9A059
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 18:29:56 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20688.1771525794114480790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 10:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=NvQV5IVV;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C2531880265;
	Thu, 19 Feb 2026 19:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1771525791; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=u/atkwz3N2TeetWHsfCZrrl12BYv3P9mhjmn3tFC7y4=;
	b=NvQV5IVV8eiUyAe2daw116j7cxqNQ9mC9jKEzozCa6SXWK9lZJoM4RlpMnEACemTvWfHn6
	MU+2sKwozgqDNJ6buvp+850PtH7IdeQJMU7Q34JTVhRS/LwFZreaNsZzcSu/XCHBOKvJTu
	JWIjN5fMOipYGtaOkBDRxXYKtdjKPO0++eC4Qtit2N6t0AA61nQzjxnTLxe+OIsVfZguSM
	Y6IcBIgDvjSW50FI2AdgIiZRu64Wog/YjLedJl1x/It3xVVAt7Bji8RKaxCYZdrcQQ/8BD
	A+nH7NgktbhGB/6ZqkYJm5g9xseAf4vjUFUlOchhDzU3qdwokwMUs2UgNiDahw==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH] python3-pybind11-json: fix Targets.cmake trying to reference host
Date: Thu, 19 Feb 2026 19:29:18 +0100
Message-ID: <20260219182918.970549-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 18:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124512

The resulting pybind11_jsonTargets.cmake in the dev-package adds an
absolute path to python include directories in the target properties:

  set_target_properties(pybind11_json PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "/usr/include/python3.13;${_IMPORT_PREF=
IX}/include"
  )

The patch removes ${PYTHON_INCLUDE_DIRS} which is set by pybind11 from
set_target_properties to remove the poisonous host path.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0332dae9bb2ff79e4a4faa45c42d96e0dccee4db)
Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 ...p-PYTHON_INCLUDE_DIRS-from-interface.patch | 34 +++++++++++++++++++
 .../python/python3-pybind11-json_0.2.13.bb    |  3 +-
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
2.13.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.1=
3.bb
index 67bd2a33a7..e348168b8d 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.13.bb
@@ -3,7 +3,8 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0e25ff0ec476d06d366439e1120cc=
e98"
=20
 SRCREV =3D "b02a2ad597d224c3faee1f05a56d81d4c4453092"
-SRC_URI =3D "git://github.com/pybind/pybind11_json;branch=3Dmaster;proto=
col=3Dhttps"
+SRC_URI =3D "git://github.com/pybind/pybind11_json;branch=3Dmaster;proto=
col=3Dhttps \
+           file://0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interfac=
e.patch"
=20
 DEPENDS +=3D "nlohmann-json python3-pybind11"
=20

