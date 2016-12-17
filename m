Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12D7671BB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 23:04:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g1so2063119pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X2XesCy9PlLVWr8J/wkWrbro+sKHdqhc4Fyy7ceTLfs=;
	b=gdDklI+Cz10dHWYRpbx00Fae31lfRvTHJ6Gj8HEFmnt7nlyS4NT5LGmyrA/hTb+QgJ
	ev9WZxV+oRnndc7D+XoDtoaTJUJh5ey851czyNx/rH6tNen3B+YUkAnE6xqsathrDJpy
	PW+t11Mjqn8TI7tGM5Gz1VZJKiZrur4q2wsnXVb0VdNb3vFERD9KEz/6RV2c1lzuezv6
	IB9LK+eBJcoFT2tWB51aG2PEoDMxT/S4lgrMvmNJ3J6rgqBqpspbqcn1P4xpWrpZCBUR
	b7HeVeDgaqai7GII3fhEM0hnXRJGrnsLONGz5zYcQOWsKY417LMSTyEoAapm6wntYWu+
	MZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X2XesCy9PlLVWr8J/wkWrbro+sKHdqhc4Fyy7ceTLfs=;
	b=HjL7OXSUOQRtcmPRNi/cKlrBo3OxY372TB0rvqYn0vZOPT3vlgryWDGcA3+zxowzrh
	n3rr0jZpRw7WN4WO/+TanPuY8p5TolF9EQCUsxdKV93gqCH8QDiXDePfDiLWgySJ8Zeq
	ygskmsPxCqzX+9XjNe9XiNRXbGeSHy1D1UapIfzqmX8rn9NBmB4oewHZuFl0FxUcgWJR
	edMc+86b9YhAaN3u1FyVlaQlFcvFcRFKJIjSxumdLTl4BqvtkL+zyH4dlEz2xKKERExo
	9Gpjfg8esYIz8cE6TTHPar8byWDPDcQQypqorWthT6eok/myBMVY59jObn4qmjelZnzT
	vphQ==
X-Gm-Message-State: AKaTC01kI+vQ6U0agG4Io1KatPZr4fh6RrmfzjSH+Z+ackPw6qjuccXux8h+O/b68CuU8w==
X-Received: by 10.99.164.9 with SMTP id c9mr17474585pgf.141.1482015846433;
	Sat, 17 Dec 2016 15:04:06 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id f5sm4583384pgg.5.2016.12.17.15.04.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Dec 2016 15:04:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	obi@opendreambox.org
Date: Sat, 17 Dec 2016 15:03:59 -0800
Message-Id: <20161217230359.25183-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-filesystems][PATCH] xfsprogs: Fix parallel install and Make dependencies
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
X-List-Received-Date: Sat, 17 Dec 2016 23:04:06 -0000

This should fix build issues due to missing dependencies
e.g. libuuid in Makefiles.

correct libhandle paths

Dont do parallel install its broken

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfsprogs/files/link_needed_libs.patch          | 76 +++++++++++++++++++++-
 .../recipes-utils/xfsprogs/xfsprogs_4.8.0.bb       |  8 ++-
 2 files changed, 81 insertions(+), 3 deletions(-)

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
index 9959f0d85..7ee693ada 100644
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
@@ -54,3 +54,7 @@ do_configure_prepend () {
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
 }
+
+PARALLEL_MAKEINST = ""
+
+TOOLCHAIN = "gcc"
-- 
2.11.0


