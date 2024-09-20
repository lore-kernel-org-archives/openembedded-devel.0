Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5920CDD578
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 09:38:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.14264.1726825113883289011
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 02:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Q/dJ2Te6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K7u0XG018213;
	Fri, 20 Sep 2024 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX82zed4X/+nJDhfcpFONW+lb+Ap3KTs6W3yoFzda1s=; b=Q/dJ2Te6mezNpm3X
	oHooPUaHcTEx6OadDdfNH/BJw58u4IONq3ADkqDJbJQJsLD5CcyIr+snq791JNoj
	kPYmzMuWX9lL+Z4d/vTwXjT6ATauuQcJ/jJRXCQcEy7oWz/TdlFLEL72FSpRpskk
	ow/jmxbVIkIsRrbrl9OIaUiKqnWImbl1B2cbvrapKNtOzIB6uHfo2afmmjq2fqf0
	J42EqvxF6+xgz/2V72ko7h+qInP4IFrvCYFmvnEZH5sHABz6yaSEovwd8HLhHN9a
	1Hl8qgFt0KoKB07XvZuXjXxfF8WYV0ZczqdSCGw6Ti3cnk50kTWGnPXAkyrz0tC4
	j4FyhA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j70nms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 09:38:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48K9cV6x029443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 09:38:31 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 02:38:29 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Raghuvarya S <quic_raghuvar@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
Subject: [PATCH 3/3] android-tools: Create flag file /etc/usb-debugging-enabled
Date: Fri, 20 Sep 2024 15:07:50 +0530
Message-ID: <20240920093750.4000239-3-quic_raghuvar@quicinc.com>
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
X-Proofpoint-ORIG-GUID: xvYHv0pBKWCTzgm73aplEt-IzJelkCp_
X-Proofpoint-GUID: xvYHv0pBKWCTzgm73aplEt-IzJelkCp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=778
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 09:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112398

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
This is a backport of 2a3d4be9994e ("android-tools: create flag flag file for adbd at a proper location")
from master to scarthgap.

 .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index fbad5e136..e9b0c97e9 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -188,7 +188,7 @@ FILES:${PN} += "${libdir}/android ${libdir}/android/*"
 BBCLASSEXTEND = "native"
 
 android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/var/usb-debugging-enabled
+    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
 }
 
 ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 1c66ea499..9f02d703b 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -189,7 +189,7 @@ FILES:${PN}-fstools = "\
 BBCLASSEXTEND = "native"
 
 android_tools_enable_devmode() {
-    touch ${IMAGE_ROOTFS}/var/usb-debugging-enabled
+    touch ${IMAGE_ROOTFS}/etc/usb-debugging-enabled
 }
 
 ROOTFS_POSTPROCESS_COMMAND_${PN}-adbd += "${@bb.utils.contains("USB_DEBUGGING_ENABLED", "1", "android_tools_enable_devmode;", "", d)}"
-- 
2.25.1


