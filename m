Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B1AC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:55:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12167.1749732900160152943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258799e8c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CAZfI6006640
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:54:59 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95h0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:54:57 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 05:54:54 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] postgresql: upgrade 16.8 -> 16.9
Date: Thu, 12 Jun 2025 18:24:35 +0530
Message-ID: <20250612125435.459046-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684ace21 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8 a=eG7aWNzutWAoOeBMYPIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5OSBTYWx0ZWRfX0E77/km1aSbC 9Ucvpdx3MoEwIAmj1GFpAKsIjs1mTgyNQ5t3Y4wTVQ1bVu4Zdew5htm64oIWyM4/7gN0HyfYPcS n0S2SEjcRrYk3xSbv0JRnpXRoZlqRCaE2AFG0FLQwXgQHgdgt7uR25yApDmtByI1vTZHRlfpmcu
 UAeuoVkdIfiIoom8Jh5/EHcT/izlMboS/dHz6ecWZiqFPYYFgMB23FKBPK2FD/gMDtsqSzhUkiY mG8TAd5Bivwo0mf4HHXf+CU99HPNdwWsa9pOK11sQra1r6DNemdocCj5qiY6cS1ZuU6BXM5Tg61 PvM6UaMRcmxIIryWjoXa1p8u+PmpO/M7a8/P+QqKGqMfOFMP8l+aJFreTsAZGNQnqnhBHkpAs9O
 5gbRkHqhco+RQracPMfv1rddML454PuWtPBqmSA0PTS5Kx+SVlvWzG+hBAvi/FYdVQji7zAJ
X-Proofpoint-ORIG-GUID: Ng8JdMjmY-WClo1TRClQ3FgQQAVV_-Ur
X-Proofpoint-GUID: Ng8JdMjmY-WClo1TRClQ3FgQQAVV_-Ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 12:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117889

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-4207

Release notes:
https://www.postgresql.org/docs/release/16.9/

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
Refreshed for 16.9

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
 .../postgresql/{postgresql_16.8.bb => postgresql_16.9.bb}     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.8.bb => postgresql_16.9.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 9584cfcb16..f78904192e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index df61ab4..b795f8c 100644
+index d707a0a..8895a3d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.8], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.9], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb
index 918ad13e63..a1b80a5ad4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.8.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.9.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "9468083a56ce0ee7d294601b74dad3dd9fc69d87aff61f0a9fb63c813ff7efd8"
+SRC_URI[sha256sum] = "07c00fb824df0a0c295f249f44691b86e3266753b380c96f633c3311e10bd005"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.40.0


