Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB8FE7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:23:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10603.1734945811009803362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2087fffb98=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN8V1qe005521
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 01:23:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2p99cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 01:23:30 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 01:23:28 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: upgrade 14.13 -> 14.14
Date: Mon, 23 Dec 2024 09:23:09 +0000
Message-ID: <20241223092309.2367917-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: key2QDTa_pBIbysRUDQ7v_mWDrDdlgmq
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=67692c12 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=RZcAm9yDv7YA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8 a=yjKH6VfATrLHOjf_40kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: key2QDTa_pBIbysRUDQ7v_mWDrDdlgmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_04,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Dec 2024 09:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114466

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-10976, CVE-2024-10977, CVE-2024-10978
and CVE-2024-10979

Changelog:
https://www.postgresql.org/docs/release/14.14/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 14.14

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...1-configure.ac-bypass-autoconf-2.69-version-check.patch | 7 ++++---
 .../{postgresql_14.13.bb => postgresql_14.14.bb}           | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.13.bb => postgresql_14.14.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index d0a343491..a8d320fc1 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -8,18 +8,17 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index af01483..0a62ebf 100644
+index 4653dcf..72e4dad 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.13], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.14], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,3 +27,5 @@ index af01483..0a62ebf 100644
  AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+--
+2.40.0
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb
index 989e9777b..342b78ae9 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.13.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.14.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "59aa3c4b495ab26a9ec69f3ad0a0228c51f0fe6facf3634dfad4d1197d613a56"
+SRC_URI[sha256sum] = "84727fbccdbd1efe01d8de64bc1b33095db773ad2457cefcedc2d8258ebc09d6"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.40.0


