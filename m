Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55EEC76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:45:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2205.1680851931825014883
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 00:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=et29TSJR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3461fac36a=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3376wpWl027234
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 00:18:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ZsATJ+8T+AkqpcI+5Eah8xOEI3XekQGec3A0jdgjsCY=;
 b=et29TSJREOdwViB7W2+QHenENkXx3Bq8/WYWtsnNQwbBVi9UcCoCkikRy+8xRQrqDvHD
 GRt9SX8xSoYJdvgBDZxVAADTVAfICTfpd+1QnK7XOIpWszlxsiJElgB3izValdR7/1HL
 LE5r7aDCA/yxLF3o9g8MpIDhmLu3hwFXB5FPy1U//V64XAiEpdckTBg4d9nmqF/9WlgR
 7zkMitm7bzFhCGGjR5XnorGHnyM4BPq73q5+8TGYZ+NDVQLx9rRIMEsNY2sKPcqlexVn
 w4x094uLQh2RKydJthoUmweRNkO+SrKuvA2G2jS9iP0sO+kOqU3M1KG/YPlNknH0P4Vn SQ== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppfw6xkck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 00:18:51 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 00:18:50 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 00:18:49 -0700
From: "Manoj Saun" <manojsingh.saun@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <narpat.mali@windriver.com>, Manoj Saun <manojsingh.saun@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: fix ptest failure of sysviews test
Date: Fri, 7 Apr 2023 07:18:42 +0000
Message-ID: <20230407071842.1901649-1-manojsingh.saun@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 6Z5GT1zj6k6RnXdMQuMX3V556WlkSPDo
X-Proofpoint-GUID: 6Z5GT1zj6k6RnXdMQuMX3V556WlkSPDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_04,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxlogscore=678 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070067
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 11:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101983

In postgresql sysview ptest are failing due to hidden debug info in pg_config table.
The information is hidden due to existing patch 0001-config_info.c-not-expose-build-info.patch
So for passing the test we need to reduce the row count in the sysviews test.
Also for test results to be shown as pass we need to reduce the row count for
the expected count in the sysviews.out file.

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 ...gresql-fix-ptest-failure-of-sysviews.patch | 42 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_14.5.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
new file mode 100644
index 000000000..4db36d26f
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -0,0 +1,42 @@
+From 9f81377dddfe32d950844d7053020a36b40fce08 Mon Sep 17 00:00:00 2001
+From: Manoj Saun <manojsingh.saun@windriver.com>
+Date: Wed, 22 Mar 2023 08:07:26 +0000
+Subject: [PATCH] postgresql: fix ptest failure of sysviews
+
+The patch "0001-config_info.c-not-expose-build-info.patch" hides the debug info
+in pg_config table which reduces the count of rows from pg_config and leads to
+sysviews test failure.
+To fix it we need to reduce the count of parameters in sysviews test.
+Also we need to reduce the row count in expected result of sysview test
+to make the test output shown as pass.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+---
+ src/test/regress/expected/sysviews.out | 2 +-
+ src/test/regress/sql/sysviews.sql      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/test/regress/expected/sysviews.out
++++ b/src/test/regress/expected/sysviews.out
+@@ -29,7 +29,7 @@ select name, ident, parent, level, total
+ (1 row)
+ 
+ -- At introduction, pg_config had 23 entries; it may grow
+-select count(*) > 20 as ok from pg_config;
++select count(*) > 13 as ok from pg_config;
+  ok 
+ ----
+  t
+--- a/src/test/regress/sql/sysviews.sql
++++ b/src/test/regress/sql/sysviews.sql
+@@ -18,7 +18,7 @@ select name, ident, parent, level, total
+   from pg_backend_memory_contexts where level = 0;
+ 
+ -- At introduction, pg_config had 23 entries; it may grow
+-select count(*) > 20 as ok from pg_config;
++select count(*) > 13 as ok from pg_config;
+ 
+ -- We expect no cursors in this test; see also portals.sql
+ select count(*) = 0 as ok from pg_cursors;
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
index 5eba1f7b4..fbc08d64f 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "\
    file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
    file://0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch \
+   file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
 SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
-- 
2.34.1


