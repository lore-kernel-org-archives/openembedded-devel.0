Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B63C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 16:32:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.23969.1678465921173947450
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 08:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sfKOpA2T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2433bf0d7b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ADTJrZ023236
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 08:32:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=fbGFsw2gnGuCRKZ+wVzTP5oP52gQVIPIJ01/SOMXyik=;
 b=sfKOpA2TGxpc0Aw2M2+iS7ruA0jsfVhBoH1izOsqzq3GzBC/HoPVSYZK7znZeF2BQ/b7
 36ibHJyddoop8vGoC3uLWc9mZvwD6QY3DRhPcbB23ory5ndQ84nyFzt/ZzyoSvnpOZgz
 /FcLeD9Pus0TZ9Q8TKtV7Rie7/Dw5+a0ttUYrThAzzji/bmZZLUK5xRPKKV1ioXR1z8D
 K4AcHfevTA0Jda26o3oKJ2lKwwRUFFLMds3LVdOHcXElLco6ARYDOQlEvTnEiNuJeQbw
 aNRYGfKa8yPzhXkmFzIMAtIhalbtgkc5fJR+Qgmb/g1vKsjyW7BPs64eb3XiJ2tqeaoj 1g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fffb2jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 08:32:00 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 10 Mar 2023 08:31:51 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] nodejs: Upgrade 16.19.0 -> 16.19.1
Date: Fri, 10 Mar 2023 16:31:32 +0000
Message-ID: <20230310163132.1469195-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: aq4eTc7wUHvBi2xWglHkgPKmh2I9lzl-
X-Proofpoint-ORIG-GUID: aq4eTc7wUHvBi2xWglHkgPKmh2I9lzl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_07,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=631 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100130
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101493

The following CVEs fixed in this version:
     CVE-2023-23918
     CVE-2023-23919
     CVE-2023-23920
     CVE-2023-23936
     CVE-2023-24807

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/{nodejs_16.19.0.bb => nodejs_16.19.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.0.bb => nodejs_16.19.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
index 4e845f41d..0661fd6f1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb
@@ -36,7 +36,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "4f1fec1aea2392f6eb6d1d040b01e7ee3e51e762a9791dfea590920bc1156706"
+SRC_URI[sha256sum] = "17fb716406198125b30c94dd3d1756207b297705626afe16d8dc479a65a1d8b5"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.34.1


