Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.3753.1607029799579304946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 13:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZCwaq5iK;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id f12so3141398oto.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tHHAxwfvd8fdRMUSfcZ8lW6+f/HCntY6zkFcUgO5kbk=;
        b=ZCwaq5iKFC8XFx1g3hshpHIHuDsBji7hajpIu11dS9sO51Ke98r2v8rjiIle5zBut0
         XPtNkuHZ5hPHjhrCF6qaxC911+pICqU1sxzPcda3wmoOnAb/RjPjERY+G5ccYxVdBacH
         7yfxVylYzJXlwjd1cIQxVZjgOdAWksAp8+L2DIfmQ30nvZEICkwnLTZUVDHion53tZ9J
         rZAtH65uOm57qP0FH+MAkv1p7wqtv8a2cyQJHHzm2JPxhEQH4woqLBz+3gmtvxGkiM7s
         Q3lPghBgWGn0c7IR3KtXWFtWZKvjEKOzhX8k86s4fXOqVWHXI5mJvGAgrZ4q20PyNfAX
         6prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHHAxwfvd8fdRMUSfcZ8lW6+f/HCntY6zkFcUgO5kbk=;
        b=ohrO+s3wyJ6Rm7OA7/8DgsclylFgEljgfyvTT718Nw9OUIk3AQkNXr/JXeDhh1tUxw
         A0OiH8ystC0haTskIBRfZ7DNvGFB7ppeke0uwhUC4JsjqfJ9+Kjtf6tkAlKUiR8dwmWA
         cV/KDCytxlPS5iOh34gn1EBOmG+A1Xwlt9LTWnCUqHNnNU2Z0gpeMse9f97hC4DH3c2G
         sumpOMDP01nTxmWMo8WNDgu+3WjKTvbhTY615mBIKWiBfAu7pUPomI1FOOAJHL2BetMF
         oaVh2PA6G3mdEXa7owDDlyHuO8daqI0OZSfvyLRrnbmbZKUPk6/2IMYErzKFTQtcxSEQ
         TRhw==
X-Gm-Message-State: AOAM5316Ro5qCoHvdWydSmVWibc7UuJbRrVBbFB+y3X8iEWHJe+QQYQt
	BESobo7GZ0Ek7O3/TnDszOFlMS+hAib1bg==
X-Google-Smtp-Source: ABdhPJyAaZbwCuloWiXx+NgEXmFiWeNw/qpExN/W9wEaZvaQE4SfGsWly+yc2yAan9u+SSYcJUxRkQ==
X-Received: by 2002:a05:6830:1308:: with SMTP id p8mr951354otq.330.1607029798412;
        Thu, 03 Dec 2020 13:09:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 60sm137317ott.32.2020.12.03.13.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:09:57 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>,
	Joshua Watt <Joshua.Watt@garmin.com>
Subject: [oe][meta-oe][PATCH v2] fcgiwrap: add recipe
Date: Thu,  3 Dec 2020 15:09:40 -0600
Message-Id: <20201203210940.27813-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123141611.7329-1-Joshua.Watt@garmin.com>
References: <20201123141611.7329-1-Joshua.Watt@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>

fcgiwrap is a simple server for running CGI applications over FastCGI.
It hopes to provide clean CGI support to Nginx and other web servers
that may need it. Homepage: https://github.com/gnosek/fcgiwrap.

Signed-off-by: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 .../packagegroup-meta-webserver.bb            |   1 +
 ...001-Fix-implicit-fallthrough-warning.patch | 313 ++++++++++++++++++
 .../recipes-support/fcgiwrap/fcgiwrap_git.bb  |  24 ++
 3 files changed, 338 insertions(+)
 create mode 100644 meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
 create mode 100644 meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index e3e68582c..2fa5bc4a9 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -38,6 +38,7 @@ RDEPENDS_packagegroup-meta-webserver-php = "\
 RDEPENDS_packagegroup-meta-webserver-support = "\
     spawn-fcgi \
     fcgi \
+    fcgiwrap \
 "
 
 RDEPENDS_packagegroup-meta-webserver-webadmin = "\
diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
new file mode 100644
index 000000000..d05abd25c
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap/0001-Fix-implicit-fallthrough-warning.patch
@@ -0,0 +1,313 @@
+From 962e532099d10ee6ce5b4ce68537bc46595230c0 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <Joshua.Watt@garmin.com>
+Date: Tue, 24 Nov 2020 08:30:13 -0600
+Subject: [PATCH] Fix implicit fallthrough warning
+
+Fixes a warning about an implicit fall through in a case statement
+(-Werror=implicit-fallthrough) with newer versions of GCC
+
+Upstream-status: Submitted [https://github.com/gnosek/fcgiwrap/pull/54]
+Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
+---
+ configure.ac                |   3 +
+ fcgiwrap.c                  |   7 ++
+ m4/ax_gcc_func_attribute.m4 | 242 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 252 insertions(+)
+ create mode 100644 m4/ax_gcc_func_attribute.m4
+
+diff --git a/configure.ac b/configure.ac
+index bb3674e..9ef517a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,6 +3,7 @@
+ 
+ AC_PREREQ(2.61)
+ AC_INIT([fcgiwrap], [1.1.0], [root@localdomain.pl])
++AC_CONFIG_MACRO_DIRS([m4])
+ AM_CFLAGS="-std=gnu99 -Wall -Wextra -Werror -pedantic"
+ if test x"$CFLAGS" = x""; then
+     AM_CFLAGS="$AM_CFLAGS -O2 -g3"
+@@ -62,5 +63,7 @@ AC_FUNC_MALLOC
+ AC_CHECK_FUNCS([strchr strdup strrchr])
+ AC_CHECK_FUNCS([dup2 putenv select setenv strerror],, [AC_MSG_ERROR([seems as if your libraries don't provide an expected function])])
+ 
++AX_GCC_FUNC_ATTRIBUTE([fallthrough])
++
+ AC_CONFIG_FILES([Makefile])
+ AC_OUTPUT
+diff --git a/fcgiwrap.c b/fcgiwrap.c
+index b44d8aa..a83726b 100644
+--- a/fcgiwrap.c
++++ b/fcgiwrap.c
+@@ -56,6 +56,12 @@
+ #define UNIX_PATH_MAX 108
+ #endif
+ 
++#ifdef HAVE_FUNC_ATTRIBUTE_FALLTHROUGH
++#define FALLTHROUGH __attribute__ ((fallthrough))
++#else
++#define FALLTHROUGH (void)
++#endif
++
+ extern char **environ;
+ static char * const * inherited_environ;
+ static const char **allowed_programs;
+@@ -580,6 +586,7 @@ static void handle_fcgi_request(void)
+ 			execl(filename, filename, (void *)NULL);
+ 			cgi_error("502 Bad Gateway", "Cannot execute script", filename);
+ 
++        FALLTHROUGH;
+ 		default: /* parent */
+ 			close(pipe_in[0]);
+ 			close(pipe_out[1]);
+diff --git a/m4/ax_gcc_func_attribute.m4 b/m4/ax_gcc_func_attribute.m4
+new file mode 100644
+index 0000000..da2b1ac
+--- /dev/null
++++ b/m4/ax_gcc_func_attribute.m4
+@@ -0,0 +1,242 @@
++# ===========================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_gcc_func_attribute.html
++# ===========================================================================
++#
++# SYNOPSIS
++#
++#   AX_GCC_FUNC_ATTRIBUTE(ATTRIBUTE)
++#
++# DESCRIPTION
++#
++#   This macro checks if the compiler supports one of GCC's function
++#   attributes; many other compilers also provide function attributes with
++#   the same syntax. Compiler warnings are used to detect supported
++#   attributes as unsupported ones are ignored by default so quieting
++#   warnings when using this macro will yield false positives.
++#
++#   The ATTRIBUTE parameter holds the name of the attribute to be checked.
++#
++#   If ATTRIBUTE is supported define HAVE_FUNC_ATTRIBUTE_<ATTRIBUTE>.
++#
++#   The macro caches its result in the ax_cv_have_func_attribute_<attribute>
++#   variable.
++#
++#   The macro currently supports the following function attributes:
++#
++#    alias
++#    aligned
++#    alloc_size
++#    always_inline
++#    artificial
++#    cold
++#    const
++#    constructor
++#    constructor_priority for constructor attribute with priority
++#    deprecated
++#    destructor
++#    dllexport
++#    dllimport
++#    error
++#    externally_visible
++#    fallthrough
++#    flatten
++#    format
++#    format_arg
++#    gnu_format
++#    gnu_inline
++#    hot
++#    ifunc
++#    leaf
++#    malloc
++#    noclone
++#    noinline
++#    nonnull
++#    noreturn
++#    nothrow
++#    optimize
++#    pure
++#    sentinel
++#    sentinel_position
++#    unused
++#    used
++#    visibility
++#    warning
++#    warn_unused_result
++#    weak
++#    weakref
++#
++#   Unsupported function attributes will be tested with a prototype
++#   returning an int and not accepting any arguments and the result of the
++#   check might be wrong or meaningless so use with care.
++#
++# LICENSE
++#
++#   Copyright (c) 2013 Gabriele Svelto <gabriele.svelto@gmail.com>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved.  This file is offered as-is, without any
++#   warranty.
++
++#serial 12
++
++AC_DEFUN([AX_GCC_FUNC_ATTRIBUTE], [
++    AS_VAR_PUSHDEF([ac_var], [ax_cv_have_func_attribute_$1])
++
++    AC_CACHE_CHECK([for __attribute__(($1))], [ac_var], [
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([
++            m4_case([$1],
++                [alias], [
++                    int foo( void ) { return 0; }
++                    int bar( void ) __attribute__(($1("foo")));
++                ],
++                [aligned], [
++                    int foo( void ) __attribute__(($1(32)));
++                ],
++                [alloc_size], [
++                    void *foo(int a) __attribute__(($1(1)));
++                ],
++                [always_inline], [
++                    inline __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [artificial], [
++                    inline __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [cold], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [const], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [constructor_priority], [
++                    int foo( void ) __attribute__((__constructor__(65535/2)));
++                ],
++                [constructor], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [deprecated], [
++                    int foo( void ) __attribute__(($1("")));
++                ],
++                [destructor], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [dllexport], [
++                    __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [dllimport], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [error], [
++                    int foo( void ) __attribute__(($1("")));
++                ],
++                [externally_visible], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [fallthrough], [
++                    int foo( void ) {switch (0) { case 1: __attribute__(($1)); case 2: break ; }};
++                ],
++                [flatten], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [format], [
++                    int foo(const char *p, ...) __attribute__(($1(printf, 1, 2)));
++                ],
++                [gnu_format], [
++                    int foo(const char *p, ...) __attribute__((format(gnu_printf, 1, 2)));
++                ],
++                [format_arg], [
++                    char *foo(const char *p) __attribute__(($1(1)));
++                ],
++                [gnu_inline], [
++                    inline __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [hot], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [ifunc], [
++                    int my_foo( void ) { return 0; }
++                    static int (*resolve_foo(void))(void) { return my_foo; }
++                    int foo( void ) __attribute__(($1("resolve_foo")));
++                ],
++                [leaf], [
++                    __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [malloc], [
++                    void *foo( void ) __attribute__(($1));
++                ],
++                [noclone], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [noinline], [
++                    __attribute__(($1)) int foo( void ) { return 0; }
++                ],
++                [nonnull], [
++                    int foo(char *p) __attribute__(($1(1)));
++                ],
++                [noreturn], [
++                    void foo( void ) __attribute__(($1));
++                ],
++                [nothrow], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [optimize], [
++                    __attribute__(($1(3))) int foo( void ) { return 0; }
++                ],
++                [pure], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [sentinel], [
++                    int foo(void *p, ...) __attribute__(($1));
++                ],
++                [sentinel_position], [
++                    int foo(void *p, ...) __attribute__(($1(1)));
++                ],
++                [returns_nonnull], [
++                    void *foo( void ) __attribute__(($1));
++                ],
++                [unused], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [used], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [visibility], [
++                    int foo_def( void ) __attribute__(($1("default")));
++                    int foo_hid( void ) __attribute__(($1("hidden")));
++                    int foo_int( void ) __attribute__(($1("internal")));
++                    int foo_pro( void ) __attribute__(($1("protected")));
++                ],
++                [warning], [
++                    int foo( void ) __attribute__(($1("")));
++                ],
++                [warn_unused_result], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [weak], [
++                    int foo( void ) __attribute__(($1));
++                ],
++                [weakref], [
++                    static int foo( void ) { return 0; }
++                    static int bar( void ) __attribute__(($1("foo")));
++                ],
++                [
++                 m4_warn([syntax], [Unsupported attribute $1, the test may fail])
++                 int foo( void ) __attribute__(($1));
++                ]
++            )], [])
++            ],
++            dnl GCC doesn't exit with an error if an unknown attribute is
++            dnl provided but only outputs a warning, so accept the attribute
++            dnl only if no warning were issued.
++            [AS_IF([grep -- -Wattributes conftest.err],
++                [AS_VAR_SET([ac_var], [no])],
++                [AS_VAR_SET([ac_var], [yes])])],
++            [AS_VAR_SET([ac_var], [no])])
++    ])
++
++    AS_IF([test yes = AS_VAR_GET([ac_var])],
++        [AC_DEFINE_UNQUOTED(AS_TR_CPP(HAVE_FUNC_ATTRIBUTE_$1), 1,
++            [Define to 1 if the system has the `$1' function attribute])], [])
++
++    AS_VAR_POPDEF([ac_var])
++])
+-- 
+2.29.2
+
diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
new file mode 100644
index 000000000..a9a8ce054
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "FastCGI wrapper for CGI scripts"
+DESCRIPTION = "FcgiWrap is a simple server for running CGI applications over FastCGI. Fcgiwrap can be used together with Nginx to serve CGI or Perl scripts"
+HOMEPAGE = "https://github.com/gnosek/fcgiwrap"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a95d02d614a3a0232d4e6e51b7963c5b"
+
+DEPENDS = "fcgi"
+
+SRC_URI = "git://github.com/gnosek/fcgiwrap.git;protocol=https;branch=${BRANCH} \
+           file://0001-Fix-implicit-fallthrough-warning.patch \
+           "
+BRANCH = "master"
+SRCREV = "99c942c90063c73734e56bacaa65f947772d9186"
+
+S = "${WORKDIR}/git"
+CFLAGS =+ "-I${B}"
+EXTRA_OEMAKE = "VPATH=${S}"
+
+inherit autotools pkgconfig
+
+do_install() {
+    install -Dm 755 ${B}/fcgiwrap ${D}${sbindir}/fcgiwrap
+}
-- 
2.29.2

