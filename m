Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD42DF4486F
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:51:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156999.1775829084498106455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JERTQu5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso22244595e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775829083; x=1776433883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/DA8B16PnlKmDHpFyYR2cNIKyT7Ap4aqyZp8/cT7Cs=;
        b=JERTQu5njMEDWRAJL/U8eGY/5bv+HX/jZGBZ/bQycmkEwHp/WCk5Tuv8vYGN6kL/Ts
         Rbs53IXDCDtXrkJiiykQg0naNODIy9w8gXl+OvbCSgtvsYff3PIFUmWqRS3aJP9ETot1
         NisnzF3/9mDclz1j0EHGNiBDniHYK49eH1Hd8UmIIiVB75YklYGQSWHDZuWv6nxtQAYt
         un1HZrIah3OfN04EaR7N4W1abhiDSqqZVNN7F2xOFBieqxdzwUYLa1n2/vwVESNgTqxv
         TaHNiIYbJdlg2XLf7ze0dqtf485UHcCCJH+tythDrUI4RFsO2/7M2FFJdn9SzHLFjRRC
         XQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829083; x=1776433883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/DA8B16PnlKmDHpFyYR2cNIKyT7Ap4aqyZp8/cT7Cs=;
        b=ao44eW6IktFS+PjNdXbPCpiy6kTjaQAQ9H+opg3/fDUkoFoDccTFvs0j9kbOi2nrFp
         9mLEa8rim4fyCX+jf7zTrmw8Yju+0tT1ZjIL11Ly8LnqABQ0Svm/t6QKz+ssgahj8BGp
         ByVPqLa3gcpvvKpTJww8/G/2s8zD/xP8HXsBeUbEqGBiYKvJirm/0SbPfSPDhbJyNQX5
         ldytQzN+viByJ9IuhNxNP1VTttC74YVuEXjcwe4FF887xmYiHTTiOZk9RTwg1rZsgj5y
         gJWVYuSlWgyg3Ve/DITUX4HCQKDrm1rHufLmmJfndgwSOHSoB3RUA4B9iSX0cn4UG7q3
         4ZKQ==
X-Gm-Message-State: AOJu0YxeMoQq+XlTbj5BVx47v8I62tZqTv71UEmdHWAcNCM+6vMa0IMU
	+B2q7Z897/Tm1AkI9RBSMFc1NZ4XFBkDaT80hdKSsb51tZbW30rmZsKsMXK74g==
X-Gm-Gg: AeBDietkfnkb0WesyIYYVJIr9+JtjD+KY/WGZbkJ0ce5DxmWxR6Q5w7V+kIJ4D3VoCa
	bi04qGT3QUrYuOMC6ZOeX93jObtwTCYS1BlgAPbBhlBcUg66D8zdwKG9epVJr6JVnMHaph8v6HP
	Qw3S0oBhnfw3MbJE6Y4jci8IvIHNFQ+HnpDpER9H+220bLomhhOslmhCQLalo5k3b4bI09lk7J/
	pagqa57Ia1ioRF7sqbzoZc7LEx6S7vSw797AMNeYidFDIK0doUHpMtFNXbSaYwpCD7Tiv1RE0TE
	xDZVYL1nedPcdKTGyKBhy5D2SRr98YEBcZNJjiyHe4Vt0fEDOuX8KC1QDssDtpOryIw0hQt33p+
	YNS+S1dvJ975tTTaQ10nPSi1bccA+aMbGUsY5NECRDDPsT07j5yRH78U8CY3Mx75KB/ebRq08L5
	H9G9/QUhrOdTnfxjjIHbnncDgCv3/BphPzyHVAQ7vICCASrGah7appMOVAoIecNaQ6ZL/sbUNBy
	Tykvt2SaA==
X-Received: by 2002:a05:600c:4e16:b0:488:966f:70a7 with SMTP id 5b1f17b1804b1-488d67bbc7emr44936375e9.2.1775829082538;
        Fri, 10 Apr 2026 06:51:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d703c1sm21713075e9.3.2026.04.10.06.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:51:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] audit: fix build with autoconf-2.73
Date: Fri, 10 Apr 2026 15:49:38 +0200
Message-ID: <20260410134939.3938882-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 13:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126242

From: Martin Jansa <martin.jansa@gmail.com>

On hosts with gcc-13 it was trying to use -std=gnu23 and failing
with unrecognized command-line option (gnu23 needs gcc-14 and newer)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...te-ax_prog_cc_for_build.m4-to-latest.patch | 196 ++++++++++++++++++
 meta-oe/recipes-security/audit/audit_4.1.4.bb |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch

diff --git a/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch b/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch
new file mode 100644
index 0000000000..cf322b8e1a
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch
@@ -0,0 +1,196 @@
+From 3da79b330527b5f9d6e6243c8ba12968810965a3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 10 Apr 2026 14:53:41 +0200
+Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to latest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After the autoconf update to 2.73 this was using -std=gnu23
+even on hosts with gcc-13 which doesn't support it:
+
+ac_cv_prog_ac_ct_CC_FOR_BUILD='gcc '
+ac_cv_prog_cc_c23=-std=gnu23
+ac_cv_prog_cc_g=yes
+ac_cv_prog_cc_stdc=-std=gnu23
+
+Leading to:
+gcc  -std=gnu23 -DHAVE_CONFIG_H -I. -I../../sources/audit-4.1.4/lib -I..  -I. -I../../sources/audit-4.1.4 -I../../sources/audit-4.1.4/auparse -I../../sources/audit-4.1.4/common -isystem/audit/4.1.4/recipe-sysroot-native/usr/include '-DTABLE_H="fieldtab.h"' -isystem/audit/4.1.4/recipe-sysroot-native/usr/include -O2 -pipe -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '../../sources/audit-4.1.4/lib/'`gen_tables.c
+gcc: error: unrecognized command-line option â-std=gnu23â; did you mean â-std=gnu2xâ?
+
+Needs the updated ac_cv_prog_cc_c23 from:
+https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765
+
+Upstream-Status: Submitted [https://github.com/linux-audit/audit-userspace/pull/524]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 100 +++++++++++++++++++++++++++----------
+ 1 file changed, 75 insertions(+), 25 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 77fd346a..4d1de993 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -1,5 +1,5 @@
+ # ===========================================================================
+-#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
++#   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
+ # ===========================================================================
+ #
+ # SYNOPSIS
+@@ -32,28 +32,32 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 8
++#serial 26
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+ AC_REQUIRE([AC_PROG_CC])dnl
+ AC_REQUIRE([AC_PROG_CPP])dnl
+-AC_REQUIRE([AC_EXEEXT])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ 
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
+ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+ pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
+ pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
+ pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
+ pushdef([ac_cv_host_os], ac_cv_build_os)dnl
+-pushdef([ac_cpp], ac_build_cpp)dnl
+-pushdef([ac_compile], ac_build_compile)dnl
+-pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([cross_compiling], cross_compiling_build)dnl
++dnl
++dnl These variables are problematic to rename by M4 macros, so we save
++dnl their values in alternative names, and restore the values later.
++dnl
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
++dnl variables. It's not a good idea to rename ac_cv_exeext and
++dnl ac_cv_objext either as they're related.
++dnl Renaming ac_exeext and ac_objext is safe though.
++dnl
++ac_cv_host_exeext=$ac_cv_exeext
++AS_VAR_SET_IF([ac_cv_build_exeext],
++  [ac_cv_exeext=$ac_cv_build_exeext],
++  [AS_UNSET([ac_cv_exeext])])
++ac_cv_host_objext=$ac_cv_objext
++AS_VAR_SET_IF([ac_cv_build_objext],
++  [ac_cv_objext=$ac_cv_build_objext],
++  [AS_UNSET([ac_cv_objext])])
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
++
++cross_compiling_build=no
+ 
+-save_cross_compiling=$cross_compiling
+-save_ac_tool_prefix=$ac_tool_prefix
+-cross_compiling=no
+-ac_tool_prefix=
++ac_build_tool_prefix=
++AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
++      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
+ 
++AC_LANG_PUSH([C])
+ AC_PROG_CC
++_AC_COMPILER_EXEEXT
++_AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+-AC_EXEEXT
+ 
+-ac_tool_prefix=$save_ac_tool_prefix
+-cross_compiling=$save_cross_compiling
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
+ 
+ dnl Restore the old definitions
+ dnl
+-popdef([ac_link])dnl
+-popdef([ac_compile])dnl
+-popdef([ac_cpp])dnl
++popdef([cross_compiling])dnl
++popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
+ popdef([ac_cv_host_os])dnl
+ popdef([ac_cv_host_vendor])dnl
+ popdef([ac_cv_host_cpu])dnl
+@@ -101,24 +136,39 @@ popdef([host])dnl
+ popdef([LDFLAGS])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
++popdef([GCC])dnl
+ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
++popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=$ac_cv_host_exeext
++EXEEXT=$ac_cv_host_exeext
++ac_cv_objext=$ac_cv_host_objext
++OBJEXT=$ac_cv_host_objext
++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
++
++dnl restore global variables ac_ext, ac_cpp, ac_compile,
++dnl ac_link, ac_compiler_gnu (dependent on the current
++dnl language after popping):
++AC_LANG_POP([C])
+ 
+ dnl Finally, set Makefile variables
+ dnl
+-BUILD_EXEEXT=$ac_build_exeext
+-BUILD_OBJEXT=$ac_build_objext
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
diff --git a/meta-oe/recipes-security/audit/audit_4.1.4.bb b/meta-oe/recipes-security/audit/audit_4.1.4.bb
index 05d6f1d277..e349ee76d0 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.4.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Fixed-swig-host-contamination-issue.patch \
+           file://0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch \
            file://auditd \
           "
 

