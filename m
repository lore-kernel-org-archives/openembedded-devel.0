Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21700CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 11:57:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.7016.1761134255265456146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 04:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EyWoSoDN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8roQ2024879
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 11:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yw3QQtBTDhBLt03sCdquGK+tL6kiPe5sJ0z
	YZ/Dmwh0=; b=EyWoSoDNx528w9RFxsrUEDlflDc+C6Juxp9MXSyVlCuMLFuW+WL
	DLumfEBqj1XRCexeYwmhCp1rM7+7gTH6T0K2a+yHJlqWGgtd9T8Vm+BijjlxlBeh
	EVRNuePl3abSNEVCXsNGFzx3D9DKkyRbq3V+/bLuv9BwsplVu9QrdkZrDcLxpbVN
	zoY+Lzg1RpvQLS3GNKU0ItV3HYRkl+AayKXkTeUa3x9pUOexw4CnxDgFip33UhYw
	EzcnRVBMXZkSUapXp+TlWKnvqc/pkIr4mCyxe5f0xkuu0wnSGEhatqOHsYF5eef+
	qDsqaxMOMzryz8U8f5fiblUiG/lJkPyKmIA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws6wrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 11:57:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8a89c9750so34268881cf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 04:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134253; x=1761739053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yw3QQtBTDhBLt03sCdquGK+tL6kiPe5sJ0zYZ/Dmwh0=;
        b=arg99LTvPQgZLUfJxQ/aL6EFzMVYeKVhijqqJZIBJWjcZwff3dRTP6CmRE4k2iLsGu
         5s7Piv4tTd5pv6vtPrKwWCRywY3NmRj5c4l6DzuLcRsi5010X3B7n+6MIM7qV4eErJaB
         +Q9unm0aMjQhXsZnSYLdtPgzeo7JCCsNlt8C9KgeCZmMifWjN4aoqWa4ONtyqj6NuXPt
         YP3rmHX4KX5m81qeNEtSMZKYmYy8vCo3FYEV4YNpfukNWPXumMvCWKm7fSvmVSickypZ
         pSkqQ5wIN2u57nnlntZ8mYJsuw4lWDcCGvKRQ1PDaB6ucNqU1o85KKx5hc1aILQ0zexE
         3XFw==
X-Gm-Message-State: AOJu0YwY0qUw6EseeLHKzIakWPIXMKhJu92ijUW+0UuLpNE3MgbiIbU0
	F5BftFgdrtV5w9Il/Dv7u1rW0MeYMCueSAVLSoyPxZajtmQeHL2UQTBuLLE41qib5/Bk22bJtQh
	J9dGcuk7xB3uG1GsilymrKRQSobAIgmCjOqnjsI6rS69vUjhmpoQZfIrJxjSWH92JR6UN6zQk7I
	fYE5BUV4Q4sLzCs6SC
X-Gm-Gg: ASbGncuCBW8gvthSZhp2cXfdEKuiangzm1vjeqX2/Bot+QI6Y9OFoQIOavVi9j5oNbu
	NgqyQ6ahKJqTpP4IpTtgrPnAltGCkwK9m887k/cyPwYzcBRJ5Ow/1gF8dhcwcbB4dtbZ8ykTKNs
	Zilx9J/wQ6B9eV350wvBo1ixoOpEb3cGHBdMpnsvfNUJgUbz5ddp3DRFUMSBu0bSpOBTWGtK2vi
	OKqAr7k0WdWGfa0KqPuux/WO1P8ehsAECvhxYkLyV3mbgNmUhk+ucmgZHbnx9hxtE3twgJfhVyG
	0OHzTmgO3cuiphN6Rt15NzfC9G63oodtkmlUJlOTkajlSiN/W1Z/1nEc4Dxqp1FCXLujhSFlkFV
	tgxa0ilz0q+6VWzPgVKKH5zrNJE9eUDiQrkSVTJKF4mmARnipTuocqoCSd4mDAACCGs39KLH48a
	8LRLwXhPftNx8=
X-Received: by 2002:ac8:5908:0:b0:4ce:4a33:24e6 with SMTP id d75a77b69052e-4e89d38e3c4mr233573511cf.58.1761134252961;
        Wed, 22 Oct 2025 04:57:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmD/Qo1uNq2SSzi79qNfAfjcCA/Gt0R4jC1FOdtQxeEcNsrKnaOSTiTq9MlQHTmvCahrLcgw==
X-Received: by 2002:ac8:5908:0:b0:4ce:4a33:24e6 with SMTP id d75a77b69052e-4e89d38e3c4mr233573351cf.58.1761134252293;
        Wed, 22 Oct 2025 04:57:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deea8c82sm4612878e87.18.2025.10.22.04.57.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:57:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
Date: Wed, 22 Oct 2025 14:57:30 +0300
Message-ID: <20251022115730.4037373-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX08Nn/COubjHO
 OYPphuRqKLKi5HsoRsebPGx7dy4BvoYOL0GiOCVDFm3CuV+/JGvoxWMaVS71OA/jwt2cRcOUGdZ
 5ZxWN/T7AKP2Xzp+UHXSAGNhc+CW9pwevzHNQiJp3yXWkEG83FwVltZMmOuA4qZi5fYDkA94jqW
 YTsMSRIQfuW111SpuTcQkK3Tb4v30KSsOjPvKRImYIQEFal0cg3n7QFXVwuwWSkV5tpmH8KtJ5N
 40h8qD/qFza5HhITsHG1WVwyOXn9g0SuqpmbGZyrff4G2y2D+ae1VTvWgjtgZE5J/tFfzzOwkhX
 Uim0ywOXkC8K/EtBh7jVT+YXz86kfr4MwkOeS8p1SoeXc9/WIexqjrOeyQ+xSQxyuX4UXiQqwkA
 9ObN0mrbQdDuX18GnwVFTgCB7xPNWQ==
X-Proofpoint-GUID: H4ABI0tCDao_u4DOgxUCVDUKR7UI-kvo
X-Proofpoint-ORIG-GUID: H4ABI0tCDao_u4DOgxUCVDUKR7UI-kvo
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f8c6ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8
 a=EjVv88qjo4-Qy-FOEYgA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 11:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120894

Upgrade Vulkan CTS in order to pick up tests for new extension and also
some fixes or old tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...01-decode-fix-build-on-ARMv7-targets.patch | 33 +++++++++++++++++++
 .../vk-gl-cts/vulkan-cts-sources.inc          | 15 ++++-----
 ...n-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} |  4 ++-
 3 files changed, 43 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} (80%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
new file mode 100644
index 000000000000..d8680a292b38
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
@@ -0,0 +1,33 @@
+From 16d72de3280410b185f33e489727761096a2e6e4 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 22 Oct 2025 14:34:22 +0300
+Subject: [PATCH] decode: fix build on ARMv7 targets
+
+Building NEON code on ARMv7 fails with the following error:
+
+...../src/NextStartCodeNEON.cpp:39:57: error: cannot convert 'uint8x8_t' to 'uint64x1_t'
+
+Add missing vreinterpret call in order to fix that error.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/109]
+---
+ vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
+index f1a3381d7122..2c695a924ebd 100644
+--- a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
++++ b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
+@@ -36,7 +36,7 @@ size_t VulkanVideoDecoder::next_start_code<SIMD_ISA::NEON>(const uint8_t *pdatai
+ #if defined (__aarch64__) || defined(_M_ARM64)
+                 uint64_t resmask = vmaxvq_u8(vmask);
+ #else
+-                uint64_t resmask = vget_lane_u64(vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask)), 0);
++                uint64_t resmask = vget_lane_u64(vreinterpret_u64_u8(vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask))), 0);
+ #endif
+                 if (resmask)
+                 {
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 6a8d781447eb..a40327869958 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,20 +6,19 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.3.3":
+    if d.getVar("PV") != "1.4.4.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=f06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=963588074b26326ff0426c8953c1235213309bdb \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=112aee75d162412a4623e7d22a3de52e0233cbf5 \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6ae58a2b17b2bcebdc5377995007391b85ffa10f \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=b8b90dba56eb8c75050a712188d662fd51c953df \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=38f6708b6b6f213010c51ffa8f577a7751e12ce7 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=97e96f9e9defeb4bba3cfbd034dec516671dd7a3 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=9c6d565f72ba6929c239c3e20f90b6375acad3bd \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=68e4cdd8269c2af39aa16793c9089d1893eae972 \
     git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=a22e0084e6f38a16dc0dcebb4c19a14651a6665b \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=56a40ba4199e5500b2a7540c15dc139fc4b19595 \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
similarity index 80%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
index ca653aad132b..465ac981f90a 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
@@ -2,10 +2,12 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "f36967dd19034bdfe30e5cb21544079078c154d1"
+SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
 
 require vulkan-cts-sources.inc
 
+SRC_URI:append = " file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src"
+
 # Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
 OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
 
-- 
2.47.3


