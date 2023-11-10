Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D15C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:52:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25666.1699617164294689253
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LRBHNVbj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96782874e7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AABf3rS010455
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 03:52:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=uomjQs3GrXL+KVBcZSSmThU32QTdw9CdTa312sQR1r0=; b=
	LRBHNVbjmG52bNZEEoSGbEC0Jd21bRO2ideGjUd0oXZRnOFLCMLLL/w+MGDBwUu6
	MnEvvSU4N2Dq15Won9VlLMi2WcYLBSptNIUccNIAvw14wBTemTvrMWXtxPo+VHKP
	v0Qx/BPCIjhge5guqZ13WgeFzZpdx8IYE+iQpzjkuWYStHt2FLozAkQ0EKY3FrSX
	LX+F4F6jE18uTVxTPzLjTlMVK7RLQrZOPETwue3C9na+rQN2h8a0UONIRE4WPjZa
	ttUoYxLj27+5WhNMLEuE1tlVWooEBIPDF78lYiBwaGxTtIuqjnt6iJh+XAeXA/lL
	72OQORb4pinyfQzKQ/OMRA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t30qt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 03:52:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 03:52:47 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 03:52:46 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2 2/2] ptest-packagelists-meta-oe.inc: Add nlohmann-json
Date: Fri, 10 Nov 2023 19:52:41 +0800
Message-ID: <20231110115241.3613778-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231110115241.3613778-1-mingli.yu@windriver.com>
References: <20231110115241.3613778-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AT-bAuRoCnoqDpylrNAZJf01rQPOOwNr
X-Proofpoint-ORIG-GUID: AT-bAuRoCnoqDpylrNAZJf01rQPOOwNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=749 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106544

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


