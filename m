Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB691CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 10:00:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8676.1756893628145088539
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 03:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Djhy95ek;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1341063f41=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58353nJW474840
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 03:00:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4BhuzbO4vxNQUJm+nlZE
	jM9j5WC3PtaQ6ks8dIV4t28=; b=Djhy95eknCCR5z+MMGJT82v90D4ENH6AKg4/
	4vTeure8iUBFfmSkUJGlfgL7OSTYRSGoHFrKEdX/Sv7w7fHzhJRkaMjA6AsM227b
	uMeHmyrqvi7npYQA94rR6LfCHOYaP2ga+s1/OxCP8rHbG7LpnYBS/9igxCI8f7Tp
	cNL2utBV2qFN7uflAbiETVXHVhEmF2mjXcpitLNWpFqUjBxgBCvjtN5q2nurjJjX
	qYmVxP1O3bP/S/ZLA42LeCLklNyTdCR6qEANxnu3w6gDGP3bvm6KbJh1OmfgBy46
	OpEuFOhWG58QIfLFjkIOMN1KzbtgGmS7FyIATANHoki4IlzChQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjyut7a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 03:00:27 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 3 Sep 2025 03:00:32 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 3 Sep 2025 03:00:26 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][kirkstone][PATCH 1/1] apache2: upgrade 2.4.62 -> 2.4.65
Date: Wed, 3 Sep 2025 15:30:11 +0530
Message-ID: <20250903100011.875581-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b811bb cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=qddVy93pNTEA:10 a=yJojWOMRYYMA:10 a=rdg3_GxQAAAA:8 a=t7CeM3EgAAAA:8
 a=IhUYoywTZCXilfiUsGMA:9 a=dYCL7Ul1fIsA:10 a=oa8Jmjjpy-EA:10
 a=4bfGIIMrVqvzAeZ94R2q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QVYHJptgtnquw4pTJl7LvioWvS2aXw3n
X-Proofpoint-ORIG-GUID: QVYHJptgtnquw4pTJl7LvioWvS2aXw3n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA5OSBTYWx0ZWRfX0Q4ITh5F/fbn
 klZYma6tcDINMgd06YlLwA0oOfMS4PXkh9WzKfXMYRUl9KRLvpw0HMkANHwBpDgHAeHSkrp6IBf
 ROySN4yPoEtKqxFEKYPISg5O25ygyzsmio0TkxvANuGJWwyuWcPWoEXgfHHFFOHl6DfSoVMEQS4
 m5LJKToDpQmX2L8f22fe0BNmEwg+XKEhKdF4HCmdYvWpLowi7KyG2Zvu9VhEdCIwI0yEU/VTfxr
 oAAnZKtKleuZlpFjM9lzeJ+UZzJgpqAvkzKM+cYdVHB/RbY7qRdXJdTI5l3/5hVgV7wq2CM81ht
 hA2N0Pl3LL6xK7/geSLR6a7+PneQfpGXE7DSCRk+sEM34JTg+W8l0FohLO8fHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 10:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119254

From: Archana Polampalli <archana.polampalli@windriver.com>

This upgrade incorporates the fixes for CVE-2025-53020, CVE-2025-49812,
CVE-2025-49630, CVE-2025-23048, CVE-2024-47252, CVE-2024-43394,
CVE-2024-43204, CVE-2024-42516, CVE-2025-54090 and other bugfixes.

Changelog:
https://www.apachelounge.com/Changelog-2.4.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.62.bb => apache2_2.4.65.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.65.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index 0e036e7e12..c05304f96a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
+SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


