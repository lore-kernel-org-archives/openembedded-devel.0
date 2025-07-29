Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1058CC83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 15:34:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.10799.1753803269529359459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jul 2025 08:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Bd1IR64q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9gkrZ031181
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 15:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KT+GtEjYu+qXM0IeezpL4m/5JPXGPaAO/2N
	ijgEzlA4=; b=Bd1IR64qAZMDxa6b0WYYUWcheSOFY1pEhcf/y2ldcX5Mb5GS9EH
	22PotRRe4vndc9vwwGASOL8EegA0jC2dixpA5Q7zZE9eKJYcnZOuN1kO57Ry1bmB
	EjuJyy8wO7KZIaUqe0jr7uHRAEWvw/tYB6S/LNjVeHkDQ24yp0gQXatHuhWOtOyU
	dQ4KrIdJIBzafehtPvRWAuAWUsNJ7JgF8jWUEV43qF5ziwlXdipVGcigHcueVm9J
	DeNKCNonY5hwm8N/stKYn3iNyebrI18eotee1/ioCRXQAq0rutpsEy3j6xd8GYkh
	PsB/NKZezfk/x1GgxjuoGFvz/+KR16hegKg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm0hyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 15:34:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70708748fbaso95338286d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 08:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753803267; x=1754408067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KT+GtEjYu+qXM0IeezpL4m/5JPXGPaAO/2NijgEzlA4=;
        b=Eqn81OlLQ6c/dW9FaS64mcsJB0fRXGXOe/k5EjUZeKQlp8C9RLbLqFDpoDawAlYAUw
         hhnTg8EoXY4KY6sd1QGcY/7EiWppELqA5tg1CeqtmyG9nj4Y4mRI6kWcTHWp2puuC9ga
         ennfJCrIx/yPDYfL6laXWinZeSi+Gbq5QIku8OvgHSCsAm41qbrdSR3AqaAP6tzMAel9
         3HAckn02l/b7MBI82bg+lSkOmQD9AgqTkKSaSGhAJ1Ld+F0OkVzMlTHZiRv4foY85Y4Z
         bdnp+u8BuwKhFCPmy46RA0/yoa7nzJbP7x/Fna614yXwM4mE22k1XAnq2ZIFlMEiSvn6
         g8pg==
X-Gm-Message-State: AOJu0YxPXy5RZIgTZkTheyJehC1QvztDPT+An1rv06dAFFXgkzcVuile
	CX6eGMTXb1ftXRfdzQIAbn9+Pl3iRQbyH2yM2YJ15bVzn+9LQFS4cwrSYRWFTd9c7oHaRejaB5s
	b0zUpOrpsXx/lpWMYt8REiX01pRXs4zauaTTNHAX3NkBaTKqeDixChPkOs85bSQo+SoShrSFUmb
	Nf21V8CowdeVkXmGr1
X-Gm-Gg: ASbGncvTaemOeK+l5MPjsqGVJxhq8yeXHvsaLGd9TctW9JkuEzH+QIgbltWFeU/yo6j
	X6MbIgikie3OA7MbwvIq7+bKEtlXAn6hmJjjMZd7fvFlwLrrKjWZ4dhRjfcFCdyfnmNYCs72C88
	t77dIqLzlMa3XNnXF/Y/axWp3i31TDl4KSKPZxJt67AKXL9bED/EssP6W4aoyFAN+vNCJJiWiDR
	Ee1nDk2veyaqbnw7ZoFkbgGGdF7t75ZWkyFMwc5MpVHMeTo7bzwPt5UHXrnFZouXTOcXN9HH6P7
	PQBNEwCLEN5gzMYPZ0QL19d3rQa4pP+YsP6WPcvpHOTYllMYMTVjUOmje6URVQyntkYpe+i3CcY
	uE57LxTYLVHK+Uh96wpCGm/t9xrwKONKfDl3zX+4qN98ChXyeY/hX
X-Received: by 2002:a05:6214:2589:b0:707:4c65:e71c with SMTP id 6a1803df08f44-7074c65e990mr83539976d6.30.1753803266810;
        Tue, 29 Jul 2025 08:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB9QES2gZrCDcTh5ovtoS0A+JZ8W98DC1t2xCX8vt6eMGhbIrDVybNQFAp2Rreosb5N7hJRw==
X-Received: by 2002:a05:6214:2589:b0:707:4c65:e71c with SMTP id 6a1803df08f44-7074c65e990mr83539136d6.30.1753803265895;
        Tue, 29 Jul 2025 08:34:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633758cbsm1752150e87.137.2025.07.29.08.34.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:34:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencl-{headers,clhpp}: update to release 2025.07.22
Date: Tue, 29 Jul 2025 18:34:24 +0300
Message-Id: <20250729153424.492871-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6888ea04 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Hfoq6aXPAAAA:8
 a=pGLkceISAAAA:8 a=2Kd9PhjsAHlIyVt6UnMA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=NrRqPRXH979sAPH7e1uv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNyBTYWx0ZWRfX/Zx5IFPemY38
 rVHItTMAPYjwmeVslJgdKbrrzlVzN6Zcetf1e8ox9rTbFiA1JGP6kDmSa62rOwAM1Antnqyx6tC
 vu37HtsbB8wXjQtXt1Pjezs8wXKgKX95R4iIFqud9GJS2svPsfbGTLn9B4lDSYI0W0S7VjGOm8v
 W1fcwcM+xiSkvJa3TI0QXymVseVtfsJNpPiqp9bStPa6/5QecqtG2wmCeGmurBc0sfwZQ4gvOJd
 /QuYy3Qp66ppsQ/iU2TGyqYT/MD58QdCYPeUTTjVAD2qAYofU1FzEpmBV31BZBEqrJQdDVQRMtL
 9urX9rSezunjFBh0c+v9zhVgheRj2rEqSVQeYKrSENyEhAhfa8rgHxBta4bMB1j11EmQ5oRtZgO
 6EFTL6D6BWt8s34j9PaahBcc71obHueOc/E256CEc2cAgO6+T/YY1FegkiAa0yFyQPQpH9GF
X-Proofpoint-ORIG-GUID: hk65wRZ8r4UJl0mxO7gx05YByMqChKhW
X-Proofpoint-GUID: hk65wRZ8r4UJl0mxO7gx05YByMqChKhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 15:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118759

Synchronize with OpenCL v3.0.19 specification release.

Also patch OpenCL CTS in order to prevent its breakage with the updated
headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...1-Always-enable-beta-extensions-2330.patch | 32 ++++++++++++++
 ...uffer-supported-queue-properties-265.patch | 42 -------------------
 .../files/0001-Ignore-Compiler-Warnings.patch |  2 +-
 ...24.10.24.bb => opencl-clhpp_2025.07.22.bb} |  2 +-
 .../opencl/opencl-cts_2025.01.22.bb           |  1 +
 ....10.24.bb => opencl-headers_2025.07.22.bb} |  3 +-
 6 files changed, 36 insertions(+), 46 deletions(-)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
 delete mode 100644 meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.10.24.bb => opencl-clhpp_2025.07.22.bb} (91%)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2024.10.24.bb => opencl-headers_2025.07.22.bb} (76%)

diff --git a/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch b/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
new file mode 100644
index 000000000000..430f9575c4b3
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
@@ -0,0 +1,32 @@
+From 3a275fe81b6d436194f563e7a3d24f302d14a211 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9vin=20Petit?= <kpet@free.fr>
+Date: Tue, 11 Mar 2025 18:40:29 +0000
+Subject: [PATCH] Always enable beta extensions (#2330)
+
+`CL_ENABLE_BETA_EXTENSIONS` was just introduced in
+https://github.com/KhronosGroup/OpenCL-Headers/pull/276
+to guard provisional and other experimental extensions. The CTS
+currently assumes
+all definitions are always present.
+
+Signed-off-by: Kevin Petit <kevin.petit@arm.com>
+Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-CTS/commit/3a275fe81b6d436194f563e7a3d24f302d14a211]
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 898f62e97bdc..8a93ea9fb843 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,6 +18,7 @@ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_2_APIS=1)
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_1_APIS=1)
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
+ add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
++add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
+ 
+ option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
+ if(USE_CL_EXPERIMENTAL)
+-- 
+2.47.2
+
diff --git a/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch b/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
deleted file mode 100644
index 1654bf48c6c5..000000000000
--- a/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 85888592e178c7923cd1bc1d69cee530906c80a4 Mon Sep 17 00:00:00 2001
-From: Ewan Crawford <ewan@codeplay.com>
-Date: Tue, 14 Jan 2025 17:14:29 +0000
-Subject: [PATCH] Command-buffer supported queue properties (#265)
-
-Header update generated from OpenCL-Docs PR XML change
-https://github.com/KhronosGroup/OpenCL-Docs/pull/850
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-Headers/commit/d32c5bb219d7ba90ad4f251cf0bb903c08f8e5db]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
----
- CL/cl_ext.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CL/cl_ext.h b/CL/cl_ext.h
-index 1a48985e167b..be5b473ff150 100644
---- a/CL/cl_ext.h
-+++ b/CL/cl_ext.h
-@@ -52,7 +52,7 @@ extern "C" {
-     "cl_khr_command_buffer"
- 
- 
--#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 5)
-+#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 6)
- 
- typedef cl_bitfield         cl_device_command_buffer_capabilities_khr;
- typedef struct _cl_command_buffer_khr* cl_command_buffer_khr;
-@@ -66,13 +66,13 @@ typedef struct _cl_mutable_command_khr* cl_mutable_command_khr;
- 
- /* cl_device_info */
- #define CL_DEVICE_COMMAND_BUFFER_CAPABILITIES_KHR           0x12A9
-+#define CL_DEVICE_COMMAND_BUFFER_SUPPORTED_QUEUE_PROPERTIES_KHR 0x129A
- #define CL_DEVICE_COMMAND_BUFFER_REQUIRED_QUEUE_PROPERTIES_KHR 0x12AA
- 
- /* cl_device_command_buffer_capabilities_khr - bitfield */
- #define CL_COMMAND_BUFFER_CAPABILITY_KERNEL_PRINTF_KHR      (1 << 0)
- #define CL_COMMAND_BUFFER_CAPABILITY_DEVICE_SIDE_ENQUEUE_KHR (1 << 1)
- #define CL_COMMAND_BUFFER_CAPABILITY_SIMULTANEOUS_USE_KHR   (1 << 2)
--#define CL_COMMAND_BUFFER_CAPABILITY_OUT_OF_ORDER_KHR       (1 << 3)
- 
- /* cl_command_buffer_properties_khr */
- #define CL_COMMAND_BUFFER_FLAGS_KHR                         0x1293
diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
index 2e8b52d7945c..2495f195c18b 100644
--- a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -17,8 +17,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -19,6 +19,16 @@ add_definitions(-DCL_USE_DEPRECATED_OPEN
- add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
  add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
+ add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
  
 +option(ENABLE_WERROR "Enable warnings as errors" ON)
 +
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
index 7335712d6f65..e1302f4963f6 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
+SRCREV = "2a608428f725cad7903ef55e1ce5b995895838f5"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index c766a666401c..52c8c59f27e6 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -10,6 +10,7 @@ RDEPENDS:${PN} += "python3-core python3-io"
 
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+           file://0001-Always-enable-beta-extensions-2330.patch \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
 SRCREV = "5b3518096ca7b82854daadb2b2fae704fe2d9cb5"
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
similarity index 76%
rename from meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
index 0ec2fe5f3375..3b5f948e7d6c 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
@@ -4,9 +4,8 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
-SRCREV = "4ea6df132107e3b4b9407f903204b5522fdffcd6"
+SRCREV = "8a97ebc88daa3495d6f57ec10bb515224400186f"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
-           file://0001-Command-buffer-supported-queue-properties-265.patch \
            "
 
 inherit cmake
-- 
2.39.5


