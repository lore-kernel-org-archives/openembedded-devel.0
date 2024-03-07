Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E5FC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 11:39:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21088.1709811547158353314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 03:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eBiP9kNJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379634391c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427B0Lf3000362
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 03:39:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Xz8ws
	ySTx9qjGfyEb1+4ocLtk7g+RKxusjv16MjrI7U=; b=eBiP9kNJH/ZzzQ2EJIpSU
	sNDNysWPd3BCxd0wI9tkuE4M/Z+uk57kM7gN3O8R/zii/fYkdszXdELOfqLHYNMm
	O+HIZoGN0amqvurzGFME7FzY1ORlhhZSPtKA14xcpbc5WG8aLdElpQGkemKc4wYF
	Wd0WWPe0ZXGzHP0Mbvt2PEbXLb5teQIKuorsFjFV41Pi8MbmHI5p9W5tg/xTv9nZ
	vLs5x6ncnfvQYne3SudfXykpX7tOGkmy5UC72+lZK3R+PQicO2YZ9fiuVdOXrlqS
	led/21hesgPAzgamUlHsKJjH8b4J0SXHpqeiFWzLbi/REgnvvPC4rVyD9Cvnp5Tf
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4q2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 03:39:05 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 03:39:04 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Fix CVE-2024-0985
Date: Thu, 7 Mar 2024 11:38:48 +0000
Message-ID: <20240307113848.847275-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: Ml7rI4fZnNTFnLuP_BJDLWL_udpzAc3v
X-Proofpoint-GUID: Ml7rI4fZnNTFnLuP_BJDLWL_udpzAc3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109194

From: Soumya Sambu <soumya.sambu@windriver.com>

Late privilege drop in REFRESH MATERIALIZED VIEW CONCURRENTLY in PostgreSQL
allows an object creator to execute arbitrary SQL functions as the command
issuer. The command intends to run SQL functions as the owner of the
materialized view, enabling safe refresh of untrusted materialized views.
The victim is a superuser or member of one of the attacker's roles. The
attack requires luring the victim into running REFRESH MATERIALIZED VIEW
CONCURRENTLY on the attacker's materialized view. As part of exploiting
this vulnerability, the attacker creates functions that use CREATE RULE to
convert the internally-built temporary table to a view. Versions before
PostgreSQL 15.6, 14.11, 13.14, and 12.18 are affected. The only known
exploit does not work in PostgreSQL 16 and later. For defense in depth,
PostgreSQL 16.2 adds the protections that older branches are using to fix
their vulnerability.

Upstream commit have wrong CVE mentioned but the correct one is CVE-2024-0985

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-0985
https://security-tracker.debian.org/tracker/CVE-2024-0985

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../postgresql/files/CVE-2024-0985.patch      | 98 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_14.9.bb |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch
new file mode 100644
index 000000000..24245406c
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-0985.patch
@@ -0,0 +1,98 @@
+From f2fdea198b3d0ab30b9e8478a762488ecebabd88 Mon Sep 17 00:00:00 2001
+From: Heikki Linnakangas <heikki.linnakangas@iki.fi>
+Date: Mon, 5 Feb 2024 11:01:23 +0200
+Subject: [PATCH] Run REFRESH MATERIALIZED VIEW CONCURRENTLY in right security
+ context
+
+The internal commands in REFRESH MATERIALIZED VIEW CONCURRENTLY are
+correctly executed in SECURITY_RESTRICTED_OPERATION mode, except for
+creating the temporary "diff" table, because you cannot create
+temporary tables in SRO mode. But creating the temporary "diff" table
+is a pretty complex CTAS command that selects from another temporary
+table created earlier in the command. If you can cajole that CTAS
+command to execute code defined by the table owner, the table owner
+can run code with the privileges of the user running the REFRESH
+command.
+
+The proof-of-concept reported to the security team relied on CREATE
+RULE to convert the internally-built temp table to a view. That's not
+possible since commit b23cd185fd, and I was not able to find a
+different way to turn the SELECT on the temp table into code
+execution, so as far as I know this is only exploitable in v15 and
+below. That's a fiddly assumption though, so apply this patch to
+master and all stable versions.
+
+Thanks to Pedro Gallegos for the report.
+
+Security: CVE-2023-5869
+Reviewed-by: Noah Misch
+
+CVE: CVE-2024-0985
+
+Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=patch;h=f2fdea198b3d0ab30b9e8478a762488ecebabd88]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/backend/commands/matview.c | 33 ++++++++++++++++++++++++++-------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/src/backend/commands/matview.c b/src/backend/commands/matview.c
+index 3fc50e8..0aa0a74 100644
+--- a/src/backend/commands/matview.c
++++ b/src/backend/commands/matview.c
+@@ -655,13 +655,35 @@ refresh_by_match_merge(Oid matviewOid, Oid tempOid, Oid relowner,
+						   SPI_getvalue(SPI_tuptable->vals[0], SPI_tuptable->tupdesc, 1))));
+	}
+
++	/*
++	 * Create the temporary "diff" table.
++	 *
++	 * Temporarily switch out of the SECURITY_RESTRICTED_OPERATION context,
++	 * because you cannot create temp tables in SRO context.  For extra
++	 * paranoia, add the composite type column only after switching back to
++	 * SRO context.
++	 */
+	SetUserIdAndSecContext(relowner,
+						   save_sec_context | SECURITY_LOCAL_USERID_CHANGE);
++	resetStringInfo(&querybuf);
++	appendStringInfo(&querybuf,
++					 "CREATE TEMP TABLE %s (tid pg_catalog.tid)",
++					 diffname);
++	if (SPI_exec(querybuf.data, 0) != SPI_OK_UTILITY)
++		elog(ERROR, "SPI_exec failed: %s", querybuf.data);
++	SetUserIdAndSecContext(relowner,
++						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
++	resetStringInfo(&querybuf);
++	appendStringInfo(&querybuf,
++					 "ALTER TABLE %s ADD COLUMN newdata %s",
++					 diffname, tempname);
++	if (SPI_exec(querybuf.data, 0) != SPI_OK_UTILITY)
++		elog(ERROR, "SPI_exec failed: %s", querybuf.data);
+
+-	/* Start building the query for creating the diff table. */
++	/* Start building the query for populating the diff table. */
+	resetStringInfo(&querybuf);
+	appendStringInfo(&querybuf,
+-					 "CREATE TEMP TABLE %s AS "
++					 "INSERT INTO %s "
+					 "SELECT mv.ctid AS tid, newdata.*::%s AS newdata "
+					 "FROM %s mv FULL JOIN %s newdata ON (",
+					 diffname, tempname, matviewname, tempname);
+@@ -790,13 +812,10 @@ refresh_by_match_merge(Oid matviewOid, Oid tempOid, Oid relowner,
+						   "WHERE newdata.* IS NULL OR mv.* IS NULL "
+						   "ORDER BY tid");
+
+-	/* Create the temporary "diff" table. */
+-	if (SPI_exec(querybuf.data, 0) != SPI_OK_UTILITY)
++	/* Populate the temporary "diff" table. */
++	if (SPI_exec(querybuf.data, 0) != SPI_OK_INSERT)
+		elog(ERROR, "SPI_exec failed: %s", querybuf.data);
+
+-	SetUserIdAndSecContext(relowner,
+-						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
+-
+	/*
+	 * We have no further use for data from the "full-data" temp table, but we
+	 * must keep it around because its type is referenced from the diff table.
+--
+2.40.0
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
index a879de20c..d9911fd4a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
@@ -12,6 +12,7 @@ SRC_URI += "\
    file://CVE-2023-5868.patch \
    file://CVE-2023-5869.patch \
    file://CVE-2023-5870.patch \
+   file://CVE-2024-0985.patch \
 "
 
 SRC_URI[sha256sum] = "b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f13b50143cbbb6a8ef"
-- 
2.40.0


