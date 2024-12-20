Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412EEE7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:08:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.147929.1734682092142430235
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 00:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2084575f12=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5B1cm011528
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 08:08:11 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1096wpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 08:08:11 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 20 Dec 2024 00:08:08 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] postgresql: upgrade 16.4 -> 16.5
Date: Fri, 20 Dec 2024 08:07:47 +0000
Message-ID: <20241220080747.3873127-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=676525eb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=RZcAm9yDv7YA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8 a=eG7aWNzutWAoOeBMYPIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9-wAqCSNPnEZbBnWlbvGk7-gp1HbTDWF
X-Proofpoint-GUID: 9-wAqCSNPnEZbBnWlbvGk7-gp1HbTDWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_03,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412200067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 08:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114432

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-10976, CVE-2024-10977, CVE-2024-10978
and CVE-2024-10979

Changelog:
https://www.postgresql.org/docs/release/16.5/

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
Refreshed for 16.5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_16.4.bb => postgresql_16.5.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.4.bb => postgresql_16.5.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 342aeba85..0388bc1b4 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 65715a4..4ad6340 100644
+index df61ab4..b795f8c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 65715a4..4ad6340 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.34.1
+2.40.0
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
index 7135263da..1379333b2 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.5.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"
+SRC_URI[sha256sum] = "a6cbbb7037f98cb8afa7d3970b7c48040cf02b115e39253a0c037a8bb8e778f0"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.40.0


