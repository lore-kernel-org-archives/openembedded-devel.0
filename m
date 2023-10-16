Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C07CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:54:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.112111.1697439293810761073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 23:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VNbM3HiU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86539501ac=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39G5K48e029621
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 06:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=MOj6D
	nrNW/cMXVh3hto2nyovx3fyj0nLBxgtwYviV/A=; b=VNbM3HiUr8fxbphhdATb/
	GDBTHyT/Wyh/ENq1cU/y0rSgILeJivCUp8ClzIHy2HYzAdbe6j/Bry9qUTW8z5t5
	73UfeWYVQaCp8DrQQ909VxUBT9+4WLwYAlvtObVbqRv9NmXH5ZISjG5mYJ2yH3fT
	HtaYvP1PmdOV78idQC3VfenugiugNLk/+yixRks9MbWibPp2wrdiEPt2ymBHm+lD
	296dhSBH/8dvRvVSAe3kKb60nnP+QpM6N2VxHLW5XenPvqSLp/kBX6k6ZX+79RJw
	DJ6ui7/J+hZRAoAN55vUnDCO77KM2ieft/6AVYmZjl9v43P4PIAROWzo01UvZian
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqg6x9krn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 06:54:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 23:54:48 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Sun, 15 Oct 2023 23:54:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-oe][PATCH] postgresql: upgrade 15.3 -> 15.4
Date: Mon, 16 Oct 2023 14:54:49 +0800
Message-ID: <20231016065449.2328567-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9wpwcTS_qBviYF2k2fN20rtf21XGdKzD
X-Proofpoint-ORIG-GUID: 9wpwcTS_qBviYF2k2fN20rtf21XGdKzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310160058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105541

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 15.4

Changelog:
https://www.postgresql.org/docs/release/15.4/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 23396e531fba70923342481ee5cde7795191ec93)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-configure.ac-bypass-autoconf-2.69-version-check.patch | 8 +++++---
 .../postgresql/{postgresql_15.3.bb => postgresql_15.4.bb} | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.3.bb => postgresql_15.4.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 3c8187d1a2..fb70b22720 100644
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
-index 998ff31..912e490 100644
+index 524fdf1..3bea642 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,3 +27,6 @@ index 998ff31..912e490 100644
  AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
index c4d4124f9a..268b566c6b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932"
+SRC_URI[sha256sum] = "baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


