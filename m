Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24556CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 01:44:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.3789.1758159889414510419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 18:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IrVcnrHg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGDl98014189
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+QqkiqO2s4+oiDPQmTWtZVMMBgU1luupxKR
	RVjrg3LE=; b=IrVcnrHgXtj/dg2KC7wqz+iym6a6DS5NAfJs2ptuf8AfFyC9aOH
	fVw4Q6Y460DeKTY92cjC2HrY/a34hf1tAWOczROR6XZlVIVcMD2pCoTOr/ApFc/Q
	ofieM4hNg/Rp9yRjuqopKyE2XGvpT7eEGw23aHpLJNjNSIdcHC2ErTTp1/8WAtmW
	7imJJbz4dMKzeKLKlEMChqYmaMAXo87JQlMZSWYwHp2RA3lRo0pOReutS8r3ut9b
	AwqEV8vXJzYZkWnYn5EpLviX+rh9c48L4iWgOUqdW3CEFfTPbsxI6dYG9j+BMAue
	sZlgacK+7IklcJOPGuxYhO5qX/eM0tmKdGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu4h09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5d58d226cso9617861cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 18:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758159887; x=1758764687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QqkiqO2s4+oiDPQmTWtZVMMBgU1luupxKRRVjrg3LE=;
        b=t1H6gpVKdu1p7CBEphALgFsnS/wxFmG2x+50Nnn9u65vhE8h+JSgnM7Xy/K1JpTDCw
         +HnSSh2U69biG8fU+ElbqYcY5Ix/MgcOv4PH0Fy46XoH2OAN7h6mC1aj9EEem/hDhdPq
         OoChEoEhuOmhyWOrLhvuFmbNB8pttk0AVCqpapPYe2FCopXxWeD+/uZzhmHLQbfLg3UQ
         Q237Z0vikcsO4rMCDvSDFXknIVtXXHAU68g03GtNxid5IjrINak+l/f2ico1MfDeCPU2
         YryGl5TpOzQwp+Nnm8iyEt/UqhxlJ5IsHojyal9H8ATirIodBVxCmm/k3p+1qsbjXdYM
         8h4g==
X-Gm-Message-State: AOJu0YxdqpCqvyozGGoBhGsumCQiDCW2ePur+/e3c7d/qh8GemIKxC5G
	DZd724rCy/8bxONwSrVub0DRsNOZ2Uf74UDD4jzdfHDIBQF964QpXMfiiPbx2LSEkfN3rM5v0mz
	yH6KI1OoIxM3PgS7OmQeqpVE/L3IdB/QSV/0g355U5BqFDmu+ezWcguAWlZJLAGQ5vGEX29RIT1
	J66e+6pHrk0KzgmnoU
X-Gm-Gg: ASbGnctNwyWOOmR4OQumW8jq/UdwfSxhRkgxLii4JEJWdr/4BNE/A1JFU4M8FWwCw+K
	lsc8CeD5JU351ay5NUmkQulDNPZkpz71OnUeRwKFQjrGSEnfZ1753A/SCgUoDYWlGXSA+wCgtBE
	QixjBmwElEcpPEavuZQ6ONNZwzkCdRvVv8Oj+wYJlEtp515tJqx975QSGCtvIgaFfLpV2YsV8iT
	c9yuKlUkHzfP7MFpuGXdTAt0S9hBdhWmYCJCCVGbTxviHL+/kQbsieT/KrVQfs7XAW3hZ3LoRlA
	rKcq0KOIu924gVqKaE0wQ8YwfuqMe6NFH4pOMXa2IDykyeC+49/gsbGK4OlKNnBMi1GngVbITtb
	B1UkTdt+Vt+5I6nDOUlEO8aed8qRRLi1gnil5PGOkBhFglng4H6s+
X-Received: by 2002:a05:622a:30a:b0:4b7:a68d:6797 with SMTP id d75a77b69052e-4ba6799d53fmr57045131cf.11.1758159887247;
        Wed, 17 Sep 2025 18:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzuFQboFsi7V6YddtgK1uDWz+D7zMN34z8gkw5k/un2jz+GUjFySvsmjl3IsUpIXlISD4mhQ==
X-Received: by 2002:a05:622a:30a:b0:4b7:a68d:6797 with SMTP id d75a77b69052e-4ba6799d53fmr57044971cf.11.1758159886706;
        Wed, 17 Sep 2025 18:44:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa577704sm2283341fa.70.2025.09.17.18.44.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 18:44:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/6] ocl-icd, opencl-icd-loader: drop RPROVIDES for virtual-opencl-icd
Date: Thu, 18 Sep 2025 04:44:37 +0300
Message-ID: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw28NeJx+BOju
 Q3o3Qj3ZrYd5IUNG5IGmNRd39HO0SxXtRcQbBU112QN4zTK5gio5HcsR3SnyowIwBAvIY6mPqMy
 +HUfrruJ4aDb3obtZr6lQr5ETS5h1gRv0WXI/EoFdjRyfVJlquaDh4RcF9IFGI8R/kcLhKZUACX
 YI+GrFs2kU83EcR8Ow3+KLe+qFm2lbo7cY/dgxnFlLON1DnojvhHt227dWsic7T9f8E3412uRyy
 Ph/t1x2QCI+dZM6m5iSC5bQe2Ixg9GuvGp8ORdibm/PMnwFbi4E7MzMnPmjfPGN/7uD1JLzUIML
 6H75vYwkefllR9EkcjYbhhJkZcHF9IgBAPR86nZsRmdpcpYcoyOZ3hARyFHCzfWlhyzNjbfrcjR
 f9cb0OBC
X-Proofpoint-ORIG-GUID: pX4bscEnxMHGjqL7TzwQpBRB4OKoQx3W
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cb6410 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=qe_RU691xxjtq5-8QPkA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pX4bscEnxMHGjqL7TzwQpBRB4OKoQx3W
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
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119491

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


