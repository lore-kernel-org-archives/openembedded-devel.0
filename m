Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22129C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 07:47:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37177.1679471258504917114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 00:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n8m/ygVI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2445ee82b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M7a2sK001603
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 00:47:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ySogqacub8c3Gg3sZCHR/iuCRmdt4KdjfyPznKStQBE=;
 b=n8m/ygVIhCf4nuAQrnDbTN3yTjHtGOXoDMcZmDjh4xhubOFTu/WQt1eUBac9mwlUZ+ws
 vTrK5JYiejD0cuI2ftkqYx2Kr1h5h0G1Uj9UrqEiSVsDz781FDR8xtwhMVOtYGrn6FRT
 W3YuZJlTAd0plYgpAsyVXto1sLFZV4QVWZjOg3oW/HRMWVfDtwpO9dWiCeYqgVxqfSeQ
 x1qT3S1jOcboY67NSCCS9EVKXldeh8FpAsZ6e4GQWwTL15zF9nIVBd3IfQeypO8HH/aa
 AL2e1UkL/Dpko1SY1WO9ls0uOPiwXGz0OkzdoFRRc9X/UmVNaxF5eAp4L5h/OM0PmNQB ew== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqxu08rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 00:47:38 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Wed, 22 Mar 2023 00:47:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 22 Mar 2023 00:47:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-webserver][PATCH] apache2: upgrade 2.4.55 -> 2.4.56
Date: Wed, 22 Mar 2023 15:47:36 +0800
Message-ID: <20230322074736.418308-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: foL34cGQ8AnHyFMk6ygUHegliNGFsHcI
X-Proofpoint-GUID: foL34cGQ8AnHyFMk6ygUHegliNGFsHcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=762 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303220054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 07:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101629

From: Changqing Li <changqing.li@windriver.com>

This upgrade contains two CVE fixes,
CVE-2023-25690 (CRITICAL)
CVE-2023-27522 (HIGH)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
index 84bd0062e..8b857d2f0 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
+SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


