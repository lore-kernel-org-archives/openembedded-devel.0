Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvYK-0005xP-I1
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:04:37 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id B5AD72DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:16 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 39878A6237
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:11 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:04 +0100
Message-Id: <1353864310-20097-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/7] mysql: upgrade to 5.1.66
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
X-List-Received-Date: Mon, 26 Nov 2012 10:04:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-support/mysql/mysql5-native_5.1.40.bb  |  24 ---
 .../recipes-support/mysql/mysql5-native_5.1.66.bb  |  24 +++
 .../mysql/mysql5/configure-ps-cache-check.patch    |  27 ---
 .../mysql/mysql5/configure.in.patch                |  54 ------
 .../mysql/mysql5/fix-abi-check-gcc45.patch         |  77 --------
 .../mysql/mysql5/mysql-5.1.66-ac_cache_check.patch | 145 +++++++++++++++
 .../mysql/mysql5/mysql-5.1.66-skip_abi_check.patch |  31 ++++
 meta-oe/recipes-support/mysql/mysql5/plug.in.patch |  40 ----
 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb     |   6 -
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc    | 192 ---------------=
-----
 meta-oe/recipes-support/mysql/mysql5_5.1.66.bb     |   6 +
 meta-oe/recipes-support/mysql/mysql5_5.1.66.inc    | 202 +++++++++++++++=
++++++
 12 files changed, 408 insertions(+), 420 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
 create mode 100644 meta-oe/recipes-support/mysql/mysql5-native_5.1.66.bb
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure-ps-cac=
he-check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/configure.in.pat=
ch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gc=
c45.patch
 create mode 100644 meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-ac_=
cache_check.patch
 create mode 100644 meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-ski=
p_abi_check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5/plug.in.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
 delete mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
 create mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.66.bb
 create mode 100644 meta-oe/recipes-support/mysql/mysql5_5.1.66.inc

diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb b/meta=
-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
deleted file mode 100644
index b2bbfc4..0000000
--- a/meta-oe/recipes-support/mysql/mysql5-native_5.1.40.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require mysql5_${PV}.inc
-inherit native
-PR =3D"r3"
-
-SRC_URI =3D "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.t=
ar.gz \
-           file://fix-abi-check-gcc45.patch"
-
-RDEPENDS_${PN} =3D ""
-PACKAGES =3D ""
-DEPENDS =3D "ncurses-native"
-EXTRA_OEMAKE =3D ""
-EXTRA_OECONF =3D " --with-embedded-server "
-
-do_install() {
-        oe_runmake 'DESTDIR=3D${D}' install
-        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
-        rmdir ${D}${libdir}/mysql
-
-        install -d ${D}${bindir}
-        install -m 0755 sql/gen_lex_hash ${D}${bindir}/
-}
-
-SRC_URI[md5sum] =3D "32e7373c16271606007374396e6742ad"
-SRC_URI[sha256sum] =3D "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10=
bdb862761d0f0432"
diff --git a/meta-oe/recipes-support/mysql/mysql5-native_5.1.66.bb b/meta=
-oe/recipes-support/mysql/mysql5-native_5.1.66.bb
new file mode 100644
index 0000000..f8cc48d
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5-native_5.1.66.bb
@@ -0,0 +1,24 @@
+require mysql5_${PV}.inc
+inherit native
+PR =3D"r0"
+
+SRC_URI =3D "http://cdn.mysql.com/Downloads/MySQL-5.1/mysql-${PV}.tar.gz=
 \
+          "
+
+RDEPENDS_${PN} =3D ""
+PACKAGES =3D ""
+DEPENDS =3D "ncurses-native"
+EXTRA_OEMAKE =3D ""
+EXTRA_OECONF =3D " --with-embedded-server "
+
+do_install() {
+        oe_runmake 'DESTDIR=3D${D}' install
+        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
+        rmdir ${D}${libdir}/mysql
+
+        install -d ${D}${bindir}
+        install -m 0755 sql/gen_lex_hash ${D}${bindir}/
+}
+
+SRC_URI[md5sum] =3D "a43ffa58e3611e5a557feb745596aca3"
+SRC_URI[sha256sum] =3D "eb85e3fa152949670f5b6f4379bd1d700a5f4726660ce18f=
f0ca628190cba907"
diff --git a/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-chec=
k.patch b/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.p=
atch
deleted file mode 100644
index 3b5b3fd..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/configure-ps-cache-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: mysql-4.1.22/configure.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- mysql-4.1.22.orig/configure.in	2009-01-28 16:33:28.000000000 +0000
-+++ mysql-4.1.22/configure.in	2009-01-28 16:43:26.000000000 +0000
-@@ -471,8 +471,8 @@
-=20
- # Lock for PS
- AC_PATH_PROG(PS, ps, ps)
--AC_MSG_CHECKING("how to check if pid exists")
--PS=3D$ac_cv_path_PS
-+AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
-+[
- # Linux style
- if $PS p $$ 2> /dev/null | grep $0 > /dev/null
- then
-@@ -511,8 +511,9 @@
-       AC_MSG_ERROR([Could not find the right ps switches. Which OS is t=
his ?. See the Installation chapter in the Reference Manual.])
-   esac
- fi
--AC_SUBST(FIND_PROC)
--AC_MSG_RESULT("$FIND_PROC")
-+ac_cv_FIND_PROC=3D"$FIND_PROC"
-+])
-+AC_SUBST([FIND_PROC], [$ac_cv_FIND_PROC])
-=20
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
diff --git a/meta-oe/recipes-support/mysql/mysql5/configure.in.patch b/me=
ta-oe/recipes-support/mysql/mysql5/configure.in.patch
deleted file mode 100644
index 3edc5f3..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/configure.in.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Index: mysql-5.1.40/configure.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- mysql-5.1.40.orig/configure.in
-+++ mysql-5.1.40/configure.in
-@@ -226,8 +226,6 @@ else
-   AC_PATH_PROG(AS, as, as)
- fi
-=20
--# Still need ranlib for readline; local static use only so no libtool.
--AC_PROG_RANLIB
- # We use libtool
- #AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
-@@ -255,39 +253,7 @@ AC_CHECK_PROGS(YACC, ['bison -y -p MYSQL
- AC_CHECK_PROG(PDFMANUAL, pdftex, manual.pdf)
- AC_CHECK_PROG(DVIS,      tex,    manual.dvi)
-=20
--#check the return type of sprintf
--AC_MSG_CHECKING("return type of sprintf")
--AC_TRY_RUN([
--  int main()
--    {
--      char* s =3D "hello";
--      char buf[6];
--      if((int)sprintf(buf, s) =3D=3D strlen(s))
--	return 0;
--     =20
--      return -1;
--     }
--   ],
--   [AC_DEFINE(SPRINTF_RETURNS_INT, [1], [POSIX sprintf])
--   AC_MSG_RESULT("int")],
--   [AC_TRY_RUN([
-- int main()
--   {
--     char* s =3D "hello";
--     char buf[6];
--     if((char*)sprintf(buf,s) =3D=3D buf + strlen(s))
--       return 0;
--     return -1;
--   }           ],
--               [AC_DEFINE(SPRINTF_RETURNS_PTR, [1], [Broken sprintf])
--                AC_MSG_RESULT("ptr")],
--               [AC_DEFINE(SPRINTF_RETURNS_GARBAGE, [1], [Broken sprintf=
])
--                AC_MSG_RESULT("garbage")]
--   )],
--   # Cross compile, assume POSIX
--   [AC_DEFINE(SPRINTF_RETURNS_INT, [1], [POSIX sprintf])
--    AC_MSG_RESULT("int (we assume)")]
--)
-+MYSQL_SPRINTF_RET
-=20
- AC_PATH_PROG(uname_prog, uname, no)
-=20
diff --git a/meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.pat=
ch b/meta-oe/recipes-support/mysql/mysql5/fix-abi-check-gcc45.patch
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
-Content-Type: multipart/mixed; boundary=3D"=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D9147207462624717749=3D=3D"
-
---=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D9147207462624717749=3D=3D
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3D"us-ascii"
-Content-Transfer-Encoding: 7bit
-Content-Disposition: inline
-
-# At a local mysql-5.1-bugteam repository of davi
-
- 3493 Davi Arnaut	2010-07-20
-      Bug#52514: mysql 5.1 do_abi_check does not compile w/ gcc4.5
-                 due to GCC preprocessor change
-           =20
-      The problem is that newer GCC versions treats missing headers
-      as fatal errors. The solution is to use a guard macro to prevent
-      the inclusion of system headers when checking the ABI with the
-      C Preprocessor.
-     =20
-      Reference: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D15638
-                 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44836
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
-=3D=3D=3D modified file 'Makefile.am'
-Index: mysql-5.1.40/Makefile.am
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- mysql-5.1.40.orig/include/mysql.h	2009-10-07 01:46:50.000000000 +080=
0
-+++ mysql-5.1.40/include/mysql.h	2010-08-17 20:07:24.843148001 +0800
-@@ -44,7 +44,9 @@
- #endif
-=20
- #ifndef _global_h				/* If not standard header */
-+#ifndef MYSQL_ABI_CHECK
- #include <sys/types.h>
-+#endif
- #ifdef __LCC__
- #include <winsock2.h>				/* For windows */
- #endif
-Index: mysql-5.1.40/include/mysql.h.pp
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- mysql-5.1.40.orig/include/mysql.h.pp	2009-10-07 01:46:50.000000000 +=
0800
-+++ mysql-5.1.40/include/mysql.h.pp	2010-08-17 20:07:24.843148001 +0800
-@@ -1,4 +1,3 @@
--#include <sys/types.h>
- typedef char my_bool;
- typedef int my_socket;
- #include "mysql_version.h"
diff --git a/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-ac_cache_c=
heck.patch b/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-ac_cache_c=
heck.patch
new file mode 100644
index 0000000..bf2b1f1
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-ac_cache_check.pa=
tch
@@ -0,0 +1,145 @@
+patch from http://code.google.com/p/minimyth/source/browse/trunk/gar-min=
imyth/script/db/mysql/files/
+
+diff -Naur mysql-5.1.66-old/storage/innodb_plugin/plug.in mysql-5.1.66-n=
ew/storage/innodb_plugin/plug.in
+--- mysql-5.1.66-old/storage/innodb_plugin/plug.in	2012-10-03 14:50:19.0=
00000000 -0700
++++ mysql-5.1.66-new/storage/innodb_plugin/plug.in	2012-10-03 14:51:11.0=
00000000 -0700
+@@ -56,9 +56,10 @@
+   esac
+   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
+=20
+-  AC_MSG_CHECKING(whether GCC atomic builtins are available)
++  AC_CACHE_CHECK([whether GCC atomic builtins are available],
++                 [ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS],
+   # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       int main()
+       {
+@@ -98,18 +99,23 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
+-                [GCC atomic builtins are available])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=3Dyes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=3Dno
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS"=3D "xyes" ; t=
hen
++    AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
++              [GCC atomic builtins are available])
++  fi
+=20
+-  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
++  AC_CACHE_CHECK([whether pthread_t can be used by GCC atomic builtins]=
,
++                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC],
+   # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       #include <pthread.h>
+       #include <string.h>
+@@ -129,14 +135,18 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
+-                [pthread_t can be used by GCC atomic builtins])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=3Dyes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=3Dno
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC"=3D "xyes" ; =
then
++    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
++              [pthread_t can be used by GCC atomic builtins])
++  fi
+=20
+   AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
+   # Define HAVE_IB_SOLARIS_ATOMICS if _all_ of the following
+@@ -158,9 +168,10 @@
+     )
+   fi
+=20
+-  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic =
functions)
++  AC_CACHE_CHECK([whether pthread_t can be used by Solaris libc atomic =
functions],
++                 [ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS],
+   # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       #include <pthread.h>
+       #include <string.h>
+@@ -191,28 +202,33 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
+-                [pthread_t can be used by solaris atomics])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=3Dyes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=3Dno
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS"=3D "xyes=
" ; then
++    AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
++              [pthread_t can be used by solaris atomics])
++  fi
+=20
+   # this is needed to know which one of atomic_cas_32() or atomic_cas_6=
4()
+   # to use in the source
+   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
+=20
+   # Check for x86 PAUSE instruction
+-  AC_MSG_CHECKING(for x86 PAUSE instruction)
++  AC_CACHE_CHECK([for x86 PAUSE instruction],
++                 [ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION],
+   # We have to actually try running the test program, because of a bug
+   # in Solaris on x86_64, where it wrongly reports that PAUSE is not
+   # supported when trying to run an application. See
+   # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=3D64=
78684
+   # We use ib_ prefix to avoid collisoins if this code is added to
+   # mysql's configure.in.
+-  AC_TRY_RUN(
++  [AC_TRY_RUN(
+     [
+       int main() {
+         __asm__ __volatile__ ("pause");
+@@ -220,16 +236,21 @@
+       }
+     ],
+     [
+-      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instr=
uction exist])
+       AC_MSG_RESULT(yes)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=3Dyes
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=3Dno
+     ],
+     [
+       AC_MSG_RESULT(no)
++      ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=3Dno
+     ]
+-  )
++  )])
++  if test "x$ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION"=3D "xyes" ; the=
n
++    AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruc=
tion exist])
++  fi
+   ])
+=20
+ # vim: set ft=3Dconfig:
diff --git a/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-skip_abi_c=
heck.patch b/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-skip_abi_c=
heck.patch
new file mode 100644
index 0000000..c7f7d1a
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5/mysql-5.1.66-skip_abi_check.pa=
tch
@@ -0,0 +1,31 @@
+patch from http://code.google.com/p/minimyth/source/browse/trunk/gar-min=
imyth/script/db/mysql/files/
+
+diff -Naur mysql-5.1.66-old/Makefile.am mysql-5.1.66-new/Makefile.am
+--- mysql-5.1.66-old/Makefile.am	2012-10-03 14:49:21.000000000 -0700
++++ mysql-5.1.66-new/Makefile.am	2012-10-03 14:50:29.000000000 -0700
+@@ -310,24 +310,7 @@
+ 	$(MAKE) abi_headers=3D"$^" do_abi_check
+=20
+ do_abi_check:
+-	set -ex; \
+-	for file in $(abi_headers); do \
+-	         @CC@ -E -nostdinc -dI -DMYSQL_ABI_CHECK \
+-	                  -I$(top_srcdir)/include \
+-	                  -I$(top_srcdir)/include/mysql \
+-	                  -I$(top_srcdir)/sql \
+-	                  -I$(top_builddir)/include \
+-	                  -I$(top_builddir)/include/mysql \
+-	                  -I$(top_builddir)/sql \
+-	                                 $$file 2>/dev/null | \
+-	                  @SED@ -e '/^# /d' \
+-	                            -e '/^[ 	]*$$/d' \
+-	                            -e '/^#pragma GCC set_debug_pwd/d' \
+-	                            -e '/^#ident/d' > \
+-	                                       $(top_builddir)/abi_check.out; =
\
+-	                  @DIFF@ -w $$file.pp $(top_builddir)/abi_check.out; \
+-	                  @RM@ $(top_builddir)/abi_check.out; \
+-	done
++	echo "Skipping do_abi_check"
+=20
+ # Don't update the files from bitkeeper
+ %::SCCS/s.%
diff --git a/meta-oe/recipes-support/mysql/mysql5/plug.in.patch b/meta-oe=
/recipes-support/mysql/mysql5/plug.in.patch
deleted file mode 100644
index 70c39fa..0000000
--- a/meta-oe/recipes-support/mysql/mysql5/plug.in.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Index: mysql-5.1.40/storage/innodb_plugin/plug.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
-=20
-   # Try using solaris atomics on SunOS if GCC atomics are not available
-   AC_CHECK_DECLS(
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb b/meta-oe/rec=
ipes-support/mysql/mysql5_5.1.40.bb
deleted file mode 100644
index 9656358..0000000
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}_${PV}.inc
-
-DEPENDS +=3D "mysql5-native"
-
-SRC_URI[md5sum] =3D "32e7373c16271606007374396e6742ad"
-SRC_URI[sha256sum] =3D "2b0737b84e7b42c9e54c9658d23bfaee1189cd5955f26b10=
bdb862761d0f0432"
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/re=
cipes-support/mysql/mysql5_5.1.40.inc
deleted file mode 100644
index af0ddbb..0000000
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ /dev/null
@@ -1,192 +0,0 @@
-DESCRIPTION =3D "The MySQL Open Source Database System"
-HOMEPAGE =3D "http://www.mysql.com/"
-SECTION =3D "libs"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D477ab0a4c8ca64b482b3f2a365d0f=
dfa"
-
-DEPENDS =3D "ncurses"
-PR =3D "r11"
-
-SRC_URI =3D "http://downloads.mysql.com/archives/mysql-5.1/mysql-${PV}.t=
ar.gz \
-           file://configure.in.patch \
-           file://plug.in.patch \
-           file://misc.m4.patch \
-           file://Makefile.am.patch \
-           file://fix_host_path.patch \
-           file://configure-ps-cache-check.patch \
-           file://fix-abi-check-gcc45.patch \
-           file://my.cnf \
-           file://mysqld.sh"
-
-S =3D "${WORKDIR}/mysql-${PV}"
-
-BINCONFIG_GLOB =3D "mysql_config"
-
-inherit autotools binconfig update-rc.d
-
-INITSCRIPT_PACKAGES =3D "${PN}-server"
-INITSCRIPT_NAME =3D "mysqld"
-INITSCRIPT_PARAMS =3D "start 45 5 . stop 45 0 6 1 ."
-
-export ac_cv_path_PS=3D"/bin/ps"
-export ac_cv_FIND_PROC=3D"/bin/ps p \$\$PID | grep -v grep | grep mysqld=
 > /dev/null"
-PARALLEL_MAKE =3D " "
-EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_hash'=
"
-EXTRA_OECONF =3D " --with-atomic-ops=3Dup --with-embedded-server --prefi=
x=3D/usr --sysconfdir=3D/etc/mysql --localstatedir=3D/var/mysql --disable=
-dependency-tracking --without-raid --without-debug --with-low-memory --w=
ithout-query-cache --without-man --without-docs --without-innodb "
-
-do_configure_append() {
-     sed -i /comp_err/d ${S}/sql/share/Makefile
-
-     # handle distros with different values of ${libexecdir}
-     libexecdir2=3D`echo ${libexecdir} | sed -e 's+/usr/++g'`
-     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_d=
b.sh
-     sed -i -e "s:mysqld libexec:mysqld $libexecdir2:g" ${S}/scripts/mys=
ql_install_db.sh
-     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
-}
-
-SYSROOT_PREPROCESS_FUNCS +=3D "mysql5_sysroot_preprocess"
-
-# We need to append this so it runs *after* binconfig's preprocess funct=
ion
-#
-# We really don't care exactly what the directories were set to original=
ly.
-# plugindir is not fixed, but we don't create any plugins.
-#
-mysql5_sysroot_preprocess () {
-	sed -i -es,^pkgincludedir=3D.*,pkgincludedir=3D\'${STAGING_INCDIR}/mysq=
l\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
-	sed -i -es,^pkglibdir=3D.*,pkglibdir=3D\'${STAGING_LIBDIR}\', ${SYSROOT=
_DESTDIR}${bindir_crossscripts}/mysql_config
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=3D${D}' install
-	mv -f ${D}${libdir}/mysql/* ${D}${libdir}
-	rmdir ${D}${libdir}/mysql
-
-	install -d ${D}/etc/init.d
-	install -m 0644 ${WORKDIR}/my.cnf ${D}/etc/
-	install -m 0755 ${WORKDIR}/mysqld.sh ${D}/etc/init.d/mysqld
-}
-
-pkg_postinst_mysql5-server () {
-	if [ "x$D" !=3D "x" ]; then
-		exit 1
-	fi
-
-	grep mysql /etc/passwd || adduser --disabled-password --home=3D/var/mys=
ql --ingroup nogroup mysql
-
-	#Install the database
-	test -d /usr/bin || mkdir -p /usr/bin
-	test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
-	mkdir /var/lib/mysql
-	chown mysql.nogroup /var/lib/mysql
-
-	mysql_install_db
-
-}
-
-pkg_postrm_mysql5-server () {
-	grep mysql /etc/passwd && deluser mysql
-}
-
-PACKAGES =3D "${PN}-dbg ${PN} \
-libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysq=
lclient-r-dbg \
-libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclien=
t-dbg \
-${PN}-client ${PN}-server ${PN}-leftovers"
-CONFFILES_${PN}-server +=3D "${sysconfdir}/my.cnf"
-
-FILES_${PN} =3D " "
-RDEPENDS_${PN} =3D "${PN}-client ${PN}-server"
-ALLOW_EMPTY_${PN} =3D "1"
-
-FILES_libmysqlclient =3D "\
-${libdir}/libmysqlclient.so.* \
-${libdir}/plugin/*.so.*"
-FILES_libmysqlclient-dev =3D " \
-${includedir}/mysql/ \
-${libdir}/libmysqlclient.so \
-${libdir}/libmysqlclient.la \
-${libdir}/plugin/*.so \
-${libdir}/plugin/*.la \
-${sysconfdir}/aclocal \
-${bindir}/mysql_config"
-FILES_libmysqlclient-staticdev =3D "\
-${libdir}/*.a \
-${libdir}/plugin/*.a"
-FILES_libmysqlclient-dbg =3D "${libdir}/plugin/.debug/ \
-/usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
-
-FILES_libmysqlclient-r =3D "${libdir}/libmysqlclient_r.so.*"
-FILES_libmysqlclient-r-dev =3D "\
-${libdir}/libmysqlclient_r.so \
-${libdir}/libmysqlclient_r.la"
-FILES_libmysqlclient-r-staticdev =3D "${libdir}/libmysqlclient_r.a"
-FILES_libmysqlclient-r-dbg =3D "${libdir}/plugin/.debuglibmysqlclient_r.=
so.*"
-
-FILES_${PN}-client =3D "\
-${bindir}/myisam_ftdump \
-${bindir}/mysql \
-${bindir}/mysql_client_test \
-${bindir}/mysql_client_test_embedded \
-${bindir}/mysql_find_rows \
-${bindir}/mysql_fix_extensions \
-${bindir}/mysql_waitpid \
-${bindir}/mysqlaccess \
-${bindir}/mysqladmin \
-${bindir}/mysqlbug \
-${bindir}/mysqlcheck \
-${bindir}/mysqldump \
-${bindir}/mysqldumpslow \
-${bindir}/mysqlimport \
-${bindir}/mysqlshow \
-${bindir}/mysqlslap \
-${bindir}/mysqltest_embedded \
-${libexecdir}/mysqlmanager"
-
-FILES_${PN}-server =3D "\
-${bindir}/comp_err \
-${bindir}/isamchk \
-${bindir}/isamlog \
-${bindir}/msql2mysql \
-${bindir}/my_print_defaults \
-${bindir}/myisamchk \
-${bindir}/myisamlog \
-${bindir}/myisampack \
-${bindir}/mysql_convert_table_format \
-${bindir}/mysql_fix_privilege_tables \
-${bindir}/mysql_install_db \
-${bindir}/mysql_secure_installation \
-${bindir}/mysql_setpermission \
-${bindir}/mysql_tzinfo_to_sql \
-${bindir}/mysql_upgrade \
-${bindir}/mysql_zap \
-${bindir}/mysqlbinlog \
-${bindir}/mysqld_multi \
-${bindir}/mysqld_safe \
-${bindir}/mysqlhotcopy \
-${bindir}/mysqltest \
-${bindir}/ndb_delete_all \
-${bindir}/ndb_desc \
-${bindir}/ndb_drop_index \
-${bindir}/ndb_drop_table \
-${bindir}/ndb_mgm \
-${bindir}/ndb_restore \
-${bindir}/ndb_select_all \
-${bindir}/ndb_select_count \
-${bindir}/ndb_show_tables \
-${bindir}/ndb_waiter \
-${bindir}/pack_isam \
-${bindir}/perror \
-${bindir}/replace \
-${bindir}/resolve_stack_dump \
-${bindir}/resolveip \
-${libexecdir}/mysqld \
-${sbindir}/mysqld \
-${sbindir}/ndb_cpcd \
-${sbindir}/ndbd \
-${sbindir}/ndb_mgmd \
-${datadir}/mysql/ \
-${localstatedir}/mysql/ \
-${sysconfdir}/init.d \
-${sysconfdir}/my.cnf"
-
-DESCRIPTION_${PN}-leftovers =3D "unpackaged and probably unneeded files =
for ${PN}"
-FILES_${PN}-leftovers =3D "/"
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.66.bb b/meta-oe/rec=
ipes-support/mysql/mysql5_5.1.66.bb
new file mode 100644
index 0000000..d4c57da
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.66.bb
@@ -0,0 +1,6 @@
+require ${PN}_${PV}.inc
+
+DEPENDS +=3D "mysql5-native"
+
+SRC_URI[md5sum] =3D "a43ffa58e3611e5a557feb745596aca3"
+SRC_URI[sha256sum] =3D "eb85e3fa152949670f5b6f4379bd1d700a5f4726660ce18f=
f0ca628190cba907"
diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.66.inc b/meta-oe/re=
cipes-support/mysql/mysql5_5.1.66.inc
new file mode 100644
index 0000000..df7e977
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.66.inc
@@ -0,0 +1,202 @@
+DESCRIPTION =3D "The MySQL Open Source Database System"
+HOMEPAGE =3D "http://www.mysql.com/"
+SECTION =3D "libs"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "ncurses"
+PR =3D "r0"
+
+SRC_URI =3D "http://cdn.mysql.com/Downloads/MySQL-5.1/mysql-${PV}.tar.gz=
 \
+           file://mysql-5.1.66-ac_cache_check.patch \
+           file://misc.m4.patch \
+           file://Makefile.am.patch \
+           file://fix_host_path.patch \
+           file://mysql-5.1.66-skip_abi_check.patch \
+           file://my.cnf \
+           file://mysqld.sh"
+
+S =3D "${WORKDIR}/mysql-${PV}"
+
+BINCONFIG_GLOB =3D "mysql_config"
+
+inherit autotools binconfig update-rc.d
+
+INITSCRIPT_PACKAGES =3D "${PN}-server"
+INITSCRIPT_NAME =3D "mysqld"
+INITSCRIPT_PARAMS =3D "start 45 5 . stop 45 0 6 1 ."
+
+export ac_cv_path_PS=3D"/bin/ps"
+export ac_cv_FIND_PROC=3D"/bin/ps p \$\$PID | grep -v grep | grep mysqld=
 > /dev/null"
+PARALLEL_MAKE =3D " "
+EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_hash'=
"
+EXTRA_OECONF =3D " ac_cv_c_stack_direction=3D-1 \
+     ac_cv_func_utime_null=3Dyes \
+     ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=3Dyes \
+     ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=3Dno \
+     ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=3Dyes \
+     ac_cv_have_decl_HAVE_IB_PAUSE_INSTRUCTION=3Dyes \
+     ac_cv_sys_restartable_syscalls=3Dyes \
+     mysql_cv_gcc_atomic_builtins=3Dyes \
+     --with-atomic-ops=3Dup --with-embedded-server --prefix=3D/usr \
+     --sysconfdir=3D/etc/mysql --localstatedir=3D/var/mysql \
+     --disable-dependency-tracking --without-raid \
+     --without-debug --with-low-memory --without-query-cache \
+     --without-man --without-docs --without-innodb "
+
+do_configure_append() {
+     sed -i /comp_err/d ${S}/sql/share/Makefile
+
+     # handle distros with different values of ${libexecdir}
+     libexecdir2=3D`echo ${libexecdir} | sed -e 's+/usr/++g'`
+     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_d=
b.sh
+     sed -i -e "s:mysqld libexec:mysqld $libexecdir2:g" ${S}/scripts/mys=
ql_install_db.sh
+     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
+}
+
+SYSROOT_PREPROCESS_FUNCS +=3D "mysql5_sysroot_preprocess"
+
+# We need to append this so it runs *after* binconfig's preprocess funct=
ion
+#
+# We really don't care exactly what the directories were set to original=
ly.
+# plugindir is not fixed, but we don't create any plugins.
+#
+mysql5_sysroot_preprocess () {
+	sed -i -es,^pkgincludedir=3D.*,pkgincludedir=3D\'${STAGING_INCDIR}/mysq=
l\', ${SYSROOT_DESTDIR}${bindir_crossscripts}/mysql_config
+	sed -i -es,^pkglibdir=3D.*,pkglibdir=3D\'${STAGING_LIBDIR}\', ${SYSROOT=
_DESTDIR}${bindir_crossscripts}/mysql_config
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=3D${D}' install
+	mv -f ${D}${libdir}/mysql/* ${D}${libdir}
+	rmdir ${D}${libdir}/mysql
+
+	install -d ${D}/etc/init.d
+	install -m 0644 ${WORKDIR}/my.cnf ${D}/etc/
+	install -m 0755 ${WORKDIR}/mysqld.sh ${D}/etc/init.d/mysqld
+}
+
+pkg_postinst_mysql5-server () {
+	if [ "x$D" !=3D "x" ]; then
+		exit 1
+	fi
+
+	grep mysql /etc/passwd || adduser --disabled-password --home=3D/var/mys=
ql --ingroup nogroup mysql
+
+	#Install the database
+	test -d /usr/bin || mkdir -p /usr/bin
+	test -e /usr/bin/hostname || ln -s /bin/hostname /usr/bin/hostname
+	mkdir /var/lib/mysql
+	chown mysql.nogroup /var/lib/mysql
+
+	mysql_install_db
+
+}
+
+pkg_postrm_mysql5-server () {
+	grep mysql /etc/passwd && deluser mysql
+}
+
+PACKAGES =3D "${PN}-dbg ${PN} \
+libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev libmysq=
lclient-r-dbg \
+libmysqlclient libmysqlclient-dev libmysqlclient-staticdev libmysqlclien=
t-dbg \
+${PN}-client ${PN}-server ${PN}-leftovers"
+CONFFILES_${PN}-server +=3D "${sysconfdir}/my.cnf"
+
+FILES_${PN} =3D " "
+RDEPENDS_${PN} =3D "${PN}-client ${PN}-server"
+ALLOW_EMPTY_${PN} =3D "1"
+
+FILES_libmysqlclient =3D "\
+${libdir}/libmysqlclient.so.* \
+${libdir}/plugin/*.so.*"
+FILES_libmysqlclient-dev =3D " \
+${includedir}/mysql/ \
+${libdir}/libmysqlclient.so \
+${libdir}/libmysqlclient.la \
+${libdir}/plugin/*.so \
+${libdir}/plugin/*.la \
+${sysconfdir}/aclocal \
+${bindir}/mysql_config"
+FILES_libmysqlclient-staticdev =3D "\
+${libdir}/*.a \
+${libdir}/plugin/*.a"
+FILES_libmysqlclient-dbg =3D "${libdir}/plugin/.debug/ \
+/usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
+
+FILES_libmysqlclient-r =3D "${libdir}/libmysqlclient_r.so.*"
+FILES_libmysqlclient-r-dev =3D "\
+${libdir}/libmysqlclient_r.so \
+${libdir}/libmysqlclient_r.la"
+FILES_libmysqlclient-r-staticdev =3D "${libdir}/libmysqlclient_r.a"
+FILES_libmysqlclient-r-dbg =3D "${libdir}/plugin/.debuglibmysqlclient_r.=
so.*"
+
+FILES_${PN}-client =3D "\
+${bindir}/myisam_ftdump \
+${bindir}/mysql \
+${bindir}/mysql_client_test \
+${bindir}/mysql_client_test_embedded \
+${bindir}/mysql_find_rows \
+${bindir}/mysql_fix_extensions \
+${bindir}/mysql_waitpid \
+${bindir}/mysqlaccess \
+${bindir}/mysqladmin \
+${bindir}/mysqlbug \
+${bindir}/mysqlcheck \
+${bindir}/mysqldump \
+${bindir}/mysqldumpslow \
+${bindir}/mysqlimport \
+${bindir}/mysqlshow \
+${bindir}/mysqlslap \
+${bindir}/mysqltest_embedded \
+${libexecdir}/mysqlmanager"
+
+FILES_${PN}-server =3D "\
+${bindir}/comp_err \
+${bindir}/isamchk \
+${bindir}/isamlog \
+${bindir}/msql2mysql \
+${bindir}/my_print_defaults \
+${bindir}/myisamchk \
+${bindir}/myisamlog \
+${bindir}/myisampack \
+${bindir}/mysql_convert_table_format \
+${bindir}/mysql_fix_privilege_tables \
+${bindir}/mysql_install_db \
+${bindir}/mysql_secure_installation \
+${bindir}/mysql_setpermission \
+${bindir}/mysql_tzinfo_to_sql \
+${bindir}/mysql_upgrade \
+${bindir}/mysql_zap \
+${bindir}/mysqlbinlog \
+${bindir}/mysqld_multi \
+${bindir}/mysqld_safe \
+${bindir}/mysqlhotcopy \
+${bindir}/mysqltest \
+${bindir}/ndb_delete_all \
+${bindir}/ndb_desc \
+${bindir}/ndb_drop_index \
+${bindir}/ndb_drop_table \
+${bindir}/ndb_mgm \
+${bindir}/ndb_restore \
+${bindir}/ndb_select_all \
+${bindir}/ndb_select_count \
+${bindir}/ndb_show_tables \
+${bindir}/ndb_waiter \
+${bindir}/pack_isam \
+${bindir}/perror \
+${bindir}/replace \
+${bindir}/resolve_stack_dump \
+${bindir}/resolveip \
+${libexecdir}/mysqld \
+${sbindir}/mysqld \
+${sbindir}/ndb_cpcd \
+${sbindir}/ndbd \
+${sbindir}/ndb_mgmd \
+${datadir}/mysql/ \
+${localstatedir}/mysql/ \
+${sysconfdir}/init.d \
+${sysconfdir}/my.cnf"
+
+DESCRIPTION_${PN}-leftovers =3D "unpackaged and probably unneeded files =
for ${PN}"
+FILES_${PN}-leftovers =3D "/"
--=20
1.7.11.7



