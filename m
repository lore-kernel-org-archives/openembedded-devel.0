Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C8AC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 12:47:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40534.1708346834675016524
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 04:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PQ6AMKJJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2779d0adb5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J573ug028798
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 04:47:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QSDOh
	8CsoDgOpD/OKbA5332NA35jxHHVYl5R/TTeuSM=; b=PQ6AMKJJ7VJzbL10eMyYl
	y2VfDMAGq7fy1LNt0/tg25KP1BoMFVVZ17Y9bevlwjiGgZ66D1uCgSoMSrdxd+Nm
	jH/bdxrf99i7pOnKQ2n1UkER6yWpwEZ/jBq+aNhAJg1j2eavgGim7qJ5N2bYcCXa
	aFFu5LML72yqQeJwVn3fBIX/8w7hN2f0k0lu5tUWFYYMoTrSnYYieRcM7QCRM8VB
	f5aZZslLG72RX0dZ8fXBlf7YEu+ZPxbFe/WziB4Sx8raKdUa3elL0A+AXgRg9kfI
	9JIEJUF75zjog2hDBzFuq3JaDdTc/EOZuqAA+LnoVjyv92w8mVyrAO/beIxcXVFw
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3waw6khd7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 04:47:14 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 04:47:12 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] mbedtls: Upgrade 3.5.0 -> 3.5.2
Date: Mon, 19 Feb 2024 12:46:57 +0000
Message-ID: <20240219124657.1613388-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: bHZjrt7LLddR37od5mJ1elaL3VXJIkh1
X-Proofpoint-GUID: bHZjrt7LLddR37od5mJ1elaL3VXJIkh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_09,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 12:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108871

From: Soumya Sambu <soumya.sambu@windriver.com>

* Includes security fix for CVE-2024-23170 - Timing side channel in private key RSA operations
* Includes security fix for CVE-2024-23775 - Buffer overflow in mbedtls_x509_set_extension()

Use canonical URL, add UPSTREAM_CHECK_GITTAGREGEX.

License-update: Upstream clarified licensing as dual Apache-2.0 or GPL-2.0 or later

Changelog:
https://github.com/Mbed-TLS/mbedtls/blob/v3.5.2/ChangeLog

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../mbedtls/{mbedtls_3.5.0.bb => mbedtls_3.5.2.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.0.bb => mbedtls_3.5.2.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
index d57e717bd8..2fedac48cf 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.2.bb
@@ -17,16 +17,17 @@ understand what the code does. It features:                          \
 
 HOMEPAGE = "https://tls.mbed.org/"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
+SRCREV = "daca7a3979c22da155ec9dce49ab1abf3b65d3a9"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
 	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
 	file://run-ptest"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
 
-- 
2.40.0


