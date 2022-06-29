Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E111BC43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 01:20:40 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6241.1656465638952796133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 18:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25T1KYWe001896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 18:20:34 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Jun 2022 18:20:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 18:20:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Jun 2022 18:20:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] apache2: upgrade 2.4.53 -> 2.4.54
Date: Wed, 29 Jun 2022 09:20:32 +0800
Message-ID: <20220629012032.500807-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 01:20:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97614

From: Changqing Li <changqing.li@windriver.com>

This upgrade include CVE fixes:
CVE-2022-30522
CVE-2022-31813
CVE-2022-28615
CVE-2022-30556
CVE-2022-29404
CVE-2022-26377
CVE-2022-28614
CVE-2022-28330

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0004-apache2-log-the-SELinux-context-at-startup.patch | 8 ++++----
 .../apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb}      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb => apache2_2.4.54.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 5d8291968..a652b7969 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
+From abd5b40c9b094e721e91a5d75132639149d7952f Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -14,7 +14,7 @@ Note: unlikely to be any interest in this upstream
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index c799aec..76811e7 100644
+index ea6cec3..92b74b7 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -491,6 +491,11 @@ getloadavg
@@ -30,7 +30,7 @@ index c799aec..76811e7 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 3020090..8fef5fd 100644
+index 4da7209..d3ca25b 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -43,7 +43,7 @@ index 3020090..8fef5fd 100644
 +
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
- #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
+ #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
 @@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 8413f5379..4b0ed2f62 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
+SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


