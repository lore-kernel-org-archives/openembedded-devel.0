Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90912C61DA4
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 08:10:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7311.1675150772536881186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 23:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CBMjS0Kj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395c48469=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V6d1Ae004859
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 07:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Se1WjwMtLZ2f/sDCubEQZQkoiAtfSN69UhlqaY/VIcE=;
 b=CBMjS0KjqAYwFwMqF4oZIzpvb0GsUia41umvpcMthZXkS9WLmpJTuVpF1ULDchv0e9Tl
 SganWjEpHMtHw+J1kI+tmn3Po54THnLsekWiHlxSLdVcPSyzAhoRvu+qAAQ5Kls/RV2e
 0bpacMQMQ1wqQFbRMaQUXcG+F6ZB2SRQtZINN8s5Ms/u7rISNMoFzwYNKzeRopM3OcM6
 kgo361qIjstAeilS+lCWNTm+UfBV+tSpIHH1ViVeHomU+0y8iJWoviX9aCMSIsLOfhuT
 uElOE8/X+gQObS/06GARvaIBRda+qkSkpQIXZspiPn3LSCS33Xo9K4jDmPQYW5cR//h9 MA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3b4p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 07:39:31 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 30 Jan 2023 23:39:30 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 30 Jan 2023 23:39:28 -0800
From: "Manoj Saun" <manojsingh.saun@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Manoj
 Saun" <manojsingh.saun@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] postresql: fix ptest failure about sysviews
Date: Tue, 31 Jan 2023 07:39:24 +0000
Message-ID: <20230131073924.1080567-1-manojsingh.saun@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: m6yjL57XJhO2CwUPTkqiCpESQHlGln6J
X-Proofpoint-ORIG-GUID: m6yjL57XJhO2CwUPTkqiCpESQHlGln6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1011 mlxlogscore=789 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310067
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 08:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100921

In postgresql sysview ptest are failing due to hidden debug info in pg_config table.
The information is hidden due to existing patch 0001-config_info.c-not-expose-build-info.patch
So for passing the test we need to reduce the row count in the sysviews test.

Upstream-Status: Inappropriate [oe specific]

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 ...sql-fix-ptest-failure-about-sysviews.patch | 43 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_14.5.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-postresql-fix-ptest-failure-about-sysviews.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postresql-fix-ptest-failure-about-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0001-postresql-fix-ptest-failure-about-sysviews.patch
new file mode 100644
index 000000000..224732daf
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-postresql-fix-ptest-failure-about-sysviews.patch
@@ -0,0 +1,43 @@
+From c68f036b0f80812a806719dc218dc222eb24259f Mon Sep 17 00:00:00 2001
+From: Manoj Saun <manojsingh.saun@windriver.com>
+Date: Tue, 3 Jan 2023 05:45:35 +0000
+Subject: [PATCH] postresql: fix ptest failure about sysviews
+
+The patch "0001-config_info.c-not-expose-build-info.patch" hides the debug info
+in pg_config table which reduces the count of rows from pg_config and leads to
+sysviews test failure.
+To fix it we need to reduce the count of parameters in sysviews test.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+---
+ src/test/regress/expected/sysviews.out | 2 +-
+ src/test/regress/sql/sysviews.sql      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
+index 001c6e7eb9..82568989d8 100644
+--- a/src/test/regress/expected/sysviews.out
++++ b/src/test/regress/expected/sysviews.out
+@@ -29,7 +29,7 @@ select name, ident, parent, level, total_bytes >= free_bytes
+ (1 row)
+ 
+ -- At introduction, pg_config had 23 entries; it may grow
+-select count(*) > 20 as ok from pg_config;
++select count(*) > 13 as ok from pg_config;
+  ok 
+ ----
+  t
+diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sysviews.sql
+index 351e469c77..84c113e572 100644
+--- a/src/test/regress/sql/sysviews.sql
++++ b/src/test/regress/sql/sysviews.sql
+@@ -18,7 +18,7 @@ select name, ident, parent, level, total_bytes >= free_bytes
+   from pg_backend_memory_contexts where level = 0;
+ 
+ -- At introduction, pg_config had 23 entries; it may grow
+-select count(*) > 20 as ok from pg_config;
++select count(*) > 13 as ok from pg_config;
+ 
+ -- We expect no cursors in this test; see also portals.sql
+ select count(*) = 0 as ok from pg_cursors;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
index 1551d3405..9c69b4656 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
+   file://0001-postresql-fix-ptest-failure-about-sysviews.patch \
 "
 
 SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
-- 
2.34.1


