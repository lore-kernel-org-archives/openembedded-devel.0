Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EA5C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.71829.1744107665408067524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZzOAMNQ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GNOl032609
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tzsplyx0pC/
	1gZ+cE6t3zJERtKbbjiScikUbLjoyves=; b=ZzOAMNQ3qAtC68737VAP/ydtsfS
	WFbdrhjU1T4z7RqNFHaAfX3R/38q0bi6PjrtQDa41BqwoDlso5bJqnSJ8Vx6I2Gi
	AOmrxzCxiNPUc9XjqoKZKtxThNpF0s428tXQUE+0EQCC6ZqauRkUjJHUWrGJt0VA
	9zTYkdebRaNfhxiBc/DtEFHRKGXDlNjb7Rc8M/1ZhPJJ41xAYIRQdcpUKVrYeZRI
	aeJDUtn8NGnxNGolT+m7XomalfyB+bRhmBrbigXiF5W2tKforaKx/dKJjVmYH6nu
	SzYvmNWtS/x/5YxHoJgP1Lu46xU4i+eEl9FAE7P5qLdGU0w7sbwQ2oQqRxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkfa43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so1613491085a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107663; x=1744712463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzsplyx0pC/1gZ+cE6t3zJERtKbbjiScikUbLjoyves=;
        b=kKBQgBoeMjRNbDKgDtSHJFFNVh7Gp401wFFOeGJSKRosgin6IoRFiTDdHHrWPWoODp
         2J7T7K+FK+2NLWlgwMOp/xsJ5wKnuqkRC6c4UCY6Z9fv89l58es6ij0WvljMkdtL5Miv
         YRHEjDmLVI8b/P1HBJbsSZEg6N9/TJ+dBed06V72Qwke8/fq2DBTp+0XwWB67JfDPWad
         2UqyDm5bVlu9TaaZ0FkyqPedrZFlNAzLVSavZYX6acuDJllzbFRaYP/41N4GE0kA9zTV
         k8ZN64GfLHh5tPrMKb33pUVieyP3yNJM921uBq+doT576LolltZuGxkLoEwMTFiaCSTb
         Pbnw==
X-Gm-Message-State: AOJu0YwwmOKkA863AKsDoWHlk8bedx0+AmAiy79YZDuSvp50+yZcb+mi
	xnGTTKxgVRxU+j7hvHzKG8Q0RO01xcib4RgAh9dTPPMNfifHn5fhIp2OWPO/9dltWIq8VfuIW2O
	wCRS2KFPC0flFLPs1WMP5l0/8Id1doLRrq2lcH1zD9PLMqAi7OuFbn4d9CeoYfnwHmkofp5Q+DF
	samlTA41RGtOsV
X-Gm-Gg: ASbGncsIoRtPxL5AxOU2zqDWQFHK39SlvcsyOCu1uChHPgDrSR0A01ynmIG/2tZJSrM
	DPJtoy5yIY6RK9eT3foDm5AKb9haCWhiTwg719u2I0XkBiKeQYOX46qYzxu0q8C9U3Mxy1POmJ2
	D7zilwtNQJuZ4p9ybAlYg+4xXI1/DJPd0vD2seiVptCt/bTqF9Pb3cv6jwyX98FuhPRX1idjvtn
	vNkkgDEo0Vt4C1087APtX2dpGc5cTdwH7XMM41ViLqPO/CQpXhqhJqJ2oAX9jBVdWtGGh4COf6u
	tdPfTvyod1GbYatiK1tQyck2R0Bsiy3vPVmNvJag6I5yM8HHZL2SV/xRsXyAnYOKo3L+MA7G+qX
	8+dlEzCQ3L7o/9v6JrWPQ9Xl4bIpS
X-Received: by 2002:a05:620a:1a10:b0:7c5:57cd:f1cb with SMTP id af79cd13be357-7c774dd6ed6mr2100831185a.37.1744107663204;
        Tue, 08 Apr 2025 03:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERhfMUcTg49MmHD/ye3nMSPFQUBTrxOsjPNyGQdxPRqiXDnNpr4URWPQ+8u7JBzIrJ/FulRw==
X-Received: by 2002:a05:620a:1a10:b0:7c5:57cd:f1cb with SMTP id af79cd13be357-7c774dd6ed6mr2100829885a.37.1744107662902;
        Tue, 08 Apr 2025 03:21:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc20sm1482588e87.165.2025.04.08.03.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/5] opencl-cts: upgrade to 2025.01.22
Date: Tue,  8 Apr 2025 13:20:56 +0300
Message-Id: <20250408102058.2769630-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EP6f5XobOuOGduKpxhP2RPRySBRaDUgi
X-Proofpoint-ORIG-GUID: EP6f5XobOuOGduKpxhP2RPRySBRaDUgi
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f4f890 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=ds6tjL1FQIGj9_isU1gA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116700

Upgrade OpenCL CTS to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../{opencl-cts_2024.08.08.bb => opencl-cts_2025.01.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-cts_2024.08.08.bb => opencl-cts_2025.01.22.bb} (95%)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
similarity index 95%
rename from meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
rename to meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index a65c3da7fc4a..e374ef186329 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
-SRCREV = "a406b340913f622da089b00f284a597656c10239"
+SRCREV = "5b3518096ca7b82854daadb2b2fae704fe2d9cb5"
 
 EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
-- 
2.39.5


