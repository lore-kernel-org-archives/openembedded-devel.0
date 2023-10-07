Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9774AE92FFD
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 06:06:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13244.1696658786724176350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 23:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=irvoqjpA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86448006c3=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3975extR000564
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Oct 2023 23:06:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=eyjHI
	u4Uq6zbgAafj0dDEDnwy/seHkWaOq3Bay5965w=; b=irvoqjpAWFuRnhXNt7twN
	P0dQ0M9khpj5AUUMXacVaqNNSZ6ydSJDsDWe1qNVFgzI2RqrsOJiPpUuZ46/wnZP
	e5ARtsb+JaCdJydkMwURRpxyFV3Th0EZ014Ixx6UoVPh+rJ2wBIYjSfW8adNU5oG
	uoSzX8wesSD7iXha9ewfek6n79PVhXdgJwQEcxgrBVRoejnBT54obRSpSOiH5IuR
	XhjdInvoTsasoTdsoQ6JigO8N4d/I2P+ASVJfHBkJRIZvHH9il2Sww/gFopN+1oX
	YwjNBrI1m/0XaJqLrYpGjEMNhQs6AQ3wCuirZXgFX6cZu9pXK3ghWX+8eTkp/xBT
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thu0s1xxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 23:06:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 23:06:23 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 23:06:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-networking][PATCH] mbedtls: set up /usr/bin/hello as alternative
Date: Sat, 7 Oct 2023 14:06:23 +0800
Message-ID: <20231007060623.4022793-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: p5QjkmsdNt5UnECWnX4KDpbu_TNEm0Yx
X-Proofpoint-ORIG-GUID: p5QjkmsdNt5UnECWnX4KDpbu_TNEm0Yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-07_03,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxlogscore=926 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310070053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 06:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105379

From: Denys Dmytriyenko <denis@denix.org>

As mbedtls installs this rather generically-named /usr/bin/hello binary,
it conflicts with the one provided by lmbench, hence set it up as an
alternative to avoid conflicts when both are installed to rootfs or SDK.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.28.2.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index 5696f94b0e..1553c71885 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
 SRCREV = "89f040a5c938985c5f30728baed21e49d0846a53"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.28"
 
-inherit cmake
+inherit cmake update-alternatives
 
 PACKAGECONFIG ??= "shared-libs programs"
 PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
@@ -41,4 +41,7 @@ RPROVIDES:${PN} = "polarssl"
 PACKAGES =+ "${PN}-programs"
 FILES:${PN}-programs = "${bindir}/"
 
+ALTERNATIVE:${PN}-programs = "hello"
+ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


