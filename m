Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6D2CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:45:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3938.1758159903544970609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dbAWD5uC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HKChXm027124
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2JF5Ns2GNSJ
	ZApzFpnimgeYDPg63gxA5vC0AJJFkgBQ=; b=dbAWD5uCIqXP/ElS1w4DSNHRjDF
	uLcL6fE7nxqnzMD9NuJCmqlkUYiDo5Q27tANi+QB1AFVoZtkcfbnVhJJcr+G1jGo
	GMrh2MH835Be3zonS1RS+/xJlT4ZOcHhZiMoJ3p86KTAwFI9iFeWkqostb+bUw3d
	6M0NRUw3dM1Vt2EHUYZOpiZGjrJbnH87mkwIBJA2XQavbZ4aI9xN69rDIUHF1c0U
	DL8fWOm0RPVVzt0/EGOqtmj2Kk17Bnmu2RbDb025vOo6mZtUZjIjtNyVRmlcSmRJ
	Ge3t0Hy8qe1tm2uK3uMv0OoenGbIn3PJkJozZ4adbP88NITrqmAuqPAUu1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jae4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5fb1f057fso5208371cf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159901; x=1758764701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JF5Ns2GNSJZApzFpnimgeYDPg63gxA5vC0AJJFkgBQ=;
        b=qPqmIrvGj21W8fQ9CV7svXXi+TRcuEFRCkFdjWtkqu+zezeznqRZ6Ck8eRTUQ7dETs
         ItlI1BmfjyiDAwnCPbJc88l6gzBfnbqznEYWzt+3bV4YVYISCImt8RAXJGG6CUocxTnS
         gmGeRe/MqV7Z3HITV6LqfZBWry4Wmu37Q5+rwPmsLcgrRBUwHnGVMAlrq6LxsdjWAAYY
         ixurtQSyoPs36V/IuRZw7lyGrdC9hP4XYKPCrbyo1thpxgPSLbI15DI/cEiT5khSyjKr
         XMnsyaoh64xPICQrJTjCbCuA3uL5D7j+wYPRGyyUUYxozLvIXCVXTRBnZiYgjkMDfdER
         2Lmg==
X-Gm-Message-State: AOJu0Yy28NEOw4kEOgQ0m50AbuZUeFMO8tPsnE4o6H8CX+ZIc6IzkcE6
	cWSDAowejdIJUcyChBih0K/nvr9ZYQfn9mTn5ZOqCXaZSbzAaccKNM2++13zHQSaN5A6FM2W5QO
	UyGZilba4wETU/b330IsKcq7+ByoUr+ZBsGfKhoGrMkwgvJgy6P1SCGRO0ArmtW66RtqBp+hj0e
	BpSUuy/CQt7h9O72C6
X-Gm-Gg: ASbGnctJ1ylhums1sUBpNJOJVzL7Thhcl3yRI1nPb08Ut+re0nhK/RK7ZHdA3tTaQx3
	HxwcaRXaRsXC9VcknkekJZRKko8Qz9drY2IEbnzAQ9+/7GPuP8qiG/AN05ag+Wj/ievySoX8eMd
	lxRqnVtQr8qyQsSaXD/ucFIaGu9RFVVfkwYqxTKS1TsCBktXHv1q7++gu18XGNcXTX+2YLH3lPl
	1n0P1DTJPqIv5e0PnnOsExdh3/PxSb3lwIggk9xMeRVdmgx3mvXDR+Z4fVCFGuOjFb42vFIaIh7
	v+3juTQyCQ1JclC6Zyo2PiobGM+1KYd3g9QL4Kx6NtdgLdVgYMvNnusyLoRrrKPKa17vtL2QXFH
	l7WZODWEY+fzF85t00qUc3MzYhxLIIJbGaYmFhCfbAcEUQz2M5kjB
X-Received: by 2002:a05:622a:11d1:b0:4b0:7c42:8dfe with SMTP id d75a77b69052e-4ba655f9ae3mr51069861cf.7.1758159901351;
        Wed, 17 Sep 2025 18:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXZ0sc6GkfnBkJYWiKZyGQJlbvE3zspa7NmmBvBYw/AjWUzU2RID5pKxbJ95+fYdJRxYhwSw==
X-Received: by 2002:a05:622a:11d1:b0:4b0:7c42:8dfe with SMTP id d75a77b69052e-4ba655f9ae3mr51069681cf.7.1758159900756;
        Wed, 17 Sep 2025 18:45:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 6/6] opencl: make use of the 'opencl' DISTRO_FEATURE
Date: Thu, 18 Sep 2025 04:44:42 +0300
Message-ID: <20250918014442.1436475-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kdCDK75vkFxEGcq9qWXLgaXYz0bb3Ghf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfXwookjwr8J80g
 L8aoE/48N+jIhEi4+IzHpRZiCoXcjUTwKFOw7Ia+rIz62Me1bb9ITr7gDNZs+/n3KGG1OQjLgyx
 VrDg5BX/c8yY+5QGk3AJ96Y3Aef+n2wn6Cs6BipanqIgsjlddvwlR5CXEnaAR7VSJFupQNcihSl
 WgOu48dmflH7BSdTa2DbZ41Qmnlh4Ku1Z1Ds0clmBEW2OzAWAjjYk3USuZNIgZjz5XAPC+MV18i
 YGyj3FnLnxH0JMaLbB349Iv/3KrdMUqhIKyBN9S9uK0xKWj+kJn6VXYcBbjNVUxyNMfaVfKvUpb
 Yoa52hbYmvSodbZ5JPrOeiNISbuFW1fAt3wO3kHQRh9YQs5XSwNVbZtS3Z+gs8KlrC2bh8onwTC
 fBfBkfOq
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cb641e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=ge8WMONk8vOHPicLZh0A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: kdCDK75vkFxEGcq9qWXLgaXYz0bb3Ghf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119496

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


