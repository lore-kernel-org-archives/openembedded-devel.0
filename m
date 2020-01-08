Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC807FF54
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 17:11:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y17so4230705wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eI5eRZaUo3dgM8CwI2KqwEjJtbTkdMH6pN5Zz2vxmc4=;
	b=FeLbNDnVabASMElr0HJMrdd9TAPrIkconBxpx1G7SrAwXBOSWivzEWkyVg4Cel4Hzw
	rpIZOFQr5nXPuSLhRVqr0QTRkioltEPGeAifBnibxHeOu61jhIsacYItjpRl6K0yMwYf
	Nwh8Qp23XupymuAbS3bcbNzEp3rVN0kcXXNzHqCPDQBX1f4To8vpvXg9Cc4k3eoMcKyy
	HQQvSAPzyYgRZl+IzgAUiHolcZLuCo5KRsuRGr/XU7akBx/5SSz8cCwc47tOeWNxRkD+
	IoDgwI+nNQvSIW2Yeyj2NsBYwvL2CUITN9xQmAtnFRppg7pOp2sXi3J9KmzA0yvVrbZq
	QXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eI5eRZaUo3dgM8CwI2KqwEjJtbTkdMH6pN5Zz2vxmc4=;
	b=bD61cuEeqFew6cnTT6oRdguLHsAchmD3t1cpv3THFtllw3IVzTFIgDBN2CfrjjUrj4
	CxICHTAiAL+zk6D4mDBDjVyfC5aKcjW0Sm0bHX/tNqEdyoi7a6EonV9I/mPjj1hpgJx7
	yV3hjz3wgdRTRnL5GoMnz4+rG1wwEqxm8Rtj4Rv/h7Tb+HdA3pkUAX4ndQ43ilagqhXr
	wzL/sWFV622F4oANz9cic/1yYloe510OtyxKLCeXgJB5QgNr3P0zNZ+W4fILWeuoPGFT
	vN5OmBW8oSJW3KJD19mc5IMgXEifhYoza6wUMu3r9QuhkmnM5TAgvEjbh54KK0IEJYit
	Jxpg==
X-Gm-Message-State: APjAAAVjeIyKnc9Z79mMpPwv8oVDi9IFFFaHWKJVgL52HMxzEtGPkeZU
	csM8FDS8K0bzOr8H03UO5snCLRo8TmY=
X-Google-Smtp-Source: APXvYqzzuCQZHu2X35w8/xb4Aqz54YI83w6fNccct6KNoX7UrpqQMm9tbVgIimeto5Cl0IyzyZ0Wig==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr5648810wrt.229.1578503487446; 
	Wed, 08 Jan 2020 09:11:27 -0800 (PST)
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:51ed:b4fa:d66:b069])
	by smtp.gmail.com with ESMTPSA id
	s10sm4897970wrw.12.2020.01.08.09.11.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 09:11:26 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 18:11:10 +0100
Message-Id: <20200108171110.24095-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] websocketpp: add various upstream accepted and proposed patches to fix various issues, including:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jan 2020 17:11:27 -0000

- build failure with boost 1.71
- bad installation of header files correct version on some OSes.
- fix version minor number

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../websocketpp/websocketpp-0.8.1/771.patch   | 22 ++++++++++++++
 .../websocketpp/websocketpp-0.8.1/842.patch   | 30 +++++++++++++++++++
 .../websocketpp/websocketpp-0.8.1/855.patch   | 23 ++++++++++++++
 .../websocketpp/websocketpp_0.8.1.bb          |  5 ++++
 4 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
 create mode 100644 meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
new file mode 100644
index 000000000..bc65efb7d
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/771.patch
@@ -0,0 +1,22 @@
+From 4bccfb04a264704ec9b80ba332ee1cf113ce7f1b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
+Date: Thu, 1 Nov 2018 20:58:10 +0100
+Subject: [PATCH] Update version number in CMakeLists.txt to 0.8.1
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2786aba9..2d13117b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -24,7 +24,7 @@ endif ()
+ ############ Project name and version
+ set (WEBSOCKETPP_MAJOR_VERSION 0)
+ set (WEBSOCKETPP_MINOR_VERSION 8)
+-set (WEBSOCKETPP_PATCH_VERSION 0)
++set (WEBSOCKETPP_PATCH_VERSION 1)
+ set (WEBSOCKETPP_VERSION ${WEBSOCKETPP_MAJOR_VERSION}.${WEBSOCKETPP_MINOR_VERSION}.${WEBSOCKETPP_PATCH_VERSION})
+ 
+ if(POLICY CMP0048)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
new file mode 100644
index 000000000..c3651e94a
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/842.patch
@@ -0,0 +1,30 @@
+From 7f7e2be01b4fa6580ce27f668e61adf37853ad67 Mon Sep 17 00:00:00 2001
+From: Schrijvers Luc <begasus@gmail.com>
+Date: Wed, 18 Sep 2019 11:35:43 +0200
+Subject: [PATCH] Fix "include" directory installation. the variable
+ INSTALL_INCLUDE_DIR already exists, and defaults to include if not
+ specificied otherwise. Using it allows people to customize the installation
+ from outside, fixing issues with other OS like Haiku
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
+---
+ cmake/CMakeHelpers.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/CMakeHelpers.cmake b/cmake/CMakeHelpers.cmake
+index 1478f4b..f603632 100644
+--- a/cmake/CMakeHelpers.cmake
++++ b/cmake/CMakeHelpers.cmake
+@@ -80,7 +80,7 @@ macro (final_target)
+     endif ()
+ 
+     install (DIRECTORY ${CMAKE_SOURCE_DIR}/${TARGET_NAME}
+-             DESTINATION include/
++             DESTINATION ${INSTALL_INCLUDE_DIR}/
+              FILES_MATCHING PATTERN "*.hpp*")
+ endmacro ()
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
new file mode 100644
index 000000000..e44a21c9f
--- /dev/null
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.1/855.patch
@@ -0,0 +1,23 @@
+From 3590d77bb9753fbbf076028e2395182ced6466ba Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 8 Jan 2020 17:59:48 +0100
+Subject: [PATCH] Fix cmake find boost with version >= 1.71
+
+For some reasons "system;thread;random;unit_test_framework" was seen as a single module, because of the quotes.
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2d13117b..9a46bc10 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -211,7 +211,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+     set (Boost_USE_MULTITHREADED TRUE)
+     set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
+ 
+-    find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")
++    find_package (Boost 1.39.0 COMPONENTS ${WEBSOCKETPP_BOOST_LIBS})
+ 
+     if (Boost_FOUND)
+         # Boost is a project wide global dependency.
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
index 05f14d2f4..ba3b5a1b0 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.1.bb
@@ -9,8 +9,13 @@ SRC_URI = "git://github.com/zaphoyd/websocketpp.git;protocol=https \
            file://0001-Replace-make_shared-with-new-in-some-cases.patch \
            file://0002-Fix-missed-entries-fix-testing.patch \
            file://0001-cmake-Use-GNUInstallDirs.patch \
+           file://842.patch \
+           file://771.patch \
+           file://855.patch \
           "
 
+EXTRA_OECMAKE = "-DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON"
+
 # tag 0.8.1
 SRCREV= "c6d7e295bf5a0ab9b5f896720cc1a0e0fdc397a7"
 
-- 
2.17.1


