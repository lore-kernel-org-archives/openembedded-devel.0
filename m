Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB9C46CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:56:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.94920.1703645760009123408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QEkCyCI4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725491695=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR1vLqB006532
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 18:55:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/XgOZ
	MmzIqjniJ5hsPUJIJHhY1nrfVw4o91JKbmAdqo=; b=QEkCyCI4Gi8Qx/kGvjvDg
	ZiC28b1iUQzPYxypCg4QgF/rIRJMKxc5XF82mJ87a30/cyq+E4d7YlB1fTxaJRH0
	rhYIV7z0psRQhBe5400GayVX4Rs+t1OmRHW6iLKwCJ2BEZXjrc1zTKBXrAtsE3y4
	UmObCMr8vuagUuKD2MG8uVjUInEB1X7Fq2JAvodI3axE248OKFXpbBOTjPwAbo/1
	Jvx8827U/a6CpkG3n7uMLuhq5dvT8g/gCC5wwUf60XlSn9lPz5GiV82JyoXA2P4E
	9/kmhiRjZja21niY+nGNzNEOMvSqe58Wn3PjrOOSFgOKip6ONGfxKtrsUg34megZ
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4jmm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 18:55:59 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 18:56:02 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 18:56:02 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH][meta-oe] redis: upgrade 6.2.13 -> 6.2.14
Date: Wed, 27 Dec 2023 10:55:57 +0800
Message-ID: <20231227025557.2872013-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6SId2K6C5EuNSyPmNN4dMJz7IT0hpcNs
X-Proofpoint-ORIG-GUID: 6SId2K6C5EuNSyPmNN4dMJz7IT0hpcNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=670 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 02:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107811

From: Changqing Li <changqing.li@windriver.com>

Upgrade urgency SECURITY: See security fixes below.

Security fixes:
(CVE-2023-45145) The wrong order of listen(2) and chmod(2) calls creates a
race condition that can be used by another process to bypass desired Unix
socket permissions on startup.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.13.bb => redis_6.2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.13.bb => redis_6.2.14.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.13.bb b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.13.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.14.bb
index 640831c525..fa430ce402 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "89ff27c80d420456a721ccfb3beb7cc628d883c53059803513749e13214a23d1"
+SRC_URI[sha256sum] = "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81fd93ff267d09bc277"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


