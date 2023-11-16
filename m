Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18974C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:43:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18879.1700171017187695032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q4VLxMYC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96843f5788=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AGKf9tM006853
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:43:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=lltkL
	spIhfFZuvuVb2w7Js7yS8t2MlZxmCobMafR0nU=; b=q4VLxMYCLvHGJTwdkK7X5
	xteum2gKwIYIu6fNoN1fFX/5GQG/6CZF0irR5/uqkxoIL+EFgKQ9Rws/0ka6Cv8S
	7JphetbV/M7zS/o97s0edEvasKbosvZ4Rf6IN1NtJmgjQBz1cx3SzIySyHrfxZE7
	BGzVVZ4XxX2UnDT1glLAyOiHtfxRPmkFPTna8BUG9Eo329fSfs/Cp+nw31JovUtE
	r4hwkoPVMVfGRla9b3a3yLVGYZTctToqFz2nOT3GHk0IgIsT/0LG4fWQoEQ9xN8z
	RQepnn3t2cTkewjIrjTRSorh30L0FRcx3F77/4Mq2J9aOkwcSCawvqJGGqC8dXnq
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kn5qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:43:36 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 13:43:41 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 13:43:41 -0800
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 1/1] python3-django: move to version 4.2.5
Date: Thu, 16 Nov 2023 13:43:35 -0800
Message-ID: <20231116214335.2431020-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TeF_2l1NViFGJlesTYNMqhC6y63SAy9D
X-Proofpoint-GUID: TeF_2l1NViFGJlesTYNMqhC6y63SAy9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_23,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=811 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311160169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106830

From: Joe Slater <joe.slater@windriver.com>

Fixes CVE-2023-36053 and CVE-2023-41164

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/{python3-django_4.2.3.bb => python3-django_4.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.5.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.5.bb
index 4e3192744e..bc919b3a87 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "5e5c1c9548ffb7796b4a8a4782e9a2e5a3df3615259fc1bfd3ebc73b646146c1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


