Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6357CECAAD4
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 02:39:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7737.1661999961656015369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 19:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PBJCvo8F;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62439cac31=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2812YcaO023047
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 19:39:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=yUo5NjS1wSqq/WY9thgP6opUeZo3thgLq1guM8yURCg=;
 b=PBJCvo8Fhd5p0qTF0ehVMFGMDTwOQpWWhyIjEGSEmsFwqZnjTifSBZ/HUMCixl+LlPtA
 DO7GDVI3txlZERZzd99Mqf6Y2UHasffdGC52ojlZfhdIuTTOPZd+fT92rmyOLM95JDnt
 8F9MpQqWYvFrNSNU1TSXoBdybe5+BIg5l2ptcXdFt976eeqKPxpY3fwMCIppFcOKo+SP
 kisCMMXZt3ZFjjsOAZlOVWDyTDcUkwPxeJtjAtCCkrpqvwqMK3CSxQfyF0QV+UWGH5OZ
 +JnLFBawH0mzvrh5vZTvBa8N3MpyTy8dsfvQ+l/odDVgAlzPchtkzbCqvj4e5QBtcaEm dg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7ej6475g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Aug 2022 19:39:20 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 31 Aug 2022 19:39:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 31 Aug 2022 19:39:19 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 31 Aug 2022 19:39:19 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-pyzmq: Add RDEPENDS for
 python3-pyzmq-ptest
Date: Thu, 1 Sep 2022 10:39:18 +0800
Message-ID: <20220901023918.3083901-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cXKsK3K41I98JuIxXbhNfYdc0rupSOo9
X-Proofpoint-GUID: cXKsK3K41I98JuIxXbhNfYdc0rupSOo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_16,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=935 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209010012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 02:39:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98579

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  # ./run-ptest
  ./run-ptest: line 3: pytest: command not found

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
index 40cb22b5e..faf7915ea 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
@@ -32,6 +32,7 @@ RDEPENDS:${PN} += "\
 
 RDEPENDS:${PN}-ptest += "\
         ${PN}-test \
+        ${PYTHON_PN}-pytest \
 "
 
 do_compile:prepend() {
-- 
2.25.1


