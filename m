Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFDEC761AF
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 17:40:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.50124.1680457250352462663
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Apr 2023 10:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mPdnTA8b;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id d13so25157690pjh.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680457249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJIPeuVXtenD8vWmF8ylYDho1g99eXnp+h6j5U9tslM=;
        b=mPdnTA8brlMZPUEZvL2pnZ9cVB2TsJzFtWqZ8V3X7nh2bTDlGWuApA6qI6PJciFN6V
         OyPt5I2Yyg+zU33GO8XaQ9DPfxq4j7TS72c5WAa4IbDulOhh12QHhmZU3T9oo/RnZ3Wl
         EQ1WZicklDMugDQbrw8sP8kS3+yZsPKLYgfwpl0ifPsWlEtM51KGomtt4EF0HKeYeewu
         s0lETybRSJ8411UgWDvpC/hGznHa3+3Rk11iysegsE0uzWni71PGxOvOdl64zwZMFkJL
         j77KVLEQAM/pP2wnhp+Q++c6S01m2IpSTMdOArrX26JIJBwgIISCvD5cq1BaP1BUx6v/
         d+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680457249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJIPeuVXtenD8vWmF8ylYDho1g99eXnp+h6j5U9tslM=;
        b=ddZSNwW+l0vDLSWmj9o48QX5HCBcfZ38uyqDVGtGNQuaCOq9IDOOehNweUsK8+k2N1
         LAml3iVVQfXVBhNE/OZFAvGKlaXg/Wd4DP2ySArck6na1NKRclzlYCQsKECvP/PGIsp7
         SUe3X4Kfc3qqku765fYm3RCmUR0L/a8pPKno3/cYyc7VTpzZYqAmZaN1/ZsdIjECPYtN
         mYegnKWj+iXgS9u45k86FKzr9mHkk0HiV8MiW5lDJ8tkNthLNFP3JELvMaVl2STuVHZk
         zubeId9nk4IM6n8CbhmHbR1VRXZv7jW4pxlMw3VI8d9Tw4n7nRg02XYYP8f83DCOowvL
         nazA==
X-Gm-Message-State: AAQBX9cZAB5IjxKV7CR6nZ/TKl5Ybcub71P7CH3NVQKGto1e5kZ1C/PD
	R7k5Bng7kR8/F1CQdW/tCDrpLOmR02wXSg==
X-Google-Smtp-Source: AKy350aVg642CjKVJByVLxnvi+VXFsOaSnWKx2Ql6hkescJ411CpMXFKgcth0tawpCQgpEZxgUtrqw==
X-Received: by 2002:a17:902:e749:b0:19d:244:a3a8 with SMTP id p9-20020a170902e74900b0019d0244a3a8mr41121780plf.10.1680457249204;
        Sun, 02 Apr 2023 10:40:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::17e4])
        by smtp.gmail.com with ESMTPSA id jj20-20020a170903049400b0019309be03e7sm5066669plb.66.2023.04.02.10.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 10:40:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libidn: Update largefile m4 macros
Date: Sun,  2 Apr 2023 10:40:46 -0700
Message-Id: <20230402174046.2217832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 17:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101876

This is a backport from gnulib, its needed for configure to work with
latest autoconf 2.72

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...largefile.m4-Sync-with-latest-gnulib.patch | 390 ++++++++++++++++++
 .../recipes-extended/libidn/libidn_1.41.bb    |   1 +
 2 files changed, 391 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch

diff --git a/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch b/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch
new file mode 100644
index 0000000000..1dbf2955c9
--- /dev/null
+++ b/meta-oe/recipes-extended/libidn/libidn/0001-largefile.m4-Sync-with-latest-gnulib.patch
@@ -0,0 +1,390 @@
+From 66c1646a3f12836846a054ebd2c427e30c93d3a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Apr 2023 10:37:15 -0700
+Subject: [PATCH] largefile.m4: Sync with latest gnulib
+
+This ensures it can work with latest autoconf 2.72 release ( upcoming )
+
+Upstream-Status: Backport [it will be not needed with 1.42 release]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gl/m4/largefile.m4 | 330 ++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 263 insertions(+), 67 deletions(-)
+
+diff --git a/gl/m4/largefile.m4 b/gl/m4/largefile.m4
+index 3e8b5e3..7fb81b8 100644
+--- a/gl/m4/largefile.m4
++++ b/gl/m4/largefile.m4
+@@ -1,7 +1,7 @@
+ # Enable large files on systems where this is not the default.
+ # Enable support for files on Linux file systems with 64-bit inode numbers.
+ 
+-# Copyright 1992-1996, 1998-2022 Free Software Foundation, Inc.
++# Copyright 1992-1996, 1998-2023 Free Software Foundation, Inc.
+ # This file is free software; the Free Software Foundation
+ # gives unlimited permission to copy and/or distribute it,
+ # with or without modifications, as long as this notice is preserved.
+@@ -10,8 +10,9 @@
+ # It does not set _LARGEFILE_SOURCE=1 on HP-UX/ia64 32-bit, although this
+ # setting of _LARGEFILE_SOURCE is needed so that <stdio.h> declares fseeko
+ # and ftello in C++ mode as well.
++# Fixed in Autoconf 2.72, which has AC_SYS_YEAR2038.
+ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+-[
++ m4_ifndef([AC_SYS_YEAR2038], [[
+   AC_REQUIRE([AC_CANONICAL_HOST])
+   AC_FUNC_FSEEKO
+   case "$host_os" in
+@@ -20,10 +21,10 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+         [Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2).])
+       ;;
+   esac
+-])
++ ]])
++)
+ 
+-# Work around a problem in Autoconf through at least 2.71 on glibc 2.34+
+-# with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
++# Work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+ m4_version_prereq([2.70], [], [
+@@ -43,33 +44,258 @@ m4_define([_AC_SYS_LARGEFILE_TEST_INCLUDES],
+ ])
+ ])# m4_version_prereq 2.70
+ 
++# Support AC_SYS_YEAR2038, even if Autoconf 2.71 or earlier.
++# This code is taken from Autoconf master.
++m4_ifndef([AC_SYS_YEAR2038], [
++
++# _AC_SYS_YEAR2038_TEST_CODE
++# --------------------------
++# C code used to probe for time_t that can represent time points more
++# than 2**31 - 1 seconds after the epoch.  With the usual Unix epoch,
++# these correspond to dates after 2038-01-18 22:14:07 +0000 (Gregorian),
++# hence the name.
++AC_DEFUN([_AC_SYS_YEAR2038_TEST_CODE],
++[[
++  #include <time.h>
++  /* Check that time_t can represent 2**32 - 1 correctly.  */
++  #define LARGE_TIME_T \\
++    ((time_t) (((time_t) 1 << 30) - 1 + 3 * ((time_t) 1 << 30)))
++  int verify_time_t_range[(LARGE_TIME_T / 65537 == 65535
++                           && LARGE_TIME_T % 65537 == 0)
++                          ? 1 : -1];
++]])
++
++# _AC_SYS_YEAR2038_OPTIONS
++# ------------------------
++# List of known ways to enable support for large time_t.  If you change
++# this list you probably also need to change the AS_CASE at the end of
++# _AC_SYS_YEAR2038_PROBE.
++m4_define([_AC_SYS_YEAR2038_OPTIONS], m4_normalize(
++    ["none needed"]                   dnl 64-bit and newer 32-bit Unix
++    ["-D_TIME_BITS=64"]               dnl glibc 2.34 with some 32-bit ABIs
++    ["-D__MINGW_USE_VC2005_COMPAT"]   dnl 32-bit MinGW
++    ["-U_USE_32_BIT_TIME_T -D__MINGW_USE_VC2005_COMPAT"]
++                                      dnl 32-bit MinGW (misconfiguration)
++))
++
++# _AC_SYS_YEAR2038_PROBE([IF-NOT-DETECTED])
++# -----------------------------------------
++# Subroutine of AC_SYS_YEAR2038.  Probe for time_t that can represent
++# time points more than 2**31 - 1 seconds after the epoch (dates after
++# 2038-01-18, see above) and set the cache variable ac_cv_sys_year2038_opts
++# to one of the values in the _AC_SYS_YEAR2038_OPTIONS list, or to
++# "support not detected" if none of them worked.  Then, set compilation
++# options and #defines as necessary to enable large time_t support.
++#
++# Note that we do not test whether mktime, localtime, etc. handle
++# large values of time_t correctly, as that would require use of
++# AC_TRY_RUN.  Note also that some systems only support large time_t
++# together with large off_t.
++#
++# If support is not detected, the behavior depends on which of the
++# top-level AC_SYS_YEAR2038 macros was used (see below).
++#
++# If you change this macro you may also need to change
++# _AC_SYS_YEAR2038_OPTIONS.
++AC_DEFUN([_AC_SYS_YEAR2038_PROBE],
++[AC_CACHE_CHECK([for $CC option to enable timestamps after Jan 2038],
++  [ac_cv_sys_year2038_opts],
++  [ac_save_CPPFLAGS="$CPPFLAGS"
++  ac_opt_found=no
++  for ac_opt in _AC_SYS_YEAR2038_OPTIONS; do
++    AS_IF([test x"$ac_opt" != x"none needed"],
++      [CPPFLAGS="$ac_save_CPPFLAGS $ac_opt"])
++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([_AC_SYS_YEAR2038_TEST_CODE])],
++      [ac_cv_sys_year2038_opts="$ac_opt"
++      ac_opt_found=yes])
++    test $ac_opt_found = no || break
++  done
++  CPPFLAGS="$ac_save_CPPFLAGS"
++  test $ac_opt_found = yes || ac_cv_sys_year2038_opts="support not detected"])
++
++ac_have_year2038=yes
++AS_CASE([$ac_cv_sys_year2038_opts],
++  ["none needed"], [],
++  ["support not detected"],
++    [ac_have_year2038=no
++     AS_CASE([$enable_year2038],
++      [yes],
++        [# If we're not cross compiling and 'touch' works with a large
++        # timestamp, then we can presume the system supports wider time_t
++        # *somehow* and we just weren't able to detect it.  One common
++        # case that we deliberately *don't* probe for is a system that
++        # supports both 32- and 64-bit ABIs but only the 64-bit ABI offers
++        # wide time_t.  (It would be inappropriate for us to override an
++        # intentional use of -m32.)  Error out, demanding use of
++        # --disable-year2038 if this is intentional.
++        AS_IF([test $cross_compiling = no],
++          [AS_IF([TZ=UTC0 touch -t 210602070628.15 conftest.time 2>/dev/null],
++            [AS_CASE([`TZ=UTC0 LC_ALL=C ls -l conftest.time 2>/dev/null`],
++              [*'Feb  7  2106'* | *'Feb  7 17:10'*],
++              [AC_MSG_FAILURE(m4_text_wrap(
++      [this system appears to support timestamps after January 2038,
++       but no mechanism for enabling wide 'time_t' was detected.
++       Did you mean to build a 64-bit binary? (e.g. 'CC="${CC} -m64"'.)
++       To proceed with 32-bit time_t, configure with '--disable-year2038'.],
++      [], [], [55]))])])])])],
++
++  ["-D_TIME_BITS=64"],
++    [AC_DEFINE([_TIME_BITS], [64],
++      [Number of bits in time_t, on hosts where this is settable.])],
++
++  ["-D__MINGW_USE_VC2005_COMPAT=1"],
++    [AC_DEFINE([__MINGW_USE_VC2005_COMPAT], [1],
++      [Define to 1 on platforms where this makes time_t a 64-bit type.])],
+ 
+-# _AC_SYS_LARGEFILE_MACRO_VALUE(C-MACRO, VALUE,
+-#                               CACHE-VAR,
+-#                               DESCRIPTION,
+-#                               PROLOGUE, [FUNCTION-BODY])
+-# --------------------------------------------------------
+-m4_define([_AC_SYS_LARGEFILE_MACRO_VALUE],
+-[AC_CACHE_CHECK([for $1 value needed for large files], [$3],
+-[while :; do
+-  m4_ifval([$6], [AC_LINK_IFELSE], [AC_COMPILE_IFELSE])(
+-    [AC_LANG_PROGRAM([$5], [$6])],
+-    [$3=no; break])
+-  m4_ifval([$6], [AC_LINK_IFELSE], [AC_COMPILE_IFELSE])(
+-    [AC_LANG_PROGRAM([#undef $1
+-#define $1 $2
+-$5], [$6])],
+-    [$3=$2; break])
+-  $3=unknown
+-  break
+-done])
+-case $$3 in #(
+-  no | unknown) ;;
+-  *) AC_DEFINE_UNQUOTED([$1], [$$3], [$4]);;
+-esac
+-rm -rf conftest*[]dnl
+-])# _AC_SYS_LARGEFILE_MACRO_VALUE
++  ["-U_USE_32_BIT_TIME_T"*],
++    [AC_MSG_FAILURE(m4_text_wrap(
++      [the 'time_t' type is currently forced to be 32-bit.
++       It will stop working after January 2038.
++       Remove _USE_32BIT_TIME_T from the compiler flags.],
++      [], [], [55]))],
++
++  [AC_MSG_ERROR(
++    [internal error: bad value for \$ac_cv_sys_year2038_opts])])
++])
++
++# _AC_SYS_YEAR2038_ENABLE
++# -----------------------
++# Subroutine of AC_SYS_YEAR2038 and _AC_SYS_YEAR2038_OPT_IN.
++# Depending on which of the YEAR2038 macros was used, add either an
++# --enable-year2038, or a --disable-year2038, or no option at all to
++# the configure script.  Note that this is expanded very late and
++# therefore there cannot be any code in the AC_ARG_ENABLE.  The
++# default value for enable_year2038 is emitted unconditionally
++# because the generated code always looks at this variable.
++m4_define([_AC_SYS_YEAR2038_ENABLE],
++[m4_divert_text([DEFAULTS],
++  m4_provide_if([AC_SYS_YEAR2038],
++    [enable_year2038=yes],
++    [enable_year2038=no]))]dnl
++[AC_ARG_ENABLE([year2038],
++  m4_provide_if([AC_SYS_YEAR2038],
++    [AS_HELP_STRING([--disable-year2038],
++      [do not support timestamps after 2038])],
++    [AS_HELP_STRING([--enable-year2038],
++      [support timestamps after 2038])]))])
++
++# _AC_SYS_YEAR2038_OPT_IN
++# -----------------------
++# If the --enable-year2038 option is given to configure, attempt to
++# detect and activate support for large time_t on 32-bit systems.
++# This macro is automatically invoked by AC_SYS_LARGEFILE when large
++# *file* support is detected.  It does not AC_REQUIRE AC_SYS_LARGEFILE
++# to avoid a dependency loop, and is therefore unsafe to expose as a
++# documented macro.
++AC_DEFUN([_AC_SYS_YEAR2038_OPT_IN],
++[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
++  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
++  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
++])])
++
++# AC_SYS_YEAR2038
++# ---------------
++# Attempt to detect and activate support for large time_t.
++# On systems where time_t is not always 64 bits, this probe can be
++# skipped by passing the --disable-year2038 option to configure.
++AC_DEFUN([AC_SYS_YEAR2038],
++[AC_REQUIRE([AC_SYS_LARGEFILE])]dnl
++[m4_provide_if([_AC_SYS_YEAR2038_PROBE], [], [dnl
++  AS_IF([test "$enable_year2038" != no], [_AC_SYS_YEAR2038_PROBE])
++  AC_CONFIG_COMMANDS_PRE([_AC_SYS_YEAR2038_ENABLE])
++])])
++
++# _AC_SYS_LARGEFILE_TEST_CODE
++# ---------------------------
++# C code used to probe for large file support.
++m4_define([_AC_SYS_LARGEFILE_TEST_CODE],
++[@%:@include <sys/types.h>
++ /* Check that off_t can represent 2**63 - 1 correctly.
++    We can't simply define LARGE_OFF_T to be 9223372036854775807,
++    since some C++ compilers masquerading as C compilers
++    incorrectly reject 9223372036854775807.  */
++@%:@define LARGE_OFF_T (((off_t) 1 << 31 << 31) - 1 + ((off_t) 1 << 31 << 31))
++  int off_t_is_large[[(LARGE_OFF_T % 2147483629 == 721
++		       && LARGE_OFF_T % 2147483647 == 1)
++		      ? 1 : -1]];[]dnl
++])
++
++# _AC_SYS_LARGEFILE_OPTIONS
++# -------------------------
++# List of known ways to enable support for large files.  If you change
++# this list you probably also need to change the AS_CASE at the end of
++# _AC_SYS_LARGEFILE_PROBE.
++m4_define([_AC_SYS_LARGEFILE_OPTIONS], m4_normalize(
++    ["none needed"]                   dnl Most current systems
++    ["-D_FILE_OFFSET_BITS=64"]        dnl X/Open LFS spec
++    ["-D_LARGE_FILES=1"]              dnl AIX (which versions?)
++    ["-n32"]                          dnl Irix 6.2 w/ SGI compiler
++))
++
++# _AC_SYS_LARGEFILE_PROBE
++# -----------------------
++# Subroutine of AC_SYS_LARGEFILE. Probe for large file support and set
++# the cache variable ac_cv_sys_largefile_opts to one of the values in
++# the _AC_SYS_LARGEFILE_OPTIONS list, or to "support not detected" if
++# none of the options in that list worked.  Then, set compilation
++# options and #defines as necessary to enable large file support.
++#
++# If large file support is not detected, the behavior depends on which of
++# the top-level AC_SYS_LARGEFILE macros was used (see below).
++#
++# If you change this macro you may also need to change
++# _AC_SYS_LARGEFILE_OPTIONS.
++AC_DEFUN([_AC_SYS_LARGEFILE_PROBE],
++[AC_CACHE_CHECK([for $CC option to enable large file support],
++  [ac_cv_sys_largefile_opts],
++  [ac_save_CC="$CC"
++  ac_opt_found=no
++  for ac_opt in _AC_SYS_LARGEFILE_OPTIONS; do
++    AS_IF([test x"$ac_opt" != x"none needed"],
++      [CC="$ac_save_CC $ac_opt"])
++    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([_AC_SYS_LARGEFILE_TEST_CODE])],
++      [ac_cv_sys_largefile_opts="$ac_opt"
++      ac_opt_found=yes])
++    test $ac_opt_found = no || break
++  done
++  CC="$ac_save_CC"
++  test $ac_opt_found = yes || ac_cv_sys_largefile_opts="support not detected"])
++
++ac_have_largefile=yes
++AS_CASE([$ac_cv_sys_largefile_opts],
++  ["none needed"], [],
++  ["support not detected"],
++    [ac_have_largefile=no],
++
++  ["-D_FILE_OFFSET_BITS=64"],
++    [AC_DEFINE([_FILE_OFFSET_BITS], [64],
++      [Number of bits in a file offset, on hosts where this is settable.])],
++
++  ["-D_LARGE_FILES=1"],
++    [AC_DEFINE([_LARGE_FILES], [1],
++      [Define to 1 on platforms where this makes off_t a 64-bit type.])],
++
++  ["-n32"],
++    [CC="$CC -n32"],
++
++  [AC_MSG_ERROR(
++    [internal error: bad value for \$ac_cv_sys_largefile_opts])])
++
++_AC_SYS_YEAR2038_OPT_IN
++])
+ 
++# _AC_SYS_LARGEFILE_ENABLE
++# ------------------------
++# Subroutine of AC_SYS_LARGEFILE.  Note that this
++# is expanded very late and therefore there cannot be any code in the
++# AC_ARG_ENABLE.  The default value for enable_largefile is emitted
++# unconditionally because the generated shell code always looks at
++# this variable.
++m4_define([_AC_SYS_LARGEFILE_ENABLE],
++[m4_divert_text([DEFAULTS],
++  enable_largefile=yes)]dnl
++[AC_ARG_ENABLE([largefile],
++  [AS_HELP_STRING([--disable-largefile], [omit support for large files])])])
+ 
+ # AC_SYS_LARGEFILE
+ # ----------------
+@@ -80,44 +306,14 @@ rm -rf conftest*[]dnl
+ # Additionally, on Linux file systems with 64-bit inodes a file that happens
+ # to have a 64-bit inode number cannot be accessed by 32-bit applications on
+ # Linux x86/x86_64.  This can occur with file systems such as XFS and NFS.
++# This macro allows configuration to continue if the system doesn't support
++# large files.
+ AC_DEFUN([AC_SYS_LARGEFILE],
+-[AC_ARG_ENABLE(largefile,
+-               [  --disable-largefile     omit support for large files])
+-AS_IF([test "$enable_largefile" != no],
+- [AC_CACHE_CHECK([for special C compiler options needed for large files],
+-    ac_cv_sys_largefile_CC,
+-    [ac_cv_sys_largefile_CC=no
+-     if test "$GCC" != yes; then
+-       ac_save_CC=$CC
+-       while :; do
+-         # IRIX 6.2 and later do not support large files by default,
+-         # so use the C compiler's -n32 option if that helps.
+-         AC_LANG_CONFTEST([AC_LANG_PROGRAM([_AC_SYS_LARGEFILE_TEST_INCLUDES])])
+-         AC_COMPILE_IFELSE([], [break])
+-         CC="$CC -n32"
+-         AC_COMPILE_IFELSE([], [ac_cv_sys_largefile_CC=' -n32'; break])
+-         break
+-       done
+-       CC=$ac_save_CC
+-       rm -f conftest.$ac_ext
+-    fi])
+-  if test "$ac_cv_sys_largefile_CC" != no; then
+-    CC=$CC$ac_cv_sys_largefile_CC
+-  fi
+-
+-  _AC_SYS_LARGEFILE_MACRO_VALUE(_FILE_OFFSET_BITS, 64,
+-    ac_cv_sys_file_offset_bits,
+-    [Number of bits in a file offset, on hosts where this is settable.],
+-    [_AC_SYS_LARGEFILE_TEST_INCLUDES])
+-  AS_CASE([$ac_cv_sys_file_offset_bits],
+-    [unknown],
+-      [_AC_SYS_LARGEFILE_MACRO_VALUE([_LARGE_FILES], [1],
+-         [ac_cv_sys_large_files],
+-         [Define for large files, on AIX-style hosts.],
+-         [_AC_SYS_LARGEFILE_TEST_INCLUDES])],
+-    [64],
+-      [gl_YEAR2038_BODY([])])])
+-])# AC_SYS_LARGEFILE
++[m4_provide_if([_AC_SYS_LARGEFILE_PROBE], [], [dnl
++  AS_IF([test "$enable_largefile" != no], [_AC_SYS_LARGEFILE_PROBE])
++  AC_CONFIG_COMMANDS_PRE([_AC_SYS_LARGEFILE_ENABLE])
++])])
++])# m4_ifndef AC_SYS_YEAR2038
+ 
+ # Enable large files on systems where this is implemented by Gnulib, not by the
+ # system headers.
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.41.bb b/meta-oe/recipes-extended/libidn/libidn_1.41.bb
index b4303a1623..17ffc6cdc5 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.41.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.41.bb
@@ -18,6 +18,7 @@ inherit pkgconfig autotools gettext texinfo gtk-doc
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://0001-largefile.m4-Sync-with-latest-gnulib.patch \
            "
 
 #SRC_URI[md5sum] = "813c7b268d1051ca02c3610986126f38"
-- 
2.40.0


