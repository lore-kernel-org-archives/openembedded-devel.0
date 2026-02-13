Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9469BEF99EA
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:15:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1954.1771024554544872822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RUj7qFGt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KM/9W8Oc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DH3o472733242
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IDyRzgzCkyG
	9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=; b=RUj7qFGtQH43Y2LQHwOyZZr/LHI
	EcIKVexxgxoiEc2EXh1JpMXAbFs6TKmDH7qTNQi1gi+XEDw88rcLbC1pWjde06EW
	F+KJK/8MRF0mJhmwQp5hOVO9YCbZk4Giar4ETRXu5qGa6M79s6xvhvpbeKYzijvt
	ZvLmtWhhMChLfkCnLJ1N3qkNRZKt33bR8Lz8vNdIuWIqY2/HMJ6D+X5bH0gNcBXU
	SZfXBsX0UEK/vxksePKNHF3AppTUkAREffBT8hwn8DDCgb3hNee0SxNz+O6NngvG
	iBOhyzP7qtr0Jp3CwisBCFaHQqrin1dKXh58N32jBQCYxVwFExP3on5ZUkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wvgdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so526689485a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771024553; x=1771629353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDyRzgzCkyG9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=;
        b=KM/9W8OcxiMO8CT1voeS0LtphffYgmIVOu1e4NtrlGpJXKGmgRqC/eV4+Ux6CeqttN
         VTbwqLh//k3t4S4uGT/XwTwp5tcQCt5aA+m5BkNW1WT55HUQn6N8uwGoGGXhK2K2S/xS
         uzCAtvifCLb4N3vi3PP8u9khHq/iFkJF79MZXHjmzAnhuCuLQg34kbNK38TsfFoYQZls
         jrVKtjKJRIJzLqe9tMMcXU5fnH7gpcxbyVYT2bCJ+FismgKk23+jhzVeeLXjKvHE4etY
         66WDJAJ35494irTfP0OUJvK7UY9OA5Nfw90ThvpXyWe0UiyTs8XBbolpdtCHiy5rkgnT
         O6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771024553; x=1771629353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IDyRzgzCkyG9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=;
        b=NpilUFsliQuBrHYNjrAcnYN/G5gaDwlFYH1BF1HY/WhuFqS4cOXjS+NylHgbsA7Vaq
         NPFaaTpYNjYlhX2azttbWcmjyHf61hbnfYON7s9PyHGHULaTX5jgwS1gWI8fr5OMoMly
         uOoUaxKGkJ9nCruzG7bDQp6u7Aa7xnrL0cPRUi0ql85+zMe1NbDGMcS0TmaA5V/35Ni9
         JkOIABK7kK166NYWYZpZypy08eM7M8ngqI7GxrKMhlOSDhnigDkL/lX8P6yZveZ9aeBm
         J+fnuf1rEsfvsIMNmbg2vCxKpIwK41ue/1JtEnmmsDfKTgt0KfmajA9icFx3biONeRUJ
         53VQ==
X-Gm-Message-State: AOJu0Yxr1kmTEQdCclgPHVBUtPvcZU+Dx86UNoKiYjDZFCMxB01ALHf5
	tDjiIDUNyCtUPNItdXTZ0Oq4KkxgT8Hy2Hjp5hbETh3Zz/RZhYOk8Hcgw5lAEjrXmZvWW4/Z8Zm
	7OTM4QTL+GtYT/UfG0AIW+v6aVvtevUwv9LkOhBGSTuB2oN/XInc0/VAFzokogQOyb4EoLd3KOW
	346wyONJmwy/b2v59C
X-Gm-Gg: AZuq6aI9U2JBUL0s5ycK6OdyfIMReF7kdN/ssbnPIS4DclMJhVLB0Jpp9MUan63FaIl
	b0TNRcVrayHj6GNQA4rtPV8fgMDWRWVsBrGY1tR9y/VBWH2nWUI9QTQeweoS31gsNUQgjZ8ee4p
	qQGkeiD/uGjNqFUeheR1PxGxhDERSgJjga27XtjLGhzEcZUE7SAfF/9V+j4WktKZCFH0AYLw48k
	FDBuUpm6XFOm/kx1IDlHmGWje5k3Z5ejT24C7qJZlzkvyUoyaFTydXlFmqBYbOfTeOWKdhiJOAL
	ExGCEPtKVlkUx+cSfX6uIIgN2aCVxkq67qHnEISlvrewORFd+j3uH7xSEZr2HsE940PyeAvrBeX
	Y8GYsPQnDMSYkLRQ4RQqyuFPMIAElNN5FtJAsLWB7n9x2vveaYIWl6ZwmJ2AoxqxbWSq6+Xu6ob
	Cja8evkitdhtlgLxBr8J/aexu+U47qy+DJslU=
X-Received: by 2002:a05:620a:4809:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cb422919a8mr406038185a.36.1771024552817;
        Fri, 13 Feb 2026 15:15:52 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8cb:2b30:1c82 with SMTP id af79cd13be357-8cb422919a8mr406035885a.36.1771024552339;
        Fri, 13 Feb 2026 15:15:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b90adsm1823918e87.88.2026.02.13.15.15.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:15:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/2] vulkan-cts: upgrade 1.4.5.0 -> 1.4.5.1
Date: Sat, 14 Feb 2026 01:15:48 +0200
Message-ID: <20260213231548.543485-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213231548.543485-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260213231548.543485-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IxKvEvaHVc2ej4i-zvZGYbCbsdXI4DJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3OSBTYWx0ZWRfXyuxIE5nyPoZY
 YFk5jxDjKL/jU49M/pA0odYMNg+WMc4+Xu3sd5C1+crkLDGJNjOMMCy4sH0KHakEql6JmDhnskf
 7GYlc/2BFyDJ7HMkaeVirvrNXVG7Rftfvo+9odv2vi9LrFR0J4ZcfcuveRUMxi53Tp41iV7CXSP
 3GheCW2ctzXobswd8yLK6tknUm521ixuL+xKtT15rw9y0nBywqea45+SWWKPgS/S+zDjAQfGgmG
 tzDH9IJBfAMSWVnrD7YrmhxQpZok5mSmxpbvC/bIuWMSar1B4eLCiCiIoKsXmc6UtXjsU7fGapM
 veu8YdDsuGaTVUfKsoZjXXYYV8EDCy6eAkL67pU4YnG48A+f/2EdLu+bPpGSojZSK3alLm390SI
 Ds9DrhIl00Ik9Be6L1GQjc/Mv9rgZHg66d8I/m8DAjZY5FP0gUCaOHS8BheX0Ymas2+FJeF9X8v
 JVsQ9w3qTpgDUqR0zoQ==
X-Proofpoint-GUID: IxKvEvaHVc2ej4i-zvZGYbCbsdXI4DJT
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698fb0aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=6r3AYOCa_0SeUzyjCW4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130179
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 23:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124398

Bump Vulkan CTS revision, picking up fixes for sevaral Vulkan tests (and
updating VVS to 0.3.9).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc     | 4 ++--
 .../{vulkan-cts_1.4.5.0.bb => vulkan-cts_1.4.5.1.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.5.0.bb => vulkan-cts_1.4.5.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index cf1d24f637a5..52116c8ed724 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.5.0":
+    if d.getVar("PV") != "1.4.5.1":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
@@ -19,6 +19,6 @@ SRC_URI += " \
     git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=0a11cf1257471c22b9e7d620ab48057fb2f53cf9 \
     git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=9482448393f3f1f75067cc6ba8ad77fda48691c6 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=823364b0c7abdc4f4e39418d3dd9dc11623ef146 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=aaf915a0e08d679d1e8b835c30e6a346ab0c7ad2 \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
index 34dc10e44dec..cd5a66fd9fc5 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "db74f486c9d0594bc997f8f79521b424708ba8da"
+SRCREV_vk-gl-cts = "7b7c6cda940bec82d1c5a8c39048728d9bd32f39"
 
 require vulkan-cts-sources.inc
 
-- 
2.47.3


