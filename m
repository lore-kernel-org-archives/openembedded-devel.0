Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34359C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 21:50:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5853.1709589017084685640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 13:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fah8OzTE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3793ce0496=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4247Kus4028208
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Mar 2024 21:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=oZblN
	Clvk8tCDQpz7X83DvvwRIcab46XoL/OyIuT/Io=; b=fah8OzTEhaMhUq1CAc/ES
	8I0MByT7v2a8YJs0fYUE7fQDSbirkCVOYD1tEb+ixxOCMcBMGoallJDhGlp0wn9p
	m/tpayH1kgrzfOTejCVB3OufijMB3lw5J+w6Ws78l31NzQJezZ+lCOTC1fdfUp+a
	oVksQYx3nw3xo7jy9f9Obqc+ZAS96NRnj8dz3abWVHlX5t5JQsnWa+bTRiR6c1zO
	/rg/w3tvig7D0jzrQKM0bZfA9q038x+bNrS9D1VKagVDTLn+FHrOALIFqswHJhHe
	/xkYjSZOeIWj+Vx1/m/hSbATjao0xI4AoA5+qBfJM9xqpYYPmt8W2CJv6AR02O4J
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawt7hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 21:50:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 13:50:14 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 13:50:14 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] googletest: allow for shared libraries
Date: Mon, 4 Mar 2024 13:50:14 -0800
Message-ID: <20240304215014.4191019-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4rF9NG91A_V7VFPgtrjQ7PBqk477OsWP
X-Proofpoint-GUID: 4rF9NG91A_V7VFPgtrjQ7PBqk477OsWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_18,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=939
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 21:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109103

From: Joe Slater <joe.slater@windriver.com>

Add a PACKAGECONFIG option to produce shared libraries.
Allow staticdev to be empty if no static libraries
are built.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
index 8c75f936de..1b05f3d336 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
@@ -10,11 +10,17 @@ S = "${WORKDIR}/git"
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
 
+ALLOW_EMPTY:${PN}-staticdev = "1"
 RDEPENDS:${PN}-dev += "${PN}-staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


