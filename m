Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A59CF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 15:56:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.40225.1727106958954132314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 08:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=oTvEQqCt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NB0kHn004282;
	Mon, 23 Sep 2024 15:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F0EHZWAR+Fh/VEw7TbQuqe
	i3H1/Yj3dJU+8ZzglXFfM=; b=oTvEQqCtyKSemYEKJ4CCla5XQLqDaqRJTawv3M
	fFtb1LVgRAUan7JyFryd1txpCDE71LsdrDwnZF5eYubvXIRDtuyMqGOrazDZRXt9
	R/XUqMmCB7u/FEPfqsG+HJIaUoYKrUZuHQxibyhfvY/4xGMwYFPanXb1ROB3p/Ma
	7aSRYm3IsLyCtEnvCsMU6Oka5xgprnK3Q0DfHkJUYicdo3+qWJxNQxZATaa/Ak4y
	2uaI3pO7BykOqfkFQ9FfzZstEdAPGPuxZs9Yxh1xgBGN1Noz3Vp2QCEC1z9SgNEa
	1i/X2Fwxc5Z8hYCSj5I9RzjhiRXLkIPgoPn5VQa5hP4CTK6Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakd3dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 15:55:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NFtuFo014720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 15:55:56 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 08:55:54 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>, Khem Raj <raj.khem@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 1/3] android-tools-adbd.service: Update ConditionPathExists to /etc
Date: Mon, 23 Sep 2024 21:24:29 +0530
Message-ID: <20240923155430.1723757-1-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vj21Ea1ahAvZm7jnGteUQSv1hzVdv0QE
X-Proofpoint-GUID: Vj21Ea1ahAvZm7jnGteUQSv1hzVdv0QE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=851
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 15:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112458

To ensure android-tools-adbd.service starts at boot, the path
for ConditionPathExists must be present at build time. /etc is
more suitable for build-time files than /var, which is for
runtime files. Changed ConditionPathExists from
/var/usb-debugging-enabled to /etc/usb-debugging-enabled

Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
CC: Khem Raj <raj.khem@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
---
This is a backport of 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
from master to scarthgap.

 .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
index ddf8d7f74..b6661f2e3 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=Android Debug Bridge
-ConditionPathExists=/var/usb-debugging-enabled
+ConditionPathExists=/etc/usb-debugging-enabled
 Before=android-system.service
 
 [Service]
-- 
2.25.1


