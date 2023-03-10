Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E7EC6FD1E
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 23:14:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34348.1678490070266741761
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 15:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cCyEWRV+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24335c4e85=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32AN4Gsw023404
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 23:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=5FBg48R3LdmoYB7FAn+FijuwBFEAQanVOOePS1IkX6w=;
 b=cCyEWRV+GTiPG/p9qJB3oWsiI2Hqf0YlP2Asq05wf58hNKDkJuuNOO4AhPJoUeFRAIql
 ZMvxs4Z/4wf4TtXYfhAyWK7QXS+HOPxKg9Fo89YmX3/iOcyGDa+udg0I8kBx9VnsrPqX
 fSHy+TnKNpcbWyqj2neMah6TIuS5029BSbmYVTWq4di0QhY8jf3d+Cagy3DhoVlcgSZz
 cMsAFjhLD0bzuwhdjle10c1/87vr8BMVmTlqt5dsYgPuFjATkZAv3OHxPtlKSZ0f+xg6
 1VcSQED9Q3YT21UtKaNgOQagSNeDcGs644PfyMJ7QuE9sm/FtEEjPSerkzSmgRB1QTlX 3w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fg6kcm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 23:14:29 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 10 Mar 2023 15:14:27 -0800
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 10 Mar 2023 15:14:27 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] re2: move to version 2023-03-01
Date: Fri, 10 Mar 2023 15:14:27 -0800
Message-ID: <20230310231427.3972351-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gNXiGJe89wMycdYCFd34d-tu0tBAwU5k
X-Proofpoint-GUID: gNXiGJe89wMycdYCFd34d-tu0tBAwU5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=969 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100186
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 23:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101502

/usr/lib64/libre2.so is now a symlink instead of being
the library itself.  We choose to ignore it for QA.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../re2/{re2_2020.11.01.bb => re2_2023.03.01.bb}          | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/re2/{re2_2020.11.01.bb => re2_2023.03.01.bb} (80%)

diff --git a/meta-oe/recipes-support/re2/re2_2020.11.01.bb b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
similarity index 80%
rename from meta-oe/recipes-support/re2/re2_2020.11.01.bb
rename to meta-oe/recipes-support/re2/re2_2023.03.01.bb
index 5ec1c6b5a..78bf695a4 100644
--- a/meta-oe/recipes-support/re2/re2_2020.11.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/google/re2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
 
-SRCREV = "166dbbeb3b0ab7e733b278e8f42a84f6882b8a25"
+# tag 2023-03-01
+SRCREV = "241e2e430836e80f93d704d1f06cd3e7fe3100f5"
 
 SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https"
 
@@ -16,8 +17,11 @@ EXTRA_OECMAKE += " \
 	-DRE2_BUILD_TESTING=OFF \
 "
 
-# Don't include so files in dev package
+# ignore .so in /usr/lib64
 FILES:${PN} = "${libdir}"
+INSANE_SKIP:${PN} += "dev-so"
+
+# Don't include so files in dev package
 FILES:${PN}-dev = "${includedir} ${libdir}/cmake"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


