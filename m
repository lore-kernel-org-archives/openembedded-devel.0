Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50751C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:23:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7226.1739438589595025783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413993aef9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5PWJg031274
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:08 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqasm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:08 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 01:23:07 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 13 Feb 2025 01:23:07 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] mariadb: deprecate mysql* names
Date: Thu, 13 Feb 2025 17:23:04 +0800
Message-ID: <20250213092306.1491935-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ncM8u1oVuO8iaRE3eFz6mxP8BgWNiCO9
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67adb9fc cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ldN0BsbeLhct3TTgEycA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ncM8u1oVuO8iaRE3eFz6mxP8BgWNiCO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=799 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115460

From: Changqing Li <changqing.li@windriver.com>

Fix following warnings:
/usr/bin/mysql_install_db: Deprecated program name. It will be removed in a future release, use 'mariadb-install-db' instead

Upstream commit [1] deprecate mysql* names, use the new name to
fix above warning

[1] https://github.com/MariaDB/server/commit/b30b040b733ff2045ffcd7bdd44f608c7f4912b5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start | 4 ++--
 meta-oe/recipes-dbs/mysql/mariadb/mysqld.service      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start b/meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start
index 189c02021d..b7ae09a4f7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mysql-systemd-start
@@ -34,7 +34,7 @@ install_db () {
     [ -d "$datadir/mysql" ] && exit 0
 
     # Create initial db
-    /usr/bin/mysql_install_db --rpm --datadir="$datadir" --user=mysql
+    /usr/bin/mariadb-install-db --rpm --datadir="$datadir" --user=mysql
     exit 0
 }
 
@@ -51,7 +51,7 @@ pinger () {
 
     while /bin/true ; do
         sleep 1
-        mysqladmin --no-defaults --socket="$adminsocket" --user=UNKNOWN_MYSQL_USER ping >/dev/null 2>&1 && break
+        mariadb-admin --no-defaults --socket="$adminsocket" --user=UNKNOWN_MYSQL_USER ping >/dev/null 2>&1 && break
     done
     exit 0
 }
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mysqld.service b/meta-oe/recipes-dbs/mysql/mariadb/mysqld.service
index d88361703d..9c47fede1c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/mysqld.service
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mysqld.service
@@ -13,7 +13,7 @@ Group=mysql
 PermissionsStartOnly=true
 
 # Start main service
-ExecStart=@BINDIR@/mysqld_safe --basedir=@PREFIX@
+ExecStart=@BINDIR@/mariadbd-safe --basedir=@PREFIX@
 
 # Don't signal startup success before a ping works
 ExecStartPost=@BINDIR@/mysql-systemd-start post
-- 
2.34.1


