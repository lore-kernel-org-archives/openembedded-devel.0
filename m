Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A08ACCF9E1
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 12:49:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8199.1761137391948897266
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 05:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aMiW4cfs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA5oJt020325
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 12:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oHvhP/t4fKT+yg/dhp0beaVMo3X+QZxYiDa
	579IGFl8=; b=aMiW4cfsLguQ/5FkRu4wc4EqZGuh4FE3sHCJTMxPpuYGrpUmxoo
	gpkBgH9Y1SjV2AjAl+58rSh6IPeGgcMvYo2Rxaq+LJ7O6tL4PIKEWp++/R2+e1gA
	RffKIEnHNcfigyWlhdT/Ys6taleQkn1O1BXqu90H2bt+rtIvG0ZAup8LaYnP1SVC
	x/2HpbUw0yMoRF17LtB5wyAsQl3wdf0mrqOigOH1IH2zH7Rb16+rGy9C4bEO+5eP
	exvMOaCY7EBIZTBBcrNfb0If/nCavw/80xAZBGJC2rx8hLXeChxL32F6PFnrN8Ot
	hJASAgpJMvjtQVCLLf9+wXu/F7S2iGkaV0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3444nvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 12:49:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88c912928so34154481cf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 05:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137390; x=1761742190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHvhP/t4fKT+yg/dhp0beaVMo3X+QZxYiDa579IGFl8=;
        b=kNL8lMcl3CDqsDSJhEs8tLlotNiOSUB6Hp6oVqfFFD8PsQzEwf1L8SIwQSiyBho/N5
         H3QkF9gzZ0b4qV95iwYyz8HGOOTJau37WEP587w9sqb2YJ+MxcQ5RuakzA7lfe0Ud3qo
         Q2S98zTY2xc8dmhMcD3H3OfFU+R/YDY6d3Mlws4VJymIgmKyivOP2mfFfWtq9x+VHmPd
         YedEFTcxOQh8Va5T9crH5SjN1XzXw+zBfB3Y0bMP0xPMn3NlZvNJ8vfkZyTvlBMhVASf
         LHSzuZPVWUG3RHU1E5YmY+inZbvtMT5aPoU5w8xVRuKblIczvvgSdyYxK3IoRQUptONb
         Yo+A==
X-Gm-Message-State: AOJu0YyTTXtsZy7o/XaRSAzYlnbvoDltwpGQSYLynV5FEIiiRebDxscS
	z1pQxHFXCPDl9DfmxhZBzyQgLC9h501gGYp8InBrs7uOehxrLzIHXcakaHx33VUvWLu/cxhe7kd
	ocUrjEk2DU83pLX/eAZD0CbLrjmVfBr7Ml54JJ7mamFNhQRZvKa6ZrIlrdz7uOZWXPjOJpq5O4C
	34FLLWMzQMpBeV5Z+S
X-Gm-Gg: ASbGnct3lEtongHVuQGiONN2Zt5oyQlGQgBkeP1O7PZEKkuIJ04B05hvh9hsOR3goYi
	3bWYfhvBUhm8oqq/zmjYWyFEQGooJYVcNIQqaGOrYkRvuIuPrPwcVhPzyNTkiQlo13oQAugjmm5
	LhTsGBxc29ZGgg60eJwsYgkGLzhp58uTFddz+JJkGDoRPCwHsmr4k3jqLfe4MiCK8jK912aFIW0
	YZLdW0L1qlc8o8n0NE6VsSK/BHpyoc8m+UOUaxTPXzKETgIf3OfEMm1hFoMY/c5PXQ79LSagM/i
	sLfug4TM84yVx2YOh98Bg38LYCLt7BJz9klOhf5ScCnFP9CqZU3BXAFkMZhnluD9GiHDjx1LxO7
	au/3IXUmZpEhuzpx7DgcthRDJEA0uSOb+A+qDzJFXhHt4BDDktIUXtVAzxphyHhlJRrqWmqwAQa
	ifWTZGOjhklXw=
X-Received: by 2002:a05:622a:4a19:b0:4e8:a33c:f336 with SMTP id d75a77b69052e-4e8a33cf60bmr242313411cf.39.1761137389913;
        Wed, 22 Oct 2025 05:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG45PmHFKavZA98NGQ5pvwsC0XNdRyfTe7CR94cxUhrzXK1RmNy2XSry4QnCf3XQ1UkClxyyA==
X-Received: by 2002:a05:622a:4a19:b0:4e8:a33c:f336 with SMTP id d75a77b69052e-4e8a33cf60bmr242312911cf.39.1761137389368;
        Wed, 22 Oct 2025 05:49:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1db0dsm4648710e87.92.2025.10.22.05.49.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:49:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencl-icd-loader: upgrade 2024.05.08 -> 2025.07.22
Date: Wed, 22 Oct 2025 15:49:47 +0300
Message-ID: <20251022124947.150895-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nnN3f6eFlP62hBYs0jx3foC1RaCU9-VI
X-Proofpoint-ORIG-GUID: nnN3f6eFlP62hBYs0jx3foC1RaCU9-VI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXy6fCWh4PFOqp
 eYBHLMATVrj6o0HSqOyVpfqGAjCgrZw0rp6CQPpdkDB7vbhbrTDGG5CGyBALMf2cdPrTBsIJO0J
 g2f3KlcT+BBP/pPyReeFHAAcOuPaKoooc/jqlPsSCYz+PaWDb2hCUzOov8fphf3qIY1BmykmjOJ
 l4AiN5LMIuj46TlfoDL/JLznzI8hT9SaH59Q8YguEXy5Lkr1jQRvtZ0b1q5PRNEU8/oFqhewowO
 hHG/1v0Iv7oLJ4KMHnh6Kugl258T3+K0ve5rm9v3JDIE5Ryjs8kzy155SgLKViyIm5/KT8d+8bK
 AUUrGtpx/hT7/d3+vP6p+F7GV9Pst9R/V3Pgezwmpf8kgROZZeD/nQW9LmS4cecZ8Lhspv8r/O4
 a9q/wG8H1oXs0Gz4qP9osQefBv4l/g==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f8d2ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=V9ob6touy30WmN0JNgIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 12:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120895

Synchronize with OpenCL v3.0.19 specification.

Note, the library version went backwards, from 1.2 to 1.0.0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ader_2024.05.08.bb => opencl-icd-loader_2025.07.22.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-icd-loader_2024.05.08.bb => opencl-icd-loader_2025.07.22.bb} (88%)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
similarity index 88%
rename from meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
rename to meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
index 59d29e821a5f..1a9af6238019 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2025.07.22.bb
@@ -12,7 +12,7 @@ DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/libopencl1"
 
-SRCREV = "861b68b290e76d08e7241608479c16431f529945"
+SRCREV = "ad770a1b64c6b8d5f2ed4e153f22e4f45939f27f"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=main;protocol=https"
 
 EXTRA_OECMAKE:append = " \
@@ -28,9 +28,9 @@ do_install() {
     install -m 0644 ${B}/libIcdLog.so ${D}${libdir}/
     install -m 0644 ${B}/libOpenCLDriverStub.so ${D}${libdir}/
     chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
-    install -m 0644 ${B}/libOpenCL.so.1.2 ${D}${libdir}/
+    install -m 0644 ${B}/libOpenCL.so.1.0.0 ${D}${libdir}/
     cd ${D}${libdir}
-    ln -s libOpenCL.so.1.2 libOpenCL.so.1
+    ln -s libOpenCL.so.1.0.0 libOpenCL.so.1
     ln -s libOpenCL.so.1 libOpenCL.so
 }
 
@@ -41,7 +41,7 @@ PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 FILES:${PN} = " \
     ${bindir}/icd_loader_test \
     ${libdir}/libOpenCLDriverStub.so \
-    ${libdir}/libOpenCL.so.1.2 \
+    ${libdir}/libOpenCL.so.1.0.0 \
     ${libdir}/libOpenCL.so.1 \
 "
 FILES:${PN}-dev = " \
-- 
2.47.3


