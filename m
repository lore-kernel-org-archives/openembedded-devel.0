Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A00C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:38:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6981.1721122679652060610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7927234458=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G58357029484
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 02:37:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bmv0ap1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 02:37:59 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 02:37:57 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][PATCH 1/1] apache2: Upgrade 2.4.60 -> 2.4.61
Date: Tue, 16 Jul 2024 09:37:42 +0000
Message-ID: <20240716093742.3859464-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ZBatVWwFKb5smj8TC1OymiHnAPlzVke8
X-Proofpoint-GUID: ZBatVWwFKb5smj8TC1OymiHnAPlzVke8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407160069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 09:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111372

From: Archana Polampalli <archana.polampalli@windriver.com>

Security fixes:
CVE-2024-39884 Apache HTTP Server: source code disclosure with handlers configured via AddType

Changelog:
https://github.com/apache/httpd/blob/2.4.61/CHANGES
https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.60.bb => apache2_2.4.61.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb => apache2_2.4.61.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb
index ab19ff1dc..ec8a1a611 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.61.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f"
+SRC_URI[sha256sum] = "ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


