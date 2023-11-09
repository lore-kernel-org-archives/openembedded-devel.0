Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F7BC41535
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 09:15:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.117287.1699521330753747560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 01:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EpXMW7eZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96774aeeec=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A97hVbe011074
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Nov 2023 09:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=uomjQs3GrXL+KVBcZSSmThU32QTdw9CdTa312sQR1r0=; b=
	EpXMW7eZ1fmS0/atQXSAozqsVGbJ46oXxMzf5rIQcCpGXRiSHpis/a3gsqjjfo+d
	qLxzCqPYZM2RV2KJe7WjJAPXqmNM4ZTIq/xyJJcHuPfXeVl7loYPsnRaQ0mbBA+u
	muaL/lkqZv6XPzxv38d5VQvEBNjKauvXxNmfmvq3tt1+vSQOPVR+nz+Ky57uGukp
	LMknKZ9+xt/fVnnHc7mkoceAw7j1Buj3cW/F2REv3zLrHMX5jSZrlO1y7rhMn12O
	0CWvg9aXA+kVIYSvYtih/pSNYm0LJVdTlSX/UaL2bzCN62ZInHXeb16IPcxrMBiJ
	EGHMNOcahUpip0ffjjCSdA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y1nwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 09:15:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 01:15:32 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 01:15:31 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] ptest-packagelists-meta-oe.inc: Add nlohmann-json
Date: Thu, 9 Nov 2023 17:15:26 +0800
Message-ID: <20231109091526.484831-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109091526.484831-1-mingli.yu@windriver.com>
References: <20231109091526.484831-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9-Pu5E9vzN3EcAiuGmX9AgUgivYrBU3E
X-Proofpoint-ORIG-GUID: 9-Pu5E9vzN3EcAiuGmX9AgUgivYrBU3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_07,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=753
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 09:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106512

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index bab9d4372..33aff7f44 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -28,6 +28,7 @@ PTESTS_FAST_META_OE = "\
     lmdb \
     minicoredumper \
     neon \
+    nlohmann-json \
     nodejs \
     onig \
     poco \
-- 
2.25.1


