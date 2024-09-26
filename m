Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784FCCCFA15
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 05:53:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.36257.1727329980096603694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 22:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=UuVrUJ+Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Hx4024189;
	Thu, 26 Sep 2024 05:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8votkKknIzKNKSwOHlASWcCi11PsUaqb1WYkg/9URXk=; b=UuVrUJ+Qr0gvkL4B
	TYq3UA8lg9QjMqS5WDUQXYlvyhJUUpC5DYmcn2zZ6FWqNV7AuZ+ijjOYUDZHVFK0
	3HjLAdqt2uenj/jhLlE+kWZ0PUMwJnmOxhs3vDUbztIUhwFCHrgwSyBOweZsi5En
	lP+PlY0drqlU7PNhWLEb7v0qW98I4j5LyrbngbWVfLHYPNfRVUdsJaDXbfjErFIm
	4L3aSH/+VaEK07tTkspH08EiXGh/lWuI1rg/4QwW9ZNfhJ647fGBFFKSjEf3NHwC
	JghlwZ2/MDPv8kD2wvJrMBCwNoprX9Dpy9WEfGxtTO8oYjvXNt/S/Rh+mtIBD4vu
	cl2ebg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwex60q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 05:52:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q5qweF004607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 05:52:58 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 22:52:56 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Raghuvarya S
	<quic_raghuvar@quicinc.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] android-tools: Create flag file /etc/usb-debugging-enabled
Date: Thu, 26 Sep 2024 11:18:24 +0530
Message-ID: <20240926054822.1274824-2-quic_raghuvar@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926054822.1274824-1-quic_raghuvar@quicinc.com>
References: <20240926054822.1274824-1-quic_raghuvar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SBklbhTPwiHWVo4YnL1vUnaP0xqWAabl
X-Proofpoint-ORIG-GUID: SBklbhTPwiHWVo4YnL1vUnaP0xqWAabl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 mlxlogscore=864 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 05:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112509

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Location of the file that systemd uses to check whether to
start adbd or not has been updated from /var to /etc in
android-tools-adbd.service. This change changes the path
of creation of usb-debugging-enabled flag file in
android-tools recipes from /var/usb-debugging-enabled to
/etc/usb-debugging-enabled

Backport-of: 2a3d4be9994e ("android-tools: create flag flag file for adbd at a proper location")
Fixes: a29c6386d576 ("android-toold-adbd: Fix inconsistency between selinux configurations")
Fixes: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 8f28abbd1..cf1096829 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -184,7 +184,7 @@ FILES:${PN}-fstools = "\
 BBCLASSEXTEND = "native"
 
 android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/var/usb-debugging-enabled
+    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
 }
 
 ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
-- 
2.25.1


