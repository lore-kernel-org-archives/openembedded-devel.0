Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC748C87FD1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 11:19:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15476.1754306338333498364
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 04:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0311c5c32a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 574AUOCo2437508
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Aug 2025 04:18:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 489j6gs9uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 04:18:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 4 Aug 2025 04:18:56 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 4 Aug 2025 04:18:55 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/1] apache2: upgrade 2.4.62 -> 2.4.65
Date: Mon, 4 Aug 2025 16:48:49 +0530
Message-ID: <20250804111849.3601694-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d5n1yQjE c=1 sm=1 tr=0 ts=68909721 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HXCqcy9q75gA:10 a=2OwXVqhp2XgA:10 a=rdg3_GxQAAAA:8 a=t7CeM3EgAAAA:8
 a=IhUYoywTZCXilfiUsGMA:9 a=dYCL7Ul1fIsA:10 a=oa8Jmjjpy-EA:10
 a=4bfGIIMrVqvzAeZ94R2q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ERbUf0e9icghYSdvzGUu38V9qzqROUR1
X-Proofpoint-ORIG-GUID: ERbUf0e9icghYSdvzGUu38V9qzqROUR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2MSBTYWx0ZWRfX4blLr30cL0tZ
 c75bupbhNpSSJLWh7NJ9VU/OIuKkyRnARTRxV22tOFwtOnqR9LfbGd2e/Z5OB2+DTTAAPH3yJLP
 yyudYdJ/B4tyy5rO0HPMdsDwNXbs3fUVc4fdh1kp5A1FqRRoTsGyN9MwjQ6vBv8jfrvPSrgeE+w
 fCcvTqA4SNsrcX24556YaTGujtgMaOA7UYaPs/ZB0u7sVHLRBRRUNsIENeebiglfQDca7E4SZc/
 x53z5hlSPinEkeOEhNZs5Pc2+PvBtS0pZuxNim5+wMiapEThMf4L9gpUQogCi8nCIicq3fctC5Z
 2eG1YrdxSruXz0CjxlWwCIreHCB5ruuZJ4iVAbnGfSsNrcSh9isMSseahLkobUXlKBeYgBESndF
 CestJflK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 11:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118852

From: Archana Polampalli <archana.polampalli@windriver.com>

This upgrade incorporates the fixes for:
CVE-2025-53020 CVE-2025-49812 CVE-2025-54090 CVE-2025-49630
CVE-2025-23048 CVE-2024-47252 CVE-2024-43394 CVE-2024-43204
CVE-2024-42516

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
index 66a017a864..34526fc78e 100644
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


