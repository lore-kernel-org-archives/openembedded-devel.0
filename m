Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB302CCF9F1
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 22:33:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25538.1761690787034313510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 15:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GeHkU6Bi;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y5duANr1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlIvb2622253
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YRI34Ac9/WRSbwvhzEI9nfWijzbab47+Z/h
	34KaxUvE=; b=GeHkU6BiN0jA8cR6qdudl5FAF+CK60l+3A2Noyue3JRwSXLd3An
	MDWF61k/dHYLLJnoDMUt5g/XLVbBr4lfnz/sO6nu+0YEoPClAOBV7imq5DhD6MbW
	sNk1J2h7MpMY+YhSeiE5wbS2Cr4/2+OEVMH+7l3RjXGUxFs2Gf4prC0l04ee5FOl
	i+F+dkwcpTg3CNfvKWOxr8kmlzSXQMNNaGVEHz0iXeWvKXY1w8n/B2wp3eACTi2g
	x6HccJnC2+Y7jEwWpgDqbCurtiK3arO0iz/M9R8gg+6hmx1ba8WuZv1nWvRrwoWe
	UQec8LcHMYYl6Hf6EnGppIvZMR07+Qwz1Ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10bpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89090e340bfso1307596285a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761690785; x=1762295585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRI34Ac9/WRSbwvhzEI9nfWijzbab47+Z/h34KaxUvE=;
        b=Y5duANr1o8KtIyEgWsBoKTyMAxvN8ckwFlEr/3x9Jqd2Rjj0a4PqU1H5wrMCC7Ufkx
         SMsF3DOLE2YetT344hX8EMojYFKkQ4Nij5I2ovJbkxlc+CvpSk0Wr6K5bBiVE2o1/P6/
         iitlLMsduYCiNt60W/vDJ394/cXXMS+ibApJM/kdlMhox0UjQgk61Ry9BMXfiCWyWUKZ
         QDrsqg5dPVoiJRV+10BiLNHfnq/Bx0a27zaTNu7g5+ELbALWV/CzcUiG7hcmn6OgUAIc
         Y5BcItOVdetuttL7/GtWCUwnTiDmmAsoJ1C3O2iUqBc4xB/faUG779kKhDdVs3WRzDnS
         bUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690785; x=1762295585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRI34Ac9/WRSbwvhzEI9nfWijzbab47+Z/h34KaxUvE=;
        b=E+Nvfgay867GJAnW/RPG36l11eYqZSBhWFmOAsWznDTjC7dKXNl2O6qh1vaX5ochXr
         LcfS+WY7DfZ9lTcOnp9w5HsCXfZqK8+FzhJ7WJup9GT5waX9cER46xkZfOPNa/y+tenF
         IEw3Y0wbh9/791M23U2pwsQPCaOruyXzSPCBg1cTF06dzQvmhUk+bQjPy5QZXNy8ATZb
         3FF9o1eQySUFPORgMOTdmLkKq3izlRbFO1B1UV2QFflKPM3U+kOFkY94lnfKxB9WrnOJ
         DwyOR9/4wnO7sluOmdIAMf5mmWT/ktrZc35dZfsg+cOfxKZ26oN15CAbG/gKpsM0cNYd
         s+dQ==
X-Gm-Message-State: AOJu0YzscfnuZ/bNp609sa2tdF3c0uqBZGeb1Koh526pH8sHTGOfEKqS
	o7QaqoaK0tPke07hvJ1/bVNLyMu4aLbXFHqdWxJAnWE3fzneG+Hyf9bQ7GM8WxEhdNoWKpTJFiZ
	rSXNpDoTHdlVM9Q2VUDeWf9S9RQ4o/etVry38/2tvDLkL3PZZeZ50d37wGc2D2vjckm1RMOdE2b
	h+lCmNh+iCQao9bCf7
X-Gm-Gg: ASbGncsdnTS5HDEtG1E4aljFOMIVHB/HvpTmbq7ZUbgDiYv1WPt0QnZCqAkj886awx9
	yfBXSvtWx1jog0R6m5tx4EqZXtzCwtZ+mv02ehOFSNUnNprM3Zc94MpQoOgL6EkTXcX0QsSv505
	/WNZJpj0hpUq8oQGRNZjoe71XSn20EShn65mJ83wQREyLPZjhRTCmcdfxnWjFBd1FXKdUF4D2/M
	WwtScVTqGGKyNWE/DCWNPAY73JOOCHdKlZit5bsvyFvUKL1hCJ16VPXNq0o0m31Q6FxMFxAq/Z7
	CWkAtYJCra+af8Q8ah/ca1ojvTSApYL4VHY1yFiqOZL0bJd4sWslVuMcDPSE8+s7NVYu45vBx1o
	0mEgdiO+d4TqZbvG27PrV9oKPI9bwKTVYpgLMC22g1X8LEKfxbMe4bnPSI4g4L7foBXYTLMGkGt
	5opxIeSBdKkFNu
X-Received: by 2002:a05:620a:2a04:b0:89e:c2ef:ea0f with SMTP id af79cd13be357-8a8e4a24ademr152683385a.24.1761690784862;
        Tue, 28 Oct 2025 15:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwZ+pI7/9BmQ9PLxBi2K1w4/DAB7hO/W7kE2KsPji+2Rwv8x4HTtVI9DaO5r1IGhr049jMgA==
X-Received: by 2002:a05:620a:2a04:b0:89e:c2ef:ea0f with SMTP id af79cd13be357-8a8e4a24ademr152678185a.24.1761690784187;
        Tue, 28 Oct 2025 15:33:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0c61a7sm28529381fa.28.2025.10.28.15.33.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:33:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opengl-es-cts: upgrade 3.2.12.0 -> 3.2.13.0
Date: Wed, 29 Oct 2025 00:32:59 +0200
Message-ID: <20251028223300.587384-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0f50_xkzYYCFhTaWdzaiv5SX-02_RAOP
X-Proofpoint-ORIG-GUID: 0f50_xkzYYCFhTaWdzaiv5SX-02_RAOP
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=690144a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=JTEwExm7AAAA:20
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=3D-5HfX4_kZ6GGEfAocA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE5MSBTYWx0ZWRfX165ORQgSr5Ga
 54S/IIyOtnRwjzQlqJjwiw57OeHaUpxLb1bhwmn+jG03q+b9k8JI0p8QQlY6tDpSHhZJ0COsoMI
 MBcEU1crZJU7XmheuQlkZww5LCZZnCQSAnTnqslRzqU/cx/k08kgLZX/d9NdhXdwLcRMhfk2wf5
 aLUBUhww+5Gbkknio4KVgi3b4tM8j6x5/xZGgRMsfPHHvQul3xuKThT5aNsiKJrfUpd4rVwt6HZ
 PzLF6tRteYphbFGc5l72mLnYL9gfRMCBC/+NluCT8YGEsDKeb3+EaNx7ROZ6NzbVjWNxS5l7Uxw
 BKBKjb9hm65Z2JF6m0ZeXiDq4TW0UXJYytGdePu8iHhSYeH0DsVARSHx/10dohMpUTMJfn/BXmg
 R1IQm82dq+unt79HZ+Z3jY1EaQyGig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121103

Upgrade OpenGL ES CTS, picking up new tests and fixes for old ones.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../vk-gl-cts/opengl-es-cts-sources.inc         | 17 ++++++++---------
 ...ts_3.2.12.0.bb => opengl-es-cts_3.2.13.0.bb} |  4 ++--
 2 files changed, 10 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.12.0.bb => opengl-es-cts_3.2.13.0.bb} (83%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
index 4e7155cd7f91..da4977ca2826 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
@@ -6,20 +6,19 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "3.2.12.0":
+    if d.getVar("PV") != "3.2.13.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=04b4a204aa501992ae85a207be1e200e195c98e1 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=0549c7127c2fbab2904892c9d6ff491fa1e93751 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=e7294a8ebed84f8c5bd3686c68dbe12a4e65b644 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=6d43afe9a0ef71712d8cec5b0ce0cd3570d1fd41 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=8e1494f9d742a27b54193ecd9475dcb2ef23b8b7 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=9268f3057354a2cb65991ba5f38b16d81e803692 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=ac3d0660c45ecf86b2952b298d125270228150d1 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=68e4cdd8269c2af39aa16793c9089d1893eae972 \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=25f4401686c5b5ec726641f134b1989450e81027 \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb
similarity index 83%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb
index 33526630d16e..cf01ce2491bf 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "42e61858e862e153cd0fe36593a8c3f7c16c3275"
+SRCREV_vk-gl-cts = "67ce2ed4a32658b6a80afc52dc4d2825cdfdda8a"
 
 require opengl-es-cts-sources.inc
 
@@ -23,7 +23,7 @@ do_install() {
 
 	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
 	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
-	rm -rf ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/common/*/*.a ${D}/${CTSDIR}/common/*/cmake_install.cmake ${D}/${CTSDIR}/common/*/CMakeFiles
 }
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-- 
2.47.3


