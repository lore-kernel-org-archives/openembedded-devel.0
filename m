Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA6BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:19:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4167.1752571177991200316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9291930779=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F8hfov3496391
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:37 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva0b2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 15 Jul 2025 02:19:35 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 15 Jul 2025 02:19:34 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] syslog-ng: upgrade 4.8.1 -> 4.8.2
Date: Tue, 15 Jul 2025 14:49:22 +0530
Message-ID: <20250715091922.1129980-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250715091922.1129980-1-praveen.kumar@windriver.com>
References: <20250715091922.1129980-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=68761d29 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q8z6U0igACS9QC7z0cgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3Sy3wNVwYRTpi0M3jEfAoEpPzBE-yn1d
X-Proofpoint-ORIG-GUID: 3Sy3wNVwYRTpi0M3jEfAoEpPzBE-yn1d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX09W4HqfgGISj
 9iKwvn3vTY61d3c2XSekZAh4cBGQxJ43h+/PNZl4nh5bFE9IoSdS+4hW+me07D1Apr5A/8TXr0D
 7YOAJhW4E6lS8RE5Vw6QHIC+hvwdb5KcTXPKQ1jGYXPtjW9TxkWYh8Zx4k+bpq1oKPeFJUKzhB1
 7p7IWkQ9dTN9n6Idq8degkEGb4OrCvJuPHuquaoFBu6u7UFVoKVPVIqmWvn3/ULfAO2BP5+kKwS
 7ThxvKLvSNFqwdj1h458VRxP3Jlmb32nlhS/Di0/5KPPLstmfmJE6Hp/ivbBbexsrUb6RBa8mq+
 7QyzvMkB1ttvXfYd4kovzWThI0QtjQKZgC/YxTC89npsQ+0s5nsMkVUdjuReRUv9XSAeWD90wWT
 nIUmVHPi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 09:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118555

Includes fix for CVE-2024-47619

Release notes:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.2

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
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


