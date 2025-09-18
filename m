Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FB2CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:04:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.5205.1758164696481703748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=avdpFYod;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGNdqc019068
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FWV+mC0laiv
	zb8EQuv2vcyAmzdXrx3282VqupsxfruU=; b=avdpFYodtvAKMA5dLw1uFfRpQHn
	NP4+Yj1sGa15V12on+Z1K+tXmvmVhsd+KUhgVYCVwS5Jec7pyeDVDrZWqkiAivmI
	6XXJkPHpEhhjSHRYN41FDkliDIvDasqCj/09w7Y9jfNyqRnfXUFP8DbqNlhv4cJ/
	OFPYilmg6CVA60yTxupuf3drb9JwyIS9l763xUTxWRsZUHtNOsFQTfz8KX/et0xy
	7NdUM9pcmLZGToTtn4bHBI9gTSPVPJABU14Sf6HMQdMcTeXLcnBzTPi7ffbkLn2b
	zGlwoTxiRuuD48kQ3n3PxL7niovt+SVg3flOYrXb4pEdXkC2JXNVP0vfNRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwcp38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b60dd9634dso9674311cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164694; x=1758769494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWV+mC0laivzb8EQuv2vcyAmzdXrx3282VqupsxfruU=;
        b=sK63YoO/mRCgSUxtGTxpSXJHN/5wXxwFegaAOurVk7Bt49rFZ9dm/tLgx0MeKyLf3v
         9blAEJpaCZBEiFBVUAyPRath7CyGCscvPsUq6sP4GWkxwuruApgAmASCN/2j3aFpPJHR
         SmCJdh4s+lD6fkR01F6ifKlHQo2aKiCcPKFvAalpfbQfFW1zdFKEDqsj844ov574LUFz
         n1kqCOdEExwUGClBxzCBI8+5pDFL7zqnzqOCyiRg3VYn1aLYMvlrdbLPSM09LBMCSRvx
         aKiS/eA12NXf6HXKPb9JIBZ9xZIEv8SeLHkKIQzBsFu392g8GtE2sMIKyjt4pFKnhQ81
         DaBA==
X-Gm-Message-State: AOJu0YxPNtFiSvSbfx+5g38hYIeveo0a0TpsGdtAWcF5kLZJcnssyz+8
	TkKyZB2D2AiizCmnb6bayvYs+De/dSGiOidWry5JtWqExoszPr2Ggop0L8DPMhgVAlAGzeFO88k
	71M/z48Z2RcC52BZ24/Vnm7c+4kgj34znG6wTS0jAxzU1JkQuhqLpjCGWoAozGygnckLIw8ky3X
	F+mLqmCbMye72kcfyr
X-Gm-Gg: ASbGnct+J7yXVcU0iNng4byJP7KvhoJ548iJOmR5qnoeJ6jZhjLFoNQY+41haOwbHGe
	qvUnedODFbQnYfPL77+bjaKsxUWGmkuwnXXz7394UUubleDp/ViwTd13VoOkwtxHJo/nRjgNLYM
	5crhBE0LvbciNEyoZujta6F2FBoJdYVfiL3p6BpZw1RX6ClwpsyyRXenXt5ZMT0fDr242xCEhrw
	H3CKXoG6DnrL9f8CjkjHCyHhBbqWF+tGiUKLCSh3PFXli8D6LvnLKiigfrjFQPsW0RsxibfZ2ZA
	RRX+d/RzwEaPb6yYmNNG6Lk2eyK9J63IIE7FocAQBDeYg3LGZQpBqmiPvxezV/rtVW+ZsFPOMz8
	g8DZKI0/McI7pMmqteW1rFntFWo9/fwLlU75ainOC5Qtn99aA/s78
X-Received: by 2002:ac8:5cc1:0:b0:4b7:a98b:8933 with SMTP id d75a77b69052e-4ba6b74e54bmr57155381cf.62.1758164694333;
        Wed, 17 Sep 2025 20:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQALUqh8ek2ui+XP8bEqCIIV7kjEkM8vJR9VQlKxLMHegr4GTEh8XyplAKHjTY3cFzmFmnvQ==
X-Received: by 2002:ac8:5cc1:0:b0:4b7:a98b:8933 with SMTP id d75a77b69052e-4ba6b74e54bmr57155141cf.62.1758164693831;
        Wed, 17 Sep 2025 20:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 2/6] opencl: rename virtual/opencl-icd to virtual/libopencl1
Date: Thu, 18 Sep 2025 06:04:46 +0300
Message-ID: <20250918030450.1507801-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cb76d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Drs5-ZKYQUkviSzO8xUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXymSiB3OjyqmI
 l8rHA8bIGMTu2lBceEWaEmBPd6zDSVNVlMPMaH/D8CKQhW2rHSaHcdLZvFqjxi2lNw6qYSSiMnZ
 Em9HX8WDs9BgfRmN1qOd0BvbxOTDVYYdUkLCMBwKJ55I0g4TKjU1CKZmCrMxubWZYFs82csfTJ9
 1eJ8iQk4nsxvsKw7quKDbLgZmA2GosKMBOuWEO2e6SO+I6I1uJsjtUjCX9YM21jIPL5+rAxJRAj
 x7IVFm+q9IL6t8PDXxqnPxr4I1mAijRYlheMNdumTukNYN4wan2EAwSZ2zP2VZJu7eO+6DQFGis
 LlDV2B5JsSzIUu92tDWYAWrMDE6xZp8UV3RM0yP3ga6lxf16XhtsmbDARZOd5rHVM2NyOBt9+Qv
 s0D57kyb
X-Proofpoint-GUID: 7v0Hw2WFNN8v8unfYF9q-lGlRyuCQP2Z
X-Proofpoint-ORIG-GUID: 7v0Hw2WFNN8v8unfYF9q-lGlRyuCQP2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119508

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
index 5462c4f8da53..c9482741e75b 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -109,7 +109,7 @@ PACKAGECONFIG[java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_P
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
 PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,ffmpeg,"
 PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/opencl-icd,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/libopencl1,"
 PACKAGECONFIG[openvino] = "-DWITH_OPENVINO=ON,-DWITH_OPENVINO=OFF,openvino-inference-engine,openvino-inference-engine"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-- 
2.47.3


