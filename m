Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DD6FB5E87
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:51:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63805.1773701452991977757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mazKdhkS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BO6B1hHf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECTL71639402
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=afreQeZlaKv
	vuvcy0fu7gBq2Y8K0td71Snktlskb0Bs=; b=mazKdhkSw/bYR4ZcuNP/mlVu2DY
	Fc5UeHr08me24XsSkoFDq0FDExu1vS10yMVNyNRhTCcIvrFTPsXR3DOoxt8YZCN5
	LOsNYJQ2+e0fSMUubfz7RRmLqRsis723erOjaoNYxMdaO0F71zuJI+vwwm5UekKM
	JLIWvASwWvBintPykDX5cEUGP4d0veOGcToaQaWLtRF+9kndj53Pa0iu4YjNZU9z
	OabCz6TRsz3ttrROxPLqe+u9w5+lvWZIG/xD01qk6El9Xb7CNi6cLzuuU/3zsgho
	+IDducSqKGtCbKII9QYx0k+IRioan7nefllrBEsx3zd1jCfakBmoPw5Be/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke09psd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:50:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso5309219785a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 15:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773701451; x=1774306251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afreQeZlaKvvuvcy0fu7gBq2Y8K0td71Snktlskb0Bs=;
        b=BO6B1hHfAm5iV2N+Iwe1+DO2cvnkdO1wCBBiL/4OCqCUEAV7qguMZ4FYVYz5D/0KZq
         G4b5LM9ok5p/AI1AJ6v1dHYcLgfLoJOQwgxqgd+7SRpOvoCn3cMsyu8Q50gb0qm2yRtS
         058aP1Pq0gRjftx9X1HG8NFyRYuyX5sthlwVZK3pMD+/AfzSMIyag4uF0uGdV5X18Evw
         8kyXA/rVbkRhFzmpNMZ6/kcNlHDOEMaa1bbjwlUZ2lyzRwpQKMgkFPjppw0PinvVC4qj
         tdN6vq3fEqJKtyIXWWDDQalshlPdNu1fEm+UHCm5kekSihDJPcrJiey0y1vKMM5Rocps
         OXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701451; x=1774306251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afreQeZlaKvvuvcy0fu7gBq2Y8K0td71Snktlskb0Bs=;
        b=LMOqe9AOaBjcI023vz3tyncGi1U9lU5ka8YGhkicnY3KpiOynWmbOavzz1n++tBscU
         n6M4oR7OxsIw76OKMN+N4OameJD9QyCjtIWB1rysyNE3xA474cnoBF+YWSbDSr1OWrz3
         vkbkNPfZdxZIUHddaQje5+dHVYKFtK17hF4byGURnWViLy4xiv8SyTC7yV2f89tpV4wp
         LA4tpGr84Elcax3IOEUJluMnqNP9mTt6U4mscrRKWfbTfvLj7KgbqvJRksgDZzD03Ogv
         95mA0krLzcM8nNVf4IcA8BDfvdjAdfjOpv5w0imsVcn5a9TQaC88TRb+VoO51WutK36u
         KeYg==
X-Gm-Message-State: AOJu0YzRc39p/tW8J1ogzWl5vrgn1Jo3Ok7oC/NBtLwHAIN7QGvPdImK
	kgHiDQdqTleAPfm0SMc/LjIrEhObhiD7o5B+IFYPMwqmcC2dCSfZaQao+tvVZm6fQWODEvyIjA+
	hjTQZXG0vaGrl4KlVkwfbahb9FzMGW9+fCbSBs1IIzkPfh2cmKNaBquZRtmLqZXCos4SYh9IBQb
	j41Uq2sKD1xlH1vTTK
X-Gm-Gg: ATEYQzw2I5z4fVimc22y7FjigBeqnjN8saPDE/rSSau73GZy8ashsUMTH/Cl2iqjYJD
	NCs/fmPmVdzB+yVwpVZ5VApdOJsLHi2R1P0p3JmyKLa7AWgihEqZm1F5zbTO2lsA018u+sSSUMX
	q/hQ6OOg5WponWAUxzBpgk284xakEda1gMq8h39+V8bwWJXGpL/U5+JmV6B4WWGxMt+uQ/0p221
	KM2jdDFUJcXtVKaNEMZrTAHybkM1l4D4gnhOVbILEoftRX3Ib0slN6TY+uvYwf5TFAVHV7yk9vJ
	MRoIyw8bjzfDp0ba0c2ylWREuJmo3uYW5YC78tHBSmmyCohJQbJyyCd0o8ni0UITU5uImPDZjlG
	T7OQ/5t41lI6vOQX4q/KoEjLz47TC96uOu8wq68R1AABdNKlMR02iQ08PDNpggFhZ5AynG92WTC
	anzIoB0es/cW/MHBasfDjBD877zGSnbxPrEsk=
X-Received: by 2002:a05:620a:f0c:b0:8cd:8569:b945 with SMTP id af79cd13be357-8cdb5a00c6amr1958021185a.13.1773701451219;
        Mon, 16 Mar 2026 15:50:51 -0700 (PDT)
X-Received: by 2002:a05:620a:f0c:b0:8cd:8569:b945 with SMTP id af79cd13be357-8cdb5a00c6amr1958018085a.13.1773701450639;
        Mon, 16 Mar 2026 15:50:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm3689499e87.58.2026.03.16.15.50.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:50:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] opengl-es-cts: upgrade 3.2.13.0 -> 3.2.14.0
Date: Tue, 17 Mar 2026 00:50:47 +0200
Message-ID: <20260316225047.1540453-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316225047.1540453-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260316225047.1540453-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AWLWqRHxWjf_lYxjNgA9ZxVst9hYHlN8
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b8894c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=QZPcp7hBSQk4G4yxMJkA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4OCBTYWx0ZWRfX98A9KmaNKpj7
 SSLRk3oClnAqmm5LNyUg8GF4J3/1imnWtlc6CvcG9YNvrx6iXQV89EoC5MFZ2GrCOY7FGm2X0MW
 H88k9QctcxwLnsQelmni5bsBFY8BbQffBuPnXclmG6OEqnppIqiXxkt+rh69MfaEbeF9wz6mJ7S
 vmPBb5SQd+4/ep/Jgp3GJO7Agc5bw8WqNz+l4Zs+JcR6GXPc8ItLVulYQtyDoig4e6l2t7hHdLE
 ilLUbV57soDjK8TzOz5rnd0zi3eFO7S6+iXHRpOBXIhuJ70q45FO1jqa0gaJVVqUkK4+HUUdPsq
 Bh3UvK+bzKDRfk5XEJvMlvIE8NC7JwGzojL2RHv3MLvfE/hT8ypoanKMwAZUaEcsjye8u32rzWF
 JtKu6Fk53L5jHmkocnLGFAwguR3p2bEwyhr6AXgrgiYj5PEpRzbfEKUYQR1cD1vjhSCWu86ZWBN
 Pr7+NQzRpt9fBEKUBmA==
X-Proofpoint-GUID: AWLWqRHxWjf_lYxjNgA9ZxVst9hYHlN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125297

Upgrade OpenGL ES CTS to the last release, mostly bringing up fixes for
the existing tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../vk-gl-cts/opengl-es-cts-sources.inc          | 16 ++++++++--------
 ...cts_3.2.13.0.bb => opengl-es-cts_3.2.14.0.bb} |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.13.0.bb => opengl-es-cts_3.2.14.0.bb} (94%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
index da4977ca2826..88eea63ba36d 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
@@ -6,19 +6,19 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "3.2.13.0":
+    if d.getVar("PV") != "3.2.14.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=6d43afe9a0ef71712d8cec5b0ce0cd3570d1fd41 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=8e1494f9d742a27b54193ecd9475dcb2ef23b8b7 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=9268f3057354a2cb65991ba5f38b16d81e803692 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=ac3d0660c45ecf86b2952b298d125270228150d1 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=68e4cdd8269c2af39aa16793c9089d1893eae972 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=65b2ace21293057714b7fa1e87bd764d3dcef305 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=7881226269b1596feb604515743f528f02041375 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=babee77020ff82b571d723ce2c0262e2ec0ee3f1 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=ac8223b312d40a6bc1733fb3490bdcdb5a389d50 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=0a11cf1257471c22b9e7d620ab48057fb2f53cf9 \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=83c140b6f67f45220956b1971e83a53588b4c426 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=25f4401686c5b5ec726641f134b1989450e81027 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=aaf915a0e08d679d1e8b835c30e6a346ab0c7ad2 \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb
similarity index 94%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb
index cf01ce2491bf..2a98ba1bbb95 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.13.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "67ce2ed4a32658b6a80afc52dc4d2825cdfdda8a"
+SRCREV_vk-gl-cts = "ed5729a4e50de78f577cc043627aef93af8f16f6"
 
 require opengl-es-cts-sources.inc
 
-- 
2.47.3


