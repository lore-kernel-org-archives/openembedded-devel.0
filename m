Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2330.1795842025694242734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lJGc/5Zt;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8507; q=dns/txt;
  s=iport01; t=1795842025; x=1797051625;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iv1dP3JPXkNiw8IeqvvRNOFJuAMrSnGMOTYuQTcXReY=;
  b=lJGc/5ZtA44qY/00bcgNjxvYrOdCwBw08MGo5Rg/Q8x2zAyV4IPzO1mZ
   jt/lg009k07ZcY1ctTTA6kaxcIRJ+WoWH3Q9V1Nau1pQoKFZkiMJ5R8mj
   m4jKNJMyGrKNCTHTmnNGdcD3O/WTKLKlRGqnQGGQlWBYg9s+ExDV0u3Cm
   YZVuYcJXIkjfy5KJvfGoAaT22ZLFs8VIhiR1mAkRII8lgGzo4cgKa3Pp4
   T0Ypa4h45g6k7a3V/Dc5diJPuAU4pC8rv3oqj4ODqfQ+rxJb6o7rElEqg
   LjPhLvPgamKAHFaf+hwu7hOuZEXQ99pmQ7OjK+Idj8y53HE4gJVpmAXWD
   A==;
X-CSE-ConnectionGUID: hro6qK34QKuiCJm2IGbDuA==
X-CSE-MsgGUID: A/2rOxG1QyamqQECbYAZWg==
X-IPAS-Result: =?us-ascii?q?A0CgAgAEXwpr/9VK/pA+HIJZgld1YENJlCqCIQOBE4pTh?=
 =?us-ascii?q?z6LBYF+DwEBAQ89FAQBAYUFAo4jAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvIAsjCBmDAgGCOgM3A?=
 =?us-ascii?q?xEGQrk2gXkzgQGDKQGBVNhMDXKBaAELFAGBOIVCgwCFJV0YAYR+JxuBSUSBF?=
 =?us-ascii?q?YJ0doIfNgwEgSWGfwSCInoSgVQejHMCgUiIV0iBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDW4ErJl4hgQaBdgKCUYIAAgFGQQ4HR?=
 =?us-ascii?q?VMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQxyORAwHCQvBRcmP?=
 =?us-ascii?q?BsHgQwnHRsXDgIoBhUhC0MYDUgRLDcVGQQ+bgeUEoMcAYENASuBG4ERkz88k?=
 =?us-ascii?q?XqLeJQocYQrjCSPPoV8GjOFW6UYmQiOCoQKkkiEaoFoPDiBITMaCBsVgyIJS?=
 =?us-ascii?q?hkPkBWGZ8oDJjICAQE5AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:DLrSjqw4csZ/12SKB916t+dixyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 jQZXW2COKuCMGTxfYh1PNzi90NQ7JXVxtVlSFE9r1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEEsOtMB2b0rOEJT9
 Nc6LWosQRqvmsvjldpXSsE07igiBMDmJsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2bC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQviOiyboSEIrRmQ+182RyCg
 XLppl3oCxQDDfG0wwuswE2j07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/OOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:MEyI5amN6PvqpzoEnNRJxfwNCUrpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3ALTZIlmiXtB4KHrCp6MPBakm/GzJucmfakm7zeBO?=
 =?us-ascii?q?BKntoY5+QE36/8o95up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApiLF3A3XUy2V5cvtrnmTmZarqTUjyuP0Emcdvsw?=
 =?us-ascii?q?/qsCBLBVdED2spQaITdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="60876690"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:00:23 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id F2FCF18000214
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:00:22 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 9488ECBF201; Fri, 27 Nov 2026 21:00:21 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][blacksail][PATCH 1/1] php: upgrade 8.5.12 -> 8.5.13
Date: Fri, 27 Nov 2026 21:00:20 -0800
Message-Id: <20261128050020.4130975-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261128050020.4130975-1-yurade@cisco.com>
References: <20261128050020.4130975-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 05:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133396
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release.

Patches updated with devtool.

CVE-2026-15353  CVE-2026-48841  CVE-2026-115560 CVE-2026-126714 CVE-2026-127960 CVE-2026-128064 CVE-2026-129182
CVE-2026-129289 CVE-2026-129291 CVE-2026-129292 CVE-2026-129438 CVE-2026-129474 CVE-2026-129481 CVE-2026-129496
CVE-2026-129501 CVE-2026-129506

Changelog: https://www.php.net/ChangeLog-8.php#8.5.13

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit eae5b750c20747cd1001864e63c6e0f8f9258d8f)
Signed-off-by: Yogita Urade <yurade@cisco.com>
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
2.35.6

