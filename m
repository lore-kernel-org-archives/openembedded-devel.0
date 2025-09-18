Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE0CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:44:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.3790.1758159890708679080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SExwikbJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HFs116019773
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s0tS2TMf1qH
	FKVkwosf0TJ3tRsZwyEfp2+THfjWpCJ0=; b=SExwikbJkp0LjothqjML7kIIA+S
	narfaniMuvWaUqZvrGvvDYLEMm6gLmKDoBhZTGQi3v79aQ8gWKbTXzBItgVSFCOQ
	syk9NlaOuF+wGKUFegQgwLD1ZuCfZ+dbhtCD5phq3peqfpLLRXlmKP+nTrk2qnSR
	FMB1iRFemDkKDqHlZLmrHPe6+Qpb6jwyePqAeB9ynopnPS3mZ/XprIm/f9I/S4uB
	Y2EWeZdTYxWQKpZwWmXP2du7SqFXI84rYXoJKSFOy8Pk2iiQm2NhfrgKzovL7HXB
	hNbmbhHV5Aa4OSj3igmBYbwwhRFgUcVj2ZhWooq658tkYdC/IswBeT7x9cA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vk3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b78fb75a97so5149881cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159889; x=1758764689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0tS2TMf1qHFKVkwosf0TJ3tRsZwyEfp2+THfjWpCJ0=;
        b=lotFMiEsKCiAiaJMEwQbSImIxkfL7czJQl89LiFkXdm1G/6muXiuYcn6y7LM4bs7KA
         vRMxZST3qD9Vo/B46mG7kJFXJQJBBemLeQLbhBpk2s+JUG+0a1mlGCN6uginTeRpJLle
         HSWgqZugfk6bn1erCvalQ70XtFnuz++2dMWUcW0KcOKamLLa4JYldxy25NgMIy1tsdcE
         FMUnEu+HJDz6eGOXQoRa7OYzjsHE5pa/2UxGV3Se+0ChsYJjQVGhYmzLaE6+CpUT5yW/
         tSg/+wwXoIhv+viQ45uGRIU1ZDnDqW+nzrJfzuawsj7v3l3T3nh9GmW1nPwnk1qwzLAu
         eriQ==
X-Gm-Message-State: AOJu0YxHtBJWu/zeGb7GKcDewtShIL3Mj0OIYykDTLn84az5K4xBzKm2
	/9qbpchlUpjY7Oso4tDizgcIsh0T2tV9w+udGQF2Aa9jkjObCzHfDmmJnxdYMcPVMAhbQ4Ppk7q
	/VDyM7enqZS4Qqo115d+yfZdCKnKdMmSkFV2bzA4TJxG242RmOr2eoQvin2nkOd7qIbmMM1jfwi
	/kIRPUkOoMl0yXPKDW
X-Gm-Gg: ASbGncvcrrzI2nPIboB8+tIhUF/LBwlVvPC1cyXpconWLMGSfjNINg5yWLjWFBsVOvg
	pLkMX8IvqcJW3kXnj0OcTtkkiA1RtV9EOPunBJq3F5RS999xr3pd87mn6ucGkgJKDIvFHGr1lzX
	npML5rx0CrO1IoOGrYYqX6hv60Fevmew4zUlS1gCeRXryK6RcC6RJwlbUTIIf6x+/gwtt/G0U/a
	ChrAqVvDFH//jdqW/ATm9INO/Tem18DgQzCxH9cH6dmiY3NHmYUuzuGeYyWKivUHOS+Og+u8Bsr
	exSqUZ12sIGSd4zixyE51HEXhs+9EodgEXVWOxLlhJ+a9eMwGiEQJJeGjvxS7StvCfuRxyb5KWG
	lz2GAkVQo5uKEt+xwmoColJyD0HY27y1TJj3/wqgFnRKUeqJrYm/g
X-Received: by 2002:ac8:59c1:0:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4ba6674d2ccmr46227321cf.24.1758159888455;
        Wed, 17 Sep 2025 18:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQnXOJ2gmicw6w2/0BhZQprkCAmxCkUlYP4CWSlT9QhBtVw7p5BeBek6J6nfURccWOJKeL9w==
X-Received: by 2002:ac8:59c1:0:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4ba6674d2ccmr46227171cf.24.1758159887807;
        Wed, 17 Sep 2025 18:44:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/6] opencl: rename virtual/opencl-icd to virtual/libopencl1
Date: Thu, 18 Sep 2025 04:44:38 +0300
Message-ID: <20250918014442.1436475-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _FVGcWlwfP9eoCE_4CtzQMn2Or7pmI6u
X-Proofpoint-ORIG-GUID: _FVGcWlwfP9eoCE_4CtzQMn2Or7pmI6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8i2anKD/nrdx
 PJYI1m25uKbgiqEwdRRHA7jFifPvz375PhViQoEPJFDptsPys8jcrFmXF0dymjcMPp2zA2xv+Oe
 coSzj7RbrDHUlTn6O80brxjXIrx7pI/jBNUkDWqKq6+A0PKnDTxSvhPa8FhNAJamjqopw+VIzA8
 Z6exBT2ItSTYgdbwMLe0uVJEblxCr9RQV5+F498QJTRsiEEIXLbYFCpinWZU2XylJGN010z4APX
 jPTP95dZU1Os2hWxDeIMIrH3fPRmt2eZnk/PktqXBAatSFYvOjUiS+8vbfMOBCgDIYsPOWokdSs
 DrDFDBic+QXoHXDEAjWK6KOD6dJFpWGLrYkvVZquDG/l8DhOJXhcylpl3HMsUWZLgqADwVlhiZ6
 WAQ5RWBE
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb6411 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Drs5-ZKYQUkviSzO8xUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119492

The ocl-icd and opencl-icd-loader provide libOpenCL.so.1 rather than the
OpenCL Installable Client Driver (ICD). Rename the virtual package
accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/conf/layer.conf                                     | 2 +-
 meta-oe/recipes-core/opencl/clpeak_1.1.5.bb                 | 2 +-
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 2 +-
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 2 +-
 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb | 2 +-
 meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb       | 3 +--
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb             | 2 +-
 7 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2f3da6170e89..5b9ceb424eb1 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -58,7 +58,7 @@ PREFERRED_RPROVIDER_nativesdk-libdevmapper = "nativesdk-lvm2"
 PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Configures whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
-PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
+PREFERRED_PROVIDER_virtual/libopencl1 ?= "opencl-icd-loader"
 PREFERRED_RPROVIDER_virtual-redis ?= "redis"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
index a765f1530f87..4744f788b926 100644
--- a/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
@@ -11,4 +11,4 @@ SRCREV = "b2e647ffb8f42aa22ce4b0194d6ef6d16d5002b0"
 
 inherit cmake
 
-DEPENDS += "opencl-clhpp virtual/opencl-icd"
+DEPENDS += "opencl-clhpp virtual/libopencl1"
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index b266d6af6d91..f31c51c67e73 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -13,6 +13,6 @@ SRCREV = "fdde6677b21329432db8b481e2637cd10f7d3cb2"
 inherit autotools
 
 DEPENDS = "ruby-native"
-PROVIDES = "virtual/opencl-icd"
+PROVIDES = "virtual/libopencl1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index d5337af8e5fb..f847c3eae40e 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -8,7 +8,7 @@ inherit pkgconfig cmake
 
 DEPENDS += "opencl-headers"
 
-PROVIDES = "virtual/opencl-icd"
+PROVIDES = "virtual/libopencl1"
 
 SRCREV = "861b68b290e76d08e7241608479c16431f529945"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
index 21af3c493bc0..ae4caeb89c4a 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
@@ -16,4 +16,4 @@ inherit cmake
 # BASISU does not work with avx
 TUNE_CCARGS:append:x86-64 = " -mno-avx"
 
-PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/opencl-icd"
+PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/libopencl1"
diff --git a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
index 7390d83bcc05..4d9ed1b8ca38 100644
--- a/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.23.01.25.bb
@@ -11,8 +11,7 @@ SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
 SRCREV = "748c3930a9b9cb826e631d77439e2cb8f84f5bcf"
 
-
-DEPENDS += "opencl-headers virtual/opencl-icd"
+DEPENDS += "opencl-headers virtual/libopencl1"
 
 do_install() {
 	oe_runmake install PREFIX=${D}${prefix} MANDIR=${D}${mandir}
diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 86af1ebc4313..64dbd1db37a6 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -108,7 +108,7 @@ PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_P
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/libopencl1,"
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-- 
2.47.3


