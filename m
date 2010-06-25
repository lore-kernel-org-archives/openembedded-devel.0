Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xZ-00067o-Ga
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:53 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2265411fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+CJv0Xu840znFmg1XQYC++QMDj47q0khuHdYX6bkqdA=;
	b=dYJ0HN0853i7eO/WQcgRVoK6xgiw2LX1SFUk1uqwbFhKU0Y1RzSQfIvfvF6dybrD7W
	31ruOCwvnFQBdq+ERh+nHhXk7r7lGWr6ZzU0bkscV+l3h2Qf7WJLw5zVWEJ3tvBBF7r3
	BU2opqSin4v0PYWOb3NXUUH51mGc9Z0dqxVyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KrT6hiRal3ySkbo7KNqsYuYbFohSNzSv7ov5BTnHYrN1AFKwwt8VerPcCijhmj6l1Z
	QDFsYOUd3ahRiGbdrJs9sdFI5m6WCcy/dXcF8/xIzMwAMGffwsNv9eSwS1oijrnbsd2L
	3mATLtU/nZGt9gqA4v7qEj62aTa2JQ2m9MI5Q=
Received: by 10.223.21.215 with SMTP id k23mr497977fab.54.1277468405146;
	Fri, 25 Jun 2010 05:20:05 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p21sm37834096fak.45.2010.06.25.05.20.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:38 +0200
Message-Id: <1277468383-16679-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/9] mesa-dri: remove old 7.0.3 and 6.5.2 relase using mesa-common-old.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/files/fix-progs-makefile.patch |   81 ---------------------------
 recipes/mesa/files/mklib-cross.patch        |   14 -----
 recipes/mesa/files/mklib-rpath-link.patch   |   20 -------
 recipes/mesa/mesa-common-old.inc            |   15 -----
 recipes/mesa/mesa-dri_6.5.2.bb              |   44 --------------
 recipes/mesa/mesa-dri_7.0.3.bb              |   45 ---------------
 6 files changed, 0 insertions(+), 219 deletions(-)
 delete mode 100644 recipes/mesa/files/fix-progs-makefile.patch
 delete mode 100644 recipes/mesa/files/mklib-cross.patch
 delete mode 100644 recipes/mesa/files/mklib-rpath-link.patch
 delete mode 100644 recipes/mesa/mesa-common-old.inc
 delete mode 100644 recipes/mesa/mesa-dri_6.5.2.bb
 delete mode 100644 recipes/mesa/mesa-dri_7.0.3.bb

diff --git a/recipes/mesa/files/fix-progs-makefile.patch b/recipes/mesa/files/fix-progs-makefile.patch
deleted file mode 100644
index f0a8293..0000000
--- a/recipes/mesa/files/fix-progs-makefile.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From e03daf13a562414f07230c17998edd39564b5f1b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 4 Mar 2010 14:16:27 +0100
-Subject: [PATCH] fix libs
-
----
- progs/demos/Makefile   |    2 +-
- progs/glsl/Makefile    |    2 +-
- progs/redbook/Makefile |    2 +-
- progs/samples/Makefile |    2 +-
- progs/xdemos/Makefile  |    2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/progs/demos/Makefile b/progs/demos/Makefile
-index 5b1d2a0..121b862 100644
---- a/progs/demos/Makefile
-+++ b/progs/demos/Makefile
-@@ -8,7 +8,7 @@ INCDIR = $(TOP)/include
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) \
- 	$(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) \
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lstdc++ \
- 	$(APP_LIB_DEPS)
- 
- PROGS = \
-diff --git a/progs/glsl/Makefile b/progs/glsl/Makefile
-index 3b5a595..836c4ac 100644
---- a/progs/glsl/Makefile
-+++ b/progs/glsl/Makefile
-@@ -10,7 +10,7 @@ LIB_DEP = \
- 	$(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) \
- 	$(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) \
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -lstdc++ \
- 	-l$(GL_LIB) $(APP_LIB_DEPS)
- 
- # using : to avoid APP_CC pointing to CC loop
-diff --git a/progs/redbook/Makefile b/progs/redbook/Makefile
-index b41e488..95ed746 100644
---- a/progs/redbook/Makefile
-+++ b/progs/redbook/Makefile
-@@ -7,7 +7,7 @@ INCDIR = $(TOP)/include
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
- 
- PROGS = aaindex \
- 	aapoly \
-diff --git a/progs/samples/Makefile b/progs/samples/Makefile
-index 64fa47a..9f72c8b 100644
---- a/progs/samples/Makefile
-+++ b/progs/samples/Makefile
-@@ -7,7 +7,7 @@ INCDIR = $(TOP)/include
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLEW_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
- 
- PROGS = accum bitmap1 bitmap2 blendeq blendxor copy cursor depth eval fog \
- 	font line logo nurb olympic overlay point prim rgbtoppm quad select \
-diff --git a/progs/xdemos/Makefile b/progs/xdemos/Makefile
-index f866a32..c0f4e06 100644
---- a/progs/xdemos/Makefile
-+++ b/progs/xdemos/Makefile
-@@ -11,7 +11,7 @@ LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME)
- # Add X11 and pthread libs to satisfy GNU gold.
- APP_LIB_DEPS += -lX11 -lpthread
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) -lstdc++ $(APP_LIB_DEPS)
- 
- PROGS = \
- 	corender \
--- 
-1.7.0
-
diff --git a/recipes/mesa/files/mklib-cross.patch b/recipes/mesa/files/mklib-cross.patch
deleted file mode 100644
index fbe86e3..0000000
--- a/recipes/mesa/files/mklib-cross.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- s/bin/mklib~	2008-02-19 15:30:18.000000000 +0000
-+++ s/bin/mklib	2008-07-27 11:15:25.000000000 +0100
-@@ -204,9 +204,9 @@
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=$CXX
-             else
--                LINK=gcc
-+                LINK=$CC
-             fi
- 	fi
- 
diff --git a/recipes/mesa/files/mklib-rpath-link.patch b/recipes/mesa/files/mklib-rpath-link.patch
deleted file mode 100644
index 07361f5..0000000
--- a/recipes/mesa/files/mklib-rpath-link.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- Mesa/bin/mklib.orig	2006-06-04 20:56:22.000000000 -0600
-+++ Mesa/bin/mklib	2006-06-04 20:57:04.000000000 -0600
-@@ -98,6 +98,9 @@
- 	-L*)
- 	    DEPS="$DEPS $1"
- 	    ;;
-+	-Wl*)
-+	    DEPS="$DEPS $1"
-+	    ;;
- 	'-cplusplus')
- 	    CPLUSPLUS=1
- 	    ;;
---- Mesa/configs/default.orig	2006-06-04 21:01:47.000000000 -0600
-+++ Mesa/configs/default	2006-06-04 21:01:16.000000000 -0600
-@@ -71,4 +71,4 @@
- GLU_LIB_DEPS = -L$(LIB_DIR) -l$(GL_LIB) -lm
- GLUT_LIB_DEPS = -L$(LIB_DIR) -l$(GLU_LIB) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lX11 -lXmu -lXt -lXi -lm
- GLW_LIB_DEPS = -L$(LIB_DIR) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lXt -lX11
--APP_LIB_DEPS = -L$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lm
-+APP_LIB_DEPS = -L$(LIB_DIR) $(EXTRA_LIB_PATH) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lm
diff --git a/recipes/mesa/mesa-common-old.inc b/recipes/mesa/mesa-common-old.inc
deleted file mode 100644
index 01f0adc..0000000
--- a/recipes/mesa/mesa-common-old.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SECTION = "x11"
-PE = "2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
-	file://mklib-rpath-link.patch"
-
-S = "${WORKDIR}/Mesa-${PV}"
-
-PROVIDES = "virtual/libgl"
-
-LICENSE = "LGPL"
-
-INC_PR = "r3"
-
-DEPENDS = "makedepend-native xf86vidmodeproto glproto virtual/libx11 libxext libxxf86vm libxi libxmu libice"
diff --git a/recipes/mesa/mesa-dri_6.5.2.bb b/recipes/mesa/mesa-dri_6.5.2.bb
deleted file mode 100644
index d8f9506..0000000
--- a/recipes/mesa/mesa-dri_6.5.2.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-include mesa-common-old.inc
-
-SRC_URI += " file://mklib-cross.patch"
-
-FILESPATHPKG =. "mesa-${PV}:"
-
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-PR = "${INC_PR}.1"
-
-DEPENDS += "libdrm"
-# DRI is useless without the kernel drivers
-RRECOMMENDS_${PN} += " kernel-module-drm kernel-module-radeon "
-
-do_configure() {
-	cd configs
-
-	ln -sf linux-dri current
-	sed -e "s%CC *= *.*%CC = ${CC}%" -i current
-	sed -e "s%CXX *= *.*%CXX = ${CXX}%" -i current
-	sed -e "s%LD *= *.*%LD = ${LD}%" -i current
-	sed -e "s%OPT_FLAGS *= *.*%OPT_FLAGS = ${TARGET_CFLAGS}%" -i current
-	sed -e "s%X11_INCLUDES *= *.*%X11_INCLUDES = -I${STAGING_INCDIR}/X11%" -i current
-	sed -e "s%EXTRA_LIB_PATH *= *.*%EXTRA_LIB_PATH = ${LDFLAGS}%" -i current
-	sed -i s:\$\(CC\):gcc:g  ../src/mesa/x86/Makefile
-	echo "SRC_DIRS = mesa" >> current
-	echo "DRI_DRIVER_INSTALL_DIR = ${D}${libdir}/dri" >> current
-}
-
-do_install() {
-	oe_runmake -C src/mesa/drivers/dri install
-}
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug"
-
-python populate_packages_prepend () {
-        import re, os.path
-
-        do_split_packages(d, root=bb.data.expand('${libdir}/dri', d), file_regex='(.*)_dri\.so', output_pattern='mesa-dri-driver-%s', description='%s DRI driver', extra_depends='')
-}
-
-
-SRC_URI[md5sum] = "e4d894181f1859651658b3704633e10d"
-SRC_URI[sha256sum] = "137f50a30461d51eb9af5aac737bc788d536354cf47b26129b97bde6e41fb85f"
diff --git a/recipes/mesa/mesa-dri_7.0.3.bb b/recipes/mesa/mesa-dri_7.0.3.bb
deleted file mode 100644
index dcf6fd3..0000000
--- a/recipes/mesa/mesa-dri_7.0.3.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-include mesa-common-old.inc
-
-# suppress mklib-rpath-link patch from mesa-common
-SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 file://mklib-cross.patch"
-
-FILESPATHPKG =. "mesa-${PV}:"
-
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-PR = "${INC_PR}.1"
-
-DEPENDS += "libdrm"
-# DRI is useless without the kernel drivers
-RRECOMMENDS_${PN} += " kernel-module-drm kernel-module-radeon "
-
-do_configure() {
-	cd configs
-
-	ln -sf linux-dri current
-	sed -e "s%CC *= *.*%CC = ${CC}%" -i current
-	sed -e "s%CXX *= *.*%CXX = ${CXX}%" -i current
-	sed -e "s%LD *= *.*%LD = ${LD}%" -i current
-	sed -e "s%OPT_FLAGS *= *.*%OPT_FLAGS = ${TARGET_CFLAGS}%" -i current
-	sed -e "s%X11_INCLUDES *= *.*%X11_INCLUDES = -I${STAGING_INCDIR}/X11%" -i current
-	sed -e "s%EXTRA_LIB_PATH *= *.*%EXTRA_LIB_PATH = ${LDFLAGS}%" -i current
-	sed -i s:\$\(CC\):gcc:g  ../src/mesa/x86/Makefile
-	echo "SRC_DIRS = mesa" >> current
-	echo "DRI_DRIVER_INSTALL_DIR = ${D}${libdir}/dri" >> current
-}
-
-do_install() {
-	oe_runmake -C src/mesa/drivers/dri install
-}
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug"
-
-python populate_packages_prepend () {
-        import re, os.path
-
-        do_split_packages(d, root=bb.data.expand('${libdir}/dri', d), file_regex='(.*)_dri\.so', output_pattern='mesa-dri-driver-%s', description='%s DRI driver', extra_depends='')
-}
-
-
-SRC_URI[md5sum] = "e6e6379d7793af40a6bc3ce1bace572e"
-SRC_URI[sha256sum] = "ebdf3448eac8abb56bbfc0b7c015efce8e5d88f10ee3123dcc62c1ff47b62d22"
-- 
1.7.0.2



