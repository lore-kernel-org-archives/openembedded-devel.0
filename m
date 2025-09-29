Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DE2CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 02:40:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.45261.1759113635928108213
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 19:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B/2EOGFK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SLkwBx015845
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VzJsWR+TnKo
	Ctwcl90pdeLMM+feCmGeKf1NrahxamJE=; b=B/2EOGFK5IuIYxTewHjmdI6zyEI
	SojGeKd+RTxQSsZEiNb28DBRMTgNvJ5vNaYDUqyrta/KrHF9Y7dMyfOQZBWOZ7gx
	3KqtNQg0vInQGZZNAFKNc1K8YLG6dyqox2f0LG4vnxEfVBVt/AFasZb/+b4kiM7N
	thnJ7tXCwYI54ZIeMQarAOv/65W7ojQosSFDMGSa9+DKbG5DsgXt3K4+pN2wjQiX
	V4DaKheoQQgjMrTgyDB/U2wYSbB2/awdy4bs5VrfR8ejpHPQw1O0NjUHBBNclL07
	Hoaj7/MR1TNen8aKiI6F8GMYBkDmoCovyuYOiyq9WzgJln+nwrMd3RNhhpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxkmsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso64828751cf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759113634; x=1759718434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzJsWR+TnKoCtwcl90pdeLMM+feCmGeKf1NrahxamJE=;
        b=NYvzPRViUet+rU0m3YIfbUW5lmjU11xc9hr0Nsh99apJQqf7kFs2ZqlaB5CJ79JU5b
         BCCDVWKWsAjcXJseLoK/4S74IRJnwDatVsFXnG2RjeHa+HnAJ80ikXD0+vM1VwUsEfKX
         1jI/xodU4Ar9XiPpirgRh1Ms2UjN8qYIp6I3YTrMlxolCPTcLYGVtZstxz2HHYQmQuN+
         did193gzu1ubxxV0+ohfyNHvfPs968tbwxA6UqEDRbmRbKMlp4xpNbfWLEhJhMkvsKDL
         WV4JrENmNVdeQQTmhGu8SRZrnAL0g/XgvQ+7ODpvZPGmZKyOS5gpuIkBV557KyV4Twmm
         QZwg==
X-Gm-Message-State: AOJu0Yx4SoVNUFkqqRnvbNotf3DZkmLbLzHTs8Io9v7SriWHtCwbxTwq
	B7a6kzn8YwxHgIsH1QQVkCjZ+C7AjmMDmP1F/neLGelpu+QE9STgXI/mKvRmsNZqI/hn6GsNMcp
	dLYXSG87UHTiKDAURo/EjuF6dgUxv0hq+2Pax6MAHmfHAUoBLEH9H7RcRK5AroTz/3c1zHyesp2
	GEs6rzxP/GdCuwd7Sf2a6lgg==
X-Gm-Gg: ASbGncs8ctBTZZc9lOZrteTXxcbsLzU9OU2oYLZqIdweXW9K+AhW0G73amWRXJN3zuV
	Syem+PCsxkrV+o6Gvixxbe4o8vOyq1P1U00N5UUH2Xkhxqy/9lqteBmeWINIYztpQtugP6+VSvS
	ioFhPOTrY88ZHn17M2UEIjCGzQz2OrpAJrmdPO933v+Q9KSbFK94oXBcmldfCSy3Mz3GdKe8ged
	LnKbVfKiyeiLj1XPS0bwlxQFMtYizM8K+PotEDjen6MTaOxdGiwgefQVeZ+zWr0O1QjLsA4P4HI
	5zSIY6VYue03eoJTJZ5OSxNwcY3Q0vtFmET/ILsV4UzmDqYOmQpJPX2FLRPDy6wS8yyd981llCt
	cLVKWSQTwZedhrB90MPAaj8hHNoJeWkxVBuaFMfxL6OYGPPBy1XAv
X-Received: by 2002:ac8:7d8e:0:b0:4d0:7fc9:5c6 with SMTP id d75a77b69052e-4da4b42cbfcmr194801531cf.50.1759113633822;
        Sun, 28 Sep 2025 19:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmJIaZTWlqIHmi8NNzHGWyWmSnQivywilXTNPCCiIxpG+k7Qh0p7i4Qw+2eVSNVisp/zrPIg==
X-Received: by 2002:ac8:7d8e:0:b0:4d0:7fc9:5c6 with SMTP id d75a77b69052e-4da4b42cbfcmr194801401cf.50.1759113633232;
        Sun, 28 Sep 2025 19:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5882275f1fcsm306591e87.98.2025.09.28.19.40.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 19:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] opencl-cts: build GL, GL ES and Vulkan interoperability tests
Date: Mon, 29 Sep 2025 05:40:24 +0300
Message-ID: <20250929024025.3210337-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929024025.3210337-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250929024025.3210337-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xkOjS75HNNGUcU5rQMNrllza9vu1CCW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX0X1nChCqVTES
 89qWciKfibWq/RxkQ2knJx47eUgiFDt+PshlZJeuLh1yyRrPOUDOAqUxThcWugyqxYceQ1PvQfy
 H6DBxV8rsxxXg6esIgseZWttuRrwSFqAYNEfMu3ADN9h8upLFwfhUTsKq6dyqCpIYG82j/pkEgr
 3QXl68R+FPW4vKxsPV7iJiYI3yIL5+8ESjpQK6SpTnDn00gpJmna8VE0svRLL6dY2D/RHdcJqie
 EQatuXZnNf3UCiscby8ijot4hsZBrBYhRc/lTAGO6n38a5b9gYhG9oAjK29mRFoUarjkENPJxIf
 0hmjxwha4CVk13AUNo4z8S4cOecBehBfRLV2GUZTITHfcZ5p1UC/T0I35gd0EH0t+7YkLkik8fD
 d4T4Ueq8eb/Hzt9GpJgAPYRk8Ae76w==
X-Proofpoint-GUID: xkOjS75HNNGUcU5rQMNrllza9vu1CCW2
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d9f1a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=zPFEKynZ1-hjiTKKqzcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120005

Follow DISTRO_FEATURES and build optional GL, GL ES and Vulkan
interoperability tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index ebf83d1a1a2d..fe1d6075e27b 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -18,6 +18,14 @@ SRCREV = "e96edaef8b582c2412a2aab4b82f5c88af88617d"
 
 EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
+PACKAGECONFIG = " \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
+"
+PACKAGECONFIG[opengl] = "-DGL_IS_SUPPORTED=ON,-DGL_IS_SUPPORTED=OFF,virtual/libgl glew freeglut"
+PACKAGECONFIG[gles] = "-DGLES_IS_SUPPORTED=ON,-DGLES_IS_SUPPORTED=OFF,virtual/egl virtual/libgles2"
+PACKAGECONFIG[vulkan] = "-DVULKAN_IS_SUPPORTED=ON,-DVULKAN_IS_SUPPORTED=OFF,vulkan-headers glslang-native"
+
 SECURITY_STRINGFORMAT:remove = "-Werror=format-security"
 
 do_install() {
@@ -25,6 +33,7 @@ do_install() {
         cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
         sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
 	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
+        find "${D}${bindir}/opencl_test_conformance" -name libvulkan_wrapper.a -type f -delete
         find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
 }
 
-- 
2.47.3


