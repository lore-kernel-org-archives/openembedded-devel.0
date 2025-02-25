Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B22C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:15:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19023.1740514527674141504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4151b5491e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P90Edx014648;
	Tue, 25 Feb 2025 20:15:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8c3mg-13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 25 Feb 2025 20:15:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 25 Feb 2025 12:15:22 -0800
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Tue, 25 Feb 2025 12:15:21 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <r-gunasekaran@ti.com>, <reatmon@ti.com>, <yi.zhao@windriver.com>
Subject: [PATCH] libyang: update from 2.1.148 to 3.7.8
Date: Tue, 25 Feb 2025 15:15:21 -0500
Message-ID: <20250225201521.3260611-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Cah5OTR3ft4XEc3HZlr3GkPmRmn6HyIh
X-Proofpoint-GUID: Cah5OTR3ft4XEc3HZlr3GkPmRmn6HyIh
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67be24de cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=L_z2hsDfacsuYRD0gZ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=850 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 20:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115597

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Update libyang from 2.1.148 to 3.7.8

Only the copyright years changed the LICENSE file in commit:
   b13198971 doc UPDATE libyang v3 transition
so update that checksum.

Note that the prefix 'ly_' was added to header files in:
   8f702ee38 libyang UPDATE add prefix for common and config files
so the multilib header install:append was updated in the recipe.
Packages that depend on libyang, such as frr, still compile.

The ptests all continue to pass.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libyang/{libyang_2.1.148.bb => libyang_3.7.8.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.148.bb => libyang_3.7.8.bb} (88%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
similarity index 88%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
index 0eff3247c6..3bea9bc2b8 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.7.8.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/CESNET/libyang"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
 
-SRCREV = "fc4dbd923e044006c93df020590a1e5a8656c09e"
+SRCREV = "03e294d83b610f89e8ba7b2156a80dc0ad534443"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
@@ -31,7 +31,7 @@ do_compile:prepend () {
 }
 
 do_install:append () {
-        oe_multilib_header  libyang/config.h
+        oe_multilib_header  libyang/ly_config.h
 }
 
 do_install_ptest () {
-- 
2.34.1


