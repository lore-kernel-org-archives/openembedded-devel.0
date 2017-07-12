Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5E770780FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 21:15:09 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q85so4577565pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=elBdy5jTYfWT386iAWi0DneH3YZubG0n4IYZcQsuCmc=;
	b=IgOJ2o/NLQiNx6FTL+6Sao2Y4mFOzzPUB5ezFtkxfJsfTjoJPRMehb6KIEoLX3BHg1
	S588Vedoxs/kx7hxcpgpIFI7w6KLPGTEtJHy04BEbPJ5HAqBON0KJYZwlE3J2X9lj8B+
	qiBcXX/C47/4aH9J7Pcktw37J+DMbFIds/V8qC/VafBjzOetfJyhu+eIwoBtdkkbv8pi
	VPqIbmDnZQ+dKY1omrHoPbQmjLBEIcYKtSEszU7O1NOTuCU+bG3nw0pzKlsFqQyNv0uI
	l3IcZpnG3EdwXPqrpgqjYPpHovOgvZAGaH0pJopFY41eFnHxO9nGR16kGA4P+HYOSOVx
	CvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=elBdy5jTYfWT386iAWi0DneH3YZubG0n4IYZcQsuCmc=;
	b=jCZ5J2fPBo9iAWFG67sS0FsTH0Jnf4LgmXhEa8z04ly1TDnPCNoyAiJzl+ObOoNxS/
	ygi5HednTXOuEKQUqd3SlhYvsruPFJWCPIrSBv5MoK1ZjVAo4XiXu/P0Fr+G1vUD+bR5
	qzislVqs+Uko3n9h9UBA9s6fqodCiI7N/yhTIcEaiOc2/nThOwwlt3t4GtDJqTK5Orkm
	/m7hxYsMCuaOxjyaZOMHbkIHw/g04+Myjpw4iZa9cREED40oBdMb5YXnrVSSEruwNnN5
	HrW7c76Ni8+ZiYWOb8lvOBMxgX99FJUJ4OwEe43xyKsbEM9vrylUeqMtE4ldaJcaIuQY
	S3Xg==
X-Gm-Message-State: AIVw110L5Z2lM435ye6hU6rpcwTkViFKhmvzakeojrLj/5RW4atumYIS
	rEkltMkcMjTc/p9B
X-Received: by 10.84.137.1 with SMTP id 1mr6078857plm.75.1499894111117;
	Wed, 12 Jul 2017 14:15:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id k18sm5923103pgf.5.2017.07.12.14.15.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 14:15:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:15:00 -0700
Message-Id: <20170712211501.45048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-qt5][PATCH 1/2] maliit-framework-qt5: Always have optimize flags
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
X-List-Received-Date: Wed, 12 Jul 2017 21:15:10 -0000

When building with hardening flags we need some optlevel > 0
enabled, otherwise FORTIFY_SOURCE wont work

Fixes
maliit-framework-qt5/0.99.0+git999-r0/recipe-sysroot/usr/include/features.h:376:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp
]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
|     ^~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ig.pri-Use-O1-optimization-in-DEBUG-flags.patch | 34 ++++++++++++++++++++++
 recipes-qt/maliit/maliit-framework-qt5_git.bb      |  8 ++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 recipes-qt/maliit/maliit-framework-qt5/0001-config.pri-Use-O1-optimization-in-DEBUG-flags.patch

diff --git a/recipes-qt/maliit/maliit-framework-qt5/0001-config.pri-Use-O1-optimization-in-DEBUG-flags.patch b/recipes-qt/maliit/maliit-framework-qt5/0001-config.pri-Use-O1-optimization-in-DEBUG-flags.patch
new file mode 100644
index 0000000..7356034
--- /dev/null
+++ b/recipes-qt/maliit/maliit-framework-qt5/0001-config.pri-Use-O1-optimization-in-DEBUG-flags.patch
@@ -0,0 +1,34 @@
+From cb38c078fa34a3d0cff6bc195edd9f507477d2e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 11:45:06 -0700
+Subject: [PATCH] config.pri: Use -O1 optimization in DEBUG flags
+
+when building wit FORTIFY_SOURCES we need some level of
+optimization turned on for the compile to succeed
+
+O1 is a good compromise between debug quality and
+optimization level.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.pri | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config.pri b/config.pri
+index 1505f9d..7cc196a 100644
+--- a/config.pri
++++ b/config.pri
+@@ -13,8 +13,8 @@ include(defines.pri)
+ # Linker optimization for release build
+ QMAKE_LFLAGS_RELEASE+=-Wl,--as-needed
+ # Compiler warnings are error if the build type is debug
+-QMAKE_CXXFLAGS_DEBUG+=-Werror -O0
+-QMAKE_CFLAGS_DEBUG+=-Werror -O0
++QMAKE_CXXFLAGS_DEBUG+=-Werror -O1
++QMAKE_CFLAGS_DEBUG+=-Werror -O1
+ 
+ OBJECTS_DIR = .obj
+ MOC_DIR = .moc
+-- 
+2.13.2
+
diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 62a7209..e0a0e0e 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 inherit qmake5 qmake5_paths
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
-    file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
-    file://maliit-server.desktop \
-"
+           file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
+           file://maliit-server.desktop \
+           file://0001-config.pri-Use-O1-optimization-in-DEBUG-flags.patch \
+           "
 
 SRCREV = "60b1b10de14f932420313c547ab801daf522d539"
 PV = "0.99.0+git${SRCPV}"
@@ -57,7 +58,6 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=enable-dbus-activation \
     CONFIG+=qt5-inputcontext \
 "
-
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
 do_install_append() {
-- 
2.13.2


