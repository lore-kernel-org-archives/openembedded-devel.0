Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3AEEE49AB
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 07:26:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6571.1692775610624479213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 00:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jWlsTMhZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75991bd149=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N5hTLK032659;
	Wed, 23 Aug 2023 00:26:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=s+z40
	l3vcW2OJY29qSK8crUSTnN7OpVCnCagXcGaPis=; b=jWlsTMhZCMj1aWmlP3qpw
	/xWE2+FnmRR0rPOiSLDm00yLFCvEWeb6N4TzxKD0xqHRI2GenzcSDnyaaivuyspc
	95uXJ6+nmfChzCnjCWaTV7A28fpyGTINaVUJTCf2x+PqLLvCoNRKP4dusvLOUmwh
	49upwANKTa0v5R8+TeDNzOfjRqrLxcy6mUX2uUQGch20/PDA6Dyhe/gysiw490dM
	RpSWQGpzRhM5ZJueyAKnvNphjjkYkpWVPabwi8PINtj1tRyTakJTNUnMeqtDhyDx
	cHaLjwhefp1INOtHPtqXh3TRiBYONYQfyODFfLMm91WbOJWHQGSV1SP7n+5fXV4k
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e0gvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Aug 2023 00:26:46 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 00:26:43 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/2] python3-requests-toolbelt: upgrade 0.9.1 -> 0.10.1
Date: Wed, 23 Aug 2023 07:26:23 +0000
Message-ID: <20230823072624.1686194-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: nUioQbI5hsgeDIyFn1-67_29WlTcFJd5
X-Proofpoint-ORIG-GUID: nUioQbI5hsgeDIyFn1-67_29WlTcFJd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_04,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 07:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104529

From: Narpat Mali <narpat.mali@windriver.com>

Changelog:
https://pyup.io/packages/pypi/requests-toolbelt/changelog
https://github.com/requests/toolbelt/blob/master/HISTORY.rst

- License-Update: url of License changed from http to https.
- Fixing missing newline in dump utility.
- Add support for preparing requests in BaseUrlSession.
- Fix urllib3 warning to only emit on X509Adapter usage

Upstream master patches:
0.9.1 -> 0.10.0  : https://git.openembedded.org/meta-openembedded/commit/?id=a4f2646ef27a3f27bc607d57b8166071f307426f
0.10.0 -> 0.10.1 : https://git.openembedded.org/meta-openembedded/commit/?id=b5cd6f6164eb3ab0403f610236ac0cbbe5459671

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...lbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.9.1.bb => python3-requests-toolbelt_0.10.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
index 72ad7a6180..c39950ab5d 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
@@ -3,14 +3,12 @@ HOMEPAGE = "https://toolbelt.readthedocs.org"
 AUTHOR = "Ian Cordasco, Cory Benfield"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 
 SRC_URI = "file://run-ptest \
-           file://0001-Fix-collections.abc-deprecation-warning-in-downloadu.patch \
-           "
+          "
 
-SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
-SRC_URI[sha256sum] = "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
+SRC_URI[sha256sum] = "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
 
 inherit pypi setuptools3 ptest
 
-- 
2.40.0


