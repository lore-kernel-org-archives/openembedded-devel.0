Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvbP-0006Fb-Ss
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:07:48 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 604D5CB2CA8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:21 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A187DA6233
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:15 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:05 +0100
Message-Id: <1353864310-20097-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353864310-20097-1-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/7] apache2: upgrade to 2.4.3
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
X-List-Received-Date: Mon, 26 Nov 2012 10:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../apache2-2.4.2/apache-configure_perlbin.patch   |  37 ---
 .../apache2-2.4.2/apache-ssl-ltmain-rpath.patch    |  76 -----
 .../apache2/apache2-2.4.2/fix-libtool-name.patch   |  55 ----
 .../apache2-2.4.2/httpd-2.4.1-corelimit.patch      |  37 ---
 .../apache2/apache2-2.4.2/httpd-2.4.1-export.patch |  22 --
 .../apache2-2.4.2/httpd-2.4.1-selinux.patch        |  63 ----
 .../apache2-2.4.2/httpd-2.4.2-r1326980+.patch      |  74 -----
 .../apache2-2.4.2/httpd-2.4.2-r1327036+.patch      |  87 -----
 .../apache2-2.4.2/httpd-2.4.2-r1332643.patch       | 260 ---------------
 .../apache2-2.4.2/httpd-2.4.2-r1337344+.patch      | 350 ---------------=
------
 .../apache2-2.4.2/httpd-2.4.2-restart.patch        |  35 ---
 .../replace-lynx-to-curl-in-apachectl-script.patch |  52 ---
 .../apache2/apache2-2.4.2/server-makefile.patch    |  11 -
 .../apache2-2.4.3/apache-configure_perlbin.patch   |  37 +++
 .../apache2-2.4.3/apache-ssl-ltmain-rpath.patch    |  76 +++++
 .../apache2/apache2-2.4.3/fix-libtool-name.patch   |  55 ++++
 .../apache2-2.4.3/httpd-2.4.1-corelimit.patch      |  37 +++
 .../apache2/apache2-2.4.3/httpd-2.4.1-export.patch |  22 ++
 .../apache2-2.4.3/httpd-2.4.1-selinux.patch        |  63 ++++
 .../apache2-2.4.3/httpd-2.4.2-r1332643.patch       | 260 +++++++++++++++
 .../replace-lynx-to-curl-in-apachectl-script.patch |  52 +++
 .../apache2/apache2-2.4.3/server-makefile.patch    |  11 +
 .../recipes-httpd/apache2/apache2-native_2.4.2.bb  |  43 ---
 .../recipes-httpd/apache2/apache2-native_2.4.3.bb  |  43 +++
 .../recipes-httpd/apache2/apache2_2.4.2.bb         | 144 ---------
 .../recipes-httpd/apache2/apache2_2.4.3.bb         | 140 +++++++++
 26 files changed, 796 insertions(+), 1346 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ap=
ache-configure_perlbin.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ap=
ache-ssl-ltmain-rpath.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fi=
x-libtool-name.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.1-corelimit.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.1-export.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.1-selinux.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-r1326980+.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-r1327036+.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-r1332643.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-r1337344+.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-restart.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/re=
place-lynx-to-curl-in-apachectl-script.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.2/se=
rver-makefile.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ap=
ache-configure_perlbin.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ap=
ache-ssl-ltmain-rpath.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fi=
x-libtool-name.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ht=
tpd-2.4.1-corelimit.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ht=
tpd-2.4.1-export.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ht=
tpd-2.4.1-selinux.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ht=
tpd-2.4.2-r1332643.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/re=
place-lynx-to-curl-in-apachectl-script.patch
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.3/se=
rver-makefile.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2=
.4.2.bb
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2-native_2=
.4.3.bb
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-co=
nfigure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.=
2/apache-configure_perlbin.patch
deleted file mode 100644
index baa739f..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-configure=
_perlbin.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-# Author: echo <fei.geng@windriver.com>
-# Date: April 28 2009
-# Summary:Fix perl install directory to /usr/bin
-#
-# Upstream-Status: Inappropriate [configuration]
-
---- a/configure
-+++ b/configure
-@@ -22365,13 +22365,7 @@
- #define APACHE_MPM_DIR "$MPM_DIR"
- _ACEOF
-
--
--perlbin=3D`$ac_aux_dir/PrintPath perl`
--if test "x$perlbin" =3D "x"; then
--    perlbin=3D"/replace/with/path/to/perl/interpreter"
--fi
--
--
-+perlbin=3D'/usr/bin/perl'
-
- BSD_MAKEFILE=3Dno
- ap_make_include=3Dinclude
---- a/configure.in
-+++ b/configure.in
-@@ -638,10 +638,7 @@
- AC_DEFINE_UNQUOTED(APACHE_MPM_DIR, "$MPM_DIR",
- 	[Location of the source for the current MPM])
-=20
--perlbin=3D`$ac_aux_dir/PrintPath perl`
--if test "x$perlbin" =3D "x"; then
--    perlbin=3D"/replace/with/path/to/perl/interpreter"
--fi
-+perlbin=3D'/usr/bin/perl'
- AC_SUBST(perlbin)
-=20
- dnl If we are running on BSD/OS, we need to use the BSD .include syntax=
.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ss=
l-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2=
/apache-ssl-ltmain-rpath.patch
deleted file mode 100644
index 3a59fb0..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/apache-ssl-ltmai=
n-rpath.patch
+++ /dev/null
@@ -1,76 +0,0 @@
---- httpd-2.2.8.orig/build/ltmain.sh
-+++ httpd-2.2.8/build/ltmain.sh
-@@ -1515,7 +1515,7 @@ EOF
- 	dir=3D`$echo "X$arg" | $Xsed -e 's/^-L//'`
- 	# We need an absolute path.
- 	case $dir in
--	[\\/]* | [A-Za-z]:[\\/]*) ;;
-+	=3D* | [\\/]* | [A-Za-z]:[\\/]*) ;;
- 	*)
- 	  absdir=3D`cd "$dir" && pwd`
- 	  if test -z "$absdir"; then
-@@ -2558,7 +2558,7 @@ EOF
- 	    $echo "*** $linklib is not portable!"
- 	  fi
- 	  if test "$linkmode" =3D lib &&
--	     test "$hardcode_into_libs" =3D yes; then
-+             test "x$wrs_use_rpaths" =3D "xyes" && test "$hardcode_into=
_libs" =3D yes; then
- 	    # Hardcode the library path.
- 	    # Skip directories that are in the system default run-time
- 	    # search path.
-@@ -2832,7 +2832,7 @@ EOF
-=20
- 	if test "$linkmode" =3D lib; then
- 	  if test -n "$dependency_libs" &&
--	     { test "$hardcode_into_libs" !=3D yes ||
-+             { test "$hardcode_into_libs" !=3D yes || test "x$wrs_use_r=
paths" !=3D "xyes" ||
- 	       test "$build_old_libs" =3D yes ||
- 	       test "$link_static" =3D yes; }; then
- 	    # Extract -R from dependency_libs
-@@ -3426,7 +3426,8 @@ EOF
- 	  *) finalize_rpath=3D"$finalize_rpath $libdir" ;;
- 	  esac
- 	done
--	if test "$hardcode_into_libs" !=3D yes || test "$build_old_libs" =3D y=
es; then
-+        if test "$hardcode_into_libs" !=3D yes || test "x$wrs_use_rpath=
s" !=3D "xyes" ||
-+           test "$build_old_libs" =3D yes; then
- 	  dependency_libs=3D"$temp_xrpath $dependency_libs"
- 	fi
-       fi
-@@ -3843,7 +3844,7 @@ EOF
-         case $archive_cmds in
-           *\$LD\ *) wl=3D ;;
-         esac
--	if test "$hardcode_into_libs" =3D yes; then
-+        if test "$hardcode_into_libs" =3D yes && test "x$wrs_use_rpaths=
" =3D "xyes" ; then
- 	  # Hardcode the library paths
- 	  hardcode_libdirs=3D
- 	  dep_rpath=3D
-@@ -4397,6 +4398,27 @@ EOF
-       # Now hardcode the library paths
-       rpath=3D
-       hardcode_libdirs=3D
-+
-+      # short circuit putting rpaths in executables
-+      #
-+      if test "x$wrs_use_rpaths" !=3D "xyes" ; then
-+        flag=3D
-+        for libdir in $compile_rpath; do
-+          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
-+            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag=3D"$flag $l=
ibdir" ;;
-+          esac
-+        done
-+        compile_rpath=3D"$flag"
-+
-+        flag=3D
-+        for libdir in $finalize_rpath; do
-+          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
-+            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag=3D"$flag $l=
ibdir" ;;
-+          esac
-+        done
-+        finalize_rpath=3D"$flag"
-+      fi
-+
-       for libdir in $compile_rpath $finalize_rpath; do
- 	if test -n "$hardcode_libdir_flag_spec"; then
- 	  if test -n "$hardcode_libdir_separator"; then
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libto=
ol-name.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-li=
btool-name.patch
deleted file mode 100644
index 027af04..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/fix-libtool-name=
.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Fix build scripts to use correct libtool filename
-
-Upstream-Status: Inappropriate [configuration]
-
----
- httpd-2.4.2/build/config_vars.sh.in |    2 +-
- httpd-2.4.2/configure               |    2 +-
- httpd-2.4.2/configure.in            |    2 +-
- httpd-2.4.2/support/apxs.in         |    2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
---- a/build/config_vars.sh.in
-+++ b/build/config_vars.sh.in
-@@ -35,7 +35,7 @@ else
-    APU_CONFIG=3D@APU_CONFIG@
- fi
-=20
--APR_LIBTOOL=3D"`${APR_CONFIG} --apr-libtool`"
-+APR_LIBTOOL=3D"`${APR_CONFIG} --apr-libtool | sed -e s,libtool,${host_a=
lias}-libtool,`"
- APR_INCLUDEDIR=3D"`${APR_CONFIG} --includedir`"
- test -n "@APU_CONFIG@" && APU_INCLUDEDIR=3D"`${APU_CONFIG} --includedir=
`"
-=20
---- a/configure
-+++ b/configure
-@@ -6205,7 +6205,7 @@ case $host in
-       if test "x$LTFLAGS" =3D "x"; then
-           LTFLAGS=3D'--silent'
-       fi
--      my_libtool=3D`$apr_config --apr-libtool`
-+      my_libtool=3D`$apr_config --apr-libtool | sed -e s,libtool,${host=
_alias}-libtool,`
-       LIBTOOL=3D"$my_libtool \$(LTFLAGS)"
-       libtoolversion=3D`$my_libtool --version`
-       case $libtoolversion in
---- a/configure.in
-+++ b/configure.in
-@@ -264,7 +264,7 @@ case $host in
-       if test "x$LTFLAGS" =3D "x"; then
-           LTFLAGS=3D'--silent'
-       fi
--      my_libtool=3D`$apr_config --apr-libtool`
-+      my_libtool=3D`$apr_config --apr-libtool | sed -e s,libtool,${host=
_alias}-libtool,`
-       LIBTOOL=3D"$my_libtool \$(LTFLAGS)"
-       libtoolversion=3D`$my_libtool --version`
-       case $libtoolversion in
---- a/support/apxs.in
-+++ b/support/apxs.in
-@@ -352,7 +352,7 @@ if ($apr_major_version < 2) {
-     }
- }
-=20
--my $libtool =3D `$apr_config --apr-libtool`;
-+my $libtool =3D `$apr_config --apr-libtool| sed -e s,libtool,${host_ali=
as}-libtool,`;
- chomp($libtool);
-=20
- my $apr_includedir =3D `$apr_config --includes`;
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/h=
ttpd-2.4.1-corelimit.patch
deleted file mode 100644
index 18e4107..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-core=
limit.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-
-Bump up the core size limit if CoreDumpDirectory is
-configured.
-
-Upstream-Status: Pending=20
-
-Note: upstreaming was discussed but there are competing desires;
-	there are portability oddities here too.
-
---- httpd-2.4.1/server/core.c.corelimit
-+++ httpd-2.4.1/server/core.c
-@@ -4433,6 +4433,25 @@ static int core_post_config(apr_pool_t *
-     }
-     apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
-                               apr_pool_cleanup_null);
-+
-+#ifdef RLIMIT_CORE
-+    if (ap_coredumpdir_configured) {
-+        struct rlimit lim;
-+
-+        if (getrlimit(RLIMIT_CORE, &lim) =3D=3D 0 && lim.rlim_cur =3D=3D=
 0) {
-+            lim.rlim_cur =3D lim.rlim_max;
-+            if (setrlimit(RLIMIT_CORE, &lim) =3D=3D 0) {
-+                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
-+                             "core dump file size limit raised to %lu b=
ytes",
-+                             lim.rlim_cur);
-+            } else {
-+                ap_log_error(APLOG_MARK, APLOG_NOTICE, errno, NULL,
-+                             "core dump file size is zero, setrlimit fa=
iled");
-+            }
-+        }
-+    }
-+#endif
-+
-     return OK;
- }
-=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.1-export.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/http=
d-2.4.1-export.patch
deleted file mode 100644
index ed629bf..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-expo=
rt.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-
-There is no need to "suck in" the apr/apr-util symbols when using
-a shared libapr{,util}, it just bloats the symbol table; so don't.
-
-Upstream-HEAD: needed
-Upstream-2.0: omit
-Upstream-Status: Pending
-
-Note: EXPORT_DIRS change is conditional on using shared apr
-
---- httpd-2.4.1/server/Makefile.in.export
-+++ httpd-2.4.1/server/Makefile.in
-@@ -57,9 +57,6 @@ export_files:
- 	( for dir in $(EXPORT_DIRS); do \
- 	      ls $$dir/*.h ; \
- 	  done; \
--	  for dir in $(EXPORT_DIRS_APR); do \
--	      ls $$dir/ap[ru].h $$dir/ap[ru]_*.h 2>/dev/null; \
--	  done; \
- 	) | sort -u > $@
-=20
- exports.c: export_files
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/htt=
pd-2.4.1-selinux.patch
deleted file mode 100644
index 873328d..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.1-seli=
nux.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-
-Log the SELinux context at startup.
-
-Upstream-Status: Inappropriate [other]
-
-Note: unlikely to be any interest in this upstream
-
---- httpd-2.4.1/configure.in.selinux
-+++ httpd-2.4.1/configure.in
-@@ -458,6 +458,11 @@ fopen64
- dnl confirm that a void pointer is large enough to store a long integer
- APACHE_CHECK_VOID_PTR_LEN
-=20
-+AC_CHECK_LIB(selinux, is_selinux_enabled, [
-+   AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
-+   APR_ADDTO(AP_LIBS, [-lselinux])
-+])
-+
- AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
- [AC_TRY_RUN(#define _GNU_SOURCE
- #include <unistd.h>
---- httpd-2.4.1/server/core.c.selinux
-+++ httpd-2.4.1/server/core.c
-@@ -58,6 +58,10 @@
- #include <unistd.h>
- #endif
-=20
-+#ifdef HAVE_SELINUX
-+#include <selinux/selinux.h>
-+#endif
-+
- /* LimitRequestBody handling */
- #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
- #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
-@@ -4452,6 +4456,28 @@ static int core_post_config(apr_pool_t *
-     }
- #endif
-=20
-+#ifdef HAVE_SELINUX
-+    {
-+        static int already_warned =3D 0;
-+        int is_enabled =3D is_selinux_enabled() > 0;
-+       =20
-+        if (is_enabled && !already_warned) {
-+            security_context_t con;
-+           =20
-+            if (getcon(&con) =3D=3D 0) {
-+               =20
-+                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
-+                             "SELinux policy enabled; "
-+                             "httpd running as context %s", con);
-+               =20
-+                already_warned =3D 1;
-+               =20
-+                freecon(con);
-+            }
-+        }
-+    }
-+#endif
-+
-     return OK;
- }
-=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.2-r1326980+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/h=
ttpd-2.4.2-r1326980+.patch
deleted file mode 100644
index 98b226b..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r132=
6980+.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-
-* modules/loggers/mod_log_debug.c: Mark private globals as static.
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1326980
-
-* modules/filters/sed1.c: Mark private globals as static const.
-  (command): Change p3 pointer to const.=20
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1326984
-
-* modules/filters/config.m4: Prevent libsed internals from polluting
-  the global symbol namespace.
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1326991
-
-Upstream-Status: Backport
-
---- httpd-2.4.2/modules/loggers/mod_log_debug.c
-+++ httpd-2.4.2/modules/loggers/mod_log_debug.c
-@@ -35,8 +35,8 @@
-     apr_array_header_t *entries;
- } log_debug_dirconf;
-=20
--const char *allhooks =3D "all";
--const char * const hooks[] =3D {
-+static const char *allhooks =3D "all";
-+static const char * const hooks[] =3D {
-     "log_transaction",      /*  0 */
-     "quick_handler",        /*  1 */
-     "handler",              /*  2 */
---- httpd-2.4.2/modules/filters/sed1.c
-+++ httpd-2.4.2/modules/filters/sed1.c
-@@ -25,7 +25,7 @@
- #include "apr_strings.h"
- #include "regexp.h"
-=20
--char    *trans[040]  =3D {
-+static const char *const trans[040]  =3D {
-     "\\01",
-     "\\02",
-     "\\03",
-@@ -58,7 +58,7 @@
-     "\\36",
-     "\\37"
- };
--char rub[] =3D {"\\177"};
-+static const char rub[] =3D {"\\177"};
-=20
- extern int sed_step(char *p1, char *p2, int circf, step_vars_storage *v=
ars);
- static int substitute(sed_eval_t *eval, sed_reptr_t *ipc,
-@@ -692,7 +692,8 @@
-                             step_vars_storage *step_vars)
- {
-     int    i;
--    char   *p1, *p2, *p3;
-+    char   *p1, *p2;
-+    const char *p3;
-     int length;
-     char sz[32]; /* 32 bytes enough to store 64 bit integer in decimal =
*/
-     apr_status_t rv =3D APR_SUCCESS;
---- httpd-2.4.2/modules/filters/config.m4
-+++ httpd-2.4.2/modules/filters/config.m4
-@@ -16,7 +16,13 @@
- APACHE_MODULE(substitute, response content rewrite-like filtering, , , =
most)
-=20
- sed_obj=3D"mod_sed.lo sed0.lo sed1.lo regexp.lo"
--APACHE_MODULE(sed, filter request and/or response bodies through sed, $=
sed_obj, , most)
-+APACHE_MODULE(sed, filter request and/or response bodies through sed, $=
sed_obj, , most, [
-+    if test "x$enable_sed" =3D "xshared"; then
-+        # The only symbol which needs to be exported is the module
-+        # structure, so ask libtool to hide libsed internals:
-+        APR_ADDTO(MOD_SED_LDADD, [-export-symbols-regex sed_module])
-+    fi
-+])
-=20
- if test "$ac_cv_ebcdic" =3D "yes"; then
- # mod_charset_lite can be very useful on an ebcdic system,
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.2-r1327036+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/h=
ttpd-2.4.2-r1327036+.patch
deleted file mode 100644
index 57b5155..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r132=
7036+.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-
-* server/mpm_unix.c (dummy_connection): Use a TLS 1.0 close_notify
-  alert if the chosen listener is configured for https; not perfect
-  but better than sending an HTTP request.  Adjust comments.
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1327036
-
-* server/mpm_unix.c (dummy_connection): Fix spello.
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1327080
-
-Upstream-Status: Backport
-
---- httpd-2.4.2/server/mpm_unix.c
-+++ httpd-2.4.2/server/mpm_unix.c
-@@ -501,14 +501,14 @@
-     return rv;
- }
-=20
--/* This function connects to the server, then immediately closes the co=
nnection.
-- * This permits the MPM to skip the poll when there is only one listeni=
ng
-- * socket, because it provides a alternate way to unblock an accept() w=
hen
-- * the pod is used.
-- */
-+/* This function connects to the server and sends enough data to
-+ * ensure the child wakes up and processes a new connection.  This
-+ * permits the MPM to skip the poll when there is only one listening
-+ * socket, because it provides a alternate way to unblock an accept()
-+ * when the pod is used.  */
- static apr_status_t dummy_connection(ap_pod_t *pod)
- {
--    char *srequest;
-+    const char *data;
-     apr_status_t rv;
-     apr_socket_t *sock;
-     apr_pool_t *p;
-@@ -574,24 +574,37 @@
-         return rv;
-     }
-=20
--    /* Create the request string. We include a User-Agent so that
--     * adminstrators can track down the cause of the odd-looking
--     * requests in their logs.
--     */
--    srequest =3D apr_pstrcat(p, "OPTIONS * HTTP/1.0\r\nUser-Agent: ",
-+    if (lp->protocol && strcasecmp(lp->protocol, "https") =3D=3D 0) {
-+        /* Send a TLS 1.0 close_notify alert.  This is perhaps the
-+         * "least wrong" way to open and cleanly terminate an SSL
-+         * connection.  It should "work" without noisy error logs if
-+         * the server actually expects SSLv3/TLSv1.  With
-+         * SSLv23_server_method() OpenSSL's SSL_accept() fails
-+         * ungracefully on receipt of this message, since it requires
-+         * an 11-byte ClientHello message and this is too short. */
-+        static const unsigned char tls10_close_notify[7] =3D {
-+            '\x15',         /* TLSPlainText.type =3D Alert (21) */
-+            '\x03', '\x01', /* TLSPlainText.version =3D {3, 1} */
-+            '\x00', '\x02', /* TLSPlainText.length =3D 2 */
-+            '\x01',         /* Alert.level =3D warning (1) */
-+            '\x00'          /* Alert.description =3D close_notify (0) *=
/
-+        };
-+        data =3D (const char *)tls10_close_notify;
-+        len =3D sizeof(tls10_close_notify);
-+    }
-+    else /* ... XXX other request types here? */ {
-+        /* Create an HTTP request string.  We include a User-Agent so
-+         * that adminstrators can track down the cause of the
-+         * odd-looking requests in their logs.  A complete request is
-+         * used since kernel-level filtering may require that much
-+         * data before returning from accept(). */
-+        data =3D apr_pstrcat(p, "OPTIONS * HTTP/1.0\r\nUser-Agent: ",
-                            ap_get_server_description(),
-                            " (internal dummy connection)\r\n\r\n", NULL=
);
-+        len =3D strlen(data);
-+    }
-=20
--    /* Since some operating systems support buffering of data or entire
--     * requests in the kernel, we send a simple request, to make sure
--     * the server pops out of a blocking accept().
--     */
--    /* XXX: This is HTTP specific. We should look at the Protocol for e=
ach
--     * listener, and send the correct type of request to trigger any Ac=
cept
--     * Filters.
--     */
--    len =3D strlen(srequest);
--    apr_socket_send(sock, srequest, &len);
-+    apr_socket_send(sock, data, &len);
-     apr_socket_close(sock);
-     apr_pool_destroy(p);
-=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.2-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/ht=
tpd-2.4.2-r1332643.patch
deleted file mode 100644
index 16fd7d7..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r133=
2643.patch
+++ /dev/null
@@ -1,260 +0,0 @@
-Add support for TLS Next Protocol Negotiation:
-
-* modules/ssl/mod_ssl.c, modules/ssl/mod_ssl.h: Add and implement new
-  hooks for next protocol advertisement/discovery.
-
-* modules/ssl/ssl_engine_init.c (ssl_init_ctx_callbacks): Enable
-  NPN advertisement callback in handshake.
-
-* modules/ssl/ssl_engine_io.c (ssl_io_filter_input): Invoke
-  next-protocol discovery hook.
-
-* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos):=20
-  New callback.
-
-* modules/ssl/ssl_private.h: Add prototype.
-
-Submitted by: Matthew Steele <mdsteele google.com>
-  with slight tweaks by jorton
-
-https://bugzilla.redhat.com//show_bug.cgi?id=3D809599
-
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1332643
-
-Upstream-Status: Backport
-
---- httpd-2.4.2/modules/ssl/ssl_private.h
-+++ httpd-2.4.2/modules/ssl/ssl_private.h
-@@ -139,6 +139,11 @@
- #define HAVE_FIPS
- #endif
-=20
-+#if OPENSSL_VERSION_NUMBER >=3D 0x10001000L && !defined(OPENSSL_NO_NEXT=
PROTONEG) \
-+    && !defined(OPENSSL_NO_TLSEXT)
-+#define HAVE_TLS_NPN
-+#endif
-+
- #if (OPENSSL_VERSION_NUMBER >=3D 0x10000000)
- #define MODSSL_SSL_CIPHER_CONST const
- #define MODSSL_SSL_METHOD_CONST const
-@@ -811,6 +816,7 @@
- int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned=
 char *,
-                                        EVP_CIPHER_CTX *, HMAC_CTX *, in=
t);
- #endif
-+int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **da=
ta, unsigned int *len, void *arg);
-=20
- /**  Session Cache Support  */
- void         ssl_scache_init(server_rec *, apr_pool_t *);
---- httpd-2.4.2/modules/ssl/mod_ssl.c
-+++ httpd-2.4.2/modules/ssl/mod_ssl.c
-@@ -260,6 +260,18 @@
-     AP_END_CMD
- };
-=20
-+/* Implement 'modssl_run_npn_advertise_protos_hook'. */
-+APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
-+    modssl, AP, int, npn_advertise_protos_hook,
-+    (conn_rec *connection, apr_array_header_t *protos),
-+    (connection, protos), OK, DECLINED);
-+
-+/* Implement 'modssl_run_npn_proto_negotiated_hook'. */
-+APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
-+    modssl, AP, int, npn_proto_negotiated_hook,
-+    (conn_rec *connection, const char *proto_name, apr_size_t proto_nam=
e_len),
-+    (connection, proto_name, proto_name_len), OK, DECLINED);
-+
- /*
-  *  the various processing hooks
-  */
---- httpd-2.4.2/modules/ssl/mod_ssl.h
-+++ httpd-2.4.2/modules/ssl/mod_ssl.h
-@@ -63,5 +63,26 @@
-=20
- APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
-=20
-+/** The npn_advertise_protos optional hook allows other modules to add =
entries
-+ * to the list of protocol names advertised by the server during the Ne=
xt
-+ * Protocol Negotiation (NPN) portion of the SSL handshake.  The hook c=
allee is
-+ * given the connection and an APR array; it should push one or more ch=
ar*'s
-+ * pointing to null-terminated strings (such as "http/1.1" or "spdy/2")=
 onto
-+ * the array and return OK, or do nothing and return DECLINED. */
-+APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_advertise_protos_hook,
-+                          (conn_rec *connection, apr_array_header_t *pr=
otos));
-+
-+/** The npn_proto_negotiated optional hook allows other modules to disc=
over the
-+ * name of the protocol that was chosen during the Next Protocol Negoti=
ation
-+ * (NPN) portion of the SSL handshake.  Note that this may be the empty=
 string
-+ * (in which case modules should probably assume HTTP), or it may be a =
protocol
-+ * that was never even advertised by the server.  The hook callee is gi=
ven the
-+ * connection, a non-null-terminated string containing the protocol nam=
e, and
-+ * the length of the string; it should do something appropriate (i.e. i=
nsert or
-+ * remove filters) and return OK, or do nothing and return DECLINED. */
-+APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_proto_negotiated_hook,
-+                          (conn_rec *connection, const char *proto_name=
,
-+                           apr_size_t proto_name_len));
-+
- #endif /* __MOD_SSL_H__ */
- /** @} */
---- httpd-2.4.2/modules/ssl/ssl_engine_init.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_init.c
-@@ -681,6 +681,11 @@
- #endif
-=20
-     SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
-+
-+#ifdef HAVE_TLS_NPN
-+    SSL_CTX_set_next_protos_advertised_cb(
-+        ctx, ssl_callback_AdvertiseNextProtos, NULL);
-+#endif
- }
-=20
- static void ssl_init_ctx_verify(server_rec *s,
---- httpd-2.4.2/modules/ssl/ssl_engine_io.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_io.c
-@@ -28,6 +28,7 @@
-                                   core keeps dumping.''
-                                             -- Unknown    */
- #include "ssl_private.h"
-+#include "mod_ssl.h"
- #include "apr_date.h"
-=20
- /*  _________________________________________________________________
-@@ -297,6 +298,7 @@
-     apr_pool_t *pool;
-     char buffer[AP_IOBUFSIZE];
-     ssl_filter_ctx_t *filter_ctx;
-+    int npn_finished;  /* 1 if NPN has finished, 0 otherwise */
- } bio_filter_in_ctx_t;
-=20
- /*
-@@ -1374,6 +1376,27 @@
-         APR_BRIGADE_INSERT_TAIL(bb, bucket);
-     }
-=20
-+#ifdef HAVE_TLS_NPN
-+    /* By this point, Next Protocol Negotiation (NPN) should be complet=
ed (if
-+     * our version of OpenSSL supports it).  If we haven't already, fin=
d out
-+     * which protocol was decided upon and inform other modules by call=
ing
-+     * npn_proto_negotiated_hook. */
-+    if (!inctx->npn_finished) {
-+        const unsigned char *next_proto =3D NULL;
-+        unsigned next_proto_len =3D 0;
-+
-+        SSL_get0_next_proto_negotiated(
-+            inctx->ssl, &next_proto, &next_proto_len);
-+        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, APR_SUCCESS, f->c,
-+                      "SSL NPN negotiated protocol: '%s'",
-+                      apr_pstrmemdup(f->c->pool, (const char*)next_prot=
o,
-+                                     next_proto_len));
-+        modssl_run_npn_proto_negotiated_hook(
-+            f->c, (const char*)next_proto, next_proto_len);
-+        inctx->npn_finished =3D 1;
-+    }
-+#endif
-+
-     return APR_SUCCESS;
- }
-=20
-@@ -1855,6 +1878,7 @@
-     inctx->block =3D APR_BLOCK_READ;
-     inctx->pool =3D c->pool;
-     inctx->filter_ctx =3D filter_ctx;
-+    inctx->npn_finished =3D 0;
- }
-=20
- /* The request_rec pointer is passed in here only to ensure that the
---- httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
-@@ -29,6 +29,7 @@
-                                   time I was too famous.''
-                                             -- Unknown                *=
/
- #include "ssl_private.h"
-+#include "mod_ssl.h"
- #include "util_md5.h"
-=20
- static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
-@@ -2143,3 +2144,84 @@
-     return -1;
- }
- #endif
-+
-+#ifdef HAVE_TLS_NPN
-+/*
-+ * This callback function is executed when SSL needs to decide what pro=
tocols
-+ * to advertise during Next Protocol Negotiation (NPN).  It must produc=
e a
-+ * string in wire format -- a sequence of length-prefixed strings -- in=
dicating
-+ * the advertised protocols.  Refer to SSL_CTX_set_next_protos_advertis=
ed_cb
-+ * in OpenSSL for reference.
-+ */
-+int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **da=
ta_out,
-+                                     unsigned int *size_out, void *arg)
-+{
-+    conn_rec *c =3D (conn_rec*)SSL_get_app_data(ssl);
-+    apr_array_header_t *protos;
-+    int num_protos;
-+    unsigned int size;
-+    int i;
-+    unsigned char *data;
-+    unsigned char *start;
-+
-+    *data_out =3D NULL;
-+    *size_out =3D 0;
-+
-+    /* If the connection object is not available, then there's nothing =
for us
-+     * to do. */
-+    if (c =3D=3D NULL) {
-+        return SSL_TLSEXT_ERR_OK;
-+    }
-+
-+    /* Invoke our npn_advertise_protos hook, giving other modules a cha=
nce to
-+     * add alternate protocol names to advertise. */
-+    protos =3D apr_array_make(c->pool, 0, sizeof(char*));
-+    modssl_run_npn_advertise_protos_hook(c, protos);
-+    num_protos =3D protos->nelts;
-+
-+    /* We now have a list of null-terminated strings; we need to concat=
enate
-+     * them together into a single string, where each protocol name is =
prefixed
-+     * by its length.  First, calculate how long that string will be. *=
/
-+    size =3D 0;
-+    for (i =3D 0; i < num_protos; ++i) {
-+        const char *string =3D APR_ARRAY_IDX(protos, i, const char*);
-+        unsigned int length =3D strlen(string);
-+        /* If the protocol name is too long (the length must fit in one=
 byte),
-+         * then log an error and skip it. */
-+        if (length > 255) {
-+            ap_log_cerror(APLOG_MARK, APLOG_ERR, 0, c,
-+                          "SSL NPN protocol name too long (length=3D%u)=
: %s",
-+                          length, string);
-+            continue;
-+        }
-+        /* Leave room for the length prefix (one byte) plus the protoco=
l name
-+         * itself. */
-+        size +=3D 1 + length;
-+    }
-+
-+    /* If there is nothing to advertise (either because no modules adde=
d
-+     * anything to the protos array, or because all strings added to th=
e array
-+     * were skipped), then we're done. */
-+    if (size =3D=3D 0) {
-+        return SSL_TLSEXT_ERR_OK;
-+    }
-+
-+    /* Now we can build the string.  Copy each protocol name string int=
o the
-+     * larger string, prefixed by its length. */
-+    data =3D apr_palloc(c->pool, size * sizeof(unsigned char));
-+    start =3D data;
-+    for (i =3D 0; i < num_protos; ++i) {
-+        const char *string =3D APR_ARRAY_IDX(protos, i, const char*);
-+        apr_size_t length =3D strlen(string);
-+        *start =3D (unsigned char)length;
-+        ++start;
-+        memcpy(start, string, length * sizeof(unsigned char));
-+        start +=3D length;
-+    }
-+
-+    /* Success. */
-+    *data_out =3D data;
-+    *size_out =3D size;
-+    return SSL_TLSEXT_ERR_OK;
-+}
-+#endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.2-r1337344+.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/h=
ttpd-2.4.2-r1337344+.patch
deleted file mode 100644
index 646976a..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-r133=
7344+.patch
+++ /dev/null
@@ -1,350 +0,0 @@
-
-* support/suexec.c: Add gcc format-string attributes to logging
-  functions. =20
-  (main): Always print uid/gid as unsigned long, and cast to avoid
-  warnings (which somewhat defeats the point of the format string
-  attrs, but is necessary since the size of gid/uid varies).
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1337344
-
-
-
-suexec: Add support for logging to syslog as an alternative to a
-logfile.
-
-* support/suexec.c (err_output) [AP_LOG_SYSLOG]: Log to syslog.
-  (main): Close syslog fd if open, before execv.  Add -V output
-  for AP_LOG_SYSLOG.
-
-* configure.in: Add --with-suexec-syslog argument; allow
-  --without-suexec-logfile to omit definition of AP_LOG_EXEC.
-
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1341905
-
-
-
-suexec: Support use of setgid/setuid capability bits on Linux, a
-weaker set of privileges than the full setuid/setgid root binary.
-
-* configure.in: Add --enable-suexec-capabilites flag.
-
-* Makefile.in: If configured, use setcap instead of chmod 7555 on
-  installed suexec binary.
-
-* modules/arch/unix/mod_unixd.c (unixd_pre_config): Drop test for
-  setuid bit if capability bits are used.
-
-* docs/manual/: Add docs.
-
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1342065
-
-
-
-* docs/manual/suexec.html.en: Update for syslog logging.
-
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1341930
-
-
-
-Upstream-Status: Backport
-
---- httpd-2.4.2/configure.in.r1337344+
-+++ httpd-2.4.2/configure.in
-@@ -700,7 +700,24 @@ APACHE_HELP_STRING(--with-suexec-gidmin,
-=20
- AC_ARG_WITH(suexec-logfile,
- APACHE_HELP_STRING(--with-suexec-logfile,Set the logfile),[
--  AC_DEFINE_UNQUOTED(AP_LOG_EXEC, "$withval", [SuExec log file] ) ] )
-+  if test "x$withval" =3D "xyes"; then
-+    AC_DEFINE_UNQUOTED(AP_LOG_EXEC, "$withval", [SuExec log file])
-+  fi
-+])
-+
-+AC_ARG_WITH(suexec-syslog,
-+APACHE_HELP_STRING(--with-suexec-syslog,Set the logfile),[
-+  if test $withval =3D "yes"; then
-+    if test "x${with_suexec_logfile}" !=3D "xno"; then
-+      AC_MSG_NOTICE([hint: use "--without-suexec-logfile --with-suexec-=
syslog"])
-+      AC_MSG_ERROR([suexec does not support both logging to file and sy=
slog])
-+    fi
-+    AC_CHECK_FUNCS([vsyslog], [], [
-+       AC_MSG_ERROR([cannot support syslog from suexec without vsyslog(=
)])])
-+    AC_DEFINE(AP_LOG_SYSLOG, 1, [SuExec log to syslog])
-+  fi   =20
-+])
-+
-=20
- AC_ARG_WITH(suexec-safepath,
- APACHE_HELP_STRING(--with-suexec-safepath,Set the safepath),[
-@@ -710,6 +727,15 @@ AC_ARG_WITH(suexec-umask,
- APACHE_HELP_STRING(--with-suexec-umask,umask for suexec'd process),[
-   AC_DEFINE_UNQUOTED(AP_SUEXEC_UMASK, 0$withval, [umask for suexec'd pr=
ocess] ) ] )
-=20
-+INSTALL_SUEXEC=3Dsetuid
-+AC_ARG_ENABLE([suexec-capabilities],=20
-+APACHE_HELP_STRING(--enable-suexec-capabilities,Use Linux capability bi=
ts not setuid root suexec), [
-+INSTALL_SUEXEC=3Dcaps
-+AC_DEFINE(AP_SUEXEC_CAPABILITIES, 1,=20
-+          [Enable if suexec is installed with Linux capabilities, not s=
etuid])
-+])
-+APACHE_SUBST(INSTALL_SUEXEC)
-+
- dnl APR should go after the other libs, so the right symbols can be pic=
ked up
- if test x${apu_found} !=3D xobsolete; then
-   AP_LIBS=3D"$AP_LIBS `$apu_config --avoid-ldap --link-libtool`"
---- httpd-2.4.2/docs/manual/suexec.html.en.r1337344+
-+++ httpd-2.4.2/docs/manual/suexec.html.en
-@@ -369,6 +369,21 @@
-       together with the <code>--enable-suexec</code> option to let
-       APACI accept your request for using the suEXEC feature.</dd>
-=20
-+      <dt><code>--enable-suexec-capabilities</code></dt>
-+
-+      <dd><strong>Linux specific:</strong> Normally,
-+      the <code>suexec</code> binary is installed "setuid/setgid
-+      root", which allows it to run with the full privileges of the
-+      root user.  If this option is used, the <code>suexec</code>
-+      binary will instead be installed with only the setuid/setgid
-+      "capability" bits set, which is the subset of full root
-+      priviliges required for suexec operation.  Note that
-+      the <code>suexec</code> binary may not be able to write to a log
-+      file in this mode; it is recommended that the
-+      <code>--with-suexec-syslog --without-suexec-logfile</code>
-+      options are used in conjunction with this mode, so that syslog
-+      logging is used instead.</dd>
-+
-       <dt><code>--with-suexec-bin=3D<em>PATH</em></code></dt>
-=20
-       <dd>The path to the <code>suexec</code> binary must be hard-coded
-@@ -430,6 +445,12 @@
-       "<code>suexec_log</code>" and located in your standard logfile
-       directory (<code>--logfiledir</code>).</dd>
-=20
-+      <dt><code>--with-suexec-syslog</code></dt>
-+
-+      <dd>If defined, suexec will log notices and errors to syslog
-+      instead of a logfile.  This option must be combined
-+      with <code>--without-suexec-logfile</code>.</dd>
-+
-       <dt><code>--with-suexec-safepath=3D<em>PATH</em></code></dt>
-=20
-       <dd>Define a safe PATH environment to pass to CGI
-@@ -546,9 +567,12 @@
-=20
-     <p>The suEXEC wrapper will write log information
-     to the file defined with the <code>--with-suexec-logfile</code>
--    option as indicated above. If you feel you have configured and
--    installed the wrapper properly, have a look at this log and the
--    error_log for the server to see where you may have gone astray.</p>
-+    option as indicated above, or to syslog if <code>--with-suexec-sysl=
og</code>
-+    is used. If you feel you have configured and
-+    installed the wrapper properly, have a look at the log and the
-+    error_log for the server to see where you may have gone astray.=20
-+    The output of <code>"suexec -V"</code> will show the options
-+    used to compile suexec, if using a binary distribution.</p>
-=20
- </div><div class=3D"top"><a href=3D"#page-header"><img alt=3D"top" src=3D=
"./images/up.gif" /></a></div>
- <div class=3D"section">
-@@ -615,4 +639,4 @@
- </div><div id=3D"footer">
- <p class=3D"apache">Copyright 2012 The Apache Software Foundation.<br /=
>Licensed under the <a href=3D"http://www.apache.org/licenses/LICENSE-2.0=
">Apache License, Version 2.0</a>.</p>
- <p class=3D"menu"><a href=3D"./mod/">Modules</a> | <a href=3D"./mod/dir=
ectives.html">Directives</a> | <a href=3D"./faq/">FAQ</a> | <a href=3D"./=
glossary.html">Glossary</a> | <a href=3D"./sitemap.html">Sitemap</a></p><=
/div>
--</body></html>
-\ No newline at end of file
-+</body></html>
---- httpd-2.4.2/Makefile.in.r1337344+
-+++ httpd-2.4.2/Makefile.in
-@@ -236,11 +236,22 @@ install-man:
- 	  cd $(DESTDIR)$(manualdir) && find . -name ".svn" -type d -print | xa=
rgs rm -rf 2>/dev/null || true; \
- 	fi
-=20
--install-suexec:
-+install-suexec: install-suexec-binary install-suexec-$(INSTALL_SUEXEC)
-+
-+install-suexec-binary:
- 	@if test -f $(builddir)/support/suexec; then \
-             test -d $(DESTDIR)$(sbindir) || $(MKINSTALLDIRS) $(DESTDIR)=
$(sbindir); \
-             $(INSTALL_PROGRAM) $(top_builddir)/support/suexec $(DESTDIR=
)$(sbindir); \
--            chmod 4755 $(DESTDIR)$(sbindir)/suexec; \
-+	fi
-+
-+install-suexec-setuid:
-+	@if test -f $(builddir)/support/suexec; then \
-+	    chmod 4755 $(DESTDIR)$(sbindir)/suexec; \
-+	fi
-+
-+install-suexec-caps:
-+	@if test -f $(builddir)/support/suexec; then \
-+            setcap 'cap_setuid,cap_setgid+pe' $(DESTDIR)$(sbindir)/suex=
ec; \
- 	fi
-=20
- suexec:
---- httpd-2.4.2/modules/arch/unix/mod_unixd.c.r1337344+
-+++ httpd-2.4.2/modules/arch/unix/mod_unixd.c
-@@ -284,6 +284,13 @@ unixd_set_suexec(cmd_parms *cmd, void *d
-     return NULL;
- }
-=20
-+#ifdef AP_SUEXEC_CAPABILITIES
-+/* If suexec is using capabilities, don't test for the setuid bit. */
-+#define SETUID_TEST(finfo) (1)
-+#else
-+#define SETUID_TEST(finfo) (finfo.protection & APR_USETID)
-+#endif
-+
- static int
- unixd_pre_config(apr_pool_t *pconf, apr_pool_t *plog,
-                  apr_pool_t *ptemp)
-@@ -300,7 +307,7 @@ unixd_pre_config(apr_pool_t *pconf, apr_
-     ap_unixd_config.suexec_enabled =3D 0;
-     if ((apr_stat(&wrapper, SUEXEC_BIN, APR_FINFO_NORM, ptemp))
-          =3D=3D APR_SUCCESS) {
--        if ((wrapper.protection & APR_USETID) && wrapper.user =3D=3D 0
-+        if (SETUID_TEST(wrapper) && wrapper.user =3D=3D 0
-             && (access(SUEXEC_BIN, R_OK|X_OK) =3D=3D 0)) {
-             ap_unixd_config.suexec_enabled =3D 1;
-             ap_unixd_config.suexec_disabled_reason =3D "";
---- httpd-2.4.2/support/suexec.c.r1337344+
-+++ httpd-2.4.2/support/suexec.c
-@@ -58,6 +58,10 @@
- #include <grp.h>
- #endif
-=20
-+#ifdef AP_LOG_SYSLOG
-+#include <syslog.h>
-+#endif
-+
- #if defined(PATH_MAX)
- #define AP_MAXPATH PATH_MAX
- #elif defined(MAXPATHLEN)
-@@ -69,7 +73,12 @@
- #define AP_ENVBUF 256
-=20
- extern char **environ;
-+
-+#ifdef AP_LOG_SYSLOG
-+static int log_open;
-+#else
- static FILE *log =3D NULL;
-+#endif
-=20
- static const char *const safe_env_lst[] =3D
- {
-@@ -128,10 +137,23 @@ static const char *const safe_env_lst[]
-     NULL
- };
-=20
-+static void log_err(const char *fmt,...)=20
-+    __attribute__((format(printf,1,2)));
-+static void log_no_err(const char *fmt,...) =20
-+    __attribute__((format(printf,1,2)));
-+static void err_output(int is_error, const char *fmt, va_list ap)=20
-+    __attribute__((format(printf,2,0)));
-=20
- static void err_output(int is_error, const char *fmt, va_list ap)
- {
--#ifdef AP_LOG_EXEC
-+#if defined(AP_LOG_SYSLOG)
-+    if (!log_open) {
-+        openlog("suexec", LOG_PID, LOG_DAEMON);
-+        log_open =3D 1;
-+    }
-+
-+    vsyslog(is_error ? LOG_ERR : LOG_INFO, fmt, ap);
-+#elif defined(AP_LOG_EXEC)
-     time_t timevar;
-     struct tm *lt;
-=20
-@@ -263,7 +285,7 @@ int main(int argc, char *argv[])
-      */
-     uid =3D getuid();
-     if ((pw =3D getpwuid(uid)) =3D=3D NULL) {
--        log_err("crit: invalid uid: (%ld)\n", uid);
-+        log_err("crit: invalid uid: (%lu)\n", (unsigned long)uid);
-         exit(102);
-     }
-     /*
-@@ -289,7 +311,9 @@ int main(int argc, char *argv[])
- #ifdef AP_HTTPD_USER
-         fprintf(stderr, " -D AP_HTTPD_USER=3D\"%s\"\n", AP_HTTPD_USER);
- #endif
--#ifdef AP_LOG_EXEC
-+#if defined(AP_LOG_SYSLOG)
-+        fprintf(stderr, " -D AP_LOG_SYSLOG\n");
-+#elif defined(AP_LOG_EXEC)
-         fprintf(stderr, " -D AP_LOG_EXEC=3D\"%s\"\n", AP_LOG_EXEC);
- #endif
- #ifdef AP_SAFE_PATH
-@@ -440,7 +464,7 @@ int main(int argc, char *argv[])
-      * a UID less than AP_UID_MIN.  Tsk tsk.
-      */
-     if ((uid =3D=3D 0) || (uid < AP_UID_MIN)) {
--        log_err("cannot run as forbidden uid (%d/%s)\n", uid, cmd);
-+        log_err("cannot run as forbidden uid (%lu/%s)\n", (unsigned lon=
g)uid, cmd);
-         exit(107);
-     }
-=20
-@@ -449,7 +473,7 @@ int main(int argc, char *argv[])
-      * or as a GID less than AP_GID_MIN.  Tsk tsk.
-      */
-     if ((gid =3D=3D 0) || (gid < AP_GID_MIN)) {
--        log_err("cannot run as forbidden gid (%d/%s)\n", gid, cmd);
-+        log_err("cannot run as forbidden gid (%lu/%s)\n", (unsigned lon=
g)gid, cmd);
-         exit(108);
-     }
-=20
-@@ -460,7 +484,7 @@ int main(int argc, char *argv[])
-      * and setgid() to the target group. If unsuccessful, error out.
-      */
-     if (((setgid(gid)) !=3D 0) || (initgroups(actual_uname, gid) !=3D 0=
)) {
--        log_err("failed to setgid (%ld: %s)\n", gid, cmd);
-+        log_err("failed to setgid (%lu: %s)\n", (unsigned long)gid, cmd=
);
-         exit(109);
-     }
-=20
-@@ -468,7 +492,7 @@ int main(int argc, char *argv[])
-      * setuid() to the target user.  Error out on fail.
-      */
-     if ((setuid(uid)) !=3D 0) {
--        log_err("failed to setuid (%ld: %s)\n", uid, cmd);
-+        log_err("failed to setuid (%lu: %s)\n", (unsigned long)uid, cmd=
);
-         exit(110);
-     }
-=20
-@@ -556,11 +580,11 @@ int main(int argc, char *argv[])
-         (gid !=3D dir_info.st_gid) ||
-         (uid !=3D prg_info.st_uid) ||
-         (gid !=3D prg_info.st_gid)) {
--        log_err("target uid/gid (%ld/%ld) mismatch "
--                "with directory (%ld/%ld) or program (%ld/%ld)\n",
--                uid, gid,
--                dir_info.st_uid, dir_info.st_gid,
--                prg_info.st_uid, prg_info.st_gid);
-+        log_err("target uid/gid (%lu/%lu) mismatch "
-+                "with directory (%lu/%lu) or program (%lu/%lu)\n",
-+                (unsigned long)uid, (unsigned long)gid,
-+                (unsigned long)dir_info.st_uid, (unsigned long)dir_info=
.st_gid,
-+                (unsigned long)prg_info.st_uid, (unsigned long)prg_info=
.st_gid);
-         exit(120);
-     }
-     /*
-@@ -585,6 +609,12 @@ int main(int argc, char *argv[])
- #endif /* AP_SUEXEC_UMASK */
-=20
-     /* Be sure to close the log file so the CGI can't mess with it. */
-+#ifdef AP_LOG_SYSLOG
-+    if (log_open) {
-+        closelog();
-+        log_open =3D 0;
-+    }
-+#else
-     if (log !=3D NULL) {
- #if APR_HAVE_FCNTL_H
-         /*
-@@ -606,6 +636,7 @@ int main(int argc, char *argv[])
-         log =3D NULL;
- #endif
-     }
-+#endif
-=20
-     /*
-      * Execute the command, replacing our image with its own.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4=
.2-restart.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/htt=
pd-2.4.2-restart.patch
deleted file mode 100644
index 42254d2..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/httpd-2.4.2-rest=
art.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-
-* server/main.c (main): Bail out *before* signalling the server
-  if the config is bad. (as per the claim in the docs!)
-
-https://bugzilla.redhat.com/show_bug.cgi?id=3D814645
-http://svn.apache.org/viewvc?view=3Drevision&revision=3D1328345
-
-Upstream-Status: Backport
-
---- httpd-2.4.2/server/main.c.restart
-+++ httpd-2.4.2/server/main.c
-@@ -671,6 +671,11 @@ int main(int argc, const char * const ar
-         }
-     }
-=20
-+    /* If our config failed, deal with that here. */
-+    if (rv !=3D OK) {
-+        destroy_and_exit_process(process, 1);
-+    }
-+
-     signal_server =3D APR_RETRIEVE_OPTIONAL_FN(ap_signal_server);
-     if (signal_server) {
-         int exit_status;
-@@ -680,11 +685,6 @@ int main(int argc, const char * const ar
-         }
-     }
-=20
--    /* If our config failed, deal with that here. */
--    if (rv !=3D OK) {
--        destroy_and_exit_process(process, 1);
--    }
--
-     apr_pool_clear(plog);
-=20
-     if ( ap_run_open_logs(pconf, plog, ptemp, ap_server_conf) !=3D OK) =
{
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-l=
ynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apac=
he2/apache2-2.4.2/replace-lynx-to-curl-in-apachectl-script.patch
deleted file mode 100644
index 584ddc8..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/replace-lynx-to-=
curl-in-apachectl-script.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 760ccbb2fb046621a2aeaecabb2b1ef9aa280cf1 Mon Sep 17 00:00:00 2001
-From: Yulong Pei <Yulong.pei@windriver.com>
-Date: Thu, 1 Sep 2011 01:03:14 +0800
-Subject: [PATCH] replace lynx to curl in apachectl script
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
----
- support/apachectl.in |   14 ++++++++++----
- 1 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/support/apachectl.in b/support/apachectl.in
-index d4dff38..109ea13 100644
---- a/support/apachectl.in
-+++ b/support/apachectl.in
-@@ -51,11 +51,11 @@ fi
- # a command that outputs a formatted text version of the HTML at the
- # url given on the command line.  Designed for lynx, however other
- # programs may work. =20
--LYNX=3D"@LYNX_PATH@ -dump"
-+CURL=3D"/usr/bin/curl"
- #
- # the URL to your server's mod_status status page.  If you do not
- # have one, then status and fullstatus will not work.
--STATUSURL=3D"http://localhost:@PORT@/server-status"
-+STATUSURL=3D"http://localhost:@PORT@/"
- #
- # Set this variable to a command that increases the maximum
- # number of file descriptors allowed per child process. This is
-@@ -91,10 +91,16 @@ configtest)
-     ERROR=3D$?
-     ;;
- status)
--    $LYNX $STATUSURL | awk ' /process$/ { print; exit } { print } '
-+    $CURL -s $STATUSURL | grep -o "It works!"
-+    if [ $? !=3D 0 ] ; then
-+        echo The httpd server does not work!
-+    fi
-     ;;
- fullstatus)
--    $LYNX $STATUSURL
-+    $CURL -s $STATUSURL | grep -o "It works!"
-+    if [ $? !=3D 0 ] ; then
-+        echo The httpd server does not work!
-+    fi
-     ;;
- *)
-     $HTTPD $ARGV
---=20
-1.6.4
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-ma=
kefile.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-=
makefile.patch
deleted file mode 100644
index f1349cb..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.2/server-makefile.=
patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000 -05=
00
-+++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000 -0500
-@@ -27,7 +27,7 @@
- 	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
-=20
- test_char.h: gen_test_char
--	./gen_test_char > test_char.h
-+	gen_test_char > test_char.h
-=20
- util.lo: test_char.h
-=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-co=
nfigure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.=
3/apache-configure_perlbin.patch
new file mode 100644
index 0000000..baa739f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-configure=
_perlbin.patch
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
+-perlbin=3D`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" =3D "x"; then
+-    perlbin=3D"/replace/with/path/to/perl/interpreter"
+-fi
+-
+-
++perlbin=3D'/usr/bin/perl'
+
+ BSD_MAKEFILE=3Dno
+ ap_make_include=3Dinclude
+--- a/configure.in
++++ b/configure.in
+@@ -638,10 +638,7 @@
+ AC_DEFINE_UNQUOTED(APACHE_MPM_DIR, "$MPM_DIR",
+ 	[Location of the source for the current MPM])
+=20
+-perlbin=3D`$ac_aux_dir/PrintPath perl`
+-if test "x$perlbin" =3D "x"; then
+-    perlbin=3D"/replace/with/path/to/perl/interpreter"
+-fi
++perlbin=3D'/usr/bin/perl'
+ AC_SUBST(perlbin)
+=20
+ dnl If we are running on BSD/OS, we need to use the BSD .include syntax=
.
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-ss=
l-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3=
/apache-ssl-ltmain-rpath.patch
new file mode 100644
index 0000000..3a59fb0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-ssl-ltmai=
n-rpath.patch
@@ -0,0 +1,76 @@
+--- httpd-2.2.8.orig/build/ltmain.sh
++++ httpd-2.2.8/build/ltmain.sh
+@@ -1515,7 +1515,7 @@ EOF
+ 	dir=3D`$echo "X$arg" | $Xsed -e 's/^-L//'`
+ 	# We need an absolute path.
+ 	case $dir in
+-	[\\/]* | [A-Za-z]:[\\/]*) ;;
++	=3D* | [\\/]* | [A-Za-z]:[\\/]*) ;;
+ 	*)
+ 	  absdir=3D`cd "$dir" && pwd`
+ 	  if test -z "$absdir"; then
+@@ -2558,7 +2558,7 @@ EOF
+ 	    $echo "*** $linklib is not portable!"
+ 	  fi
+ 	  if test "$linkmode" =3D lib &&
+-	     test "$hardcode_into_libs" =3D yes; then
++             test "x$wrs_use_rpaths" =3D "xyes" && test "$hardcode_into=
_libs" =3D yes; then
+ 	    # Hardcode the library path.
+ 	    # Skip directories that are in the system default run-time
+ 	    # search path.
+@@ -2832,7 +2832,7 @@ EOF
+=20
+ 	if test "$linkmode" =3D lib; then
+ 	  if test -n "$dependency_libs" &&
+-	     { test "$hardcode_into_libs" !=3D yes ||
++             { test "$hardcode_into_libs" !=3D yes || test "x$wrs_use_r=
paths" !=3D "xyes" ||
+ 	       test "$build_old_libs" =3D yes ||
+ 	       test "$link_static" =3D yes; }; then
+ 	    # Extract -R from dependency_libs
+@@ -3426,7 +3426,8 @@ EOF
+ 	  *) finalize_rpath=3D"$finalize_rpath $libdir" ;;
+ 	  esac
+ 	done
+-	if test "$hardcode_into_libs" !=3D yes || test "$build_old_libs" =3D y=
es; then
++        if test "$hardcode_into_libs" !=3D yes || test "x$wrs_use_rpath=
s" !=3D "xyes" ||
++           test "$build_old_libs" =3D yes; then
+ 	  dependency_libs=3D"$temp_xrpath $dependency_libs"
+ 	fi
+       fi
+@@ -3843,7 +3844,7 @@ EOF
+         case $archive_cmds in
+           *\$LD\ *) wl=3D ;;
+         esac
+-	if test "$hardcode_into_libs" =3D yes; then
++        if test "$hardcode_into_libs" =3D yes && test "x$wrs_use_rpaths=
" =3D "xyes" ; then
+ 	  # Hardcode the library paths
+ 	  hardcode_libdirs=3D
+ 	  dep_rpath=3D
+@@ -4397,6 +4398,27 @@ EOF
+       # Now hardcode the library paths
+       rpath=3D
+       hardcode_libdirs=3D
++
++      # short circuit putting rpaths in executables
++      #
++      if test "x$wrs_use_rpaths" !=3D "xyes" ; then
++        flag=3D
++        for libdir in $compile_rpath; do
++          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
++            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag=3D"$flag $l=
ibdir" ;;
++          esac
++        done
++        compile_rpath=3D"$flag"
++
++        flag=3D
++        for libdir in $finalize_rpath; do
++          case $(echo $libdir | ${SED} 's,/[/]*,/,g') in
++            /usr/lib/* | /usr/lib32/* | /usr/lib64/* ) flag=3D"$flag $l=
ibdir" ;;
++          esac
++        done
++        finalize_rpath=3D"$flag"
++      fi
++
+       for libdir in $compile_rpath $finalize_rpath; do
+ 	if test -n "$hardcode_libdir_flag_spec"; then
+ 	  if test -n "$hardcode_libdir_separator"; then
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fix-libto=
ol-name.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fix-li=
btool-name.patch
new file mode 100644
index 0000000..027af04
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fix-libtool-name=
.patch
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
+    APU_CONFIG=3D@APU_CONFIG@
+ fi
+=20
+-APR_LIBTOOL=3D"`${APR_CONFIG} --apr-libtool`"
++APR_LIBTOOL=3D"`${APR_CONFIG} --apr-libtool | sed -e s,libtool,${host_a=
lias}-libtool,`"
+ APR_INCLUDEDIR=3D"`${APR_CONFIG} --includedir`"
+ test -n "@APU_CONFIG@" && APU_INCLUDEDIR=3D"`${APU_CONFIG} --includedir=
`"
+=20
+--- a/configure
++++ b/configure
+@@ -6205,7 +6205,7 @@ case $host in
+       if test "x$LTFLAGS" =3D "x"; then
+           LTFLAGS=3D'--silent'
+       fi
+-      my_libtool=3D`$apr_config --apr-libtool`
++      my_libtool=3D`$apr_config --apr-libtool | sed -e s,libtool,${host=
_alias}-libtool,`
+       LIBTOOL=3D"$my_libtool \$(LTFLAGS)"
+       libtoolversion=3D`$my_libtool --version`
+       case $libtoolversion in
+--- a/configure.in
++++ b/configure.in
+@@ -264,7 +264,7 @@ case $host in
+       if test "x$LTFLAGS" =3D "x"; then
+           LTFLAGS=3D'--silent'
+       fi
+-      my_libtool=3D`$apr_config --apr-libtool`
++      my_libtool=3D`$apr_config --apr-libtool | sed -e s,libtool,${host=
_alias}-libtool,`
+       LIBTOOL=3D"$my_libtool \$(LTFLAGS)"
+       libtoolversion=3D`$my_libtool --version`
+       case $libtoolversion in
+--- a/support/apxs.in
++++ b/support/apxs.in
+@@ -352,7 +352,7 @@ if ($apr_major_version < 2) {
+     }
+ }
+=20
+-my $libtool =3D `$apr_config --apr-libtool`;
++my $libtool =3D `$apr_config --apr-libtool| sed -e s,libtool,${host_ali=
as}-libtool,`;
+ chomp($libtool);
+=20
+ my $apr_includedir =3D `$apr_config --includes`;
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4=
.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/h=
ttpd-2.4.1-corelimit.patch
new file mode 100644
index 0000000..18e4107
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-core=
limit.patch
@@ -0,0 +1,37 @@
+
+Bump up the core size limit if CoreDumpDirectory is
+configured.
+
+Upstream-Status: Pending=20
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
++        if (getrlimit(RLIMIT_CORE, &lim) =3D=3D 0 && lim.rlim_cur =3D=3D=
 0) {
++            lim.rlim_cur =3D lim.rlim_max;
++            if (setrlimit(RLIMIT_CORE, &lim) =3D=3D 0) {
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
++                             "core dump file size limit raised to %lu b=
ytes",
++                             lim.rlim_cur);
++            } else {
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, errno, NULL,
++                             "core dump file size is zero, setrlimit fa=
iled");
++            }
++        }
++    }
++#endif
++
+     return OK;
+ }
+=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4=
.1-export.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/http=
d-2.4.1-export.patch
new file mode 100644
index 0000000..ed629bf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-expo=
rt.patch
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
+=20
+ exports.c: export_files
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4=
.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/htt=
pd-2.4.1-selinux.patch
new file mode 100644
index 0000000..873328d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-seli=
nux.patch
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
+=20
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
+=20
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
+=20
++#ifdef HAVE_SELINUX
++    {
++        static int already_warned =3D 0;
++        int is_enabled =3D is_selinux_enabled() > 0;
++       =20
++        if (is_enabled && !already_warned) {
++            security_context_t con;
++           =20
++            if (getcon(&con) =3D=3D 0) {
++               =20
++                ap_log_error(APLOG_MARK, APLOG_NOTICE, 0, NULL,
++                             "SELinux policy enabled; "
++                             "httpd running as context %s", con);
++               =20
++                already_warned =3D 1;
++               =20
++                freecon(con);
++            }
++        }
++    }
++#endif
++
+     return OK;
+ }
+=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4=
.2-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/ht=
tpd-2.4.2-r1332643.patch
new file mode 100644
index 0000000..16fd7d7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.2-r133=
2643.patch
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
+* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos):=20
+  New callback.
+
+* modules/ssl/ssl_private.h: Add prototype.
+
+Submitted by: Matthew Steele <mdsteele google.com>
+  with slight tweaks by jorton
+
+https://bugzilla.redhat.com//show_bug.cgi?id=3D809599
+
+http://svn.apache.org/viewvc?view=3Drevision&revision=3D1332643
+
+Upstream-Status: Backport
+
+--- httpd-2.4.2/modules/ssl/ssl_private.h
++++ httpd-2.4.2/modules/ssl/ssl_private.h
+@@ -139,6 +139,11 @@
+ #define HAVE_FIPS
+ #endif
+=20
++#if OPENSSL_VERSION_NUMBER >=3D 0x10001000L && !defined(OPENSSL_NO_NEXT=
PROTONEG) \
++    && !defined(OPENSSL_NO_TLSEXT)
++#define HAVE_TLS_NPN
++#endif
++
+ #if (OPENSSL_VERSION_NUMBER >=3D 0x10000000)
+ #define MODSSL_SSL_CIPHER_CONST const
+ #define MODSSL_SSL_METHOD_CONST const
+@@ -811,6 +816,7 @@
+ int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned=
 char *,
+                                        EVP_CIPHER_CTX *, HMAC_CTX *, in=
t);
+ #endif
++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **da=
ta, unsigned int *len, void *arg);
+=20
+ /**  Session Cache Support  */
+ void         ssl_scache_init(server_rec *, apr_pool_t *);
+--- httpd-2.4.2/modules/ssl/mod_ssl.c
++++ httpd-2.4.2/modules/ssl/mod_ssl.c
+@@ -260,6 +260,18 @@
+     AP_END_CMD
+ };
+=20
++/* Implement 'modssl_run_npn_advertise_protos_hook'. */
++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
++    modssl, AP, int, npn_advertise_protos_hook,
++    (conn_rec *connection, apr_array_header_t *protos),
++    (connection, protos), OK, DECLINED);
++
++/* Implement 'modssl_run_npn_proto_negotiated_hook'. */
++APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
++    modssl, AP, int, npn_proto_negotiated_hook,
++    (conn_rec *connection, const char *proto_name, apr_size_t proto_nam=
e_len),
++    (connection, proto_name, proto_name_len), OK, DECLINED);
++
+ /*
+  *  the various processing hooks
+  */
+--- httpd-2.4.2/modules/ssl/mod_ssl.h
++++ httpd-2.4.2/modules/ssl/mod_ssl.h
+@@ -63,5 +63,26 @@
+=20
+ APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
+=20
++/** The npn_advertise_protos optional hook allows other modules to add =
entries
++ * to the list of protocol names advertised by the server during the Ne=
xt
++ * Protocol Negotiation (NPN) portion of the SSL handshake.  The hook c=
allee is
++ * given the connection and an APR array; it should push one or more ch=
ar*'s
++ * pointing to null-terminated strings (such as "http/1.1" or "spdy/2")=
 onto
++ * the array and return OK, or do nothing and return DECLINED. */
++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_advertise_protos_hook,
++                          (conn_rec *connection, apr_array_header_t *pr=
otos));
++
++/** The npn_proto_negotiated optional hook allows other modules to disc=
over the
++ * name of the protocol that was chosen during the Next Protocol Negoti=
ation
++ * (NPN) portion of the SSL handshake.  Note that this may be the empty=
 string
++ * (in which case modules should probably assume HTTP), or it may be a =
protocol
++ * that was never even advertised by the server.  The hook callee is gi=
ven the
++ * connection, a non-null-terminated string containing the protocol nam=
e, and
++ * the length of the string; it should do something appropriate (i.e. i=
nsert or
++ * remove filters) and return OK, or do nothing and return DECLINED. */
++APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_proto_negotiated_hook,
++                          (conn_rec *connection, const char *proto_name=
,
++                           apr_size_t proto_name_len));
++
+ #endif /* __MOD_SSL_H__ */
+ /** @} */
+--- httpd-2.4.2/modules/ssl/ssl_engine_init.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_init.c
+@@ -681,6 +681,11 @@
+ #endif
+=20
+     SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
++
++#ifdef HAVE_TLS_NPN
++    SSL_CTX_set_next_protos_advertised_cb(
++        ctx, ssl_callback_AdvertiseNextProtos, NULL);
++#endif
+ }
+=20
+ static void ssl_init_ctx_verify(server_rec *s,
+--- httpd-2.4.2/modules/ssl/ssl_engine_io.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_io.c
+@@ -28,6 +28,7 @@
+                                   core keeps dumping.''
+                                             -- Unknown    */
+ #include "ssl_private.h"
++#include "mod_ssl.h"
+ #include "apr_date.h"
+=20
+ /*  _________________________________________________________________
+@@ -297,6 +298,7 @@
+     apr_pool_t *pool;
+     char buffer[AP_IOBUFSIZE];
+     ssl_filter_ctx_t *filter_ctx;
++    int npn_finished;  /* 1 if NPN has finished, 0 otherwise */
+ } bio_filter_in_ctx_t;
+=20
+ /*
+@@ -1374,6 +1376,27 @@
+         APR_BRIGADE_INSERT_TAIL(bb, bucket);
+     }
+=20
++#ifdef HAVE_TLS_NPN
++    /* By this point, Next Protocol Negotiation (NPN) should be complet=
ed (if
++     * our version of OpenSSL supports it).  If we haven't already, fin=
d out
++     * which protocol was decided upon and inform other modules by call=
ing
++     * npn_proto_negotiated_hook. */
++    if (!inctx->npn_finished) {
++        const unsigned char *next_proto =3D NULL;
++        unsigned next_proto_len =3D 0;
++
++        SSL_get0_next_proto_negotiated(
++            inctx->ssl, &next_proto, &next_proto_len);
++        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, APR_SUCCESS, f->c,
++                      "SSL NPN negotiated protocol: '%s'",
++                      apr_pstrmemdup(f->c->pool, (const char*)next_prot=
o,
++                                     next_proto_len));
++        modssl_run_npn_proto_negotiated_hook(
++            f->c, (const char*)next_proto, next_proto_len);
++        inctx->npn_finished =3D 1;
++    }
++#endif
++
+     return APR_SUCCESS;
+ }
+=20
+@@ -1855,6 +1878,7 @@
+     inctx->block =3D APR_BLOCK_READ;
+     inctx->pool =3D c->pool;
+     inctx->filter_ctx =3D filter_ctx;
++    inctx->npn_finished =3D 0;
+ }
+=20
+ /* The request_rec pointer is passed in here only to ensure that the
+--- httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
++++ httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
+@@ -29,6 +29,7 @@
+                                   time I was too famous.''
+                                             -- Unknown                *=
/
+ #include "ssl_private.h"
++#include "mod_ssl.h"
+ #include "util_md5.h"
+=20
+ static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
+@@ -2143,3 +2144,84 @@
+     return -1;
+ }
+ #endif
++
++#ifdef HAVE_TLS_NPN
++/*
++ * This callback function is executed when SSL needs to decide what pro=
tocols
++ * to advertise during Next Protocol Negotiation (NPN).  It must produc=
e a
++ * string in wire format -- a sequence of length-prefixed strings -- in=
dicating
++ * the advertised protocols.  Refer to SSL_CTX_set_next_protos_advertis=
ed_cb
++ * in OpenSSL for reference.
++ */
++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **da=
ta_out,
++                                     unsigned int *size_out, void *arg)
++{
++    conn_rec *c =3D (conn_rec*)SSL_get_app_data(ssl);
++    apr_array_header_t *protos;
++    int num_protos;
++    unsigned int size;
++    int i;
++    unsigned char *data;
++    unsigned char *start;
++
++    *data_out =3D NULL;
++    *size_out =3D 0;
++
++    /* If the connection object is not available, then there's nothing =
for us
++     * to do. */
++    if (c =3D=3D NULL) {
++        return SSL_TLSEXT_ERR_OK;
++    }
++
++    /* Invoke our npn_advertise_protos hook, giving other modules a cha=
nce to
++     * add alternate protocol names to advertise. */
++    protos =3D apr_array_make(c->pool, 0, sizeof(char*));
++    modssl_run_npn_advertise_protos_hook(c, protos);
++    num_protos =3D protos->nelts;
++
++    /* We now have a list of null-terminated strings; we need to concat=
enate
++     * them together into a single string, where each protocol name is =
prefixed
++     * by its length.  First, calculate how long that string will be. *=
/
++    size =3D 0;
++    for (i =3D 0; i < num_protos; ++i) {
++        const char *string =3D APR_ARRAY_IDX(protos, i, const char*);
++        unsigned int length =3D strlen(string);
++        /* If the protocol name is too long (the length must fit in one=
 byte),
++         * then log an error and skip it. */
++        if (length > 255) {
++            ap_log_cerror(APLOG_MARK, APLOG_ERR, 0, c,
++                          "SSL NPN protocol name too long (length=3D%u)=
: %s",
++                          length, string);
++            continue;
++        }
++        /* Leave room for the length prefix (one byte) plus the protoco=
l name
++         * itself. */
++        size +=3D 1 + length;
++    }
++
++    /* If there is nothing to advertise (either because no modules adde=
d
++     * anything to the protos array, or because all strings added to th=
e array
++     * were skipped), then we're done. */
++    if (size =3D=3D 0) {
++        return SSL_TLSEXT_ERR_OK;
++    }
++
++    /* Now we can build the string.  Copy each protocol name string int=
o the
++     * larger string, prefixed by its length. */
++    data =3D apr_palloc(c->pool, size * sizeof(unsigned char));
++    start =3D data;
++    for (i =3D 0; i < num_protos; ++i) {
++        const char *string =3D APR_ARRAY_IDX(protos, i, const char*);
++        apr_size_t length =3D strlen(string);
++        *start =3D (unsigned char)length;
++        ++start;
++        memcpy(start, string, length * sizeof(unsigned char));
++        start +=3D length;
++    }
++
++    /* Success. */
++    *data_out =3D data;
++    *size_out =3D size;
++    return SSL_TLSEXT_ERR_OK;
++}
++#endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/replace-l=
ynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apac=
he2/apache2-2.4.3/replace-lynx-to-curl-in-apachectl-script.patch
new file mode 100644
index 0000000..584ddc8
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/replace-lynx-to-=
curl-in-apachectl-script.patch
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
+ # programs may work. =20
+-LYNX=3D"@LYNX_PATH@ -dump"
++CURL=3D"/usr/bin/curl"
+ #
+ # the URL to your server's mod_status status page.  If you do not
+ # have one, then status and fullstatus will not work.
+-STATUSURL=3D"http://localhost:@PORT@/server-status"
++STATUSURL=3D"http://localhost:@PORT@/"
+ #
+ # Set this variable to a command that increases the maximum
+ # number of file descriptors allowed per child process. This is
+@@ -91,10 +91,16 @@ configtest)
+     ERROR=3D$?
+     ;;
+ status)
+-    $LYNX $STATUSURL | awk ' /process$/ { print; exit } { print } '
++    $CURL -s $STATUSURL | grep -o "It works!"
++    if [ $? !=3D 0 ] ; then
++        echo The httpd server does not work!
++    fi
+     ;;
+ fullstatus)
+-    $LYNX $STATUSURL
++    $CURL -s $STATUSURL | grep -o "It works!"
++    if [ $? !=3D 0 ] ; then
++        echo The httpd server does not work!
++    fi
+     ;;
+ *)
+     $HTTPD $ARGV
+--=20
+1.6.4
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/server-ma=
kefile.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/server-=
makefile.patch
new file mode 100644
index 0000000..f1349cb
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/server-makefile.=
patch
@@ -0,0 +1,11 @@
+--- http-2.0.54/server/Makefile.in-old	2005-12-20 13:26:56.000000000 -05=
00
++++ http-2.0.54/server/Makefile.in	2005-12-20 13:27:22.000000000 -0500
+@@ -27,7 +27,7 @@
+ 	$(LINK) $(EXTRA_LDFLAGS) $(gen_test_char_OBJECTS) $(EXTRA_LIBS)
+=20
+ test_char.h: gen_test_char
+-	./gen_test_char > test_char.h
++	gen_test_char > test_char.h
+=20
+ util.lo: test_char.h
+=20
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb=
 b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
deleted file mode 100644
index 17482ae..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.2.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION =3D "The Apache HTTP Server is a powerful, efficient, and \
-extensible web server."
-SUMMARY =3D "Apache HTTP Server"
-HOMEPAGE =3D "http://httpd.apache.org/"
-DEPENDS =3D "expat-native pcre-native apr-native apr-util-native"
-SECTION =3D "net"
-LICENSE =3D "Apache-2.0"
-PR =3D "r0"
-
-inherit native
-
-SRC_URI =3D "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
-
-S =3D "${WORKDIR}/httpd-${PV}"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deff226ae95d0516d6210ed77dfdf2=
dcc"
-SRC_URI[md5sum] =3D "6bb12f726e22656f0ad2baf91f1f8329"
-SRC_URI[sha256sum] =3D "5382f9c507d3d02706e33d6308ea041f39e8511b5948aef0=
ca188df8f90159b8"
-
-do_configure () {
-	./configure --with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
-		--with-apr-util=3D${STAGING_BINDIR_CROSS}/apu-1-config \
-		--prefix=3D${prefix} --datadir=3D${datadir}/apache2
-}
-
-do_install () {
-	install -d ${D}${bindir} ${D}${libdir}
-	cp server/gen_test_char ${D}${bindir}
-	install -m 755 support/apxs ${D}${bindir}/
-	install -m 755 httpd ${D}${bindir}/
-	install -d ${D}${datadir}/apache2/build
-	cp build/*.mk ${D}${datadir}/apache2/build
-	cp build/instdso.sh ${D}${datadir}/apache2/build
-
-	install -d ${D}${includedir}/apache2
-	cp include/* ${D}${includedir}/apache2
-	cp os/unix/os.h ${D}${includedir}/apache2
-	cp os/unix/unixd.h ${D}${includedir}/apache2
-
-	cp support/envvars-std ${D}${bindir}/envvars
-	chmod 755 ${D}${bindir}/envvars
-}
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb=
 b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb
new file mode 100644
index 0000000..230510c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb
@@ -0,0 +1,43 @@
+DESCRIPTION =3D "The Apache HTTP Server is a powerful, efficient, and \
+extensible web server."
+SUMMARY =3D "Apache HTTP Server"
+HOMEPAGE =3D "http://httpd.apache.org/"
+DEPENDS =3D "expat-native pcre-native apr-native apr-util-native"
+SECTION =3D "net"
+LICENSE =3D "Apache-2.0"
+PR =3D "r0"
+
+inherit native
+
+SRC_URI =3D "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
+
+S =3D "${WORKDIR}/httpd-${PV}"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deff226ae95d0516d6210ed77dfdf2=
dcc"
+SRC_URI[md5sum] =3D "87aaf7bc7e8715f0455997bb8c6791aa"
+SRC_URI[sha256sum] =3D "d82102b9c111f1892fb20a2bccf4370de579c6521b2f172e=
d0b36f2759fb249e"
+
+do_configure () {
+	./configure --with-apr=3D${STAGING_BINDIR_CROSS}/apr-1-config \
+		--with-apr-util=3D${STAGING_BINDIR_CROSS}/apu-1-config \
+		--prefix=3D${prefix} --datadir=3D${datadir}/apache2
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
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb b/meta=
-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
deleted file mode 100644
index af7840d..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.2.bb
+++ /dev/null
@@ -1,144 +0,0 @@
-DESCRIPTION =3D "The Apache HTTP Server is a powerful, efficient, and \
-extensible web server."
-SUMMARY =3D "Apache HTTP Server"
-HOMEPAGE =3D "http://httpd.apache.org/"
-DEPENDS =3D "libtool-native apache2-native openssl expat pcre apr apr-ut=
il"
-SECTION =3D "net"
-LICENSE =3D "Apache-2.0"
-PR =3D "r3"
-
-SRC_URI =3D "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
-           file://server-makefile.patch \
-           file://httpd-2.4.1-corelimit.patch \
-           file://httpd-2.4.1-export.patch \
-           file://httpd-2.4.1-selinux.patch \
-           file://httpd-2.4.2-r1326980+.patch \
-           file://httpd-2.4.2-r1327036+.patch \
-           file://httpd-2.4.2-r1332643.patch \
-           file://httpd-2.4.2-r1337344+.patch \
-           file://httpd-2.4.2-restart.patch \
-           file://apache-configure_perlbin.patch \
-           file://replace-lynx-to-curl-in-apachectl-script.patch \
-           file://apache-ssl-ltmain-rpath.patch \
-           file://init"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deff226ae95d0516d6210ed77dfdf2=
dcc"
-SRC_URI[md5sum] =3D "6bb12f726e22656f0ad2baf91f1f8329"
-SRC_URI[sha256sum] =3D "5382f9c507d3d02706e33d6308ea041f39e8511b5948aef0=
ca188df8f90159b8"
-
-S =3D "${WORKDIR}/httpd-${PV}"
-
-inherit autotools update-rc.d
-
-CFLAGS_append =3D " -DPATH_MAX=3D4096"
-CFLAGS_prepend =3D "-I${STAGING_INCDIR}/openssl "
-EXTRA_OECONF =3D "--enable-ssl \
-		--with-ssl=3D${STAGING_LIBDIR}/.. \
-		--with-expat=3D${STAGING_LIBDIR}/.. \
-		--with-apr=3D${WORKDIR}/apr-1-config \
-		--with-apr-util=3D${WORKDIR}/apu-1-config \
-		--enable-info \
-		--enable-rewrite \
-		--with-dbm=3Dsdbm \
-		--with-berkeley-db=3Dno \
-		--localstatedir=3D/var/${PN} \
-		--with-gdbm=3Dno \
-		--with-ndbm=3Dno \
-		--includedir=3D${includedir}/${PN} \
-		--datadir=3D${datadir}/${PN} \
-		--sysconfdir=3D${sysconfdir}/${PN} \
-                --libexecdir=3D${libdir}/${PN}/modules \
-		ap_cv_void_ptr_lt_long=3Dno \
-		--enable-mpms-shared \
-		ac_cv_have_threadsafe_pollset=3Dno"
-
-do_configure_prepend() {
-	# FIXME: this hack is required to work around an issue with apr/apr-uti=
l
-	# Can be removed when fixed in OE-Core (also revert --with-* options ab=
ove)
-	# see http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3267
-	cp ${STAGING_BINDIR_CROSS}/apr-1-config ${STAGING_BINDIR_CROSS}/apu-1-c=
onfig ${WORKDIR}
-	sed -i -e 's:location=3Dsource:location=3Dinstalled:' ${WORKDIR}/apr-1-=
config
-	sed -i -e 's:location=3Dsource:location=3Dinstalled:' ${WORKDIR}/apu-1-=
config
-}
-
-do_install_append() {
-	install -d ${D}/${sysconfdir}/init.d
-	cat ${WORKDIR}/init | \
-		sed -e 's,/usr/sbin/,${sbindir}/,g' \
-		    -e 's,/usr/bin/,${bindir}/,g' \
-		    -e 's,/usr/lib,${libdir}/,g' \
-		    -e 's,/etc/,${sysconfdir}/,g' \
-		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
-	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
-	# remove the goofy original files...
-	rm -rf ${D}/${sysconfdir}/${PN}/original
-	# Expat should be found in the staging area via DEPENDS...
-	rm -f ${D}/${libdir}/libexpat.*
-
-	install -d ${D}${sysconfdir}/${PN}/conf.d
-	install -d ${D}${sysconfdir}/${PN}/modules.d
-
-	# Ensure configuration file pulls in conf.d and modules.d
-	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >> ${D}/${=
sysconfdir}/${PN}/httpd.conf
-	printf "\nIncludeOptional ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >> =
${D}/${sysconfdir}/${PN}/httpd.conf
-}
-
-SYSROOT_PREPROCESS_FUNCS +=3D "apache_sysroot_preprocess"
-
-apache_sysroot_preprocess () {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscrip=
ts}/
-	sed -i 's!my $installbuilddir =3D .*!my $installbuilddir =3D "${STAGING=
_DIR_HOST}/${datadir}/${PN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscr=
ipts}/apxs
-	sed -i 's!my $libtool =3D .*!my $libtool =3D "${STAGING_BINDIR_CROSS}/$=
{TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
-
-	sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/apr=
-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-	sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/apu=
-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-	sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache2!'=
 ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-}
-
-#
-# implications - used by update-rc.d scripts
-#
-INITSCRIPT_NAME =3D "apache2"
-INITSCRIPT_PARAMS =3D "defaults 91 20"
-LEAD_SONAME =3D "libapr-1.so.0"
-
-PACKAGES =3D "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
-
-CONFFILES_${PN} =3D "${sysconfdir}/${PN}/httpd.conf \
-		   ${sysconfdir}/${PN}/magic \
-		   ${sysconfdir}/${PN}/mime.types \
-		   ${sysconfdir}/init.d/${PN} "
-
-# we override here rather than append so that .so links are
-# included in the runtime package rather than here (-dev)
-# and to get build, icons, error into the -dev package
-FILES_${PN}-dev =3D "${datadir}/${PN}/build \
-		${datadir}/${PN}/icons \
-		${datadir}/${PN}/error \
-		${bindir}/apr-config ${bindir}/apu-config \
-		${libdir}/apr*.exp \
-		${includedir}/${PN} \
-		${libdir}/*.la \
-		${libdir}/*.a"
-
-# manual to manual
-FILES_${PN}-doc +=3D " ${datadir}/${PN}/manual"
-
-#
-# override this too - here is the default, less datadir
-#
-FILES_${PN} =3D  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.*=
 ${sysconfdir} \
-		${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
-		${libdir}/${PN}"
-
-# we want htdocs and cgi-bin to go with the binary
-FILES_${PN} +=3D "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
-
-#make sure the lone .so links also get wrapped in the base package
-FILES_${PN} +=3D "${libdir}/lib*.so ${libdir}/pkgconfig/*"
-
-FILES_${PN}-dbg +=3D "${libdir}/${PN}/modules/.debug"
-
-RDEPENDS_${PN} +=3D "openssl libgcc"
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb b/meta=
-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
new file mode 100644
index 0000000..9179bca
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
@@ -0,0 +1,140 @@
+DESCRIPTION =3D "The Apache HTTP Server is a powerful, efficient, and \
+extensible web server."
+SUMMARY =3D "Apache HTTP Server"
+HOMEPAGE =3D "http://httpd.apache.org/"
+DEPENDS =3D "libtool-native apache2-native openssl expat pcre apr apr-ut=
il"
+SECTION =3D "net"
+LICENSE =3D "Apache-2.0"
+PR =3D "r0"
+
+SRC_URI =3D "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+           file://server-makefile.patch \
+           file://httpd-2.4.1-corelimit.patch \
+           file://httpd-2.4.1-export.patch \
+           file://httpd-2.4.1-selinux.patch \
+           file://httpd-2.4.2-r1332643.patch \
+           file://apache-configure_perlbin.patch \
+           file://replace-lynx-to-curl-in-apachectl-script.patch \
+           file://apache-ssl-ltmain-rpath.patch \
+           file://init"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Deff226ae95d0516d6210ed77dfdf2=
dcc"
+SRC_URI[md5sum] =3D "87aaf7bc7e8715f0455997bb8c6791aa"
+SRC_URI[sha256sum] =3D "d82102b9c111f1892fb20a2bccf4370de579c6521b2f172e=
d0b36f2759fb249e"
+
+S =3D "${WORKDIR}/httpd-${PV}"
+
+inherit autotools update-rc.d
+
+CFLAGS_append =3D " -DPATH_MAX=3D4096"
+CFLAGS_prepend =3D "-I${STAGING_INCDIR}/openssl "
+EXTRA_OECONF =3D "--enable-ssl \
+		--with-ssl=3D${STAGING_LIBDIR}/.. \
+		--with-expat=3D${STAGING_LIBDIR}/.. \
+		--with-apr=3D${WORKDIR}/apr-1-config \
+		--with-apr-util=3D${WORKDIR}/apu-1-config \
+		--enable-info \
+		--enable-rewrite \
+		--with-dbm=3Dsdbm \
+		--with-berkeley-db=3Dno \
+		--localstatedir=3D/var/${PN} \
+		--with-gdbm=3Dno \
+		--with-ndbm=3Dno \
+		--includedir=3D${includedir}/${PN} \
+		--datadir=3D${datadir}/${PN} \
+		--sysconfdir=3D${sysconfdir}/${PN} \
+                --libexecdir=3D${libdir}/${PN}/modules \
+		ap_cv_void_ptr_lt_long=3Dno \
+		--enable-mpms-shared \
+		ac_cv_have_threadsafe_pollset=3Dno"
+
+do_configure_prepend() {
+	# FIXME: this hack is required to work around an issue with apr/apr-uti=
l
+	# Can be removed when fixed in OE-Core (also revert --with-* options ab=
ove)
+	# see http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3267
+	cp ${STAGING_BINDIR_CROSS}/apr-1-config ${STAGING_BINDIR_CROSS}/apu-1-c=
onfig ${WORKDIR}
+	sed -i -e 's:location=3Dsource:location=3Dinstalled:' ${WORKDIR}/apr-1-=
config
+	sed -i -e 's:location=3Dsource:location=3Dinstalled:' ${WORKDIR}/apu-1-=
config
+}
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/init.d
+	cat ${WORKDIR}/init | \
+		sed -e 's,/usr/sbin/,${sbindir}/,g' \
+		    -e 's,/usr/bin/,${bindir}/,g' \
+		    -e 's,/usr/lib,${libdir}/,g' \
+		    -e 's,/etc/,${sysconfdir}/,g' \
+		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
+	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
+	# remove the goofy original files...
+	rm -rf ${D}/${sysconfdir}/${PN}/original
+	# Expat should be found in the staging area via DEPENDS...
+	rm -f ${D}/${libdir}/libexpat.*
+
+	install -d ${D}${sysconfdir}/${PN}/conf.d
+	install -d ${D}${sysconfdir}/${PN}/modules.d
+
+	# Ensure configuration file pulls in conf.d and modules.d
+	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >> ${D}/${=
sysconfdir}/${PN}/httpd.conf
+	printf "\nIncludeOptional ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >> =
${D}/${sysconfdir}/${PN}/httpd.conf
+}
+
+SYSROOT_PREPROCESS_FUNCS +=3D "apache_sysroot_preprocess"
+
+apache_sysroot_preprocess () {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscrip=
ts}/
+	sed -i 's!my $installbuilddir =3D .*!my $installbuilddir =3D "${STAGING=
_DIR_HOST}/${datadir}/${PN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscr=
ipts}/apxs
+	sed -i 's!my $libtool =3D .*!my $libtool =3D "${STAGING_BINDIR_CROSS}/$=
{TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+
+	sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/apr=
-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+	sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/apu=
-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+	sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache2!'=
 ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+}
+
+#
+# implications - used by update-rc.d scripts
+#
+INITSCRIPT_NAME =3D "apache2"
+INITSCRIPT_PARAMS =3D "defaults 91 20"
+LEAD_SONAME =3D "libapr-1.so.0"
+
+PACKAGES =3D "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
+
+CONFFILES_${PN} =3D "${sysconfdir}/${PN}/httpd.conf \
+		   ${sysconfdir}/${PN}/magic \
+		   ${sysconfdir}/${PN}/mime.types \
+		   ${sysconfdir}/init.d/${PN} "
+
+# we override here rather than append so that .so links are
+# included in the runtime package rather than here (-dev)
+# and to get build, icons, error into the -dev package
+FILES_${PN}-dev =3D "${datadir}/${PN}/build \
+		${datadir}/${PN}/icons \
+		${datadir}/${PN}/error \
+		${bindir}/apr-config ${bindir}/apu-config \
+		${libdir}/apr*.exp \
+		${includedir}/${PN} \
+		${libdir}/*.la \
+		${libdir}/*.a"
+
+# manual to manual
+FILES_${PN}-doc +=3D " ${datadir}/${PN}/manual"
+
+#
+# override this too - here is the default, less datadir
+#
+FILES_${PN} =3D  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.*=
 ${sysconfdir} \
+		${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
+		${libdir}/${PN}"
+
+# we want htdocs and cgi-bin to go with the binary
+FILES_${PN} +=3D "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
+
+#make sure the lone .so links also get wrapped in the base package
+FILES_${PN} +=3D "${libdir}/lib*.so ${libdir}/pkgconfig/*"
+
+FILES_${PN}-dbg +=3D "${libdir}/${PN}/modules/.debug"
+
+RDEPENDS_${PN} +=3D "openssl libgcc"
+
--=20
1.7.11.7



