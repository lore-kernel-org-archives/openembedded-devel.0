Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.1573.1631668516774029361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 18:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18F1FF2c018013
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 18:15:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18F1FE2G015197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 18:15:14 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 18:15:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 14 Sep 2021 18:15:14 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 18:15:13 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] postgresql: upgrade 13.3 -> 13.4
Date: Wed, 15 Sep 2021 09:10:46 +0800
Message-ID: <20210915011046.12033-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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

