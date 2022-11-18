Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75860C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 11:49:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9647.1668772179591666817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 03:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VFEP57Yn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83214e05b0=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIBjMFg024564
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 03:49:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=bIscys/YdsbNT8PYzqMIyq3Kph9tRbvmfHcUFYlb6qc=;
 b=VFEP57Ynce1yFtL1lZzc81FS5PrQ9E9ompiVh94DOWE0WNlHuM2JAZ1fvjf1icclF9KH
 mD9HxeQ0nb/w9agtH1ONWED0BGkLmpmrAl0Qmbqckgf8n0zds5L6ytddTBJddTToxEZk
 g6nFFD+nkCaUkcaNjo7Pcwgk/AYdxJkdzghLfEOBjQEt6N0D+M9Po1540BLySxZRqJ+H
 q9YaLc7i4t9oKuJoeuKUVXbtlrISm4WCuelkYCIpMZUVCKa2M3EUpyubHJXnS+wzS49h
 jPYhmkxMcFfYqYd+desNNr4SafF32N49J6FumLZmgxn+3FeWiyg/gi3QrsTlTO5GOpFB zg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0ng0bww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 03:49:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 18 Nov 2022 03:49:28 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 18 Nov 2022 03:49:26 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [meta-openembedded][kirkstone][PATCH 1/1] python3-oauthlib: upgrade 3.2.0 -> 3.2.2
Date: Fri, 18 Nov 2022 11:49:15 +0000
Message-ID: <20221118114915.608215-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ej8AQJNVCjw03V7o7QW56xXU6PH3bIa9
X-Proofpoint-ORIG-GUID: Ej8AQJNVCjw03V7o7QW56xXU6PH3bIa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 11:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99611

As per CVE reference, version 3.2.1 fixes the CVE-2022-36087 issue. But after upgrading the python3-oauthlib version
to 3.2.1, observed that the vulnerable code lines are still available. The same observations were reported here in github at
https://github.com/oauthlib/oauthlib/issues/837 and found that it was a mistake during 3.2.1 release preparation and due to
which vulnerable code was still existing in 3.2.1 source code.

To fix CVE-2022-36087 issue, we need to upgrade python3-oauthlib to 3.2.2 version and here are the changelog of version 3.2.2
https://github.com/oauthlib/oauthlib/blob/v3.2.2/CHANGELOG.rst

Reference :
https://nvd.nist.gov/vuln/detail/CVE-2022-36087

Upstream fix :
https://github.com/oauthlib/oauthlib/commit/2e40b412c844ecc4673c3fa3f72181f228bdbacd

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-oauthlib_3.2.0.bb => python3-oauthlib_3.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.0.bb => python3-oauthlib_3.2.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
index e7f7f0b47..566279d71 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[sha256sum] = "23a8208d75b902797ea29fd31fa80a15ed9dc2c6c16fe73f5d346f83f6fa27a2"
+SRC_URI[sha256sum] = "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
 
 inherit pypi setuptools3
 
-- 
2.34.1


