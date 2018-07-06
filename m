Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06A1D77140
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 00:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w660JfZB000324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Jul 2018 17:19:41 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 5 Jul 2018 17:19:40 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jul 2018 08:19:38 +0800
Message-ID: <1530836378-20235-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-webserver][PATCH] apache2: upgrade 2.4.29 -> 2.4.33
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
X-List-Received-Date: Fri, 06 Jul 2018 00:19:40 -0000
Content-Type: text/plain

* License-Update: Correctly identify origin of util_pcre.c/ap_regex.h as
  pcreposix[.ch] and correct LICENSE/NOTICE to match.

* Refresh patches with devtool

* Drop useless patch apache-ssl-ltmain-rpath.patch

* Move all patches to one directory

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...2-native_2.4.29.bb => apache2-native_2.4.33.bb} |  6 +-
 ...nfigure-use-pkg-config-for-PCRE-detection.patch | 11 ++-
 .../apache2/apache2/apache-configure_perlbin.patch | 25 ++++---
 .../apache2/apache2/apache-ssl-ltmain-rpath.patch  | 81 ----------------------
 ...onfigure-allow-to-disable-selinux-support.patch | 10 ++-
 .../apache2/apache2/httpd-2.4.1-corelimit.patch    | 18 +++--
 .../apache2/apache2/httpd-2.4.1-selinux.patch      | 27 ++++++--
 ...httpd-2.4.3-fix-race-issue-of-dir-install.patch | 20 ++++--
 .../apache2/apache2/httpd-2.4.4-export.patch       | 20 ++++--
 .../replace-lynx-to-curl-in-apachectl-script.patch | 15 ++--
 .../apache2/apache2/server-makefile.patch          | 18 ++++-
 .../{apache2_2.4.29.bb => apache2_2.4.33.bb}       |  7 +-
 12 files changed, 117 insertions(+), 141 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.29.bb => apache2-native_2.4.33.bb} (86%)
 rename meta-webserver/recipes-httpd/apache2/{files => apache2}/0001-configure-use-pkg-config-for-PCRE-detection.patch (92%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
 rename meta-webserver/recipes-httpd/apache2/{files => apache2}/configure-allow-to-disable-selinux-support.patch (88%)
 rename meta-webserver/recipes-httpd/apache2/{files => apache2}/httpd-2.4.3-fix-race-issue-of-dir-install.patch (59%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.29.bb => apache2_2.4.33.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
similarity index 86%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
index 36f073c..a471036 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.33.bb
@@ -14,9 +14,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/httpd-${PV}"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a62b0c7623826ff99766ff13fb9007f8"
-SRC_URI[md5sum] = "0c599404ef6b69eee95bcd9fcd094407"
-SRC_URI[sha256sum] = "777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
+SRC_URI[md5sum] = "6ef469d3f16fffeb688bc6e0346823e5"
+SRC_URI[sha256sum] = "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
similarity index 92%
rename from meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
index 63096db..da38a8c 100644
--- a/meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -1,16 +1,18 @@
-From d8837756f2a48adcfe5d645c39cf163d96eac76c Mon Sep 17 00:00:00 2001
+From 419181e242892ded050f5a375a709b9588fb581d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 09:10:57 +0200
 Subject: [PATCH] configure: use pkg-config for PCRE detection
 
+Upstream-Status: Pending
+
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: pending
+
 ---
  configure.in | 27 +++++----------------------
  1 file changed, 5 insertions(+), 22 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 864d7c7..da4138e 100644
+index be7bd25..54dfd0d 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -215,28 +215,11 @@ fi
@@ -47,6 +49,3 @@ index 864d7c7..da4138e 100644
  APACHE_SUBST(PCRE_LIBS)
  
  AC_MSG_NOTICE([])
--- 
-1.9.3
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
index 92c53f3..a2bc6e0 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
@@ -1,14 +1,19 @@
-# Author: echo <fei.geng@windriver.com>
-# Date: April 28 2009
-# Summary:Fix perl install directory to /usr/bin
-#
-# Upstream-Status: Inappropriate [configuration]
+From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
+From: echo <fei.geng@windriver.com>
+Date: Tue, 28 Apr 2009 03:11:06 +0000
+Subject: [PATCH] Fix perl install directory to /usr/bin
 
-Index: httpd-2.4.29/configure.in
-===================================================================
---- httpd-2.4.29.orig/configure.in
-+++ httpd-2.4.29/configure.in
-@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "
+Upstream-Status: Inappropriate [configuration]
+
+---
+ configure.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index d828512..be7bd25 100644
+--- a/configure.in
++++ b/configure.in
+@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
  AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
  	[Location of the MIME types config file, relative to the Apache root directory])
  
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
deleted file mode 100644
index f13da91..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
+++ /dev/null
@@ -1,81 +0,0 @@
- build/ltmain.sh | 32 +++++++++++++++++++++++++++-----
- 1 file changed, 27 insertions(+), 5 deletions(-)
-
-Index: httpd-2.4.29/build/ltmain.sh
-===================================================================
---- httpd-2.4.29.orig/build/ltmain.sh
-+++ httpd-2.4.29/build/ltmain.sh
-@@ -6969,7 +6969,7 @@ func_mode_link ()
- 	dir=$func_resolve_sysroot_result
- 	# We need an absolute path.
- 	case $dir in
--	[\\/]* | [A-Za-z]:[\\/]*) ;;
-+	=* | [\\/]* | [A-Za-z]:[\\/]*) ;;
- 	*)
- 	  absdir=`cd "$dir" && pwd`
- 	  test -z "$absdir" && \
-@@ -8167,7 +8167,7 @@ func_mode_link ()
- 	    $ECHO "*** $linklib is not portable!"
- 	  fi
- 	  if test lib = "$linkmode" &&
--	     test yes = "$hardcode_into_libs"; then
-+	     test "x$wrs_use_rpaths" = "xyes" && test "$hardcode_into_libs" = yes; then
- 	    # Hardcode the library path.
- 	    # Skip directories that are in the system default run-time
- 	    # search path.
-@@ -8434,7 +8434,7 @@ func_mode_link ()
- 
- 	if test lib = "$linkmode"; then
- 	  if test -n "$dependency_libs" &&
--	     { test yes != "$hardcode_into_libs" ||
-+              { test yes != "$hardcode_into_libs" || test "x$wrs_use_rpaths" != "xyes" ||
- 	       test yes = "$build_old_libs" ||
- 	       test yes = "$link_static"; }; then
- 	    # Extract -R from dependency_libs
-@@ -9086,7 +9086,8 @@ func_mode_link ()
- 	  *) func_append finalize_rpath " $libdir" ;;
- 	  esac
- 	done
--	if test yes != "$hardcode_into_libs" || test yes = "$build_old_libs"; then
-+        if test yes != "$hardcode_into_libs"  || test "x$wrs_use_rpaths" != "xyes" ||
-+           test yes = "$build_old_libs"; then
- 	  dependency_libs="$temp_xrpath $dependency_libs"
- 	fi
-       fi
-@@ -9534,7 +9535,7 @@ EOF
- 	case $archive_cmds in
- 	  *\$LD\ *) wl= ;;
-         esac
--	if test yes = "$hardcode_into_libs"; then
-+	if test yes = "$hardcode_into_libs" && test "x$wrs_use_rpaths" = "xyes"; then
- 	  # Hardcode the library paths
- 	  hardcode_libdirs=
- 	  dep_rpath=
-@@ -10272,6 +10273,27 @@ EOF
-       # Now hardcode the library paths
-       rpath=
-       hardcode_libdirs=
-+
-+      # short circuit putting rpaths in executables
-+      #
-+      if test "x$wrs_use_rpaths" != "xyes" ; then
-+        flag=
-+        for libdir in $compile_rpath; do
-+          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
-+            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag="$flag $libdir" ;;
-+          esac
-+        done
-+        compile_rpath="$flag"
-+
-+        flag=
-+        for libdir in $finalize_rpath; do
-+          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
-+            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag="$flag $libdir" ;;
-+          esac
-+        done
-+        finalize_rpath="$flag"
-+      fi
-+
-       for libdir in $compile_rpath $finalize_rpath; do
- 	if test -n "$hardcode_libdir_flag_spec"; then
- 	  if test -n "$hardcode_libdir_separator"; then
diff --git a/meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch
similarity index 88%
rename from meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch
index 5b5c297..a6ccfb6 100644
--- a/meta-webserver/recipes-httpd/apache2/files/configure-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/configure-allow-to-disable-selinux-support.patch
@@ -1,4 +1,4 @@
-From d23dd33e373340f6fddf11904839d1a118824401 Mon Sep 17 00:00:00 2001
+From 166cbc02f72d13d5e7bf08ac2351c0f07e1ff4b9 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Mon, 1 Dec 2014 02:08:27 -0500
 Subject: [PATCH] apache2: allow to disable selinux support
@@ -6,12 +6,13 @@ Subject: [PATCH] apache2: allow to disable selinux support
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
 ---
- configure.in |   14 ++++++++++----
+ configure.in | 14 ++++++++++----
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index df94ee5..8c3ab21 100644
+index 54dfd0d..377e062 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -466,10 +466,16 @@ getloadavg
@@ -35,6 +36,3 @@ index df94ee5..8c3ab21 100644
  
  AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
  [AC_TRY_RUN(#define _GNU_SOURCE
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
index 18e4107..ae4ff0c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
@@ -1,15 +1,25 @@
+From 55ebb07cc57854cbfb372c3a688365039b809bc8 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 17 Jul 2012 11:27:39 +0100
+Subject: [PATCH] apache2: add from OE-Classic, update to version 2.4.2 and fix
 
 Bump up the core size limit if CoreDumpDirectory is
 configured.
 
-Upstream-Status: Pending 
+Upstream-Status: Pending
 
 Note: upstreaming was discussed but there are competing desires;
 	there are portability oddities here too.
 
---- httpd-2.4.1/server/core.c.corelimit
-+++ httpd-2.4.1/server/core.c
-@@ -4433,6 +4433,25 @@ static int core_post_config(apr_pool_t *
+---
+ server/core.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/server/core.c b/server/core.c
+index 4af0816..4fd2b9f 100644
+--- a/server/core.c
++++ b/server/core.c
+@@ -4940,6 +4940,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
      apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
                                apr_pool_cleanup_null);
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
index 873328d..015034c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
@@ -1,3 +1,7 @@
+From 33c0f2d88ccfe02777f183eb785bb2b891aff168 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 17 Jul 2012 11:27:39 +0100
+Subject: [PATCH] Log the SELinux context at startup.
 
 Log the SELinux context at startup.
 
@@ -5,9 +9,16 @@ Upstream-Status: Inappropriate [other]
 
 Note: unlikely to be any interest in this upstream
 
---- httpd-2.4.1/configure.in.selinux
-+++ httpd-2.4.1/configure.in
-@@ -458,6 +458,11 @@ fopen64
+---
+ configure.in  |  5 +++++
+ server/core.c | 26 ++++++++++++++++++++++++++
+ 2 files changed, 31 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 761e836..d828512 100644
+--- a/configure.in
++++ b/configure.in
+@@ -483,6 +483,11 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -19,9 +30,11 @@ Note: unlikely to be any interest in this upstream
  AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
---- httpd-2.4.1/server/core.c.selinux
-+++ httpd-2.4.1/server/core.c
-@@ -58,6 +58,10 @@
+diff --git a/server/core.c b/server/core.c
+index 4fd2b9f..c61304a 100644
+--- a/server/core.c
++++ b/server/core.c
+@@ -59,6 +59,10 @@
  #include <unistd.h>
  #endif
  
@@ -32,7 +45,7 @@ Note: unlikely to be any interest in this upstream
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
-@@ -4452,6 +4456,28 @@ static int core_post_config(apr_pool_t *
+@@ -4959,6 +4963,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
diff --git a/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch
similarity index 59%
rename from meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch
index b948753..2262e9f 100644
--- a/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.3-fix-race-issue-of-dir-install.patch
@@ -1,3 +1,8 @@
+From 3b079a9df7582e305246fd805837d87a2c4ef534 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Fri, 25 Jan 2013 18:10:50 +0800
+Subject: [PATCH] apache2: fix the race issue of parallel installation
+
 Upstream-Status: Pending
 
 fix following race issue when do parallel install
@@ -7,10 +12,17 @@ fix following race issue when do parallel install
 | make[1]: *** [install-man] Error 1
 | make[1]: *** Waiting for unfinished jobs....
 
--Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---- httpd-2.4.3/build/mkdir.sh.orig	2013-01-25 03:47:21.565255420 -0600
-+++ httpd-2.4.3/build/mkdir.sh	2013-01-25 03:46:17.833051230 -0600
-@@ -39,7 +39,7 @@
+Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+
+---
+ build/mkdir.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/mkdir.sh b/build/mkdir.sh
+index e2d5bb6..dde5ae0 100755
+--- a/build/mkdir.sh
++++ b/build/mkdir.sh
+@@ -39,7 +39,7 @@ for file in ${1+"$@"} ; do
          esac
          if test ! -d "$pathcomp"; then
              echo "mkdir $pathcomp" 1>&2
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
index afbed8e..843226c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
@@ -1,19 +1,27 @@
+From a5627edbcc88cd50caaa42ca051ac7ed3d870172 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 17 Jul 2012 11:27:39 +0100
+Subject: [PATCH] apache2: add from OE-Classic, update to version 2.4.2 and fix
 
 There is no need to "suck in" the apr/apr-util symbols when using
 a shared libapr{,util}, it just bloats the symbol table; so don't.
 
-Upstream-HEAD: needed
-Upstream-2.0: omit
 Upstream-Status: Pending
 
 Note: EXPORT_DIRS change is conditional on using shared apr
 
---- httpd-2.4.4/server/Makefile.in.export
-+++ httpd-2.4.4/server/Makefile.in
-@@ -57,9 +57,6 @@ export_files:
- 	( for dir in $(EXPORT_DIRS); do \
+---
+ server/Makefile.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/server/Makefile.in b/server/Makefile.in
+index cb11684..0d48924 100644
+--- a/server/Makefile.in
++++ b/server/Makefile.in
+@@ -60,9 +60,6 @@ export_files:
  	      ls $$dir/*.h ; \
  	  done; \
+ 	  echo "$(top_srcdir)/server/mpm_fdqueue.h"; \
 -	  for dir in $(EXPORT_DIRS_APR); do \
 -	      ls $$dir/ap[ru].h $$dir/ap[ru]_*.h 2>/dev/null; \
 -	  done; \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
index e4e01b2..020f1d7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
@@ -1,4 +1,4 @@
-From 760ccbb2fb046621a2aeaecabb2b1ef9aa280cf1 Mon Sep 17 00:00:00 2001
+From 94a9e2241ea27e75babbfdeb38043b13049e23b0 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 1 Sep 2011 01:03:14 +0800
 Subject: [PATCH] replace lynx to curl in apachectl script
@@ -6,14 +6,15 @@ Subject: [PATCH] replace lynx to curl in apachectl script
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
+
 ---
- support/apachectl.in |   14 ++++++++++----
- 1 files changed, 10 insertions(+), 4 deletions(-)
+ support/apachectl.in | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
 
-Index: httpd-2.4.29/support/apachectl.in
-===================================================================
---- httpd-2.4.29.orig/support/apachectl.in
-+++ httpd-2.4.29/support/apachectl.in
+diff --git a/support/apachectl.in b/support/apachectl.in
+index 3281c2e..6ab4ba5 100644
+--- a/support/apachectl.in
++++ b/support/apachectl.in
 @@ -52,11 +52,11 @@ fi
  # a command that outputs a formatted text version of the HTML at the
  # url given on the command line.  Designed for lynx, however other
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch b/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
index f1349cb..5476d4f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
@@ -1,6 +1,18 @@
---- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000 -0500
-+++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000 -0500
-@@ -27,7 +27,7 @@
+From aa02bbfd8f16871db5563a95fa94dd170964949f Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 17 Jul 2012 11:27:39 +0100
+
+Upstream-Status: Inappropriate [embedded specific]
+
+---
+ server/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/Makefile.in b/server/Makefile.in
+index 1fa3344..cb11684 100644
+--- a/server/Makefile.in
++++ b/server/Makefile.in
+@@ -29,7 +29,7 @@ gen_test_char: $(gen_test_char_OBJECTS)
  	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
  
  test_char.h: gen_test_char
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
index b08e037..696378e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.33.bb
@@ -13,7 +13,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.1-selinux.patch \
            file://apache-configure_perlbin.patch \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
-           file://apache-ssl-ltmain-rpath.patch \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
            file://configure-allow-to-disable-selinux-support.patch \
@@ -23,9 +22,9 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://volatiles.04_apache2 \
           "
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a62b0c7623826ff99766ff13fb9007f8"
-SRC_URI[md5sum] = "0c599404ef6b69eee95bcd9fcd094407"
-SRC_URI[sha256sum] = "777753a5a25568a2a27428b2214980564bc1c38c1abf9ccc7630b639991f7f00"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
+SRC_URI[md5sum] = "6ef469d3f16fffeb688bc6e0346823e5"
+SRC_URI[sha256sum] = "de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


