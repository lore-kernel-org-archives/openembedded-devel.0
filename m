Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7B4C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:43:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12731.1749030215494519385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825020491d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5546d4op006881
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Jun 2025 02:43:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rt9bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 02:43:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 02:43:31 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: upgrade 14.17 -> 14.18
Date: Wed, 4 Jun 2025 15:13:08 +0530
Message-ID: <20250604094308.2408808-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: upaE056CNKX9GXcQI4GbKphFeN_UO96z
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68401546 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=epTmVMiNAAAA:8 a=t7CeM3EgAAAA:8 a=eG7aWNzutWAoOeBMYPIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA3MiBTYWx0ZWRfX8lXF/Zlvsoy3 O5+vG43RoBLnlU96kZwit7ytfS3hxCIl+2+eXBWk9ReWBYB00QOqOvYNWE7S5e0dBtlON0JNbq1 h2Ygpux0lVk0iNwUYt9GJEX6HMnYHiLIwrb0Vifldql+0311N8bCzBVIgUacirWVnSdI/LF3l+d
 bufEzHYbKigyumpkdRiQYWXchDgiv1HPGqLy/eXVHS7WjeFeWs0Wki3ltquImYK2GAd/F+uYwCh +keUZpf9f/NJsi1d/1/tBZ1yUFy8k87RVo4RWfOMSEoBItH1jt/J/5tChHGPak6KCY4jsISMtHa fR1ZRmVjn9wspGdPvAjduPzsPHbR4hFmPm38ZaAfX4bd/PXW98+ofqGMf2zAGMGjNsKD4NWFj9v
 VnV2fw0BKAIXW/anAz1/B5w17aTcpQp051desXfKthtDYsVREROut1+eZmbmw1YQ7T3nBoUu
X-Proofpoint-ORIG-GUID: upaE056CNKX9GXcQI4GbKphFeN_UO96z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 09:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117734

From: Yogita Urade <yogita.urade@windriver.com>

Upgrade includes fix for CVE-2025-4207

Release notes:
https://www.postgresql.org/docs/release/14.18/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 14.18

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
 .../postgresql/{postgresql_14.17.bb => postgresql_14.18.bb}   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.17.bb => postgresql_14.18.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index fc3b1db6f6..2396be2df9 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4653dcf..72e4dad 100644
+index bbbb204..0919d2b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.17], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.18], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
index a7563c3f8b..c9616c21ff 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.17.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "6ce0ccd6403bf7f0f2eddd333e2ee9ba02edfa977c66660ed9b4b1057e7630a1"
+SRC_URI[sha256sum] = "83ab29d6bfc3dc58b2ed3c664114fdfbeb6a0450c4b8d7fa69aee91e3ca14f8e"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.40.0


