Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xZ-00067m-CN
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:26:21 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2265410fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=YUYtR5O7mFE0uUd/9i081mGTKg/yo6VJRMkL3K38Tss=;
	b=V7gCc/Iz+JTfi+r2KJMFCBtfB2x3D1QKIrPHOOfi5sZX/HDWdYgWW4t9YZLnqLaFaH
	NcZmuU0QJCcHisq0kMkJHy6iPRso4fod9UNzDykgQRlbVxSt42wblnkaUyPYBWQfJkjZ
	dSSC4qwk/LINnSp3nshsjPMAsWTK+flvzmrGs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GKpxQzlYGiTKqt8NaFpQTBuf6pv68W1lc1kclQSpyXlx9X3T5qBImKLO1PQdv3KZIg
	WSjBzJ0bDFyHRp4ZW7/PplUuK+hg7ICCS2b2aVCGafoq0qxHdVMJ2i4f0jChPokNmhsI
	DGMRhCpdt0q17/fzepIRPazEYyWgMXLaAYq1U=
Received: by 10.223.103.202 with SMTP id l10mr503981fao.33.1277468404068;
	Fri, 25 Jun 2010 05:20:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e10sm37872229fak.14.2010.06.25.05.20.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:37 +0200
Message-Id: <1277468383-16679-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/9] mesa: remove old releases 6.5.2, 7.0.2 using mesa-mesa.inc
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
 recipes/mesa/mesa-6.5.2/fix-host-compile.patch     |   30 ---------
 recipes/mesa/mesa-6.5.2/mklib-rpath-link.patch     |   23 -------
 recipes/mesa/mesa-7.0.2/fix-host-compile.patch     |   30 ---------
 recipes/mesa/mesa-7.0.2/mklib-rpath-link.patch     |   23 -------
 .../mesa/mesa-full-7.0.2/fix-host-compile.patch    |   30 ---------
 .../mesa/mesa-full-7.0.2/fix-progs-makefile.patch  |   65 --------------------
 .../mesa/mesa-full-7.0.2/mklib-rpath-link.patch    |   23 -------
 recipes/mesa/mesa-full_7.0.2.bb                    |   27 --------
 recipes/mesa/mesa-mesa.inc                         |   41 ------------
 recipes/mesa/mesa_6.5.2.bb                         |    8 ---
 recipes/mesa/mesa_7.0.2.bb                         |    8 ---
 11 files changed, 0 insertions(+), 308 deletions(-)
 delete mode 100644 recipes/mesa/mesa-6.5.2/fix-host-compile.patch
 delete mode 100644 recipes/mesa/mesa-6.5.2/mklib-rpath-link.patch
 delete mode 100644 recipes/mesa/mesa-7.0.2/fix-host-compile.patch
 delete mode 100644 recipes/mesa/mesa-7.0.2/mklib-rpath-link.patch
 delete mode 100644 recipes/mesa/mesa-full-7.0.2/fix-host-compile.patch
 delete mode 100644 recipes/mesa/mesa-full-7.0.2/fix-progs-makefile.patch
 delete mode 100644 recipes/mesa/mesa-full-7.0.2/mklib-rpath-link.patch
 delete mode 100644 recipes/mesa/mesa-full_7.0.2.bb
 delete mode 100644 recipes/mesa/mesa-mesa.inc
 delete mode 100644 recipes/mesa/mesa_6.5.2.bb
 delete mode 100644 recipes/mesa/mesa_7.0.2.bb

diff --git a/recipes/mesa/mesa-6.5.2/fix-host-compile.patch b/recipes/mesa/mesa-6.5.2/fix-host-compile.patch
deleted file mode 100644
index d24d03d..0000000
--- a/recipes/mesa/mesa-6.5.2/fix-host-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- /src/mesa/x86/orig-Makefile	2005-07-01 04:54:38.000000000 +0300
-+++ /src/mesa/x86/Makefile	2007-06-07 21:52:31.000000000 +0300
-@@ -5,6 +5,7 @@
- 
- 
- INCLUDE_DIRS = \
-+        -I/usr/include \
- 	-I$(TOP)/include/GL \
- 	-I$(TOP)/include \
- 	-I.. \
-@@ -13,6 +14,10 @@
- 	-I../glapi \
- 	-I../tnl
- 
-+OPT_FLAGS_host = -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-+
-+CFLAGS_host = -Wall -Wmissing-prototypes $(OPT_FLAGS_host) $(PIC_FLAGS) $(ARCH_FLAGS) \
-+        $(DEFINES) $(ASM_FLAGS) $(X11_INCLUDES) -std=c99 -ffast-math
- 
- default: gen_matypes matypes.h
- 
-@@ -21,7 +26,7 @@
- 
- 
- gen_matypes: gen_matypes.c
--	$(CC) $(INCLUDE_DIRS) $(CFLAGS) gen_matypes.c -o gen_matypes
-+	$(CC) $(INCLUDE_DIRS) $(CFLAGS_host) gen_matypes.c -o gen_matypes
- 
- # need some special rules here, unfortunately
- matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
diff --git a/recipes/mesa/mesa-6.5.2/mklib-rpath-link.patch b/recipes/mesa/mesa-6.5.2/mklib-rpath-link.patch
deleted file mode 100644
index e59513a..0000000
--- a/recipes/mesa/mesa-6.5.2/mklib-rpath-link.patch
+++ /dev/null
@@ -1,23 +0,0 @@
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
---- Mesa-6.5.2/configs/default.old	2007-01-26 11:49:32.000000000 +0000
-+++ Mesa-6.5.2/configs/default	2007-01-26 11:49:49.000000000 +0000
-@@ -73,7 +73,7 @@
- GLU_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) -lm
- GLUT_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GLU_LIB) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lX11 -lXmu -lXt -lXi -lm
- GLW_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lXt -lX11
--APP_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lm
-+APP_LIB_DEPS = -L$(TOP)/$(LIB_DIR) $(EXTRA_LIB_PATH) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) -lm
- 
- 
- 
diff --git a/recipes/mesa/mesa-7.0.2/fix-host-compile.patch b/recipes/mesa/mesa-7.0.2/fix-host-compile.patch
deleted file mode 100644
index d24d03d..0000000
--- a/recipes/mesa/mesa-7.0.2/fix-host-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- /src/mesa/x86/orig-Makefile	2005-07-01 04:54:38.000000000 +0300
-+++ /src/mesa/x86/Makefile	2007-06-07 21:52:31.000000000 +0300
-@@ -5,6 +5,7 @@
- 
- 
- INCLUDE_DIRS = \
-+        -I/usr/include \
- 	-I$(TOP)/include/GL \
- 	-I$(TOP)/include \
- 	-I.. \
-@@ -13,6 +14,10 @@
- 	-I../glapi \
- 	-I../tnl
- 
-+OPT_FLAGS_host = -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-+
-+CFLAGS_host = -Wall -Wmissing-prototypes $(OPT_FLAGS_host) $(PIC_FLAGS) $(ARCH_FLAGS) \
-+        $(DEFINES) $(ASM_FLAGS) $(X11_INCLUDES) -std=c99 -ffast-math
- 
- default: gen_matypes matypes.h
- 
-@@ -21,7 +26,7 @@
- 
- 
- gen_matypes: gen_matypes.c
--	$(CC) $(INCLUDE_DIRS) $(CFLAGS) gen_matypes.c -o gen_matypes
-+	$(CC) $(INCLUDE_DIRS) $(CFLAGS_host) gen_matypes.c -o gen_matypes
- 
- # need some special rules here, unfortunately
- matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
diff --git a/recipes/mesa/mesa-7.0.2/mklib-rpath-link.patch b/recipes/mesa/mesa-7.0.2/mklib-rpath-link.patch
deleted file mode 100644
index 618f5b5..0000000
--- a/recipes/mesa/mesa-7.0.2/mklib-rpath-link.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- /tmp/mklib	2007-12-08 11:03:23.000000000 +0100
-+++ Mesa-7.0.2/bin/mklib	2007-12-08 11:04:02.509863000 +0100
-@@ -106,6 +106,9 @@
- 	-L*)
- 	    DEPS="$DEPS $1"
- 	    ;;
-+        -Wl*)
-+            DEPS="$DEPS $1"
-+            ;;
- 	-pthread)
- 	    # this is a special case (see bugzilla 10876)
- 	    DEPS="$DEPS $1"
---- /tmp/default	2007-12-08 11:04:17.000000000 +0100
-+++ Mesa-7.0.2/configs/default	2007-12-08 11:05:06.279863000 +0100
-@@ -76,7 +76,7 @@
- GLW_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lXt -lX11
- 
- # Program dependencies - specific GL/glut libraries added in Makefiles
--APP_LIB_DEPS = -lm
-+APP_LIB_DEPS = $(EXTRA_LIB_PATH) -lm
- 
- 
- 
diff --git a/recipes/mesa/mesa-full-7.0.2/fix-host-compile.patch b/recipes/mesa/mesa-full-7.0.2/fix-host-compile.patch
deleted file mode 100644
index d24d03d..0000000
--- a/recipes/mesa/mesa-full-7.0.2/fix-host-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- /src/mesa/x86/orig-Makefile	2005-07-01 04:54:38.000000000 +0300
-+++ /src/mesa/x86/Makefile	2007-06-07 21:52:31.000000000 +0300
-@@ -5,6 +5,7 @@
- 
- 
- INCLUDE_DIRS = \
-+        -I/usr/include \
- 	-I$(TOP)/include/GL \
- 	-I$(TOP)/include \
- 	-I.. \
-@@ -13,6 +14,10 @@
- 	-I../glapi \
- 	-I../tnl
- 
-+OPT_FLAGS_host = -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-+
-+CFLAGS_host = -Wall -Wmissing-prototypes $(OPT_FLAGS_host) $(PIC_FLAGS) $(ARCH_FLAGS) \
-+        $(DEFINES) $(ASM_FLAGS) $(X11_INCLUDES) -std=c99 -ffast-math
- 
- default: gen_matypes matypes.h
- 
-@@ -21,7 +26,7 @@
- 
- 
- gen_matypes: gen_matypes.c
--	$(CC) $(INCLUDE_DIRS) $(CFLAGS) gen_matypes.c -o gen_matypes
-+	$(CC) $(INCLUDE_DIRS) $(CFLAGS_host) gen_matypes.c -o gen_matypes
- 
- # need some special rules here, unfortunately
- matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
diff --git a/recipes/mesa/mesa-full-7.0.2/fix-progs-makefile.patch b/recipes/mesa/mesa-full-7.0.2/fix-progs-makefile.patch
deleted file mode 100644
index 727ede0..0000000
--- a/recipes/mesa/mesa-full-7.0.2/fix-progs-makefile.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Index: Mesa-7.0.2/progs/demos/Makefile
-===================================================================
---- Mesa-7.0.2.orig/progs/demos/Makefile	2008-08-22 15:52:16.000000000 +0800
-+++ Mesa-7.0.2/progs/demos/Makefile	2008-08-22 15:52:33.000000000 +0800
-@@ -13,7 +13,7 @@
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS) -lstdc++
- 
- PROGS = \
- 	arbfplight \
-Index: Mesa-7.0.2/progs/glsl/Makefile
-===================================================================
---- Mesa-7.0.2.orig/progs/glsl/Makefile	2008-08-22 15:56:37.000000000 +0800
-+++ Mesa-7.0.2/progs/glsl/Makefile	2008-08-22 15:56:52.000000000 +0800
-@@ -7,7 +7,7 @@
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS) -lstdc++
- 
- PROGS = \
- 	brick \
-Index: Mesa-7.0.2/progs/redbook/Makefile
-===================================================================
---- Mesa-7.0.2.orig/progs/redbook/Makefile	2008-08-22 15:55:10.000000000 +0800
-+++ Mesa-7.0.2/progs/redbook/Makefile	2008-08-22 15:55:27.000000000 +0800
-@@ -7,7 +7,7 @@
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS) -lstdc++
- 
- PROGS = aaindex aapoly aargb accanti accpersp alpha alpha3D anti \
- 	bezcurve bezmesh checker clip colormat cube depthcue dof \
-Index: Mesa-7.0.2/progs/samples/Makefile
-===================================================================
---- Mesa-7.0.2.orig/progs/samples/Makefile	2008-08-22 15:56:01.000000000 +0800
-+++ Mesa-7.0.2/progs/samples/Makefile	2008-08-22 15:56:13.000000000 +0800
-@@ -7,7 +7,7 @@
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLUT_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLUT_LIB) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS) -lstdc++
- 
- PROGS = accum bitmap1 bitmap2 blendeq blendxor copy cursor depth eval fog \
- 	font line logo nurb olympic overlay point prim quad select \
-Index: Mesa-7.0.2/progs/xdemos/Makefile
-===================================================================
---- Mesa-7.0.2.orig/progs/xdemos/Makefile	2008-08-22 15:57:11.000000000 +0800
-+++ Mesa-7.0.2/progs/xdemos/Makefile	2008-08-22 15:57:22.000000000 +0800
-@@ -8,7 +8,7 @@
- 
- LIB_DEP = $(TOP)/$(LIB_DIR)/$(GL_LIB_NAME) $(TOP)/$(LIB_DIR)/$(GLU_LIB_NAME)
- 
--LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS)
-+LIBS = -L$(TOP)/$(LIB_DIR) -l$(GLU_LIB) -l$(GL_LIB) $(APP_LIB_DEPS) -lstdc++
- 
- PROGS = glthreads \
- 	glxdemo \
diff --git a/recipes/mesa/mesa-full-7.0.2/mklib-rpath-link.patch b/recipes/mesa/mesa-full-7.0.2/mklib-rpath-link.patch
deleted file mode 100644
index 618f5b5..0000000
--- a/recipes/mesa/mesa-full-7.0.2/mklib-rpath-link.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- /tmp/mklib	2007-12-08 11:03:23.000000000 +0100
-+++ Mesa-7.0.2/bin/mklib	2007-12-08 11:04:02.509863000 +0100
-@@ -106,6 +106,9 @@
- 	-L*)
- 	    DEPS="$DEPS $1"
- 	    ;;
-+        -Wl*)
-+            DEPS="$DEPS $1"
-+            ;;
- 	-pthread)
- 	    # this is a special case (see bugzilla 10876)
- 	    DEPS="$DEPS $1"
---- /tmp/default	2007-12-08 11:04:17.000000000 +0100
-+++ Mesa-7.0.2/configs/default	2007-12-08 11:05:06.279863000 +0100
-@@ -76,7 +76,7 @@
- GLW_LIB_DEPS = -L$(TOP)/$(LIB_DIR) -l$(GL_LIB) $(EXTRA_LIB_PATH) -lXt -lX11
- 
- # Program dependencies - specific GL/glut libraries added in Makefiles
--APP_LIB_DEPS = -lm
-+APP_LIB_DEPS = $(EXTRA_LIB_PATH) -lm
- 
- 
- 
diff --git a/recipes/mesa/mesa-full_7.0.2.bb b/recipes/mesa/mesa-full_7.0.2.bb
deleted file mode 100644
index 2f98eed..0000000
--- a/recipes/mesa/mesa-full_7.0.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-include mesa-mesa.inc
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2;name=archive \
-        ${SOURCEFORGE_MIRROR}/mesa3d/MesaGLUT-${PV}.tar.bz2;name=glut \
-        ${SOURCEFORGE_MIRROR}/mesa3d/MesaDemos-${PV}.tar.bz2;name=demos \
-        file://mklib-rpath-link.patch \
-        file://fix-host-compile.patch \
-        file://fix-progs-makefile.patch \
-        "
-
-do_install_append = "install -d ${D}${bindir}; \
-                     for f in glxgears glxheads glxdemo glxinfo; do \
-                     cp progs/xdemos/${f} ${D}${bindir}; \
-                     done"
-
-PACKAGES =+ "libglut libglut-dev mesa-utils"
-
-FILES_libglut = "${libdir}/libglut.so.*"
-FILES_libglut-dev = "${libdir}/libglut.* ${includedir}/GL/glut*"
-FILES_mesa-utils = "${bindir}/*"
-
-SRC_URI[archive.md5sum] = "93e6ed7924ff069a4f883b4fce5349dc"
-SRC_URI[archive.sha256sum] = "9d4707b556960f6aef14480f91fcd4f868720f64321947ab1b2fd20e85ce7f9e"
-SRC_URI[glut.md5sum] = "3a33f8efc8c58a592a854cfc7a643286"
-SRC_URI[glut.sha256sum] = "fa31ca39f00ff92c7da59d9993d0eefb8d901eb8a519743942e523fde120eb6c"
-SRC_URI[demos.md5sum] = "11a10410bae7be85cf25bc7119966468"
-SRC_URI[demos.sha256sum] = "ce39b26085acd8e5dffa8233618acac2605cc42203bc4f81c6e4504265f0ffaa"
diff --git a/recipes/mesa/mesa-mesa.inc b/recipes/mesa/mesa-mesa.inc
deleted file mode 100644
index 48d171d..0000000
--- a/recipes/mesa/mesa-mesa.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-include mesa-common-old.inc
-
-PACKAGES =+ "libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
-
-FILES_libgl = "${libdir}/libGL.so.*"
-FILES_libglu = "${libdir}/libGLU.so.*"
-FILES_libosmesa = "${libdir}/libOSMesa.so.*"
-
-FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
-FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
-FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
-
-do_configure() {
-	cd configs
-
-	cp linux current
-	sed -e "s%CC *= *.*%CC = ${CC}%" -i current
-	sed -e "s%CXX *= *.*%CXX = ${CXX}%" -i current
-	sed -e "s%LD *= *.*%LD = ${LD}%" -i current
-	sed -e "s%OPT_FLAGS *= *.*%OPT_FLAGS = ${TARGET_CFLAGS}%" -i current
-	sed -e "s%X11_INCLUDES *= *.*%X11_INCLUDES = -I${STAGING_INCDIR}/X11%" -i current
-	sed -e "s%EXTRA_LIB_PATH *= *.*%EXTRA_LIB_PATH = ${LDFLAGS}%" -i current
-	sed -i s:\$\(CC\):gcc:g  ../src/mesa/x86/Makefile
-	echo "SRC_DIRS = mesa glu glut/glx" >> current
-}
-
-do_compile() {
-	oe_runmake default
-}
-
-do_install() {
-	install -d ${D}${libdir}
-	cp -pP lib/* ${D}${libdir}/
-	install -d ${D}${includedir}
-	cp -R include/GL ${D}${includedir}/
-}
-
-do_stage() {
-        cp -pP lib/* ${STAGING_LIBDIR}/
-        cp -R include/GL ${STAGING_INCDIR}/
-}
diff --git a/recipes/mesa/mesa_6.5.2.bb b/recipes/mesa/mesa_6.5.2.bb
deleted file mode 100644
index 8573ce3..0000000
--- a/recipes/mesa/mesa_6.5.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include mesa-mesa.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI_append = " file://fix-host-compile.patch "
-
-SRC_URI[md5sum] = "e4d894181f1859651658b3704633e10d"
-SRC_URI[sha256sum] = "137f50a30461d51eb9af5aac737bc788d536354cf47b26129b97bde6e41fb85f"
diff --git a/recipes/mesa/mesa_7.0.2.bb b/recipes/mesa/mesa_7.0.2.bb
deleted file mode 100644
index 96dd966..0000000
--- a/recipes/mesa/mesa_7.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include mesa-mesa.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI_append = " file://fix-host-compile.patch "
-
-SRC_URI[md5sum] = "93e6ed7924ff069a4f883b4fce5349dc"
-SRC_URI[sha256sum] = "9d4707b556960f6aef14480f91fcd4f868720f64321947ab1b2fd20e85ce7f9e"
-- 
1.7.0.2



