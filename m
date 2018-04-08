Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 784BA7554F
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:04 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id y66so3721788pfi.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7FknDt9op6kFZXXOIlSbfff/4+1pP25Jo1zisRr5qIs=;
	b=uMfrhKWcfAAGnIvXVb4uuBbK9ntoUmRzAJYMhd/FDhw1xdE0XErZpCjityW40JyJ3H
	7bN7cyDMfFI4XUgV2bdNv41i/nvNwEG/UDWd5UeGqAbZuxGr2RT+oev1lLU6aVqh6MYx
	2sxyfYiG3F6bSdQLucaJWgO4tkLVzGCO1zaxetr5UWWsXsDqhcWt6guwR60p6wcGlK8C
	scD/kSLnDwxDFCMaMa8msbKWhldt+j9428fJsS/AP3CKLRt6g6PEyJxEWDMUIRzdVplp
	b2+AsihnG7ubpcZLiNiWFkeFTjTieD46AjNcq3c9MbaiCplJXhcctxqlyEAXSkBLsy3u
	0ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7FknDt9op6kFZXXOIlSbfff/4+1pP25Jo1zisRr5qIs=;
	b=dXPM0VR8b+dnYalJslanVGdUxOHvQ851Qpc2mxb3x54kUHGEoH70T2FJ5n51glpQNt
	KLStDwQZyH+eO7Ni0yqKsk3k8j6OWcOCv9fDjUnG1pDAc2YAiVZuqOnhkLxDzvD22MA+
	7CCg7TsV9pCOJxaroyAKu14OYIbCVonLVgnbQDEKHUW89BpI8KulNqyFUi11a9iz4RmI
	baGGOaXKYjfrvo5fZNsaEipZ30Jg/hZeIlODnvvIoZvlYwwCsw0K8HsVzo9+QeB6Ar4v
	lwSlJQm+eRPuZo0p+Cj/jJnkYlfs7MNkWS+Y01ZYew/WeqQ2vg05wcqHMIIzvADyQux7
	rUNw==
X-Gm-Message-State: AElRT7EL+x1dLyspi1yn5PG3ZaFmdWu3ur7KSa4VoYXGg3YSATlUcnik
	3rpDOgeUZIL2KHJWnkFfAW9ffg==
X-Google-Smtp-Source: AIpwx48tEQP2+ltbToGq5tuzm7osA61m6Q/zH2DWsOxZZmiYP91N7tb5F9wtViKvtt/4UvVmdtQx4g==
X-Received: by 10.98.137.218 with SMTP id n87mr25644514pfk.48.1523170745315;
	Sat, 07 Apr 2018 23:59:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:25 -0700
Message-Id: <1523170729-26321-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 13/37] squid: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:04 -0000

ARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file configure.ac
Hunk #1 succeeded at 27 with fuzz 1 (offset 8 lines).

and others

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...e-noexcept-instead-of-throw-for-C-11-comp.patch |  6 +--
 ...heck-for-Wno-error-format-truncation-comp.patch | 58 +++++++++++-----------
 ...0001-tools.cc-fixed-unused-result-warning.patch |  8 +--
 ...flawed-dynamic-ldb-link-test-in-configure.patch | 17 +++----
 .../squid/files/Set-up-for-cross-compilation.patch | 21 ++++----
 .../squid/files/Skip-AC_RUN_IFELSE-tests.patch     | 35 ++++++-------
 .../recipes-daemons/squid/files/gcc7-fixes.patch   | 19 +++++--
 .../squid/files/set_sysroot_patch.patch            | 18 +++++--
 ...d-don-t-do-squid-conf-tests-at-build-time.patch |  8 ++-
 ...d-use-serial-tests-config-needed-by-ptest.patch |  8 ++-
 10 files changed, 102 insertions(+), 96 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
index 48674c3..f482f80 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch
@@ -1,4 +1,4 @@
-From f9150a0dc092ab2cbd47ee428436b747dce323a9 Mon Sep 17 00:00:00 2001
+From 27e10667bf27baf5f119a791e3473bb9435a786a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 23 Apr 2017 10:28:28 -0700
 Subject: [PATCH] SquidNew: use noexcept instead of throw for C++11 compilers
@@ -11,6 +11,7 @@ _SQUID_EXTERNNEW_ void *operator new[] (size_t size) throw (std::bad_alloc)
                                                        ^~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  include/SquidNew.h | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -43,6 +44,3 @@ index 39fcee0..c960347 100644
  {
      xfree(address);
  }
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
index 0c0a3aa..302136a 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
@@ -1,4 +1,4 @@
-From 14d469bc82c758116aef7d549abd49c131b4170f Mon Sep 17 00:00:00 2001
+From c21adbb0b230ffba97cf5d059e2bd024e13a37df Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Apr 2017 11:54:57 -0700
 Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
@@ -9,36 +9,18 @@ Fixes
 client.c:834:23: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Werror=format-truncation=]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- configure.ac                |  3 +-
- m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 76 insertions(+), 1 deletion(-)
- create mode 100644 m4/ax_check_compile_flag.m4
+ acinclude/ax_check_compile_flag.m4 | 74 ++++++++++++++++++++++++++++++++++++++
+ configure.ac                       |  2 ++
+ 2 files changed, 76 insertions(+)
+ create mode 100644 acinclude/ax_check_compile_flag.m4
 
-Index: squid-3.5.26/configure.ac
-===================================================================
---- squid-3.5.26.orig/configure.ac
-+++ squid-3.5.26/configure.ac
-@@ -26,6 +26,7 @@ m4_include([acinclude/pkg.m4])
- m4_include([acinclude/lib-checks.m4])
- m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
- m4_include([acinclude/ax_cxx_0x_types.m4])
-+m4_include([acinclude/ax_check_compile_flag.m4])
- 
- HOSTCXX="$BUILD_CXX"
- PRESET_CFLAGS="$CFLAGS"
-@@ -44,6 +45,7 @@ AC_PROG_CXX
- AC_LANG([C++])
- AC_CANONICAL_HOST
- 
-+AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[CFLAGS="$CFLAGS -Wno-error=format-truncation" CXXFLAGS="$CXXFLAGS -Wno-error=format-truncation"])
- # Clang 3.2 on some CPUs requires -march-native to detect correctly.
- # GCC 4.3+ can also produce faster executables when its used.
- # But building inside a virtual machine environment has been found to
-Index: squid-3.5.26/acinclude/ax_check_compile_flag.m4
-===================================================================
+diff --git a/acinclude/ax_check_compile_flag.m4 b/acinclude/ax_check_compile_flag.m4
+new file mode 100644
+index 0000000..dcabb92
 --- /dev/null
-+++ squid-3.5.26/acinclude/ax_check_compile_flag.m4
++++ b/acinclude/ax_check_compile_flag.m4
 @@ -0,0 +1,74 @@
 +# ===========================================================================
 +#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
@@ -114,3 +96,23 @@ Index: squid-3.5.26/acinclude/ax_check_compile_flag.m4
 +  [m4_default([$3], :)])
 +AS_VAR_POPDEF([CACHEVAR])dnl
 +])dnl AX_CHECK_COMPILE_FLAGS
+diff --git a/configure.ac b/configure.ac
+index ff4688c..9382fdf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,6 +26,7 @@ m4_include([acinclude/pkg.m4])
+ m4_include([acinclude/lib-checks.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
+ m4_include([acinclude/ax_cxx_0x_types.m4])
++m4_include([acinclude/ax_check_compile_flag.m4])
+ 
+ HOSTCXX="$BUILD_CXX"
+ PRESET_CFLAGS="$CFLAGS"
+@@ -44,6 +45,7 @@ AC_PROG_CXX
+ AC_LANG([C++])
+ AC_CANONICAL_HOST
+ 
++AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[CFLAGS="$CFLAGS -Wno-error=format-truncation" CXXFLAGS="$CXXFLAGS -Wno-error=format-truncation"])
+ # Clang 3.2 on some CPUs requires -march-native to detect correctly.
+ # GCC 4.3+ can also produce faster executables when its used.
+ # But building inside a virtual machine environment has been found to
diff --git a/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch b/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch
index 082a111..8ea55d0 100644
--- a/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch
+++ b/meta-networking/recipes-daemons/squid/files/0001-tools.cc-fixed-unused-result-warning.patch
@@ -1,4 +1,4 @@
-From a78f2f0feda8f92cb59afe8236bd90726908768f Mon Sep 17 00:00:00 2001
+From faaa796a138cbd5033b1e53f33faac0cf4162bf5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 25 Jun 2017 00:59:24 -0700
 Subject: [PATCH] tools.cc: fixed unused-result warning
@@ -10,9 +10,8 @@ fix
 |      ~~~~~~^~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
 
+---
  src/tools.cc | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
@@ -31,6 +30,3 @@ index 8137a03..843e266 100644
  #endif
  #if HAVE_PRCTL && defined(PR_SET_DUMPABLE)
      /* Set Linux DUMPABLE flag */
--- 
-2.13.1
-
diff --git a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
index 2304c5f..25f68af 100644
--- a/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
+++ b/meta-networking/recipes-daemons/squid/files/Fix-flawed-dynamic-ldb-link-test-in-configure.patch
@@ -1,8 +1,7 @@
-From 0d5b337ff5ef7dd48f970f08bd95d6327917cfd1 Mon Sep 17 00:00:00 2001
-Message-Id: <0d5b337ff5ef7dd48f970f08bd95d6327917cfd1.1382375807.git.Jim.Somerville@windriver.com>
+From b4943594654cd340b95aabdc2f3750a4705cc0de Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Mon, 21 Oct 2013 12:50:44 -0400
-Subject: [PATCH 1/1] Fix flawed dynamic -ldb link test in configure
+Subject: [PATCH] Fix flawed dynamic -ldb link test in configure
 
 The test uses dbopen, but just ignores the fact
 that this function may not exist in the db version
@@ -11,15 +10,16 @@ and the configure script just making assumptions
 about why and setting the need for -ldb incorrectly.
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+
 ---
- configure.ac |   12 ++++++++++--
- 1 files changed, 10 insertions(+), 2 deletions(-)
+ configure.ac | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 962a748..42e6a93 100644
+index 57cd1ac..3827222 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3051,8 +3051,16 @@ AC_CHECK_DECL(dbopen,,,[
+@@ -3229,8 +3229,16 @@ AC_CHECK_DECL(dbopen,,,[
  #include <db.h>
  #endif])
  
@@ -38,6 +38,3 @@ index 962a748..42e6a93 100644
  if test "x$ac_cv_dbopen_libdb" = "xyes"; then
      LIB_DB="-ldb"
  fi
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index 4ca2744..3852f7c 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -1,29 +1,28 @@
-From 17e5a28667f667859c48bee25e575a072d39ee1b Mon Sep 17 00:00:00 2001
-Message-Id: <17e5a28667f667859c48bee25e575a072d39ee1b.1381956170.git.Jim.Somerville@windriver.com>
+From 995aaf30799fa972441354b6feb45f0621968929 Mon Sep 17 00:00:00 2001
 From: Jim Somerville <Jim.Somerville@windriver.com>
 Date: Wed, 16 Oct 2013 16:41:03 -0400
-Subject: [PATCH 1/1] Set up for cross compilation
+Subject: [PATCH] Set up for cross compilation
+
+Message-Id: <17e5a28667f667859c48bee25e575a072d39ee1b.1381956170.git.Jim.Somerville@windriver.com>
 
 Set the host compiler to BUILD_CXX so
 proper cross compilation can occur.
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+
 ---
- configure.ac |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index c2d3033..dda9ed9 100644
+index fe80ee0..57cd1ac 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -19,6 +19,7 @@ m4_include([acinclude/lib-checks.m4])
- m4_include([acinclude/ax_cxx_compile_stdcxx_0x.m4])
+@@ -27,6 +27,7 @@ m4_include([acinclude/lib-checks.m4])
+ m4_include([acinclude/ax_cxx_compile_stdcxx_11.m4])
  m4_include([acinclude/ax_cxx_0x_types.m4])
  
 +HOSTCXX="$BUILD_CXX"
  PRESET_CFLAGS="$CFLAGS"
  PRESET_CXXFLAGS="$CXXFLAGS"
  PRESET_LDFLAGS="$LDFLAGS"
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 7b6dcc8..6a33525 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -1,3 +1,6 @@
+From a85311965707ba2fa78f7ce044e6f61e65e66fd0 Mon Sep 17 00:00:00 2001
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Tue, 14 Oct 2014 02:56:08 -0400
 Subject: [PATCH] Skip AC_RUN_IFELSE tests
 
 Upstream-Status: Inappropriate [cross compiling specific]
@@ -7,16 +10,17 @@ environment.  Choose sane defaults.
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
- acinclude/krb5.m4       |   10 +++++++++-
- acinclude/lib-checks.m4 |    8 ++++++--
+ acinclude/krb5.m4       | 10 +++++++++-
+ acinclude/lib-checks.m4 |  8 ++++++--
  2 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
-index 946bea8..7a072a2 100644
+index 5c83d88..c264118 100644
 --- a/acinclude/krb5.m4
 +++ b/acinclude/krb5.m4
-@@ -82,7 +82,15 @@ main(void)
+@@ -61,7 +61,15 @@ main(void)
  
          return 0;
  }
@@ -34,31 +38,28 @@ index 946bea8..7a072a2 100644
    ])
  ]) dnl SQUID_CHECK_KRB5_HEIMDAL_BROKEN_KRB5_H
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 2bf98ee..50dba9b 100644
+index c4874da..ba72982 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -128,7 +128,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS],[
-    AC_DEFINE(SQUID_SSLGETCERTIFICATE_BUGGY, 1)
-    AC_MSG_RESULT([yes])
+@@ -177,7 +177,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
+   [
+    AC_MSG_RESULT([no])
    ],
 -  [])
 +  [
 +   AC_MSG_RESULT([skipped - can't test in cross-compiled env])
 +  ])
  
-   AC_MSG_CHECKING(whether the workaround for SSL_get_certificate works)
-   AC_RUN_IFELSE([
-@@ -154,7 +156,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS],[
-   [
-    AC_MSG_RESULT([no])
+ SQUID_STATE_ROLLBACK(check_const_SSL_METHOD)
+ ]
+@@ -265,7 +267,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
+    AC_MSG_RESULT([yes])
+    AC_DEFINE(SQUID_USE_SSLLHASH_HACK, 1)
    ],
 -[])
 +[
 +   AC_MSG_RESULT([skipped - can't test in cross-compiled env])
 +])
  
- SQUID_STATE_ROLLBACK(check_SSL_get_certificate)
+ SQUID_STATE_ROLLBACK(check_TXTDB)
  ])
--- 
-1.7.1
-
diff --git a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
index cc1ea78..2feca49 100644
--- a/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
+++ b/meta-networking/recipes-daemons/squid/files/gcc7-fixes.patch
@@ -1,11 +1,20 @@
-../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void squidaio_init()':                                                              ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]      #define NUMTHREADS (Config.cacheSwap.n_configured*16)
+From 660fce9cfa00a57e5b7cec46116a31e21595c306 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 19 Jun 2017 23:47:01 -0700
+Subject: [PATCH] squid: Upgrade to 3.5.26
 
+../../squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc: In function 'void squidaio_init()':                                                              ../../squid-3.5.26/src/DiskIO/DiskThreads/DiskThreads.h:30:50: error: '*' in boolean context, suggest '&&' instead [-Werror=int-in-bool-context]      #define NUMTHREADS (Config.cacheSwap.n_configured*16)
 
 Upstream-Status: Backport
-Index: squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
-===================================================================
---- squid-3.5.26.orig/src/DiskIO/DiskThreads/aiops.cc
-+++ squid-3.5.26/src/DiskIO/DiskThreads/aiops.cc
+
+---
+ src/DiskIO/DiskThreads/aiops.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/DiskIO/DiskThreads/aiops.cc b/src/DiskIO/DiskThreads/aiops.cc
+index b44adfa..e11f948 100644
+--- a/src/DiskIO/DiskThreads/aiops.cc
++++ b/src/DiskIO/DiskThreads/aiops.cc
 @@ -290,7 +290,7 @@ squidaio_init(void)
      /* Create threads and get them to sit in their wait loop */
      squidaio_thread_pool = memPoolCreate("aio_thread", sizeof(squidaio_thread_t));
diff --git a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
index fdcd174..e990480 100644
--- a/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
+++ b/meta-networking/recipes-daemons/squid/files/set_sysroot_patch.patch
@@ -1,15 +1,23 @@
-Set the SYSROOT for libxml2 header file to avoid host contamination.
+From 702bd881b66dc034e711c0ff47805f2da40b6e0d Mon Sep 17 00:00:00 2001
+From: Yue Tao <yue.tao@windriver.com>
+Date: Mon, 8 Aug 2016 16:04:33 +0800
+Subject: [PATCH] Set the SYSROOT for libxml2 header file to avoid host
+ contamination.
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yue Tao <yue.tao@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
-diff --git a/configure.ac.old b/configure.ac
-index 54eda73..874f48e 100644
---- a/configure.ac.old
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 504a844..ff4688c 100644
+--- a/configure.ac
 +++ b/configure.ac
-@@ -964,15 +964,15 @@ if test "x$squid_opt_use_esi" = "xyes" -a "x$with_libxml2" != "xno" ; then
+@@ -974,15 +974,15 @@ if test "x$squid_opt_use_esi" = "xyes" -a "x$with_libxml2" != "xno" ; then
    dnl Find the main header and include path...
    AC_CACHE_CHECK([location of libxml2 include files], [ac_cv_libxml2_include], [
      AC_CHECK_HEADERS([libxml/parser.h], [], [
diff --git a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
index 312f44f..e5267ea 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
@@ -1,4 +1,4 @@
-From 54a9c2ba60adc7ec2724786662fd398e7c03999f Mon Sep 17 00:00:00 2001
+From 8786b91488dae3f6dfeadd686e80d2ffc5c29320 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 25 Aug 2016 15:22:57 +0800
 Subject: [PATCH] squid: don't do squid-conf-tests at build time
@@ -14,12 +14,13 @@ Subject: [PATCH] squid: don't do squid-conf-tests at build time
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  test-suite/Makefile.am | 15 +++++++--------
  1 file changed, 7 insertions(+), 8 deletions(-)
 
 diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index d5468be..77fc480 100644
+index 061a463..350dfb2 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
 @@ -41,8 +41,7 @@ TESTS += debug \
@@ -58,6 +59,3 @@ index d5468be..77fc480 100644
  		else break; fi; \
  	done; \
  	if test "$$failed" -eq 0; then cp $(TRUE) $@ ; fi
--- 
-2.8.3
-
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index 01ec596..9c75f17 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -1,4 +1,4 @@
-From bd58d3672bc267824000f34a37561c7ab2bd571f Mon Sep 17 00:00:00 2001
+From 9bcec221a2bb438d8a9ed59aed846ffe3be9cffa Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 19 Jul 2016 01:56:23 -0400
 Subject: [PATCH] squid: use serial-tests config needed by ptest
@@ -9,12 +9,13 @@ serial-tests is required to generate those targets.
 Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 05ad027..e324b93 100644
+index 3827222..504a844 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
@@ -26,6 +27,3 @@ index 05ad027..e324b93 100644
  AC_REVISION($Revision$)dnl
  AC_PREFIX_DEFAULT(/usr/local/squid)
  AM_MAINTAINER_MODE
--- 
-2.8.1
-
-- 
2.7.4


