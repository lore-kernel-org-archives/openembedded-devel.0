Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id AC1227742C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 23:06:27 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g1so2067136pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MtO4N8J8+EVlNGK13TSZJsA2oYCux8W7g4vH59tBrs0=;
	b=XjIq7hubdYTGGC6f7/0j8U8mJTpCf105SGL8sYha3tKH4M37wveRHqSWVlwVBw/Ozi
	tMyVmpmwBmLXzZ2nH3T0bBVFvzISLMZlmTczteno1HkMTGgLZtorfpwC6xt0UZwmAyDw
	RS6xMifDj67kzHDSh/Jg0VHAxWs+u5tpclI8Zq1/weeuRgdiT5uX3FFs6BYRYAa5hbwE
	201/B1hx0TqxIYHVNC66MRWULIUBF1h4lfu8qj9Jh/q5UFRcvvTvXJgpdqpXOk7gbV7p
	uCR1u4fcf+h38YAfxuP1MqcHvCAdJV9efdBu53JtwSHRCixJPYz2BWcUHBxI9sPjqTfO
	BkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MtO4N8J8+EVlNGK13TSZJsA2oYCux8W7g4vH59tBrs0=;
	b=YwxrRKEGyauaiGwr+6ARZAgYdyAY326gB1ZTwXQIJI+gthXA9W5bYIt0q1lqMO+UvH
	eNzaDzPHEwLMh3y0+NfprmjLrvHxUQ181Wgo7FOm2nx952SB/+vI9PC/cmY5ymYfO/V3
	d2LJjnP+EfeIzVF69LJzhqYTOtPVOGHnQ39/rX8bBvq+Dcr5SZjzsYxW4J4gzm8GI3Z4
	1bUR1ypMf5GazSSWge/s1Q563oVNr7daR+WdSZoKTlMB34sStL74G/Q21kT+bYXWPB10
	FOg8Rltef6v3Fjxbu1Kla4uF6Q0pPoGbS7k+j7n0zO8etqC+wcJVlmCQGOXBeltXih+U
	9xww==
X-Gm-Message-State: AKaTC01zPlAgRs+T7sbkYGQnFOzmj0BS134znGwPw7uS6bKVq4inq+ufKXrQX+5oREDrZQ==
X-Received: by 10.84.175.234 with SMTP id t97mr20823926plb.145.1482015989412; 
	Sat, 17 Dec 2016 15:06:29 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y20sm21115886pfj.26.2016.12.17.15.06.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Dec 2016 15:06:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	obi@opendreambox.org
Date: Sat, 17 Dec 2016 15:06:22 -0800
Message-Id: <20161217230622.26063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-filesystems][PATCH V2] xfsprogs: Fix parallel install and Make dependencies
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
X-List-Received-Date: Sat, 17 Dec 2016 23:06:28 -0000

This should fix build issues due to missing dependencies
e.g. libuuid in Makefiles.

correct libhandle paths

Dont do parallel install its broken

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from
v1 -> v2
- Drop locking toolchain to gcc it compiles fine with clang too

 .../xfsprogs/files/link_needed_libs.patch          | 76 +++++++++++++++++++++-
 .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  6 +-
 2 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
index 18b95c1c3..a3c699ce6 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/link_needed_libs.patch
@@ -1,3 +1,9 @@
+use libtool to package install.  do not use the manual file install as
+that'll copy files directly from the .libs/ subdir which might have rpaths
+pointing to build area.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 Index: xfsprogs-4.8.0/libxcmd/Makefile
 ===================================================================
 --- xfsprogs-4.8.0.orig/libxcmd/Makefile
@@ -37,11 +43,28 @@ Index: xfsprogs-4.8.0/libxfs/Makefile
  
  install-headers: $(addsuffix -hdrs, $(PKGHFILES))
  
+@@ -144,6 +145,7 @@ install-headers: $(addsuffix -hdrs, $(PK
+ 	$(Q)$(LN_S) -f $(CURDIR)/$* $(TOPDIR)/include/xfs/$*
+ 
+ install-dev: install
++	$(INSTALL_LTLIB_DEV)
+ 	$(INSTALL) -m 644 $(PKGHFILES) $(PKG_INC_DIR)
+ 
+ # We need to install the headers before building the dependencies.  If we
 Index: xfsprogs-4.8.0/libxlog/Makefile
 ===================================================================
 --- xfsprogs-4.8.0.orig/libxlog/Makefile
 +++ xfsprogs-4.8.0/libxlog/Makefile
-@@ -19,6 +19,10 @@ default: ltdepend $(LTLIBRARY)
+@@ -12,6 +12,8 @@ LT_AGE = 0
+ 
+ CFILES = xfs_log_recover.c util.c
+ 
++LTLIBS = $(LIBUUID) $(LIBXFS)
++
+ # don't want to link xfs_repair with a debug libxlog.
+ DEBUG = -DNDEBUG
+ 
+@@ -19,6 +21,10 @@ default: ltdepend $(LTLIBRARY)
  
  include $(BUILDRULES)
  
@@ -53,3 +76,54 @@ Index: xfsprogs-4.8.0/libxlog/Makefile
 +	$(INSTALL_LTLIB_DEV)
  
  -include .ltdep
+Index: xfsprogs-4.8.0/include/buildmacros
+===================================================================
+--- xfsprogs-4.8.0.orig/include/buildmacros
++++ xfsprogs-4.8.0/include/buildmacros
+@@ -70,18 +70,9 @@ endif
+ # /usr/lib.
+ ifeq ($(ENABLE_SHARED),yes)
+ INSTALL_LTLIB_DEV = \
+-	cd $(TOPDIR)/$(LIBNAME)/.libs; \
+-	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
+-	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).lai $(PKG_LIB_DIR); \
+-	../$(INSTALL) -m 644 $(LIBNAME).lai $(PKG_LIB_DIR)/$(LIBNAME).la ; \
+-	../$(INSTALL) -m 755 -d $(PKG_ROOT_LIB_DIR); \
+-	../$(INSTALL) -T so_base $(LIBNAME).lai $(PKG_ROOT_LIB_DIR); \
+-	if [ "x$(shell readlink -f $(PKG_LIB_DIR))" != \
+-	     "x$(shell readlink -f $(PKG_ROOT_LIB_DIR))" ]; then \
+-		../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).a $(PKG_ROOT_LIB_DIR)/$(LIBNAME).a; \
+-		../$(INSTALL) -S $(PKG_LIB_DIR)/$(LIBNAME).la $(PKG_ROOT_LIB_DIR)/$(LIBNAME).la; \
+-		../$(INSTALL) -S $(PKG_ROOT_LIB_DIR)/$(LIBNAME).so $(PKG_LIB_DIR)/$(LIBNAME).so; \
+-	fi
++	set -e; cd $(TOPDIR)/$(LIBNAME); \
++	$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
++	env -uDIST_ROOT $(LTINSTALL) $(TOPDIR)/$(LIBNAME)/$(LIBNAME).la $(DIST_ROOT)$(PKG_LIB_DIR)/$(LIBNAME).la
+ else
+ INSTALL_LTLIB_DEV = $(INSTALL_LTLIB_STATIC)
+ endif
+Index: xfsprogs-4.8.0/Makefile
+===================================================================
+--- xfsprogs-4.8.0.orig/Makefile
++++ xfsprogs-4.8.0/Makefile
+@@ -83,6 +83,8 @@ quota: libxcmd
+ repair: libxlog libxcmd
+ copy: libxlog
+ mkfs: libxcmd
++libxlog: libxfs
++libxlog-install-dev: libxfs-install-dev
+ 
+ ifeq ($(HAVE_BUILDDEFS), yes)
+ include $(BUILDRULES)
+Index: xfsprogs-4.8.0/libhandle/Makefile
+===================================================================
+--- xfsprogs-4.8.0.orig/libhandle/Makefile
++++ xfsprogs-4.8.0/libhandle/Makefile
+@@ -24,7 +24,6 @@ default: ltdepend $(LTLIBRARY)
+ include $(BUILDRULES)
+ 
+ install: default
+-	$(INSTALL_LTLIB)
+ 
+ install-dev: default
+ 	$(INSTALL_LTLIB_DEV)
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
index 9959f0d85..1032fb89b 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -22,7 +22,7 @@ FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
 FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
 FILES_${PN}-repair = "${base_sbindir}/xfs_repair"
 
-FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
+FILES_libhandle = "${libdir}/libhandle${SOLIBS}"
 
 EXTRA_OECONF = "--enable-gettext=no \
                 INSTALL_USER=root \
@@ -40,7 +40,7 @@ PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
 export DEBUG="-DNDEBUG"
 
-EXTRA_OEMAKE = "DIST_ROOT='${D}'"
+#EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
 do_configure_prepend () {
     export BUILD_CC="${BUILD_CC} ${BUILD_CFLAGS}"
@@ -54,3 +54,5 @@ do_configure_prepend () {
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
 }
+
+PARALLEL_MAKEINST = ""
-- 
2.11.0


