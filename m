Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C58CCAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:04:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.5088.1758164694156833430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IFiIeMhp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGDlGw014189
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+QqkiqO2s4+oiDPQmTWtZVMMBgU1luupxKR
	RVjrg3LE=; b=IFiIeMhp7yXzhf+BMk6nGPJhIB95xqdWl4IAAk56pHI62Aaga6E
	JtCxqNsK8fRZu15L02eU48VaZtbcA9psJcozcufo+ioAakVDRp49iHMDiVXyeR04
	EeMiLkoHQzo/juE0rWNFtnhDzos9tiEjgDWzEThwetHakecMBEL5Z+2C68fWVV7Q
	msQDXiBw3IDBlI27Y9rEPIH7ZLM7T7HrNOSDWbF9HZWUyYtYqfZQb56UyKmcJ9J9
	Ic1gHlg2Uyhi60HCU9QYAYTE9sTPeQl/zojrVqiixMdIUqm//ULKzrrSptCrmOF6
	q6e04qP91iOTX+aS+vPO7kb1m4iCZxFgQkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu4qhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e178be7eso13491561cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164692; x=1758769492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QqkiqO2s4+oiDPQmTWtZVMMBgU1luupxKRRVjrg3LE=;
        b=W/isKPrd+49omPHcybBWld9vKo0HI/GGQ8jgOW9j5ADfhmZkbxiRzbL4Z7GkzLfMOo
         45Nzjcl6dv+ohdb5qHd4qnT4dacARc8IfpVfZ/SbRfdks5sk3OumTxzTYiqPGkx8830J
         C9Bib31+uC0DhWq+lnWuUPkFK1RpPfjoyi4FeYbsy9A8N6bkGmRRU9k/UiC4flgDk0AJ
         wxxK6v6/2fXO4EuHjZGf+rBBXS2RKMJriYWkGabXZED3x0zcvOIBOWEQGQTxZWvPwTqg
         nDAU10Yy5xp7BS0r5JCaWAZuXmuT7epNzR3W/SoUfUTq+D/ESiAE8irEioEvv19kHMJL
         JADg==
X-Gm-Message-State: AOJu0Yzp7md8GKzMtyo0J6MIXRpUTa7o8cmDwWnir5jTX4zov+Xsb1Tw
	9pniGbBK7Q+ThrxcIHOyI8DUitYJP/gENknu9HqBb9uoSzu6L5H2KcGZb8wNHiYEeXOnuq2WXvf
	znu4/qMi4b73Y9DTDDrCIpq8ldwLiTAoofDZjkmGasEAnCXT4O3Cl0PTWGfSq00SwHhk1dDU8Rt
	dWNAOJfu6/zdNfCU9Y
X-Gm-Gg: ASbGncuGTtRoru2q3pZcIKwykmD9RTOBUI4J+OE84t0aSN2GcdE8HLAIkha663rVRPe
	B0Inkx2kpSEqPKpCM7S+Yi+2tsAQRnPBWs2/j1FQYruAFbauiZ6zwshVuItBNFlqoNkhr5wiKex
	RGJsV50FIUOLDM99U4Nf9XITv6uDpI7HHXSLt+L8jFR0iYh7PEmmHG2WYKAnj14menKl9sArDUx
	kGMlHwyeHUFkZl1sgrpFFYF0xeQaSpUFZAnoddfmZ8XLd6uC1ithEWL7H2D3A76xCB0tzJ0uDoP
	xp3GX5fQRRz3ahaBOL2Yp2uQNwlRxuKgFXAC8DlczbiyfCqvHyEznzVfR7Xso4l29sjYxFrMQSt
	JR1zwB80hguTrRZINTZk6x0VC76bxcNXexpu2yLNCmRnqJb9GwCAt
X-Received: by 2002:a05:622a:5c17:b0:4b3:1c97:57ac with SMTP id d75a77b69052e-4ba6f51a611mr50598371cf.80.1758164692097;
        Wed, 17 Sep 2025 20:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZa6xaMvqaU0b1fXtYJJMGwe93IabP7NBKenqyL4zhWeM5T5v8refl95GdL/MMIgnPeMtG2w==
X-Received: by 2002:a05:622a:5c17:b0:4b3:1c97:57ac with SMTP id d75a77b69052e-4ba6f51a611mr50598121cf.80.1758164691538;
        Wed, 17 Sep 2025 20:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a9f13d3asm315572e87.141.2025.09.17.20.04.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:04:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 1/6] ocl-icd, opencl-icd-loader: drop RPROVIDES for virtual-opencl-icd
Date: Thu, 18 Sep 2025 06:04:45 +0300
Message-ID: <20250918030450.1507801-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwWINP4LVL35l
 vSGLbxRzqMnRI2t2uDbMMKMdybu2OXoC2owS6E6Awe4aTj7lAR2ffyUvC+9b1LqGVjY2z7a23qu
 6v9ZHt1qf35AJGRV1cmS9O2Dc6HAMbbZi5NC+Caa1cItbPaX9qFsLxhlD1NfS+0qlQ0GVI7FsUz
 Ni0ClSltF4AppEH1/gfMUdFSaeAygHPrhucAHjSgC514h8JaRdPSkSqzE7IQMVzo6y5qcpA0YEc
 9gWITLHipFwhJn55HjGXFBwoJ988xfwHkWvMeLkT2syigi1TD7lvu/dkG6c+XHqBRfRtzKCM8tI
 IkN9TUr3X+3PFfdBWYZUxz6Al4Pj//w1Y0x9jRNCjhM65ZjU6mxA9pOmvQky+WsVFxbU7gLG61o
 4MPp/j28
X-Proofpoint-ORIG-GUID: NVhYdDq7OC7VG1_pEFdd1gYNCz32fW90
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cb76d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=qe_RU691xxjtq5-8QPkA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NVhYdDq7OC7VG1_pEFdd1gYNCz32fW90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119507

These two packages don't provide ICD drivers at runtime. They provide
the libOpenCL.so.1. Corresponding package is selected at the build time
via the PROVIDES_virtual/opencl-icd. Drop the useless and incorrect
RPROVIDES for virtual-opencl-icd.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/conf/layer.conf                                     | 1 -
 meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 1 -
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 2 --
 3 files changed, 4 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bddfabc2195b..2f3da6170e89 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -59,7 +59,6 @@ PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Configures whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
 PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
-PREFERRED_RPROVIDER_virtual-opencl-icd ?= "opencl-icd-loader"
 PREFERRED_RPROVIDER_virtual-redis ?= "redis"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
index 9e32242e3151..b266d6af6d91 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
@@ -14,6 +14,5 @@ inherit autotools
 
 DEPENDS = "ruby-native"
 PROVIDES = "virtual/opencl-icd"
-RPROVIDES:${PN} = "virtual-opencl-icd"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 2ff9a6ae7ea5..d5337af8e5fb 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -9,8 +9,6 @@ inherit pkgconfig cmake
 DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/opencl-icd"
-RPROVIDES:${PN} = "virtual-opencl-icd"
-
 
 SRCREV = "861b68b290e76d08e7241608479c16431f529945"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
-- 
2.47.3


