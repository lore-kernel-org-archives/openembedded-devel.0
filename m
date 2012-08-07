Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syk12-0003fq-4x
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 15:40:08 +0200
Received: by eekb57 with SMTP id b57so1245835eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 06:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PdHJpUrglEGjvGUf2Mljj1s+a3aEN1S4OnIt2QTqc+w=;
	b=oexeL+wS1bvbEnIWRfdL5uPRaoCkF2JtvJ/TDlbnFXXA6nLEpB2JaDf2uqLz2iU5Ir
	WD+NuSNCOEUIyoN+cgZz4VdcPaRwpob7SE9GplzgI9I+XMuGzoy3ubHJCpaAx5CzLuJs
	bdKgR3kKC/OU6K3f/XLN9ozWZgV9HrEoQE5ow0KFEi9SfPFNE5S/BqnVb9AOi0Ka7rSM
	Y4C7Fq9p8g5P0PnVU9crWp8FQ8ueAj8lpShEYj4P17nZ2YMkEmODW1wr8vQQwy8Y/iXU
	A8YYcHtqOMn0KClYwF33LgxLFDSSAkAFUIYcErZXE5zpLLOAgpyFLGoAmDwB4ZagFp3Y
	/QpQ==
Received: by 10.14.210.197 with SMTP id u45mr17811601eeo.42.1344346102266;
	Tue, 07 Aug 2012 06:28:22 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e7sm20124068eep.2.2012.08.07.06.28.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 06:28:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 15:28:16 +0200
Message-Id: <1344346096-29219-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl93GhtUFB1Pyb6spI2G00pXb+gWylH2ViTEjWXzuqPk9UID1oKNQZt4t+L7V8sBeGuzvuS
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fuse: update to 2.9.1
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
X-List-Received-Date: Tue, 07 Aug 2012 13:40:08 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../fuse/fuse-2.8.6/define_GNU_SOURCE.patch        |   12 ----
 .../fuse/fuse-2.8.6/gold-unversioned-symbol.patch  |   60 --------------------
 .../fuse/fuse-2.9.1/gold-unversioned-symbol.patch  |   60 ++++++++++++++++++++
 meta-oe/recipes-support/fuse/fuse_2.8.5.bb         |   34 -----------
 meta-oe/recipes-support/fuse/fuse_2.8.6.bb         |   37 ------------
 meta-oe/recipes-support/fuse/fuse_2.9.1.bb         |   33 +++++++++++
 6 files changed, 93 insertions(+), 143 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
 delete mode 100644 meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch
 create mode 100644 meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
 delete mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb
 delete mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.6.bb
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.9.1.bb

diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
deleted file mode 100644
index c673a4c..0000000
--- a/meta-oe/recipes-support/fuse/fuse-2.8.6/define_GNU_SOURCE.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: fuse-2.8.6/util/fusermount.c
-===================================================================
---- fuse-2.8.6.orig/util/fusermount.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/util/fusermount.c	2011-09-25 00:23:53.051019038 -0700
-@@ -7,6 +7,7 @@
- */
- /* This program does the mounting and unmounting of FUSE filesystems */
- 
-+#define _GNU_SOURCE
- #include <config.h>
- 
- #include "mount_util.h"
diff --git a/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch b/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch
deleted file mode 100644
index 8ee97df..0000000
--- a/meta-oe/recipes-support/fuse/fuse-2.8.6/gold-unversioned-symbol.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Index: fuse-2.8.6/lib/fuse.c
-===================================================================
---- fuse-2.8.6.orig/lib/fuse.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse.c	2011-10-19 09:20:27.537099939 -0700
-@@ -3947,11 +3947,11 @@
- 				      11);
- }
- 
--FUSE_SYMVER(".symver fuse_exited,__fuse_exited@");
--FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@");
--FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@");
--FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
--FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@");
-+FUSE_SYMVER(".symver fuse_exited,__fuse_exited@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
- FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
- 
- #endif /* __FreeBSD__ */
-Index: fuse-2.8.6/lib/fuse_mt.c
-===================================================================
---- fuse-2.8.6.orig/lib/fuse_mt.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse_mt.c	2011-10-19 09:20:27.537099939 -0700
-@@ -113,4 +113,4 @@
- 	return fuse_session_loop_mt(fuse_get_session(f));
- }
- 
--FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
-+FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED");
-Index: fuse-2.8.6/lib/fuse_versionscript
-===================================================================
---- fuse-2.8.6.orig/lib/fuse_versionscript	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/fuse_versionscript	2011-10-19 09:20:27.541099939 -0700
-@@ -1,3 +1,6 @@
-+FUSE_UNVERSIONED {
-+};
-+
- FUSE_2.2 {
- 	global:
- 		fuse_destroy;
-Index: fuse-2.8.6/lib/helper.c
-===================================================================
---- fuse-2.8.6.orig/lib/helper.c	2011-09-13 00:23:14.000000000 -0700
-+++ fuse-2.8.6/lib/helper.c	2011-10-19 09:20:27.541099939 -0700
-@@ -409,10 +409,10 @@
- 	return fuse_mount_compat22(mountpoint, NULL);
- }
- 
--FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@");
-+FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@FUSE_UNVERSIONED");
- FUSE_SYMVER(".symver fuse_setup_compat22,fuse_setup@FUSE_2.2");
--FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@");
--FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@");
-+FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
- FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
- 
- #endif /* __FreeBSD__ */
diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch b/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
new file mode 100644
index 0000000..8ee97df
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
@@ -0,0 +1,60 @@
+Index: fuse-2.8.6/lib/fuse.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse.c	2011-10-19 09:20:27.537099939 -0700
+@@ -3947,11 +3947,11 @@
+ 				      11);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_exited,__fuse_exited@");
+-FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@");
+-FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@");
+-FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
+-FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@");
++FUSE_SYMVER(".symver fuse_exited,__fuse_exited@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
+Index: fuse-2.8.6/lib/fuse_mt.c
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_mt.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_mt.c	2011-10-19 09:20:27.537099939 -0700
+@@ -113,4 +113,4 @@
+ 	return fuse_session_loop_mt(fuse_get_session(f));
+ }
+ 
+-FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
++FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED");
+Index: fuse-2.8.6/lib/fuse_versionscript
+===================================================================
+--- fuse-2.8.6.orig/lib/fuse_versionscript	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/fuse_versionscript	2011-10-19 09:20:27.541099939 -0700
+@@ -1,3 +1,6 @@
++FUSE_UNVERSIONED {
++};
++
+ FUSE_2.2 {
+ 	global:
+ 		fuse_destroy;
+Index: fuse-2.8.6/lib/helper.c
+===================================================================
+--- fuse-2.8.6.orig/lib/helper.c	2011-09-13 00:23:14.000000000 -0700
++++ fuse-2.8.6/lib/helper.c	2011-10-19 09:20:27.541099939 -0700
+@@ -409,10 +409,10 @@
+ 	return fuse_mount_compat22(mountpoint, NULL);
+ }
+ 
+-FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@");
++FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_setup_compat22,fuse_setup@FUSE_2.2");
+-FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@");
+-FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@");
++FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@FUSE_UNVERSIONED");
++FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
+ FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
deleted file mode 100644
index 65b114b..0000000
--- a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
-HOMEPAGE = "http://fuse.sf.net"
-SECTION = "libs"
-LICENSE = "GPLv2&LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "8aa2fd689de00b73963620483084ae3b"
-SRC_URI[sha256sum] = "bec80e66ae8ee60dfdf67b2ca291266a45dcfe6bc20c64f3acfceaa38ed29a84"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-kernel-module"
-
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
-
-RRECOMMENDS_${PN} = "kernel-module-fuse""
-
-FILES_${PN} += "${libdir}/libfuse.so.*"
-FILES_${PN}-dev += "${libdir}/libfuse*.la"
-
-FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
-FILES_libulockmgr-dev += "${libdir}/libulock*.la"
-FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
-
-# Forbid auto-renaming to libfuse-utils
-FILES_fuse-utils = "${bindir} ${base_sbindir}"
-FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
-DEBIAN_NOAUTONAME_fuse-utils = "1"
-DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb b/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
deleted file mode 100644
index 15e9206..0000000
--- a/meta-oe/recipes-support/fuse/fuse_2.8.6.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
-HOMEPAGE = "http://fuse.sf.net"
-SECTION = "libs"
-LICENSE = "GPLv2&LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
-           file://define_GNU_SOURCE.patch \
-           file://gold-unversioned-symbol.patch \
-          "
-
-SRC_URI[md5sum] = "eaa32c8cef56a981656a786f258a002a"
-SRC_URI[sha256sum] = "1ec1913e38f09b2a9ec1579e1800805b5e2c747d1dce515e316dbb665ca139d6"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-kernel-module"
-
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
-
-RRECOMMENDS_${PN} = "kernel-module-fuse""
-
-FILES_${PN} += "${libdir}/libfuse.so.*"
-FILES_${PN}-dev += "${libdir}/libfuse*.la"
-
-FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
-FILES_libulockmgr-dev += "${libdir}/libulock*.la"
-FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
-
-# Forbid auto-renaming to libfuse-utils
-FILES_fuse-utils = "${bindir} ${base_sbindir}"
-FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
-DEBIAN_NOAUTONAME_fuse-utils = "1"
-DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
new file mode 100644
index 0000000..6718758
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+HOMEPAGE = "http://fuse.sf.net"
+SECTION = "libs"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
+           file://gold-unversioned-symbol.patch \
+          "
+SRC_URI[md5sum] = "c646133c7bbf8ad9d2ced0888dc4a319"
+SRC_URI[sha256sum] = "51803d8224bf6adab052b340614980b28861f317c261eab1f1e9c6cf17b3dd75"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-kernel-module"
+
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+
+RRECOMMENDS_${PN} = "kernel-module-fuse""
+
+FILES_${PN} += "${libdir}/libfuse.so.*"
+FILES_${PN}-dev += "${libdir}/libfuse*.la"
+
+FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
+FILES_libulockmgr-dev += "${libdir}/libulock*.la"
+FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
+
+# Forbid auto-renaming to libfuse-utils
+FILES_fuse-utils = "${bindir} ${base_sbindir}"
+FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
+DEBIAN_NOAUTONAME_fuse-utils = "1"
+DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
-- 
1.7.7.3



