Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F75FC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 22:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31.1675981713508677935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 14:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g29ofE4M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1404e4c6b8=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319LG1Qa022536
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Feb 2023 22:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ugi/NVRU+tC/GU25mQPrQL1G/HGv7YPgvq3VJNwE3Ts=;
 b=g29ofE4MA9tVol9SsbcEKcZ1EXA3B7yWp8zpomv3PPQaRe/uwRtHKGZxKBNzzq0m4ALv
 3+ghrI9U0pbWKNgESrSzHrmk5pegASP2fvHc/bZdnEJPLFpGXReKFJ/wVmADW8CwVrXZ
 tb1+GqaI/Aoc9f8l9ljZgGc+waoUgHAyfwf8FWXi/a8asq0xGzQ12NDNiIWADBo8zrqq
 BUARa6BPnSRp33SpWCyX8lLoKlVl8vfUOqlWRlQ9egrkHJFGUeb5HEpYB0UA/gQT3ij4
 6HPw2U63HlZkKYIUTezgfeBtNdz+3KHk+56eCinPbpZ0v4bmGx9UjUFw00srbHcyw+bb Hw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck35smd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 22:28:32 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 9 Feb 2023 14:28:31 -0800
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 9 Feb 2023 14:28:31 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 1/1] python3-django:  Fix CVE-2023-23969
Date: Thu, 9 Feb 2023 14:28:31 -0800
Message-ID: <20230209222831.1135221-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6i5dY3fEF1dq3ylnDHXMoZ9MoIFObccN
X-Proofpoint-GUID: 6i5dY3fEF1dq3ylnDHXMoZ9MoIFObccN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=894 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090203
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 22:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101014

Advance to version 4.1.6.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.3.bb => python3-django_4.1.6.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.6.bb
index 6d800982a..e54398c45 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.6.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
+SRC_URI[sha256sum] = "bceb0fe1a386781af0788cae4108622756cd05e7775448deec04a71ddf87685d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


