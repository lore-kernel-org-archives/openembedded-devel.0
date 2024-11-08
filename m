Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BD7D5C0C5
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 13:08:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12044.1731071282406568065
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 05:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10420ab255=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A88JLBj023009
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Nov 2024 05:08:02 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6g8gk9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 05:08:01 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 05:08:01 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 05:07:59 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][kirkstone][PATCH 1/1] apache2: Upgrade 2.4.60 -> 2.4.62
Date: Fri, 8 Nov 2024 13:07:58 +0000
Message-ID: <20241108130758.2970549-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ce-NLBLK4_r0YyAzbe5LQ3-nOEuNaJ5d
X-Proofpoint-GUID: Ce-NLBLK4_r0YyAzbe5LQ3-nOEuNaJ5d
X-Authority-Analysis: v=2.4 cv=Jsajr94C c=1 sm=1 tr=0 ts=672e0d31 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=qddVy93pNTEA:10 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pDwTwWHwT3kpcZDN-isA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_09,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 13:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113765

From: Archana Polampalli <archana.polampalli@windriver.com>

CVE's Fixed by upgrade:
CVE-2024-39884
CVE-2024-40725

Other Changes between 2.4.60 -> 2.4.62
======================================
https://github.com/apache/httpd/blob/2.4.62/CHANGES

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 2786d0e13..0e036e7e1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f"
+SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


