Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5948B6FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:42:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u285gwIP014248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Mar 2016 21:42:59 -0800 (PST)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 21:42:58 -0800
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Mar 2016 13:43:20 +0800
Message-ID: <1457415800-21349-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: Security Advisory-postgresql-CVE-2016-0766
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2016 05:43:00 -0000
Content-Type: text/plain

add CVE-2016-0766 patch for avoiding attackers to gain privileges
via unspecified vectors.
Patch comes from:
http://git.postgresql.org/gitweb/?p=postgresql.git;a=summary
commit f4aa3a18a20d51575562520754aa376b3b08b2d0

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 .../files/postgresql-CVE-2016-0766.patch           | 35 ++++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch b/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch
new file mode 100644
index 0000000..df89eb0
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql-CVE-2016-0766.patch
@@ -0,0 +1,35 @@
+From f4aa3a18a20d51575562520754aa376b3b08b2d0 Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Fri, 5 Feb 2016 20:22:51 -0500
+Subject: [PATCH] Force certain "pljava" custom GUCs to be PGC_SUSET.
+
+Future PL/Java versions will close CVE-2016-0766 by making these GUCs
+PGC_SUSET.  This PostgreSQL change independently mitigates that PL/Java
+vulnerability, helping sites that update PostgreSQL more frequently than
+PL/Java.  Back-patch to 9.1 (all supported versions).
+
+Upstream-Status: Backport
+
+Signed-off-by: Noah Misch <noah@leadboat.com>
+Index: postgresql-9.4.4/src/backend/utils/misc/guc.c
+===================================================================
+--- postgresql-9.4.4.orig/src/backend/utils/misc/guc.c	2015-06-10 03:29:38.000000000 +0800
++++ postgresql-9.4.4/src/backend/utils/misc/guc.c	2016-03-04 15:58:26.459266951 +0800
+@@ -7072,6 +7072,17 @@
+ 		!process_shared_preload_libraries_in_progress)
+ 		elog(FATAL, "cannot create PGC_POSTMASTER variables after startup");
+ 
++	/*
++	 * Before pljava commit 398f3b876ed402bdaec8bc804f29e2be95c75139
++	 * (2015-12-15), two of that module's PGC_USERSET variables facilitated
++	 * trivial escalation to superuser privileges.  Restrict the variables to
++	 * protect sites that have yet to upgrade pljava.
++	 */
++	if (context == PGC_USERSET &&
++		(strcmp(name, "pljava.classpath") == 0 ||
++		 strcmp(name, "pljava.vmoptions") == 0))
++		context = PGC_SUSET;
++
+ 	gen = (struct config_generic *) guc_malloc(ERROR, sz);
+ 	memset(gen, 0, sz);
+ 
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index dbc02a0..06e601f 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -31,6 +31,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql-setup \
     file://postgresql.service \
     file://0001-Use-pkg-config-for-libxml2-detection.patch \
+    file://postgresql-CVE-2016-0766.patch \
 "
 
 LEAD_SONAME = "libpq.so"
-- 
1.9.1


