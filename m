Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A853BC19F4F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 13:05:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13629.1714136706636681452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Apr 2024 06:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O911y6fd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4846410038=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q5LZYo019534
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 06:05:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=iDMXKrNDiFupJxzF7JovEkWQiivVu+WF+c8AXjBM/gE=; b=
	O911y6fdmi5DR8fvL4PqBs0fXTAhaXaVJOpOFIYhFhtlPFQPwgAhzopzPKFVwCTA
	ASUUv9WmxdVFGCmuJiIcnc0qrwSVqV7DFk3u3yoovcCJPUtSnmIq2cNGFOoRa/uW
	3PzCcgHLtAwn/ywPqLWC/dAtLZioTCNDPVG+HtN6V3c7+OoYfSO84uHSbYZsLB4R
	n6eEi8m+G3uIP+e5uLeqB8YP5j979jVLb7BW386tWcDbgM5YwXcwDcEBBcWAricD
	1yb+sJaVTDxqnut6jvu6Qqi/t9qQJJgywZZ2/4KK4L+GUC2az2ZZmwDxqqjEsEri
	OrTQ3MVSU3bXZCfCTVNxBQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gppay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 06:05:06 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 26 Apr 2024 06:05:04 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] mbedtls: upgrade 2.28.7->2.28.8
Date: Fri, 26 Apr 2024 13:04:43 +0000
Message-ID: <20240426130443.2098001-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240426130443.2098001-1-yogita.urade@windriver.com>
References: <20240426130443.2098001-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: oCs9DGZDM4syjh1sNJYvo_SmI_XDYgvg
X-Proofpoint-GUID: oCs9DGZDM4syjh1sNJYvo_SmI_XDYgvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404260086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110156

From: Yogita Urade <yogita.urade@windriver.com>

Includes security fixes for:
CVE-2024-28960 - Insecure handling of shared memory in PSA Crypto APIs

Release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.8

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.7.bb => mbedtls_2.28.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.7.bb => mbedtls_2.28.8.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
index 758a2118f1..45e196b995 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.8.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "555f84735aecdbd76a566cf087ec8425dfb0c8ab"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
+SRCREV = "5a764e5555c64337ed17444410269ff21cb617b1"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake update-alternatives
 
-- 
2.40.0


