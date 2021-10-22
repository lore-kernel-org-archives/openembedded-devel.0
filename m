Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544CFC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:21:55 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.3532.1634872914232460818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19M3Lq8F005276
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:21:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19M3LY8S019887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:21:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 20:21:34 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 20:21:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-oe][PATCH] postgresql: upgrade 13.3 -> 13.4
Date: Fri, 22 Oct 2021 11:20:37 +0800
Message-ID: <20211022032037.30396-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 03:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93526

From: Changqing Li <changqing.li@windriver.com>

This upgrade fix CVE-2021-3677

refer: https://www.postgresql.org/support/security/CVE-2021-3677/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure.in-bypass-autoconf-2.69-version-check.patch | 11 ++++++++---
 .../{postgresql_13.3.bb => postgresql_13.4.bb}        |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.3.bb => postgresql_13.4.bb} (78%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
index 45f283a02..db9769f82 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 7177d8334a3c28ab0ec5c90e0656f43414929659 Mon Sep 17 00:00:00 2001
+From eba2c940afcd83521f591ccf6b49eca06908ea8e Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.in: bypass autoconf 2.69 version check
@@ -12,11 +12,13 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  configure.in | 4 ----
  1 file changed, 4 deletions(-)
 
+diff --git a/configure.in b/configure.in
+index fb14dcc..a2b4a4f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
+@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [13.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [13.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -25,3 +27,6 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  AC_COPYRIGHT([Copyright (c) 1996-2020, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
similarity index 78%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
index 862dd61bd..f63d23dbe 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.4.bb
@@ -9,4 +9,4 @@ SRC_URI += "\
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
 "
 
-SRC_URI[sha256sum] = "3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1"
+SRC_URI[sha256sum] = "ea93e10390245f1ce461a54eb5f99a48d8cabd3a08ce4d652ec2169a357bc0cd"
-- 
2.17.1


