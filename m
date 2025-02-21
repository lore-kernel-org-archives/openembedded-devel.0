Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015BBC021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 06:33:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17517.1740119628824418025
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Feb 2025 22:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=414710b9ef=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5aF6J025498
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 22:33:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kucst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 22:33:48 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 22:33:45 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] dlt-daemon: fix CVE-2023-36321
Date: Fri, 21 Feb 2025 06:33:25 +0000
Message-ID: <20250221063325.798888-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: AqecdJUb278RuMxlxgHsGcYmymndSyvg
X-Proofpoint-ORIG-GUID: AqecdJUb278RuMxlxgHsGcYmymndSyvg
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b81e4c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Ex9tJC92AAAA:8
 a=CHpQsqytHlXfDJgg-nUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=UswdIN6Ny3sFqGNMsUNj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Feb 2025 06:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115532

From: Yogita Urade <yogita.urade@windriver.com>

Connected Vehicle Systems Alliance (COVESA) up to v2.18.8 wwas
discovered to contain a buffer overflow via the component
/shared/dlt_common.c.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-36321

Upstream patch:
https://github.com/michael-methner/dlt-daemon/commit/8ac9a080bee25e67e49bd138d81c992ce7b6d899

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../dlt-daemon/CVE-2023-36321.patch           | 32 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.8.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch
new file mode 100644
index 0000000000..05f3fd4343
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/CVE-2023-36321.patch
@@ -0,0 +1,32 @@
+From 8ac9a080bee25e67e49bd138d81c992ce7b6d899 Mon Sep 17 00:00:00 2001
+From: Michael Methner <mmethner@de.adit-jv.com>
+Date: Fri, 27 Jan 2023 10:51:07 +0100
+Subject: [PATCH] Check for negative index in dlt_file_message
+
+Fixes #436
+
+Signed-off-by: Michael Methner <mmethner@de.adit-jv.com>
+
+CVE: CVE-2023-36321
+Upstream-Status: Backport [https://github.com/michael-methner/dlt-daemon/commit/8ac9a080bee25e67e49bd138d81c992ce7b6d899]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/shared/dlt_common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 4303c50..34da70a 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -1718,7 +1718,7 @@ DltReturnValue dlt_file_message(DltFile *file, int index, int verbose)
+         return DLT_RETURN_WRONG_PARAMETER;
+
+     /* check if message is in range */
+-    if (index >= file->counter) {
++    if (index < 0 || index >= file->counter) {
+         dlt_vlog(LOG_WARNING, "Message %d out of range!\r\n", index);
+         return DLT_RETURN_WRONG_PARAMETER;
+     }
+--
+2.40.0
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
index 8ef056651b..d3ae2a460e 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;branch=master \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            file://0001-Fix-memory-leak.patch \
            file://CVE-2022-39836-CVE-2022-39837.patch \
+           file://CVE-2023-36321.patch \
            "
 SRCREV = "6a3bd901d825c7206797e36ea98e10a218f5aad2"
 
-- 
2.40.0


