Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DA6CF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 15:56:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.40234.1727106980822411214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 08:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=go3RjnRH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NBWm6Z013399;
	Mon, 23 Sep 2024 15:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feHfvDIcdYviw8KtYkE0T7PGInexXlNY/k7ZC9PDpqA=; b=go3RjnRHE1+Ul6uI
	IH4aA93VHjV9hL7v7HmsAUrIo7B9tbznTJinAU4y8+yr8ovtaLCTHU9pitl6bV7J
	swKTHuz1VvZ9KxCRpmpAzoqYcNaAL5h+uV57SOr/ydiBbH4i/0plBALEkjOIRALh
	qrFr68Rwn4jaD8ugV1e6qej+RSFC60s1Ly8fyT30QlR7emXR2k8Zt/PTMh08a9Po
	InU+3MTUZrwRYKgsF4fsCf1dPihPbPpq4WKJUoZIcIpMY5et8BAv+9uaFc7Raau9
	Ky36Q6xEcoxfNa2PhEUEHdrNsRvi0l72Z355Qa0tXSEJZ6wUDzwBPLZn7hVlwpUk
	3yA7gg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2n715-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 15:56:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NFuIDB014972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 15:56:18 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 08:56:16 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 2/3] android-toold-adbd: Fix inconsistency between selinux configurations
Date: Mon, 23 Sep 2024 21:24:31 +0530
Message-ID: <20240923155430.1723757-2-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923155430.1723757-1-quic_raghuvar@quicinc.com>
References: <20240923155430.1723757-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BhH5R8mvSLLpJI_lZcQc5ReBjGmrJ74L
X-Proofpoint-ORIG-GUID: BhH5R8mvSLLpJI_lZcQc5ReBjGmrJ74L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=830
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 15:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112459

ConditionPathExists is set to /etc/usb-debugging-enabled as part of
meta-oe/recipes-devtools/android-tools/android-tools/android-tools-
-adbd.service file. However, in meta-oe/dynamic-layers/selinux/
recipes-devtool/android-tools/android-tools/android-tools-adbd.service
file ConditionPathExists is set to /var/usb-debugging-enabled
This causes an internal inconsistency between selinux-enabled and
selinux-disabled configurations.

Backport-of: a29c6386d576 ("android-toold-adbd: Fix inconsistency between selinux configurations")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
---
This is a backport of  a29c6386d576 ("android-toold-adbd: Fix inconsistency between selinux configurations")
from master to scarthgap.

 .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
index ddf8d7f74..b6661f2e3 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/android-tools-adbd.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=Android Debug Bridge
-ConditionPathExists=/var/usb-debugging-enabled
+ConditionPathExists=/etc/usb-debugging-enabled
 Before=android-system.service
 
 [Service]
-- 
2.25.1


