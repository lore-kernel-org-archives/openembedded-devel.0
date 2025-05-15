Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A173AC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 08:36:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8139.1747298160663214257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 May 2025 01:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72304e3864=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F6UZZ5006529
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 08:35:59 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8tcpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 08:35:59 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 15 May 2025 01:35:54 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] syslog-ng: upgrade 4.8.1 -> 4.8.2
Date: Thu, 15 May 2025 14:05:28 +0530
Message-ID: <20250515083528.952755-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: AAiWk80eMEhsj7LRuW-wwwcfjT_Kqn_p
X-Proofpoint-ORIG-GUID: AAiWk80eMEhsj7LRuW-wwwcfjT_Kqn_p
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=6825a76f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=YzYFdlypV_zvRHf1JCsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4MyBTYWx0ZWRfX278fgAROI850 BhFcCojaNt69J8e4/UaO1A4wS8YSZLfrAvVy9W+2ThWXQjM/7MM+0gvRDdEAD/ONNcxH+xrU4F6 rnrslwLDEN7wZhK+agSXEZQt09/C4mozOeX/H/LdeYs7q2CER51Y4eGGFnXTbXInvvun16C3mUI
 3dtDv9jhW7qXynsO/vxy3kM39y/tZoEpz/S3w0i4eo/nltzj3NYVmgLIzUfM6ZpjVni4TRimNJW bBJo6zOW8T+V2ItpgOTxzMO5k33aezUd3GwjQMV07wZylSCW1JitRmYNgQrEBOFinF7dbC0Wad/ jLzRjnT5/hi6ulq2+EsBp0Aiktn9dAwlTXH6Fh8NiMM0AXVENxtVncU6P2JGy2K8zoOKKLhLgVO
 QGG9aHMOh/6WCpYh5OqKdhAe3HalI6PWKrZyCnDUGzHckjyGG/5tce6c2VZsGIqv59G3lR6h
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505150083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 May 2025 08:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117421

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-47619

Release notes:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.2

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../syslog-ng/{syslog-ng_4.8.1.bb => syslog-ng_4.8.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.8.1.bb => syslog-ng_4.8.2.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
index 94f74d1eef..ebeab51961 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.8.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "e8b8b98c60a5b68b25e3462c4104c35d05b975e6778d38d8a81b8ff7c0e64c5b"
+SRC_URI[sha256sum] = "7d1ebe70746009dc06bd2fa5c412a1985579a9c887292f766cc775d169d60e68"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.40.0


