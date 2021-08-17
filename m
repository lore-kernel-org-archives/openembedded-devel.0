Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mx.groups.io with SMTP id smtpd.web08.37560.1629198283834849968
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 04:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ozlabs.org header.s=201707 header.b=MGqmFI5A;
 spf=pass (domain: ozlabs.org, ip: 203.11.71.1, mailfrom: anton@ozlabs.org)
Received: by ozlabs.org (Postfix, from userid 1010)
	id 4Gpp873vzpz9sRK; Tue, 17 Aug 2021 21:04:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1629198279;
	bh=+BTXblez5NG8ykZEho8VBzCMtOKS8p/mq90lo1oZdUM=;
	h=From:To:Subject:Date:From;
	b=MGqmFI5A1uMeuERsHTw/3oJFZWz9V2Qorkem7gOmFMUxSGMzl5utQ7eb9LsIFEtd/
	 7D1Yqpv3OQZ5pOjbcwmct5PlA+do7dPyEJwlLn7452mmVqPBk2f6vzykuc2nukEqe4
	 CrhKAX57AB44IzYU3NhJgCjJdb+oQDs636n4ygg9uWb60fmhZ5imBjVyEytKt7tzE+
	 I1hpkRPNkHK0AqauDf02EkIKMzTl4b8r0EllG1ejUTA5hbjXgFNW81rRIXKCL1TlSW
	 necSASe1XOy/zuIjrEuGUKnrutX7prpy81BI9RsvH00s/QsTqvI/hoVKY3LBIw14Sr
	 6VvilYRtlnqhg==
From: "Anton Blanchard" <anton@ozlabs.org>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] cereal: Use GNUInstallDirs instead of hard wiring install directories
Date: Tue, 17 Aug 2021 21:04:37 +1000
Message-Id: <20210817110437.605381-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On a multilib setup cmake files should go into lib64.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 ...rs-instead-of-hard-wiring-install-di.patch | 37 +++++++++++++++++++
 .../libcereal/libcereal_1.3.0.bb              |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libcereal/libcereal/0001-Use-=
GNUInstallDirs-instead-of-hard-wiring-install-di.patch

diff --git a/meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInst=
allDirs-instead-of-hard-wiring-install-di.patch b/meta-oe/recipes-support=
/libcereal/libcereal/0001-Use-GNUInstallDirs-instead-of-hard-wiring-insta=
ll-di.patch
new file mode 100644
index 000000000..93114dadd
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInstallDirs=
-instead-of-hard-wiring-install-di.patch
@@ -0,0 +1,37 @@
+From c9e60ed064aa2938f71f2cacf79f0bb337812bf8 Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@ozlabs.org>
+Date: Tue, 17 Aug 2021 09:32:43 +1000
+Subject: [PATCH] Use GNUInstallDirs instead of hard wiring install direc=
tories
+
+On a multilib setup cmake files should go into lib64.
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/710]
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b97c1f59..ad574290 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,14 +70,15 @@ endif()
+=20
+ option(CEREAL_INSTALL "Generate the install target" ${CEREAL_MASTER_PRO=
JECT})
+ if(CEREAL_INSTALL)
++    include(GNUInstallDirs)
+     include(CMakePackageConfigHelpers)
+=20
+     install(TARGETS cereal EXPORT ${PROJECT_NAME}Targets)
+-    install(DIRECTORY include/cereal DESTINATION include)
++    install(DIRECTORY include/cereal DESTINATION ${CMAKE_INSTALL_INCLUD=
EDIR})
+=20
+     set(configFile ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cm=
ake)
+     set(versionFile ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVe=
rsion.cmake)
+-    set(configInstallDestination lib/cmake/${PROJECT_NAME})
++    set(configInstallDestination ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJEC=
T_NAME})
+=20
+     configure_package_config_file(
+         ${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
+--=20
+2.31.1
+
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 26b27fa6e..6498bb367 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -16,7 +16,9 @@ PROVIDES +=3D "${PN}-dev"
=20
 PV .=3D "+git${SRCPV}"
 SRCREV =3D "64f50dbd5cecdaba785217e2b0aeea3a4f1cdfab"
-SRC_URI =3D "git://github.com/USCiLab/cereal.git"
+SRC_URI =3D "git://github.com/USCiLab/cereal.git \
+           file://0001-Use-GNUInstallDirs-instead-of-hard-wiring-install=
-di.patch \
+           "
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.31.1

