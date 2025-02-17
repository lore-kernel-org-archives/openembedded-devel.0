Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6460C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:26:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44850.1739770000269716397
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Feb 2025 21:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414386c018=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H51F2p012767
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tg51hn04-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Feb 2025 21:26:38 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Feb 2025 21:26:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 2/2] nginx: upgrade 1.27.3 to 1.27.4
Date: Mon, 17 Feb 2025 13:26:35 +0800
Message-ID: <20250217052635.2557382-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217052635.2557382-1-changqing.li@windriver.com>
References: <20250217052635.2557382-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=T4B2T+KQ c=1 sm=1 tr=0 ts=67b2c88f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=9bLDTSi9AAAA:8 a=t7CeM3EgAAAA:8 a=1TvmxPd2McqRapTlOn0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HHpR0qxJ11o2Rv8ZN6y3jvzNmbZisRMX
X-Proofpoint-ORIG-GUID: HHpR0qxJ11o2Rv8ZN6y3jvzNmbZisRMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502170045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115506

From: Changqing Li <changqing.li@windriver.com>

License-Update: copyright year refreshed

Resolves:
* CVE-2025-23419

CHANGES:
https://nginx.org/en/CHANGES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-httpd/nginx/{nginx_1.27.3.bb => nginx_1.27.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.27.3.bb => nginx_1.27.4.bb} (53%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
similarity index 53%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
index 2f1bfa3b9e..6c32ea7315 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.27.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
@@ -4,7 +4,7 @@ require nginx.inc
 # 1.27.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8323c46a4f3aac555a90caca346bb3d2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
-SRC_URI[sha256sum] = "ba23a9568f442036b61cd0e29bd66a47b90634efa91e0b2cf2d719057a9b7903"
+SRC_URI[sha256sum] = "294816f879b300e621fa4edd5353dd1ec00badb056399eceb30de7db64b753b2"
 
-- 
2.34.1


