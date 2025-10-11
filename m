Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DB5CCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 13:22:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11421.1760188937926687251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 06:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BYYjFlUY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BAfq5C011510
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R2yc7ERb6bq/ZwfhjtWpBOApjQUO4rKracn
	cRi22K4U=; b=BYYjFlUYj3wffxLbuTU1NnIdNTyub8BR9awcpqbB1Prdfyg7oKb
	n7xUrK9QABY94HaaSl1H44E+zybRglsA0oFTYgn72KSImqBGQpQtDq5QWhcUju/i
	9H3Wx0mcvLs7zcwuMy7Q5R1ynW1yPc3wKs/JNwFlhdCXFskVg4DZlHgIAdkHCRrc
	6eTCl9K3kQYfwzOOvqEIYlAyacxwAmLkD0MT4X2Ae7xnQalSSNaSslKUROp/Kf/N
	tAJVY45oeDdLKUNx3P09kbGEvY75XqFF0n7MDI7FFidiZY0PWYiPJbKOje9HkBNr
	RVP/zy7mA/zzn9QO3qdpCBktVw+TqhnwU2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0brmvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:22:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8635d475527so2199472885a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 06:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760188936; x=1760793736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2yc7ERb6bq/ZwfhjtWpBOApjQUO4rKracncRi22K4U=;
        b=J4cCLTlUnH0wRIq/4tr+aFLU4Ro/JNpDzEhXAWy35y+2pepQ3OLbxLK7TxyPzN/jrb
         YOp10XYMl8dsthfsR5/M6UcXfpTpfUBK3luKS3KCuweqGdPoZzOkxK7EOiyjsQ8eZJx7
         gK9oxn24ReAb6/EGTquGElizro8INqMjEhj/vL9hY/v6LKAnsh9uFJWcMAWr/b81kiTq
         79ZbYZmjKRZXiVUFFK2BBFr5f93hAsBXqOu9EOeK1VXaQnV6sKlJglk4cXBpNs76FFC4
         EFwzdz2ZrFMwqzs+d7206ipYAkl0sTxc/noVAuZWcVqfO/OXnkz5ZGEjc2qGEEa/qkON
         c2qw==
X-Gm-Message-State: AOJu0Yw/i5bBD4yvT3lNOMMaYeIHSYryQSMZKRYVHWBJpn+fs+fhyKjz
	4iibgHVqg6TgrLS35qTDtsK75iKC56UI47NrgoLVZCdcfMWI40jCWJXCdFTDLLrZFOtiyLUtuC0
	xiANva+QEBV9AlqHPwfFlb5cKGN9fxGBhcEBDfHezHoxh9T5JoGF2uODpRCJTWp+F+LSVYv8BDK
	nyEYxUWNmocOYLUGfU
X-Gm-Gg: ASbGncuI5yihflqdPcmjM4GYY08RaCjNWaHNwaA2kNQc+jh7T3jNf9oVqR3kmJ8Fmc1
	tyL+JzN8pCKrEqRgJetA3sqK1BvomCDfKhLSlhC3IgAhSvYGjsXnqzgrNvlz/akEPU0FrnyOrY5
	25amYstSqEZCT1ZP12yWt5p59uPXnDlJQ9heKKMgHVaiBfOd10kPpFCvuGm2R6X1RMm61uGyYmT
	TissU5Cp2FLit3248/fOnqou30F56wT2wCnop3xZ7/wWrExfZc2A30rQq4AK8zUXLlRqWDojzDX
	XtSF46zL/Xx/hHaKVeXQIE7f5dOfoVj7ER5/OTHnLs+mYMO5mOPk3k/2nsgcv2KBPEbIwEV1FQO
	s18CErEUAIKcis2uC7uHXU/UeZKTv83SaeT817IreP6/Sm7qpFTax
X-Received: by 2002:a05:620a:4110:b0:82c:b307:bce9 with SMTP id af79cd13be357-88354bba1c4mr1924814585a.66.1760188935674;
        Sat, 11 Oct 2025 06:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRGUzTz8khksPmMXyywHVQzhKWoCPLAHn+ZdXcN+4Zky0J27ne5Oe0aTJGFfvm8aiC+iAvjg==
X-Received: by 2002:a05:620a:4110:b0:82c:b307:bce9 with SMTP id af79cd13be357-88354bba1c4mr1924810185a.66.1760188934910;
        Sat, 11 Oct 2025 06:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4ef6sm1924039e87.16.2025.10.11.06.22.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 06:22:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
Date: Sat, 11 Oct 2025 16:22:13 +0300
Message-ID: <20251011132213.1704548-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pNBKHupKHAdmUhgHsFYAa4njjZvqz5BW
X-Proofpoint-ORIG-GUID: pNBKHupKHAdmUhgHsFYAa4njjZvqz5BW
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ea5a09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=jNkXwCz25oW3pTqpDekA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX6MqFSEedle4s
 7kVHnzJZPQqVGUgBM+/4hJPay7t3QhVlR1+SOKTa/dj0Scq8pYkRA2Ph3BXz+rdx7xuakwvTiKc
 wh289Xezw/7P39uHYt8M3b33J1XY0xn+MRDTlVFbjgYYxEzY2RNIL1jJg/WWTADbyX9DdjCn+SX
 zhQaNvI/xLrn2IT89kRs+hXXyw2HS93V6OLqnGHcbPi1VZ6NME7tXNpMmtelL2JRCMrMr/a7/Bl
 RW6fzHzgbOX9yZrYJeLBjL0ZuOw2bwp+oxQ3CWpt508TbWUqKrbzKDoAa81VAa8FQjbWSmHx/jo
 FB45gb587nG13FbFbKZz7iUAvPUg+L/V8KrAMmJcWdRwhFXcTZYDSWbgKV4jvS1Ep5hMgJAWZWJ
 cwv5SGR/WKPJl1VtGQRkQjM/Wugn9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 13:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120493

Upgrade Vulkan CTS in order to pick up tests for new extension and also
some fixes or old tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../vk-gl-cts/vulkan-cts-sources.inc              | 15 +++++++--------
 ...ulkan-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} (92%)

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
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
index ca653aad132b..459e1721c3d1 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "f36967dd19034bdfe30e5cb21544079078c154d1"
+SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
 
 require vulkan-cts-sources.inc
 
-- 
2.47.3


