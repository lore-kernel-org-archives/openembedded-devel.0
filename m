Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC25C369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.71408.1744107664400149753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AOjnNIXA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLuR000832
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9+nvRZIKhC0
	hcJOS7CiXGXPSQIxuRazLv0SS4Q0b15U=; b=AOjnNIXAevkikJ70gBhXFc2NMSy
	c0wr5nO8C6pfvQTLRED8yiB4v87zo1V1Pwz+22P2DsNK4mDew2jWXNG17UgS84P6
	QAlW6NpO2aQF6UnerVx5eKIHb1Y5a6MKNCCycwKTztocEicosDt2wxNT4XVcNBjf
	b78r/Kw7LosJGhVvQk7k7eirjTP4xQkapaqHYEA8AeaprKK3oiRzcOPHCePLOBnK
	M2QEn2LUozeVQj6VQZl8srsnFDTxToXW9cw+T9ziQvOBOqINzRUA0jI2I2sUaE0O
	2hxlcvB3ZlLUEQcEVsWFhhlYSUTuqTF13j7V4hjchdpSHLefYLeB19LQxwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7ebs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c09f73873fso885096885a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107662; x=1744712462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+nvRZIKhC0hcJOS7CiXGXPSQIxuRazLv0SS4Q0b15U=;
        b=tIqDaDNjKD3vR1/HD11TCTIs4hwljIUkkfHFfcz9zWglDYsKj8mmllxe+5DOv3BV/Y
         NzaWujAkrsi3IO2OILJW82zSGT6TWdlpAxsEQTy9j5ShPVFv64iPB0bnG1noprHI/Gs3
         Ww7zhe873kGaj226HDsq+gBsc3wwJ5/xHDSLgWZi30YGx2ez8a24nMrZrjLTkewU4grK
         lmo+SRq55tPdkzKOveS6qNrW4Yai8s9kdhiQYtvzSAxyDDw9CE6+EPxbBCxZXYSjx1JV
         1axfASEC6HhcGpMo4hJti/Eu2LoOhRs2ElExc8f+LGgEgwH8h/fuVfi2p9V9KaQG84Pg
         WlLA==
X-Gm-Message-State: AOJu0Yw1EdHQVroah8xmGUY48sQsc6Tndpd23utUpkUDLNRQLC56s8Bp
	kDjK+wAuFODdd4BJEzaPltW22m/NZK4bSwwlqeD653xzq2HRIUZ3td9mC3mMog9yT8RoVsYYvAn
	GS5SFGwFC8CfuaBfeInd7A7bpbJ6qVa6Ep76+RFCkBENw01YI2jDGHYUaufoCUiv/aCtwdonZ5J
	FGz0A/QWwmqXVu
X-Gm-Gg: ASbGncusqHlZ3cpEJKp1RCy7ejV5LsxuEJo0lyF+JmXDbvnIl/QuzkkILuYhu+IbytE
	uSWe6qC7pas8YvsPfZ6mitThglCj6kVBifDTKKIZbw8HokFNJrllGa0HrcJNpkWt1/CSDlowUKq
	4KVLnuhgOF3copJ/4ZfLXg54V6XCGplZ1ENOVFKdF8JChk6WwEfx0atvaheTtHON0aRyqCT07Yi
	F0+o15UJDlL5DVdRI9gVd44WDU5cu750/dq+DZsKImX3yokwmcXRVZqiO0MZJ1adwapl83wbYwd
	4huMYcrl4oO8mvhitC/GoJgn2MoHvv5XzRqs+cR76pWqegOtKIm5nATvRgSNrqL58Uw1k2rYUsr
	lxqed49KoWGSEWvOzVNhmTjAI4wgi
X-Received: by 2002:a05:620a:17a2:b0:7c5:a230:30ff with SMTP id af79cd13be357-7c774e4ab6amr2118977185a.47.1744107661892;
        Tue, 08 Apr 2025 03:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/gSz0qZ8NqG/teABkt7TP5rP5NVhRLWKbO6+SQv6dZ/cPSxIg5fatifRo11venZLS30KaLg==
X-Received: by 2002:a05:620a:17a2:b0:7c5:a230:30ff with SMTP id af79cd13be357-7c774e4ab6amr2118975285a.47.1744107661509;
        Tue, 08 Apr 2025 03:21:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc20sm1482588e87.165.2025.04.08.03.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/5] opencl-headers: backport patch from trunk
Date: Tue,  8 Apr 2025 13:20:55 +0300
Message-Id: <20250408102058.2769630-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -fgbCJnLYb6tqGhtrxRwP7YjaxdvXkzp
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f4f88f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Hfoq6aXPAAAA:8 a=oCuZPy4_cHNecypKnaYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=NrRqPRXH979sAPH7e1uv:22
X-Proofpoint-ORIG-GUID: -fgbCJnLYb6tqGhtrxRwP7YjaxdvXkzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116699

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


