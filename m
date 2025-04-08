Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EF4C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.71416.1744107671028847689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=a9Q8f8cq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GORc006523
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fIUZTpqUoVb
	tZUMqBt4vrCmITVzq8Py/DeK+n0W+oiI=; b=a9Q8f8cqJH1OefKedpT8kWICjTl
	3nnCvRX8dUkEoyu+j8sSHoUFcCaPGQyQqaStNU5JcxvUi3iwvbFvZcF/E99hqJDc
	H/nktjzsEPmVngYYW9BB+8OGwSafAADFkkMWs9IxN3S9rpE1oaLbyo5oCIVHhJNe
	cmn8ipE8ZI05VKTp06GmrUpt/I1Ke5+myxshiklc/m4cWmvAREYEwtegdQJZduwB
	YnK563kMD7RBuyW/448oicOz9rO8bIKfv4268aPtxrJ4l47ddJdOLFtS1kfK3rne
	fWUFNLcAKAmh7YDT7egCC0vpkYFXsJsl1Z57o8bZi/vooKJoEjPQy8zvmgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfa3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so968064185a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107669; x=1744712469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIUZTpqUoVbtZUMqBt4vrCmITVzq8Py/DeK+n0W+oiI=;
        b=WR3nOEm241U9Cx0+GdqSrdfC0gsv14dBdwYBJ9zJjO1SMltGlluz2c6lpuBO/G/ZE0
         scr2fcf5sQ2Tk1mlrj7AJex8egGcWgeGndWndAXvis+fClCX2NaDrIwCUM7fY30VJ88/
         EIBB2/x9fv9ID895FtOeAKrTEtJsDfcHgaR2VqQ+wXHvaKS/c3Wi2yPGFU3foQLPZHS7
         nU7jVKEvqOyKWUON3ZSXDWWkxDkTv44Vm9XVptvhIqHXOjWFHsyvluCxdhVQIdoudHgr
         uoLnZgYvuX8Y0c9Yx7VSO6S46DM9dlCfzQwUw3DQZoEsAFHiBej7wzKf9kuoMtKivMIL
         /hHQ==
X-Gm-Message-State: AOJu0YzAYjUfQmNz0OfcCJVi1TSLufr+4ghyAg3d3185hPa2AJVYzv+I
	M8LV6HXgSofj3+oWXeB/94b+S0QuZC79biChg0RfEL0q9Hntx9CC3/7O9X1s9Gosh1Q72Ye3SOw
	iGrt47UVPcxQUiqjKvi5tW3rRcw7K0xWKoHLjDxM8cMBTaq1w8QWJy12jErJ0XMhyo2fpUlKa9R
	WD/8IG1HaH990D
X-Gm-Gg: ASbGncuWYG9rVMYL08ZAUPXws5uk8+I8eh+E/l47qV6FaXi824uExYNP9ADxLKCuI70
	SIbe0JhAyNlvudSyk5rzASMX68XGKwiRpSAV5sIC4LN39YKsgTglLxaRqZRuMGF3W+QgLRfoIyt
	6sfJE4iib8/ylwFIafvRu5u8vL0qFG6+2nnBCca1s+iHy1Da2sRrX+rlQip+1T48sSInpwDlEUH
	jFIuTf+oZF5Zgpg/uzsDvdpGwbOO/cAMDNovbNsxGZfFrm5nzTBjK6yXea63lcbN2BowQBH9Igr
	y+G1gyZyUWA2CYEXs8LBFvdeyvSr9tJ663kgGd0Fns3NJAu3WX93iJVXuF4zJ1mEvnjv+lcwFnP
	xz5D8Gc2q1BAMyrmBeMvCNplq8rT8
X-Received: by 2002:a05:620a:4386:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c775a0f662mr2341600885a.14.1744107669020;
        Tue, 08 Apr 2025 03:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG85OuKU9lpke0QoMm14v2kfDjvaENcj/QkBNEymKKR9MIx+QwxIQnRcqY9ZjrI5T3wOeQ3Og==
X-Received: by 2002:a05:620a:4386:b0:7c5:5909:18d8 with SMTP id af79cd13be357-7c775a0f662mr2341587585a.14.1744107665506;
        Tue, 08 Apr 2025 03:21:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc20sm1482588e87.165.2025.04.08.03.21.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 5/5] opengl-es-cts: upgrade to 3.2.12
Date: Tue,  8 Apr 2025 13:20:58 +0300
Message-Id: <20250408102058.2769630-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4f896 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Pv7GC51KzH2K4ZR8rDAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: dgbtcQHXcEoi0i2nGgxc7PxSFNSLFknD
X-Proofpoint-ORIG-GUID: dgbtcQHXcEoi0i2nGgxc7PxSFNSLFknD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116702

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


