Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C80BC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 22:23:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9177.1709763810466906398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 14:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VWvrDnL6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37952b81c9=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H3S3M007780
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 14:23:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=xmGsr
	CiyNe/oPVcOpbGaN0IaFSi8XAY1iCVUmhMC82E=; b=VWvrDnL6GYhbg0avoz5X0
	kfHMmcx/ydKKCJ00xfUgZdg2PDtGaPwsiPXBvpf+rboC+70BRey4zgtrdxa2r1Rs
	QVqWEeL7toz9vrSkLL7xquey7ebiOg9+UVqXOna9LhaMWYFSENLUB3IKcg3C2oos
	i2nbs1PMrulsR3KkCq3qHKK9rNPTRF8P+fJzxRBEO9+ji5Du59FrJs44GyZnIIJC
	fmsypBDxFia2BOq2oPKhmhRwqsFm48GoEvr9NyGyeEXhear7P3PaYSvSrgbpH/Lf
	Y8ZDMmLRmJPXuljoat/ES6XKFUkDDzfurbLfQABCPL6NcMYG/FoL2LROw6Y66k3w
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vbph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 14:23:29 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 14:23:29 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 14:23:29 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][meta-oe][PATCH 1/1] googletest: allow for shared libraries
Date: Wed, 6 Mar 2024 14:23:29 -0800
Message-ID: <20240306222329.1876779-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Lk3By0f1MeH6Gs-FUF0NMy5oECBpvTzs
X-Proofpoint-ORIG-GUID: Lk3By0f1MeH6Gs-FUF0NMy5oECBpvTzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=973 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060181
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 22:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109181

From: Joe Slater <joe.slater@windriver.com>

Add a PACKAGECONFIG option to produce shared libraries.
Change the -dev RDEPENDS because -staticdev is not created
if shared libraries are built.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
index 8c75f936de..e9df082d32 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
@@ -10,12 +10,20 @@ S = "${WORKDIR}/git"
 SRCREV = "f8d7d77c06936315286eb55f8de22cd23c188571"
 SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
-inherit cmake
+inherit cmake pkgconfig
+
+# allow for shared libraries, but do not default to them
+#
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
+
 
 ALLOW_EMPTY:${PN} = "1"
 ALLOW_EMPTY:${PN}-dbg = "1"
 
-RDEPENDS:${PN}-dev += "${PN}-staticdev"
+# -staticdev will not be implicitly put into an SDK, so we add an rdepend
+# if we are not building shared libraries
+#
+RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG","shared","","${PN}-staticdev",d)}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


