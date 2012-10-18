Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TOy44-0000QT-GO
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2012 23:55:43 +0200
Received: (qmail 20063 invoked by uid 1003); 18 Oct 2012 21:35:39 -0000
Received: from unknown (HELO oebuild.amer.corp.natinst.com)
	(philip@balister.org@157.22.28.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Oct 2012 21:35:38 -0000
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Thu, 18 Oct 2012 14:36:56 -0700
Message-Id: <1350596217-26554-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH 1/2] fuse : Update to version 2.9.2.
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
X-List-Received-Date: Thu, 18 Oct 2012 21:55:45 -0000

From: Philip Balister <philip@opensdr.com>

Bug fix release.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../fuse/fuse-2.9.1/gold-unversioned-symbol.patch  |   60 --------------------
 .../fuse/fuse-2.9.2/gold-unversioned-symbol.patch  |   60 ++++++++++++++++++++
 meta-oe/recipes-support/fuse/fuse_2.9.1.bb         |   33 -----------
 meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |   33 +++++++++++
 4 files changed, 93 insertions(+), 93 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
 create mode 100644 meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
 delete mode 100644 meta-oe/recipes-support/fuse/fuse_2.9.1.bb
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.9.2.bb

diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch b/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
deleted file mode 100644
index 8ee97df..0000000
--- a/meta-oe/recipes-support/fuse/fuse-2.9.1/gold-unversioned-symbol.patch
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
diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch b/meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
new file mode 100644
index 0000000..8ee97df
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse-2.9.2/gold-unversioned-symbol.patch
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
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb b/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
deleted file mode 100644
index 86a8465..0000000
--- a/meta-oe/recipes-support/fuse/fuse_2.9.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
-HOMEPAGE = "http://fuse.sf.net"
-SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
-           file://gold-unversioned-symbol.patch \
-          "
-SRC_URI[md5sum] = "c646133c7bbf8ad9d2ced0888dc4a319"
-SRC_URI[sha256sum] = "51803d8224bf6adab052b340614980b28861f317c261eab1f1e9c6cf17b3dd75"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-kernel-module"
-
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
-
-RRECOMMENDS_${PN} = "kernel-module-fuse"
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
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
new file mode 100644
index 0000000..bd0095b
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
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
+SRC_URI[md5sum] = "7d80d0dc9cc2b9199a0c53787c151205"
+SRC_URI[sha256sum] = "81a728fb3f87da33063068735e2fb7e2cd89df207d32687d3d3278385279cefc"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-kernel-module"
+
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+
+RRECOMMENDS_${PN} = "kernel-module-fuse"
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
1.7.7.6



