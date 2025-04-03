Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E94C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 06:13:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.6951.1743660836358960446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 23:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 3 Apr 2025 15:13:53 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.121 with ESMTP; 3 Apr 2025 15:13:53 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] sharutils: fix build with gcc-15.0.1
Date: Thu,  3 Apr 2025 15:13:51 +0900
Message-Id: <20250403061351.922250-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 06:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116530

From: "mark.yang" <mark.yang@lge.com>

* gcc-15 uses gnu23 standard for c:
  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
  bool is included as a reserved word, causing an error due to duplicate declaration.

  Also, when parameters are empty, an error occurs. Therefore, when using
  functions from the standard library, modify the defines in configure.ac
  and source code to use standard library functions.

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
 ...0001-fix-build-with-gcc-15.0.1-error.patch | 166 ++++++++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch
new file mode 100644
index 0000000000..2d4d4196df
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-fix-build-with-gcc-15.0.1-error.patch
@@ -0,0 +1,166 @@
+From dd953cb6db70493d113dd60e47ef90307bc3062d Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 3 Apr 2025 14:52:48 +0900
+Subject: [PATCH] fix build with gcc-15.0.1 error
+
+* ../../sharutils-4.15.2/lib/system.h:51:36: error: expected ';', identifier or '(' before 'bool'
+   51 | typedef enum {false = 0, true = 1} bool;
+      |                                    ^~~~
+  ../../sharutils-4.15.2/lib/system.h:79:7: error: conflicting types for 'fdopen'; have 'FILE *(void)'
+   79 | FILE *fdopen ();
+      |       ^~~~~~
+  In file included from ../lib/stdio.h:43,
+                 from ../../sharutils-4.15.2/libopts/autoopts/options.h:42,
+                 from ../../sharutils-4.15.2/src/shar-opts.h:49:
+  recipe-sysroot/usr/include/stdio.h:299:14: note: previous declaration of 'fdopen' with type 'FILE *(int,  const char *)'
+  299 | extern FILE *fdopen (int __fd, const char *__modes) __THROW
+      |              ^~~~~~
+  ../../sharutils-4.15.2/lib/system.h:82:7: error: conflicting types for 'popen'; have 'FILE *(void)'
+   82 | FILE *popen ();
+      |       ^~~~~
+  recipe-sysroot/usr/include/stdio.h:893:14: note: previous declaration of 'popen' with type 'FILE *(const char *, const char *)'
+  893 | extern FILE *popen (const char *__command, const char *__modes)
+      |              ^~~~~
+  ../../sharutils-4.15.2/src/shar.c:112:12: error: conflicting types for 'localtime'; have 'struct tm *(void)'
+  112 | struct tm *localtime ();
+      |            ^~~~~~~~~
+  In file included from ../lib/time.h:39,
+                 from ../lib/sys/stat.h:44,
+                 from ../../sharutils-4.15.2/lib/system.h:32:
+  recipe-sysroot/usr/include/time.h:136:19: note: previous declaration of 'localtime' with type 'struct tm *(const time_t *)' {aka 'struct tm *(const long int *)'}
+  136 | extern struct tm *localtime (const time_t *__timer) __THROW;
+      |                   ^~~~~~~~~
+  ../../sharutils-4.15.2/src/uudecode.c:85:16: error: conflicting types for 'getpwnam'; have 'struct passwd *(void)'
+   85 | struct passwd *getpwnam ();
+      |                ^~~~~~~~
+  In file included from ../../sharutils-4.15.2/src/uudecode.c:76:
+  recipe-sysroot/usr/include/pwd.h:116:23: note: previous declaration of 'getpwnam' with type 'struct passwd *(const char *)'
+  116 | extern struct passwd *getpwnam (const char *__name) __nonnull ((1));
+      |                       ^~~~~~~~
+      |            ^~~~~~~~~
+
+* gcc-15 uses gnu23 standard for c:
+  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+  bool is included as a reserved word, causing an error due to duplicate declaration.
+
+  Also, when parameters are empty, an error occurs. Therefore, when using
+  functions from the standard library, modify the defines in configure.ac
+  and source code to use standard library functions.
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ configure.ac               | 2 +-
+ lib/system.h               | 6 ++++++
+ libopts/autoopts/options.h | 2 ++
+ libopts/compat/compat.h    | 2 ++
+ src/shar.c                 | 2 ++
+ src/uudecode.c             | 2 ++
+ 6 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2ccaac9..fa66368 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -73,7 +73,7 @@ AC_HEADER_STDC
+ AC_STRUCT_TIMEZONE
+ AC_TYPE_SIZE_T
+ AC_TYPE_INTMAX_T
+-AC_CHECK_FUNCS([fchmod isascii strchr])
++AC_CHECK_FUNCS([fchmod isascii strchr fdopen popen localtime getpwnam])
+ AC_FUNC_CLOSEDIR_VOID
+ AC_FUNC_FSEEKO
+ AC_REPLACE_FUNCS([memset mktime strftime xmalloc xstrdup])
+diff --git a/lib/system.h b/lib/system.h
+index 2b9846b..05864ac 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -48,7 +48,9 @@ typedef long intmax_t;
+ #ifdef HAVE_STDBOOL_H
+ #include <stdbool.h>
+ #else
++# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef enum {false = 0, true = 1} bool;
++# endif
+ #endif
+ 
+ #if !HAVE_DECL_STRTOIMAX && !defined strtoimax
+@@ -75,8 +77,12 @@ intmax_t strtoimax ();
+ # include <unistd.h>
+ #endif
+ 
++#ifndef HAVE_FDOPEN
+ FILE *fdopen ();
++#endif
++#ifndef HAVE_POPEN
+ FILE *popen ();
++#endif
+ 
+ /* Global functions of the shar package.  */
+ 
+diff --git a/libopts/autoopts/options.h b/libopts/autoopts/options.h
+index 0601d0f..2f86b5e 100644
+--- a/libopts/autoopts/options.h
++++ b/libopts/autoopts/options.h
+@@ -65,12 +65,14 @@
+ #  if defined(HAVE_STDBOOL_H)
+ #    include <stdbool.h>
+ #  else
++#    if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+      typedef enum { false = 0, true = 1 } _Bool;
+ #    define bool _Bool
+ 
+      /* The other macros must be usable in preprocessor directives.  */
+ #    define false 0
+ #    define true 1
++#    endif
+ #  endif /* HAVE_SYSEXITS_H */
+ #endif /* COMPAT_H_GUARD */
+ // END-CONFIGURED-HEADERS
+diff --git a/libopts/compat/compat.h b/libopts/compat/compat.h
+index 561d55d..2ffea7e 100644
+--- a/libopts/compat/compat.h
++++ b/libopts/compat/compat.h
+@@ -185,12 +185,14 @@
+ #ifdef HAVE_STDBOOL_H
+ #  include <stdbool.h>
+ #else
++# if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+    typedef enum { false = 0, true = 1 } _Bool;
+ #  define bool _Bool
+ 
+    /* The other macros must be usable in preprocessor directives.  */
+ #  define false 0
+ #  define true 1
++# endif
+ #endif
+ 
+ /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
+diff --git a/src/shar.c b/src/shar.c
+index 6d7ed1d..af976ea 100644
+--- a/src/shar.c
++++ b/src/shar.c
+@@ -109,7 +109,9 @@ static inline unsigned char to_uchar (char ch) { return ch; }
+ #define IS_GRAPH(_c) (isprint (to_uchar (_c)) && !isspace (to_uchar (_c)))
+ #endif
+ 
++#ifndef HAVE_LOCALTIME
+ struct tm *localtime ();
++#endif
+ 
+ #if MSDOS
+           /* 1 extra for CR.  */
+diff --git a/src/uudecode.c b/src/uudecode.c
+index 0621c99..00a6345 100644
+--- a/src/uudecode.c
++++ b/src/uudecode.c
+@@ -82,7 +82,9 @@ static char const cright_years_z[] =
+ #define UU_CHMOD(_n, _fd, _m)   chmod ((_n), UU_MODE_BITS(_m))
+ #endif
+ 
++#ifndef HAVE_GETPWNAM
+ struct passwd *getpwnam ();
++#endif
+ 
+ static uudecode_exit_code_t read_stduu(
+         const char *inname, const char *outname);
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 1bded9f6d1..d98e49c97a 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
            file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
            file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch \
+           file://0001-fix-build-with-gcc-15.0.1-error.patch \
            "
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 

