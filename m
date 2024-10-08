Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A74CED276
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 07:52:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3608.1728373963841882055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 00:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0011b53e6c=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49851Q3m032682
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Oct 2024 07:52:43 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422tp42xnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 07:52:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 00:52:41 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 00:52:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] xmlrpc-c: 1.59.01 -> 1.60.03
Date: Tue, 8 Oct 2024 15:52:35 +0800
Message-ID: <20241008075235.349939-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XPtiShhE c=1 sm=1 tr=0 ts=6704e4ca cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=4YuxoJ4z9Xj0XodTkr0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zhge_LY2h_zyN8NHP1XdWQTSc4bZNkKe
X-Proofpoint-GUID: zhge_LY2h_zyN8NHP1XdWQTSc4bZNkKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_05,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410080050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 07:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112706

From: Kai Kang <kai.kang@windriver.com>

Update xmlrpc-c from 1.59.01 to latest stable version 1.60.03. The
SRCREV is one more fix commit after release 1.60.03 in the stable
series. And remove 0002-fix-formatting-issues.patch which has been fixed
in upstream.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xmlrpc-c/0002-fix-formatting-issues.patch | 34 -------------------
 ...mlrpc-c_1.59.01.bb => xmlrpc-c_1.60.03.bb} |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issues.patch
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.59.01.bb => xmlrpc-c_1.60.03.bb} (92%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issues.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issues.patch
deleted file mode 100644
index 9d92e4712..000000000
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-issues.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 14f15cb0f03defa8efb4c8e2fece58e50655be6b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sun, 23 Jul 2017 22:20:29 -0400
-Subject: [PATCH] src/xmlrpc_server_abyss.c: fix formatting issues
-
-Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":
-|src/xmlrpc_server_abyss.c:771:13: error: format not a string literal
-and no format arguments [-Werror=format-security]
-|             xmlrpc_faultf(envP, error);
-|             ^~~~~~~~~~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/xmlrpc_server_abyss.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/xmlrpc_server_abyss.c b/src/xmlrpc_server_abyss.c
-index 2388652..3843f10 100644
---- a/src/xmlrpc_server_abyss.c
-+++ b/src/xmlrpc_server_abyss.c
-@@ -768,7 +768,7 @@ createServer(xmlrpc_env *                      const envP,
-         ServerInit2(abyssServerP, &error);
- 
-         if (error) {
--            xmlrpc_faultf(envP, error);
-+            xmlrpc_faultf(envP, "%s", error);
-             xmlrpc_strfree(error);
-         }
-     }
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
similarity index 92%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
index 5d5152b83..a34256c27 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
-           file://0002-fix-formatting-issues.patch \
            "
-#Release 1.59.01
-SRCREV = "352aeaa9ae49e90e55187cbda839f2113df06278"
+# one more commit after Release 1.60.03 in the Stable series
+SRCREV = "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.34.1


