Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF5EEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 11:34:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8776.1692617670739593480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 04:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nDskluYT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7597f372ff=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LAxIrI030556;
	Mon, 21 Aug 2023 04:34:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=OSD+0
	/GiYf1Zzr6IJIfFWxByiYS8aj8PTBL38KL0b9Q=; b=nDskluYT2zc2FiUCHUJTs
	Ih6K2oXJNc36GxgvdyiAzhmO+iRPtE+TaRvDgAzsoxzdIb8O8C2r5Mp6WwZ84YEC
	uHMg07fcOPbUIFq3xU2yopGJOvgsHWxEYmPFxqypTaLJjErTFYDZTCdBDGJ2DKRT
	3Tl3ib0SE8W0x83094jSLQrfElzmI2ohrD8/Ywqes3ri4iSCZnEizfyKtO2i+01S
	ep2BsiZ6Ev7Lj4wmNLeoJcDTo627Ln9YM9K62UQgADJW1k2MMw+kWt77Fee2JGrF
	kqKuRgCrsHSROwjTpz65ztXY/uD3y5hIREctHXysLqxdnr3WO/2FLwNDBy08eJLz
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjs0yscvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 21 Aug 2023 04:34:26 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 04:34:24 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-aiohttp: upgrade 3.8.1 -> 3.8.5
Date: Mon, 21 Aug 2023 11:34:05 +0000
Message-ID: <20230821113405.2182966-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 5NgWERGa5xd6YeY814ET3-JykUI66P0U
X-Proofpoint-ORIG-GUID: 5NgWERGa5xd6YeY814ET3-JykUI66P0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308210106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 11:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104506

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.8.1 & 3.8.5 contains the CVE-2023-37276 fix and other bugfixes.
https://github.com/aio-libs/aiohttp/security/advisories/GHSA-45c4-8wx5-qw6w

Changelog:
https://docs.aiohttp.org/en/stable/changes.html

- Increased the upper boundary of the multidict dependency to allow for the version 6
- License-Update: Update copyright year from 2020 to 2022
- Fixed incorrectly overwriting cookies with the same name and domain, but different path
- Fixed ConnectionResetError not being raised after client disconnection in SSL environments
- Upgraded the vendored copy of llhttp_ to v8.1.1
- Added information to C parser exceptions to show which character caused the error
- Fixed a transport is :data:None error

Upstream master patches:
3.8.1 -> 3.8.3 : https://git.openembedded.org/meta-openembedded/commit/?id=c0d2a5bcc87ee8564a5b9be35f3e2b930e384a59
3.8.3 -> 3.8.4 : https://git.openembedded.org/meta-openembedded/commit/?id=1fc465466cd138e1fcc87de18e84f88e2c5f1b4f
3.8.4 -> 3.8.5 : https://git.openembedded.org/meta-openembedded/commit/?id=ba5d26d1d8b30d71cb648f95b6431c16134e82e9

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-aiohttp_3.8.1.bb => python3-aiohttp_3.8.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.1.bb => python3-aiohttp_3.8.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
index f2b8d52a72..d04279ed97 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.5.bb
@@ -2,9 +2,9 @@ SUMMARY = "Async http client/server framework"
 DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
 HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8074d6c6e217873b2a018a4522243ea3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1cbce40427f0b7578"
+SRC_URI[sha256sum] = "b9552ec52cc147dbf1944ac7ac98af7602e51ea2dcd076ed194ca3c0d1c7d0bc"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.40.0


