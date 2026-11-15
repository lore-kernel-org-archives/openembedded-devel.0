Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3852.1794728985276876608
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oZ1d4KnV;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so2338009eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728985; x=1795333785; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpgsXJMGwsFYuao7tK1YpUmxlHk45CcEO3kM84PvMxM=;
        b=oZ1d4KnV+YXw1CpUJVeU/6fKzW1X9OvHU/dxgv2u9Yint0i7gL9cqlhvqVNA7NWvkS
         hfbDqaKcj5SdsnnrmsuTfDbPfEjSUlb9Uex77e1F/6Q7E91Jg2hJy2Ik632zNiMjWPQl
         TMbdstrSrpxnCp9kummsDkgvvkCFTxFWdKH8Rvf9Qa1/u9tb51qruwC51bMcRDCBP+3I
         9jSAB9vPSOxWbvRzXblfdt15JQFZ6Cm2wKRT/ldV9wLUngqLLm4Stf+SmT6laH0Xl/DO
         OtWHGahY0tlMYnZh8ul4VjkzKkMMf6LzSrvjrSA1BgsQcNUbiXKeVuIM2woHgWNNuogU
         0bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728985; x=1795333785;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpgsXJMGwsFYuao7tK1YpUmxlHk45CcEO3kM84PvMxM=;
        b=ufSR94mzYlM06gRId/VNSJ0g4xxFmC3PictM04E/gPH3TacjAGMGXMrzKOyXrZoWCQ
         uvI+brukTPx1p/E93Ty4jbTHnHLEqWgg4tc5KoNKMNk8E/HTj2CSMoJSF92lAsGOSUBm
         jd8OYDaAipmPawVlPaMwOH4PAr4PLo92q2HCGG2eXQNS+2BOinMVyxY07rL6ytkUVmNG
         BDznyJsq0C6xQSrkZuhGXApP4Uotg1z72ZQ53BB97Oxlq2wdsczwzwQJj6DwGr34PCgq
         IEA0OV/MCL7XfoNHjWgFdpUEElBIMqycIyF9tcuPw5kaoIEzTooO85qgOJQ76l7NhwXi
         kzpA==
X-Gm-Message-State: APuU4Z/0LSeFsvStUeGxjk3BuVvXnY5kJCEJb9yxfFgYRr2XoP2RnTrV
	uuOCF/xuauqhwdwD7ycb8gEW+m+Mj7bUXlE8bjDsY6yju9ZbGNKKo3L7TTtPdrbk
X-Gm-Gg: AYBFou1gHHJQtfzTQ5nTSp+JcjFyToIj0Tntr5Uy9ygM5RR34MbLKJJpLl8GqmMH63q
	4yyofTZ70p7xbiGC/AfQZs2sGHYn63wNa+PaUkTOKqQCcjR2H+ALVZAzxG4CWXnosLNzF1NIXqD
	Nv1ahrt5JExRXu2XFk+RCanm8rost6AtHPxFmNVAhJtGWHQ0gBJfrokApbf9Gl2GBwVB2x90e/I
	oAMeTnh1bfDq+HZnVUzB2VjcpIMM7xo73eUqOnMJW4GDKq18nYb6htiMLtn1NnHn/nwkHMuDWlp
	SANJPXx/etndwCn+6vehHLDNfKuZ7l7lFfNU3vj/5Gt5gn0DzlbuS2cXUqyLkOOsNnSuww+FxwU
	sew3rGpfl91h/p2IyJ2x+/FvXczFWy9sQZwKM31Bvnth9z5So4R9d2DDClbFJSr+HdY3ZIawQF0
	b5rfJjV3echj6wm60aNEcXswattqlWPHHSxbYAAVWyJV3mh5yXJefs7rtpDWkY7f6g2OTXb/zaQ
	vgaAWX2D7CBIZvPnpEiBty/cgFRUapy0YbZLmv5RAYHku/IgZYbbV2XN6DlqChOJcZ4G1cI/4dp
	s2Pp+XV0DUsdtXaLqTaNo1uiI5P2NbR2EFOofTltmxzjSQS+F/0K7bxBIxxVVvm0seMLIsiXweP
	WIh5eryMVJL7D/8qIeHggCO0qeFgEc0BqEjDqQaxc2j4MbnTEdu2RNu3bOBAHUvGkc9gJPoONHl
	8S0d2zr+Vi1EuAr9LESmOvfjgqsD5hunpFxbN6a14cHldEufDZnzKqZG6jQYrf44mphHRGF9CP7
	Es2D9BDB3RG2WOxWECZRmLnHzoVWFiOx4TeJkUALlcI23ndwyGGArC6mBdCUrPfblX3ngmgZ34z
	g0Bm
X-Received: by 2002:a05:7301:4544:b0:364:377c:cabe with SMTP id 5a478bee46e88-377e1af656dmr9542677eec.24.1794728984472;
        Sat, 14 Nov 2026 23:49:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/96] audit: upgrade 4.1.4 -> 4.2.1
Date: Sat, 14 Nov 2026 23:47:52 -0800
Message-ID: <20261115074918.2932593-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132284
Content-Type: text/plain; charset="utf-8"

Drop 0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch, included
in this release, and inherit bash-completion for the newly installed
completion scripts.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...te-ax_prog_cc_for_build.m4-to-latest.patch | 196 ------------------
 .../audit/{audit_4.1.4.bb => audit_4.2.1.bb}  |   5 +-
 2 files changed, 2 insertions(+), 199 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch
 rename meta-oe/recipes-security/audit/{audit_4.1.4.bb => audit_4.2.1.bb} (95%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch b/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch
deleted file mode 100644
index cf322b8e1a..0000000000
--- a/meta-oe/recipes-security/audit/audit/0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 3da79b330527b5f9d6e6243c8ba12968810965a3 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 10 Apr 2026 14:53:41 +0200
-Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to latest
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-After the autoconf update to 2.73 this was using -std=gnu23
-even on hosts with gcc-13 which doesn't support it:
-
-ac_cv_prog_ac_ct_CC_FOR_BUILD='gcc '
-ac_cv_prog_cc_c23=-std=gnu23
-ac_cv_prog_cc_g=yes
-ac_cv_prog_cc_stdc=-std=gnu23
-
-Leading to:
-gcc  -std=gnu23 -DHAVE_CONFIG_H -I. -I../../sources/audit-4.1.4/lib -I..  -I. -I../../sources/audit-4.1.4 -I../../sources/audit-4.1.4/auparse -I../../sources/audit-4.1.4/common -isystem/audit/4.1.4/recipe-sysroot-native/usr/include '-DTABLE_H="fieldtab.h"' -isystem/audit/4.1.4/recipe-sysroot-native/usr/include -O2 -pipe -c -o gen_fieldtabs_h-gen_tables.o `test -f 'gen_tables.c' || echo '../../sources/audit-4.1.4/lib/'`gen_tables.c
-gcc: error: unrecognized command-line option â-std=gnu23â; did you mean â-std=gnu2xâ?
-
-Needs the updated ac_cv_prog_cc_c23 from:
-https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765
-
-Upstream-Status: Submitted [https://github.com/linux-audit/audit-userspace/pull/524]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- m4/ax_prog_cc_for_build.m4 | 100 +++++++++++++++++++++++++++----------
- 1 file changed, 75 insertions(+), 25 deletions(-)
-
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
-index 77fd346a..4d1de993 100644
---- a/m4/ax_prog_cc_for_build.m4
-+++ b/m4/ax_prog_cc_for_build.m4
-@@ -1,5 +1,5 @@
- # ===========================================================================
--#   http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
-+#   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
- # ===========================================================================
- #
- # SYNOPSIS
-@@ -32,28 +32,32 @@
- #   and this notice are preserved. This file is offered as-is, without any
- #   warranty.
- 
--#serial 8
-+#serial 26
- 
- AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
- AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
- AC_REQUIRE([AC_PROG_CC])dnl
- AC_REQUIRE([AC_PROG_CPP])dnl
--AC_REQUIRE([AC_EXEEXT])dnl
--AC_REQUIRE([AC_CANONICAL_HOST])dnl
-+AC_REQUIRE([AC_CANONICAL_BUILD])dnl
- 
- dnl Use the standard macros, but make them use other variable names
- dnl
- pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
- pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
-+pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
-+pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
-+pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
-+pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
-+pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
- pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
- pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
- pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
--pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
--pushdef([ac_cv_objext], ac_cv_build_objext)dnl
-+pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
- pushdef([ac_exeext], ac_build_exeext)dnl
- pushdef([ac_objext], ac_build_objext)dnl
- pushdef([CC], CC_FOR_BUILD)dnl
- pushdef([CPP], CPP_FOR_BUILD)dnl
-+pushdef([GCC], GCC_FOR_BUILD)dnl
- pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
- pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
- pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
-@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
- pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
- pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
- pushdef([ac_cv_host_os], ac_cv_build_os)dnl
--pushdef([ac_cpp], ac_build_cpp)dnl
--pushdef([ac_compile], ac_build_compile)dnl
--pushdef([ac_link], ac_build_link)dnl
-+pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
-+pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
-+pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
-+pushdef([cross_compiling], cross_compiling_build)dnl
-+dnl
-+dnl These variables are problematic to rename by M4 macros, so we save
-+dnl their values in alternative names, and restore the values later.
-+dnl
-+dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
-+dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
-+dnl variables. It's not a good idea to rename ac_cv_exeext and
-+dnl ac_cv_objext either as they're related.
-+dnl Renaming ac_exeext and ac_objext is safe though.
-+dnl
-+ac_cv_host_exeext=$ac_cv_exeext
-+AS_VAR_SET_IF([ac_cv_build_exeext],
-+  [ac_cv_exeext=$ac_cv_build_exeext],
-+  [AS_UNSET([ac_cv_exeext])])
-+ac_cv_host_objext=$ac_cv_objext
-+AS_VAR_SET_IF([ac_cv_build_objext],
-+  [ac_cv_objext=$ac_cv_build_objext],
-+  [AS_UNSET([ac_cv_objext])])
-+dnl
-+dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
-+dnl AC_PROG_CC) indirectly.
-+dnl
-+ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
-+AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
-+  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
-+  [AS_UNSET([ac_cv_c_compiler_gnu])])
-+
-+cross_compiling_build=no
- 
--save_cross_compiling=$cross_compiling
--save_ac_tool_prefix=$ac_tool_prefix
--cross_compiling=no
--ac_tool_prefix=
-+ac_build_tool_prefix=
-+AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
-+      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
- 
-+AC_LANG_PUSH([C])
- AC_PROG_CC
-+_AC_COMPILER_EXEEXT
-+_AC_COMPILER_OBJEXT
- AC_PROG_CPP
--AC_EXEEXT
- 
--ac_tool_prefix=$save_ac_tool_prefix
--cross_compiling=$save_cross_compiling
-+BUILD_EXEEXT=$ac_cv_exeext
-+BUILD_OBJEXT=$ac_cv_objext
- 
- dnl Restore the old definitions
- dnl
--popdef([ac_link])dnl
--popdef([ac_compile])dnl
--popdef([ac_cpp])dnl
-+popdef([cross_compiling])dnl
-+popdef([am_cv_prog_cc_c_o])dnl
-+popdef([am_cv_CC_dependencies_compiler_type])dnl
-+popdef([ac_tool_prefix])dnl
- popdef([ac_cv_host_os])dnl
- popdef([ac_cv_host_vendor])dnl
- popdef([ac_cv_host_cpu])dnl
-@@ -101,24 +136,39 @@ popdef([host])dnl
- popdef([LDFLAGS])dnl
- popdef([CPPFLAGS])dnl
- popdef([CFLAGS])dnl
-+popdef([GCC])dnl
- popdef([CPP])dnl
- popdef([CC])dnl
- popdef([ac_objext])dnl
- popdef([ac_exeext])dnl
--popdef([ac_cv_objext])dnl
--popdef([ac_cv_exeext])dnl
-+popdef([ac_prog_cc_stdc])dnl
- popdef([ac_cv_prog_cc_g])dnl
- popdef([ac_cv_prog_cc_cross])dnl
- popdef([ac_cv_prog_cc_works])dnl
-+popdef([ac_cv_prog_cc_stdc])dnl
-+popdef([ac_cv_prog_cc_c23])dnl
-+popdef([ac_cv_prog_cc_c11])dnl
-+popdef([ac_cv_prog_cc_c99])dnl
-+popdef([ac_cv_prog_cc_c89])dnl
- popdef([ac_cv_prog_gcc])dnl
- popdef([ac_cv_prog_CPP])dnl
-+dnl
-+ac_cv_exeext=$ac_cv_host_exeext
-+EXEEXT=$ac_cv_host_exeext
-+ac_cv_objext=$ac_cv_host_objext
-+OBJEXT=$ac_cv_host_objext
-+ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
-+ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
-+
-+dnl restore global variables ac_ext, ac_cpp, ac_compile,
-+dnl ac_link, ac_compiler_gnu (dependent on the current
-+dnl language after popping):
-+AC_LANG_POP([C])
- 
- dnl Finally, set Makefile variables
- dnl
--BUILD_EXEEXT=$ac_build_exeext
--BUILD_OBJEXT=$ac_build_objext
--AC_SUBST(BUILD_EXEEXT)dnl
--AC_SUBST(BUILD_OBJEXT)dnl
-+AC_SUBST([BUILD_EXEEXT])dnl
-+AC_SUBST([BUILD_OBJEXT])dnl
- AC_SUBST([CFLAGS_FOR_BUILD])dnl
- AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
- AC_SUBST([LDFLAGS_FOR_BUILD])dnl
diff --git a/meta-oe/recipes-security/audit/audit_4.1.4.bb b/meta-oe/recipes-security/audit/audit_4.2.1.bb
similarity index 95%
rename from meta-oe/recipes-security/audit/audit_4.1.4.bb
rename to meta-oe/recipes-security/audit/audit_4.2.1.bb
index 363746ccf0..4a764a1257 100644
--- a/meta-oe/recipes-security/audit/audit_4.1.4.bb
+++ b/meta-oe/recipes-security/audit/audit_4.2.1.bb
@@ -9,13 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Fixed-swig-host-contamination-issue.patch \
-           file://0001-m4-update-ax_prog_cc_for_build.m4-to-latest.patch \
            file://auditd \
           "
 
-SRCREV = "07eea50408d28c953d4048dfef3da6556ce4b569"
+SRCREV = "00659601cc23dc243bb0f451977636ff77fcf80f"
 
-inherit autotools python3targetconfig update-rc.d systemd
+inherit autotools python3targetconfig update-rc.d systemd bash-completion
 
 UPDATERCPN = "auditd"
 INITSCRIPT_NAME = "auditd"
