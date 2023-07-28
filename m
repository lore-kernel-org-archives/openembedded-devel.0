Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EC7C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:14:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30960.1690546452255770403
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 05:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DJOZRDoP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=757328b575=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SAh2YP023773;
	Fri, 28 Jul 2023 05:14:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Zv02J
	Zz9DTtWNpBOA4O1QFbclQyExJ3wPNlrQOOjrRs=; b=DJOZRDoPpTQZmkiNYTdzN
	E9icZa4714ejgafloVZ1fgO1QHG+INzU/AlA4rfTcvfIlMeuPD7xCtp2+WDVxfKb
	NAwge0J8tb/uZaBk0PAwgdM7MwWCG3XpUShP64gmz+w77xoLHufLocLMKjmaY49E
	OEODtlullS0Kpq4ubQ4MkBi2/pjnR4mVSeWdO27uPZbJ5AcQA+uj4DrTZx8UdP9H
	c1mPjib05u3HXJxGD7wbL4B4f/PkRfBuy5JehfwcrH24G41ccAtQx+6sv/RIbXwj
	hY+SSzhTZn5fJ972FGEPNLi4HB87GxtemCTflIQEDraw43hxIM+YG5wyf5o3qwSh
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0ad05fgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Jul 2023 05:14:08 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 05:14:06 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 3.2.19 -> 3.2.20
Date: Fri, 28 Jul 2023 12:13:46 +0000
Message-ID: <20230728121346.3689682-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: bvxOrNCQM3-NeQwvYG_E91lsKm_IRDIh
X-Proofpoint-GUID: bvxOrNCQM3-NeQwvYG_E91lsKm_IRDIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2307280112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 12:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104070

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.2.19 and 3.2.20 contains the CVE-2023-36053 fix
and other bugfixes. git log --oneline 3.2.19..3.2.20 shows:

19bc11f636 (tag: 3.2.20) [3.2.x] Bumped version for 3.2.20 release.
454f2fb934 [3.2.x] Fixed CVE-2023-36053 -- Prevented potential ReDoS in EmailValidator and URLValidator.
07cc014cb3 [3.2.x] Added stub release notes for 3.2.20.
e1bbbbe6ac [3.2.x] Fixed MultipleFileFieldTest.test_file_multiple_validation() test if Pillow isn't installed.
47ef12e69c [3.2.x] Added CVE-2023-31047 to security archive.
15f90ebff3 [3.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/dev/releases/3.2.20/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_3.2.19.bb => python3-django_3.2.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.19.bb => python3-django_3.2.20.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.19.bb b/meta-python/recipes-devtools/python/python3-django_3.2.20.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_3.2.19.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.20.bb
index 0c2fc10e63..b5224b41c6 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.20.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "031365bae96814da19c10706218c44dff3b654cc4de20a98bd2d29b9bde469f0"
+SRC_URI[sha256sum] = "dec2a116787b8e14962014bf78e120bba454135108e1af9e9b91ade7b2964c40"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2.2" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2.20" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


