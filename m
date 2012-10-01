Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIiqi-000383-By
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 18:28:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 09:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="229137559"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 09:15:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:14:56 +0100
Message-Id: <60be4ac5f9bf61689e2fff7b2198cc538ea652dc.1349107616.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 4/6] apache2: update to version 2.4.2 and fix
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
X-List-Received-Date: Mon, 01 Oct 2012 16:28:05 -0000

* Enable threading for PHP
* Backport a number of patches
* Use apachectl in init script
* Install modules into a sane location
* Ensure apxs script is installed into sysroot in crossscripts directory
  and modified so that it works for building PHP
* Install httpd executable for native version so that PHP configure
  script can call it
* Rename server-makefile-patch to server-makefile.patch and drop
  apply=yes
* Add LIC_FILES_CHKSUM
* Fix packaging QA warnings
* Clean out some cruft

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../apache2-2.4.2/apache-configure_perlbin.patch   |   37 +++
 .../apache2-2.4.2/apache-ssl-ltmain-rpath.patch    |   76 +++++
 .../apache2/apache2-2.4.2/fix-libtool-name.patch   |   55 +++
 .../apache2-2.4.2/httpd-2.4.1-corelimit.patch      |   37 +++
 .../apache2/apache2-2.4.2/httpd-2.4.1-export.patch |   22 ++
 .../apache2-2.4.2/httpd-2.4.1-selinux.patch        |   63 ++++
 .../apache2-2.4.2/httpd-2.4.2-r1326980+.patch      |   74 +++++
 .../apache2-2.4.2/httpd-2.4.2-r1327036+.patch      |   87 +++++
 .../apache2-2.4.2/httpd-2.4.2-r1332643.patch       |  260 +++++++++++++++
 .../apache2-2.4.2/httpd-2.4.2-r1337344+.patch      |  350 ++++++++++++++++++++
 .../apache2-2.4.2/httpd-2.4.2-restart.patch        |   35 ++
 .../replace-lynx-to-curl-in-apachectl-script.patch |   52 +++
 .../server-makefile.patch}                         |    0
 .../recipes-httpd/apache2/apache2-native_2.2.17.bb |   44 ---
 .../recipes-httpd/apache2/apache2-native_2.4.2.bb  |   43 +++
 .../{apache2_2.2.17.bb => apache2_2.4.2.bb}        |   85 ++---
 meta-webserver/recipes-httpd/apache2/files/init    |   17 +-
 17 files changed, 1244 insertions(+), 93 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure_perlbin.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmain-rpath.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-corelimit.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-export.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-selinux.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1326980+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1327036+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1332643.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1337344+.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-restart.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.2.17/server-makefile-patch => apache2-2.4.2/server-makefile.patch} (100%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.2.17.bb => apache2_2.4.2.bb} (50%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure_perlbin.patch
new file mode 100644
index 0000000..baa739f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure_perlbin.patch
@@ -0,0 +1,37 @@
+# Author: echo <fei.geng@windriver.com>
+# Date: April 28 2009
+# Summary:Fix perl install directory to /usr/bin
+#
+# Upstream-Status: Inappropriate [configuration]
+
+--- a/configure
++++ b/configure
+@@ -22365,13 +22365,7 @@
+ #define APACHE_MPM_DIR "$MPM_DIR"
+ _ACEOF
+
+-
+-perlbin=`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" = "x"; then
+-    perlbin="/replace/with/path/to/perl/interpreter"
+-fi
+-
+-
++perlbin='/usr/bin/perl'
+
+ BSD_MAKEFILE=no
+ ap_make_include=include
+--- a/configure.in
++++ b/configure.in
+@@ -638,10 +638,7 @@
+ AC_DEFINE_UNQUOTED(APACHE_MPM_DIR, "$MPM_DIR",
+ 	[Location of the source for the current MPM])
+ 
+-perlbin=`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" = "x"; then
+-    perlbin="/replace/with/path/to/perl/interpreter"
+-fi
++perlbin='/usr/bin/perl'
+ AC_SUBST(perlbin)
+ 
+ dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmain-rpath.patch
new file mode 100644
index 0000000..3a59fb0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmain-rpath.patch
@@ -0,0 +1,76 @@
+--- httpd-2.2.8.orig/build/ltmain.sh
++++ httpd-2.2.8/build/ltmain.sh
+@@ -1515,7 +1515,7 @@ EOF
+ 	dir=`$echo "X$arg" | $Xsed -e 's/^-L//'`
+ 	# We need an absolute path.
+ 	case $dir in
+-	[\\/]* | [A-Za-z]:[\\/]*) ;;
++	=* | [\\/]* | [A-Za-z]:[\\/]*) ;;
+ 	*)
+ 	  absdir=`cd "$dir" && pwd`
+ 	  if test -z "$absdir"; then
+@@ -2558,7 +2558,7 @@ EOF
+ 	    $echo "*** $linklib is not portable!"
+ 	  fi
+ 	  if test "$linkmode" = lib &&
+-	     test "$hardcode_into_libs" = yes; then
++             test "x$wrs_use_rpaths" = "xyes" && test "$hardcode_into_libs" = yes; then
+ 	    # Hardcode the library path.
+ 	    # Skip directories that are in the system default run-time
+ 	    # search path.
+@@ -2832,7 +2832,7 @@ EOF
+ 
+ 	if test "$linkmode" = lib; then
+ 	  if test -n "$dependency_libs" &&
+-	     { test "$hardcode_into_libs" != yes ||
++             { test "$hardcode_into_libs" != yes || test "x$wrs_use_rpaths" != "xyes" ||
+ 	       test "$build_old_libs" = yes ||
+ 	       test "$link_static" = yes; }; then
+ 	    # Extract -R from dependency_libs
+@@ -3426,7 +3426,8 @@ EOF
+ 	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+ 	  esac
+ 	done
+-	if test "$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
++        if test "$hardcode_into_libs" != yes || test "x$wrs_use_rpaths" != "xyes" ||
++           test "$build_old_libs" = yes; then
+ 	  dependency_libs="$temp_xrpath $dependency_libs"
+ 	fi
+       fi
+@@ -3843,7 +3844,7 @@ EOF
+         case $archive_cmds in
+           *\$LD\ *) wl= ;;
+         esac
+-	if test "$hardcode_into_libs" = yes; then
++        if test "$hardcode_into_libs" = yes && test "x$wrs_use_rpaths" = "xyes" ; then
+ 	  # Hardcode the library paths
+ 	  hardcode_libdirs=
+ 	  dep_rpath=
+@@ -4397,6 +4398,27 @@ EOF
+       # Now hardcode the library paths
+       rpath=
+       hardcode_libdirs=
++
++      # short circuit putting rpaths in executables
++      #
++      if test "x$wrs_use_rpaths" != "xyes" ; then
++        flag=
++        for libdir in $compile_rpath; do
++          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
++            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag="$flag $libdir" ;;
++          esac
++        done
++        compile_rpath="$flag"
++
++        flag=
++        for libdir in $finalize_rpath; do
++          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
++            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag="$flag $libdir" ;;
++          esac
++        done
++        finalize_rpath="$flag"
++      fi
++
+       for libdir in $compile_rpath $finalize_rpath; do
+ 	if test -n "$hardcode_libdir_flag_spec"; then
+ 	  if test -n "$hardcode_libdir_separator"; then
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name.patch
new file mode 100644
index 0000000..027af04
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name.patch
@@ -0,0 +1,55 @@
+Fix build scripts to use correct libtool filename
+
+Upstream-Status: Inappropriate [configuration]
+
+---
+ httpd-2.4.2/build/config_vars.sh.in |    2 +-
+ httpd-2.4.2/configure               |    2 +-
+ httpd-2.4.2/configure.in            |    2 +-
+ httpd-2.4.2/support/apxs.in         |    2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+--- a/build/config_vars.sh.in
++++ b/build/config_vars.sh.in
+@@ -35,7 +35,7 @@ else
+    APU_CONFIG=@APU_CONFIG@
+ fi
+ 
+-APR_LIBTOOL="`${APR_CONFIG} --apr-libtool`"
++APR_LIBTOOL="`${APR_CONFIG} --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`"
+ APR_INCLUDEDIR="`${APR_CONFIG} --includedir`"
+ test -n "@APU_CONFIG@" && APU_INCLUDEDIR="`${APU_CONFIG} --includedir`"
+ 
+--- a/configure
++++ b/configure
+@@ -6205,7 +6205,7 @@ case $host in
+       if test "x$LTFLAGS" = "x"; then
+           LTFLAGS='--silent'
+       fi
+-      my_libtool=`$apr_config --apr-libtool`
++      my_libtool=`$apr_config --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`
+       LIBTOOL="$my_libtool \$(LTFLAGS)"
+       libtoolversion=`$my_libtool --version`
+       case $libtoolversion in
+--- a/configure.in
++++ b/configure.in
+@@ -264,7 +264,7 @@ case $host in
+       if test "x$LTFLAGS" = "x"; then
+           LTFLAGS='--silent'
+       fi
+-      my_libtool=`$apr_config --apr-libtool`
++      my_libtool=`$apr_config --apr-libtool | sed -e s,libtool,${host_alias}-libtool,`
+       LIBTOOL="$my_libtool \$(LTFLAGS)"
+       libtoolversion=`$my_libtool --version`
+       case $libtoolversion in
+--- a/support/apxs.in
++++ b/support/apxs.in
+@@ -352,7 +352,7 @@ if ($apr_major_version < 2) {
+     }
+ }
+ 
+-my $libtool = `$apr_config --apr-libtool`;
++my $libtool = `$apr_config --apr-libtool| sed -e s,libtool,${host_alias}-libtool,`;
+ chomp($libtool);
+ 
+ my $apr_includedir = `$apr_config --includes`;
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-corelimit.patch
new file mode 100644
index 0000000..18e4107
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-corelimit.patch
@@ -0,0 +1,37 @@
+
+Bump up the core size limit if CoreDumpDirectory is
+configured.
+
+Upstream-Status: Pending 
+
+Note: upstreaming was discussed but there are competing desires;
+	there are portability oddities here too.
+
+--- httpd-2.4.1/server/core.c.corelimit
++++ httpd-2.4.1/server/core.c
+@@ -4433,6 +4433,25 @@ static int core_post_config(apr_pool_t *
+     }
+     apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
+                               apr_pool_cleanup_null);
++
++#ifdef RLIMIT_CORE
++    if (ap_coredumpdir_configured) {
++        struct rlimit lim;
++
++        if (getrlimit(RLIMIT_CORE, &lim) == 0 && lim.rlim_cur == 0) {
++            lim.rlim_cur = lim.rlim_max;
++            if (setrlimit(RLIMIT_CORE, &lim) == 0) {
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
++                             "core dump file size limit raised to %lu bytes",
++                             lim.rlim_cur);
++            } else {
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, errno, NULL,
++                             "core dump file size is zero, setrlimit failed");
++            }
++        }
++    }
++#endif
++
+     return OK;
+ }
+ 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-export.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-export.patch
new file mode 100644
index 0000000..ed629bf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-export.patch
@@ -0,0 +1,22 @@
+
+There is no need to "suck in" the apr/apr-util symbols when using
+a shared libapr{,util}, it just bloats the symbol table; so don't.
+
+Upstream-HEAD: needed
+Upstream-2.0: omit
+Upstream-Status: Pending
+
+Note: EXPORT_DIRS change is conditional on using shared apr
+
+--- httpd-2.4.1/server/Makefile.in.export
++++ httpd-2.4.1/server/Makefile.in
+@@ -57,9 +57,6 @@ export_files:
+ 	( for dir in $(EXPORT_DIRS); do \
+ 	      ls $$dir/*.h ; \
+ 	  done; \
+-	  for dir in $(EXPORT_DIRS_APR); do \
+-	      ls $$dir/ap[ru].h $$dir/ap[ru]_*.h 2>/dev/null; \
+-	  done; \
+ 	) | sort -u > $@
+ 
+ exports.c: export_files
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-selinux.patch
new file mode 100644
index 0000000..873328d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-selinux.patch
@@ -0,0 +1,63 @@
+
+Log the SELinux context at startup.
+
+Upstream-Status: Inappropriate [other]
+
+Note: unlikely to be any interest in this upstream
+
+--- httpd-2.4.1/configure.in.selinux
++++ httpd-2.4.1/configure.in
+@@ -458,6 +458,11 @@ fopen64
+ dnl confirm that a void pointer is large enough to store a long integer
+ APACHE_CHECK_VOID_PTR_LEN
+ 
++AC_CHECK_LIB(selinux, is_selinux_enabled, [
++   AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
++   APR_ADDTO(AP_LIBS, [-lselinux])
++])
++
+ AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
+ [AC_TRY_RUN(#define _GNU_SOURCE
+ #include <unistd.h>
+--- httpd-2.4.1/server/core.c.selinux
++++ httpd-2.4.1/server/core.c
+@@ -58,6 +58,10 @@
+ #include <unistd.h>
+ #endif
+ 
++#ifdef HAVE_SELINUX
++#include <selinux/selinux.h>
++#endif
++
+ /* LimitRequestBody handling */
+ #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
+ #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
+@@ -4452,6 +4456,28 @@ static int core_post_config(apr_pool_t *
+     }
+ #endif
+ 
++#ifdef HAVE_SELINUX
++    {
++        static int already_warned = 0;
++        int is_enabled = is_selinux_enabled() > 0;
++        
++        if (is_enabled && !already_warned) {
++            security_context_t con;
++            
++            if (getcon(&con) == 0) {
++                
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
++                             "SELinux policy enabled; "
++                             "httpd running as context %s", con);
++                
++                already_warned = 1;
++                
++                freecon(con);
++            }
++        }
++    }
++#endif
++
+     return OK;
+ }
+ 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1326980+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1326980+.patch
new file mode 100644
index 0000000..98b226b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1326980+.patch
@@ -0,0 +1,74 @@
+
+* modules/loggers/mod_log_debug.c: Mark private globals as static.
+http://svn.apache.org/viewvc?view=revision&revision=1326980
+
+* modules/filters/sed1.c: Mark private globals as static const.
+  (command): Change p3 pointer to const. 
+http://svn.apache.org/viewvc?view=revision&revision=1326984
+
+* modules/filters/config.m4: Prevent libsed internals from polluting
+  the global symbol namespace.
+http://svn.apache.org/viewvc?view=revision&revision=1326991
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/modules/loggers/mod_log_debug.c
++++ httpd-2.4.2/modules/loggers/mod_log_debug.c
+@@ -35,8 +35,8 @@
+     apr_array_header_t *entries;
+ } log_debug_dirconf;
+ 
+-const char *allhooks = "all";
+-const char * const hooks[] = {
++static const char *allhooks = "all";
++static const char * const hooks[] = {
+     "log_transaction",      /*  0 */
+     "quick_handler",        /*  1 */
+     "handler",              /*  2 */
+--- httpd-2.4.2/modules/filters/sed1.c
++++ httpd-2.4.2/modules/filters/sed1.c
+@@ -25,7 +25,7 @@
+ #include "apr_strings.h"
+ #include "regexp.h"
+ 
+-char    *trans[040]  = {
++static const char *const trans[040]  = {
+     "\\01",
+     "\\02",
+     "\\03",
+@@ -58,7 +58,7 @@
+     "\\36",
+     "\\37"
+ };
+-char rub[] = {"\\177"};
++static const char rub[] = {"\\177"};
+ 
+ extern int sed_step(char *p1, char *p2, int circf, step_vars_storage *vars);
+ static int substitute(sed_eval_t *eval, sed_reptr_t *ipc,
+@@ -692,7 +692,8 @@
+                             step_vars_storage *step_vars)
+ {
+     int    i;
+-    char   *p1, *p2, *p3;
++    char   *p1, *p2;
++    const char *p3;
+     int length;
+     char sz[32]; /* 32 bytes enough to store 64 bit integer in decimal */
+     apr_status_t rv = APR_SUCCESS;
+--- httpd-2.4.2/modules/filters/config.m4
++++ httpd-2.4.2/modules/filters/config.m4
+@@ -16,7 +16,13 @@
+ APACHE_MODULE(substitute, response content rewrite-like filtering, , , most)
+ 
+ sed_obj="mod_sed.lo sed0.lo sed1.lo regexp.lo"
+-APACHE_MODULE(sed, filter request and/or response bodies through sed, $sed_obj, , most)
++APACHE_MODULE(sed, filter request and/or response bodies through sed, $sed_obj, , most, [
++    if test "x$enable_sed" = "xshared"; then
++        # The only symbol which needs to be exported is the module
++        # structure, so ask libtool to hide libsed internals:
++        APR_ADDTO(MOD_SED_LDADD, [-export-symbols-regex sed_module])
++    fi
++])
+ 
+ if test "$ac_cv_ebcdic" = "yes"; then
+ # mod_charset_lite can be very useful on an ebcdic system,
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1327036+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1327036+.patch
new file mode 100644
index 0000000..57b5155
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1327036+.patch
@@ -0,0 +1,87 @@
+
+* server/mpm_unix.c (dummy_connection): Use a TLS 1.0 close_notify
+  alert if the chosen listener is configured for https; not perfect
+  but better than sending an HTTP request.  Adjust comments.
+http://svn.apache.org/viewvc?view=revision&revision=1327036
+
+* server/mpm_unix.c (dummy_connection): Fix spello.
+http://svn.apache.org/viewvc?view=revision&revision=1327080
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/server/mpm_unix.c
++++ httpd-2.4.2/server/mpm_unix.c
+@@ -501,14 +501,14 @@
+     return rv;
+ }
+ 
+-/* This function connects to the server, then immediately closes the connection.
+- * This permits the MPM to skip the poll when there is only one listening
+- * socket, because it provides a alternate way to unblock an accept() when
+- * the pod is used.
+- */
++/* This function connects to the server and sends enough data to
++ * ensure the child wakes up and processes a new connection.  This
++ * permits the MPM to skip the poll when there is only one listening
++ * socket, because it provides a alternate way to unblock an accept()
++ * when the pod is used.  */
+ static apr_status_t dummy_connection(ap_pod_t *pod)
+ {
+-    char *srequest;
++    const char *data;
+     apr_status_t rv;
+     apr_socket_t *sock;
+     apr_pool_t *p;
+@@ -574,24 +574,37 @@
+         return rv;
+     }
+ 
+-    /* Create the request string. We include a User-Agent so that
+-     * adminstrators can track down the cause of the odd-looking
+-     * requests in their logs.
+-     */
+-    srequest = apr_pstrcat(p, "OPTIONS * HTTP/1.0\r\nUser-Agent: ",
++    if (lp->protocol && strcasecmp(lp->protocol, "https") == 0) {
++        /* Send a TLS 1.0 close_notify alert.  This is perhaps the
++         * "least wrong" way to open and cleanly terminate an SSL
++         * connection.  It should "work" without noisy error logs if
++         * the server actually expects SSLv3/TLSv1.  With
++         * SSLv23_server_method() OpenSSL's SSL_accept() fails
++         * ungracefully on receipt of this message, since it requires
++         * an 11-byte ClientHello message and this is too short. */
++        static const unsigned char tls10_close_notify[7] = {
++            '\x15',         /* TLSPlainText.type = Alert (21) */
++            '\x03', '\x01', /* TLSPlainText.version = {3, 1} */
++            '\x00', '\x02', /* TLSPlainText.length = 2 */
++            '\x01',         /* Alert.level = warning (1) */
++            '\x00'          /* Alert.description = close_notify (0) */
++        };
++        data = (const char *)tls10_close_notify;
++        len = sizeof(tls10_close_notify);
++    }
++    else /* ... XXX other request types here? */ {
++        /* Create an HTTP request string.  We include a User-Agent so
++         * that adminstrators can track down the cause of the
++         * odd-looking requests in their logs.  A complete request is
++         * used since kernel-level filtering may require that much
++         * data before returning from accept(). */
++        data = apr_pstrcat(p, "OPTIONS * HTTP/1.0\r\nUser-Agent: ",
+                            ap_get_server_description(),
+                            " (internal dummy connection)\r\n\r\n", NULL);
++        len = strlen(data);
++    }
+ 
+-    /* Since some operating systems support buffering of data or entire
+-     * requests in the kernel, we send a simple request, to make sure
+-     * the server pops out of a blocking accept().
+-     */
+-    /* XXX: This is HTTP specific. We should look at the Protocol for each
+-     * listener, and send the correct type of request to trigger any Accept
+-     * Filters.
+-     */
+-    len = strlen(srequest);
+-    apr_socket_send(sock, srequest, &len);
++    apr_socket_send(sock, data, &len);
+     apr_socket_close(sock);
+     apr_pool_destroy(p);
+ 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1332643.patch
new file mode 100644
index 0000000..16fd7d7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1332643.patch
@@ -0,0 +1,260 @@
+Add support for TLS Next Protocol Negotiation:
+
+* modules/ssl/mod_ssl.c, modules/ssl/mod_ssl.h: Add and implement new
+  hooks for next protocol advertisement/discovery.
+
+* modules/ssl/ssl_engine_init.c (ssl_init_ctx_callbacks): Enable
+  NPN advertisement callback in handshake.
+
+* modules/ssl/ssl_engine_io.c (ssl_io_filter_input): Invoke
+  next-protocol discovery hook.
+
+* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos): 
+  New callback.
+
+* modules/ssl/ssl_private.h: Add prototype.
+
+Submitted by: Matthew Steele <mdsteele google.com>
+  with slight tweaks by jorton
+
+https://bugzilla.redhat.com//show_bug.cgi?id=809599
+
+http://svn.apache.org/viewvc?view=revision&revision=1332643
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/modules/ssl/ssl_private.h
++++ httpd-2.4.2/modules/ssl/ssl_private.h
+@@ -139,6 +139,11 @@
+ #define HAVE_FIPS
+ #endif
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10001000L && !defined(OPENSSL_NO_NEXTPROTONEG) \
++    && !defined(OPENSSL_NO_TLSEXT)
++#define HAVE_TLS_NPN
++#endif
++
+ #if (OPENSSL_VERSION_NUMBER >= 0x10000000)
+ #define MODSSL_SSL_CIPHER_CONST const
+ #define MODSSL_SSL_METHOD_CONST const
+@@ -811,6 +816,7 @@
+ int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned char *,
+                                        EVP_CIPHER_CTX *, HMAC_CTX *, int);
+ #endif
++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data, unsigned int *len, void *arg);
+ 
+ /**  Session Cache Support  */
+ void         ssl_scache_init(server_rec *, apr_pool_t *);
+--- httpd-2.4.2/modules/ssl/mod_ssl.c
++++ httpd-2.4.2/modules/ssl/mod_ssl.c
+@@ -260,6 +260,18 @@
+     AP_END_CMD
+ };
+ 
++/* Implement 'modssl_run_npn_advertise_protos_hook'. */
++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
++    modssl, AP, int, npn_advertise_protos_hook,
++    (conn_rec *connection, apr_array_header_t *protos),
++    (connection, protos), OK, DECLINED);
++
++/* Implement 'modssl_run_npn_proto_negotiated_hook'. */
++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
++    modssl, AP, int, npn_proto_negotiated_hook,
++    (conn_rec *connection, const char *proto_name, apr_size_t proto_name_len),
++    (connection, proto_name, proto_name_len), OK, DECLINED);
++
+ /*
+  *  the various processing hooks
+  */
+--- httpd-2.4.2/modules/ssl/mod_ssl.h
++++ httpd-2.4.2/modules/ssl/mod_ssl.h
+@@ -63,5 +63,26 @@
+ 
+ APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
+ 
++/** The npn_advertise_protos optional hook allows other modules to add entries
++ * to the list of protocol names advertised by the server during the Next
++ * Protocol Negotiation (NPN) portion of the SSL handshake.  The hook callee is
++ * given the connection and an APR array; it should push one or more char*'s
++ * pointing to null-terminated strings (such as "http/1.1" or "spdy/2") onto
++ * the array and return OK, or do nothing and return DECLINED. */
++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_advertise_protos_hook,
++                          (conn_rec *connection, apr_array_header_t *protos));
++
++/** The npn_proto_negotiated optional hook allows other modules to discover the
++ * name of the protocol that was chosen during the Next Protocol Negotiation
++ * (NPN) portion of the SSL handshake.  Note that this may be the empty string
++ * (in which case modules should probably assume HTTP), or it may be a protocol
++ * that was never even advertised by the server.  The hook callee is given the
++ * connection, a non-null-terminated string containing the protocol name, and
++ * the length of the string; it should do something appropriate (i.e. insert or
++ * remove filters) and return OK, or do nothing and return DECLINED. */
++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_proto_negotiated_hook,
++                          (conn_rec *connection, const char *proto_name,
++                           apr_size_t proto_name_len));
++
+ #endif /* __MOD_SSL_H__ */
+ /** @} */
+--- httpd-2.4.2/modules/ssl/ssl_engine_init.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_init.c
+@@ -681,6 +681,11 @@
+ #endif
+ 
+     SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
++
++#ifdef HAVE_TLS_NPN
++    SSL_CTX_set_next_protos_advertised_cb(
++        ctx, ssl_callback_AdvertiseNextProtos, NULL);
++#endif
+ }
+ 
+ static void ssl_init_ctx_verify(server_rec *s,
+--- httpd-2.4.2/modules/ssl/ssl_engine_io.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_io.c
+@@ -28,6 +28,7 @@
+                                   core keeps dumping.''
+                                             -- Unknown    */
+ #include "ssl_private.h"
++#include "mod_ssl.h"
+ #include "apr_date.h"
+ 
+ /*  _________________________________________________________________
+@@ -297,6 +298,7 @@
+     apr_pool_t *pool;
+     char buffer[AP_IOBUFSIZE];
+     ssl_filter_ctx_t *filter_ctx;
++    int npn_finished;  /* 1 if NPN has finished, 0 otherwise */
+ } bio_filter_in_ctx_t;
+ 
+ /*
+@@ -1374,6 +1376,27 @@
+         APR_BRIGADE_INSERT_TAIL(bb, bucket);
+     }
+ 
++#ifdef HAVE_TLS_NPN
++    /* By this point, Next Protocol Negotiation (NPN) should be completed (if
++     * our version of OpenSSL supports it).  If we haven't already, find out
++     * which protocol was decided upon and inform other modules by calling
++     * npn_proto_negotiated_hook. */
++    if (!inctx->npn_finished) {
++        const unsigned char *next_proto = NULL;
++        unsigned next_proto_len = 0;
++
++        SSL_get0_next_proto_negotiated(
++            inctx->ssl, &next_proto, &next_proto_len);
++        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, APR_SUCCESS, f->c,
++                      "SSL NPN negotiated protocol: '%s'",
++                      apr_pstrmemdup(f->c->pool, (const char*)next_proto,
++                                     next_proto_len));
++        modssl_run_npn_proto_negotiated_hook(
++            f->c, (const char*)next_proto, next_proto_len);
++        inctx->npn_finished = 1;
++    }
++#endif
++
+     return APR_SUCCESS;
+ }
+ 
+@@ -1855,6 +1878,7 @@
+     inctx->block = APR_BLOCK_READ;
+     inctx->pool = c->pool;
+     inctx->filter_ctx = filter_ctx;
++    inctx->npn_finished = 0;
+ }
+ 
+ /* The request_rec pointer is passed in here only to ensure that the
+--- httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
+@@ -29,6 +29,7 @@
+                                   time I was too famous.''
+                                             -- Unknown                */
+ #include "ssl_private.h"
++#include "mod_ssl.h"
+ #include "util_md5.h"
+ 
+ static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
+@@ -2143,3 +2144,84 @@
+     return -1;
+ }
+ #endif
++
++#ifdef HAVE_TLS_NPN
++/*
++ * This callback function is executed when SSL needs to decide what protocols
++ * to advertise during Next Protocol Negotiation (NPN).  It must produce a
++ * string in wire format -- a sequence of length-prefixed strings -- indicating
++ * the advertised protocols.  Refer to SSL_CTX_set_next_protos_advertised_cb
++ * in OpenSSL for reference.
++ */
++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data_out,
++                                     unsigned int *size_out, void *arg)
++{
++    conn_rec *c = (conn_rec*)SSL_get_app_data(ssl);
++    apr_array_header_t *protos;
++    int num_protos;
++    unsigned int size;
++    int i;
++    unsigned char *data;
++    unsigned char *start;
++
++    *data_out = NULL;
++    *size_out = 0;
++
++    /* If the connection object is not available, then there's nothing for us
++     * to do. */
++    if (c == NULL) {
++        return SSL_TLSEXT_ERR_OK;
++    }
++
++    /* Invoke our npn_advertise_protos hook, giving other modules a chance to
++     * add alternate protocol names to advertise. */
++    protos = apr_array_make(c->pool, 0, sizeof(char*));
++    modssl_run_npn_advertise_protos_hook(c, protos);
++    num_protos = protos->nelts;
++
++    /* We now have a list of null-terminated strings; we need to concatenate
++     * them together into a single string, where each protocol name is prefixed
++     * by its length.  First, calculate how long that string will be. */
++    size = 0;
++    for (i = 0; i < num_protos; ++i) {
++        const char *string = APR_ARRAY_IDX(protos, i, const char*);
++        unsigned int length = strlen(string);
++        /* If the protocol name is too long (the length must fit in one byte),
++         * then log an error and skip it. */
++        if (length > 255) {
++            ap_log_cerror(APLOG_MARK, APLOG_ERR, 0, c,
++                          "SSL NPN protocol name too long (length=%u): %s",
++                          length, string);
++            continue;
++        }
++        /* Leave room for the length prefix (one byte) plus the protocol name
++         * itself. */
++        size += 1 + length;
++    }
++
++    /* If there is nothing to advertise (either because no modules added
++     * anything to the protos array, or because all strings added to the array
++     * were skipped), then we're done. */
++    if (size == 0) {
++        return SSL_TLSEXT_ERR_OK;
++    }
++
++    /* Now we can build the string.  Copy each protocol name string into the
++     * larger string, prefixed by its length. */
++    data = apr_palloc(c->pool, size * sizeof(unsigned char));
++    start = data;
++    for (i = 0; i < num_protos; ++i) {
++        const char *string = APR_ARRAY_IDX(protos, i, const char*);
++        apr_size_t length = strlen(string);
++        *start = (unsigned char)length;
++        ++start;
++        memcpy(start, string, length * sizeof(unsigned char));
++        start += length;
++    }
++
++    /* Success. */
++    *data_out = data;
++    *size_out = size;
++    return SSL_TLSEXT_ERR_OK;
++}
++#endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1337344+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1337344+.patch
new file mode 100644
index 0000000..646976a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r1337344+.patch
@@ -0,0 +1,350 @@
+
+* support/suexec.c: Add gcc format-string attributes to logging
+  functions.  
+  (main): Always print uid/gid as unsigned long, and cast to avoid
+  warnings (which somewhat defeats the point of the format string
+  attrs, but is necessary since the size of gid/uid varies).
+http://svn.apache.org/viewvc?view=revision&revision=1337344
+
+
+
+suexec: Add support for logging to syslog as an alternative to a
+logfile.
+
+* support/suexec.c (err_output) [AP_LOG_SYSLOG]: Log to syslog.
+  (main): Close syslog fd if open, before execv.  Add -V output
+  for AP_LOG_SYSLOG.
+
+* configure.in: Add --with-suexec-syslog argument; allow
+  --without-suexec-logfile to omit definition of AP_LOG_EXEC.
+
+http://svn.apache.org/viewvc?view=revision&revision=1341905
+
+
+
+suexec: Support use of setgid/setuid capability bits on Linux, a
+weaker set of privileges than the full setuid/setgid root binary.
+
+* configure.in: Add --enable-suexec-capabilites flag.
+
+* Makefile.in: If configured, use setcap instead of chmod 7555 on
+  installed suexec binary.
+
+* modules/arch/unix/mod_unixd.c (unixd_pre_config): Drop test for
+  setuid bit if capability bits are used.
+
+* docs/manual/: Add docs.
+
+http://svn.apache.org/viewvc?view=revision&revision=1342065
+
+
+
+* docs/manual/suexec.html.en: Update for syslog logging.
+
+http://svn.apache.org/viewvc?view=revision&revision=1341930
+
+
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/configure.in.r1337344+
++++ httpd-2.4.2/configure.in
+@@ -700,7 +700,24 @@ APACHE_HELP_STRING(--with-suexec-gidmin,
+ 
+ AC_ARG_WITH(suexec-logfile,
+ APACHE_HELP_STRING(--with-suexec-logfile,Set the logfile),[
+-  AC_DEFINE_UNQUOTED(AP_LOG_EXEC, "$withval", [SuExec log file] ) ] )
++  if test "x$withval" = "xyes"; then
++    AC_DEFINE_UNQUOTED(AP_LOG_EXEC, "$withval", [SuExec log file])
++  fi
++])
++
++AC_ARG_WITH(suexec-syslog,
++APACHE_HELP_STRING(--with-suexec-syslog,Set the logfile),[
++  if test $withval = "yes"; then
++    if test "x${with_suexec_logfile}" != "xno"; then
++      AC_MSG_NOTICE([hint: use "--without-suexec-logfile --with-suexec-syslog"])
++      AC_MSG_ERROR([suexec does not support both logging to file and syslog])
++    fi
++    AC_CHECK_FUNCS([vsyslog], [], [
++       AC_MSG_ERROR([cannot support syslog from suexec without vsyslog()])])
++    AC_DEFINE(AP_LOG_SYSLOG, 1, [SuExec log to syslog])
++  fi    
++])
++
+ 
+ AC_ARG_WITH(suexec-safepath,
+ APACHE_HELP_STRING(--with-suexec-safepath,Set the safepath),[
+@@ -710,6 +727,15 @@ AC_ARG_WITH(suexec-umask,
+ APACHE_HELP_STRING(--with-suexec-umask,umask for suexec'd process),[
+   AC_DEFINE_UNQUOTED(AP_SUEXEC_UMASK, 0$withval, [umask for suexec'd process] ) ] )
+ 
++INSTALL_SUEXEC=setuid
++AC_ARG_ENABLE([suexec-capabilities], 
++APACHE_HELP_STRING(--enable-suexec-capabilities,Use Linux capability bits not setuid root suexec), [
++INSTALL_SUEXEC=caps
++AC_DEFINE(AP_SUEXEC_CAPABILITIES, 1, 
++          [Enable if suexec is installed with Linux capabilities, not setuid])
++])
++APACHE_SUBST(INSTALL_SUEXEC)
++
+ dnl APR should go after the other libs, so the right symbols can be picked up
+ if test x${apu_found} != xobsolete; then
+   AP_LIBS="$AP_LIBS `$apu_config --avoid-ldap --link-libtool`"
+--- httpd-2.4.2/docs/manual/suexec.html.en.r1337344+
++++ httpd-2.4.2/docs/manual/suexec.html.en
+@@ -369,6 +369,21 @@
+       together with the <code>--enable-suexec</code> option to let
+       APACI accept your request for using the suEXEC feature.</dd>
+ 
++      <dt><code>--enable-suexec-capabilities</code></dt>
++
++      <dd><strong>Linux specific:</strong> Normally,
++      the <code>suexec</code> binary is installed "setuid/setgid
++      root", which allows it to run with the full privileges of the
++      root user.  If this option is used, the <code>suexec</code>
++      binary will instead be installed with only the setuid/setgid
++      "capability" bits set, which is the subset of full root
++      priviliges required for suexec operation.  Note that
++      the <code>suexec</code> binary may not be able to write to a log
++      file in this mode; it is recommended that the
++      <code>--with-suexec-syslog --without-suexec-logfile</code>
++      options are used in conjunction with this mode, so that syslog
++      logging is used instead.</dd>
++
+       <dt><code>--with-suexec-bin=<em>PATH</em></code></dt>
+ 
+       <dd>The path to the <code>suexec</code> binary must be hard-coded
+@@ -430,6 +445,12 @@
+       "<code>suexec_log</code>" and located in your standard logfile
+       directory (<code>--logfiledir</code>).</dd>
+ 
++      <dt><code>--with-suexec-syslog</code></dt>
++
++      <dd>If defined, suexec will log notices and errors to syslog
++      instead of a logfile.  This option must be combined
++      with <code>--without-suexec-logfile</code>.</dd>
++
+       <dt><code>--with-suexec-safepath=<em>PATH</em></code></dt>
+ 
+       <dd>Define a safe PATH environment to pass to CGI
+@@ -546,9 +567,12 @@
+ 
+     <p>The suEXEC wrapper will write log information
+     to the file defined with the <code>--with-suexec-logfile</code>
+-    option as indicated above. If you feel you have configured and
+-    installed the wrapper properly, have a look at this log and the
+-    error_log for the server to see where you may have gone astray.</p>
++    option as indicated above, or to syslog if <code>--with-suexec-syslog</code>
++    is used. If you feel you have configured and
++    installed the wrapper properly, have a look at the log and the
++    error_log for the server to see where you may have gone astray. 
++    The output of <code>"suexec -V"</code> will show the options
++    used to compile suexec, if using a binary distribution.</p>
+ 
+ </div><div class="top"><a href="#page-header"><img alt="top" src="./images/up.gif" /></a></div>
+ <div class="section">
+@@ -615,4 +639,4 @@
+ </div><div id="footer">
+ <p class="apache">Copyright 2012 The Apache Software Foundation.<br />Licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0">Apache License, Version 2.0</a>.</p>
+ <p class="menu"><a href="./mod/">Modules</a> | <a href="./mod/directives.html">Directives</a> | <a href="./faq/">FAQ</a> | <a href="./glossary.html">Glossary</a> | <a href="./sitemap.html">Sitemap</a></p></div>
+-</body></html>
+\ No newline at end of file
++</body></html>
+--- httpd-2.4.2/Makefile.in.r1337344+
++++ httpd-2.4.2/Makefile.in
+@@ -236,11 +236,22 @@ install-man:
+ 	  cd $(DESTDIR)$(manualdir) && find . -name ".svn" -type d -print | xargs rm -rf 2>/dev/null || true; \
+ 	fi
+ 
+-install-suexec:
++install-suexec: install-suexec-binary install-suexec-$(INSTALL_SUEXEC)
++
++install-suexec-binary:
+ 	@if test -f $(builddir)/support/suexec; then \
+             test -d $(DESTDIR)$(sbindir) || $(MKINSTALLDIRS) $(DESTDIR)$(sbindir); \
+             $(INSTALL_PROGRAM) $(top_builddir)/support/suexec $(DESTDIR)$(sbindir); \
+-            chmod 4755 $(DESTDIR)$(sbindir)/suexec; \
++	fi
++
++install-suexec-setuid:
++	@if test -f $(builddir)/support/suexec; then \
++	    chmod 4755 $(DESTDIR)$(sbindir)/suexec; \
++	fi
++
++install-suexec-caps:
++	@if test -f $(builddir)/support/suexec; then \
++            setcap 'cap_setuid,cap_setgid+pe' $(DESTDIR)$(sbindir)/suexec; \
+ 	fi
+ 
+ suexec:
+--- httpd-2.4.2/modules/arch/unix/mod_unixd.c.r1337344+
++++ httpd-2.4.2/modules/arch/unix/mod_unixd.c
+@@ -284,6 +284,13 @@ unixd_set_suexec(cmd_parms *cmd, void *d
+     return NULL;
+ }
+ 
++#ifdef AP_SUEXEC_CAPABILITIES
++/* If suexec is using capabilities, don't test for the setuid bit. */
++#define SETUID_TEST(finfo) (1)
++#else
++#define SETUID_TEST(finfo) (finfo.protection & APR_USETID)
++#endif
++
+ static int
+ unixd_pre_config(apr_pool_t *pconf, apr_pool_t *plog,
+                  apr_pool_t *ptemp)
+@@ -300,7 +307,7 @@ unixd_pre_config(apr_pool_t *pconf, apr_
+     ap_unixd_config.suexec_enabled = 0;
+     if ((apr_stat(&wrapper, SUEXEC_BIN, APR_FINFO_NORM, ptemp))
+          == APR_SUCCESS) {
+-        if ((wrapper.protection & APR_USETID) && wrapper.user == 0
++        if (SETUID_TEST(wrapper) && wrapper.user == 0
+             && (access(SUEXEC_BIN, R_OK|X_OK) == 0)) {
+             ap_unixd_config.suexec_enabled = 1;
+             ap_unixd_config.suexec_disabled_reason = "";
+--- httpd-2.4.2/support/suexec.c.r1337344+
++++ httpd-2.4.2/support/suexec.c
+@@ -58,6 +58,10 @@
+ #include <grp.h>
+ #endif
+ 
++#ifdef AP_LOG_SYSLOG
++#include <syslog.h>
++#endif
++
+ #if defined(PATH_MAX)
+ #define AP_MAXPATH PATH_MAX
+ #elif defined(MAXPATHLEN)
+@@ -69,7 +73,12 @@
+ #define AP_ENVBUF 256
+ 
+ extern char **environ;
++
++#ifdef AP_LOG_SYSLOG
++static int log_open;
++#else
+ static FILE *log = NULL;
++#endif
+ 
+ static const char *const safe_env_lst[] =
+ {
+@@ -128,10 +137,23 @@ static const char *const safe_env_lst[]
+     NULL
+ };
+ 
++static void log_err(const char *fmt,...) 
++    __attribute__((format(printf,1,2)));
++static void log_no_err(const char *fmt,...)  
++    __attribute__((format(printf,1,2)));
++static void err_output(int is_error, const char *fmt, va_list ap) 
++    __attribute__((format(printf,2,0)));
+ 
+ static void err_output(int is_error, const char *fmt, va_list ap)
+ {
+-#ifdef AP_LOG_EXEC
++#if defined(AP_LOG_SYSLOG)
++    if (!log_open) {
++        openlog("suexec", LOG_PID, LOG_DAEMON);
++        log_open = 1;
++    }
++
++    vsyslog(is_error ? LOG_ERR : LOG_INFO, fmt, ap);
++#elif defined(AP_LOG_EXEC)
+     time_t timevar;
+     struct tm *lt;
+ 
+@@ -263,7 +285,7 @@ int main(int argc, char *argv[])
+      */
+     uid = getuid();
+     if ((pw = getpwuid(uid)) == NULL) {
+-        log_err("crit: invalid uid: (%ld)\n", uid);
++        log_err("crit: invalid uid: (%lu)\n", (unsigned long)uid);
+         exit(102);
+     }
+     /*
+@@ -289,7 +311,9 @@ int main(int argc, char *argv[])
+ #ifdef AP_HTTPD_USER
+         fprintf(stderr, " -D AP_HTTPD_USER=\"%s\"\n", AP_HTTPD_USER);
+ #endif
+-#ifdef AP_LOG_EXEC
++#if defined(AP_LOG_SYSLOG)
++        fprintf(stderr, " -D AP_LOG_SYSLOG\n");
++#elif defined(AP_LOG_EXEC)
+         fprintf(stderr, " -D AP_LOG_EXEC=\"%s\"\n", AP_LOG_EXEC);
+ #endif
+ #ifdef AP_SAFE_PATH
+@@ -440,7 +464,7 @@ int main(int argc, char *argv[])
+      * a UID less than AP_UID_MIN.  Tsk tsk.
+      */
+     if ((uid == 0) || (uid < AP_UID_MIN)) {
+-        log_err("cannot run as forbidden uid (%d/%s)\n", uid, cmd);
++        log_err("cannot run as forbidden uid (%lu/%s)\n", (unsigned long)uid, cmd);
+         exit(107);
+     }
+ 
+@@ -449,7 +473,7 @@ int main(int argc, char *argv[])
+      * or as a GID less than AP_GID_MIN.  Tsk tsk.
+      */
+     if ((gid == 0) || (gid < AP_GID_MIN)) {
+-        log_err("cannot run as forbidden gid (%d/%s)\n", gid, cmd);
++        log_err("cannot run as forbidden gid (%lu/%s)\n", (unsigned long)gid, cmd);
+         exit(108);
+     }
+ 
+@@ -460,7 +484,7 @@ int main(int argc, char *argv[])
+      * and setgid() to the target group. If unsuccessful, error out.
+      */
+     if (((setgid(gid)) != 0) || (initgroups(actual_uname, gid) != 0)) {
+-        log_err("failed to setgid (%ld: %s)\n", gid, cmd);
++        log_err("failed to setgid (%lu: %s)\n", (unsigned long)gid, cmd);
+         exit(109);
+     }
+ 
+@@ -468,7 +492,7 @@ int main(int argc, char *argv[])
+      * setuid() to the target user.  Error out on fail.
+      */
+     if ((setuid(uid)) != 0) {
+-        log_err("failed to setuid (%ld: %s)\n", uid, cmd);
++        log_err("failed to setuid (%lu: %s)\n", (unsigned long)uid, cmd);
+         exit(110);
+     }
+ 
+@@ -556,11 +580,11 @@ int main(int argc, char *argv[])
+         (gid != dir_info.st_gid) ||
+         (uid != prg_info.st_uid) ||
+         (gid != prg_info.st_gid)) {
+-        log_err("target uid/gid (%ld/%ld) mismatch "
+-                "with directory (%ld/%ld) or program (%ld/%ld)\n",
+-                uid, gid,
+-                dir_info.st_uid, dir_info.st_gid,
+-                prg_info.st_uid, prg_info.st_gid);
++        log_err("target uid/gid (%lu/%lu) mismatch "
++                "with directory (%lu/%lu) or program (%lu/%lu)\n",
++                (unsigned long)uid, (unsigned long)gid,
++                (unsigned long)dir_info.st_uid, (unsigned long)dir_info.st_gid,
++                (unsigned long)prg_info.st_uid, (unsigned long)prg_info.st_gid);
+         exit(120);
+     }
+     /*
+@@ -585,6 +609,12 @@ int main(int argc, char *argv[])
+ #endif /* AP_SUEXEC_UMASK */
+ 
+     /* Be sure to close the log file so the CGI can't mess with it. */
++#ifdef AP_LOG_SYSLOG
++    if (log_open) {
++        closelog();
++        log_open = 0;
++    }
++#else
+     if (log != NULL) {
+ #if APR_HAVE_FCNTL_H
+         /*
+@@ -606,6 +636,7 @@ int main(int argc, char *argv[])
+         log = NULL;
+ #endif
+     }
++#endif
+ 
+     /*
+      * Execute the command, replacing our image with its own.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-restart.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-restart.patch
new file mode 100644
index 0000000..42254d2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-restart.patch
@@ -0,0 +1,35 @@
+
+* server/main.c (main): Bail out *before* signalling the server
+  if the config is bad. (as per the claim in the docs!)
+
+https://bugzilla.redhat.com/show_bug.cgi?id=814645
+http://svn.apache.org/viewvc?view=revision&revision=1328345
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/server/main.c.restart
++++ httpd-2.4.2/server/main.c
+@@ -671,6 +671,11 @@ int main(int argc, const char * const ar
+         }
+     }
+ 
++    /* If our config failed, deal with that here. */
++    if (rv != OK) {
++        destroy_and_exit_process(process, 1);
++    }
++
+     signal_server = APR_RETRIEVE_OPTIONAL_FN(ap_signal_server);
+     if (signal_server) {
+         int exit_status;
+@@ -680,11 +685,6 @@ int main(int argc, const char * const ar
+         }
+     }
+ 
+-    /* If our config failed, deal with that here. */
+-    if (rv != OK) {
+-        destroy_and_exit_process(process, 1);
+-    }
+-
+     apr_pool_clear(plog);
+ 
+     if ( ap_run_open_logs(pconf, plog, ptemp, ap_server_conf) != OK) {
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch
new file mode 100644
index 0000000..584ddc8
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch
@@ -0,0 +1,52 @@
+From 760ccbb2fb046621a2aeaecabb2b1ef9aa280cf1 Mon Sep 17 00:00:00 2001
+From: Yulong Pei <Yulong.pei@windriver.com>
+Date: Thu, 1 Sep 2011 01:03:14 +0800
+Subject: [PATCH] replace lynx to curl in apachectl script
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
+---
+ support/apachectl.in |   14 ++++++++++----
+ 1 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/support/apachectl.in b/support/apachectl.in
+index d4dff38..109ea13 100644
+--- a/support/apachectl.in
++++ b/support/apachectl.in
+@@ -51,11 +51,11 @@ fi
+ # a command that outputs a formatted text version of the HTML at the
+ # url given on the command line.  Designed for lynx, however other
+ # programs may work.  
+-LYNX="@LYNX_PATH@ -dump"
++CURL="/usr/bin/curl"
+ #
+ # the URL to your server's mod_status status page.  If you do not
+ # have one, then status and fullstatus will not work.
+-STATUSURL="http://localhost:@PORT@/server-status"
++STATUSURL="http://localhost:@PORT@/"
+ #
+ # Set this variable to a command that increases the maximum
+ # number of file descriptors allowed per child process. This is
+@@ -91,10 +91,16 @@ configtest)
+     ERROR=$?
+     ;;
+ status)
+-    $LYNX $STATUSURL | awk ' /process$/ { print; exit } { print } '
++    $CURL -s $STATUSURL | grep -o "It works!"
++    if [ $? != 0 ] ; then
++        echo The httpd server does not work!
++    fi
+     ;;
+ fullstatus)
+-    $LYNX $STATUSURL
++    $CURL -s $STATUSURL | grep -o "It works!"
++    if [ $? != 0 ] ; then
++        echo The httpd server does not work!
++    fi
+     ;;
+ *)
+     $HTTPD $ARGV
+-- 
+1.6.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-makefile.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.2.17/server-makefile-patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-makefile.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb
deleted file mode 100644
index 66b326d..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.2.17.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SECTION = "net"
-DEPENDS = "expat pcre"
-
-inherit native 
-
-PR = "r0"
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
-
-S = "${WORKDIR}/httpd-${PV}"
-
-do_configure () {
-	./configure --with-included-apr --prefix=${prefix}
-}
-
-do_install () {
-	install -d ${D}${bindir} ${D}${libdir}
-	cp server/gen_test_char ${D}${bindir}
-	cp srclib/apr/apr-1-config ${D}${bindir}
-	cp srclib/apr-util/apu-1-config ${D}${bindir}
-	cp support/apxs ${D}${bindir}
-	chmod 755 ${D}${bindir}/apxs
-	install -d ${D}/usr/build
-	cp build/*.mk ${D}/usr/build
-	cp build/instdso.sh ${D}/usr/build
-	cp .libs/httpd ${D}${bindir}
-
-	(cd srclib/apr/.libs; tar -cf - libapr-*.so* ) |
-	  (cd ${D}${libdir}; tar -xf - )
-	(cd srclib/apr-util/.libs; tar -cf - libaprutil-*.so* ) |
-	  (cd ${D}${libdir}; tar -xf - )
-
-	install -d ${D}${includedir}/apache2
-	cp include/* ${D}${includedir}/apache2
-	cp os/unix/os.h ${D}${includedir}/apache2
-	cp os/unix/unixd.h ${D}${includedir}/apache2
-
-  	cp support/envvars-std ${D}${bindir}/envvars
-    	chmod 755 ${D}${bindir}/envvars
-}
-
-NATIVE_INSTALL_WORKS = "1"
-
-SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e"
-SRC_URI[sha256sum] = "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
new file mode 100644
index 0000000..17482ae
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
+extensible web server."
+SUMMARY = "Apache HTTP Server"
+HOMEPAGE = "http://httpd.apache.org/"
+DEPENDS = "expat-native pcre-native apr-native apr-util-native"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+PR = "r0"
+
+inherit native
+
+SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
+
+S = "${WORKDIR}/httpd-${PV}"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
+SRC_URI[md5sum] = "6bb12f726e22656f0ad2baf91f1f8329"
+SRC_URI[sha256sum] = "5382f9c507d3d02706e33d6308ea041f39e8511b5948aef0ca188df8f90159b8"
+
+do_configure () {
+	./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
+		--with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
+		--prefix=${prefix} --datadir=${datadir}/apache2
+}
+
+do_install () {
+	install -d ${D}${bindir} ${D}${libdir}
+	cp server/gen_test_char ${D}${bindir}
+	install -m 755 support/apxs ${D}${bindir}/
+	install -m 755 httpd ${D}${bindir}/
+	install -d ${D}${datadir}/apache2/build
+	cp build/*.mk ${D}${datadir}/apache2/build
+	cp build/instdso.sh ${D}${datadir}/apache2/build
+
+	install -d ${D}${includedir}/apache2
+	cp include/* ${D}${includedir}/apache2
+	cp os/unix/os.h ${D}${includedir}/apache2
+	cp os/unix/unixd.h ${D}${includedir}/apache2
+
+	cp support/envvars-std ${D}${bindir}/envvars
+	chmod 755 ${D}${bindir}/envvars
+}
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
similarity index 50%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
index 13012a7..a5bc765 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.2.17.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -1,28 +1,35 @@
-SECTION = "net"
-DESCRIPTION = "The apache v2 web server"
+DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
+extensible web server."
+SUMMARY = "Apache HTTP Server"
+HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
-RDEPENDS_${PN} += "openssl"
-
+RDEPENDS_${PN} += "openssl libgcc"
+SECTION = "net"
+LICENSE = "Apache-2.0"
 PR = "r0"
 
-SRC_URI = "http://apache.mirrors.tds.net/httpd/httpd-${PV}.tar.bz2 \
-	   file://apr-sockets-patch;apply=yes \
-	   file://configure-patch;apply=yes \
-	   file://server-makefile-patch;apply=yes \
-	   file://configure.in.patch \
-	   file://apr.h.in.patch \
+SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+           file://server-makefile.patch \
+           file://fix-libtool-name.patch \
+           file://httpd-2.4.1-corelimit.patch \
+           file://httpd-2.4.1-export.patch \
+           file://httpd-2.4.1-selinux.patch \
+           file://httpd-2.4.2-r1326980+.patch \
+           file://httpd-2.4.2-r1327036+.patch \
+           file://httpd-2.4.2-r1332643.patch \
+           file://httpd-2.4.2-r1337344+.patch \
+           file://httpd-2.4.2-restart.patch \
+           file://apache-configure_perlbin.patch \
+           file://replace-lynx-to-curl-in-apachectl-script.patch \
+           file://apache-ssl-ltmain-rpath.patch \
            file://init"
 
-#
-# over-ride needed since apache unpacks into httpd
-#
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
+SRC_URI[md5sum] = "6bb12f726e22656f0ad2baf91f1f8329"
+SRC_URI[sha256sum] = "5382f9c507d3d02706e33d6308ea041f39e8511b5948aef0ca188df8f90159b8"
+
 S = "${WORKDIR}/httpd-${PV}"
 
-#
-# implications - autotools defines suitable do_configure, do_install, etc.
-# update-rc.d adds hooks for rc-update.
-#
-#
 inherit autotools update-rc.d
 
 #
@@ -65,14 +72,15 @@ FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconf
 FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
 
 #make sure the lone .so links also get wrapped in the base package
-FILES_${PN} += " ${libdir}/lib*.so ${libdir}/pkgconfig/*"
+FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
 
 CFLAGS_append = " -DPATH_MAX=4096"
 CFLAGS_prepend = "-I${STAGING_INCDIR}/openssl "
 EXTRA_OECONF = "--enable-ssl \
 		--with-ssl=${STAGING_LIBDIR}/.. \
 		--with-expat=${STAGING_LIBDIR}/.. \
-		--with-pcre=${STAGING_LIBDIR}/.. \
 		--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
 		--enable-info \
@@ -85,20 +93,10 @@ EXTRA_OECONF = "--enable-ssl \
 		--includedir=${includedir}/${PN} \
 		--datadir=${datadir}/${PN} \
 		--sysconfdir=${sysconfdir}/${PN} \
+                --libexecdir=${libdir}/${PN}/modules \
 		ap_cv_void_ptr_lt_long=no \
-		"
-
-#
-# here we over-ride the autotools provided do_configure.
-#
-
-do_configure_prepend() {
-	sed -e 's,libtool libtool15,${HOST_SYS}-libtool libtool115,' -i ${S}/srclib/apr/build/buildcheck.sh
-}
-
-do_compile_prepend() {
-	ln -sf ${S}/srclib/apr/${HOST_SYS}-libtool ${S}/srclib/apr/libtool
-}	
+		--enable-mpms-shared \
+		ac_cv_have_threadsafe_pollset=no"
 
 do_install_append() {
 	install -d ${D}/${sysconfdir}/init.d
@@ -109,11 +107,24 @@ do_install_append() {
 		    -e 's,/etc/,${sysconfdir}/,g' \
 		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
 	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
-# remove the goofy original files...
+	# remove the goofy original files...
 	rm -rf ${D}/${sysconfdir}/${PN}/original
-# Expat should be found in the staging area via DEPENDS...
+	# Expat should be found in the staging area via DEPENDS...
 	rm -f ${D}/${libdir}/libexpat.*
+
+	# Ensure configuration file pulls in modules.d
+	printf "\nInclude ${sysconfdir}/${PN}/modules.d/*\n\n" >> ${D}/${sysconfdir}/${PN}/httpd.conf
+}
+
+SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
+
+apache_sysroot_preprocess () {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+	sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+
+	sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+	sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
 }
 
-SRC_URI[md5sum] = "16eadc59ea6b38af33874d300973202e"
-SRC_URI[sha256sum] = "868af11e3ed8fa9aade15241ea4f51971b3ef71104292ca2625ef2065e61fb04"
diff --git a/meta-webserver/recipes-httpd/apache2/files/init b/meta-webserver/recipes-httpd/apache2/files/init
index eb57f66..5ae6632 100755
--- a/meta-webserver/recipes-httpd/apache2/files/init
+++ b/meta-webserver/recipes-httpd/apache2/files/init
@@ -18,35 +18,28 @@ test -f $APACHECTL || exit 0
 # ensure we don't leak environment vars into apachectl
 APACHECTL="env -i LANG=${LANG} PATH=${PATH} $APACHECTL"
 
-if egrep -q -i "^[[:space:]]*ServerType[[:space:]]+inet" $CONF
-then
-    exit 0
-fi
-
 case "$1" in
   start)
     echo -n "Starting web server: $NAME"
-    start-stop-daemon --start --quiet --background --exec $DAEMON -- $ARGS
+    $APACHECTL $ARGS
     ;;
 
   stop)
-    echo -n "Stopping web server: $NAME"
-    start-stop-daemon --stop --signal 3 --quiet --exec $DAEMON
+    $APACHECTL stop
     ;;
 
   reload)
     echo -n "Reloading $NAME configuration"
-    start-stop-daemon --stop --signal 1 --quiet --exec $DAEMON
+    $APACHECTL reload
     ;;
 
   reload-modules)
     echo -n "Reloading $NAME modules"
-    $0 stop
-    $0 start
+    $APACHECTL restart
     ;;
 
   restart)
-    $0 reload-modules
+    $APACHECTL restart
     exit $?
     ;;
 
-- 
1.7.9.5



