Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94979C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 20:49:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6416.1789415231815100753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 12:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cbcuuNAg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YheTD1Iy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYcuG262569
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CX8SI1dP0nFhHYjy7V/oDqIut63L3Sy3fhI
	QKsjuiWA=; b=cbcuuNAgBNh8dVVjickqBxPm/9TEXCrNcQxHHb9NkvPx3F+WFKc
	rVXX64LIhJCRKp43KGU3r2ZYmbCuxbh898FFH1Y/hNRCQaQ6nRxLMsR4Cg1soWwI
	2qExPy1T6pdNYHnxH5IwLOmdHbq6FdJytZ0tSAphvEymy4gBaGYHA46qpXdBlKXS
	vuPfvou4o/08bEvskUGYPEQxn24dQyX8lWfmcx/MKeZya4LLAHcM1rJdN9YSoS+E
	ucEHXG5M8HIcLgtYIfC0dBPe32iS6u3MsMTVniJM8364bP5VToLs3GKt/ZYEkN26
	GalterRXwJcL9XeYcS1txynCKj6nVw/hJQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergabvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 19:47:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso4686960a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789415230; x=1790020030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CX8SI1dP0nFhHYjy7V/oDqIut63L3Sy3fhIQKsjuiWA=;
        b=YheTD1IybqEahKHvGTPAj2gApdtrIwB/w9/6InAmiQENGrE7Ia6JoJUKAoqQkHlsj0
         nulWKIRD6XkJThUJK+MNx68zTMycAVFLYg9QHhd/4oLDaIZ3i6QMPJNLQ4JBzV5Z1Utk
         5Spa28g2fkR4pFzgq+UcwRQcZVX/cZPCCdU64cp2qUKJjiTa8UaXMccgq7oZCsmuR4un
         +IDMweejC+B3oG9IF3jUpED4AcGUUpdtadPesc6QaimC6u3IhwNQLQnpp3f4UeljmG0l
         bXKa2aRaYpQQVcmdMfx1StHggQndukhNMZZaUvXuUObjOQVKux6rdWxDWg6hx7oz1q8s
         8arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415230; x=1790020030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CX8SI1dP0nFhHYjy7V/oDqIut63L3Sy3fhIQKsjuiWA=;
        b=a2EgR+5cQc09LxLAOsmcapQr2ypVeG1t1bbwmhLU0YOo1DKz0tLnGXpelKO/2HMfmA
         oMyQaJZp387G3SuKry+xL/DOqgXM8hICYK1F/QqW7tzcYTgxNHiH2VziORIiBZF3wGfA
         8sdapUC/45JEYpe85GpuX6LFf3noZN+DUJAUgqNSZaePLgupZQaB43BSCp/q4m9udell
         7Wf6WZ2D5uD95KF/Fua5kKf13xn17k9tx0fxDVQLcM9lga1KetCe5STRu+RrRRIrGWcp
         YvCfGsf7nDP07uszhFqr2OaRILy3JxtSA43qIGQ59jtTNJymKiYIBCaDT8NttUJnzL8C
         7HMw==
X-Gm-Message-State: AFuF++nWetUv77J2Ayl/l5mhsoSo7OC8SHmqq5BJiWYIemsIWHOU617c
	1a1/cbYVHLupLtQqHbUE7nVcNDNstGYo8ofsUV1uR8zxcsrnI8WB8MUVMgLvZ+5yewHrT5+Ln0R
	7eJ/nMPW9L1gWKR35tp37boZHmj9nE8grfNlgC2znF3zLg1Q5V70L85bPNMxy3UPSj813OI+Vye
	EAbJx8HI03WPRvmHCt
X-Gm-Gg: AYBFou3XKu3TavCPM7M/Z5aDtUdf8kT/eaa4C3OF+Hy3a/ML8tTNVweGQPl/mdBK+La
	3Ene8x5KbSB0b+AWlMZ9WgbWUt5Jk3TKmpkJXMsR2okQHmhlvvzolNeJI0lEcM0xRjtO8EBa/x4
	fvNJqqHnzz7kt5cmgPObJc1ij+zQZTH6UxeEhvWEMEhsOvlK1ekHbAFtN8XNmCrnl8nWPq6jJqS
	NvLQItgi9wEUNMH6XppfsR/PB2/y1qUOVWFKL2THKgsQp6yiT2j5WSALCxfTwdMXFPU1Me+0mPd
	b/ojcfNxb7a4eFI/dFFXs/DrrLLZqIoOCqLEw4/xJBdwAb3AytFPeCsxMiCLqRPvdxKKSffsStY
	U+kSXOXS9To3oaA==
X-Received: by 2002:a17:90a:4ce5:b0:39d:e523:8f3e with SMTP id 98e67ed59e1d1-39dec170bb0mr5680580a91.3.1789415230259;
        Mon, 14 Sep 2026 12:47:10 -0700 (PDT)
X-Received: by 2002:a17:90a:4ce5:b0:39d:e523:8f3e with SMTP id 98e67ed59e1d1-39dec170bb0mr5680558a91.3.1789415229749;
        Mon, 14 Sep 2026 12:47:09 -0700 (PDT)
Received: from nina.lan ([187.183.48.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b345a4sm25806186c88.5.2026.09.14.12.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 12:47:09 -0700 (PDT)
From: "Daiane Angolini" <daiane.angolini@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [meta-oe][PATCH] android-tools: recommend the USB gadget modules adbd needs
Date: Mon, 14 Sep 2026 16:46:53 -0300
Message-ID: <20260914194653.1984445-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa84f3e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=XAuqcxNhqWdpT/c4fHa+Hw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kbNtS3R_HzE7tKUi0_MA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lpGOUmqrnW9NLyFG_fH7I-z1SGLgeKdU
X-Proofpoint-ORIG-GUID: lpGOUmqrnW9NLyFG_fH7I-z1SGLgeKdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI4MiBTYWx0ZWRfXyqrZ9zJYRMHl
 DpFWYjVAaYbA3AD64PYx85i9grjfP+vb7byU+XZmCDptM0ipJm32MlLKKNlzVM0eJ6L6g+fDou8
 LWmA4O0khA9lHlllxQK0euev5vulGV22Ejc2QpLIc4ajPKOeCtCtBzaM3YFg1u5oDI63jzgyxCr
 ejnVHSJZX2UcWiPupDl3Mg2ae3DhxDFi2+lLIn3znliV+V8tNgKyAV8xQrB+gfiyOKhvWt5SlX1
 aLPXk52vh4z6VBep8fO1Kup/rsq7fdmN8ZyqiWp0pBKmoPDhTY1Ag5bJaAtNrAxicI1z6Ovzmqh
 ZLZi7GzjTKN+mc7Vept2zJLxyFHJVJCFHs/QqM4/BVepTsBtp67sTTKzXn/RHlIVQs0n2XFShx/
 P8aLUHAiakogUlm2LquDMJ2+LKZLzBu2d81FDfXyL4/vXdUBr472AstlNawkdMCGqhTQzLazh7g
 qMJHa95BUjmr9zYZLXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI4MiBTYWx0ZWRfX91VJCDIQVj/m
 Pl2Cz226KufMrsYTcLq8lzWDuS0iLQBD1mDyaMB1TQspwJ0vu1zdqWG8DxNdUIeUfGXpvhfSoFC
 nn16lzT1a4f+S9wbLTcHNcs1x8uLtCg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140282
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 20:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130024

Recommend libcomposite and usb_f_fs from the adbd package.

adbd needs both loaded: android-gadget-setup modprobes the first, and
the second comes in via request_module when the ffs function is
created. Nothing in an image pulls them in, so adbd fails to start on
kernels that build them as modules. A kernel with gadget support built
in ships no kernel-module packages, which recommendations tolerate.

Assisted-by: Claude Code:claude-opus-5

Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 761c98f5d7..623dfa7717 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -228,6 +228,7 @@ do_install:append:class-native() {
 PACKAGES =+ "${PN}-adbd"
 RDEPENDS:${PN}:class-target = "android-tools-conf-configfs 7zip android-libboringssl"
 RDEPENDS:${PN}-adbd += "${PN}"
+RRECOMMENDS:${PN}-adbd += "kernel-module-libcomposite kernel-module-usb-f-fs"
 PRIVATE_LIBS:${PN} = "liblog.so.0 libbase.so.0 libcutils.so.0"
 
 inherit useradd
-- 
2.43.0


