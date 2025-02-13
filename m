Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50786C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:23:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7227.1739438589809820121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413993aef9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D8WXSP013778
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:09 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqasm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:09 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 01:23:08 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 13 Feb 2025 01:23:08 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] mariadb: move /usr/share/mysql to /usr/share/mariadb
Date: Thu, 13 Feb 2025 17:23:05 +0800
Message-ID: <20250213092306.1491935-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213092306.1491935-1-changqing.li@windriver.com>
References: <20250213092306.1491935-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lCcLtoHrDWOIwxEhCgc68JU6J115i9n4
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67adb9fd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=g-6KINPEN2XXFAQI1RYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lCcLtoHrDWOIwxEhCgc68JU6J115i9n4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115461

From: Changqing Li <changqing.li@windriver.com>

Fix error:
$mariadb-install-db --basedir=/usr
FATAL ERROR: Could not find /usr/share/mariadb/fill_help_tables.sql

Upstream commit [1] move /usr/share/mysql to /usr/share/mariadb, this
make related files split into wrong package, and not installed by
default, so cause above error

[1] https://github.com/MariaDB/server/commit/320a4b52c9c73a37b3553cec6a9d170924957c36

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index dae41d89aa..c90e17e129 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -186,8 +186,8 @@ do_install() {
     # mini-benchmark used for Gitlab-CI to run on every commit to catch
     # if there are severe performance regressions.
     # remove it to avoid introducing bash dependency
-    if [ -f ${D}${datadir}/mysql/mini-benchmark ]; then
-        rm -rf ${D}${datadir}/mysql/mini-benchmark
+    if [ -f ${D}${datadir}/mariadb/mini-benchmark ]; then
+        rm -rf ${D}${datadir}/mariadb/mini-benchmark
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         pam_so=$(find ${D} -name pam_user_map.so)
@@ -349,7 +349,7 @@ FILES:${PN}-server = "\
     ${libdir}/plugin/*.so \
     ${base_libdir}/security/*.so \
     ${libdir}/plugin/auth_pam_tool_dir/auth_pam_tool \
-    ${datadir}/mysql/ \
+    ${datadir}/mariadb/ \
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d/mysqld \
     ${sysconfdir}/my.cnf \
-- 
2.34.1


