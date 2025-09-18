Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2F7CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.5094.1758164702945114022
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YkOWmuhf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGZNQR026799
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2JF5Ns2GNSJ
	ZApzFpnimgeYDPg63gxA5vC0AJJFkgBQ=; b=YkOWmuhflxKQTJBvFrbjPJUGXga
	bRNCnD4uWEM0pAaL+54e1o9fgac0+BQZR3Mw5XXutxm9OlykEcX5QqxblcVO407J
	ysEYVsMK9EPsWcxsKGGJNTlvJW02cW7+GuHsrlIK7DYdZTbYZmUOGkEaDGk1cfW/
	aCkQDBW3P5izO9lrn7WHzDTbLrSFg4tML0vlrWy2NVl7wG2Qmj3A7V78+V8RuKmZ
	45Vy1xeYBrROc4URVSde6j4kyaqkwCbk+Wo8nnH4HKEJ83muHxHzrYmW/MHR2SYk
	6naBdLeP0P5u2aN0ZiJSFjZBjzmsqNtsjWn/heWpWlgvYXkNJsGv7W0I3hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt4qn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e0ddd918aso8179936d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164701; x=1758769501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JF5Ns2GNSJZApzFpnimgeYDPg63gxA5vC0AJJFkgBQ=;
        b=PUUyWiryTfTqkn/TMykG+guaWeQAexJ4EkinOZzjTEtnwnf8ikz0JACz3Q9Mqdohrk
         1dGogerf3jmwmPr9j17IayGW/QnJ+C8VBHeu8qHejrccfN5jsFKjrqT/nxahb3n0ciXv
         l0kWdH/8zyxMa45K/4v6/I0jaaISQ9X5ofvWLit4uEoCBV32njHOqO+r6B2e9qMC2Y4m
         frg2ulueP9lN+ZlbwwU9CzNQ0uzsZtToDiLeQVzGLqufVP4GKNApAJqcSu7Y+ma+Ms+G
         JxK7K4NYqT0yfuC2d1AHXVQzgMuhvBmLtbLbdlFBBs8J0yIoXiUqcBgUGbjtyQVKjtMf
         Ujvg==
X-Gm-Message-State: AOJu0YzYdjo3ckd6vDj9KpnSRIwJlvQvKIzIeM3r/Nz2gFO9Zjp7PpGl
	hBLOJ4mlcxuXOjVoX6h3KLVGv1L3bnUUwd8aAKbtefM1voaXhw+rZlEN6mYf9OudybP+1gbjbI7
	UdBkIhP9t/iw3ACevM6GQIuD3GlbWUfR4iKRMBgWiMDgqqTCdbKFWWxps0kOvcIgajSUrd//7J8
	QZpxt7iF8NCwThZ/1B
X-Gm-Gg: ASbGnctNKoo3b0h6SMX4hCEcT7iL4s7kSxZsdDEovvgHvMKYTDUtfj3A09ExeFHQ2Ae
	26UNpbsH42X3aPAvVXejmAwlyztTwU9nRHjQk9VEbW914xpTQjmD96UDaWFFapRqoKcyzZ2f6mW
	M4L2iSg8rl/NNO/IxXYtJzAsyhJ5ct2ZekAyyu1YDrdyF5hF/RYfH5OdhsjKYIeS91aHMMdeqHN
	8rShxD9cKmjhfv5bkZiaR7kF63Xq2jlL9jU4bxImuFkM6ZEhbWdx06fRgiFiUZ0yu/VFAIvz71y
	2F4AUsIhRra8p8m6fTtrdG5IAQoAIGhx+7WdHPE8kn+JVqNjKGsut3BEqhHlxfxcmMXCQ2SPkjE
	W2taQjv7jvRnLf3aSaK0ivmsqeJrk66ZaY3ZKI0M9Fj1Fzcb4SB/x
X-Received: by 2002:a05:6214:d47:b0:782:18f3:366f with SMTP id 6a1803df08f44-78eceb3138amr51263536d6.38.1758164700770;
        Wed, 17 Sep 2025 20:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbKQStn5jOIBGsrE3pNJ1aWMvORtvZJI/FIAPTgCfaISlNHGMuuOQrWmzLSA3uZqi7cM9ewQ==
X-Received: by 2002:a05:6214:d47:b0:782:18f3:366f with SMTP id 6a1803df08f44-78eceb3138amr51263356d6.38.1758164700083;
        Wed, 17 Sep 2025 20:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 6/6] opencl: make use of the 'opencl' DISTRO_FEATURE
Date: Thu, 18 Sep 2025 06:04:50 +0300
Message-ID: <20250918030450.1507801-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FATxOGAyroonz0pULtBKJ0inpZDLM6sQ
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cb76de cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=ge8WMONk8vOHPicLZh0A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7LzCmL+bWm8F
 61ekMF/2rsKlfZ7COU5E1127ca8ORdsitUWV/1fISr5w5dRVDk0yV0VwsXhMUe6lt8JIy2LPjbe
 4soF0Jm3lJayFTOc0eEoBUHUzlUigi8DQDXFch/lQ1aHUed6GePv05txMXRroE3ddalmvWN3Vbg
 w6fbLIGq1oY6O2lDYzbJ1rr3Nk+Brxgk6h2GICGsjKX/96xZJV3o2HR8sqB6vQC5Wiq2OHryF0m
 R4PZBZIwQRVHu89HkP9le1CqS0GdfiSpfwxPuhPKxkcyV7XbTUZMPb6vk5QZZnWbN72tkg+kvwo
 enHFtR4eVA0zaGhB6SJMwooeivh81UBuV2w2qC9/TDL+iPPu9QAxSBuYI1u1Hct8qONj+aMQ7vA
 mPiicwLX
X-Proofpoint-ORIG-GUID: FATxOGAyroonz0pULtBKJ0inpZDLM6sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119512

Currently packages like Mesa list 'opengl' and 'vulkan' as required
DISTRO_FEATURES, disabling GPU support for non-graphics-enabled cases.
However in the modern world it's a perfectly fine usecase to have a
headless box with GPU being used by OpenCL only. The OE-Core has added
the 'opencl' DISTRO_FEATURE, making it possible to specify whether
OpenCL is enabled or not and also making it possible to enable GPU
packages if only OpenCL is required.

Follow the example of GLVND and vulkan-loader and disable OpenCL ICD
packages if corresponding feature is not enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Note, this depends on https://lore.kernel.org/openembedded-core/20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/clpeak_1.1.5.bb                 | 3 ++-
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 3 ++-
 meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb        | 4 +++-
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 4 +++-
 meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 4 ++++
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
index 4744f788b926..2cbcdd873e31 100644
--- a/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRCREV = "b2e647ffb8f42aa22ce4b0194d6ef6d16d5002b0"
 
+inherit cmake features_check
 
-inherit cmake
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 DEPENDS += "opencl-clhpp virtual/libopencl1"
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index f31c51c67e73..44fead551ecf 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -9,8 +9,9 @@ SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https;branch=master"
 
 SRCREV = "fdde6677b21329432db8b481e2637cd10f7d3cb2"
 
+inherit autotools features_check
 
-inherit autotools
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 DEPENDS = "ruby-native"
 PROVIDES = "virtual/libopencl1"
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index b0f6575e717c..62b59ace138f 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -3,7 +3,9 @@ DESCRIPTION = "OpenCL CTS test suite"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 DEPENDS += "opencl-headers virtual/libopencl1"
 RDEPENDS:${PN} += "python3-core python3-io"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 3fb08efaf4d8..59d29e821a5f 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -4,7 +4,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SECTION = "base"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 DEPENDS += "opencl-headers"
 
diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 4d9ed1b8ca38..4d5e20514253 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -7,6 +7,10 @@ HOMEPAGE = "https://github.com/Oblomov/clinfo"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd8857f774dfb0eefe1e80c8f9240a7e"
 
+inherit features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
+
 SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
 SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
-- 
2.47.3


