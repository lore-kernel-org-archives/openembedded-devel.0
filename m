Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13374C3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 00:33:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.896.1743726802447183748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 17:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6189ea431a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533N5Ili009569
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 17:33:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg1u9mgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 17:33:21 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 3 Apr 2025 17:33:21 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Thu, 3 Apr 2025 17:33:20 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2] nano: update from 8.3 -> 8.4
Date: Thu, 3 Apr 2025 20:33:20 -0400
Message-ID: <20250404003320.1703471-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Rv-yP1eumI0f7C26lAhGPyia2vd0s9cl
X-Authority-Analysis: v=2.4 cv=Aqnu3P9P c=1 sm=1 tr=0 ts=67ef28d1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=mDV3o1hIAAAA:8 a=BjMif5yZAAAA:8 a=t7CeM3EgAAAA:8 a=NZ1NsVumJ8qpzzNIQMcA:9 a=uaMc_peoTw8A:10
 a=ftVT4cx30j6SLCxtN1ED:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Rv-yP1eumI0f7C26lAhGPyia2vd0s9cl
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040002
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 00:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116553

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
   https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00001.html

The license file checksum changed because upstream added the line:
   SPDX-License-Identifier: BSD-3-Clause
Add OECONF to avoid build-time checks for strcase[str|cmp], both of
which have been in glibc and musl for > 10 years so it's sensible to
default to yes.

Adjust the patches using devtool and manually munge the Upstream-Status-es.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-support/nano/{nano_8.3.bb => nano_8.4.bb}    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.3.bb => nano_8.4.bb} (75%)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-support/nano/nano_8.4.bb
similarity index 75%
rename from meta-oe/recipes-support/nano/nano_8.3.bb
rename to meta-oe/recipes-support/nano/nano_8.4.bb
index d1af89ef8d..1aae49d3b6 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.4.bb
@@ -13,10 +13,17 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
+SRC_URI[sha256sum] = "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
 inherit autotools gettext pkgconfig
 
+EXTRA_OECONF = " \
+    ac_cv_func_strcasestr=yes \
+    gl_cv_func_strcasecmp_works=yes \
+    ac_cv_func_strcasecmp=yes \
+"
+
+
 PACKAGECONFIG[tiny] = "--enable-tiny,"
-- 
2.34.1


