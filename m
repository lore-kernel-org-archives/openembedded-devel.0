Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9BaX-00028G-Pl
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:59:00 +0200
Received: by iwn35 with SMTP id 35so593301iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=/YN8LecMLf53EydIM+RejD1M34ABlZ2FpJZuiqvtJuM=;
	b=CYejF6RCBEc3yd03Iq2Yhe9qfuGdx83DtM5ZlR2sZYDMN7q1FaEqKkdkCvnj0bwOZt
	ZJ3FHGSPHypq7tHi93je+Z2UPm3YY/wj2Q69pagHgHeFOi/o/8rWp4IpXMiyvAuL9led
	U13XOmYBupqOgefp2DcFFgMRdMfgewPQDzvCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=djQEGVPA7Npmxd0sExXC+LUBwSen/08hvsGfaniAeYnyzhq66iJV4iclEDOwi8QxoZ
	OpnuYoGl4w59Wz2+8nIY0RAfKxjNEhIaAWALXyIqXcetf7uQ8SqTjQ8a9dq3Y3B9j6mC
	PU+QCbJ5LhslDLG9PfbPlcRTgydmCReBkMRJo=
Received: by 10.231.157.195 with SMTP id c3mr2003839ibx.155.1287730694583;
	Thu, 21 Oct 2010 23:58:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w9sm2787396ibc.7.2010.10.21.23.58.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:58:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 23:58:00 -0700
Message-Id: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] libtool: Rename --with-sysroot to --with-libtool-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 06:59:00 -0000

* To avoid name conflict with binutils and gcc we rename the option
* We also stage the cross and native libtool in same relative path
  so it can be accessed equally well from recipes using BBCLASSEXTEND = "native"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtool/libtool-2.4/rename-with-sysroot.patch  |  823 ++++++++++++++++++++
 recipes/libtool/libtool-cross_2.2.6b.bb            |    9 +-
 recipes/libtool/libtool-cross_2.4.bb               |   10 +-
 recipes/libtool/libtool-native_2.4.bb              |    2 +-
 recipes/libtool/libtool.inc                        |    3 +-
 5 files changed, 837 insertions(+), 10 deletions(-)
 create mode 100644 recipes/libtool/libtool-2.4/rename-with-sysroot.patch

diff --git a/recipes/libtool/libtool-2.4/rename-with-sysroot.patch b/recipes/libtool/libtool-2.4/rename-with-sysroot.patch
new file mode 100644
index 0000000..6b0d30e
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/rename-with-sysroot.patch
@@ -0,0 +1,823 @@
+This patch rename --with-sysroot option to --with-libtool-sysroot to avoid
+namespace conflict with binutils, gcc and other toolchain components
+
+I also reported the problem to libtool here
+
+http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
+
+-Khem
+
+Index: libtool-2.4/configure
+===================================================================
+--- libtool-2.4.orig/configure
++++ libtool-2.4/configure
+@@ -786,7 +786,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ with_gnu_ld
+ '
+@@ -1451,7 +1451,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -6798,29 +6798,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/libltdl/configure
+===================================================================
+--- libtool-2.4.orig/libltdl/configure
++++ libtool-2.4/libltdl/configure
+@@ -739,7 +739,7 @@ with_pic
+ enable_fast_install
+ enable_dependency_tracking
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ enable_ltdl_install
+ '
+@@ -1388,7 +1388,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -6004,29 +6004,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/libltdl/m4/libtool.m4
+===================================================================
+--- libtool-2.4.orig/libltdl/m4/libtool.m4
++++ libtool-2.4/libltdl/m4/libtool.m4
+@@ -1180,27 +1180,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
+ # ----------------
+ AC_DEFUN([_LT_WITH_SYSROOT],
+ [AC_MSG_CHECKING([for sysroot])
+-AC_ARG_WITH([sysroot],
+-[  --with-sysroot[=DIR] Search for dependent libraries within DIR
++AC_ARG_WITH([libtool-sysroot],
++[  --with-libtool-sysroot[=DIR] Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).],
+-[], [with_sysroot=no])
++[], [with_libtool_sysroot=no])
+ 
+ dnl lt_sysroot will always be passed unquoted.  We quote it here
+ dnl in case the user passed a directory name.
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   AC_MSG_RESULT([${with_sysroot}])
++   AC_MSG_RESULT([${with_libtool_sysroot}])
+    AC_MSG_ERROR([The sysroot must be an absolute path.])
+    ;;
+ esac
+Index: libtool-2.4/tests/cdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/cdemo/configure
++++ libtool-2.4/tests/cdemo/configure
+@@ -726,7 +726,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1373,7 +1373,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5884,29 +5884,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/demo/configure
+===================================================================
+--- libtool-2.4.orig/tests/demo/configure
++++ libtool-2.4/tests/demo/configure
+@@ -730,7 +730,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1377,7 +1377,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5882,29 +5882,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/depdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/depdemo/configure
++++ libtool-2.4/tests/depdemo/configure
+@@ -728,7 +728,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1375,7 +1375,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5879,29 +5879,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/f77demo/configure
+===================================================================
+--- libtool-2.4.orig/tests/f77demo/configure
++++ libtool-2.4/tests/f77demo/configure
+@@ -730,7 +730,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1382,7 +1382,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -6864,29 +6864,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/fcdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/fcdemo/configure
++++ libtool-2.4/tests/fcdemo/configure
+@@ -731,7 +731,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1383,7 +1383,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -6963,29 +6963,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/mdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/mdemo/configure
++++ libtool-2.4/tests/mdemo/configure
+@@ -734,7 +734,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1381,7 +1381,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5911,29 +5911,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/mdemo2/configure
+===================================================================
+--- libtool-2.4.orig/tests/mdemo2/configure
++++ libtool-2.4/tests/mdemo2/configure
+@@ -726,7 +726,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1373,7 +1373,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5884,29 +5884,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/pdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/pdemo/configure
++++ libtool-2.4/tests/pdemo/configure
+@@ -729,7 +729,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ '
+       ac_precious_vars='build_alias
+@@ -1376,7 +1376,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -5887,29 +5887,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/sysroot.at
+===================================================================
+--- libtool-2.4.orig/tests/sysroot.at
++++ libtool-2.4/tests/sysroot.at
+@@ -64,7 +64,7 @@ while read file; do
+ done])
+ 
+ LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
+-configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
++configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
+ 
+ #???
+ if test "$shlibpath_var" = PATH; then
+@@ -114,7 +114,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([lib2.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ ]])
+@@ -155,7 +155,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([prog.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ ]])
+Index: libtool-2.4/tests/tagdemo/configure
+===================================================================
+--- libtool-2.4.orig/tests/tagdemo/configure
++++ libtool-2.4/tests/tagdemo/configure
+@@ -736,7 +736,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
+-with_sysroot
++with_libtool_sysroot
+ enable_libtool_lock
+ with_gnu_ld
+ '
+@@ -1392,7 +1392,7 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+-  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
+                         (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+@@ -6907,29 +6907,29 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
+ $as_echo_n "checking for sysroot... " >&6; }
+ 
+-# Check whether --with-sysroot was given.
+-if test "${with_sysroot+set}" = set; then :
+-  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
+ else
+-  with_sysroot=no
++  with_libtool_sysroot=no
+ fi
+ 
+ 
+ lt_sysroot=
+-case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
+  yes)
+    if test "$GCC" = yes; then
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+    fi
+    ;; #(
+  /*)
+-   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
+    ;; #(
+  no|'')
+    ;; #(
+  *)
+-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
+-$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
+    as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
+    ;;
+ esac
+Index: libtool-2.4/tests/testsuite
+===================================================================
+--- libtool-2.4.orig/tests/testsuite
++++ libtool-2.4/tests/testsuite
+@@ -25277,7 +25277,7 @@ $at_traceon; }
+ 
+ 
+ LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
+-configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
++configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
+ 
+ #???
+ if test "$shlibpath_var" = PATH; then
+@@ -25475,7 +25475,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([lib2.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
+@@ -25652,7 +25652,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([prog.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
+@@ -25993,7 +25993,7 @@ $at_traceon; }
+ 
+ 
+ LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
+-configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
++configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
+ 
+ #???
+ if test "$shlibpath_var" = PATH; then
+@@ -26191,7 +26191,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([lib2.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
+@@ -26368,7 +26368,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([prog.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
+@@ -26709,7 +26709,7 @@ $at_traceon; }
+ 
+ 
+ LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
+-configure_options="$configure_options --with-sysroot=$sysroot --prefix=$prefix"
++configure_options="$configure_options --with-libtool-sysroot=$sysroot --prefix=$prefix"
+ 
+ #???
+ if test "$shlibpath_var" = PATH; then
+@@ -26907,7 +26907,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([lib2.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
+@@ -27084,7 +27084,7 @@ AM_INIT_AUTOMAKE([foreign])
+ AC_PROG_CC
+ AC_CONFIG_SRCDIR([prog.c])
+ LT_INIT
+-sysroot=$with_sysroot
++sysroot=$with_libtool_sysroot
+ AC_SUBST([sysroot])
+ AC_OUTPUT(Makefile)
+ _ATEOF
diff --git a/recipes/libtool/libtool-cross_2.2.6b.bb b/recipes/libtool/libtool-cross_2.2.6b.bb
index e9461c7..ff7771a 100644
--- a/recipes/libtool/libtool-cross_2.2.6b.bb
+++ b/recipes/libtool/libtool-cross_2.2.6b.bb
@@ -1,5 +1,5 @@
 require libtool_${PV}.bb
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "\
   file://cross_compile.patch \
@@ -27,10 +27,11 @@ do_install () {
 	install -d ${D}${bindir}/
 	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
 	install -d ${D}${datadir}/libtool/
+	install -d ${D}${datadir}/libtool/config/
 	install -d ${D}${datadir}/aclocal/
-	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
-	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
-	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
+	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/config/
+	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/config/
 	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
 	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
 	if [ -e ${WORKDIR}/dolt.m4 ] ; then
diff --git a/recipes/libtool/libtool-cross_2.4.bb b/recipes/libtool/libtool-cross_2.4.bb
index 709e18e..db3219d 100644
--- a/recipes/libtool/libtool-cross_2.4.bb
+++ b/recipes/libtool/libtool-cross_2.4.bb
@@ -1,5 +1,5 @@
 require libtool.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -21,10 +21,11 @@ do_install () {
         install -d ${D}${bindir}/
         install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
         install -d ${D}${datadir}/libtool/
+        install -d ${D}${datadir}/libtool/config
         install -d ${D}${datadir}/aclocal/
-        install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
-        install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
-        install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
+        install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/config/
+        install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/config/
+        install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/config/
         install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
         install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
 }
@@ -35,3 +36,4 @@ libtoolcross_sysroot_preprocess () {
         install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/
         install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool
 }
+NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/libtool/libtool-native_2.4.bb b/recipes/libtool/libtool-native_2.4.bb
index 0fd2ec8..e580f13 100644
--- a/recipes/libtool/libtool-native_2.4.bb
+++ b/recipes/libtool/libtool-native_2.4.bb
@@ -11,7 +11,7 @@ SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
 SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
 
 inherit native
-EXTRA_OECONF = " --with-sysroot=${STAGING_DIR_NATIVE}"
+EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
 do_configure_prepend () {
         # Remove any existing libtool m4 since old stale versions would break
         # any upgrade
diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
index 97fdb30..6f439ac 100644
--- a/recipes/libtool/libtool.inc
+++ b/recipes/libtool/libtool.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
 LICENSE = "GPL"
 SECTION = "devel"
 
-INC_PR = "r26"
+INC_PR = "r27"
 
 FILESPATHPKG=. "libtool-${PV}:"
 
@@ -17,6 +17,7 @@ FILESPATHPKG=. "libtool-${PV}:"
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
 	   file://prefix-manpage-fix.patch \
+	   file://rename-with-sysroot.patch \
 	   file://resolve-sysroot.patch \
 	   file://use-sysroot-in-libpath.patch \
           "
-- 
1.7.1



