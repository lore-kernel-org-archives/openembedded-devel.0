Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F12C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:23:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7146.1739438590855660210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413993aef9=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D8WXSQ013778
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:10 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqasm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:23:10 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 01:23:09 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 13 Feb 2025 01:23:09 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] mariadb: correct STACK_DIRECTION setting
Date: Thu, 13 Feb 2025 17:23:06 +0800
Message-ID: <20250213092306.1491935-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213092306.1491935-1-changqing.li@windriver.com>
References: <20250213092306.1491935-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3Vf0iNsD4AZfhJCh8WMfgjpvigDdA25_
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67adb9fe cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=3g5HAAR2qpCr_H2gY-YA:9 a=NA03pvyaApPJG5valX87:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3Vf0iNsD4AZfhJCh8WMfgjpvigDdA25_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=921 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115462

From: Changqing Li <changqing.li@windriver.com>

STACK_DIRECTION = 1 means stack grow upwards
STACK_DIRECTION = -1 means stack grow downwards

In the majority of modern architectures, stack grows downwards. So set
STACK_DIRECTION = 1 is not right. But the failure is not exposed before,
mysqld can start normally, and simple runtime operation like create db,
table, select info, works well. But it is exposed after commit [1] is
merged, mysqld will start failed with error:
2025-02-12  3:18:19 0 [ERROR] Could not open mysql.plugin table: "Thread stack overrun:  16752824 bytes used of a 299008 byte stack, and 81920 bytes needed

Since commit [2], mariadb started to determine the default
STACK_DIRECTION in CMake based on the ISA, and we have set correct
CMAKE_SYSTEM_PROCESSOR in cmake.bbclass, so just don't pass it.

[1] https://github.com/MariaDB/server/commit/bddbef3573349b0565c43c27beba47c89358f39f
[2] https://github.com/MariaDB/server/commit/d0abbdf56e11ccc88447c1dc80caaf355c94be3b
[3] https://jira.mariadb.org/browse/MDEV-36051

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index c90e17e129..b620355730 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -96,7 +96,6 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
-                 -DSTACK_DIRECTION=1 \
                  -DHAVE_SYSTEM_LIBFMT_EXITCODE=0 \
                  -DLSTAT_FOLLOWS_SLASHED_SYMLINK_EXITCODE=0 \
                  -DSTAT_EMPTY_STRING_BUG_EXITCODE=0 \
-- 
2.34.1


