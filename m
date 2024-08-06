Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53269C52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S6ExwIsY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934013; x=1754470013;
  h=from:to:cc:subject:date:message-id;
  bh=MkUhmYb4V6c1CNhfsvM18AVEAbZ2aFp1kwNr431VCBw=;
  b=S6ExwIsYR02kB7+LES7eX7mMH+b9XtS5UTZfTsQifevgoZGjGnRv0PqB
   +PjLZTJjwSblNErWaYtFAeL/Ph5VQRR8PYn9wAZB1JT/Z51+2gEnJv5ef
   7GpgcTzgTqnpQbl+rMutJeWkm5AtMUcJId3B3h4hBP5tTKOdWjr4MvUF8
   0w0BTEjCKLfEucQqRy+kb52GjjAAy1GPCdhqPFQDsmSTsMInO+UkpyMRA
   4dSGk9GN3lUlvV86YQLH4rgpBByIzcEqaorYhndDTODQC+cwzczCfaGps
   c9rWGNG3ENa33gahURjAOXIcJFqYA4wXiIqtB64CAXZVrWzjOT6BtPPi1
   w==;
X-CSE-ConnectionGUID: AIuvFtbiTZ637H9QfO8XXA==
X-CSE-MsgGUID: T6cGjNHaQIenlD7Oh5vxtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971722"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971722"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D38BD8008
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69351D4C11
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F274BE5A19
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7FAA41A0002;
	Tue,  6 Aug 2024 16:46:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 01/60] apache2: upgrade 2.4.61 -> 2.4.62
Date: Tue,  6 Aug 2024 16:45:35 +0800
Message-Id: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--4.671300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yQPZZctd3P4B/1vXbkGjWeVHpEd1UrzmFbsV
	j+wJQ/DTSI2QcpCbJtZ8vLO0YKIqwi8RBbzC4lPfP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7rCDPw9MoAWIg6/DWZQk8D0J+zUQd7y57JF/NGSuCRQVgx9rCMvPo/UYkZd9+4t2+L7r
	+3vAhmRSY3Wb6azrA8loo+bPXlPP+v2v1IOalyxzsKXyzHgcEbfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTthUfR2rvBju6nw52XVXCkJH4r+KPyhYF+HNsqxDaTGIfZ7mXSxCfHIT3k+ctTTX/DABA+
	UW+zoSAH3GbSrRMbq0SCnxX+TQUnJxXyjvCeBQPaejKE4Zh6Ch0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111518

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-bump-up-the-core-size-limit-if-CoreDumpDirec.patch |  9 +++------
 ...04-apache2-log-the-SELinux-context-at-startup.patch | 10 ++++------
 .../0008-Fix-perl-install-directory-to-usr-bin.patch   |  9 +++------
 .../apache2/{apache2_2.4.61.bb => apache2_2.4.62.bb}   |  2 +-
 4 files changed, 11 insertions(+), 19 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.61.bb => apache2_2.4.62.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
index bbe8b325b..64edeb593 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
@@ -1,4 +1,4 @@
-From 5074ab3425e5f1e01fd9cfa2d9b7300ea1b3f38f Mon Sep 17 00:00:00 2001
+From d1f0389e699e64f3e329c0ce509f79d969a76114 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory is
@@ -16,10 +16,10 @@ Note: upstreaming was discussed but there are competing desires;
  1 file changed, 19 insertions(+)
 
 diff --git a/server/core.c b/server/core.c
-index 090e397..3020090 100644
+index 843b973..3b50100 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -5107,6 +5107,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5143,6 +5143,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
      apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
                                apr_pool_cleanup_null);
@@ -45,6 +45,3 @@ index 090e397..3020090 100644
      return OK;
  }
  
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 1abbe0c41..f8fbc4f3c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From e47cc405eadcbe37a579c375e824e20a5c53bfad Mon Sep 17 00:00:00 2001
+From b31cf12566e806e9e9c3aa01029f6bae3ada0729 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -14,7 +14,7 @@ Note: unlikely to be any interest in this upstream
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index 352711a..f58620f 100644
+index 6319903..bffd8a1 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -514,6 +514,11 @@ gettid
@@ -30,7 +30,7 @@ index 352711a..f58620f 100644
    # On Linux before glibc 2.30, gettid() is only usable via syscall()
    AC_CACHE_CHECK([for gettid() via syscall], ap_cv_gettid,
 diff --git a/server/core.c b/server/core.c
-index 30b317e..81f145f 100644
+index 3b50100..e0c7c7f 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -44,7 +44,7 @@ index 30b317e..81f145f 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
-@@ -5139,6 +5143,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5162,6 +5166,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
@@ -73,5 +73,3 @@ index 30b317e..81f145f 100644
      return OK;
  }
  
---
-2.40.0
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
index dc5b5c88f..4bc2ad6d3 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
@@ -1,4 +1,4 @@
-From 443d15b91d4e4979d92405610303797663f31102 Mon Sep 17 00:00:00 2001
+From 980eadecc128bbbe1233e5d89268be24d14e1873 Mon Sep 17 00:00:00 2001
 From: echo <fei.geng@windriver.com>
 Date: Tue, 28 Apr 2009 03:11:06 +0000
 Subject: [PATCH] Fix perl install directory to /usr/bin
@@ -16,10 +16,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 4df3ff3..4eeb609 100644
+index 4ce0fee..0362f52 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -903,10 +903,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
+@@ -936,10 +936,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
  AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
  	[Location of the MIME types config file, relative to the Apache root directory])
  
@@ -31,6 +31,3 @@ index 4df3ff3..4eeb609 100644
  AC_SUBST(perlbin)
  
  dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index f90e9ee3d..364b4c674 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6"
+SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


