Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA7C28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 03:34:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.28879.1741750481973263903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 20:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516657e3b4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C3IK25003352
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 20:34:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4r320-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 20:34:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 20:34:40 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 20:34:40 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minizip: Add new recipe
Date: Wed, 12 Mar 2025 11:34:39 +0800
Message-ID: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d100d1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=mdjDh3HbAAAA:8 a=fXms6y0vAAAA:8 a=t7CeM3EgAAAA:8 a=z0vHqGVWHD7bFchFZTAA:9
 a=hjw_Cx-fSxMA:10 a=oWgShKPB4MB-ORB2x0Yq:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Zg0GcPSX_N0tgfJihZ4JV21-ZVKr0E2Y
X-Proofpoint-GUID: Zg0GcPSX_N0tgfJihZ4JV21-ZVKr0E2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115908

From: Mingli Yu <mingli.yu@windriver.com>

minizip [1] uses zlib [2] to support compressed archives.

minizip is not part of zlib, but is included in the zlib
distribution [1] as a third-party contribution in the contrib
directory.

[1] https://github.com/madler/zlib/tree/master/contrib/minizip
[2] https://github.com/madler/zlib/tree/master

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-core/minizip/minizip_1.3.1.bb

diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
new file mode 100644
index 0000000000..c9c92ad6bd
--- /dev/null
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Minizip Compression Library"
+DESCRIPTION = "Minizip is a general-purpose, patent-free, lossless data compression \
+library which is used by many different programs."
+HOMEPAGE = "http://www.winimage.com/zLibDll/minizip.html"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b303f40f75385e7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "http://zlib.net/"
+
+S = "${WORKDIR}/zlib-${PV}/contrib/minizip"
+
+SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+
+PACKAGECONFIG ??= "demos"
+PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
+
+DEPENDS = "zlib"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


