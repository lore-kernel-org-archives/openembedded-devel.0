Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85990C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 11:02:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.70975.1754996554606538397
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 04:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0319aac9cc=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57C85MHM662195
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:02:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fuyw8byd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:02:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 12 Aug 2025 04:02:33 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 12 Aug 2025 04:02:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][walnascar][PATCH 1/1] apache2: upgrade 2.4.64 -> 2.4.65
Date: Tue, 12 Aug 2025 16:32:22 +0530
Message-ID: <20250812110222.402009-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDEwNiBTYWx0ZWRfX5JiN/JtzytWt
 VzzvMcMSfmwKczmd4AUivgyveLFOPRkkioaFf5oefAjjbXVCI/tGEbbivRhhCjkMZ/wfW9WDDEG
 ZUPyq77d/7IBkfT8O0Z0+c6fCLUTsgB9Ip7OkqqL19aoYpOpJrzxJi/azfI2RjcQAs2sriIzgZP
 tV2CpHKQhZzI181PiTn3u2OBvbaohukA0XrQM+rbOIOFG7YLn8jb/WHx30jMwU1h6b9VBWYFBrO
 Is5/xuTUupLDWIOb1aUSyPw25W0p/axAAMWFZcfoo2mDvHrxhPUKncwOJhiWNu93HyzRdLtdens
 LKVYK18of0Sd5jlncL19JcBizUHpl6IxmcuohKXueJR/B+IzVb1sP3R/uiHz64=
X-Proofpoint-ORIG-GUID: yyyxTidFF4bS47mgRssPQSGkSNKMfWGm
X-Authority-Analysis: v=2.4 cv=ZbsdNtVA c=1 sm=1 tr=0 ts=689b1f49 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=AC0tdzqdyWkA:10 a=2OwXVqhp2XgA:10 a=rdg3_GxQAAAA:8 a=t7CeM3EgAAAA:8
 a=XHy8PqiM-uwHW2CgvLEA:9 a=dYCL7Ul1fIsA:10 a=oa8Jmjjpy-EA:10
 a=4bfGIIMrVqvzAeZ94R2q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yyyxTidFF4bS47mgRssPQSGkSNKMfWGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 11:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118915

From: Archana Polampalli <archana.polampalli@windriver.com>

This upgrade incorporates the fix for:
CVE-2024-54090

Changelog:
https://www.apachelounge.com/Changelog-2.4.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (100%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
-- 
2.40.0


