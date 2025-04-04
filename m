Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FDCC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 05:53:00 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.5129.1743745976611491572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 22:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 4 Apr 2025 14:52:54 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.126 with ESMTP; 4 Apr 2025 14:52:54 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH v2] sharutils: fix build with gcc-15.0.1
Date: Fri,  4 Apr 2025 14:52:53 +0900
Message-Id: <20250404055253.1323419-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 05:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116560

From: "mark.yang" <mark.yang@lge.com>

* gcc-15 uses gnu23 standard for c:
  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
  bool is included as a reserved word, causing an error due to duplicate declaration.

  The maintainer of this component is not responding. Also, it seems that it is not being maintained.

* ../../sharutils-4.15.2/lib/system.h:51:36: error: expected ';', identifier or '(' before 'bool'
   51 | typedef enum {false = 0, true = 1} bool;
      |                                    ^~~~
  ../../sharutils-4.15.2/lib/system.h:79:7: error: conflicting types for 'fdopen'; have 'FILE *(void)'
   79 | FILE *fdopen ();
      |       ^~~~~~
  In file included from ../lib/stdio.h:43,
                 from ../../sharutils-4.15.2/libopts/autoopts/options.h:42,
                 from ../../sharutils-4.15.2/src/shar-opts.h:49:
  recipe-sysroot/usr/include/stdio.h:299:14: note: previous declaration of 'fdopen' with type 'FILE *(int,  const char *)'
  299 | extern FILE *fdopen (int __fd, const char *__modes) __THROW
      |              ^~~~~~
  ../../sharutils-4.15.2/lib/system.h:82:7: error: conflicting types for 'popen'; have 'FILE *(void)'
   82 | FILE *popen ();
      |       ^~~~~
  recipe-sysroot/usr/include/stdio.h:893:14: note: previous declaration of 'popen' with type 'FILE *(const char *, const char *)'
  893 | extern FILE *popen (const char *__command, const char *__modes)
      |              ^~~~~
  ../../sharutils-4.15.2/src/shar.c:112:12: error: conflicting types for 'localtime'; have 'struct tm *(void)'
  112 | struct tm *localtime ();
      |            ^~~~~~~~~
  In file included from ../lib/time.h:39,
                 from ../lib/sys/stat.h:44,
                 from ../../sharutils-4.15.2/lib/system.h:32:
  recipe-sysroot/usr/include/time.h:136:19: note: previous declaration of 'localtime' with type 'struct tm *(const time_t *)' {aka 'struct tm *(const long int *)'}
  136 | extern struct tm *localtime (const time_t *__timer) __THROW;
      |                   ^~~~~~~~~
  ../../sharutils-4.15.2/src/uudecode.c:85:16: error: conflicting types for 'getpwnam'; have 'struct passwd *(void)'
   85 | struct passwd *getpwnam ();
      |                ^~~~~~~~
  In file included from ../../sharutils-4.15.2/src/uudecode.c:76:
  recipe-sysroot/usr/include/pwd.h:116:23: note: previous declaration of 'getpwnam' with type 'struct passwd *(const char *)'
  116 | extern struct passwd *getpwnam (const char *__name) __nonnull ((1));
      |                       ^~~~~~~~
      |            ^~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: Use a backport patch. 

 .../0001-ISO-C23-Backport-stdbool.m4.patch    | 213 ++++++++++++++++++
 ...0001-fix-build-with-gcc-15.0.1-error.patch | 166 --------------
 ...02-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch |  49 ++++
 ...003-ISO-C23-Port-the-code-to-ISO-C23.patch | 143 ++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |   4 +-
 5 files changed, 408 insertions(+), 167 deletions(-)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-ISO-C23-Backport-stdbool.m4.patch
 delete mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0002-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0003-ISO-C23-Port-the-code-to-ISO-C23.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-ISO-C23-Backport-stdbool.m4.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-ISO-C23-Backport-stdbool.m4.patch
new file mode 100644
index 0000000000..507c0c99cb
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-ISO-C23-Backport-stdbool.m4.patch
@@ -0,0 +1,213 @@
+From c349e9656440fcde2f71950d466fcddaa9a59f72 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Fri, 4 Apr 2025 14:19:00 +0900
+Subject: [PATCH 1/3] ISO C23: Backport stdbool.m4
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: Petr Písař <ppisar@redhat.com>
+
+The bundled gnulib check for stdbool.h did not account for ISO C23
+which provides its own false and true keywords. As a result stdbool.h
+presence was not correctly detected and libopts/compat/compat.h,
+bundled from AutoGen, failed to compile with GCC 15 which defaults to
+ISO C23:
+
+    In file included from autoopts/project.h:30,
+                     from libopts.c:2:
+    ./compat/compat.h:188:19: error: cannot use keyword ‘false’ as enumeration
+constant
+      188 |    typedef enum { false = 0, true = 1 } _Bool;
+          |                   ^~~~~
+    ./compat/compat.h:188:19: note: ‘false’ is a keyword with ‘-std=c23’ onwards
+    ./compat/compat.h:188:41: error: expected ‘;’, identifier or ‘(’ before
+‘_Bool’
+      188 |    typedef enum { false = 0, true = 1 } _Bool;
+          |                                         ^~~~~
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+Upstream-Status: Backport [https://lists.gnu.org/r/bug-gnu-utils/2025-03/msg00002.html]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ m4/stdbool.m4 | 129 +++++++++++++++++++++++++++++---------------------
+ 1 file changed, 74 insertions(+), 55 deletions(-)
+
+diff --git a/m4/stdbool.m4 b/m4/stdbool.m4
+index 7273b82..8e00e4a 100644
+--- a/m4/stdbool.m4
++++ b/m4/stdbool.m4
+@@ -1,27 +1,40 @@
+ # Check for stdbool.h that conforms to C99.
+ 
+-dnl Copyright (C) 2002-2006, 2009-2015 Free Software Foundation, Inc.
++dnl Copyright (C) 2002-2006, 2009-2023 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+ 
+-#serial 5
++#serial 10
+ 
+ # Prepare for substituting <stdbool.h> if it is not supported.
+ 
+ AC_DEFUN([AM_STDBOOL_H],
+ [
+   AC_REQUIRE([AC_CHECK_HEADER_STDBOOL])
++  AC_REQUIRE([AC_CANONICAL_HOST])
+ 
+-  # Define two additional variables used in the Makefile substitution.
+-
++  dnl On some platforms, <stdbool.h> does not exist or does not conform to C99.
++  dnl On Solaris 10 with CC=cc CXX=CC, <stdbool.h> exists but is not usable
++  dnl in C++ mode (and no <cstdbool> exists). In this case, we use our
++  dnl replacement, also in C mode (for binary compatibility between C and C++).
+   if test "$ac_cv_header_stdbool_h" = yes; then
+-    STDBOOL_H=''
++    case "$host_os" in
++      solaris*)
++        if test -z "$GCC"; then
++          GL_GENERATE_STDBOOL_H=true
++        else
++          GL_GENERATE_STDBOOL_H=false
++        fi
++        ;;
++      *)
++        GL_GENERATE_STDBOOL_H=false
++        ;;
++    esac
+   else
+-    STDBOOL_H='stdbool.h'
++    GL_GENERATE_STDBOOL_H=true
+   fi
+-  AC_SUBST([STDBOOL_H])
+-  AM_CONDITIONAL([GL_GENERATE_STDBOOL_H], [test -n "$STDBOOL_H"])
++  AM_CONDITIONAL([GL_GENERATE_STDBOOL_H], [test "$GL_GENERATE_STDBOOL_H" = "true"])
+ 
+   if test "$ac_cv_type__Bool" = yes; then
+     HAVE__BOOL=1
+@@ -31,70 +44,76 @@ AC_DEFUN([AM_STDBOOL_H],
+   AC_SUBST([HAVE__BOOL])
+ ])
+ 
+-# AM_STDBOOL_H will be renamed to gl_STDBOOL_H in the future.
+-AC_DEFUN([gl_STDBOOL_H], [AM_STDBOOL_H])
+-
+-# This version of the macro is needed in autoconf <= 2.68.
++m4_version_prereq([2.72], [], [
+ 
+ AC_DEFUN([AC_CHECK_HEADER_STDBOOL],
+-  [AC_CACHE_CHECK([for stdbool.h that conforms to C99],
++  [AC_CHECK_TYPES([_Bool])
++   AC_CACHE_CHECK([for stdbool.h that conforms to C99 or later],
+      [ac_cv_header_stdbool_h],
+      [AC_COMPILE_IFELSE(
+         [AC_LANG_PROGRAM(
+-           [[
+-             #include <stdbool.h>
+-             #ifndef bool
+-              "error: bool is not defined"
++           [[#include <stdbool.h>
++
++             /* "true" and "false" should be usable in #if expressions and
++                integer constant expressions, and "bool" should be a valid
++                type name.
++
++                Although C99 requires bool, true, and false to be macros,
++                C23 and C++11 overrule that, so do not test for that.
++                Although C99 requires __bool_true_false_are_defined and
++                _Bool, C23 says they are obsolescent, so do not require
++                them.  */
++
++             #if !true
++               #error "'true' is not true"
+              #endif
+-             #ifndef false
+-              "error: false is not defined"
++             #if true != 1
++               #error "'true' is not equal to 1"
+              #endif
++             char b[true == 1 ? 1 : -1];
++             char c[true];
++
+              #if false
+-              "error: false is not 0"
++               #error "'false' is not false"
+              #endif
+-             #ifndef true
+-              "error: true is not defined"
+-             #endif
+-             #if true != 1
+-              "error: true is not 1"
+-             #endif
+-             #ifndef __bool_true_false_are_defined
+-              "error: __bool_true_false_are_defined is not defined"
++             #if false != 0
++               #error "'false' is not equal to 0"
+              #endif
++             char d[false == 0 ? 1 : -1];
++
++             enum { e = false, f = true, g = false * true, h = true * 256 };
++
++             char i[(bool) 0.5 == true ? 1 : -1];
++             char j[(bool) 0.0 == false ? 1 : -1];
++             char k[sizeof (bool) > 0 ? 1 : -1];
++
++             struct sb { bool s: 1; bool t; } s;
++             char l[sizeof s.t > 0 ? 1 : -1];
+ 
+-             struct s { _Bool s: 1; _Bool t; } s;
+-
+-             char a[true == 1 ? 1 : -1];
+-             char b[false == 0 ? 1 : -1];
+-             char c[__bool_true_false_are_defined == 1 ? 1 : -1];
+-             char d[(bool) 0.5 == true ? 1 : -1];
+-             /* See body of main program for 'e'.  */
+-             char f[(_Bool) 0.0 == false ? 1 : -1];
+-             char g[true];
+-             char h[sizeof (_Bool)];
+-             char i[sizeof s.t];
+-             enum { j = false, k = true, l = false * true, m = true * 256 };
+              /* The following fails for
+                 HP aC++/ANSI C B3910B A.05.55 [Dec 04 2003]. */
+-             _Bool n[m];
+-             char o[sizeof n == m * sizeof n[0] ? 1 : -1];
+-             char p[-1 - (_Bool) 0 < 0 && -1 - (bool) 0 < 0 ? 1 : -1];
++             bool m[h];
++             char n[sizeof m == h * sizeof m[0] ? 1 : -1];
++             char o[-1 - (bool) 0 < 0 ? 1 : -1];
+              /* Catch a bug in an HP-UX C compiler.  See
+-                http://gcc.gnu.org/ml/gcc-patches/2003-12/msg02303.html
+-                http://lists.gnu.org/archive/html/bug-coreutils/2005-11/msg00161.html
++                https://gcc.gnu.org/ml/gcc-patches/2003-12/msg02303.html
++                https://lists.gnu.org/r/bug-coreutils/2005-11/msg00161.html
+               */
+-             _Bool q = true;
+-             _Bool *pq = &q;
++             bool p = true;
++             bool *pp = &p;
+            ]],
+            [[
+-             bool e = &s;
+-             *pq |= q;
+-             *pq |= ! q;
+-             /* Refer to every declared value, to avoid compiler optimizations.  */
+-             return (!a + !b + !c + !d + !e + !f + !g + !h + !i + !!j + !k + !!l
+-                     + !m + !n + !o + !p + !q + !pq);
++             bool ps = &s;
++             *pp |= p;
++             *pp |= ! p;
++
++             /* Refer to every declared value, so they cannot be
++                discarded as unused.  */
++             return (!b + !c + !d + !e + !f + !g + !h + !i + !j + !k
++                     + !l + !m + !n + !o + !p + !pp + !ps);
+            ]])],
+         [ac_cv_header_stdbool_h=yes],
+         [ac_cv_header_stdbool_h=no])])
+-   AC_CHECK_TYPES([_Bool])
+-])
++])# AC_CHECK_HEADER_STDBOOL
++
++]) # m4_version_prereq 2.72
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch
deleted file mode 100644
index 2d4d4196df..0000000000
--- a/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From dd953cb6db70493d113dd60e47ef90307bc3062d Mon Sep 17 00:00:00 2001
-From: "mark.yang" <mark.yang@lge.com>
-Date: Thu, 3 Apr 2025 14:52:48 +0900
-Subject: [PATCH] fix build with gcc-15.0.1 error
-
-* ../../sharutils-4.15.2/lib/system.h:51:36: error: expected ';', identifier or '(' before 'bool'
-   51 | typedef enum {false = 0, true = 1} bool;
-      |                                    ^~~~
-  ../../sharutils-4.15.2/lib/system.h:79:7: error: conflicting types for 'fdopen'; have 'FILE *(void)'
-   79 | FILE *fdopen ();
-      |       ^~~~~~
-  In file included from ../lib/stdio.h:43,
-                 from ../../sharutils-4.15.2/libopts/autoopts/options.h:42,
-                 from ../../sharutils-4.15.2/src/shar-opts.h:49:
-  recipe-sysroot/usr/include/stdio.h:299:14: note: previous declaration of 'fdopen' with type 'FILE *(int,  const char *)'
-  299 | extern FILE *fdopen (int __fd, const char *__modes) __THROW
-      |              ^~~~~~
-  ../../sharutils-4.15.2/lib/system.h:82:7: error: conflicting types for 'popen'; have 'FILE *(void)'
-   82 | FILE *popen ();
-      |       ^~~~~
-  recipe-sysroot/usr/include/stdio.h:893:14: note: previous declaration of 'popen' with type 'FILE *(const char *, const char *)'
-  893 | extern FILE *popen (const char *__command, const char *__modes)
-      |              ^~~~~
-  ../../sharutils-4.15.2/src/shar.c:112:12: error: conflicting types for 'localtime'; have 'struct tm *(void)'
-  112 | struct tm *localtime ();
-      |            ^~~~~~~~~
-  In file included from ../lib/time.h:39,
-                 from ../lib/sys/stat.h:44,
-                 from ../../sharutils-4.15.2/lib/system.h:32:
-  recipe-sysroot/usr/include/time.h:136:19: note: previous declaration of 'localtime' with type 'struct tm *(const time_t *)' {aka 'struct tm *(const long int *)'}
-  136 | extern struct tm *localtime (const time_t *__timer) __THROW;
-      |                   ^~~~~~~~~
-  ../../sharutils-4.15.2/src/uudecode.c:85:16: error: conflicting types for 'getpwnam'; have 'struct passwd *(void)'
-   85 | struct passwd *getpwnam ();
-      |                ^~~~~~~~
-  In file included from ../../sharutils-4.15.2/src/uudecode.c:76:
-  recipe-sysroot/usr/include/pwd.h:116:23: note: previous declaration of 'getpwnam' with type 'struct passwd *(const char *)'
-  116 | extern struct passwd *getpwnam (const char *__name) __nonnull ((1));
-      |                       ^~~~~~~~
-      |            ^~~~~~~~~
-
-* gcc-15 uses gnu23 standard for c:
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-  bool is included as a reserved word, causing an error due to duplicate declaration.
-
-  Also, when parameters are empty, an error occurs. Therefore, when using
-  functions from the standard library, modify the defines in configure.ac
-  and source code to use standard library functions.
-
-Upstream-Status: Inactive-Upstream [lastrelease: 2015]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- configure.ac               | 2 +-
- lib/system.h               | 6 ++++++
- libopts/autoopts/options.h | 2 ++
- libopts/compat/compat.h    | 2 ++
- src/shar.c                 | 2 ++
- src/uudecode.c             | 2 ++
- 6 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2ccaac9..fa66368 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -73,7 +73,7 @@ AC_HEADER_STDC
- AC_STRUCT_TIMEZONE
- AC_TYPE_SIZE_T
- AC_TYPE_INTMAX_T
--AC_CHECK_FUNCS([fchmod isascii strchr])
-+AC_CHECK_FUNCS([fchmod isascii strchr fdopen popen localtime getpwnam])
- AC_FUNC_CLOSEDIR_VOID
- AC_FUNC_FSEEKO
- AC_REPLACE_FUNCS([memset mktime strftime xmalloc xstrdup])
-diff --git a/lib/system.h b/lib/system.h
-index 2b9846b..05864ac 100644
---- a/lib/system.h
-+++ b/lib/system.h
-@@ -48,7 +48,9 @@ typedef long intmax_t;
- #ifdef HAVE_STDBOOL_H
- #include <stdbool.h>
- #else
-+# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef enum {false = 0, true = 1} bool;
-+# endif
- #endif
- 
- #if !HAVE_DECL_STRTOIMAX && !defined strtoimax
-@@ -75,8 +77,12 @@ intmax_t strtoimax ();
- # include <unistd.h>
- #endif
- 
-+#ifndef HAVE_FDOPEN
- FILE *fdopen ();
-+#endif
-+#ifndef HAVE_POPEN
- FILE *popen ();
-+#endif
- 
- /* Global functions of the shar package.  */
- 
-diff --git a/libopts/autoopts/options.h b/libopts/autoopts/options.h
-index 0601d0f..2f86b5e 100644
---- a/libopts/autoopts/options.h
-+++ b/libopts/autoopts/options.h
-@@ -65,12 +65,14 @@
- #  if defined(HAVE_STDBOOL_H)
- #    include <stdbool.h>
- #  else
-+#    if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
-      typedef enum { false = 0, true = 1 } _Bool;
- #    define bool _Bool
- 
-      /* The other macros must be usable in preprocessor directives.  */
- #    define false 0
- #    define true 1
-+#    endif
- #  endif /* HAVE_SYSEXITS_H */
- #endif /* COMPAT_H_GUARD */
- // END-CONFIGURED-HEADERS
-diff --git a/libopts/compat/compat.h b/libopts/compat/compat.h
-index 561d55d..2ffea7e 100644
---- a/libopts/compat/compat.h
-+++ b/libopts/compat/compat.h
-@@ -185,12 +185,14 @@
- #ifdef HAVE_STDBOOL_H
- #  include <stdbool.h>
- #else
-+# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
-    typedef enum { false = 0, true = 1 } _Bool;
- #  define bool _Bool
- 
-    /* The other macros must be usable in preprocessor directives.  */
- #  define false 0
- #  define true 1
-+# endif
- #endif
- 
- /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
-diff --git a/src/shar.c b/src/shar.c
-index 6d7ed1d..af976ea 100644
---- a/src/shar.c
-+++ b/src/shar.c
-@@ -109,7 +109,9 @@ static inline unsigned char to_uchar (char ch) { return ch; }
- #define IS_GRAPH(_c) (isprint (to_uchar (_c)) && !isspace (to_uchar (_c)))
- #endif
- 
-+#ifndef HAVE_LOCALTIME
- struct tm *localtime ();
-+#endif
- 
- #if MSDOS
-           /* 1 extra for CR.  */
-diff --git a/src/uudecode.c b/src/uudecode.c
-index 0621c99..00a6345 100644
---- a/src/uudecode.c
-+++ b/src/uudecode.c
-@@ -82,7 +82,9 @@ static char const cright_years_z[] =
- #define UU_CHMOD(_n, _fd, _m)   chmod ((_n), UU_MODE_BITS(_m))
- #endif
- 
-+#ifndef HAVE_GETPWNAM
- struct passwd *getpwnam ();
-+#endif
- 
- static uudecode_exit_code_t read_stduu(
-         const char *inname, const char *outname);
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0002-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch b/meta-oe/recipes-support/sharutils/sharutils/0002-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch
new file mode 100644
index 0000000000..44991cad1b
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0002-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch
@@ -0,0 +1,49 @@
+From 01c13c5b455ec8d51240af20f59324b2ed15a337 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 4 Apr 2025 14:20:05 +0900
+Subject: [PATCH 2/3] ISO C23: Port getcwd.m4 to ISO C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: Petr Písař <ppisar@redhat.com>
+
+Some confgure tests failed because of function arguments missing from
+the prototypes:
+
+    configure:16105: checking whether getcwd (NULL, 0) allocates memory for
+result
+    configure:16162: gcc -o conftest -g -O2   conftest.c  >&5
+    conftest.c:186:16: error: conflicting types for 'getcwd'; have 'char
+*(void)'
+      186 |          char *getcwd ();
+          |                ^~~~~~
+    In file included from conftest.c:181:
+    /usr/include/unistd.h:531:14: note: previous declaration of 'getcwd' with
+type 'char *(char *, size_t)'
+
+This patch fixes it.
+
+Maintainer is encouraged to rebase the m4 files to the latest gnulib.
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+Upstream-Status: Backport [https://lists.gnu.org/r/bug-gnu-utils/2025-03/msg00003.html]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ m4/getcwd.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/getcwd.m4 b/m4/getcwd.m4
+index b9fbcec..6f24b14 100644
+--- a/m4/getcwd.m4
++++ b/m4/getcwd.m4
+@@ -21,7 +21,7 @@ AC_DEFUN([gl_FUNC_GETCWD_NULL],
+ #         include <direct.h>
+ #        endif
+ #        ifndef getcwd
+-         char *getcwd ();
++         char *getcwd (char *buf, size_t size);
+ #        endif
+ ]], [[
+ #if (defined _WIN32 || defined __WIN32__) && ! defined __CYGWIN__
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0003-ISO-C23-Port-the-code-to-ISO-C23.patch b/meta-oe/recipes-support/sharutils/sharutils/0003-ISO-C23-Port-the-code-to-ISO-C23.patch
new file mode 100644
index 0000000000..57e0ac3ed6
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0003-ISO-C23-Port-the-code-to-ISO-C23.patch
@@ -0,0 +1,143 @@
+From 4e50196673fc14bd6081e8a78cc940199566ba55 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Fri, 4 Apr 2025 14:38:51 +0900
+Subject: [PATCH 3/3] ISO C23: Port the code to ISO C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: Petr Písař <ppisar@redhat.com>
+
+With GCC 15, which defaults to ISO 23, a build failed, for example like
+this:
+
+    gcc -DLOCALEDIR=\"/usr/local/share/locale\" -DHAVE_CONFIG_H -I. -I..
+-I../libopts -I. -I.. -I../lib -I
+    ../lib -I../intl  -Wno-format-contains-nul -g -O2 -Wno-format-contains-nul
+-c -o shar.o shar.c
+    In file included from local.h:23,
+                     from shar-opts.h:354,
+                     from shar.c:46:
+    ../lib/system.h:78:7: error: conflicting types for ‘fdopen’; have ‘FILE
+*(void)’
+       78 | FILE *fdopen ();
+          |       ^~~~~~
+
+The cause is that ISO C23 changed a meaning of an empty argument list
+from an unspecified list to no arguments.
+
+Also K&R syntax is now deprecated and the compiler warned:
+
+    encode.c: In function ‘write_encoded_bytes’:
+    encode.c:33:1: warning: old-style function definition
+[-Wold-style-definition]
+       33 | write_encoded_bytes (group, file)
+          | ^~~~~~~~~~~~~~~~~~~
+
+This patch fixes both the erros and the warnigs by specifying all the
+arguments in the modern syntax.
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+Upstream-Status: Backport [https://lists.gnu.org/r/bug-gnu-utils/2025-03/msg00001.html]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ lib/system.h   |  6 +++---
+ src/encode.c   | 13 +++----------
+ src/shar.c     |  3 +--
+ src/uudecode.c |  2 +-
+ 4 files changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/lib/system.h b/lib/system.h
+index 2b9846b..811e8cf 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -52,7 +52,7 @@ typedef enum {false = 0, true = 1} bool;
+ #endif
+ 
+ #if !HAVE_DECL_STRTOIMAX && !defined strtoimax
+-intmax_t strtoimax ();
++intmax_t strtoimax (const char *nptr, char **endptr, int base);
+ #endif
+ 
+ #if HAVE_STRING_H
+@@ -75,8 +75,8 @@ intmax_t strtoimax ();
+ # include <unistd.h>
+ #endif
+ 
+-FILE *fdopen ();
+-FILE *popen ();
++FILE *fdopen (int fd, const char *mode);
++FILE *popen (const char *command, const char *type);
+ 
+ /* Global functions of the shar package.  */
+ 
+diff --git a/src/encode.c b/src/encode.c
+index 09e0c69..b1de8bd 100644
+--- a/src/encode.c
++++ b/src/encode.c
+@@ -30,9 +30,7 @@
+ `------------------------------------------*/
+ 
+ static void
+-write_encoded_bytes (group, file)
+-     char *group;
+-     FILE *file;
++write_encoded_bytes (char *group, FILE *file)
+ {
+   int c1, c2, c3, c4;
+ 
+@@ -52,10 +50,7 @@ write_encoded_bytes (group, file)
+ `--------------------------------------------------------------------*/
+ 
+ static int
+-read_raw_bytes (file, buffer, buffer_size)
+-     FILE *file;
+-     char *buffer;
+-     int buffer_size;
++read_raw_bytes (FILE *file, char *buffer, int buffer_size)
+ {
+   int character;
+   int counter;
+@@ -75,9 +70,7 @@ read_raw_bytes (file, buffer, buffer_size)
+ `----------------------------------------------------*/
+ 
+ void
+-copy_file_encoded (input, output)
+-     FILE *input;
+-     FILE *output;
++copy_file_encoded (FILE *input, FILE *output)
+ {
+   char buffer[LINE_BUFFER_SIZE];
+   int counter;
+diff --git a/src/shar.c b/src/shar.c
+index 6d7ed1d..b5e84ff 100644
+--- a/src/shar.c
++++ b/src/shar.c
+@@ -1,4 +1,3 @@
+-
+ static const char cright_years_z[] =
+ 
+ /* Handle so called `shell archives'.
+@@ -109,7 +108,7 @@ static inline unsigned char to_uchar (char ch) { return ch; }
+ #define IS_GRAPH(_c) (isprint (to_uchar (_c)) && !isspace (to_uchar (_c)))
+ #endif
+ 
+-struct tm *localtime ();
++struct tm *localtime (const time_t *timep);
+ 
+ #if MSDOS
+           /* 1 extra for CR.  */
+diff --git a/src/uudecode.c b/src/uudecode.c
+index 0621c99..b8a316e 100644
+--- a/src/uudecode.c
++++ b/src/uudecode.c
+@@ -82,7 +82,7 @@ static char const cright_years_z[] =
+ #define UU_CHMOD(_n, _fd, _m)   chmod ((_n), UU_MODE_BITS(_m))
+ #endif
+ 
+-struct passwd *getpwnam ();
++struct passwd *getpwnam (const char *name);
+ 
+ static uudecode_exit_code_t read_stduu(
+         const char *inname, const char *outname);
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index d98e49c97a..45bf341063 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -14,7 +14,9 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
            file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
            file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch \
-           file://0001-fix-build-with-gcc-15.0.1-error.patch \
+           file://0001-ISO-C23-Backport-stdbool.m4.patch \
+           file://0002-ISO-C23-Port-getcwd.m4-to-ISO-C23.patch \
+           file://0003-ISO-C23-Port-the-code-to-ISO-C23.patch \
            "
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 

