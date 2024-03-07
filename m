Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB8DC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:12:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27328.1709827949576802939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=g1HkvYza;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37964395b1=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4275fNt4006754
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 16:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fUfAf
	hSMkCTL94Cu4zf76yRnfsUWeoaGnhVaJdKOEWM=; b=g1HkvYzaFuAWfg0Z4KfX4
	IpgDXJ+irHun+DEEno/LPa1OPnsFtxH0PRhXccF/wNjJmK5KRp8FRL3mW2/ZO42l
	BSQ6gkMiCh6U591nW4/4+hItCs3oD4VGy4271sByWK6POaeMGSGZpQ440ZG4gfDs
	FtZ1uqjbmIKD5yoK5bdAbB/I+qFeZSl456Y8Ll31jYgrA3Woit7Lkv4LwIoJRKAK
	vA+j/8B1qcsjqkYUGDRQsmC+LT3ew24WvG8YktM3s/kv4E0D+W7ZwwDZqcRjiGwj
	ObLUGyIGzzVOGOw0EjOBztp0Mk3MQbPP9/dfUQwEFT9XQ6t4zwZp/PwJtjEuKqzf
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36de1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 16:12:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 08:12:24 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 08:12:24 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2.5][meta-oe][PATCH 1/1] googletest: allow for shared libraries
Date: Thu, 7 Mar 2024 08:12:24 -0800
Message-ID: <20240307161224.3229493-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: A9rlVgdAh9yD5-eEgVlB_X6XdLg1hRE4
X-Proofpoint-GUID: A9rlVgdAh9yD5-eEgVlB_X6XdLg1hRE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=756 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403070110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 16:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109200

From: Joe Slater <joe.slater@windriver.com>

Change the -dev RDEPENDS because -staticdev is not created
if shared libraries are built.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
index 1b05f3d336..e9df082d32 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
@@ -20,8 +20,10 @@ PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 ALLOW_EMPTY:${PN} = "1"
 ALLOW_EMPTY:${PN}-dbg = "1"
 
-ALLOW_EMPTY:${PN}-staticdev = "1"
-RDEPENDS:${PN}-dev += "${PN}-staticdev"
+# -staticdev will not be implicitly put into an SDK, so we add an rdepend
+# if we are not building shared libraries
+#
+RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG","shared","","${PN}-staticdev",d)}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


