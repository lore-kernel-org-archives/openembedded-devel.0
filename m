Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E56CC83F13
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 06:59:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8384.1693205970179549488
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 23:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JEYEDeXp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760481038b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37S5t23g002618
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 06:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=dG+7J
	R7dzWKO6gw4XN78lb7/zLdkpqJD4YMCScxAgRM=; b=JEYEDeXpwDbjZcDKhxC/H
	nv4w+mTSowXFkmuZNtO8diSjWlZ+G4mTXzbNrIHtKM5f9KFMQ9IHUHRb94tIfDEk
	gRn53FcGnNcDWh44+FLj8/ffxlq9eaZUgOCvRW/VUHMhssuefCZKy6rq455hcOem
	f6hF/aKm92jmQTqcg64uHiXL1IvyuRR+nuTXrOW1T2OetlelyrUXFFOpR8nJl2rQ
	PfC14NQFVlhfT1847xE0CRQtZTQsuh03BZLh4+1q8XSFbk9bCOHNXN5yDfh39dYy
	fMYVGxjhGo4QyLtXxhfPANUa9ieJj5ptMYUDWgZEVPkTO2Qtqzb2MMIWGcFzjCia
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c61dbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 06:59:29 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 23:59:23 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] nodejs: upgrade 18.17.0 -> 18.17.1
Date: Mon, 28 Aug 2023 06:59:14 +0000
Message-ID: <20230828065914.2474985-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 7l-j8jjnUGUZhkO85onChZ-sx-u3Pjbv
X-Proofpoint-GUID: 7l-j8jjnUGUZhkO85onChZ-sx-u3Pjbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_04,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=721 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308280061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Aug 2023 06:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104630

This is a security release.
The following CVEs are fixed in this release:
    CVE-2023-32002
    CVE-2023-32006
    CVE-2023-32559

https://github.com/nodejs/node/releases/tag/v18.17.1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/{nodejs_18.17.0.bb => nodejs_18.17.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.17.0.bb => nodejs_18.17.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
index 1d49218e6..ee5e848bf 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.1.bb
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "80c0faadf5ea39c213ccb9aa5c2432977a0f1b5a0b766852abd0de06f2770406"
+SRC_URI[sha256sum] = "f215cf03d0f00f07ac0b674c6819f804c1542e16f152da04980022aeccf5e65a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.0


