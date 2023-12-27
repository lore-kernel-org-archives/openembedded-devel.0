Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34220C46CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:54:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.94906.1703645677307973328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TpIQb8/Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725491695=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR2Oxmu004968
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 18:54:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ZMIEq
	dJlFdU5qy66ByO114+XtdEdCn+umCR8NiwWciM=; b=TpIQb8/QXyJ7bf2ShyDFv
	sWGEYvDQ8KQL0RIoCbpobq1JEwow06S9gc/zxoaRAuoDin4ag6jAoMED4Tqk4+Sh
	qF9CAsttQeOD5/L9rexishkXBq13jGA3nZkGX+L09HyOxDrlo4ru1LfSyokXt8+8
	cP8UGr/C8V33ZLYktfnElL7A9Uv7bH6/LknLZes3G9+6PMFS1p4RcBqELisTQe3T
	gOgOqtNgQky0HTwGKWQkx9xklgxQKGCcwgxsNtlsHiQkx8GcX25pp2HVgKBLbodB
	w6K/skzOIRGnOYlAeHsx44813y4ZxH8eG8ch39M0ntyNtPRQ0IFWcgoqnKgqLZwJ
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4jmjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 18:54:36 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 18:54:39 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 18:54:39 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH][meta-oe] postgresql: upgrade 15.4 -> 15.5
Date: Wed, 27 Dec 2023 10:54:34 +0800
Message-ID: <20231227025434.2855577-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KDCPpMwXqRUSet39igUCUj6x_0YgYbZx
X-Proofpoint-ORIG-GUID: KDCPpMwXqRUSet39igUCUj6x_0YgYbZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 02:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107810

From: Changqing Li <changqing.li@windriver.com>

Refer https://www.postgresql.org/docs/release/15.5/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-configure.ac-bypass-autoconf-2.69-version-check.patch | 8 ++++----
 .../postgresql/{postgresql_15.4.bb => postgresql_15.5.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.4.bb => postgresql_15.5.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index fb70b22720..ab578056ff 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 5f9dedc91a0a9710033fa155ea759f765ce5b58b Mon Sep 17 00:00:00 2001
+From d44c83ed0f30462a31930d6d925762b3f8412ce2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 524fdf1..3bea642 100644
+index e988503..d1b2cfd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 524fdf1..3bea642 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.34.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
index 3aa2662891..cb90ff930a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9"
+SRC_URI[sha256sum] = "8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.25.1


