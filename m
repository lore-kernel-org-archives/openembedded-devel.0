Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4185.1795143426325121162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 18:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RbYyxfZs;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67dabd38cdfso732719d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795143425; x=1795748225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXScchKaX22w1eee0C1SIDKkDzwltxDtU+H7xKHaYxE=;
        b=RbYyxfZsL4GwyP9RUShEreaI3zHfxIW1TtffzVx678c3Lr/K3I/VBKOXIUg9fsOeIL
         JfV768Q/Xba8NWiQCDdB1UlOJcRsMdft5olZddTt1yJ0TSN6A9+Z3kh4QhVS0T6uygA8
         WaC2sTVsOLgBXlBfnpxrMb5Evv/u0c1fHfPJ3l0nUX623zNaFCr0zZRXz4hrAOkgtH7G
         BEgFDIVd9eWuCnOES04LANdnhMoHRRt6rVUKn6Db9SmUUIqLEYu9vbQ1xW/Kt1KOegB9
         Xs1LOtBPxRqnvBjA7V1Csfxot/4iuG7D8fnTEr/TzpYyARP7J2f0S8RnAwK7Xu63KrTl
         EMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143425; x=1795748225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXScchKaX22w1eee0C1SIDKkDzwltxDtU+H7xKHaYxE=;
        b=uNh/htKAgOvJiyQIK2vjf8g1dgYWJH9grRC8ZNoQWHna7YO8ZILZJ6VHDbiZTvBtGe
         g8Jy8IscoUQ7MkSPWbiJS1ZCXivFjXg7nAFZ6hE+Qnu3cSgd4nCR98Ui8/x0KVaw2ome
         BTETpTvunA4k3G3z3vCCpqUCkV4hhA7ZqhF0da7duk7I8oML7XwYMgal/beIQtg5AS4u
         n99HIYV8q2dFRr2s/sFDvE3c+E9W84+I/MC62zIkHlwz0Eb6Q7pJRtZsAUmZIkT6EcFt
         RULUtOFpwscdlm/WObITPRvdtloOJKEoElvDJzOLZUT+/e/PiHcGKn9I5+uFEbdddsPU
         RtLA==
X-Gm-Message-State: APuU4Z8yUCQSZJjl36O+giBpF7AUNOtROHPxyF7jQ7/gJ4Yt5Z1qLEvF
	c/q847ZnEa+TQXgkBcSrUByT+Y8njMANNjTdtFyU/ewgLD9tjgsQmr30DW/EXkzc
X-Gm-Gg: AZFdTZciapvuQYueDHFTX0nlGaht8idOLebLmwPp/4TBQjGkm7m8Blps2jFtuTQ8miI
	p+HrXKFmhXul1OIOyQMGSLsjAjS+RSiC7pLcFc8kvTUUZpatpnfRfj3UeWkKsYrP0Ee7CXgZ7cH
	2+RE6xRXJBhQvTnCZ4tCxVbpxjeMr89PpFxK/ovZ30ZrvN99Xl6m1tdquC6kwA3d2ebVzRpLZGB
	bzUbl42bqQxBvhUk/ywjTxmqFjw1rpx8MZiv1URE45BUsvROReKjP6xQopQNmb5Qxbt2ZbdEzJ/
	lTxCnIMLrS+SfqjWqMvrd3zyz6y6/9eyI2Bs6JIG3BZST5tDSClwL8WS6QvmnWjtJbTcUAAjV8k
	thgBJyjCJr5+qYp35LOfGrCnaEXi1GLZin3RHe5D85UDNWRX72oYoTkXOOt0JXyixFB592Kq093
	BQF41f7yhAB9/R4RC8cjIOnF7XAICbTs2Q3x/j67AERAZMUwTHKsw/KskvMjh+KtsWCDyuAWmZP
	VJvPgWY4VIUi0M4trDFKwOzQEmZtDQVofhCe2E1BGvlivGF3DdmZkOnA8B/dOFqUdL591DKz1Xg
	Wi3Qhv9cOrY4ZSDf9Cg3QJiPdT7y1j6ciy5ptrFKOGAZVfMWVXYZsBcf0FMgoeN6x513q9dsTl5
	FFmn0nUtZUT2+BBh2pNG+96rlPpLj6B9hzf2TBG9jyYKlwLyYj88I
X-Received: by 2002:a05:690e:1247:b0:67d:ebad:8ca2 with SMTP id 956f58d0204a3-67df4410cabmr718360d50.53.1795143425022;
        Thu, 19 Nov 2026 18:57:05 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df30e4407sm1078275d50.0.2026.11.19.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:57:03 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.12 -> 8.5.13
Date: Thu, 19 Nov 2026 21:56:43 -0500
Message-ID: <20261120025643.1718331-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 02:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132755
Content-Type: text/plain; charset="utf-8"

This is a security release.

Patches updated with devtool.

CVE-2026-15353  CVE-2026-48841  CVE-2026-115560 CVE-2026-126714 CVE-2026-127960 CVE-2026-128064 CVE-2026-129182
CVE-2026-129289 CVE-2026-129291 CVE-2026-129292 CVE-2026-129438 CVE-2026-129474 CVE-2026-129481 CVE-2026-129496
CVE-2026-129501 CVE-2026-129506

Changelog: https://www.php.net/ChangeLog-8.php#8.5.13

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...onfigure.ac-don-t-include-build-libtool.m4.patch |  9 +++------
 ...-ext-phar-Makefile.frag-Fix-phar-packaging.patch |  9 +++------
 .../php/php/0003-iconv-fix-detection.patch          |  6 +++---
 .../php/0004-pear-fix-Makefile.frag-for-Yocto.patch | 13 +++++--------
 ...-not-generate-phar.php-during-cross-compil.patch |  5 +----
 .../php/{php_8.5.12.bb => php_8.5.13.bb}            |  2 +-
 6 files changed, 16 insertions(+), 28 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.12.bb => php_8.5.13.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
index fae8697fd4..ae57c012ff 100644
--- a/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-configure.ac-don-t-include-build-libtool.m4.patch
@@ -1,7 +1,7 @@
-From 6da78888b934dc10720a6e0e520536077cc2aac2 Mon Sep 17 00:00:00 2001
+From 18ab3bb29863f639c6f69d8464f5e31223425f63 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:03:46 -0500
-Subject: [PATCH 1/5] configure.ac: don't include build/libtool.m4
+Subject: [PATCH] configure.ac: don't include build/libtool.m4
 
 we delete build/libtool.m4 before do_configure,
 we will use libtool.m4 under ACLOCALDIR
@@ -17,7 +17,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9d79720a2..9353e2f6e 100644
+index b0ea82bf..31933cca 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -6,7 +6,6 @@ dnl ----------------------------------------------------------------------------
@@ -28,6 +28,3 @@ index 9d79720a2..9353e2f6e 100644
  m4_include([build/php_cxx_compile_stdcxx.m4])
  m4_include([build/php.m4])
  m4_include([build/pkg.m4])
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch b/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index b2c4f8840f..fe1393cc6f 100644
--- a/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
+++ b/meta-oe/recipes-devtools/php/php/0002-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -1,7 +1,7 @@
-From f7724d7ccd157058630e6a887798ab6d3e34c6b7 Mon Sep 17 00:00:00 2001
+From 36809a52857fd60f2a4707d4db2514072ceffe61 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:07:25 -0500
-Subject: [PATCH 2/5] ext/phar/Makefile.frag: Fix phar packaging
+Subject: [PATCH] ext/phar/Makefile.frag: Fix phar packaging
 
 Inherited from OE-Classic, with some additions to fix host paths leaking
 into the target package.
@@ -19,7 +19,7 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 3 insertions(+), 14 deletions(-)
 
 diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-index cedde76df..09d577d73 100644
+index cedde76d..09d577d7 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
 @@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
@@ -46,6 +46,3 @@ index cedde76df..09d577d73 100644
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
index 745bc2140d..91e4563292 100644
--- a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
@@ -1,4 +1,4 @@
-From d9fc6b314cefe010a0deb6e591719cfb0ff226a5 Mon Sep 17 00:00:00 2001
+From 4f65f373989fab85328be28423e97c70bce3ec08 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:33 -0500
 Subject: [PATCH] iconv: fix detection
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index d8a5cbf0..aee21924 100644
+index 0a2169f6..a93ce1f5 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1829,7 +1829,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1786,7 +1786,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
      [Define to 1 if you have the 'libiconv' function.])
  
    dnl Check libc first if no path is provided in --with-iconv.
diff --git a/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch b/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
index 23641be2c6..635f19b744 100644
--- a/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
+++ b/meta-oe/recipes-devtools/php/php/0004-pear-fix-Makefile.frag-for-Yocto.patch
@@ -1,7 +1,7 @@
-From 35d7d40ac49c96b7a9a19b2f6593abb9f18ade2b Mon Sep 17 00:00:00 2001
+From c4bb3b277abe7867e0eb9f5170195a865a3876b2 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:04:29 -0500
-Subject: [PATCH 4/5] pear: fix Makefile.frag for Yocto
+Subject: [PATCH] pear: fix Makefile.frag for Yocto
 
 Upstream-Status: Pending
 
@@ -14,11 +14,11 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pear/Makefile.frag b/pear/Makefile.frag
-index 9408757a3..69072f39e 100644
+index fc56dfcb..e39472b4 100644
 --- a/pear/Makefile.frag
 +++ b/pear/Makefile.frag
-@@ -10,7 +10,7 @@ PEAR_SUFFIX = -ds a$(program_suffix)
- PEAR_INSTALLER_URL = https://pear.php.net/install-pear-nozlib.phar
+@@ -7,7 +7,7 @@ PEAR_PREFIX = -dp a${program_prefix}
+ PEAR_SUFFIX = -ds a$(program_suffix)
  
  install-pear-installer: $(SAPI_CLI_PATH)
 -	@$(top_builddir)/sapi/cli/php $(PEAR_INSTALL_FLAGS) pear/install-pear-nozlib.phar -d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
@@ -26,6 +26,3 @@ index 9408757a3..69072f39e 100644
  
  install-pear:
  	@echo "Installing PEAR environment:      $(INSTALL_ROOT)$(peardir)/"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch b/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
index 469d26e06b..de2b5dcdce 100644
--- a/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
+++ b/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
@@ -1,4 +1,4 @@
-From 41c8c5821fc74efea8b086927a17aa3bc7aef6bb Mon Sep 17 00:00:00 2001
+From c99cba1ddfaea0839240220129727c8411ee46f0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 18 Nov 2025 16:25:28 +0800
 Subject: [PATCH] explicitly not generate phar.php during cross-compile
@@ -30,6 +30,3 @@ index 09d577d7..2f85847c 100644
  
  $(builddir)/phar.php: $(srcdir)/build_precommand.php $(srcdir)/phar/*.inc $(srcdir)/phar/*.php $(SAPI_CLI_PATH)
  	-@(echo "Generating phar.php"; \
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.5.12.bb b/meta-oe/recipes-devtools/php/php_8.5.13.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.12.bb
rename to meta-oe/recipes-devtools/php/php_8.5.13.bb
index f9759cf7a5..0fbcfd6ea2 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.13.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
+SRC_URI[sha256sum] = "47d50c36016784a4a71f019cd7bfa29c31e4be0de22d3fa06095b280a6299e2f"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.43.0

