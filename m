Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FAC0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 02:17:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42022.1739153845250890756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 18:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4136494cdd=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2Fdb8004197
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Feb 2025 18:17:24 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p3e7s8bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 18:17:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 18:17:23 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Feb 2025 18:17:23 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][master][PATCH] phpmyadmin: upgrade 5.2.1 -> 5.2.2
Date: Mon, 10 Feb 2025 10:17:22 +0800
Message-ID: <20250210021722.3924483-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IYN9WXqa c=1 sm=1 tr=0 ts=67a961b4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=sntlU3ZaAAAA:8 a=t7CeM3EgAAAA:8 a=ZHp1PDvQXKyvBHuofP0A:9 a=xslW_GA4FUbfK35qJ43B:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Frcl-e0fukBhVaCDCc8ofvBT-zsiHBD6
X-Proofpoint-GUID: Frcl-e0fukBhVaCDCc8ofvBT-zsiHBD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115323

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


