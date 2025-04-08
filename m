Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9A7C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.71409.1744107666614979188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Wa+aCS0V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GZAd020241
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Apr 2025 10:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TiVzIldHWbO
	KRQnWISd9YgfClyXwaKJvZXYsUoTcboI=; b=Wa+aCS0VnVRk/qrEPLj7Uzask9e
	YUd9ha//dRR6oh8LItVeSJWZyOcuTICRNwD0LdQj4hLnChJy7F9F0lE1d4V8LMiX
	nr94wAZ93YcrIgBrWguqYlLvhlRhYCPSJ7aal+5yfn8a1gTbSbLWDLPsqWD/UGDL
	nexXcfvC1rS37IZev3JMeaxlS0gHrdVkZgp2rYWmtnHXS1jExuytIrVEmnj+Mrh0
	nzTNSl6SjmduL50YDl0QQe5ltrpKEwiTF0HcBD/AE6oRmEINVrfRLfUndGtKNJK9
	2fzgQ9r+utla2p9eZAmePa9wWdTy44FHtIlfknh2gXdBMUybVRoAzj/JigQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2qd65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so1173182485a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107664; x=1744712464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiVzIldHWbOKRQnWISd9YgfClyXwaKJvZXYsUoTcboI=;
        b=ka5psRt7k1afRnCU9/ER5Ew8/Swy47UBJgjzc9F5YjD2/wWZqMfzudJ0KLEyuJWhdE
         FLp4X7M6nDGxC/xGL5oqnAJB3gXuBsXdfAEBfTPSU+xL2Zf8nzpyKxGKqhelF3Jlf7Ta
         2QHCpuzNvVdSrrdlCUE/MqQuWVLULcHwx/E/7/Ys79/dKHhwuiindkXzXmBN5jMDklag
         ipr3qDOztQEFbdGPW4cG0sdKNoGf3jIlXWLCPxp5D2jvDgVCJU2qDCFi7w+UiddTViSG
         82PBYYujhdWLsnXBOjnVcZ6eob3jXFX+UlFgB64TWrZjOQlkAboaOzm24ZObmtx1vc69
         1Gxg==
X-Gm-Message-State: AOJu0YyAH2GsqQnJxlUOHV9+G0wlubyTw1ebL3Q21a/K0p81QPop7I2T
	dXjkPu6tRIRpLzp3oEDJiMY9yyHLVU2OMN4EheGw0iuLnjyn2jtZ6l7AGWJZ0X7hCmX1lVNz3AL
	qmYI5NNgzjSYylhRVxrAFjlHS7cz/RJV3+pOL8nsaL6YPA1P6Rb5T2FLjl8tFv2B5872qgw8sNK
	XtqaFPwleJTfNV
X-Gm-Gg: ASbGncsbjjXVj3g2ZD28KMzSWtLqISMjwtOYsCX9GNpO9IRnvzShgiLwXzXzuBGDgwu
	/nV451tiLg/p7Gy/GigAuCrwhJHz7gJ0cgR6sRMTAiyv77UvVRfYlaoNO6rQpcAcrtLeKKsit91
	PQTPZjHgcoJW8GUyZKxnugAooLZ+aSwtTNj4ECydTRu7RV+0daGJUVXrLu7D88hIkAdyfiiZyKw
	wwlRUp/ggakpC2XLUvauAx7lOd5rATFCJdPMsxYdn9DeZswpDT6NSQ9XEIpfYf72nDxihR81VCi
	L05R1RWsVIniZTZ4BE73kamAdaJm7B8pVKqf6y4lvO9YE3hP4JPyC6fx8tC+55Ully/Xo0Ti3wM
	GnEN8WdPSLrbEy49AkYtntnzmrPy5
X-Received: by 2002:a05:620a:390f:b0:7c7:56ac:1e89 with SMTP id af79cd13be357-7c774d272abmr1954829385a.3.1744107664654;
        Tue, 08 Apr 2025 03:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNoXrf/25wL0q+JmZeg7hYrNdc/C6ROYm8Ct1ynfYYC//mNVQyuIzC0nunvJ2lvb4ydcOE5A==
X-Received: by 2002:a05:620a:390f:b0:7c7:56ac:1e89 with SMTP id af79cd13be357-7c774d272abmr1954826985a.3.1744107664234;
        Tue, 08 Apr 2025 03:21:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65cc20sm1482588e87.165.2025.04.08.03.21.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 4/5] vulkan-cts: upgrade to 1.4.1.0
Date: Tue,  8 Apr 2025 13:20:57 +0300
Message-Id: <20250408102058.2769630-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250408102058.2769630-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0ItcVm5NphlepZ-qKjF544BY2IjfAuWk
X-Proofpoint-GUID: 0ItcVm5NphlepZ-qKjF544BY2IjfAuWk
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f4f892 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=rbTn_qwm3XPgJNpUFxQA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116701

Upgrade Vulkan CTS to the latest release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../0001-use-library-sonames-for-linking.patch |  4 ++--
 .../vk-gl-cts/vulkan-cts-sources.inc           | 18 ++++++++++--------
 ...an-cts_1.3.9.2.bb => vulkan-cts_1.4.1.0.bb} |  5 +++--
 3 files changed, 15 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.3.9.2.bb => vulkan-cts_1.4.1.0.bb} (78%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
index 774b7aefee04..5e19ed2db392 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
@@ -65,8 +65,8 @@ Signed-off-by: Trevor Woerner <twoerner@gmail.com>
  {
  public:
      VulkanLibrary(const char *libraryPath)
--        : m_library(libraryPath != DE_NULL ? libraryPath : "libvulkan.so")
-+        : m_library(libraryPath != DE_NULL ? libraryPath : "libvulkan.so.1")
+-        : m_library(libraryPath != nullptr ? libraryPath : "libvulkan.so")
++        : m_library(libraryPath != nullptr ? libraryPath : "libvulkan.so.1")
          , m_driver(m_library)
      {
      }
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 1f54282fcbe1..9c95aa4af7c0 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,18 +6,20 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.3.9.2":
+    if d.getVar("PV") != "1.4.1.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=4c7e1fa5c3d988cca0e626d359d30b117b9c2822 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=2b19bf7e1bc0b60cf2fe9d33e5ba6b37dfc1cc83 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=db5a00f8cebe81146cafabf89019674a3c4bf03d \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=7bb606eb87cde1d34f65f36f4d4c6f2c78f072c8 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=f589bc456545fbab97caf49380b102b8aafe1f40 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=0f003c2785489f59cd01bb2440fcf303149100f2 \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=3fb52548bc8a68d349d31e21bd4e80e3d953e87c \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=3a2834e7702651043ca9f35d022739e740563516 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=36d5e2ddaa54c70d2f29081510c66f4fc98e5e53 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=c7a3955e47d223c6a37fb29e2061c973eec98d0a \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=902f3cf8d51e76be0c0deb4be39c6223abebbae2 \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=1ec5e96db7e0343d045a52c590e30eba154f74a8 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=git/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=6821adf11eb4f84a2168264b954c170d03237699 \
+    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
+    git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=git/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb
similarity index 78%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb
index 6c0a07b87379..8a2e92892928 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "24c1b1498ba4f05777f47541968ffe686265c645"
+SRCREV_vk-gl-cts = "fcd9b1cf0048e0e960241dfb76e14a1ced8dcf7b"
 
 require vulkan-cts-sources.inc
 
@@ -17,8 +17,9 @@ DEPENDS += " vulkan-loader"
 EXTRA_OECMAKE += "-DSELECTED_BUILD_TARGETS="deqp-vk deqp-vksc""
 
 do_install() {
-	install -d ${D}/${CTSDIR}
+	install -d ${D}/${CTSDIR}/mustpass
 	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
+        cp -r ${S}/external/vulkancts/mustpass/main/ ${D}/${CTSDIR}/mustpass/
 	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
 	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
 }
-- 
2.39.5


