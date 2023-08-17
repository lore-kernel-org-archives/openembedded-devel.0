Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9696DC27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 06:44:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.181137.1692254643946990591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 23:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gVNU5c8W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7593634f3c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37H6eB5c007359
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 06:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QCuPg
	tpY6tHfygQkekG2PvDPiHlIBbCWAnb2tFuDFTY=; b=gVNU5c8W1oNjKoi52zBg7
	iJvUP7sH1Ttbn41ob7qfiQ5EI5+/n2pJAoouVr/zVTyA3lzb1AVnh1AxlW6JzJrZ
	CuINGiZR3nva/0ziEIPPgHqei6JPCohLQsWgEATbLMlHrs1kJ6WVnwXIN9ic/g+M
	0tc4Rx01A8OBxNfSu1cip3MPl+g5oDci7uHd7KR2+Rc5lLh+BsWKHfKgdv4ZONc0
	lOTc9vBJomVwIce4VbdPUIhtkSNarqxcz5X+OoqXd3DTWvaTWgtA/tHHECjlGT5O
	PoFS8DryHPW+wqLaAJBbvvGVZShjN9xWoz0lJs+FWUIsseCnsjLi6sYOuKZ6fynq
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sdy9wcq9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 06:44:02 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 23:44:00 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.16 -> 8.1.22
Date: Thu, 17 Aug 2023 06:43:46 +0000
Message-ID: <20230817064346.1473528-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: t61YzDl65Omy672JDtldbRxcc-NHXIqT
X-Proofpoint-ORIG-GUID: t61YzDl65Omy672JDtldbRxcc-NHXIqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=801
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 06:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104446

Upgrade php to 8.1.22

Security fixes:
    CVE-2023-3824
    CVE-2023-3823
    CVE-2023-3247

https://www.php.net/ChangeLog-8.php#8.1.22

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.1.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.1.22.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.16.bb b/meta-oe/recipes-devtools/php/php_8.1.22.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.16.bb
rename to meta-oe/recipes-devtools/php/php_8.1.22.bb
index db8a65544..ffa331844 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.16.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.22.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f9f48b17db010fb633ce"
+SRC_URI[sha256sum] = "992354e382c6c618d01ed4be06beea8dec3178b14153df64d3c8c48b85e9fbc2"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.40.0


