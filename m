Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D1CC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:54:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.43441.1744019646582303655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NbouCDVi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dscC028188
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Apr 2025 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fIUZTpqUoVb
	tZUMqBt4vrCmITVzq8Py/DeK+n0W+oiI=; b=NbouCDViHGe+YV0A7poNZNZ8LEN
	yTnMrUaCOI8OcITQITD3SULHfMhV0zGwyWUG+elrvhH53Tw+Yf0qMn9Gm+exGwdG
	1rFvu7+vROzAxGaNqhOtoucLfGpOYHB/2AASTjzYd9URpkEfeufhO53SRAnFSw/f
	8FoF/JjxFw2+jviyvsC6LmQpk8BIiptaz9esFJ5MNchq2FSCqDByd+eXoJi6ffgm
	xcGjaFA6OcSGqz4UhTuCCsGTaQtN6xITEYERmzu2SPmh62Y6xBax7kEMcuPUtUYt
	NzhsX4cdS1yiBup/tfjj3i435XC8uNSyO2IifYPhu9kYck1HwKb2aDQKXBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyuu90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so929474885a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 02:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019644; x=1744624444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIUZTpqUoVbtZUMqBt4vrCmITVzq8Py/DeK+n0W+oiI=;
        b=OEIHuW8d1kYiBVKRGGQNPhjzisQG9pqbQyaOuJY+8YLOodTSd9x3qnrAx56R+AB8/0
         /vBf/Vji8z582t+FcHHy9sPsCsCKO61Z9yl9Is3caJQJZdz7JX8h8Vuzf+xjAdnm6zTJ
         w8QfXeKzeINK1xzIwIc83B8NegJN5zf8Z/vOtd1tjv8wmBeB6pGePhCqInH6JrSWyBMb
         u88zqIfcxbZ6X+2pseID8oPkGpXVFPLrMV5qTnpFKJbucFvP84ZxHzrEe9IpB+Oanz3s
         iBGj3VwMzC0rHTTtv3k/29BOSsC93GogetDaHtwFrcuTGuawwfxV9UGbQ0CavQ6AJllF
         RL8g==
X-Gm-Message-State: AOJu0YzhdNCc/GWpPn3iTYTl27ZGbmDvKtlFGoMrl2FTFrUG2hMCtBmn
	H18QCDXh0vSJmC5v5cj1v0OCTfB+ua+D5zEZMLTTJu2oIcAEq7lSlM6ZkaVYLkv3/+/Tg12RgQT
	EXNqP7heITPyTsBFNjfYIcdqHfb/MnjoI6zP1rn1hDy//0XtycZoEiOrHtw5Eoqvvv2S0cTZje7
	Kl6jDh/WN0Ao0Q
X-Gm-Gg: ASbGncvfWYtnGQC2237HP0yUztUU10wjn4J2BoSkD5kGZugv23jHphU7cQIFphUXy7H
	PS2nxwVc9IvX8tspmr0wblghu+8BxeIcdTdK/WbD6X35nGfaWchUYElqRH86f0BjuPCRgl1fiXN
	rWyjIj5JFw8otHnoHGYRDd+kRNcU7z/8cUuE84OfCKExPzbDpmxTBRthXpi/HnblDfZve4tP0gr
	5TIK9H6NuAHE8fn4ThReM2iCwAKprZZKTgx3d1apUd9f1rxDMrq/5GFpq98Q4SF+fX2nSfDMr+P
	voo+JgPQ9Hgy89gPGpv9aV3kBfUKjBYO0EwqGZ3BIl7OqMipvjhYyBEhy+3D2ArNf7vXEjzLNhD
	lnrkPz4vQnzRWisn2fvr+yQfdrvPb
X-Received: by 2002:a05:620a:2902:b0:7c5:e2fe:f431 with SMTP id af79cd13be357-7c774e24a33mr1742530785a.52.1744019644677;
        Mon, 07 Apr 2025 02:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU5aymM8OmMtTBIUTgceLkQpzWTOxJ6e7A+yrRG6L6NqkUjURRLRy4+L2BsWcL5R7j7viPrQ==
X-Received: by 2002:a05:620a:2902:b0:7c5:e2fe:f431 with SMTP id af79cd13be357-7c774e24a33mr1742528985a.52.1744019644253;
        Mon, 07 Apr 2025 02:54:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc2bsm1196659e87.167.2025.04.07.02.54.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:54:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] opengl-es-cts: upgrade to 3.2.12
Date: Mon,  7 Apr 2025 12:53:55 +0300
Message-Id: <20250407095355.3461559-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ELmYl3Omswn-64Ub3UZ0A0y30JqgWtKT
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f3a0bd cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Pv7GC51KzH2K4ZR8rDAA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: ELmYl3Omswn-64Ub3UZ0A0y30JqgWtKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116661

Upgrade OpenGL ES CTS to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../vk-gl-cts/opengl-es-cts-sources.inc        | 18 ++++++++++--------
 ...s_3.2.11.0.bb => opengl-es-cts_3.2.12.0.bb} |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.11.0.bb => opengl-es-cts_3.2.12.0.bb} (94%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
index 9752c2d7d734..68e8a3b0a945 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
@@ -6,18 +6,20 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "3.2.11.0":
+    if d.getVar("PV") != "3.2.12.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=148c97f6876e427efd76d2328122c3075eab4b8f \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=4da479aa6afa43e5a2ce4c4148c572a03123faf3 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=ff2afc3afc48dff4eec2a10f0212402a80708e38 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=ed4ba0242beb89a1795d6084709fa9e713559c94 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=f589bc456545fbab97caf49380b102b8aafe1f40 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=0f003c2785489f59cd01bb2440fcf303149100f2 \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=04b4a204aa501992ae85a207be1e200e195c98e1 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=0549c7127c2fbab2904892c9d6ff491fa1e93751 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=e7294a8ebed84f8c5bd3686c68dbe12a4e65b644 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=git/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=6821adf11eb4f84a2168264b954c170d03237699 \
+    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
+    git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=git/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
similarity index 94%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
index 9d070769511f..96a4ca7d497d 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "66956d195169596472e956e3aebf2df8e3bd960d"
+SRCREV_vk-gl-cts = "42e61858e862e153cd0fe36593a8c3f7c16c3275"
 
 require opengl-es-cts-sources.inc
 
-- 
2.39.5


