Return-Path: <quic_raghuvar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D383CF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:38:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7707.1727159906884202137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=H/bm/Wer;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_raghuvar@quicinc.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NNJRlH023720;
	Tue, 24 Sep 2024 06:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPU0MuL082lbRRKQ3Q9qcMGDCir6Dk4DqyWkj4k8Kyw=; b=H/bm/Wer2hfaB27x
	SCPN9ZQXeZKHe9nSs/JRtk1qeEV/zGTPNSbShoAO+Li8CdnOP0C/awzE5NcHpOn0
	8elLK1McRLXz0ubVS8o12dtxUBuvv+F227x0xM/xMkTMxGEnTHHhTnQ4Qcb/nTlH
	ZnLn/jDi9huzeAF68JVNlYgaPCuoTHQCxz821dWAqVWSIansNyMzkA82o4Bt3wff
	ppaanpfxyf0UV8J+HAyx6lqjZS8+6vygwfH1BS0AARPzzJ6iRAm5PMlQZSYYgJvJ
	aSpg+cjjrlNuwqaE9UVpxuqrGwHYu+4jpu+fOdFxPYUKHHvInybcc0+t9Gep/pak
	KXCvSA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgn7t6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:38:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O6cOip025669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 06:38:24 GMT
Received: from hyd-e160-a01-2-03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 23:38:22 -0700
From: Raghuvarya S <quic_raghuvar@quicinc.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Raghuvarya S
	<quic_raghuvar@quicinc.com>
Subject: [meta-oe][scarthgap][PATCH 3/3] android-tools: Create flag file /etc/usb-debugging-enabled
Date: Tue, 24 Sep 2024 12:02:32 +0530
Message-ID: <20240924063229.2309109-3-quic_raghuvar@quicinc.com>
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
X-Proofpoint-ORIG-GUID: b_lQM9NF6UoacIsL9_CRwSFSkn0tOO74
X-Proofpoint-GUID: b_lQM9NF6UoacIsL9_CRwSFSkn0tOO74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=814 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112472

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


