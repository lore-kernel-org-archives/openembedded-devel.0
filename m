Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C0AC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 20:25:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.108110.1701116706500611430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 12:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ru6XIWYz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=969563b60f=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ARJIWBQ031738
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 12:25:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ugWWZ
	+cboSsjiWOMr0+VLF0xL7iEHu8OJiOxX6lCZLE=; b=Ru6XIWYzH/kF32//klGOR
	QZGUF6LsB3JQUv6KaFOBiA04zrtcAz1gvvDObfDqVVkPLsqQucgaAHbD2YyK+PGt
	61rmrdZc0x/uifHOKsf6k9u5S4z9bfh1bGerPK7H9W75VDt0P9kvZ2pZ6mOwHKWR
	zLUq6OQPQPSMP2FRk8/bPmW0hp2FAH9CIfDAEGNHjXcWFxdUJ85AiDYYAdP1cU5b
	vPlzq+icXuClcRikqlgL/OK5MByt/0KDfRR5eotl/isLPB3A7Lr6JeV1W9Xf5QrG
	S8ttf+sLDOAECbtCR3emm/JlKq8sNu4B4nQWnIcuVnqWcKB7CXAFSDtpDOrdDL5+
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ukham1q4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 12:24:37 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:24:12 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:24:11 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-python][PATCH 1/1] python3-django: move to version 4.2.7
Date: Mon, 27 Nov 2023 12:24:04 -0800
Message-ID: <20231127202404.1492180-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4gN61bIARUdHgsmrpERM7QsI7UUYVYdZ
X-Proofpoint-GUID: 4gN61bIARUdHgsmrpERM7QsI7UUYVYdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=872 impostorscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311270141
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 20:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107062

From: Joe Slater <joe.slater@windriver.com>

Version 4.2.5 fixes CVE-2023-36053 and CVE-2023-41164.
Version 4.2.7 fixes CVE-2023-46695 and CVE-2023-43665.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/{python3-django_4.2.1.bb => python3-django_4.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb => python3-django_4.2.7.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.7.bb
index b1474cf054..100db9bd71 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
+SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


