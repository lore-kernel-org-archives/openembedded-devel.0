Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F8C3ABBC
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 01:22:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1839.1746840169733748194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 May 2025 18:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j4VFCKQG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54A0wLb6009384
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uzngiLqWION6Idbz5ngSbyN4o+5YE9zHSP/
	T/2hrphk=; b=j4VFCKQGUBP4igA5KDE96ptDQpn/V6r/4DtfpIl2ISbahLHx3JA
	fLwTtt6SVA39aa7RqC48UEP1p27ABk/Ft/hEiN+uynqW0SozPjVyH/SLfiKPORc8
	4Qtc0fjhH61/T7Hp5FMrAzSWDZwYGpX1NngsMh6ahMfimqf9oBNlNmWkj2ZDAtYT
	pYJ1NrVmlrCCFRoWwVoyYFIE8tAg7Ui3ec3ynfTbZKymIEeHsHpcD8dD8lSrdj1u
	moLEazEn5EP+XjgjF4EDZgObSMvRb9X7GV3QgSCs6BMHmTRkHOMYHLxNqUUw1m7o
	HOi2kAggt0rIEDAKE3LwwjyEoHBY4RzeGXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7e948-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:22:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47693206f16so52259681cf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 18:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746840167; x=1747444967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzngiLqWION6Idbz5ngSbyN4o+5YE9zHSP/T/2hrphk=;
        b=p7uJKAOL2V4WORxMS4VPbsaNKVF+/79xESVzC2jmq4i8jfKr53GvBJ3hVCoQHzwfzU
         naL0sw9VmGwZgmE6rz+Tnnx2lhIoQznY7qHIE4S0hYSjDz1cney4k8yVW+kJZws31IUN
         xZj9mwxQvMpBRed3KPO45uLFxf1NoqcGe0yxibzV5qelVksPMnS3vBmbdE0UbcAmMfsW
         we6KG3xDmUahn0ihT5FwT43UyJRO2LYGdeMSUUA3ix0U2pN/23wu3b9NEXNtystm1inD
         pn23iHnXyZnV8C9qbv7r6bKVWRKnuQzqWgwjSMM+FXI+ISjEJDZh637uf1eXo054JV3v
         VFsg==
X-Gm-Message-State: AOJu0YzMcIR25LjQV3yZoHn8W6+LrAOJkDSvDYeiVu7gv6P+X0f66Srx
	FuQHh98V0BKVB9SP2fuMrb2YRtcXUrHZl8lK/PBvfqsxBAacUa5Tp2iqGzKdE6/LRNnuRbPtw0n
	EJuO2v5PZFHbB1q/da+qFgb76XbY1QM18YUgJOjR60wH6l93HMZz3jP/u5w6vh0Yl6OWjtLIoDN
	H9hCjsPbXnN+UD
X-Gm-Gg: ASbGncvHMBeeV+C8/JziS4jOMvpr0bSQFwUV5tyb5MyZS4bFuqumDozRg/pLyIjJ+Va
	u9DzX3XV47SKTkWp84e22CvW1tEZFr4jsgZgJ6PQ52KEaWfZdlgvmUTvZt3Wa8kax0ShOyjk7oy
	L4SpLfumh+qqWhSUzPL8dOTu334itt/gOXlntqRdrBHBv3yK+choMd5u6+ydNEKU1x4q9hRbAtr
	SdEr2xTeUEltTwSxqU2SIwp3h2QYlCSlVzFP421uA2vjjBUBuXbTqMi40pNGbJYjfxfS1sbHc4w
	bIsyCfpNNaVjNpJYpLoZLvq+jzDZ7f0FDSblLiyaB7zFSCyvzncsLvAz6vFToEyEL5ToPBH2/OF
	ntVwa8rNOgn6v6Rh3m8aZYKMe
X-Received: by 2002:a05:6214:1c4a:b0:6f4:cb2e:25cc with SMTP id 6a1803df08f44-6f6e48098dfmr100386096d6.32.1746840167333;
        Fri, 09 May 2025 18:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1MhCDhNos7l3BiMvgw7IXj3VWrSpukWpE/IgMK4XdgCcIRCVUEx8jUFigJvoSi/mw2wuc6Q==
X-Received: by 2002:a05:6214:1c4a:b0:6f4:cb2e:25cc with SMTP id 6a1803df08f44-6f6e48098dfmr100385656d6.32.1746840166732;
        Fri, 09 May 2025 18:22:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fe27sm453104e87.43.2025.05.09.18.22.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:22:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vulkan-cts: update to 1.4.2.1
Date: Sat, 10 May 2025 04:22:45 +0300
Message-Id: <20250510012245.3020861-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDAxMiBTYWx0ZWRfX3ZJEgu9s6+AB
 NVsQdeZit1DB0oSofUI/Baxy5ahl9MKz+kThb9jdLHJBF7siVOtbk6S63qBI93CMCqKGgC8E9Uz
 gIRL8wBPzRJth7meOpjQ3of5vsxg/Mfyq3ovKj0Cn1/Y8T9n9Vq/+8MMznvAn+d8LlHACu6DD3W
 zwjro2HIYfDNsM8get/gk+sA5E0Yhc9uR1bCW5EH6m7MCpkz5xvSOhk1BjV1eAn2+Tskm8R6VW2
 kC/K1ABVM8jPO0WXbDlAkrBPg9SqPOvRnN01Xrmz2MJsk9udhQwRwqURgv3QXHU9gWQqPs/zzj9
 ievOiV94SUWjh9+JKwdSdL1PClrREebeZpDl7MmUl7rAHh4aFFjI6S7naqQ8toskFI1VNuKVQKB
 gyQ1HslgTO8wgfYZMxmnRjBoQHJLCYL7IhAkLYvDgeFAs5dOZHr34hlfOXwk7Vf6cy9pidtW
X-Proofpoint-GUID: 89t1Rj2VJHtHLkFeW7Y6FUVf_PQqd2IL
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681eaa69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=NeeP0wBvZ7TV7m7FpH8A:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 89t1Rj2VJHtHLkFeW7Y6FUVf_PQqd2IL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505100012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117379

Upgrade Vulkan CTS to the latest release, 1.4.2.1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../vk-gl-cts/vulkan-cts-sources.inc               | 14 +++++++-------
 ...vulkan-cts_1.4.1.0.bb => vulkan-cts_1.4.2.1.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.1.0.bb => vulkan-cts_1.4.2.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 8c2a495dc8e1..45b946471173 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,18 +6,18 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.1.0":
+    if d.getVar("PV") != "1.4.2.1":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
 SRC_URI += " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=3fb52548bc8a68d349d31e21bd4e80e3d953e87c \
-    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=3a2834e7702651043ca9f35d022739e740563516 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=36d5e2ddaa54c70d2f29081510c66f4fc98e5e53 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=c7a3955e47d223c6a37fb29e2061c973eec98d0a \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=902f3cf8d51e76be0c0deb4be39c6223abebbae2 \
-    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=1ec5e96db7e0343d045a52c590e30eba154f74a8 \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-tools/src;rev=3364b982713a0440d1d342dd5eec65b122a61b71 \
+    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=git/external/glslang/src;rev=1b65bd602b23d401d1c4c86dfa90a36a52c66294 \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=git/external/spirv-headers/src;rev=767e901c986e9755a17e7939b3046fc2911a4bbd \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-docs/src;rev=645c59c70e826d9738b6bb103316c03d887dfed3 \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-validationlayers/src;rev=6cf616f131e9870c499a50441bca2d07ccda9733 \
+    git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=git/external/amber/src;rev=6fa5ac1fb3b01c93eef3caa2aeb8841565e38d90 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=git/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
     git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
     git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
index 8a2e92892928..abbd026047d4 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.1.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.2.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "fcd9b1cf0048e0e960241dfb76e14a1ced8dcf7b"
+SRCREV_vk-gl-cts = "644f10ca39dea3b7d9dbadaa75c56206b499a520"
 
 require vulkan-cts-sources.inc
 
-- 
2.39.5


