Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10916C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:15:52 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2210.1709838951539119861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ox0jAd0n;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e55b33ad14so804988b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709838951; x=1710443751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aX0pHBwHGGju79HsNY97XucHiC/rnCCXUwNuxYOtOZQ=;
        b=Ox0jAd0nk3C0FFXC3frKNMyTFQQonkKBDfEUOibbnntrCiU963Kl+/KtXUcxhNP/3p
         3yN3IenSJQnoWLyo+qbii2U80pgP6o1Bx8udYxaULv2LDALXtyzB9sAAZy/A1abdC0xI
         sML2SEqgqX/3s+jEvv7CK/Gzez5pzl27sR7ZMgJE4OzIeiTKZ/34nL9aT85qXMyy0icA
         6yOQdbcQWMsGe55kKup8oTjfxpLmC+pWkpcgmgalmgl4uixikJzKRXNK3mH9nia0rK0W
         KxIDEhipKXbwAvNjgD2l94OU62NnCG3avhO9VWZ+rw+8m+GpPJkWIZXkCeLc2Fbnskqd
         iWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838951; x=1710443751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aX0pHBwHGGju79HsNY97XucHiC/rnCCXUwNuxYOtOZQ=;
        b=KGqYUmF5EPBzpq6Nlms1B9AO3PqDhGNQOIoI5+Lafb9yaU9Tm+P+wyd3MPjV9FIoWn
         pdUD1RSORElRQ/8yPlTr4JfgjzWhHmlqCQ017nPZ08m814eBCn+oNchvozz7EHDDf5Yp
         ohueZ2Lfwq8WgrN5+MNdrqQyf+lSPLygxknIYTNvBZLRNQegyFV2pumOFPsTJXcjFlmA
         3SLsTfA0ZVALDdNO0prEgaSzHeBJvQw5scnENkFein9sogtS9IMD8mV4itztWh3GE3CN
         l9L6GntRMDoJHvngu+tKevanNmM6A/241u7lCAmpd1Cj+KivG2I2s7galCGQKTPK1TTV
         q/vw==
X-Gm-Message-State: AOJu0Yz58s1NJ25TBw6s+vjPyZ4HdXpdgRM+tzCUt3946JjuftK8LETC
	shFvigywCnR9QS3Nko2kc6ynaYiQZeWQVS8v6WZovA7jIJG6H7FllHzUd/yw
X-Google-Smtp-Source: AGHT+IGKwAKj4debdgnI9zklKOZ/O+z56ha8R7s2Kd4TRgFM9pVqzaOzZmtPDzBiK2g22wqKINXyvg==
X-Received: by 2002:aa7:8889:0:b0:6e5:5cc4:3fef with SMTP id z9-20020aa78889000000b006e55cc43fefmr21307041pfe.11.1709838950512;
        Thu, 07 Mar 2024 11:15:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id p2-20020aa78602000000b006e24991dd5bsm13236211pfn.98.2024.03.07.11.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:15:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] squid: Upgrade to 6.8
Date: Thu,  7 Mar 2024 11:15:48 -0800
Message-ID: <20240307191548.1734114-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 19:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109204

Drop a patch which was needed for older gcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-Wno-error-format-truncation-comp.patch | 120 ------------------
 ...quid-conf-tests-run-on-target-device.patch |   4 -
 .../files/Set-up-for-cross-compilation.patch  |   2 -
 .../files/Skip-AC_RUN_IFELSE-tests.patch      |   6 +-
 ...-serial-tests-config-needed-by-ptest.patch |   2 -
 .../squid/{squid_6.7.bb => squid_6.8.bb}      |   7 +-
 6 files changed, 3 insertions(+), 138 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
 rename meta-networking/recipes-daemons/squid/{squid_6.7.bb => squid_6.8.bb} (94%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch b/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
deleted file mode 100644
index a478dcd80d..0000000000
--- a/meta-networking/recipes-daemons/squid/files/0001-configure-Check-for-Wno-error-format-truncation-comp.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 38e7e90cc2075952c1b74f5fca826f9c6cadb2f0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 11:54:57 -0700
-Subject: [PATCH] configure: Check for -Wno-error=format-truncation compiler
- option
-
-If this option is supported by compiler then disable it ( gcc7+)
-Fixes
-client.c:834:23: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Werror=format-truncation=]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- acinclude/ax_check_compile_flag.m4 | 74 ++++++++++++++++++++++++++++++
- configure.ac                       |  2 +
- 2 files changed, 76 insertions(+)
- create mode 100644 acinclude/ax_check_compile_flag.m4
-
-diff --git a/acinclude/ax_check_compile_flag.m4 b/acinclude/ax_check_compile_flag.m4
-new file mode 100644
-index 0000000..dcabb92
---- /dev/null
-+++ b/acinclude/ax_check_compile_flag.m4
-@@ -0,0 +1,74 @@
-+# ===========================================================================
-+#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EXTRA-FLAGS], [INPUT])
-+#
-+# DESCRIPTION
-+#
-+#   Check whether the given FLAG works with the current language's compiler
-+#   or gives an error.  (Warnings, however, are ignored)
-+#
-+#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
-+#   success/failure.
-+#
-+#   If EXTRA-FLAGS is defined, it is added to the current language's default
-+#   flags (e.g. CFLAGS) when the check is done.  The check is thus made with
-+#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used to
-+#   force the compiler to issue an error when a bad flag is given.
-+#
-+#   INPUT gives an alternative input source to AC_COMPILE_IFELSE.
-+#
-+#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
-+#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
-+#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
-+#
-+#   This program is free software: you can redistribute it and/or modify it
-+#   under the terms of the GNU General Public License as published by the
-+#   Free Software Foundation, either version 3 of the License, or (at your
-+#   option) any later version.
-+#
-+#   This program is distributed in the hope that it will be useful, but
-+#   WITHOUT ANY WARRANTY; without even the implied warranty of
-+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-+#   Public License for more details.
-+#
-+#   You should have received a copy of the GNU General Public License along
-+#   with this program. If not, see <https://www.gnu.org/licenses/>.
-+#
-+#   As a special exception, the respective Autoconf Macro's copyright owner
-+#   gives unlimited permission to copy, distribute and modify the configure
-+#   scripts that are the output of Autoconf when processing the Macro. You
-+#   need not follow the terms of the GNU General Public License when using
-+#   or distributing such scripts, even though portions of the text of the
-+#   Macro appear in them. The GNU General Public License (GPL) does govern
-+#   all other use of the material that constitutes the Autoconf Macro.
-+#
-+#   This special exception to the GPL applies to versions of the Autoconf
-+#   Macro released by the Autoconf Archive. When you make and distribute a
-+#   modified version of the Autoconf Macro, you may extend this special
-+#   exception to the GPL to apply to your modified version as well.
-+
-+#serial 5
-+
-+AC_DEFUN([AX_CHECK_COMPILE_FLAG],
-+[AC_PREREQ(2.64)dnl for _AC_LANG_PREFIX and AS_VAR_IF
-+AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])dnl
-+AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
-+  ax_check_save_flags=$[]_AC_LANG_PREFIX[]FLAGS
-+  _AC_LANG_PREFIX[]FLAGS="$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
-+  AC_COMPILE_IFELSE([m4_default([$5],[AC_LANG_PROGRAM()])],
-+    [AS_VAR_SET(CACHEVAR,[yes])],
-+    [AS_VAR_SET(CACHEVAR,[no])])
-+  _AC_LANG_PREFIX[]FLAGS=$ax_check_save_flags])
-+AS_VAR_IF(CACHEVAR,yes,
-+  [m4_default([$2], :)],
-+  [m4_default([$3], :)])
-+AS_VAR_POPDEF([CACHEVAR])dnl
-+])dnl AX_CHECK_COMPILE_FLAGS
-diff --git a/configure.ac b/configure.ac
-index 2543676..4635474 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,6 +28,7 @@ m4_include([acinclude/pkg.m4])
- m4_include([acinclude/tdb.m4])
- m4_include([acinclude/lib-checks.m4])
- m4_include([acinclude/ax_cxx_compile_stdcxx.m4])
-+m4_include([acinclude/ax_check_compile_flag.m4])
- 
- HOSTCXX="$BUILD_CXX"
- PRESET_CFLAGS="$CFLAGS"
-@@ -59,6 +60,7 @@ AC_USE_SYSTEM_EXTENSIONS
- 
- AC_LANG([C++])
- 
-+AX_CHECK_COMPILE_FLAG([-Werror=format-truncation],[CFLAGS="$CFLAGS -Wno-error=format-truncation" CXXFLAGS="$CXXFLAGS -Wno-error=format-truncation"])
- # Clang 3.2 on some CPUs requires -march-native to detect correctly.
- # GCC 4.3+ can also produce faster executables when its used.
- # But building inside a virtual machine environment has been found to
diff --git a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
index 56c91de3c4..ca1c16b83e 100644
--- a/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
+++ b/meta-networking/recipes-daemons/squid/files/0002-squid-make-squid-conf-tests-run-on-target-device.patch
@@ -17,8 +17,6 @@ Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
  test-suite/test-squid-conf.sh |  2 +-
  2 files changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/test-suite/Makefile.am b/test-suite/Makefile.am
-index 8becdbc..eccd49c 100644
 --- a/test-suite/Makefile.am
 +++ b/test-suite/Makefile.am
 @@ -21,7 +21,7 @@ LDADD = \
@@ -59,8 +57,6 @@ index 8becdbc..eccd49c 100644
  
 -CLEANFILES += squid-conf-tests squid-stderr.log
 +CLEANFILES += squid-conf-tests /var/log/squid-stderr.log
-diff --git a/test-suite/test-squid-conf.sh b/test-suite/test-squid-conf.sh
-index 05fcaf3..a5a8a5a 100755
 --- a/test-suite/test-squid-conf.sh
 +++ b/test-suite/test-squid-conf.sh
 @@ -111,7 +111,7 @@ then
diff --git a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
index ae8706df72..18bc78e6be 100644
--- a/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
+++ b/meta-networking/recipes-daemons/squid/files/Set-up-for-cross-compilation.patch
@@ -16,8 +16,6 @@ Upstream-Status: Pending
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/configure.ac b/configure.ac
-index ca0bc79..c222851 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -29,6 +29,7 @@ m4_include([acinclude/tdb.m4])
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 5bb30bfcb2..e0d002c68c 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -16,8 +16,6 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  acinclude/lib-checks.m4 |  8 ++++++--
  2 files changed, 15 insertions(+), 3 deletions(-)
 
-diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
-index 2c4e340..64648e3 100644
 --- a/acinclude/krb5.m4
 +++ b/acinclude/krb5.m4
 @@ -57,7 +57,15 @@ main(void)
@@ -37,11 +35,9 @@ index 2c4e340..64648e3 100644
      ])
      SQUID_STATE_ROLLBACK(squid_krb5_heimdal_test)
    ])
-diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
-index 53847a8..850322a 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
+@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_
    [
     AC_MSG_RESULT([no])
    ],
diff --git a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
index 732cf17f7b..5df006038b 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-use-serial-tests-config-needed-by-ptest.patch
@@ -14,8 +14,6 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index c7ae568..5e1454e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -10,7 +10,7 @@ AC_PREREQ(2.61)
diff --git a/meta-networking/recipes-daemons/squid/squid_6.7.bb b/meta-networking/recipes-daemons/squid/squid_6.8.bb
similarity index 94%
rename from meta-networking/recipes-daemons/squid/squid_6.7.bb
rename to meta-networking/recipes-daemons/squid/squid_6.8.bb
index a4932cd36c..c8370eaba7 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.8.bb
@@ -12,20 +12,17 @@ LICENSE = "GPL-2.0-or-later"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
 MIN_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://Set-up-for-cross-compilation.patch \
            file://Skip-AC_RUN_IFELSE-tests.patch \
            file://squid-use-serial-tests-config-needed-by-ptest.patch \
            file://run-ptest \
            file://volatiles.03_squid \
-           file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://squid.nm \
            "
 
-SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
-
-SRC_URI[sha256sum] = "7a09a0232026824c300b72c42cc5c0c431cbb65498f41d5dea48ef447ab8037e"
+SRC_URI[sha256sum] = "11cc5650b51809d99483ccfae24744a2e51cd16199f5ff0c917e84fce695870f"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
-- 
2.44.0


