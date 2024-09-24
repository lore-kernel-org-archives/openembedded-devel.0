Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1311CF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:36:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.7805.1727159767460884756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jt/RBccz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O0610V021829;
	Tue, 24 Sep 2024 06:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZGPvbJpCa/8MpyZEEtG80e
	t6PsNNLKB+Sif0gQe3p4M=; b=jt/RBccziptHealvN05kPxO1H2Yb6uBf4FQVPs
	MsYNpgE9oOoKJt6jdpXoe2BDFM7Wm6r4sx0Bei6js1/7cdEQlsSOGt1qP4gcCC3f
	JmrWQsGMvi4qFU/4ZP/cD8ulj3PKHbvJ5LLUvo7JrgFEhyTUHb2EmWLf5OpXvZev
	1bXYe5F/MJWet9XHqSbTs5TkLXgpgJC81qvJ5dmXadHr4x8tDbIR+ULLQXsgXSZ9
	4mn+WyEZ2lCSYIOc0205QCUdziXtonnyspoFZTwaJT2UwBybB/2Fmp8dq3/CbfKZ
	FMuYpJx7+Hg0FotpxNIsFj5IY5Hmb33qMBsfufqiZ4+U7X5g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyffwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:36:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O6a43S010991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:36:04 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 23:36:02 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>, Khem Raj <raj.khem@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 1/3] android-tools-adbd.service: Update ConditionPathExists to /etc
Date: Tue, 24 Sep 2024 12:02:28 +0530
Message-ID: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4uSQ3dWlmCKGGhFLSs8Omv_-DVtTdt00
X-Proofpoint-ORIG-GUID: 4uSQ3dWlmCKGGhFLSs8Omv_-DVtTdt00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=833
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112470

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


