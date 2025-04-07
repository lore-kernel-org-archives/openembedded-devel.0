Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ECDC369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:54:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42908.1744019641859122570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fNpU5GqO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doO9001283
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 09:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9+nvRZIKhC0
	hcJOS7CiXGXPSQIxuRazLv0SS4Q0b15U=; b=fNpU5GqOTtLprxLpkAAH2yAXAiE
	xOFe/byelmZlDfFHfRPT23abZy1Rhx3yMzet4MfyMS4ZvWTplHUgvSFdmV1+VpNi
	IKZ/O9FvlV1shGXTT2uoPmv7ZRTp+Li6Go6NEPcAbkDwgtLLmlpQ4CpLGxgdNqcU
	TDgIZ8LGAXlIMWBKHTG+uwrD9ZfPrWaC6196idKXPHML2qFDr8uov9gkpeihWu6c
	5byFND3bTNUr7wJ7niy1sVpXI+GsIHj/eZRbsAnBFLsrZqk1kQH0KIg5RXON14fX
	hnNXLEk5z7Gixbrb59DceGSxtq/tae5A9Gp10RVV7owaC3HwN7WDgMuV56w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkbs3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so1252097585a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019639; x=1744624439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+nvRZIKhC0hcJOS7CiXGXPSQIxuRazLv0SS4Q0b15U=;
        b=JNFlXCQX7IZFMJ5dqqBLtrH2cEbUmnei+BYHhpnMu/Hntg6/DO4eMMGOle/k6NUZ09
         DNs2dJvnJrgdP0exzKPzbzvhPE7keJNcsSIAAQidCUBgzYW6IHuJ0q6aw2XdOgG691kI
         v5OymsTPqHWWtKBiYq1C5zuckNrInsNIw/8bTRRBxkuVGm3MYfzmqzV2zv0CZ+8ykI5U
         mUeGBkycJVSgUbs9iNK7qkG8AumobjgIHL+d4EyROtQXr6BHErQOSFWlTSsAz1uNTPTK
         X8RvNB/SjCvrYGl0JBeuAcrPRMJPAVSKaEThc0E8/nwE7zglyN9EOQGBWTSeNjs6HVG0
         UZgg==
X-Gm-Message-State: AOJu0YyDkR1MLDpOpbtsvG1bTrnwQ9k0WlhWw06QoiJyHOUicecaNhky
	dGy03HaOkRv6MWgNAiavW8EdcT4HPdUF89yBjh2xKIlJZUKtu3GxM4oehOghUhke03nIRNhwaB2
	vETV80p2j7KZJQZipwu970c8nCo2x6QdTCkLWWIOQgOccvoLxvdqZE82z4N1yr/zmTExGdKkfvf
	9h4PwOJoSpWIRE
X-Gm-Gg: ASbGncsxSdWUUnmtHhgo90kDyymGEIJ8MpVjSwyKadM3YQMV7oj5hj8gz73GcPTfEl1
	WjSR6scKltyEMM1xOAwElb+MRUfIaz2CAjt0gQr/wX3MYWxyC3ME3qnWwt2UuU7nkVJgv8C1keg
	kY5O7uD+nAdzi0Ea2gDkyUbqFTUCNj0v5j+hVR5RDn4Wl1+6nnlHv5pzoO3Gr1Obl6jzlFlA9EZ
	0lQFu+cc1yLCu7svG5GXGpgO3f6htvLB68eZvrQ4t6tj482J/0LTUM2mhki1A/obynUEtcq7E3L
	oe5BF6m/ILFUMIWPFRxDxSKBbYTGD5up9s25vuMXV9agxyYy2LGXsAD9xq7JNdvWss5dqZUvdco
	/3FeE7gvMXzcQi3/Yyno13E0Aog+I
X-Received: by 2002:a05:620a:2b94:b0:7c5:55f9:4bc8 with SMTP id af79cd13be357-7c774d1720amr2070455685a.8.1744019639617;
        Mon, 07 Apr 2025 02:53:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbnG2/1VjnyM5VQMS6C29q38/NtNCjncCVdajXxNWraz+fHFxBV6FNbnyhXG3Hkvst6qRqw==
X-Received: by 2002:a05:620a:2b94:b0:7c5:55f9:4bc8 with SMTP id af79cd13be357-7c774d1720amr2070454185a.8.1744019639311;
        Mon, 07 Apr 2025 02:53:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc2bsm1196659e87.167.2025.04.07.02.53.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:53:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] opencl-headers: backport patch from trunk
Date: Mon,  7 Apr 2025 12:53:52 +0300
Message-Id: <20250407095355.3461559-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3_yCgJxnOyfFfmZoi0h-7MVgVmdw9Pe4
X-Proofpoint-ORIG-GUID: 3_yCgJxnOyfFfmZoi0h-7MVgVmdw9Pe4
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f3a0b8 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Hfoq6aXPAAAA:8 a=oCuZPy4_cHNecypKnaYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=NrRqPRXH979sAPH7e1uv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116658

Latest OpenCL CTS is released after the latest OpenCL Headers and uses a
symbol which is not defined in the release. Backport a patch to make
OpenCL CTS compile.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...uffer-supported-queue-properties-265.patch | 42 +++++++++++++++++++
 .../opencl/opencl-headers_2024.10.24.bb       |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch

diff --git a/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch b/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
new file mode 100644
index 000000000000..1654bf48c6c5
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
@@ -0,0 +1,42 @@
+From 85888592e178c7923cd1bc1d69cee530906c80a4 Mon Sep 17 00:00:00 2001
+From: Ewan Crawford <ewan@codeplay.com>
+Date: Tue, 14 Jan 2025 17:14:29 +0000
+Subject: [PATCH] Command-buffer supported queue properties (#265)
+
+Header update generated from OpenCL-Docs PR XML change
+https://github.com/KhronosGroup/OpenCL-Docs/pull/850
+
+Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-Headers/commit/d32c5bb219d7ba90ad4f251cf0bb903c08f8e5db]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+---
+ CL/cl_ext.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CL/cl_ext.h b/CL/cl_ext.h
+index 1a48985e167b..be5b473ff150 100644
+--- a/CL/cl_ext.h
++++ b/CL/cl_ext.h
+@@ -52,7 +52,7 @@ extern "C" {
+     "cl_khr_command_buffer"
+ 
+ 
+-#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 5)
++#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 6)
+ 
+ typedef cl_bitfield         cl_device_command_buffer_capabilities_khr;
+ typedef struct _cl_command_buffer_khr* cl_command_buffer_khr;
+@@ -66,13 +66,13 @@ typedef struct _cl_mutable_command_khr* cl_mutable_command_khr;
+ 
+ /* cl_device_info */
+ #define CL_DEVICE_COMMAND_BUFFER_CAPABILITIES_KHR           0x12A9
++#define CL_DEVICE_COMMAND_BUFFER_SUPPORTED_QUEUE_PROPERTIES_KHR 0x129A
+ #define CL_DEVICE_COMMAND_BUFFER_REQUIRED_QUEUE_PROPERTIES_KHR 0x12AA
+ 
+ /* cl_device_command_buffer_capabilities_khr - bitfield */
+ #define CL_COMMAND_BUFFER_CAPABILITY_KERNEL_PRINTF_KHR      (1 << 0)
+ #define CL_COMMAND_BUFFER_CAPABILITY_DEVICE_SIDE_ENQUEUE_KHR (1 << 1)
+ #define CL_COMMAND_BUFFER_CAPABILITY_SIMULTANEOUS_USE_KHR   (1 << 2)
+-#define CL_COMMAND_BUFFER_CAPABILITY_OUT_OF_ORDER_KHR       (1 << 3)
+ 
+ /* cl_command_buffer_properties_khr */
+ #define CL_COMMAND_BUFFER_FLAGS_KHR                         0x1293
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
index b47d3f9711a1..412b573cb4ad 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 
 S = "${WORKDIR}/git"
 SRCREV = "4ea6df132107e3b4b9407f903204b5522fdffcd6"
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
+           file://0001-Command-buffer-supported-queue-properties-265.patch \
+           "
 
 inherit cmake
 
-- 
2.39.5


