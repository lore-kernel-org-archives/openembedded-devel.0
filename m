Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0A3C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 06:11:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31745.1699855886733050623
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 22:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DFrKB3d3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96819ddcc6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AD5nA30004516
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 22:11:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=nRbmc
	HRfhoizogcyp5QfDTkBZMZQrxdlLtRhv74NBpk=; b=DFrKB3d3JGkkJYc467jU+
	XoJDYWTFtp/tHDk5C+rymsrdtS22Z9bRhA6hAzZcL/fr0MnjCnwAD4Yrru4xJ77T
	MS+IScD+8dwplB5a8K7N2H3YW/TkOZzFEzLoks4fVs1HPwfS0tshPrZOCzi7kW9E
	xhWJBzfM4wCsfoQSgM4MJUstOOMil/tG2JSzCe8OfKQUC7RoZAEYKd7Z2PvXsUqt
	ydXllLknR+ld63lIBc3XoqwP9mXMik1JPovPrsifMv+xpivJm7GYWYO5sPCE9x2z
	jjaXl5NT8AYt69mVMe/h2Gpz85w09CdSsJmXA1rDZa2VpGDJYef1YpsOrz4PWm1x
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kh1g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 22:11:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 22:11:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 22:11:29 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][mickledore][PATCH] nlohmann-json: Avoid usage of nobranch=1
Date: Mon, 13 Nov 2023 14:11:24 +0800
Message-ID: <20231113061124.1890958-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4XF4r3neyN0xArl_Qhr2FRhFvG4pH21A
X-Proofpoint-GUID: 4XF4r3neyN0xArl_Qhr2FRhFvG4pH21A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=825 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311130051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 06:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106623

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eec3c65b8136fe492f3be81ab62717d7c8922d04)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 6cf27755e..74e40942a 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 
 CVE_PRODUCT = "json-for-modern-cpp"
 
-SRC_URI = "git://github.com/nlohmann/json.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
            "
 
 SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
-- 
2.25.1


