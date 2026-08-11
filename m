Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D37CC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:13:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50736.1786439458910875372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LoqMtteo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CLYDCL7F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ashwin.prabhakar@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6qi7K3009584
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 09:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s0vzY1YVIwbjDIEXvvMGt3nZu6nIyRWSUks
	DXeGdy7Q=; b=LoqMtteofgn/JUVhupAfJUfOxK5pzIce1uuJDK8Uz6YlZFY8gnH
	R1RD2ntvpQrS+VthWBf5j2VTEKBboI20G6biPNSzqVg0Cqmgli2WiKES0o6l8we+
	iwPViF8dS9Csj/xGCVOpUIS6oZ84JBcW6LTviTWVzLsp/Q+IolqCCLlvMIf7Ai2r
	2KPpAvaawIXB1hOmaTmBtMrHDfHkTa2jhknUH20QIMf/yxXmm5l5uvdhMuPhmwjn
	5Ji1dXQvUFH1SXPWFDeGKBPbJ16H51bJpYTzw2KlARJQsotarJEzv5v5ggMdOiHo
	+9Aws3F+aWL8DvCxYMFdLku/dfhCZCyOtWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjtkap6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 09:05:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so319266685a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439114; x=1787043914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0vzY1YVIwbjDIEXvvMGt3nZu6nIyRWSUksDXeGdy7Q=;
        b=CLYDCL7FkxMNgmXGMmiXr1CYlaBC4zv1jIlLm5L4bB6IOR0Zi9t8ETK0dwuYJTAGoS
         B66F060g+4uuZR2e46gmR4fbFJacEeWBDvCkbHFWa8i54sxN4ho1Z4OyBH6IIYCP49NK
         WiI6BmuNneggjIM9978pJZjNCKj6YvlvYY2MTF70kiZ68npiCWq5WdnlLVsoFHfu5HyS
         4RzQHVElU2OlAwfMlchpMASq6FRQFu+ni8td9kbcFtn+7cyMIqePIbg5pOFNSJQP+R/G
         /u76B8kbEpuuefKBLWfjCePENHOM9wioSq4hGYXTI+7BD8JCLqzzmcWkKZUEPm0eWquj
         dLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439114; x=1787043914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0vzY1YVIwbjDIEXvvMGt3nZu6nIyRWSUksDXeGdy7Q=;
        b=SIXq/hRZrju1qH6WhUq6RmfgeNvtdVKCUWYeOfpaVJHzzby8faZYddKtaarTxg3Cq5
         4suERdomTXokjKrQuPC7qFX7XEXIW04fwwZWUU9BcDKABj7slvez0TpQrxMwBvfqzb2n
         1syC2EThicRa+mHl6lwjLAKbyBlbYoa7kNAXyPDGBlbi2nifX9lPWqfi95aW3Cpph2OR
         O9tVeYFd48NMP7e02VILzCPU3yq8m8uGttF7Z9GBrkoYJQWcfCFmji8dLOB3ubYsUnvO
         WAuepZLlQytA8ZpqCmLlNSM+pwkh2G9YHZEJGGGxNnXhkmH5MVOiLWc/xU9PWw3w9kw6
         QXmQ==
X-Gm-Message-State: AOJu0YzwASS5QqC1QZefFRjfMoFOsfUIGA2alCIb2HcPIj9AoYCv5GBw
	XC5x9nUQKhRi8YICR1CTud6m46/9T6g5HiPU16EO6lbhYFmayG3cODR5vUBZQwopBJpYlcPMvbQ
	10fghOQv0BeCj/nELAf2wDWjuADh17F1wh6tiskzffwr5tv0vc99MZul6E0GyS3GrprJTlSjK5+
	zhOIzYHQkJ5fy79eSi
X-Gm-Gg: AR+sD12TjWmJTt9HujJwn1l9C6a2XW5AeqLYaU7tWEtgcNrNGVpVSsvnHlCtbLpDAQg
	KT8kQr4H6+JlAYYvdhCXlLWFq1e1XLh+8ecrhl6h+hCj+kqQNZY8FTt3xkCDAfo6d6N+UtJ435J
	dEtir9bua7cSB8aJBVyAJg/c0yKdPU6hyI2mn6piX3EX2XaBpQ8etUKCOWoVOuhXSJ+HgWUPb/V
	Grw+MfHVdSR+s0PdyiD1yzo2tlp890+XKWw4YJ3ffo8JVt2eNDkIWIoQZDKo3HzqmzoEH0x627J
	hLH2GP17umr00MtF2AoD6KO8dxKssDSiKyG9ucmb5a0wh+S4w+B4ufioahqmXA2vToZbeT8xhuJ
	ZSqpmJR1To0asSB6xG/WxGhtOaLRia2yUPESVuDlvC+/dSa3Cq6F4n3YiDsvZNIY=
X-Received: by 2002:a05:620a:2727:b0:92e:cac7:96fc with SMTP id af79cd13be357-936a8f32fbamr118026785a.24.1786439114192;
        Tue, 11 Aug 2026 02:05:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2727:b0:92e:cac7:96fc with SMTP id af79cd13be357-936a8f32fbamr118024585a.24.1786439113804;
        Tue, 11 Aug 2026 02:05:13 -0700 (PDT)
Received: from qualcomm-ThinkPad-T14s-Gen-2a.wlan.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e4389864sm27376566b.54.2026.08.11.02.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:05:12 -0700 (PDT)
From: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: ashwin.prabhakar@oss.qualcomm.com
Subject: [PATCH] assimp: use CXXFLAGS to suppress GCC 16 unused-but-set-variable error
Date: Tue, 11 Aug 2026 11:05:11 +0200
Message-ID: <20260811090511.1262734-1-ashwin.prabhakar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NCBTYWx0ZWRfXwSg0G6lqpM5N
 xn/Ape6yrcF+K2UH7ANqeh4dJqX/lJr5ItFlcGPqIVicTxUN/AlBkI7PgngJhQ/I/TrYVT7Pco/
 ny/H31bsrQWkycYYBnXFvgDj3te3Kp80o+lJ1J2MErMftbTvLX1WSnz5WWSq4Xr4AeuHRlQj2mh
 89AYegoe8F7lUZaqIO2UOTNUkxX82fc9PFJxvv8tNMVAupHS8zbUGqe+qtaE4QkYuzJhEu1VAbT
 oL6wTD3oc9MwCHN0swUnRDZGXueRGG/uYD0RmPvHTcOuRKlL1fn4XxP+7C0f+mofZx1bQ8JuTzz
 oanhanVavod8G4BzBMO2Je60I9wSpywb8ydKR/LxqQ33R9w4U4Slh+8M0k9Gs6LtCfZWSpC0BFp
 xRjLDIJjjwFVbQe4IWb9Hj8SDcoRg6D9jkRNuzjtveTPi1+c9x2m5Z+bBEOH0Fdd02DYhJXWMtv
 FWjs/dkHW9ou8KH1fgQ==
X-Proofpoint-ORIG-GUID: 6grOGLrmp8bhXLOGSDm8JEyKR7GudCdS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NCBTYWx0ZWRfX8zHI+gJJ2tpI
 vNDqd9QUEHwJu/gzAnk+aSStyI4B+AOP+1ZQDJHvQ32VXA5+sA9y4GwZO2p64a8COd+zW7bLDFT
 LAU/8nXJwVngF4pyEBkqurOLw43OeiE=
X-Proofpoint-GUID: 6grOGLrmp8bhXLOGSDm8JEyKR7GudCdS
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7ae5ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IJsB6R_n0dedTcxflIIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110074
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 09:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128925

The CMake option -DASSIMP_WARNINGS_AS_ERRORS=OFF is not reliably honored
by the upstream build system, so the build still fails with GCC 16.
Instead, pass -Wno-error=unused-but-set-variable via CXXFLAGS to
directly override the compiler behavior regardless of how upstream
manages -Werror.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index 4cf2d1f787..32c5cdebb1 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -17,10 +17,11 @@ PV = "5.x+git${SRCPV}"
 
 inherit cmake
 
+CXXFLAGS += "-Wno-error=unused-but-set-variable"
+
 EXTRA_OECMAKE = "\
     -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
     -DASSIMP_BUILD_TESTS=OFF \
-    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
     -DASSIMP_LIB_INSTALL_DIR=${baselib} \
     -DCMAKE_INSTALL_PREFIX=${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
-- 
2.43.0


