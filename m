Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1236C678DC
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:38:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.14263.1726825109411448654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=pcnYPQhZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K87NHr002148;
	Fri, 20 Sep 2024 09:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feHfvDIcdYviw8KtYkE0T7PGInexXlNY/k7ZC9PDpqA=; b=pcnYPQhZCWpuD6DD
	rmM8PCeOjqyel8n2kDjaqvYCAvtGkPCy+2625HWhrvjk+I5lvkYQWUzqS76UFDRZ
	Gl2u5ETmqS8tE6wVcMwtwC8Wz3GDad8A2KiShsU5F8jCbRE82w0BZ6XiLBfSP1WF
	gjIZRMjIHgHdiZLXodCvVwlsuQZ8zWKO4Zyq2sGUmviU+/vQUb+sTIqhuUZiG4qU
	Xz87/KBaBaEPUMYQvGts1Jwj2vqnixTjxEEpn3jduvjDmlqLeDZDa/LWQc+slA3d
	dY3dLOIHYFV6IYsKeOZXc0lg1RMHJqv/LVeeWkCUQLd84BrddzHC7Suc/LOdVsQx
	GH3LTA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4kjrdn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 09:38:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K9cRxu011521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 09:38:27 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 02:38:25 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/3] android-toold-adbd: Fix inconsistency between selinux configurations
Date: Fri, 20 Sep 2024 15:07:49 +0530
Message-ID: <20240920093750.4000239-2-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
References: <20240920093750.4000239-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cr0G4plML2pf9aGGw3fPGc3rPfNs9aEo
X-Proofpoint-ORIG-GUID: cr0G4plML2pf9aGGw3fPGc3rPfNs9aEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=800 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 09:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112397

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


