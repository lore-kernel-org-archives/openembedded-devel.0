Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B2DC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 15:49:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16952.1685720955659108999
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 08:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hU/BycJi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5517cbc0f1=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352Cx6GC031343
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Jun 2023 15:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=hHEbOdugSJh2ZrdqAvFHu4U/5IBv6OZn6mDduPPSOpo=;
 b=hU/BycJiNy16c5Myb6HkJNtrcT37jUhM/65M6aiXq7Yh0JhY/14Fa8wOffmdDtfFOMe7
 TJAuZjBgvVfroHkSo+tqyCfVVvc6JfOh8BWpWZnOZTsmgjpEYe5X+zhbI62d4Ia9ErYE
 kQWPK/IFq+/9l1ndmlmovN2rQKEN9GXXrr7aq4CltbuJ4t8ULyq6qly8hDg7mLTVGsul
 oZR1BIBy4JjclFA8Dgg8+5qOcHHjbq2C1YxPuIV8dmrB39o8cyRjqP2FSwPlwqBAb+F5
 3EcMoU5te2NgDhvwdMl8h1D13d4bmWdCK1EcT1KB8Qpk1GtWHRohW7C8kiIx7RO92MsH SQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qwqgj37c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 15:49:14 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 2 Jun 2023 08:49:12 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH v2 1/1] python3-django: upgrade 4.0.2 -> 4.2.1
Date: Fri, 2 Jun 2023 15:48:51 +0000
Message-ID: <20230602154851.2880933-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: R6VjRQ-aB4N26YfboCXx9Ll-uy8J0BUf
X-Proofpoint-ORIG-GUID: R6VjRQ-aB4N26YfboCXx9Ll-uy8J0BUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_12,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306020120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 15:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103100

From: Narpat Mali <narpat.mali@windriver.com>

Django 4.2* is designated as a long-term support release. It will receive
security updates for at least three years after its release (From April-2023
to April-2026).

The delta between 4.0.2 and 4.2.1 contain numerous CVEs and other
bugfixes.

Changelog: https://docs.djangoproject.com/en/dev/releases/4.2.1/

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.0.2.bb => python3-django_4.2.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
index 690b9809dc..4daca65eb5 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a"
+SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.40.0


