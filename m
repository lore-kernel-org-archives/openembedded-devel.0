Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 166146B8FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:02:22 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 16:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="284568346"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 16:02:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:01:51 +0100
Message-Id: <5a63aeee936825b7cf0002688ee2e711f61cc8ca.1377039620.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377039620.git.paul.eggleton@linux.intel.com>
References: <cover.1377039620.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe, meta-webserver][PATCH 4/4] mysql5: replace with mariadb 5.1.67 and tweak
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2013 23:02:24 -0000

Switch to MariaDB (which is a drop-in replacement for MySQL) and use
the latest stable release from the 5.1 series.

* Update LIC_FILES_CHKSUM due to reformatted GPLv2 license text with
  updated FSF address
* Refresh patches
* Add two patches from the upstream 5.1 branch to fix CVE-2013-1861
* Add a package for libmysqld (the embedded server library)
* Disable "maria" plugin since this fails to compile and doesn't
  appear to be critical
* Drop some unrecognised/redundant options from EXTRA_OECONF
* Fix text relocation QA warnings introduced in the upgrade
* Convert to use useradd.bbclass for creating mysql user
* Set SUMMARY instead of description
* Move SRC_URI checksums to the version-specific inc file
* Clear out cruft in files/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/mysql/files/autofoo.patch  | 319 ----------------
 meta-oe/recipes-support/mysql/files/my.cnf         |  21 --
 ...5-native_5.1.40.bb => mariadb-native_5.1.67.bb} |   8 +-
 .../mysql/{mysql5 => mariadb}/Makefile.am.patch    |   0
 .../configure-ps-cache-check.patch                 |   0
 .../mysql/mariadb/configure.in.patch               |  13 +
 .../mysql/mariadb/fix-cve-2013-1861-1.patch        | 174 +++++++++
 .../mysql/mariadb/fix-cve-2013-1861-2.patch        | 257 +++++++++++++
 .../mysql/{files => mariadb}/fix_host_path.patch   |   0
 .../mysql/{mysql5 => mariadb}/misc.m4.patch        |   0
 .../mysql/{mysql5 => mariadb}/my.cnf               |   2 +-
 .../mysql/{files => mariadb}/mysqld.sh             |   0
 .../recipes-support/mysql/mariadb/plug.in.patch    | 405 +++++++++++++++++++++
 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb    |  14 +
 .../{mysql5_5.1.40.inc => mariadb_5.1.67.inc}      |  62 +++-
 .../mysql/mysql5/configure-ps-cache-check.patch    |  27 --
 .../mysql/mysql5/configure.in.patch                |  54 ---
 .../mysql/mysql5/fix-abi-check-gcc45.patch         |  77 ----
 .../mysql/mysql5/fix_host_path.patch               |  37 --
 meta-oe/recipes-support/mysql/mysql5/mysqld.sh     |  24 --
 meta-oe/recipes-support/mysql/mysql5/plug.in.patch |  40 --
 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb     |   6 -
 22 files changed, 908 insertions(+), 632 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mysql/files/autofoo.patch
 delete mode 100644 meta-oe/recipes-support/mysql/files/my.cnf
 rename meta-oe/recipes-support/mysql/{mysql5-native_5.1.40.bb => mariadb-native_5.1.67.bb} (54%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/Makefile.am.patch (100%)
 rename meta-oe/recipes-support/mysql/{files => mariadb}/configure-ps-cache-check.patch (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
 rename meta-oe/recipes-support/mysql/{files => mariadb}/fix_host_path.patch (100%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/misc.m4.patch (100%)
 rename meta-oe/recipes-support/mysql/{mysql5 => mariadb}/my.cnf (94%)
 rename meta-oe/recipes-support/mysql/{files => mariadb}/mysqld.sh (100%)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/plug.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
 rename meta-oe/recipes-support/mysql/{mysql5_5.1.40.inc => mariadb_5.1.67.inc} (75%)
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure.in.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/fix_host_path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/mysqld.sh
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/plug.in.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb

diff --git a/meta-oe/recipes-support/mysql/files/autofoo.patch b/meta-oe/recipes-support/mysql/files/autofoo.patch
deleted file mode 100644
index 669393a..0000000
--- a/meta-oe/recipes-support/mysql/files/autofoo.patch
+++ /dev/null
@@ -1,319 +0,0 @@
-diff -aurp mysql-4.1.22.old/acinclude.m4 mysql-4.1.22/acinclude.m4
---- mysql-4.1.22.old/acinclude.m4	2008-09-18 13:00:13.000000000 -0500
-+++ mysql-4.1.22/acinclude.m4	2008-09-18 12:58:41.000000000 -0500
-@@ -1,5 +1,88 @@
- # Local macros for automake & autoconf
- 
-+AH_TEMPLATE([SPRINTF_RETURNS_INT], [sprintf returns an int])
-+AH_TEMPLATE([SPRINTF_RETURNS_PTR], [sprintf returns a char *])
-+AH_TEMPLATE([SPRINTF_RETURNS_GARBAGE], [sprintf returns something unknown to us])
-+
-+AC_DEFUN([MYSQL_SPRINTF_RET], [
-+  AC_CACHE_CHECK([return type of sprintf],
-+	         [mysql_cv_func_sprintf_ret], [
-+    old_CFLAGS="$CFLAGS"
-+    CFLAGS="$CFLAGS -Werror"
-+    AC_COMPILE_IFELSE([
-+#include <stdio.h>
-+int sprintf(char *str, const char *format, ...);
-+      ], [mysql_cv_func_sprintf_ret=int],
-+      AC_COMPILE_IFELSE([
-+#include <stdio.h>
-+char * sprintf(char *str, const char *format, ...);
-+        ], [mysql_cv_func_sprintf_ret=ptr],
-+	[mysql_cv_func_sprintf_ret=unknown])
-+    )
-+    CFLAGS="$old_CFLAGS"
-+  ])
-+  if test x"$mysql_cv_func_sprintf_ret" = "xint"; then
-+    AC_DEFINE([SPRINTF_RETURNS_INT], [1])
-+  elif test x"$mysql_cv_func_sprintf_ret" = "xptr"; then
-+    AC_DEFINE([SPRINTF_RETURNS_PTR], [1])
-+  else
-+    AC_DEFINE([SPRINTF_RETURNS_GARBAGE], [1])
-+  fi
-+])
-+
-+# _MYSQL_FUNC_ATOMIC_ADD
-+# ----------------------
-+# Check for Linux specific atomic_add function
-+AC_DEFUN([_MYSQL_FUNC_ATOMIC_ADD],
-+[AC_CACHE_CHECK([for atomic_add], [mysql_cv_func_atomic_add],
-+[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <asm/atomic.h>]],
-+                                [
-+int main()
-+{
-+  atomic_t v;
-+
-+  atomic_set(&v, 23);
-+  atomic_add(5, &v);
-+  return atomic_read(&v) == 28 ? 0 : -1;
-+}
-+				])],
-+                   [mysql_cv_func_atomic_add=yes],
-+                   [mysql_cv_func_atomic_add=no])])
-+  if test x"$mysql_func_atomic_add" = "xyes"; then
-+    AC_DEFINE([HAVE_ATOMIC_ADD], [1])
-+  fi[]dnl
-+])# _MYSQL_FUNC_ATOMIC_ADD
-+
-+# _MYSQL_FUNC_ATOMIC_SUB
-+# ----------------------
-+# Check for Linux specific atomic_sub function
-+AC_DEFUN([_MYSQL_FUNC_ATOMIC_SUB],
-+[AC_CACHE_CHECK([for atomic_sub], [mysql_cv_func_atomic_sub],
-+[AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <asm/atomic.h>]],
-+                                [
-+int main()
-+{
-+  atomic_t v;
-+
-+  atomic_set(&v, 23);
-+  atomic_sub(5, &v);
-+  return atomic_read(&v) == 18 ? 0 : -1;
-+}
-+				])],
-+                   [mysql_cv_func_atomic_sub=yes],
-+                   [mysql_cv_func_atomic_sub=no])])
-+  if test x"$mysql_func_atomic_sub" = "xyes"; then
-+    AC_DEFINE([HAVE_ATOMIC_SUB], [1])
-+  fi[]dnl
-+])# _MYSQL_FUNC_ATOMIC_SUB
-+
-+# MYSQL_FUNCS_ATOMIC
-+# ------------------
-+# Check for Linux specific atomic add and sub functions
-+AC_DEFUN([MYSQL_FUNCS_ATOMIC], [
-+  AC_REQUIRE([_MYSQL_FUNC_ATOMIC_ADD])dnl
-+  AC_REQUIRE([_MYSQL_FUNC_ATOMIC_SUB])dnl
-+])# MYSQL_FUNCS_ATOMIC
- 
- AC_DEFUN([MYSQL_CHECK_READLINE_DECLARES_HIST_ENTRY], [
-     AC_CACHE_CHECK([HIST_ENTRY is declared in readline/readline.h], mysql_cv_hist_entry_declared,
-@@ -344,7 +427,7 @@ dnl ------------------------------------
- AC_DEFUN([MYSQL_CHECK_ULONG],
- [AC_MSG_CHECKING(for type ulong)
- AC_CACHE_VAL(ac_cv_ulong,
--[AC_TRY_RUN([#include <stdio.h>
-+[AC_TRY_LINK([#include <stdio.h>
- #include <sys/types.h>
- main()
- {
-@@ -362,7 +445,7 @@ fi
- AC_DEFUN([MYSQL_CHECK_UCHAR],
- [AC_MSG_CHECKING(for type uchar)
- AC_CACHE_VAL(ac_cv_uchar,
--[AC_TRY_RUN([#include <stdio.h>
-+[AC_TRY_LINK([#include <stdio.h>
- #include <sys/types.h>
- main()
- {
-@@ -380,7 +463,7 @@ fi
- AC_DEFUN([MYSQL_CHECK_UINT],
- [AC_MSG_CHECKING(for type uint)
- AC_CACHE_VAL(ac_cv_uint,
--[AC_TRY_RUN([#include <stdio.h>
-+[AC_TRY_LINK([#include <stdio.h>
- #include <sys/types.h>
- main()
- {
-@@ -399,7 +482,7 @@ fi
- AC_DEFUN([MYSQL_CHECK_IN_ADDR_T],
- [AC_MSG_CHECKING(for type in_addr_t)
- AC_CACHE_VAL(ac_cv_in_addr_t,
--[AC_TRY_RUN([#include <stdio.h>
-+[AC_TRY_LINK([#include <stdio.h>
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
-@@ -460,7 +543,7 @@ fi
- AC_DEFUN([MYSQL_CHECK_FP_EXCEPT],
- [AC_MSG_CHECKING(for type fp_except)
- AC_CACHE_VAL(ac_cv_fp_except,
--[AC_TRY_RUN([#include <stdio.h>
-+[AC_TRY_LINK([#include <stdio.h>
- #include <sys/types.h>
- #include <ieeefp.h>
- main()
-diff -aurp mysql-4.1.22.old/configure.in mysql-4.1.22/configure.in
---- mysql-4.1.22.old/configure.in	2008-09-18 13:00:14.000000000 -0500
-+++ mysql-4.1.22/configure.in	2008-09-18 12:54:00.000000000 -0500
-@@ -236,8 +236,6 @@ then
- else
-   AC_PATH_PROG(AS, as, as)
- fi
--# Still need ranlib for readline; local static use only so no libtool.
--AC_PROG_RANLIB
- # We use libtool
- #AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
-@@ -258,44 +256,7 @@ AC_PROG_YACC
- AC_CHECK_PROG(PDFMANUAL, pdftex, manual.pdf)
- AC_CHECK_PROG(DVIS,      tex,    manual.dvi)
- 
--AC_MSG_CHECKING("return type of sprintf")
--
--#check the return type of sprintf
--case $SYSTEM_TYPE in
--  *netware*)
--    AC_DEFINE(SPRINTF_RETURNS_INT, [1]) AC_MSG_RESULT("int")
--    ;;
--  *)
--AC_TRY_RUN([
--  int main()
--    {
--      char* s = "hello";
--      char buf[6];
--      if((int)sprintf(buf, s) == strlen(s))
--	return 0;
--      
--      return -1;
--     }
--   ],
--   [AC_DEFINE(SPRINTF_RETURNS_INT, [1], [POSIX sprintf])
--   AC_MSG_RESULT("int")],
--   [AC_TRY_RUN([
-- int main()
--   {
--     char* s = "hello";
--     char buf[6];
--     if((char*)sprintf(buf,s) == buf + strlen(s))
--       return 0;
--     return -1;
--   }           ],
--               [AC_DEFINE(SPRINTF_RETURNS_PTR, [1], [Broken sprintf])
--                AC_MSG_RESULT("ptr")],
--               [AC_DEFINE(SPRINTF_RETURNS_GARBAGE, [1], [Broken sprintf])
--                AC_MSG_RESULT("garbage")])
--   ])
--    ;;
--esac
--
-+MYSQL_SPRINTF_RET
- 
- # option, cache_name, variable,
- # code to execute if yes, code to exectute if fail
-@@ -878,47 +839,7 @@ struct request_info *req;
- AC_SUBST(WRAPLIBS)
- 
- if test "$TARGET_LINUX" = "true"; then
--  AC_MSG_CHECKING([for atomic operations])
--
--  AC_LANG_SAVE
--  AC_LANG_CPLUSPLUS
--
--  atom_ops=
--  AC_TRY_RUN([
--#include <asm/atomic.h>
--int main()
--{
--  atomic_t v;
--
--  atomic_set(&v, 23);
--  atomic_add(5, &v);
--  return atomic_read(&v) == 28 ? 0 : -1;
--}
--  ],
--  [AC_DEFINE([HAVE_ATOMIC_ADD], [1],
--             [atomic_add() from <asm/atomic.h> (Linux only)])
--   atom_ops="${atom_ops}atomic_add "],
--  )
--  AC_TRY_RUN([
--#include <asm/atomic.h>
--int main()
--{
--  atomic_t v;
--
--  atomic_set(&v, 23);
--  atomic_sub(5, &v);
--  return atomic_read(&v) == 18 ? 0 : -1;
--}
--  ],
--  [AC_DEFINE([HAVE_ATOMIC_SUB], [1],
--             [atomic_sub() from <asm/atomic.h> (Linux only)])
--   atom_ops="${atom_ops}atomic_sub "],
--  )
--
--  if test -z "$atom_ops"; then atom_ops="no"; fi
--  AC_MSG_RESULT($atom_ops)
--
--  AC_LANG_RESTORE
-+  MYSQL_FUNC_ATOMIC
- 
-   AC_ARG_WITH(pstack,
-     [  --with-pstack           Use the pstack backtrace library],
-@@ -971,13 +892,13 @@ fi
- # Later in this script LIBS will be augmented with a threads library.
- NON_THREADED_LIBS="$LIBS"
- 
--AC_MSG_CHECKING([for int8])
-+AC_CACHE_CHECK([for int8], [mysql_cv_type_int8], [
- case $SYSTEM_TYPE in
-   *netware)
-     AC_MSG_RESULT([no])
-     ;;
-   *)
--AC_TRY_RUN([
-+AC_LINK_IFELSE([AC_LANG_PROGRAM([[
- #ifdef HAVE_STDLIB_H
- #include <stdlib.h>
- #endif
-@@ -988,22 +909,21 @@ AC_TRY_RUN([
- 
- #ifdef HAVE_SYS_TYPES_H
- #include <sys/types.h>
--#endif
--
-+#endif]], [
- int main()
- {
-   int8 i;
-   return 0;
--}
--],
--[AC_DEFINE([HAVE_INT_8_16_32], [1],
--           [whether int8, int16 and int32 types exist])
--AC_MSG_RESULT([yes])],
--[AC_MSG_RESULT([no])]
--)
-+}])], [mysql_cv_type_int8=yes], [mysql_cv_type_int8=no])
-     ;;
- esac
- 
-+if test x"$mysql_cv_type_int8" = "xyes"; then
-+  AC_DEFINE([HAVE_INT_8_16_32], [1],
-+           [whether int8, int16 and int32 types exist])
-+fi
-+])
-+
- #
- # Some system specific hacks
- #
-@@ -1814,7 +1734,7 @@ then
-   AC_MSG_ERROR("MySQL needs a long long type.")
- fi
- # off_t is not a builtin type
--MYSQL_CHECK_SIZEOF(off_t, 4)
-+AC_CHECK_SIZEOF(off_t, 4)
- if test "$ac_cv_sizeof_off_t" -eq 0
- then
-   AC_MSG_ERROR("MySQL needs a off_t type.")
-diff -aurp mysql-4.1.22.old/innobase/configure.in mysql-4.1.22/innobase/configure.in
---- mysql-4.1.22.old/innobase/configure.in	2008-09-18 13:00:14.000000000 -0500
-+++ mysql-4.1.22/innobase/configure.in	2008-09-18 12:55:39.000000000 -0500
-@@ -3,6 +3,7 @@ AC_INIT
- AC_CANONICAL_SYSTEM
- AM_MAINTAINER_MODE
- AM_CONFIG_HEADER(ib_config.h)
-+AC_CONFIG_AUX_DIR([..])
- AM_INIT_AUTOMAKE(ib, 0.90)
- 
- # This is need before AC_PROG_CC
-@@ -32,7 +33,6 @@ CFLAGS="$CFLAGS "
- CXXFLAGS="$CXXFLAGS "
- 
- AC_PROG_CC
--AC_PROG_RANLIB
- AC_PROG_INSTALL
- AC_PROG_LIBTOOL
- AC_CHECK_HEADERS(aio.h sched.h)
diff --git a/meta-oe/recipes-support/mysql/files/my.cnf b/meta-oe/recipes-support/mysql/files/my.cnf
deleted file mode 100644
index 85560eb..0000000
--- a/meta-oe/recipes-support/mysql/files/my.cnf
+++ /dev/null
@@ -1,21 +0,0 @@
-[client]
-#password					= password
-port						= 3306
-socket						= /tmp/mysql.sock
-
-[mysqld_safe]
-err-log						= /var/log/mysql.err
-
-[mysqld]
-user 						= mysql
-port 						= 3306
-socket 						= /tmp/mysql.sock
-pid-file 					= /var/lib/mysql/mysqld.pid
-log-error 					= /var/log/mysqld.err
-basedir 					= /usr
-datadir 					= /var/mysql
-skip-locking
-skip-innodb
-skip-networking
-bind-address					= localhost
-
diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
similarity index 54%
rename from meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
index dcaf0c6..19cc33b 100644
--- a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
@@ -1,9 +1,5 @@
-require mysql5_${PV}.inc
+require mariadb_${PV}.inc
 inherit native
-PR ="r3"
-
-SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
-           file://fix-abi-check-gcc45.patch"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
@@ -20,5 +16,3 @@ do_install() {
     install -m 0755 sql/gen_lex_hash ${D}${bindir}/
 }
 
-SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad"
-SRC_URI[sha256sum] = "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10bdb862761d0f0432"
diff --git a/meta-oe/recipes-support/mysql/mysql5/Makefile.am.patch b/meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mysql5/Makefile.am.patch
rename to meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
diff --git a/meta-oe/recipes-support/mysql/files/configure-ps-cache-check.patch b/meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/files/configure-ps-cache-check.patch
rename to meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
diff --git a/meta-oe/recipes-support/mysql/mariadb/configure.in.patch b/meta-oe/recipes-support/mysql/mariadb/configure.in.patch
new file mode 100644
index 0000000..6fe2dfa
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/configure.in.patch
@@ -0,0 +1,13 @@
+Index: mysql-5.1.40/configure.in
+===================================================================
+--- mysql-5.1.40.orig/configure.in
++++ mysql-5.1.40/configure.in
+@@ -226,8 +226,6 @@ else
+   AC_PATH_PROG(AS, as, as)
+ fi
+ 
+-# Still need ranlib for readline; local static use only so no libtool.
+-AC_PROG_RANLIB
+ # We use libtool
+ #AC_LIBTOOL_WIN32_DLL
+ AC_PROG_LIBTOOL
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
new file mode 100644
index 0000000..df2e708
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
@@ -0,0 +1,174 @@
+From 24404044ad4c28026e400e1fcd85358f2060aa96 Mon Sep 17 00:00:00 2001
+From: Alexey Botchkov <holyfoot@askmonty.org>
+Date: Sun, 10 Mar 2013 23:08:05 +0400
+Subject: [PATCH] MDEV-4252 geometry query crashes server.       The bug was
+ found by Alyssa Milburn.       If the number of points of a geometry feature
+ read from       binary representation is greater than 0x10000000, then      
+ the (uint32) (num_points * 16) will cut the higher byte,       which leads to
+ various errors.       Fixed by additional check if (num_points >
+ max_n_points).
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ mysql-test/r/gis.result |  3 +++
+ mysql-test/t/gis.test   |  1 +
+ sql/spatial.cc          | 27 ++++++++++++++++++---------
+ sql/spatial.h           |  9 +++++----
+ 4 files changed, 27 insertions(+), 13 deletions(-)
+
+diff --git a/mysql-test/r/gis.result b/mysql-test/r/gis.result
+index 8dad72f..69e73d0 100644
+--- a/mysql-test/r/gis.result
++++ b/mysql-test/r/gis.result
+@@ -1087,4 +1087,7 @@ NULL
+ #
+ SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
+ ERROR 22007: Illegal non geometric '' value found during parsing
++select astext(0x0100000000030000000100000000000010);
++astext(0x0100000000030000000100000000000010)
++NULL
+ End of 5.1 tests
+diff --git a/mysql-test/t/gis.test b/mysql-test/t/gis.test
+index abda3e9..cc5d158 100644
+--- a/mysql-test/t/gis.test
++++ b/mysql-test/t/gis.test
+@@ -826,5 +826,6 @@ SELECT ISCLOSED(CONVERT(CONCAT('     ', 0x2), BINARY(20)));
+ --error ER_ILLEGAL_VALUE_FOR_TYPE
+ SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
+ 
++select astext(0x0100000000030000000100000000000010);
+ 
+ --echo End of 5.1 tests
+diff --git a/sql/spatial.cc b/sql/spatial.cc
+index eec028e..94d0238 100644
+--- a/sql/spatial.cc
++++ b/sql/spatial.cc
+@@ -556,7 +556,7 @@ bool Gis_line_string::get_data_as_wkt(String *txt, const char **end) const
+   n_points= uint4korr(data);
+   data += 4;
+ 
+-  if (n_points < 1 ||
++  if (n_points < 1 || n_points > max_n_points ||
+       no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points) ||
+       txt->reserve(((MAX_DIGITS_IN_DOUBLE + 1)*2 + 1) * n_points))
+     return 1;
+@@ -594,7 +594,8 @@ int Gis_line_string::geom_length(double *len) const
+     return 1;
+   n_points= uint4korr(data);
+   data+= 4;
+-  if (n_points < 1 || no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
++  if (n_points < 1 || n_points > max_n_points ||
++      no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
+     return 1;
+ 
+   get_point(&prev_x, &prev_y, data);
+@@ -628,7 +629,7 @@ int Gis_line_string::is_closed(int *closed) const
+     return 0;
+   }
+   data+= 4;
+-  if (n_points == 0 ||
++  if (n_points == 0 || n_points > max_n_points ||
+       no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
+     return 1;
+ 
+@@ -798,7 +799,8 @@ bool Gis_polygon::get_data_as_wkt(String *txt, const char **end) const
+       return 1;
+     n_points= uint4korr(data);
+     data+= 4;
+-    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points) ||
++    if (n_points > max_n_points ||
++        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points) ||
+ 	txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
+       return 1;
+     txt->qs_append('(');
+@@ -852,7 +854,8 @@ int Gis_polygon::area(double *ar, const char **end_of_data) const
+     if (no_data(data, 4))
+       return 1;
+     n_points= uint4korr(data);
+-    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
++    if (n_points > max_n_points ||
++        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
+       return 1;
+     get_point(&prev_x, &prev_y, data+4);
+     data+= (4+SIZEOF_STORED_DOUBLE*2);
+@@ -888,7 +891,8 @@ int Gis_polygon::exterior_ring(String *result) const
+   n_points= uint4korr(data);
+   data+= 4;
+   length= n_points * POINT_DATA_SIZE;
+-  if (no_data(data, length) || result->reserve(1+4+4+ length))
++  if (n_points > max_n_points ||
++      no_data(data, length) || result->reserve(1+4+4+ length))
+     return 1;
+ 
+   result->q_append((char) wkb_ndr);
+@@ -973,7 +977,8 @@ int Gis_polygon::centroid_xy(double *x, double *y) const
+       return 1;
+     org_n_points= n_points= uint4korr(data);
+     data+= 4;
+-    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
++    if (n_points > max_n_points ||
++        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
+       return 1;
+     get_point(&prev_x, &prev_y, data);
+     data+= (SIZEOF_STORED_DOUBLE*2);
+@@ -1260,7 +1265,8 @@ bool Gis_multi_line_string::get_data_as_wkt(String *txt,
+       return 1;
+     n_points= uint4korr(data + WKB_HEADER_SIZE);
+     data+= WKB_HEADER_SIZE + 4;
+-    if (no_data(data, n_points * (SIZEOF_STORED_DOUBLE*2)) ||
++    if (n_points > max_n_points ||
++        no_data(data, n_points * (SIZEOF_STORED_DOUBLE*2)) ||
+ 	txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
+       return 1;
+     txt->qs_append('(');
+@@ -1521,7 +1527,8 @@ bool Gis_multi_polygon::get_data_as_wkt(String *txt, const char **end) const
+         return 1;
+       uint32 n_points= uint4korr(data);
+       data+= 4;
+-      if (no_data(data, (SIZEOF_STORED_DOUBLE * 2) * n_points) ||
++      if (n_points > max_n_points ||
++          no_data(data, (SIZEOF_STORED_DOUBLE * 2) * n_points) ||
+ 	  txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points,
+ 		       512))
+ 	return 1;
+@@ -1604,6 +1611,8 @@ int Gis_multi_polygon::geometry_n(uint32 num, String *result) const
+       if (no_data(data, 4))
+ 	return 1;
+       n_points= uint4korr(data);
++      if (n_points > max_n_points)
++        return 1;
+       data+= 4 + POINT_DATA_SIZE * n_points;
+     }
+   } while (--num);
+diff --git a/sql/spatial.h b/sql/spatial.h
+index 20b3856..7d25425 100644
+--- a/sql/spatial.h
++++ b/sql/spatial.h
+@@ -197,6 +197,11 @@ struct MBR
+ class Geometry
+ {
+ public:
++  // Maximum number of points in feature that can fit into String
++  static const uint32 max_n_points=
++    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
++    POINT_DATA_SIZE;
++public:
+   Geometry() {}                               /* Remove gcc warning */
+   virtual ~Geometry() {}                        /* Remove gcc warning */
+   static void *operator new(size_t size, void *buffer)
+@@ -379,10 +384,6 @@ class Gis_point: public Geometry
+ 
+ class Gis_line_string: public Geometry
+ {
+-  // Maximum number of points in LineString that can fit into String
+-  static const uint32 max_n_points=
+-    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
+-    POINT_DATA_SIZE;
+ public:
+   Gis_line_string() {}                        /* Remove gcc warning */
+   virtual ~Gis_line_string() {}               /* Remove gcc warning */
+-- 
+1.8.1.6
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
new file mode 100644
index 0000000..c35cdfb
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
@@ -0,0 +1,257 @@
+From 9f714cdd3bf4bd8ee06cd38dcd2c6e8990a4ec48 Mon Sep 17 00:00:00 2001
+From: Alexey Botchkov <holyfoot@askmonty.org>
+Date: Mon, 18 Mar 2013 17:58:00 +0400
+Subject: [PATCH] MDEV-4252 geometry query crashes server.     Additional fixes
+ for possible overflows in length-related     calculations in 'spatial'
+ implementations.     Checks added to the ::get_data_size() methods.    
+ max_n_points decreased to occupy less 2G size. An     object of that size is
+ practically inoperable anyway.
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ mysql-test/r/gis.result | 12 +++++++++
+ mysql-test/t/gis.test   |  6 +++++
+ sql/spatial.cc          | 67 ++++++++++++++++++++++++++++++++++---------------
+ sql/spatial.h           |  2 +-
+ 4 files changed, 66 insertions(+), 21 deletions(-)
+
+diff --git a/mysql-test/r/gis.result b/mysql-test/r/gis.result
+index 69e73d0..7566f0b 100644
+--- a/mysql-test/r/gis.result
++++ b/mysql-test/r/gis.result
+@@ -1087,7 +1087,19 @@ NULL
+ #
+ SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
+ ERROR 22007: Illegal non geometric '' value found during parsing
++#
++# MDEV-4252 geometry query crashes server
++#
+ select astext(0x0100000000030000000100000000000010);
+ astext(0x0100000000030000000100000000000010)
+ NULL
++select envelope(0x0100000000030000000100000000000010);
++envelope(0x0100000000030000000100000000000010)
++NULL
++select geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1);
++geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1)
++NULL
++select geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1);
++geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1)
++NULL
+ End of 5.1 tests
+diff --git a/mysql-test/t/gis.test b/mysql-test/t/gis.test
+index cc5d158..c42541e 100644
+--- a/mysql-test/t/gis.test
++++ b/mysql-test/t/gis.test
+@@ -826,6 +826,12 @@ SELECT ISCLOSED(CONVERT(CONCAT('     ', 0x2), BINARY(20)));
+ --error ER_ILLEGAL_VALUE_FOR_TYPE
+ SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
+ 
++--echo #
++--echo # MDEV-4252 geometry query crashes server
++--echo #
+ select astext(0x0100000000030000000100000000000010);
++select envelope(0x0100000000030000000100000000000010);
++select geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1);
++select geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1);
+ 
+ --echo End of 5.1 tests
+diff --git a/sql/spatial.cc b/sql/spatial.cc
+index 94d0238..5a4b768 100644
+--- a/sql/spatial.cc
++++ b/sql/spatial.cc
+@@ -394,18 +394,19 @@ const char *Geometry::append_points(String *txt, uint32 n_points,
+ const char *Geometry::get_mbr_for_points(MBR *mbr, const char *data,
+ 					 uint offset) const
+ {
+-  uint32 points;
++  uint32 n_points;
+   /* read number of points */
+   if (no_data(data, 4))
+     return 0;
+-  points= uint4korr(data);
++  n_points= uint4korr(data);
+   data+= 4;
+ 
+-  if (no_data(data, (SIZEOF_STORED_DOUBLE * 2 + offset) * points))
++  if (n_points > max_n_points ||
++      no_data(data, (POINT_DATA_SIZE + offset) * n_points))
+     return 0;
+ 
+   /* Calculate MBR for points */
+-  while (points--)
++  while (n_points--)
+   {
+     data+= offset;
+     mbr->add_xy(data, data + SIZEOF_STORED_DOUBLE);
+@@ -484,9 +485,12 @@ const Geometry::Class_info *Gis_point::get_class_info() const
+ 
+ uint32 Gis_line_string::get_data_size() const 
+ {
+-  if (no_data(m_data, 4))
++  uint32 n_points, size;
++  if (no_data(m_data, 4) ||
++      (n_points= uint4korr(m_data)) > max_n_points ||
++      no_data(m_data, (size= 4 + n_points * POINT_DATA_SIZE)))
+     return GET_SIZE_ERROR;
+-  return 4 + uint4korr(m_data) * POINT_DATA_SIZE;
++  return size;
+ }
+ 
+ 
+@@ -665,6 +669,9 @@ int Gis_line_string::end_point(String *result) const
+   if (no_data(m_data, 4))
+     return 1;
+   n_points= uint4korr(m_data);
++  if (n_points == 0 || n_points > max_n_points ||
++      no_data(m_data, POINT_DATA_SIZE * n_points))
++    return 1;
+   return create_point(result, m_data + 4 + (n_points - 1) * POINT_DATA_SIZE);
+ }
+ 
+@@ -674,11 +681,14 @@ int Gis_line_string::point_n(uint32 num, String *result) const
+   uint32 n_points;
+   if (no_data(m_data, 4))
+     return 1;
++  num--;
+   n_points= uint4korr(m_data);
+-  if ((uint32) (num - 1) >= n_points) // means (num > n_points || num < 1)
++  if (num >= n_points ||
++      num > max_n_points || // means (num > n_points || num < 1)
++      no_data(m_data, num * POINT_DATA_SIZE))
+     return 1;
+ 
+-  return create_point(result, m_data + 4 + (num - 1) * POINT_DATA_SIZE);
++  return create_point(result, m_data + 4 + num*POINT_DATA_SIZE);
+ }
+ 
+ const Geometry::Class_info *Gis_line_string::get_class_info() const
+@@ -692,6 +702,7 @@ const Geometry::Class_info *Gis_line_string::get_class_info() const
+ uint32 Gis_polygon::get_data_size() const 
+ {
+   uint32 n_linear_rings;
++  uint32 n_points;
+   const char *data= m_data;
+ 
+   if (no_data(data, 4))
+@@ -701,10 +712,13 @@ uint32 Gis_polygon::get_data_size() const
+ 
+   while (n_linear_rings--)
+   {
+-    if (no_data(data, 4))
++    if (no_data(data, 4) ||
++        (n_points= uint4korr(data)) > max_n_points)
+       return GET_SIZE_ERROR;
+-    data+= 4 + uint4korr(data)*POINT_DATA_SIZE;
++    data+= 4 + n_points*POINT_DATA_SIZE;
+   }
++  if (no_data(data, 0))
++    return GET_SIZE_ERROR;
+   return (uint32) (data - m_data);
+ }
+ 
+@@ -1037,9 +1051,14 @@ const Geometry::Class_info *Gis_polygon::get_class_info() const
+ 
+ uint32 Gis_multi_point::get_data_size() const 
+ {
+-  if (no_data(m_data, 4))
+-    return GET_SIZE_ERROR;
+-  return 4 + uint4korr(m_data)*(POINT_DATA_SIZE + WKB_HEADER_SIZE);
++  uint32 n_points;
++  uint32 size;
++
++  if (no_data(m_data, 4) ||
++      (n_points= uint4korr(m_data)) > max_n_points ||
++      no_data(m_data, (size= 4 + n_points*(POINT_DATA_SIZE + WKB_HEADER_SIZE))))
++     return GET_SIZE_ERROR;
++  return size;
+ }
+ 
+ 
+@@ -1107,7 +1126,8 @@ bool Gis_multi_point::get_data_as_wkt(String *txt, const char **end) const
+     return 1;
+ 
+   n_points= uint4korr(m_data);
+-  if (no_data(m_data+4,
++  if (n_points > max_n_points ||
++      no_data(m_data+4,
+ 	      n_points * (SIZEOF_STORED_DOUBLE * 2 + WKB_HEADER_SIZE)) ||
+       txt->reserve(((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
+     return 1;
+@@ -1160,6 +1180,7 @@ const Geometry::Class_info *Gis_multi_point::get_class_info() const
+ uint32 Gis_multi_line_string::get_data_size() const 
+ {
+   uint32 n_line_strings;
++  uint32 n_points;
+   const char *data= m_data;
+ 
+   if (no_data(data, 4))
+@@ -1169,11 +1190,13 @@ uint32 Gis_multi_line_string::get_data_size() const
+ 
+   while (n_line_strings--)
+   {
+-    if (no_data(data, WKB_HEADER_SIZE + 4))
++    if (no_data(data, WKB_HEADER_SIZE + 4) ||
++        (n_points= uint4korr(data + WKB_HEADER_SIZE)) > max_n_points)
+       return GET_SIZE_ERROR;
+-    data+= (WKB_HEADER_SIZE + 4 + uint4korr(data + WKB_HEADER_SIZE) *
+-	    POINT_DATA_SIZE);
++    data+= (WKB_HEADER_SIZE + 4 + n_points*POINT_DATA_SIZE);
+   }
++  if (no_data(data, 0))
++    return GET_SIZE_ERROR;
+   return (uint32) (data - m_data);
+ }
+ 
+@@ -1327,7 +1350,7 @@ int Gis_multi_line_string::geometry_n(uint32 num, String *result) const
+       return 1;
+     n_points= uint4korr(data + WKB_HEADER_SIZE);
+     length= WKB_HEADER_SIZE + 4+ POINT_DATA_SIZE * n_points;
+-    if (no_data(data, length))
++    if (n_points > max_n_points || no_data(data, length))
+       return 1;
+     if (!--num)
+       break;
+@@ -1407,6 +1430,7 @@ const Geometry::Class_info *Gis_multi_line_string::get_class_info() const
+ uint32 Gis_multi_polygon::get_data_size() const 
+ {
+   uint32 n_polygons;
++  uint32 n_points;
+   const char *data= m_data;
+ 
+   if (no_data(data, 4))
+@@ -1425,11 +1449,14 @@ uint32 Gis_multi_polygon::get_data_size() const
+ 
+     while (n_linear_rings--)
+     {
+-      if (no_data(data, 4))
++      if (no_data(data, 4) ||
++          (n_points= uint4korr(data)) > max_n_points)
+ 	return GET_SIZE_ERROR;
+-      data+= 4 + uint4korr(data) * POINT_DATA_SIZE;
++      data+= 4 + n_points * POINT_DATA_SIZE;
+     }
+   }
++  if (no_data(data, 0))
++    return GET_SIZE_ERROR;
+   return (uint32) (data - m_data);
+ }
+ 
+diff --git a/sql/spatial.h b/sql/spatial.h
+index 7d25425..d7632c1 100644
+--- a/sql/spatial.h
++++ b/sql/spatial.h
+@@ -199,7 +199,7 @@ class Geometry
+ public:
+   // Maximum number of points in feature that can fit into String
+   static const uint32 max_n_points=
+-    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
++    (uint32) (INT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
+     POINT_DATA_SIZE;
+ public:
+   Geometry() {}                               /* Remove gcc warning */
+-- 
+1.8.1.6
+
diff --git a/meta-oe/recipes-support/mysql/files/fix_host_path.patch b/meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/files/fix_host_path.patch
rename to meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
diff --git a/meta-oe/recipes-support/mysql/mysql5/misc.m4.patch b/meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
similarity index 100%
rename from meta-oe/recipes-support/mysql/mysql5/misc.m4.patch
rename to meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
diff --git a/meta-oe/recipes-support/mysql/mysql5/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
similarity index 94%
rename from meta-oe/recipes-support/mysql/mysql5/my.cnf
rename to meta-oe/recipes-support/mysql/mariadb/my.cnf
index 7f557e4..8470817 100644
--- a/meta-oe/recipes-support/mysql/mysql5/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -15,7 +15,7 @@ log-error 					= /var/log/mysqld.err
 basedir 					= /usr
 datadir 					= /var/mysql
 skip-locking
-loose-skip-innodb
 skip-networking
+ignore-builtin-innodb
 bind-address					= localhost
 
diff --git a/meta-oe/recipes-support/mysql/files/mysqld.sh b/meta-oe/recipes-support/mysql/mariadb/mysqld.sh
similarity index 100%
rename from meta-oe/recipes-support/mysql/files/mysqld.sh
rename to meta-oe/recipes-support/mysql/mariadb/mysqld.sh
diff --git a/meta-oe/recipes-support/mysql/mariadb/plug.in.patch b/meta-oe/recipes-support/mysql/mariadb/plug.in.patch
new file mode 100644
index 0000000..156fd10
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/plug.in.patch
@@ -0,0 +1,405 @@
+diff --git a/storage/innodb_plugin/plug.in b/storage/innodb_plugin/plug.in
+index 7650251..3cc22c5 100644
+--- a/storage/innodb_plugin/plug.in
++++ b/storage/innodb_plugin/plug.in
+@@ -56,180 +56,10 @@ MYSQL_PLUGIN_ACTIONS(innodb_plugin,  [
+   esac
+   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
+ 
+-  AC_MSG_CHECKING(whether GCC atomic builtins are available)
+-  # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-  AC_TRY_RUN(
+-    [
+-      int main()
+-      {
+-	long	x;
+-	long	y;
+-	long	res;
+-	char	c;
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_bool_compare_and_swap(&x, x, y);
+-	if (!res || x != y) {
+-          return(1);
+-        }
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_bool_compare_and_swap(&x, x + 1, y);
+-	if (res || x != 10) {
+-          return(1);
+-        }
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_add_and_fetch(&x, y);
+-	if (res != 123 + 10 || x != 123 + 10) {
+-	  return(1);
+-	}
+-
+-	c = 10;
+-	res = __sync_lock_test_and_set(&c, 123);
+-	if (res != 10 || c != 123) {
+-	  return(1);
+-	}
+-
+-	return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
+-                [GCC atomic builtins are available])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+-  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
+-  # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
+-  AC_TRY_RUN(
+-    [
+-      #include <pthread.h>
+-      #include <string.h>
+-
+-      int main(int argc, char** argv) {
+-        pthread_t       x1;
+-        pthread_t       x2;
+-        pthread_t       x3;
+-
+-	memset(&x1, 0x0, sizeof(x1));
+-	memset(&x2, 0x0, sizeof(x2));
+-	memset(&x3, 0x0, sizeof(x3));
+-
+-        __sync_bool_compare_and_swap(&x1, x2, x3);
+-
+-        return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
+-                [pthread_t can be used by GCC atomic builtins])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+-  AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
+-  # Define HAVE_IB_SOLARIS_ATOMICS if _all_ of the following
+-  # functions are present.
+-  AC_CHECK_FUNCS(atomic_add_long_nv \
+-		 atomic_cas_32 \
+-		 atomic_cas_64 \
+-		 atomic_cas_ulong \
+-		 atomic_swap_uchar)
+-
+-  if test "${ac_cv_func_atomic_add_long_nv}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_32}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_64}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_ulong}" = "yes" -a \
+-          "${ac_cv_func_atomic_swap_uchar}" = "yes" ; then
+-
+-    AC_DEFINE([HAVE_IB_SOLARIS_ATOMICS], [1],
+-      [Define to 1 if Solaris libc atomic functions are available]
+-    )
+-  fi
+-
+-  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
+-  # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
+-  AC_TRY_RUN(
+-    [
+-      #include <pthread.h>
+-      #include <string.h>
+-
+-      int main(int argc, char** argv) {
+-        pthread_t       x1;
+-        pthread_t       x2;
+-        pthread_t       x3;
+-
+-        memset(&x1, 0x0, sizeof(x1));
+-        memset(&x2, 0x0, sizeof(x2));
+-        memset(&x3, 0x0, sizeof(x3));
+-
+-        if (sizeof(pthread_t) == 4) {
+-        
+-          atomic_cas_32(&x1, x2, x3);
+-        
+-        } else if (sizeof(pthread_t) == 8) {
+-        
+-          atomic_cas_64(&x1, x2, x3);
+-        
+-        } else {
+-        
+-          return(1);
+-        }
+-
+-	return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
+-                [pthread_t can be used by solaris atomics])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
+   # to use in the source
+   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
+ 
+-  # Check for x86 PAUSE instruction
+-  AC_MSG_CHECKING(for x86 PAUSE instruction)
+-  # We have to actually try running the test program, because of a bug
+-  # in Solaris on x86_64, where it wrongly reports that PAUSE is not
+-  # supported when trying to run an application. See
+-  # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
+-  # We use ib_ prefix to avoid collisoins if this code is added to
+-  # mysql's configure.in.
+-  AC_TRY_RUN(
+-    [
+-      int main() {
+-        __asm__ __volatile__ ("pause");
+-        return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+   ])
+ 
+ # vim: set ft=config:
+diff --git a/storage/xtradb/plug.in b/storage/xtradb/plug.in
+index 3fadacc..a33f4dc 100644
+--- a/storage/xtradb/plug.in
++++ b/storage/xtradb/plug.in
+@@ -56,215 +56,10 @@ MYSQL_PLUGIN_ACTIONS(xtradb,  [
+   esac
+   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
+ 
+-  AC_MSG_CHECKING(whether GCC atomic builtins are available)
+-  # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-  AC_TRY_RUN(
+-    [
+-      int main()
+-      {
+-	long	x;
+-	long	y;
+-	long	res;
+-	char	c;
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_bool_compare_and_swap(&x, x, y);
+-	if (!res || x != y) {
+-          return(1);
+-        }
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_bool_compare_and_swap(&x, x + 1, y);
+-	if (res || x != 10) {
+-          return(1);
+-        }
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_add_and_fetch(&x, y);
+-	if (res != 123 + 10 || x != 123 + 10) {
+-	  return(1);
+-	}
+-
+-	c = 10;
+-	res = __sync_lock_test_and_set(&c, 123);
+-	if (res != 10 || c != 123) {
+-	  return(1);
+-	}
+-	return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
+-                [GCC atomic builtins are available])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+-  AC_MSG_CHECKING(whether GCC 64-bit atomic builtins are available)
+-  # either define HAVE_IB_GCC_ATOMIC_BUILTINS_64 or not
+-  AC_TRY_RUN(
+-    [
+-      #include <stdint.h>
+-      int main()
+-      {
+-        int64_t x, y, res;
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_bool_compare_and_swap(&x, x, y);
+-	if (!res || x != y) {
+-	  return(1);
+-	}
+-
+-	x = 10;
+-	y = 123;
+-	res = __sync_add_and_fetch(&x, y);
+-	if (res != 123 + 10 || x != 123 + 10) {
+-	  return(1);
+-	}
+-
+-	return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS_64], [1],
+-                [GCC 64-bit atomic builtins are available])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+-  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
+-  # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
+-  AC_TRY_RUN(
+-    [
+-      #include <pthread.h>
+-      #include <string.h>
+-
+-      int main(int argc, char** argv) {
+-        pthread_t       x1;
+-        pthread_t       x2;
+-        pthread_t       x3;
+-
+-	memset(&x1, 0x0, sizeof(x1));
+-	memset(&x2, 0x0, sizeof(x2));
+-	memset(&x3, 0x0, sizeof(x3));
+-
+-        __sync_bool_compare_and_swap(&x1, x2, x3);
+-
+-        return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
+-                [pthread_t can be used by GCC atomic builtins])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+-  AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
+-  # Define HAVE_IB_SOLARIS_ATOMICS if _all_ of the following
+-  # functions are present.
+-  AC_CHECK_FUNCS(atomic_add_long_nv \
+-		 atomic_cas_32 \
+-		 atomic_cas_64 \
+-		 atomic_cas_ulong \
+-		 atomic_swap_uchar)
+-
+-  if test "${ac_cv_func_atomic_add_long_nv}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_32}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_64}" = "yes" -a \
+-          "${ac_cv_func_atomic_cas_ulong}" = "yes" -a \
+-          "${ac_cv_func_atomic_swap_uchar}" = "yes" ; then
+-
+-    AC_DEFINE([HAVE_IB_SOLARIS_ATOMICS], [1],
+-      [Define to 1 if Solaris libc atomic functions are available]
+-    )
+-  fi
+-
+-  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
+-  # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
+-  AC_TRY_RUN(
+-    [
+-      #include <pthread.h>
+-      #include <string.h>
+-
+-      int main(int argc, char** argv) {
+-        pthread_t       x1;
+-        pthread_t       x2;
+-        pthread_t       x3;
+-
+-        memset(&x1, 0x0, sizeof(x1));
+-        memset(&x2, 0x0, sizeof(x2));
+-        memset(&x3, 0x0, sizeof(x3));
+-
+-        if (sizeof(pthread_t) == 4) {
+-        
+-          atomic_cas_32(&x1, x2, x3);
+-        
+-        } else if (sizeof(pthread_t) == 8) {
+-        
+-          atomic_cas_64(&x1, x2, x3);
+-        
+-        } else {
+-        
+-          return(1);
+-        }
+-
+-	return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
+-                [pthread_t can be used by solaris atomics])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+-
+   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
+   # to use in the source
+   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
+ 
+-  # Check for x86 PAUSE instruction
+-  AC_MSG_CHECKING(for x86 PAUSE instruction)
+-  # We have to actually try running the test program, because of a bug
+-  # in Solaris on x86_64, where it wrongly reports that PAUSE is not
+-  # supported when trying to run an application. See
+-  # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
+-  # We use ib_ prefix to avoid collisoins if this code is added to
+-  # mysql's configure.in.
+-  AC_TRY_RUN(
+-    [
+-      int main() {
+-        __asm__ __volatile__ ("pause");
+-        return(0);
+-      }
+-    ],
+-    [
+-      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
+-      AC_MSG_RESULT(yes)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ],
+-    [
+-      AC_MSG_RESULT(no)
+-    ]
+-  )
+   ])
+ 
+ # vim: set ft=config:
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
new file mode 100644
index 0000000..fdf20dc
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
@@ -0,0 +1,14 @@
+require ${PN}_${PV}.inc
+
+DEPENDS += "mariadb-native"
+
+PROVIDES += "mysql5"
+
+RPROVIDES_${PN}-client = "mysql5-client"
+RREPLACES_${PN}-client = "mysql5-client"
+RCONFLICTS_${PN}-client = "mysql5-client"
+
+RPROVIDES_${PN}-server = "mysql5-server"
+RREPLACES_${PN}-server = "mysql5-server"
+RCONFLICTS_${PN}-server = "mysql5-server"
+
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
similarity index 75%
rename from meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
rename to meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 1a38e9f..c535a41 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -1,38 +1,58 @@
-DESCRIPTION = "The MySQL Open Source Database System"
-HOMEPAGE = "http://www.mysql.com/"
+SUMMARY = "A robust, scalable, and reliable SQL server"
+HOMEPAGE = "http://mariadb.org"
 SECTION = "libs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=477ab0a4c8ca64b482b3f2a365d0fdfa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "ncurses zlib"
-PR = "r11"
 
-SRC_URI = "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.tar.gz \
+SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x86/mariadb-${PV}.tar.gz \
            file://configure.in.patch \
            file://plug.in.patch \
            file://misc.m4.patch \
            file://Makefile.am.patch \
            file://fix_host_path.patch \
            file://configure-ps-cache-check.patch \
-           file://fix-abi-check-gcc45.patch \
+           file://fix-cve-2013-1861-1.patch \
+           file://fix-cve-2013-1861-2.patch \
            file://my.cnf \
            file://mysqld.sh"
 
-S = "${WORKDIR}/mysql-${PV}"
+SRC_URI[md5sum] = "44c331fa91943155e4796f89e17a0612"
+SRC_URI[sha256sum] = "33471e9275c9b03919cabc38eb39f807d645adabf6a1a18f2e41ed73f47677c8"
+
+S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit autotools binconfig update-rc.d
+inherit autotools binconfig update-rc.d useradd
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
 INITSCRIPT_PARAMS = "start 45 5 . stop 45 0 6 1 ."
 
+USERADD_PACKAGES = "${PN}-server"
+USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g nogroup mysql"
+
+
 export ac_cv_path_PS="/bin/ps"
 export ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null"
 PARALLEL_MAKE = " "
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
-EXTRA_OECONF = " --with-atomic-ops=up --with-embedded-server --prefix=/usr --sysconfdir=/etc/mysql --localstatedir=/var/mysql --disable-dependency-tracking --without-raid --without-debug --with-low-memory --without-query-cache --without-man --without-docs --without-innodb --with-zlib-dir=${STAGING_EXECPREFIXDIR}"
+EXTRA_OECONF = "--with-atomic-ops=up \
+                --with-embedded-server \
+                --sysconfdir=/etc/mysql \
+                --localstatedir=/var/mysql \
+                --disable-dependency-tracking \
+                --without-debug \
+                --with-low-memory \
+                --without-query-cache \
+                --without-plugin-maria \
+                --without-man \
+                --without-docs \
+                --with-zlib-dir=${STAGING_EXECPREFIXDIR} \
+                --with-pic \
+                "
 
 do_configure_append() {
     sed -i /comp_err/d ${S}/sql/share/Makefile
@@ -44,14 +64,14 @@ do_configure_append() {
     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
 }
 
-SYSROOT_PREPROCESS_FUNCS += "mysql5_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
 
 # We need to append this so it runs *after* binconfig's preprocess function
 #
 # We really don't care exactly what the directories were set to originally.
 # plugindir is not fixed, but we don't create any plugins.
 #
-mysql5_sysroot_preprocess () {
+mariadb_sysroot_preprocess () {
     sed -i -es,^pkgincludedir=.*,pkgincludedir=\'${STAGING_INCDIR}/mysql\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
     sed -i -es,^pkglibdir=.*,pkglibdir=\'${STAGING_LIBDIR}\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
 }
@@ -66,13 +86,11 @@ do_install() {
     install -m 0755 ${WORKDIR}/mysqld.sh ${D}/etc/init.d/mysqld
 }
 
-pkg_postinst_mysql5-server () {
+pkg_postinst_${PN}-server () {
     if [ "x$D" != "x" ]; then
         exit 1
     fi
 
-    grep mysql /etc/passwd || adduser --disabled-password --home=/var/mysql --ingroup nogroup mysql
-
     #Install the database
     test -d /usr/bin || mkdir -p /usr/bin
     test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
@@ -83,14 +101,10 @@ pkg_postinst_mysql5-server () {
 
 }
 
-pkg_postrm_mysql5-server () {
-    grep mysql /etc/passwd && deluser mysql
-}
-
 PACKAGES = "${PN}-dbg ${PN} \
     libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysqlclient-r-dbg \
     libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclient-dbg \
-    ${PN}-client ${PN}-server ${PN}-leftovers"
+    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf"
 
 FILES_${PN} = " "
@@ -114,6 +128,11 @@ FILES_libmysqlclient-staticdev = "\
 FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
     /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
 
+# Avoid warnings about ha_xtradb.so.0.0.0 and ha_innodb_plugin.so.0.0.0
+# which are intentionally non-PIC on 32-bit x86 (see e.g.
+# storage/xtradb/plug.in in the source)
+INSANE_SKIP_libmysqlclient_append_i586 = " textrel"
+
 FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
 FILES_libmysqlclient-r-dev = "\
     ${libdir}/libmysqlclient_r.so \
@@ -121,6 +140,11 @@ FILES_libmysqlclient-r-dev = "\
 FILES_libmysqlclient-r-staticdev = "${libdir}/libmysqlclient_r.a"
 FILES_libmysqlclient-r-dbg = "${libdir}/plugin/.debuglibmysqlclient_r.so.*"
 
+FILES_libmysqld = "\
+    ${libdir}/libmysqld.so.*"
+FILES_libmysqld-dev = "\
+    ${libdir}/libmysqld.so"
+
 FILES_${PN}-client = "\
     ${bindir}/myisam_ftdump \
     ${bindir}/mysql \
diff --git a/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch b/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch
deleted file mode 100644
index 3b5b3fd..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: mysql-4.1.22/configure.in
-===================================================================
---- mysql-4.1.22.orig/configure.in	2009-01-28 16:33:28.000000000 +0000
-+++ mysql-4.1.22/configure.in	2009-01-28 16:43:26.000000000 +0000
-@@ -471,8 +471,8 @@
- 
- # Lock for PS
- AC_PATH_PROG(PS, ps, ps)
--AC_MSG_CHECKING("how to check if pid exists")
--PS=$ac_cv_path_PS
-+AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
-+[
- # Linux style
- if $PS p $$ 2> /dev/null | grep $0 > /dev/null
- then
-@@ -511,8 +511,9 @@
-       AC_MSG_ERROR([Could not find the right ps switches. Which OS is this ?. See the Installation chapter in the Reference Manual.])
-   esac
- fi
--AC_SUBST(FIND_PROC)
--AC_MSG_RESULT("$FIND_PROC")
-+ac_cv_FIND_PROC="$FIND_PROC"
-+])
-+AC_SUBST([FIND_PROC], [$ac_cv_FIND_PROC])
- 
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
diff --git a/meta-oe/recipes-support/mysql/mysql5/configure.in.patch b/meta-oe/recipes-support/mysql/mysql5/configure.in.patch
deleted file mode 100644
index 3edc5f3..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/configure.in.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Index: mysql-5.1.40/configure.in
-===================================================================
---- mysql-5.1.40.orig/configure.in
-+++ mysql-5.1.40/configure.in
-@@ -226,8 +226,6 @@ else
-   AC_PATH_PROG(AS, as, as)
- fi
- 
--# Still need ranlib for readline; local static use only so no libtool.
--AC_PROG_RANLIB
- # We use libtool
- #AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
-@@ -255,39 +253,7 @@ AC_CHECK_PROGS(YACC, ['bison -y -p MYSQL
- AC_CHECK_PROG(PDFMANUAL, pdftex, manual.pdf)
- AC_CHECK_PROG(DVIS,      tex,    manual.dvi)
- 
--#check the return type of sprintf
--AC_MSG_CHECKING("return type of sprintf")
--AC_TRY_RUN([
--  int main()
--    {
--      char* s = "hello";
--      char buf[6];
--      if((int)sprintf(buf, s) == strlen(s))
--	return 0;
--      
--      return -1;
--     }
--   ],
--   [AC_DEFINE(SPRINTF_RETURNS_INT, [1], [POSIX sprintf])
--   AC_MSG_RESULT("int")],
--   [AC_TRY_RUN([
-- int main()
--   {
--     char* s = "hello";
--     char buf[6];
--     if((char*)sprintf(buf,s) == buf + strlen(s))
--       return 0;
--     return -1;
--   }           ],
--               [AC_DEFINE(SPRINTF_RETURNS_PTR, [1], [Broken sprintf])
--                AC_MSG_RESULT("ptr")],
--               [AC_DEFINE(SPRINTF_RETURNS_GARBAGE, [1], [Broken sprintf])
--                AC_MSG_RESULT("garbage")]
--   )],
--   # Cross compile, assume POSIX
--   [AC_DEFINE(SPRINTF_RETURNS_INT, [1], [POSIX sprintf])
--    AC_MSG_RESULT("int (we assume)")]
--)
-+MYSQL_SPRINTF_RET
- 
- AC_PATH_PROG(uname_prog, uname, no)
- 
diff --git a/meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch b/meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch
deleted file mode 100644
index 58812c1..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From: Date: July 20 2010 7:44pm
-Subject: bzr commit into mysql-5.1-bugteam branch (davi:3493) Bug#52514
-List-Archive: http://lists.mysql.com/commits/113968
-X-Bug: 52514
-MIME-Version: 1.0
-Content-Type: multipart/mixed; boundary="===============9147207462624717749=="
-
---===============9147207462624717749==
-MIME-Version: 1.0
-Content-Type: text/plain; charset="us-ascii"
-Content-Transfer-Encoding: 7bit
-Content-Disposition: inline
-
-# At a local mysql-5.1-bugteam repository of davi
-
- 3493 Davi Arnaut	2010-07-20
-      Bug#52514: mysql 5.1 do_abi_check does not compile w/ gcc4.5
-                 due to GCC preprocessor change
-            
-      The problem is that newer GCC versions treats missing headers
-      as fatal errors. The solution is to use a guard macro to prevent
-      the inclusion of system headers when checking the ABI with the
-      C Preprocessor.
-      
-      Reference: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=15638
-                 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44836
-     @ Makefile.am
-        Define guard macro.
-     @ configure.in
-        Remove workaround.
-     @ include/mysql.h
-        Guard the header inclusion.
-     @ include/mysql.h.pp
-        Header is not included anymore.
-
-    modified:
-      Makefile.am
-      configure.in
-      include/mysql.h
-      include/mysql.h.pp
-=== modified file 'Makefile.am'
-Index: mysql-5.1.40/Makefile.am
-===================================================================
---- mysql-5.1.40.orig/Makefile.am	2009-10-07 01:46:13.000000000 +0800
-+++ mysql-5.1.40/Makefile.am	2010-08-17 20:07:24.843148001 +0800
-@@ -312,7 +312,7 @@
- do_abi_check:
- 	set -ex; \
- 	for file in $(abi_headers); do \
--	         @CC@ -E -nostdinc -dI \
-+	         @CC@ -E -nostdinc -dI -DMYSQL_ABI_CHECK \
- 	                  -I$(top_srcdir)/include \
- 	                  -I$(top_srcdir)/include/mysql \
- 	                  -I$(top_srcdir)/sql \
-Index: mysql-5.1.40/include/mysql.h
-===================================================================
---- mysql-5.1.40.orig/include/mysql.h	2009-10-07 01:46:50.000000000 +0800
-+++ mysql-5.1.40/include/mysql.h	2010-08-17 20:07:24.843148001 +0800
-@@ -44,7 +44,9 @@
- #endif
- 
- #ifndef _global_h				/* If not standard header */
-+#ifndef MYSQL_ABI_CHECK
- #include <sys/types.h>
-+#endif
- #ifdef __LCC__
- #include <winsock2.h>				/* For windows */
- #endif
-Index: mysql-5.1.40/include/mysql.h.pp
-===================================================================
---- mysql-5.1.40.orig/include/mysql.h.pp	2009-10-07 01:46:50.000000000 +0800
-+++ mysql-5.1.40/include/mysql.h.pp	2010-08-17 20:07:24.843148001 +0800
-@@ -1,4 +1,3 @@
--#include <sys/types.h>
- typedef char my_bool;
- typedef int my_socket;
- #include "mysql_version.h"
diff --git a/meta-oe/recipes-support/mysql/mysql5/fix_host_path.patch b/meta-oe/recipes-support/mysql/mysql5/fix_host_path.patch
deleted file mode 100644
index 4f69cd5..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/fix_host_path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
---- mysql-4.1.22/configure.in.old	2008-09-18 20:11:15.000000000 -0500
-+++ mysql-4.1.22/configure.in	2008-09-18 20:12:28.000000000 -0500
-@@ -456,9 +456,9 @@ else
-   fi
- fi
- 
--AC_SUBST(HOSTNAME)
--AC_SUBST(PERL)
--AC_SUBST(PERL5)
-+AC_SUBST(HOSTNAME,/bin/hostname)
-+AC_SUBST(PERL,$(bindir)/perl)
-+AC_SUBST(PERL5,$(bindir)/perl)
- 
- # for build ndb docs
- 
-@@ -516,16 +516,17 @@ AC_MSG_RESULT("$FIND_PROC")
- 
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
-+AC_SUBST(KILL,/bin/kill)
- AC_MSG_CHECKING("for kill switches")
--if $ac_cv_path_KILL -0 $$
-+if $KILL -0 $$
- then
--  CHECK_PID="$ac_cv_path_KILL -0 \$\$PID > /dev/null 2> /dev/null"
-+  CHECK_PID="$KILL -0 \$\$PID > /dev/null 2> /dev/null"
- elif kill -s 0 $$
- then
--  CHECK_PID="$ac_cv_path_KILL -s 0 \$\$PID > /dev/null 2> /dev/null"
-+  CHECK_PID="$KILL -s 0 \$\$PID > /dev/null 2> /dev/null"
- else
-   AC_MSG_WARN([kill -0 to check for pid seems to fail])
--    CHECK_PID="$ac_cv_path_KILL -s SIGCONT \$\$PID > /dev/null 2> /dev/null"
-+    CHECK_PID="$KILL -s SIGCONT \$\$PID > /dev/null 2> /dev/null"
- fi
- AC_SUBST(CHECK_PID)
- AC_MSG_RESULT("$CHECK_PID")
diff --git a/meta-oe/recipes-support/mysql/mysql5/mysqld.sh b/meta-oe/recipes-support/mysql/mysql5/mysqld.sh
deleted file mode 100644
index 479ebdb..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/mysqld.sh
+++ /dev/null
@@ -1,24 +0,0 @@
-# MySQL init script
-
-. /etc/default/rcS
-
-case "$1" in
-	start)
-		/usr/bin/mysqld_safe &
-		;;
-	stop)
-		if test -f /var/lib/mysql/mysqld.pid ; then
-			PID=`cat /var/lib/mysql/mysqld.pid`
-			kill $PID
-		fi
-		;;
-	restart)
-		$0 stop
-		$0 start
-		;;
-	*)
-		echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
-		;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/mysql/mysql5/plug.in.patch b/meta-oe/recipes-support/mysql/mysql5/plug.in.patch
deleted file mode 100644
index 70c39fa..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/plug.in.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Index: mysql-5.1.40/storage/innodb_plugin/plug.in
-===================================================================
---- mysql-5.1.40.orig/storage/innodb_plugin/plug.in
-+++ mysql-5.1.40/storage/innodb_plugin/plug.in
-@@ -63,35 +63,6 @@ MYSQL_PLUGIN_ACTIONS(innodb_plugin,  [
- 		;;
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
--  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
--  AC_TRY_RUN(
--    [
--      #include <pthread.h>
--      #include <string.h>
--
--      int main(int argc, char** argv) {
--        pthread_t       x1;
--        pthread_t       x2;
--        pthread_t       x3;
--
--	memset(&x1, 0x0, sizeof(x1));
--	memset(&x2, 0x0, sizeof(x2));
--	memset(&x3, 0x0, sizeof(x3));
--
--        __sync_bool_compare_and_swap(&x1, x2, x3);
--
--        return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_ATOMIC_PTHREAD_T], [1],
--                [pthread_t can be used by GCC atomic builtins])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--    )
- 
-   # Try using solaris atomics on SunOS if GCC atomics are not available
-   AC_CHECK_DECLS(
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb b/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
deleted file mode 100644
index 9656358..0000000
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}_${PV}.inc
-
-DEPENDS += "mysql5-native"
-
-SRC_URI[md5sum] = "32e7373c16271606007374396e6742ad"
-SRC_URI[sha256sum] = "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10bdb862761d0f0432"
-- 
1.8.1.2


