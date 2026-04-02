Return-Path: <gmisra@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A45CC6B35
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:41:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11257.1775119308956848115
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 01:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=h9LpvjuL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: gmisra@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63275cNX1964793
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 08:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M0NAiVQVDwjdAOQIA2ELvXT7gCItrKWN0TN
	nuy+IQvw=; b=h9LpvjuLg+v7dy5GNalZWHXf+rkXXFvpyCYDiQPN1okWp9TUG6B
	JnDt8iazMwCw3VuaspHOIbJiqmU0XNQyAfMYOWQcF2qa6s6yC40UzpF195GO0wEY
	WjRoetCCrM9nay19I19gLB6ryPX0QJtMrelFTltPv1dOMuBMX1TB/W6tLe9hlvDn
	n5JF3ZlAMDzhi3b3c4mN1X6hOio1R2KSWfsFpLX+klBvsxLCv2YPJeJ0RY5s4g+g
	GXSmqiqqhlV8bovv8LZ9yrjFyjuyvLWqUcY1Wi3YMTomTDdDjAV3NRStOyw46Y5H
	F7gk6DsJ8xJlhlNROuv6wZGIb26UewYFA0Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h26x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 08:41:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6328fiAF017839;
	Thu, 2 Apr 2026 08:41:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d6qj2w4em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 08:41:44 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6328fixX017834
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 08:41:44 GMT
Received: from hu-devc-hyd-u24-a.qualcomm.com (hu-gmisra-hyd.qualcomm.com [10.213.99.33])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6328fh8r017833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 08:41:44 +0000 (GMT)
Received: by hu-devc-hyd-u24-a.qualcomm.com (Postfix, from userid 4467585)
	id 2A82120F8D; Thu,  2 Apr 2026 14:11:43 +0530 (+0530)
From: Gargi Misra <gmisra@qti.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gargi Misra <gmisra@qti.qualcomm.com>
Subject: [meta-oe][PATCH] refpolicy-targeted: Updated policy to allow adb push and adb pull through adb shell     - adb push is allowed to /tmp only     - adb pull is allowed on all files
Date: Thu,  2 Apr 2026 14:11:23 +0530
Message-ID: <20260402084123.405103-1-gmisra@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce2bcc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=954HIxe3JWwfOQJH:21 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4rTUgi8V-t1-XIL5bpMA:9
X-Proofpoint-ORIG-GUID: gFn4xNB3V9g1zae-w1FChfr-KrwDqO_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3NyBTYWx0ZWRfX958kZsAPwOD4
 GrUMpSGCJkK4eAFU0KUUSiokGsNz4XrGPEXVJnPLZe3GH+t6LGTrqHht4W4gcfkpZV9Crjd3pHT
 vp6olRbwzIEeZoFPCaAzWMCLccuSjlNxeRiZ4kB06JyzNTTHTaMvKWmIbvfp8BeSzIYN8eM8va7
 L9qff3JmrEXyaUIYuHvfErTxJT1FlCpDvMPm2CphlD1BVEilpieX2/nnl0Obqp1Jt++ZQRFejg8
 K2QrXgHgo8Dvh2DfglBEw8+wl8cgkDzRZ/d+LeThBlh3bPePK6hyPphXX8RTBRnBTJ/DBtV0cvd
 ARlA4AP8DG2C7acLUHxfpVT0NYKjFgA/foEx3jNjaoUtGKHoHzhTiZbSe6BYjk7djtwPkPlMsN9
 klIqRqbOIwtFR7xCJ7o+Lmff77glkdsHNfijAkKzBmUNGzjpsYwCq0sUX1TNYaRER8aSIIJrcyY
 Zwau2tUMSs04uPpVAmA==
X-Proofpoint-GUID: gFn4xNB3V9g1zae-w1FChfr-KrwDqO_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 08:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125963

Signed-off-by: Gargi Misra <gmisra@qti.qualcomm.com>
---
 .../0001-Added-sepolicy-for-adb-service.patch | 36 +++++++++++++------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch b/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
index 62f81e4ffb..29d45641d6 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-security/refpolicy/refpolicy-targeted/0001-Added-sepolicy-for-adb-service.patch
@@ -1,6 +1,6 @@
-From c110d893be565ade574ee2933c6e89197f833006 Mon Sep 17 00:00:00 2001
+From d1c726eb1da3718d05a694222fa0a6a0e944f381 Mon Sep 17 00:00:00 2001
 From: Gargi Misra <gmisra@qti.qualcomm.com>
-Date: Thu, 5 Mar 2026 12:39:42 +0530
+Date: Tue, 31 Mar 2026 23:39:22 +0530
 Subject: [PATCH] refpolicy-targeted: Added sepolicy for adb service
 
     - Labeled adb binary
@@ -12,15 +12,15 @@ Signed-off-by: Gargi Misra <gmisra@qti.qualcomm.com>
 ---
  policy/modules/services/adbd.fc |  5 +++++
  policy/modules/services/adbd.if |  5 +++++
- policy/modules/services/adbd.te | 25 +++++++++++++++++++++++++
- 3 files changed, 35 insertions(+)
+ policy/modules/services/adbd.te | 39 +++++++++++++++++++++++++++++++++
+ 3 files changed, 49 insertions(+)
  create mode 100644 policy/modules/services/adbd.fc
  create mode 100644 policy/modules/services/adbd.if
  create mode 100644 policy/modules/services/adbd.te
 
 diff --git a/policy/modules/services/adbd.fc b/policy/modules/services/adbd.fc
 new file mode 100644
-index 000000000..6f5bb9269
+index 000000000..57d4c1d45
 --- /dev/null
 +++ b/policy/modules/services/adbd.fc
 @@ -0,0 +1,5 @@
@@ -31,7 +31,7 @@ index 000000000..6f5bb9269
 +
 diff --git a/policy/modules/services/adbd.if b/policy/modules/services/adbd.if
 new file mode 100644
-index 000000000..612fc0106
+index 000000000..d71ab1374
 --- /dev/null
 +++ b/policy/modules/services/adbd.if
 @@ -0,0 +1,5 @@
@@ -42,10 +42,10 @@ index 000000000..612fc0106
 +
 diff --git a/policy/modules/services/adbd.te b/policy/modules/services/adbd.te
 new file mode 100644
-index 000000000..f7e8ac7d0
+index 000000000..a58c61c9e
 --- /dev/null
 +++ b/policy/modules/services/adbd.te
-@@ -0,0 +1,25 @@
+@@ -0,0 +1,39 @@
 +policy_module(adbd)
 +
 +########################################
@@ -64,13 +64,27 @@ index 000000000..f7e8ac7d0
 +# Minimal Rules Required for adbd service
 +allow adbd_t self:capability sys_resource;
 +
-+domain_interactive_fd(adbd_t)
 +dev_rw_usbfs(adbd_t)
-+files_read_etc_files(adbd_t)
-+files_rw_etc_runtime_files(adbd_t)
++
++# Required for semodule on adb shell
++domain_interactive_fd(adbd_t)
++
++# Required for adb pull
++files_read_all_symlinks(adbd_t)
++files_read_all_files(adbd_t)
++
++# Required for adb push on /tmp
++files_list_tmp(adbd_t)
++files_manage_generic_tmp_files(adbd_t)
++
 +term_use_ptmx(adbd_t)
 +term_use_generic_ptys(adbd_t)
 +
++
++
++
++
++
 -- 
 2.43.0
 
-- 
2.43.0


