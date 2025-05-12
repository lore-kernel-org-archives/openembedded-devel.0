Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7C1C3ABBC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 07:36:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44759.1747035351644323946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 00:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72271e9988=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C5bbVB020658
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:35:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hws89dxa-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:35:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 12 May 2025 00:35:49 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 12 May 2025 00:35:49 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-setproctitle: Upgrade 1.3.5 -> 1.3.6
Date: Mon, 12 May 2025 15:35:47 +0800
Message-ID: <20250512073547.183396-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512073547.183396-1-mingli.yu@eng.windriver.com>
References: <20250512073547.183396-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Hj7n4hC9RHqA2ZWDSOjhFkgEOV4DbwmD
X-Proofpoint-GUID: Hj7n4hC9RHqA2ZWDSOjhFkgEOV4DbwmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA3OSBTYWx0ZWRfX7+0+IUTe/pHh sP+kzzlRcPs8YijDBw6cnl2YM5tq0MywKz09me4KqcSGn74ea6Hiaa/TScCqloCjSh0IrjV5/Hi a4kArVTSl4H31WAZQk5D3F0t6TuF7scWCWSfBV4x4Utj8Q+bV8vTB4Ykd3KAN2or2rI7k6hqLRb
 tztyZD2Y+7WczFNPIHaZ8d6J34P8GSsMybKtywk8FvSLx9sa6ISKNmNbyxrm3XWAzZ9GjP5JIfF VqL27IzK5zqGLX/7fYlKl31mj4EJU672UpkNbcs6b/1tR9naRwvDHWz/hqLZ7Er4bTgZ2WO3DTH NZWicFuAMu14qBEtyAo1DmHWEC7h6k06UGmv4dg8oCVFwmutZDVq4oc7JIGTYdzSmT9DwsbEy0N
 NIDro3jvRsv2/XxX3OeD0iV8AG3OxG4UpT8v/w+az9ZaQTH5Wk+sQ5YmPt5aaQjmZB71AlX8
X-Authority-Analysis: v=2.4 cv=Q+HS452a c=1 sm=1 tr=0 ts=6821a4d6 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=Id4HgAWytvcwFbq6TTYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505120079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 07:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117388

From: Mingli Yu <mingli.yu@windriver.com>

Changelog:
 - Add support for free-threading (issue #147)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...hon3-setproctitle_1.3.5.bb => python3-setproctitle_1.3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setproctitle_1.3.5.bb => python3-setproctitle_1.3.6.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb
index 6be65469af..e4a392726b 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "1e6eaeaf8a734d428a95d8c104643b39af7d247d604f40a7bebcf3960a853c5e"
+SRC_URI[sha256sum] = "c9f32b96c700bb384f33f7cf07954bb609d35dd82752cef57fb2ee0968409169"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


