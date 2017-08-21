Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B67F3782DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:01:25 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f8so14397124wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OfWpybptdpMbD5BwoRRMqg+0hBEFidy5O4ZhkTWqlx4=;
	b=o6FC5MR5DtwkbQtQM/L7uKNBjNzSJ//wVmhin/Th9jex4nflRP0E1CL/pRnhxfmmJe
	0OOMhbL/9pGfvrNpmNwBpFZHgytFr0rHENrRkDQzvqNs+2OQ4CCaB3ZzuCvnXoR/gAVn
	dzPpm0Ft7H4jLFIdwIcNB+XE1Tb0cjmlAng8parq9TpmLTeKAFm6NBZeZtv5aenD1BBF
	ghTneohY33pJwWn8vmuvKoD+odH3SiT5smie6OVTeJzlGZos1obmWZlSIc3VXBeaMES0
	t1dWtB37PJlOYpWbh4Zh1h1eYb62/jH+1N/QCJQHvFRd1FkTmYD31jogfAdTtbf1Gq7l
	L3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OfWpybptdpMbD5BwoRRMqg+0hBEFidy5O4ZhkTWqlx4=;
	b=TuB+MN945FqoFjUiwfrN+97CzgIe1DK87FRGb1vQ/98gQ+OAxI3tlYnzjhMxx01bN8
	si4R/yf7roJPQciq3USq/TPiz/XA4Gwm0lynrcdtK6dT/1cOFjPSaLyI3AxgyfbJp/Sd
	eucJmg/yrghAj+xLtuM0MCPULCuqiR7PsvHXGL5gNNmyInm+z2+gTTH9mGAf4ZNtXLWm
	r15YSwuhJkJ0pDR98cooURCuxMniXtPLDjE7wwbUH2r+hWK+HaX+xzAZBWz1xgTSxrJr
	pP09tBwUayeDo/wqcT9S2pebcwX5oVyxzVJXC+9JE31ALEK/vum3ICTpjpr6ronGBxiO
	U9fg==
X-Gm-Message-State: AHYfb5jeyFEUOTKBvXQLYtNP5SI4Q/qhsaJ+tfomS1TcZJCHQO8okM8O
	7ooYEbH/2hxblpVs
X-Received: by 10.223.134.26 with SMTP id 26mr7957009wrv.184.1503349286602;
	Mon, 21 Aug 2017 14:01:26 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p197sm1200098wmg.19.2017.08.21.14.01.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 14:01:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 23:02:59 +0200
Message-Id: <20170821210259.20276-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821210259.20276-1-Martin.Jansa@gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 7/7] qtwebengine: update 0004-Force-host-toolchain-configuration.patch
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
X-List-Received-Date: Mon, 21 Aug 2017 21:01:26 -0000

* refresh the patch from:
  http://code.qt.io/cgit/yocto/meta-qt5.git/diff/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patch?id=5bac910f95453d0df6fe540778dd16a9707dcabf

* might fix passing arm specific flags into host builds like:
  gcc: error: unrecognized command line option '-mflooat-abi=hard'
  strip: unable to recognise the format of the input file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0004-Force-host-toolchain-configuration.patch  | 35 +++++++++++++++++++---
 ...qtbug-61521.cpp-use-free-instead-of-cfree.patch |  2 +-
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
index 258afd5..bda0ba1 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 5106be504b7edb7bc75309d581dfd33a89ed04fc Mon Sep 17 00:00:00 2001
+From 9bdd03ad0bbb221ad7bffe0e570605c21c28b1b5 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -6,16 +6,30 @@ Subject: [PATCH] Force host toolchain configuration
 Force gcc/g++ to be used for parts using host toolchain, since
 the option(host_build) does not work in yocto builds.
 
+Don't use QT_ARCH for the host architecture, since that's always
+the target architecture in bitbake builds, instead ask specifically
+for the qmakes's host architecture.
+
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
 ---
- src/buildtools/configure_host.pro | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
+ src/buildtools/configure_host.pro | 14 +++++++-------
+ src/core/config/linux.pri         |  2 +-
+ 2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
-index f1b3d47b..521c507b 100644
+index f1b3d47b..12123729 100644
 --- a/src/buildtools/configure_host.pro
 +++ b/src/buildtools/configure_host.pro
+@@ -4,7 +4,7 @@ TEMPLATE = aux
+ # Pick up the host toolchain
+ option(host_build)
+ 
+-GN_HOST_CPU = $$gnArch($$QT_ARCH)
++GN_HOST_CPU = $$gnArch($$QMAKE_HOST.arch)
+ !isEmpty(QT_TARGET_ARCH): GN_TARGET_CPU = $$gnArch($$QT_TARGET_ARCH)
+ else: GN_TARGET_CPU = $$GN_HOST_CPU
+ GN_OS = $$gnOS()
 @@ -29,9 +29,9 @@ GN_CONTENTS = \
  "import(\"//build/config/sysroot.gni\")" \
  "import(\"//build/toolchain/gcc_toolchain.gni\")" \
@@ -42,3 +56,16 @@ index f1b3d47b..521c507b 100644
  "  ar = \"$$which(ar)\" " \
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
+diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
+index 714c864d..f66ca551 100644
+--- a/src/core/config/linux.pri
++++ b/src/core/config/linux.pri
+@@ -98,7 +98,7 @@ contains(QT_ARCH, "mips"):!host_build {
+ 
+ host_build {
+     gn_args += custom_toolchain=\"$$QTWEBENGINE_OUT_ROOT/src/toolchain:host\"
+-    GN_HOST_CPU = $$gnArch($$QT_ARCH)
++    GN_HOST_CPU = $$gnArch($$QMAKE_HOST.arch)
+     gn_args += host_cpu=\"$$GN_HOST_CPU\"
+     # Don't bother trying to use system libraries in this case
+     gn_args += use_glib=false
diff --git a/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch b/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
index 7375ff7..d8d89b8 100644
--- a/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
@@ -1,4 +1,4 @@
-From b4eb5c926cf822ee5d5cf398d1bcdb0fdca6e47a Mon Sep 17 00:00:00 2001
+From 331de4be615b8552e498ac2f3deff4b49b4b0fc0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sun, 20 Aug 2017 20:37:38 +0200
 Subject: [PATCH] qtbug-61521.cpp: use free instead of cfree
-- 
2.14.1


