Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9Bak-0002A5-B6
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:59:07 +0200
Received: by iwn35 with SMTP id 35so593428iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=jyj3YXwN3/rKz966mJ6o005PMj94tCCQDzZKACEalz0=;
	b=K1CXMlnjme7VjpFHfCg3DpIshdUdsd3FvtN/YsQOA4x4NRBx/hhw9034mSUBggmIn7
	hzJR/AhzJnMgwGhaTbU5KyEmzJp1Gxcw6o3Lk3kYqe3V1FG5FN735m52NVf7GrXfaWmd
	e4Fc5L133UU7mj2H+64fNutFqIPBqyJkY5jKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gYzEUyBHYg8ch9nYOS9HXGBAX3TNPsP8fqo8bP/MwYwOTywZmyNfS5ld3rMQC5D6ZB
	IkSR6qHzE4LcLpcxxbryYKrX2/DQbxGDYzKEeTPK5dpfyXYlJCZWbkL9+Kg/Tw1+HGmj
	hPG2KfLBvAPyossW/pnTKFgX365im8Zgkwp5I=
Received: by 10.231.10.66 with SMTP id o2mr1955473ibo.158.1287730700776;
	Thu, 21 Oct 2010 23:58:20 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w9sm2787396ibc.7.2010.10.21.23.58.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 23:58:03 -0700
Message-Id: <1287730684-14143-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5] binutils: Update libtool macros to reflect --with-sysroot -> --with-libtool-sysroot rename
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
X-List-Received-Date: Fri, 22 Oct 2010 06:59:07 -0000

* We dont need to filter out with-sysroot anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils-2.20.1/libtool-2.4-update.patch       |  128 ++++++++++----------
 recipes/binutils/binutils.inc                      |    6 +-
 2 files changed, 65 insertions(+), 69 deletions(-)

diff --git a/recipes/binutils/binutils-2.20.1/libtool-2.4-update.patch b/recipes/binutils/binutils-2.20.1/libtool-2.4-update.patch
index dcb20e9..f3a9203 100644
--- a/recipes/binutils/binutils-2.20.1/libtool-2.4-update.patch
+++ b/recipes/binutils/binutils-2.20.1/libtool-2.4-update.patch
@@ -7262,26 +7262,26 @@ Index: binutils-2.20.1/libtool.m4
 +AC_DEFUN([_LT_WITH_SYSROOT],
 +[AC_MSG_CHECKING([for sysroot])
 +AC_ARG_WITH([sysroot],
-+[  --with-sysroot[=DIR] Search for dependent libraries within DIR
++[  --with-libtool-sysroot[=DIR] Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).],
-+[], [with_sysroot=no])
++[], [with_libtool_sysroot=no])
 +
 +dnl lt_sysroot will always be passed unquoted.  We quote it here
 +dnl in case the user passed a directory name.
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   AC_MSG_RESULT([${with_sysroot}])
++   AC_MSG_RESULT([${with_libtool_sysroot}])
 +   AC_MSG_ERROR([The sysroot must be an absolute path.])
 +   ;;
 +esac
@@ -10159,7 +10159,7 @@ Index: binutils-2.20.1/bfd/configure
  with_pic
  enable_fast_install
  with_gnu_ld
-+with_sysroot
++with_libtool_sysroot
  enable_libtool_lock
  enable_plugins
  enable_largefile
@@ -10167,7 +10167,7 @@ Index: binutils-2.20.1/bfd/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
@@ -11076,29 +11076,29 @@ Index: binutils-2.20.1/bfd/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
@@ -13709,7 +13709,7 @@ Index: binutils-2.20.1/binutils/configure
  with_pic
  enable_fast_install
  with_gnu_ld
-+with_sysroot
++with_libtool_sysroot
  enable_libtool_lock
  enable_targets
  enable_werror
@@ -13717,7 +13717,7 @@ Index: binutils-2.20.1/binutils/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
@@ -14639,29 +14639,29 @@ Index: binutils-2.20.1/binutils/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
@@ -17293,7 +17293,7 @@ Index: binutils-2.20.1/gas/configure
  with_pic
  enable_fast_install
  with_gnu_ld
-+with_sysroot
++with_libtool_sysroot
  enable_libtool_lock
  enable_targets
  enable_checking
@@ -17301,7 +17301,7 @@ Index: binutils-2.20.1/gas/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
@@ -18224,29 +18224,29 @@ Index: binutils-2.20.1/gas/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
@@ -20847,7 +20847,7 @@ Index: binutils-2.20.1/gprof/configure
  with_pic
  enable_fast_install
  with_gnu_ld
-+with_sysroot
++with_libtool_sysroot
  enable_libtool_lock
  enable_nls
  enable_maintainer_mode
@@ -20855,7 +20855,7 @@ Index: binutils-2.20.1/gprof/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
@@ -21786,29 +21786,29 @@ Index: binutils-2.20.1/gprof/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
@@ -24363,7 +24363,7 @@ Index: binutils-2.20.1/ld/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
@@ -25288,29 +25288,29 @@ Index: binutils-2.20.1/ld/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
@@ -27826,7 +27826,7 @@ Index: binutils-2.20.1/opcodes/configure
  with_pic
  enable_fast_install
  with_gnu_ld
-+with_sysroot
++with_libtool_sysroot
  enable_libtool_lock
  enable_targets
  enable_werror
@@ -27834,7 +27834,7 @@ Index: binutils-2.20.1/opcodes/configure
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
-+  --with-sysroot=DIR Search for dependent libraries within DIR
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
  
  Some influential environment variables:
@@ -28744,29 +28744,29 @@ Index: binutils-2.20.1/opcodes/configure
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
-+# Check whether --with-sysroot was given.
-+if test "${with_sysroot+set}" = set; then :
-+  withval=$with_sysroot;
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
 +else
-+  with_sysroot=no
++  with_libtool_sysroot=no
 +fi
 +
 +
 +lt_sysroot=
-+case ${with_sysroot} in #(
++case ${with_libtool_sysroot} in #(
 + yes)
 +   if test "$GCC" = yes; then
 +     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
 +   fi
 +   ;; #(
 + /*)
-+   lt_sysroot=`echo "$with_sysroot" | sed -e "$sed_quote_subst"`
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
 +   ;; #(
 + no|'')
 +   ;; #(
 + *)
-+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_sysroot}" >&5
-+$as_echo "${with_sysroot}" >&6; }
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
 +   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
index 0f086f3..ab9e457 100644
--- a/recipes/binutils/binutils.inc
+++ b/recipes/binutils/binutils.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/binutils/"
 SECTION = "devel"
 LICENSE = "GPL"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 COMPATIBLE_TARGET_SYS ?= "(?!nios2)"
 
@@ -42,10 +42,6 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
 		--enable-shared"
-python __anonymous () {
-       cfg = oe_filter_out('--with-sysroot$' , bb.data.getVar('CONFIGUREOPTS', d, 1) or "", d)
-       bb.data.setVar('CONFIGUREOPTS', cfg, d)
-}
 
 # This is necessary due to a bug in the binutils Makefiles
 EXTRA_OEMAKE = "configure-build-libiberty all"
-- 
1.7.1



