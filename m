Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7C7C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 10:31:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29303.1679902190371133946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 00:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LUbznhw2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=245006d2cd=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R7QpVq020053
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 00:29:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=yieFw9pSgwnZMT9L5H4lz9qIAOozWlOlqC4wlgF8T7Q=;
 b=LUbznhw2IRwB6qGrDl+9/80wpK3bv3y4VDqJS9CUR1RY4T/sLijQurut0cSFg0SS9/6j
 oZJ5necDeQufwEbAJHDyOmfZQxBGEMi0scZ/F/+cOa0RNxRaJP+JpZ1W7hYNi6PW5kuG
 0B1d5RxUxYeUi4dGaFZGdb4dTSrgJnmUKQwrq9Y5G9O1vOLswBHRgIus/GRpPeWom8I+
 OSjmcRs92Y7Wejx1h5gphWq0kqwSANVhL0SEakHNbrcl0gZoH+k81+IO6h9BamyGZ0s4
 Byhnkr7LQS7sLy6cYYjyqqYkQznOnwVL5lr5VzuMPOfYuhUb/FzByHi8pB2Tk05MXcTW gw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn1bh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 00:29:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 27 Mar 2023 00:29:47 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 27 Mar 2023 00:29:46 -0700
From: "Manoj Saun" <manojsingh.saun@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <narpat.mali@windriver.com>, Manoj Saun <manojsingh.saun@windriver.com>
Subject: [oe][meta-oe][PATCH V2 1/1] postgresql: fix ptest failure of sysviews test
Date: Mon, 27 Mar 2023 07:29:39 +0000
Message-ID: <20230327072939.2419804-1-manojsingh.saun@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: BEwV33Qr8E8MiAPdG_ASxQqF47VaRH_c
X-Proofpoint-GUID: BEwV33Qr8E8MiAPdG_ASxQqF47VaRH_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=856 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270060
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 10:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101778

In postgresql sysview ptest are failing due to hidden build info in pg_config table.
The information is hidden due to existing patch 0001-config_info.c-not-expose-build-info.patch
So for passing the test we need to reduce the row count in the sysviews test.
Also for test results to be shown as pass we need to reduce the row count for
the expected count in the sysviews.out file.

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 ...gresql-fix-ptest-failure-of-sysviews.patch | 45 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_15.2.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
new file mode 100644
index 000000000..8abea7ff4
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -0,0 +1,45 @@
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
+diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
+index 579b861..3bfc31f 100644
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
+index 351e469..84c113e 100644
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
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
index befb0caec..5c95e4da3 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
@@ -8,6 +8,7 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
+   file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
 SRC_URI[sha256sum] = "99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7"
-- 
2.32.0


