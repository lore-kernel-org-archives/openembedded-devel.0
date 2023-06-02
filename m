Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBD6C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 15:59:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17179.1685721564683471970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 08:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jeLhhD1Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5517cbc0f1=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352CABCs007353
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jun 2023 08:59:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=76vFtCjV6nd0AltfBmQWzita37RzK26o4S9ZM5AGJAk=;
 b=jeLhhD1QkcUXC+2scILMMwU5AInTaiS7tch/o+HoZRmAWpl9qERK+gNZdaCT15yzO+nR
 u+EOpBrYJah8b95oJtSvIuD4UVwlgPWKRLzA9sVEBKUGmW9CHmlWUttsul2TIu6r1a1D
 1+KYGmjO3F0njasmo+q86X73mKGlusNqDD35IizRRHO/qbh1d7mCfCncJvqHsRLiP2Fe
 XPyvZR9vt0Cjge2QVLubI9j4MWY6yqzg0z5/gC0aTet9juxyH042Xkaail0kgGhgZNR8
 djMhckT+5CenYBQDwKH7KG1X5tm/frWZR0YXWTjvyD0skg1fApC7bTB3+8uIGBeUTeJI 8A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjduf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 08:59:24 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 08:59:22 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][mickledore][PATCH 1/1] python3-django: upgrade 4.1.7 -> 4.2.1
Date: Fri, 2 Jun 2023 15:59:02 +0000
Message-ID: <20230602155902.2888947-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: s5VAj2tqwNBAak5i6wCvutrW4Na3mh0l
X-Proofpoint-ORIG-GUID: s5VAj2tqwNBAak5i6wCvutrW4Na3mh0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_12,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020122
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 15:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103102

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.djangoproject.com/en/4.2/releases/4.2.1/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.7.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
index be806eefaa..b1474cf054 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8"
+SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.40.0


