Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2852C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 09:24:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29473.1723022660409743818
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 02:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89493cfaed=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4774oCKX004960
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Aug 2024 09:24:19 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rr85h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 09:24:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 02:24:18 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 02:24:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][master][PATCH 2/2] libatasmart: Update SRC_URI
Date: Wed, 7 Aug 2024 17:24:15 +0800
Message-ID: <20240807092415.287599-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807092415.287599-1-changqing.li@windriver.com>
References: <20240807092415.287599-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BWqkujWtVULCqOPI3R7ZMVnCu_vIwleT
X-Proofpoint-ORIG-GUID: BWqkujWtVULCqOPI3R7ZMVnCu_vIwleT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_06,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=760 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 09:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111605

From: Changqing Li <changqing.li@windriver.com>

Update SRC_URI to fix do_fetch warning

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index f747ecbf7..59b26d821 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "udev"
 
 SRCREV = "de6258940960443038b4c1651dfda3620075e870"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;branch=master \
+SRC_URI = "git://git.0pointer.net/libatasmart.git;protocol=https;branch=master \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
 "
 
-- 
2.25.1


