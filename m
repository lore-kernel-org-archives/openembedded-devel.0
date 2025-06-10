Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB91BC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:30:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77906.1749526238177019500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82562db7a4=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A2nUfi021488
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Jun 2025 20:30:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm27ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 20:30:37 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 9 Jun 2025 20:30:36 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 9 Jun 2025 20:30:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-webserver][PATCH] phpmyadmin: upgrade 5.2.1 -> 5.2.2
Date: Tue, 10 Jun 2025 11:30:34 +0800
Message-ID: <20250610033034.3659962-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iousQiHwtVbL0SUHWirjuRBVKTDXWlFs
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=6847a6dd cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=sntlU3ZaAAAA:8 a=t7CeM3EgAAAA:8 a=ZHp1PDvQXKyvBHuofP0A:9 a=xslW_GA4FUbfK35qJ43B:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAyNSBTYWx0ZWRfX8sC2DkHLPsta Vg4womya7yCKRkz5zKHNng46clWSW0rWOyJ1ZKRe+LMTR9KCoPjxwryPNJp+VJfS4DGqiU+sXDe 5GM8gnq49fxagwDWiJwiZxFPQk2R+JNASC+T4iQaU+ZaT5k7JfprIaMeG4HmMaY8E9r3RmK/Qth
 57z8r6wOMxEpdqyPEHeDqpXmPitSh7OSG+2I9ySHkkoozSl8S+JJ7DwOnp9kWOApeffnGlyvXlC OMC2J8kUMbNxVW2QMwabR7iMERPPS0+NE9E9jrs9Uy3c5e7Dukv+eIIjtJ9PoRxOomIzdZr44Ys oVIbXRkTCgKFQ33v8jhlfLCXUrfmYp5p7Qtr5JGtqjaY91UBi+XKWtkn+2XSghAmITYgcvHHt1f
 oTff2NLFPkRQRG09SP0co3GqRoIG7gb5IFRjuEQk+jBfEGi/A/v7bB/ZlOz7+ZeaCjD5H169
X-Proofpoint-ORIG-GUID: iousQiHwtVbL0SUHWirjuRBVKTDXWlFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117793

From: Changqing Li <changqing.li@windriver.com>

License-Update: License year updated

This upgrade include security fix for:
CVE-2025-24529
CVE-2025-24530

Release note:
https://www.phpmyadmin.net/news/2025/1/21/phpMyAdmin-522-is-released/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.1.bb => phpmyadmin_5.2.2.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
index 34b710e885..c98ce4585b 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.1.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=d0ff7e060074497f34481cf574e8a581 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 "
 
@@ -11,7 +11,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[sha256sum] = "373f9599dfbd96d6fe75316d5dad189e68c305f297edf42377db9dd6b41b2557"
+SRC_URI[sha256sum] = "f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.34.1


