Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DCBC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 12:46:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40231.1708346806636631523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 04:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j4BVXMVv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2779d0adb5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J7LHSp027118
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 04:46:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=k00m+
	lFSyYuCe+Vc2FEtA9QA4+ByzcZnV+NKMlMXnRg=; b=j4BVXMVvxaPlM7VtnyGFJ
	lkgr3+v9X4Xh9CXB+qqoZdw2WOwliWwGRQdI1Q9eXgIwG99U7GV0omCOS+WIqpKt
	ld0PUphJ3mZSS8fSl5E+uqR9B9opWs3uJWqcxY0hsliGSCpzfBcJi8g2ijTOK3Mq
	bz4faTxxleK89SJ9/PyT7fq1drpQvfEvB9eNwq1pwD88iYtNqARkNs1F0wYir+l/
	j3XPc8aaokDk7dLhzYIwuJ/4zrVO9R0VPQstPbJwksJ4ZewwhtjKua75zitD0lKA
	GR7Oay998xb8+bdzdOMrNKgbaiAL+eCOfJfDt2nvHlkX8zHinYhGi3+H0dDP07fy
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary49hhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 04:46:46 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 04:46:44 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] mbedtls: upgrade 2.28.5 -> 2.28.7
Date: Mon, 19 Feb 2024 12:46:27 +0000
Message-ID: <20240219124627.1613307-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: fBhvA7ARE-9SFIqBESemzWirxgxYUbsQ
X-Proofpoint-GUID: fBhvA7ARE-9SFIqBESemzWirxgxYUbsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_09,2024-02-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402190095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 12:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108870

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes security fixes for:
CVE-2024-23170 - Timing side channel in private key RSA operations
CVE-2024-23775 - Buffer overflow in mbedtls_x509_set_extension()

License updated to dual Apache-2.0 OR GPL-2.0-or-later.

Changelog:
https://github.com/Mbed-TLS/mbedtls/blob/v2.28.7/ChangeLog

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.5.bb => mbedtls_2.28.7.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.5.bb => mbedtls_2.28.7.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
index 10bfeed1d1..758a2118f1 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.5.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.7.bb
@@ -17,13 +17,13 @@ understand what the code does. It features:                          \
 
 HOMEPAGE = "https://tls.mbed.org/"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "47e8cc9db2e469d902b0e3093ae9e482c3d87188"
+SRCREV = "555f84735aecdbd76a566cf087ec8425dfb0c8ab"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
 inherit cmake update-alternatives
-- 
2.40.0


