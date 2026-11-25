Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32941.1795567911373503303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 16:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rECouipF;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: schonm@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9496317b730so605913485a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795567910; x=1796172710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZWoc3H68fjnk+bYJrvMBCy8LcTSqFbUx8E1dx4g9hQ=;
        b=rECouipFHC2L3NeabZ+mzOBV6zuef6Auf88ppoXavSAPvqNsS3wtgJBntRE7CtzBDQ
         j+DQQLXu0zt6PN0qR2qe/nzWMnuB4ERtz8lec1t00gLcCdvOMy4ozXJ6e/ycs64tAkCP
         MdPPsNfkjJaQuDRbQH3HJLq+P7X7ZWLU15oHtKJBU4zZOu3EhDa+oePCZs9E5lwVnO3u
         yMXuKg1YhWCjLLJlv/LGz0AbwuaSh4r8yyuWinIftJdrkNVayupdbcii3M+Qc3a73Vu1
         gLwx+MeqTZ6yp00DbKK9bKwRIoFAoFwiaF9iZzNcgzMlp2TiqxkBkGGds2CNNcJYcmXu
         gh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567910; x=1796172710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZWoc3H68fjnk+bYJrvMBCy8LcTSqFbUx8E1dx4g9hQ=;
        b=qRBqGTDizYdaMDb0Xjd40tyPijGgkpvCGPTWfH5AWB7OEHhSWYqauIde1Y7renM10w
         4jYoNFoSbWjlrog7jwtJw3ORXX4Tztz1cqrZZWLBU6YWHarsU7HSpbn0Jx19k86aYrO9
         Nn22UGu1ODfbHniRCu9rUmCrVVqnQ4q2AqjfXjSBZ2vumkP/DpKQxIzM7RQkzeUO8vZL
         bURgbjYHZIUfJFqcOob40oe5C2czDQRf1t9qCnnmyiooefnwTmeb6NWecxG9yeQFw7mo
         7rRAyAtVRbL+3JMODNBuOUtxlhSuSuxTjP3YkMXvfKKP5kvki8Vmue5wjluzxA3YWDA9
         If7A==
X-Gm-Message-State: APuU4Z+RbvBroZGMOUo/K2BqJ65D2ACLcpTEJ7fEFh0IDjRUO6ihWfLe
	cl/eIgs8UU3nXBqesx5xi89Qm26avetQ9LLXJEQhdcPr5cLPORuoShAIfmBgXE/c
X-Gm-Gg: AZFdTZdTOYFshp3sOWILxXGFqqAbiIXdRsMpaUqUmwcjS1UhnXunlOANyhOUMTmOWfW
	jNxQxHyOUDjKrZZcbwm5yWWoE4Pe4FZdGunHn93V4KC+pbXfgCumtgKGuFPa8o/3IvJuMJ1x0dz
	4DMPBMPPmZ3DAsegS4gyZFcpxDxnlO+P/E8tCtRAMR+llcdFZDu3N544MZflLgF6028SCOz7L1B
	bvLhYoXlbPWvUgA+d9BJMtxYvAPbmkT1ma5CHzN97qYXcTFYVUaVLc69AH/RJR1BFxrj2dtlFaC
	p3aJ6rqbnWmoqeHOyWTRuhBjtrq0yweYHUOBd3pSQEmNUwiA0YHeC51nYoBTrg+/hiKlDpiWjPB
	5eA9WOtaDccA8vAzHdUi21xIkFw7VigoSSCV3Y1VhHAl/oQGTcrogBgrQTUExVNgPVCfGgIUXQW
	2eBLn6T/+yf0egdn+9TJ2uEdpsaUSdr3S2Kss8PMl1Ukgud74qVPa+iUOkpQcL0RE7NsemrIuwU
	2Ie6tZsJ1kvNnxZV3Xm0RaqQR60EnxtyLCkzBoR4GyLARxBWX9yLSVFOwQ9rO9IRPYu904WhMAp
	gf4DOs2HIOTsJal7str1x/hbWh5pvweazCswl2YFNVuCJvXLiJoWHXi6OAgYK7upXtZRBOQg3fz
	PPT4YHQep6T3prYfy7f5+2dDe3a+iYSGHi83rJZ6vq1PQoGMK/dolxJJiC5g=
X-Received: by 2002:a05:620a:63ca:b0:93f:3bb5:5452 with SMTP id af79cd13be357-949ba99c7d9mr2674879285a.15.1795567909873;
        Tue, 24 Nov 2026 16:51:49 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from testing.lan ([8.40.85.38])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a8d3sm1182491085a.10.2026.11.24.16.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:51:49 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.35 -> 8.2.36
Date: Tue, 24 Nov 2026 19:51:44 -0500
Message-ID: <20261125005144.869543-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132961
Content-Type: text/plain; charset="utf-8"

This is a security release.

CVE-2026-15353  CVE-2026-115560 CVE-2026-126714 CVE-2026-127960 CVE-2026-128064 CVE-2026-128090
CVE-2026-129289 CVE-2026-129291 CVE-2026-129292 CVE-2026-129496 CVE-2026-129506 CVE-2026-129538

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...er-to-inline-XXH3_hashLong_withSecret-to.patch |  5 +----
 ...001-ext-opcache-config.m4-enable-opcache.patch |  7 ++-----
 ...build-php.m4-don-t-unset-cache-variables.patch | 11 ++++-------
 ...move-host-specific-info-from-header-file.patch | 11 ++++-------
 ...figure.ac-don-t-include-build-libtool.m4.patch |  9 +++------
 .../0005-pear-fix-Makefile.frag-for-Yocto.patch   | 15 +++++----------
 ...xt-phar-Makefile.frag-Fix-phar-packaging.patch |  8 +++++---
 ...7-sapi-cli-config.m4-fix-build-directory.patch |  9 +++------
 ...008-ext-imap-config.m4-fix-include-paths.patch | 13 +++++--------
 ...9-php-don-t-use-broken-wrapper-for-mkdir.patch | 11 +++--------
 .../php/php/0010-iconv-fix-detection.patch        | 11 ++++-------
 .../php/{php_8.2.35.bb => php_8.2.36.bb}          |  2 +-
 12 files changed, 40 insertions(+), 72 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.35.bb => php_8.2.36.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch b/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
index 5b8c76209a..46453b2b86 100644
--- a/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch
@@ -1,4 +1,4 @@
-From 1eeb59366d6140a799f6051fb9f57d988b81fd5b Mon Sep 17 00:00:00 2001
+From d2b832f14e792ba75e9be372c9914820afb0e69b Mon Sep 17 00:00:00 2001
 From: easyaspi314 <easyaspi314@users.noreply.github.com>
 Date: Wed, 12 Apr 2023 13:33:07 +0800
 Subject: [PATCH] Change whether to inline XXH3_hashLong_withSecret to a config
@@ -88,6 +88,3 @@ index b5bd2864..8e816c05 100644
  XXH3_hashLong_128b_withSecret(const void* XXH_RESTRICT input, size_t len,
                                XXH64_hash_t seed64,
                                const void* XXH_RESTRICT secret, size_t secretLen)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index 496213540b..7ee5a9f99b 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -1,7 +1,7 @@
-From aa99f9db92817358d6b91040cc555f5ca31b727c Mon Sep 17 00:00:00 2001
+From ed7e21855da82e39b28ce0a437db2fb27479588c Mon Sep 17 00:00:00 2001
 From: Yogita Urade <yogita.urade@windriver.com>
 Date: Mon, 25 Nov 2024 07:07:38 +0000
-Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
+Subject: [PATCH] ext/opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile
 environment. Set the variables directly instead since we know
@@ -252,6 +252,3 @@ index b3929382..ba1a9aff 100644
  
    AX_CHECK_COMPILE_FLAG([-Wno-implicit-fallthrough],
      [PHP_OPCACHE_CFLAGS="$PHP_OPCACHE_CFLAGS -Wno-implicit-fallthrough"],,
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
index 6183f49c28..6c54548fdf 100644
--- a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
+++ b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
@@ -1,7 +1,7 @@
-From 1af203e8e385d46ad3e33b1c253b1c564aa99034 Mon Sep 17 00:00:00 2001
+From fbcb3a6ebf2ac290561ff2563d111111523b595e Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:01:55 -0500
-Subject: [PATCH 02/11] build/php.m4: don't unset cache variables
+Subject: [PATCH] build/php.m4: don't unset cache variables
 
 Unsetting prevents cache variable from being passed to configure.
 
@@ -19,7 +19,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index 9746ba28f3..93551d9ca7 100644
+index e13fc336..b88073e0 100644
 --- a/build/php.m4
 +++ b/build/php.m4
 @@ -1568,8 +1568,6 @@ dnl PHP_CHECK_FUNC_LIB
@@ -31,7 +31,7 @@ index 9746ba28f3..93551d9ca7 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1601,8 +1599,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1604,8 +1602,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
@@ -40,6 +40,3 @@ index 9746ba28f3..93551d9ca7 100644
    unset found
  
    AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
index 9637ed9516..297b6304b8 100644
--- a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
@@ -1,7 +1,7 @@
-From c81d0bd3491a6c6371d9df2f43956d109f984310 Mon Sep 17 00:00:00 2001
+From d0c06f11f7465b8b6accbec1e9d47cb7c0b68b66 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:02:29 -0500
-Subject: [PATCH 03/11] php: remove host specific info from header file
+Subject: [PATCH] php: remove host specific info from header file
 
 Based on:
 https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
@@ -19,10 +19,10 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1eafd62a44..90c94323aa 100644
+index c999a1e0..653ece48 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1289,7 +1289,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
+@@ -1462,7 +1462,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $PHP_LDFLAGS"
  EXTRA_LDFLAGS_PROGRAM="$EXTRA_LDFLAGS_PROGRAM $PHP_LDFLAGS"
  
@@ -31,6 +31,3 @@ index 1eafd62a44..90c94323aa 100644
  PHP_UNAME=${PHP_UNAME:-$UNAME}
  AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
  PHP_OS=`uname | xargs`
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
index 19a8bf8e4f..886a76e37c 100644
--- a/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
+++ b/meta-oe/recipes-devtools/php/php/0004-configure.ac-don-t-include-build-libtool.m4.patch
@@ -1,7 +1,7 @@
-From 41ef1121682c245b10df7de4b78c45baf9114c04 Mon Sep 17 00:00:00 2001
+From b5a636198f1399cd7786bd97d0a1d84b06efbbb8 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:03:46 -0500
-Subject: [PATCH 04/11] configure.ac: don't include build/libtool.m4
+Subject: [PATCH] configure.ac: don't include build/libtool.m4
 
 we delete build/libtool.m4 before do_configure,
 we will use libtool.m4 under ACLOCALDIR
@@ -17,7 +17,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 90c94323aa..161e7c3f53 100644
+index 653ece48..280b5608 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
@@ -28,6 +28,3 @@ index 90c94323aa..161e7c3f53 100644
  m4_include([build/php_cxx_compile_stdcxx.m4])
  m4_include([build/php.m4])
  m4_include([build/pkg.m4])
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
index 37752ef949..aefb8f1938 100644
--- a/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
+++ b/meta-oe/recipes-devtools/php/php/0005-pear-fix-Makefile.frag-for-Yocto.patch
@@ -1,24 +1,22 @@
-From f22958b4c1348eec3bb4c0f2cbe2d22676e0ad23 Mon Sep 17 00:00:00 2001
+From 2a4b86e361823a1088adda0c3ccb788cb0d37676 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:04:29 -0500
-Subject: [PATCH 05/11] pear: fix Makefile.frag for Yocto
+Subject: [PATCH] pear: fix Makefile.frag for Yocto
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 update patch to 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
-Upstream-Status: Pending
-
  pear/Makefile.frag | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pear/Makefile.frag b/pear/Makefile.frag
-index 9408757a3a..69072f39e0 100644
+index 366ad4a9..793e9484 100644
 --- a/pear/Makefile.frag
 +++ b/pear/Makefile.frag
-@@ -10,7 +10,7 @@ PEAR_SUFFIX = -ds a$(program_suffix)
- PEAR_INSTALLER_URL = https://pear.php.net/install-pear-nozlib.phar
+@@ -7,7 +7,7 @@ PEAR_PREFIX = -dp a${program_prefix}
+ PEAR_SUFFIX = -ds a$(program_suffix)
  
  install-pear-installer: $(SAPI_CLI_PATH)
 -	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) pear/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
@@ -26,6 +24,3 @@ index 9408757a3a..69072f39e0 100644
  
  install-pear:
  	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index acf2940839..dd0ea6ef30 100644
--- a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
+++ b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -1,7 +1,7 @@
-From eab5babdadea487bbbef025068c553f5ba741774 Mon Sep 17 00:00:00 2001
+From 69bd918d434bca236db5b679d68ebafe38e12c8d Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:07:25 -0500
-Subject: [PATCH 06/11] ext/phar/Makefile.frag: Fix phar packaging
+Subject: [PATCH] ext/phar/Makefile.frag: Fix phar packaging
 
 Inherited from OE-Classic, with some additions to fix host paths leaking
 into the target package.
@@ -18,9 +18,11 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  ext/phar/Makefile.frag | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
 
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index 7a867dd7..4dbcafd4 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
-@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir
+@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
  
  PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
  PHP_PHARCMD_EXECUTABLE = ` \
diff --git a/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch b/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
index 9776e7f6db..79c8fbb418 100644
--- a/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
+++ b/meta-oe/recipes-devtools/php/php/0007-sapi-cli-config.m4-fix-build-directory.patch
@@ -1,7 +1,7 @@
-From 03aa51625e0d1aa156c2f7cd71503b1f435d35a4 Mon Sep 17 00:00:00 2001
+From 2e941785139745116fc525164511e8b29cb9363e Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:08:06 -0500
-Subject: [PATCH 07/11] sapi/cli/config.m4: fix build directory
+Subject: [PATCH] sapi/cli/config.m4: fix build directory
 
 Upstream-Status: Inappropriate
 
@@ -15,7 +15,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index d17d531683..f2f87f9164 100644
+index 1b8e67f0..f0249194 100644
 --- a/sapi/cli/config.m4
 +++ b/sapi/cli/config.m4
 @@ -47,7 +47,7 @@ if test "$PHP_CLI" != "no"; then
@@ -27,6 +27,3 @@ index d17d531683..f2f87f9164 100644
    PHP_SUBST(PHP_EXECUTABLE)
  
    dnl Expose to Makefile.
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
index 78bae58e00..b51231628a 100644
--- a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
+++ b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
@@ -1,7 +1,7 @@
-From c3c20db4415e0f6c4a601d6f9da1f3746a96b301 Mon Sep 17 00:00:00 2001
+From 91168e75221d7c48946c124abe1027016365cf7f Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:08:58 -0500
-Subject: [PATCH 08/11] ext/imap/config.m4: fix include paths
+Subject: [PATCH] ext/imap/config.m4: fix include paths
 
 Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -13,10 +13,10 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
-index 5086a312d0..0e938bd544 100644
+index 3c4782cd..8621d9ef 100644
 --- a/ext/imap/config.m4
 +++ b/ext/imap/config.m4
-@@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
+@@ -122,7 +122,7 @@ if test "$PHP_IMAP" != "no"; then
      PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
      AC_DEFINE(HAVE_IMAP,1,[ ])
  
@@ -25,7 +25,7 @@ index 5086a312d0..0e938bd544 100644
        IMAP_INC_CHK()
        el[]IMAP_INC_CHK(/include/c-client)
        el[]IMAP_INC_CHK(/include/imap)
-@@ -199,13 +199,7 @@ if test "$PHP_IMAP" != "no"; then
+@@ -211,13 +211,7 @@ if test "$PHP_IMAP" != "no"; then
        AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
      fi
  
@@ -40,6 +40,3 @@ index 5086a312d0..0e938bd544 100644
        IMAP_LIB=$lib
        IMAP_LIB_CHK($PHP_LIBDIR)
        IMAP_LIB_CHK(c-client)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
index b5a33cca7f..d1146bbe24 100644
--- a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -1,7 +1,7 @@
-From 8707720c0aea405f0e06d67354f239232cc823cc Mon Sep 17 00:00:00 2001
+From 56b0a53255b4507f64b9023d0be788097a86e7f6 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:02 -0500
-Subject: [PATCH 09/11] php: don't use broken wrapper for mkdir
+Subject: [PATCH] php: don't use broken wrapper for mkdir
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
@@ -11,13 +11,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 update patch to version 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
-Upstream-Status: Pending
-
  build/Makefile.global | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/build/Makefile.global b/build/Makefile.global
-index 6566d052de..eb39421f2a 100644
+index b11ce20a..94e6c7b1 100644
 --- a/build/Makefile.global
 +++ b/build/Makefile.global
 @@ -1,4 +1,4 @@
@@ -26,6 +24,3 @@ index 6566d052de..eb39421f2a 100644
  INSTALL = $(top_srcdir)/build/shtool install -c
  INSTALL_DATA = $(INSTALL) -m 644
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
index e3b8cd4707..e31c93aa9e 100644
--- a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
@@ -1,7 +1,7 @@
-From a04aabc5b80371e579fbaffdd417627390d22722 Mon Sep 17 00:00:00 2001
+From be0c051a094b9104e3b308b02f80c9844eb5f3c8 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:33 -0500
-Subject: [PATCH 10/11] iconv: fix detection
+Subject: [PATCH] iconv: fix detection
 
 Upstream-Status: Pending
 
@@ -17,10 +17,10 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index 93551d9ca7..dba50825fb 100644
+index b88073e0..131973b2 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1945,7 +1945,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    unset ICONV_DIR
  
    dnl Check libc first if no path is provided in --with-iconv.
@@ -30,6 +30,3 @@ index 93551d9ca7..dba50825fb 100644
      dnl Reset LIBS temporarily as it may have already been included -liconv in.
      LIBS_save="$LIBS"
      LIBS=
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.2.35.bb b/meta-oe/recipes-devtools/php/php_8.2.36.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.35.bb
rename to meta-oe/recipes-devtools/php/php_8.2.36.bb
index 282427d8b3..c7bffa3087 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.35.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.36.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "0f43efd1ac24d4f90002c8d4d570bf4c4d59fa14313bf270aae8cf04d9dfdef3"
+SRC_URI[sha256sum] = "f4306b4ada602637ef35df2e0f4aa059d559952bc87926ed746fad2b0a777b72"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0

