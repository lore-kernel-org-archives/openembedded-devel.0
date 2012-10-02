Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1TJ3H0-00031U-7L
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 16:16:34 +0200
Received: from fsc-480-012-88.intern.dresearch.de
	(fsc-480-012-88.internal.dresearch-fe.de [172.29.23.5])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 3CA4FE02AA;
	Tue,  2 Oct 2012 13:57:40 +0000 (UTC)
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 1B97972031; Tue,  2 Oct 2012 15:53:55 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <h.heinold@tarent.de>, Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2012 15:53:50 +0200
Message-Id: <3cc90251ccf802274a95f736784f532e21166afb.1349185327.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1349185326.git.sledz@dresearch-fe.de>
References: <cover.1349185326.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/2] jamvm: reorganize metadata to simplify backport from meta-java
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
X-List-Received-Date: Tue, 02 Oct 2012 14:16:34 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/jamvm/files/jamvm_1.5.0-initial.patch      |   91 --------------------
 .../jamvm_1.4.5-initial.patch                      |    0
 recipes/jamvm/{files => jamvm}/debian-jni.patch    |    0
 .../jamvm-1.3.1-size-defaults.patch                |    0
 .../jamvm-1.5.3-jni_h-noinst.patch                 |    0
 5 files changed, 91 deletions(-)
 delete mode 100644 recipes/jamvm/files/jamvm_1.5.0-initial.patch
 rename recipes/jamvm/{files => jamvm-initial}/jamvm_1.4.5-initial.patch (100%)
 rename recipes/jamvm/{files => jamvm}/debian-jni.patch (100%)
 rename recipes/jamvm/{files => jamvm}/jamvm-1.3.1-size-defaults.patch (100%)
 rename recipes/jamvm/{files => jamvm}/jamvm-1.5.3-jni_h-noinst.patch (100%)

diff --git a/recipes/jamvm/files/jamvm_1.5.0-initial.patch b/recipes/jamvm/files/jamvm_1.5.0-initial.patch
deleted file mode 100644
index 1f63dba..0000000
--- a/recipes/jamvm/files/jamvm_1.5.0-initial.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Index: jamvm-1.5.0/configure.ac
-===================================================================
---- jamvm-1.5.0.orig/configure.ac	2007-12-20 00:01:08.000000000 +0100
-+++ jamvm-1.5.0/configure.ac	2007-12-20 00:03:40.000000000 +0100
-@@ -22,7 +22,7 @@
- dnl Process this file with autoconf to produce a configure script.
- 
- AC_INIT(src/jam.c)
--AM_INIT_AUTOMAKE(jamvm, 1.5.0)
-+AM_INIT_AUTOMAKE(jamvm-initial, 1.5.0)
- AC_CONFIG_HEADERS([src/config.h])
- AC_PREFIX_DEFAULT(/usr/local/jamvm)
- 
-Index: jamvm-1.5.0/java-initial
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ jamvm-1.5.0/java-initial	2007-12-20 00:03:27.000000000 +0100
-@@ -0,0 +1,14 @@
-+#!/bin/sh
-+#
-+# Wrapper which (almost) silently restarts the VM in case of segfaults.
-+
-+redo_from_start=1;
-+while [ $redo_from_start -eq 1 ]; do
-+    echo "Running JamVM-initial: ${@}"
-+    redo_from_start=0;
-+    jamvm-initial ${1+"$@"}
-+    if [ $? -eq 139 ]; then
-+        echo "JamVM-initial crashed - silently trying again"
-+        redo_from_start=1;
-+    fi
-+done
-Index: jamvm-1.5.0/lib/Makefile.am
-===================================================================
---- jamvm-1.5.0.orig/lib/Makefile.am	2007-12-20 00:05:24.000000000 +0100
-+++ jamvm-1.5.0/lib/Makefile.am	2007-12-20 00:05:28.000000000 +0100
-@@ -19,7 +19,7 @@
- ## Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
- ##
- 
--CP_LIB_DIR = ${with_classpath_install_dir}/share/classpath
-+CP_LIB_DIR = ${with_classpath_install_dir}/share/classpath-initial
- GLIBJ_ZIP  = ${CP_LIB_DIR}/glibj.zip
- 
- SUBDIRS = jamvm java gnu sun
-Index: jamvm-1.5.0/src/class.h
-===================================================================
---- jamvm-1.5.0.orig/src/class.h	2007-12-20 00:06:34.000000000 +0100
-+++ jamvm-1.5.0/src/class.h	2007-12-20 00:16:41.000000000 +0100
-@@ -39,11 +39,11 @@
-    separate class files in a directory structure */
- 
- #ifdef USE_ZIP
--#define JAMVM_CLASSES INSTALL_DIR"/share/jamvm/classes.zip"
--#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath/glibj.zip"
-+#define JAMVM_CLASSES CLASSPATH_INSTALL_DIR"/share/jamvm-initial/classes.zip"
-+#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath-initial/glibj.zip"
- #else
--#define JAMVM_CLASSES INSTALL_DIR"/share/jamvm/classes"
--#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath"
-+#define JAMVM_CLASSES CLASSPATH_INSTALL_DIR"/share/jamvm-initial/classes"
-+#define CLASSPATH_CLASSES CLASSPATH_INSTALL_DIR"/share/classpath-initial"
- #endif
- 
- #define DFLT_BCP JAMVM_CLASSES":"CLASSPATH_CLASSES
-Index: jamvm-1.5.0/src/dll.c
-===================================================================
---- jamvm-1.5.0.orig/src/dll.c	2007-12-20 00:01:24.000000000 +0100
-+++ jamvm-1.5.0/src/dll.c	2007-12-20 00:03:27.000000000 +0100
-@@ -294,7 +294,7 @@
- }
- 
- char *getBootDllPath() {
--    return CLASSPATH_INSTALL_DIR"/lib/classpath";
-+    return CLASSPATH_INSTALL_DIR"/lib/classpath-initial";
- }
- 
- char *getDllName(char *name) {
-Index: jamvm-1.5.0/src/Makefile.am
-===================================================================
---- jamvm-1.5.0.orig/src/Makefile.am	2007-12-20 00:21:37.000000000 +0100
-+++ jamvm-1.5.0/src/Makefile.am	2007-12-20 00:21:46.000000000 +0100
-@@ -23,7 +23,7 @@
- DIST_SUBDIRS = os arch interp
- 
- bin_PROGRAMS = jamvm
--include_HEADERS = jni.h
-+noinst_HEADERS = jni.h
- 
- lib_LTLIBRARIES = libjvm.la
- noinst_LTLIBRARIES = libcore.la
diff --git a/recipes/jamvm/files/jamvm_1.4.5-initial.patch b/recipes/jamvm/jamvm-initial/jamvm_1.4.5-initial.patch
similarity index 100%
rename from recipes/jamvm/files/jamvm_1.4.5-initial.patch
rename to recipes/jamvm/jamvm-initial/jamvm_1.4.5-initial.patch
diff --git a/recipes/jamvm/files/debian-jni.patch b/recipes/jamvm/jamvm/debian-jni.patch
similarity index 100%
rename from recipes/jamvm/files/debian-jni.patch
rename to recipes/jamvm/jamvm/debian-jni.patch
diff --git a/recipes/jamvm/files/jamvm-1.3.1-size-defaults.patch b/recipes/jamvm/jamvm/jamvm-1.3.1-size-defaults.patch
similarity index 100%
rename from recipes/jamvm/files/jamvm-1.3.1-size-defaults.patch
rename to recipes/jamvm/jamvm/jamvm-1.3.1-size-defaults.patch
diff --git a/recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch b/recipes/jamvm/jamvm/jamvm-1.5.3-jni_h-noinst.patch
similarity index 100%
rename from recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch
rename to recipes/jamvm/jamvm/jamvm-1.5.3-jni_h-noinst.patch
-- 
1.7.10.4



