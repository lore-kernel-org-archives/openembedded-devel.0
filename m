Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3764CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:37:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.7813.1727159838187865859
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=OoozfO4b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NK2Lpo030767;
	Tue, 24 Sep 2024 06:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uwgRt2vykPtcIPzKyjRyXVOlyRSK/nAxXfPtLkBm5I=; b=OoozfO4b9zYXndgg
	dbnVFaAZcU8n2YS03VHbPVrXP7goKW4WscMOQuHFLAfx45UaWw3608H+YAjVlp1c
	DQ/wBagCo5hf9BhLG1Z6ShWNt1loMn5kBh7Ifr5s/CCdUNtzSFRNVAlOKfPP1tlT
	2T7meknnu2mzDSO7RteDsdLkWZzsvulKYeNf3u4kJjyaV8vSUNUoJb/Uq4P15El5
	E+mLcX2J1h7vp0b208jdtuCulQIiq9xdTyEn38t2I2/VhrSiq3ElhhiSjljLMG16
	dUw+qOZrCc/fSd/wZ1f4PWAgEd39nog3HOAHeCaiC06dOt2BjhnejKMFUT4iME79
	o3s+dg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6qgvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:37:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O6bFmh002441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:37:15 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 23:37:13 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [meta-oe][scarthgap][PATCH 2/3] android-toold-adbd: Fix inconsistency between selinux configurations
Date: Tue, 24 Sep 2024 12:02:30 +0530
Message-ID: <20240924063229.2309109-2-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
References: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EZaM80I28btIKc0yJnTmUBEXDudAgA3W
X-Proofpoint-ORIG-GUID: EZaM80I28btIKc0yJnTmUBEXDudAgA3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=823
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112471

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


