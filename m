Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B17C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 11:26:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9740.1715167562453196681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 04:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hLMF0ylD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58581b9602=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4484P2UQ016660
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 May 2024 11:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Kupvx
	WpbvC/bpX5jAX8RfmDev0zsD/TdF6r0GWgp9dc=; b=hLMF0ylD21WjasAY+HJDC
	8i/xZU3wPZHN9QVcj5NVQzj9ZiGvYb5u9ltxZKw6uNKVjqk9fQLBTi/gRiOhuYuV
	Wk9ukwh9oH9jhRDvw1+2UD9UpYWJFp8R2HgitHmm8Fj9V6H1N65YRUfVYShyy0/J
	Puw+BC1y2lZyuDjLd9kZfD1H1TGjHZeRq0tOCCSwW4HYGnIFIgv5+jkwMl4+aUm6
	gHmINxpfmFUwNCh2G72g46DFMIuax94XzGpNISag4CFZCvsYZfigsUAUYLUONksx
	+7OADb2/5o0cb9YX1vai1wl40XlBu7XcdDvZsNkaARFXNtXAPJU0uNAVrLciuRqO
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xysjxrpg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 11:26:01 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 8 May 2024 04:25:59 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: upgrade 8.1.22 -> 8.1.28
Date: Wed, 8 May 2024 11:25:43 +0000
Message-ID: <20240508112543.1554894-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: tQmJ9hkLPW-Su4Oh9lrtWZUq-_M_NIQ7
X-Proofpoint-ORIG-GUID: tQmJ9hkLPW-Su4Oh9lrtWZUq-_M_NIQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=974 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 11:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110277

From: Soumya Sambu <soumya.sambu@windriver.com>

Upgrade php to 8.1.28

Security fixes:
    CVE-2024-3096
    CVE-2024-2756

https://www.php.net/ChangeLog-8.php#8.1.28

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.22.bb => php_8.1.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.22.bb => php_8.1.28.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.22.bb b/meta-oe/recipes-devtools/php/php_8.1.28.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.22.bb
rename to meta-oe/recipes-devtools/php/php_8.1.28.bb
index ffa331844..e7eb75c1a 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.22.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.28.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "992354e382c6c618d01ed4be06beea8dec3178b14153df64d3c8c48b85e9fbc2"
+SRC_URI[sha256sum] = "8be450096e0153c47d75384e7dd595cc897f1d53ce0060708ce9589bcc3141ee"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.40.0


