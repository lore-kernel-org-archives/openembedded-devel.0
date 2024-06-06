Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06F8C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 05:02:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6736.1717650147452429404
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 22:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688773d3a7=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4563U3Bg028987
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Jun 2024 05:02:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxct8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 05:02:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 22:02:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 22:02:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] usleep: fix compile errors
Date: Thu, 6 Jun 2024 13:02:22 +0800
Message-ID: <20240606050222.2551532-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: g4wSyw29Z7kkHXHgfibXiHPX7tmIr671
X-Proofpoint-GUID: g4wSyw29Z7kkHXHgfibXiHPX7tmIr671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=643 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 05:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110707

From: Kai Kang <kai.kang@windriver.com>

Update usleep.c to fix following compile error:

| usleep.c: In function 'main':
| usleep.c:47:43: error: passing argument 3 of 'poptGetContext' from incompatible pointer type [-Wincompatible-pointer-types]
|    47 |   optCon = poptGetContext("usleep", argc, argv, options,0);
|       |                                           ^~~~
|       |                                           |
|       |                                           char **
| In file included from usleep.c:29:
| /path_to/tmp-glibc/work/core2-64-wrs-linux/usleep/1.2/recipe-sysroot/usr/include/popt.h:217:41: note: expected 'const char **' but argument is of type 'char **'
|   217 |                 int argc, const char ** argv,
|       |                           ~~~~~~~~~~~~~~^~~~
| usleep.c:68:12: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
|    68 |   countStr = poptGetArg(optCon);
|       |            ^

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-core/usleep/files/usleep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/usleep/files/usleep.c b/meta-oe/recipes-core/usleep/files/usleep.c
index a5e7d9d715..dfa52ec19a 100644
--- a/meta-oe/recipes-core/usleep/files/usleep.c
+++ b/meta-oe/recipes-core/usleep/files/usleep.c
@@ -34,7 +34,7 @@ int main(int argc, char **argv) {
   int showVersion = 0;
   int showOot = 0;
   int rc;
-  char * countStr = NULL;
+  const char * countStr = NULL;
   struct poptOption options[] = {
             { "version", 'v', POPT_ARG_NONE, &showVersion, 0, 
 			"Display the version of this program, and exit" },
@@ -44,7 +44,7 @@ int main(int argc, char **argv) {
             { 0, 0, 0, 0, 0 }
         };
 
-  optCon = poptGetContext("usleep", argc, argv, options,0);
+  optCon = poptGetContext("usleep", argc, (const char **)argv, options,0);
   /*poptReadDefaultConfig(optCon, 1);*/
   poptSetOtherOptionHelp(optCon, "[microseconds]");
 
-- 
2.42.0


