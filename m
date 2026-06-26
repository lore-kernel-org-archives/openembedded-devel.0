Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319C3C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 12:58:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33915.1782476763404247872
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 05:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A7vIpTtX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HQT/jHfw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ashwin.prabhakar@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcn7K881519
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zDWlzlbSopo
	wqcjzUPGdjNOhqVAaZ0dYKit+54lNKIg=; b=A7vIpTtXqtHDqiV9MjTjkdUTktG
	gUY2cWIPr7KFNQDK5jqkyqTJmXHBmLxUuyy5vcDgFF7t8wL9hTeqfw1J/aVYKhKq
	1MFXF5QNyFcO5t0FohxKu6ff3FS5BIaw+RdMvS8rNs4GfMdMjAKwtMA9rmJ1Llbj
	A6VUgbJk0amkTgbF2yDOfiyB1K15hSMpnN35SyvRBGrigMkJvrnILUKc0X59VAla
	hBiwTU3SWthHqAqTYj7aCPp++OtkUs64imlskg9nB747+e4MlcwIircwCDiLsqds
	VktHGe/2xjei1nHaGReIXpO54e91tHDw4kyB1AsKsvP1Sal/opgG0JwHsjg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqafk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:33:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5954c5fbcc7so725605e0c.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473607; x=1783078407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDWlzlbSopowqcjzUPGdjNOhqVAaZ0dYKit+54lNKIg=;
        b=HQT/jHfwwiGh6P5k9weCGd4be3E1UQk2o3ZUjjlsgcVVZfLvlpWr7Ketb+CqenVB16
         9uQgp2s0hmG9wY2k/8EuxJkqInyqT+1oVGckeZUmPp+uU8hdReGlPcqrcH5PDKbsZORg
         V2/DHth5bzAGevNI7uwp7GpWLPUArzqlp4FiwtFVVrJ2mSHmZ1rCf0Z2CtBKiWrGqyjy
         UT2GV83a94kUfQwO5/r+ej+vIBQiXpScGn86YibrL4RjKUy3LdaymeLaSMoCWRmHNrfN
         h5euKE91zvh4Mn7ByD0iCOe0MkNxYkfrSUa7Lqbj7uiov/tTIhEFDE53cEbOAlPZgPNJ
         ArvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473607; x=1783078407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDWlzlbSopowqcjzUPGdjNOhqVAaZ0dYKit+54lNKIg=;
        b=SCWX6mkhodpjJExC0fTBJxpE+t7qsxgoA3wv+x1K5aQ4Z5fNqurSQFOpORgWLlV/oD
         WvUnM3aEuM+ygbxT45Z2TQQD5ghIUEWV4sXXawgnQhEolXZc7D51jEqwGEPdbYjqjc/q
         LElaXDxa1nO1HLQLLGsSG32HuT8839nW5MQ5kFF4TuNOmwp0ZSl6WFdLW11AVNFqgJ7K
         ZYhPEvvb3+kDZL6DeO+TUy85R1P4lZ73Iyle26M9zqTuSyT1Gs/LKaJil5S8iJ5YBoOm
         uBQpYdf0Q7zWSKD8mveTZfyZSFtNEpro6iDb1lxRiPRdI4eP+AxkI67bXxHIBcavTbV7
         KemA==
X-Gm-Message-State: AOJu0Yw39IJECkdOCSaGh7j2JwTJCpHO2fc4A30S2IIbMKLX16K1gQ6l
	t0MaOE7tXQTpnYW6AQyoMa7LHetB1NLtnLgMJ7e+s/FAyB4k+Y4ZEK/LJTtu5cCXQ90O/0UKtT9
	lpVZlQwrQeNgmcUbXuai471Kr2NMoWLDJqtRRpRFWZw5iHetitayVGGw1C3imioy/6Mx6S2uSb5
	k0a+LNpPNkcIWGSPE8
X-Gm-Gg: AfdE7cljIq5Tope5ci/8FHqf6kO7I/Piy716Kl6gKwHYhklAly2lpUxAxD8SrVgVCTH
	HwF5hQVnHl2zsu0UI7GZW0zSh00k9I/dWc5KqAbZpEzNxKmd8r4PEi2Ikrw7DzTNwBiYLKNQ9RG
	pvECWLokIgI4LJLuEQelSZidXWpxbzrcjbDLBvye9mUkLp4v90sv5LBS0A6tMGy6H2SV20wDaXx
	FKs5xYfsRXBS+HVV2HkvUS3G3I2Tv3IFpknS7IBf9x1kBfhKmZ24k4zr+M69bllZC9k3Ys4HPdG
	IBmfWRyo3fLJAjshbfI4V/p0vg/LoSOwwpoowcCrEp7bhfMJNHqcEqfx0lYP+8QFsSLtngyScEq
	+CY9TFsv3T6H8c3YKb1WTDwURuPxSLykwhkk6q3K48k2bmEmv3NJCtB5bptzikU5AFG7BFhi8iQ
	==
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bbmr138419e0c.5.1782473607434;
        Fri, 26 Jun 2026 04:33:27 -0700 (PDT)
X-Received: by 2002:a05:6122:c83:b0:5bd:742e:3bbf with SMTP id 71dfb90a1353d-5bd834b56bbmr138413e0c.5.1782473607015;
        Fri, 26 Jun 2026 04:33:27 -0700 (PDT)
Received: from qualcomm-ThinkPad-T14s-Gen-2a.wlan.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd38b4sm2649379a12.28.2026.06.26.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:33:25 -0700 (PDT)
From: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, ashwin.prabhakar@oss.qualcomm.com
Subject: [meta-oe][PATCH 2/2] vkmark: add recipe for Vulkan graphics benchmark
Date: Fri, 26 Jun 2026 13:33:22 +0200
Message-ID: <20260626113322.232336-2-ashwin.prabhakar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626113322.232336-1-ashwin.prabhakar@oss.qualcomm.com>
References: <20260626113322.232336-1-ashwin.prabhakar@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5NCBTYWx0ZWRfX5Ug9IKLP/27R
 FwRM0P1oUdWcxArpiGZdcrudKEEumXloA1P6lR8N+lUO9oXUumIW5QqbCHT6811JIrwC8IbPt02
 c5l+cc+qzKf8cV5lpdmNqH2FlYIKnLAkAZ0FwBEs1NNSTF3yZjl/Tc69vGTFKZdumIk07cxfOut
 21MnKr9/ZoRbkX/0/9xxfT5XtFkhLew/ceNkuUGbCYO2oooXUPasOP4WRuhJ7G1QROOVaUqD3Kz
 hMQ9j1fkoMwx17QVmRA7EqMXpXZnZyzf7cezNNqOVPIpYaDdyz+UoMaCr3YVpR7bZ72mPbpATL7
 p+hOS/1XIgMdHYlTlQ2unj4l+QvOa+1QlBBYO8IRAQ3xakHlzvw0cD04WrY5La72cDIq1ChqWoQ
 EIuXSiQLVfTFnUp0GaGS57VzwiKLGK31DVU6Prl4zllPGyFbn8fftNhf256WhYMruwAG/LoHcjh
 5z9270ZPWucWLMBVmQg==
X-Proofpoint-ORIG-GUID: x0rhzKOko52LhZ50cIRxan268via-pfm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5NCBTYWx0ZWRfXya5g4nO4xIcN
 M5XR9jRpg0j/icT14yYKnnSkLFF8Pu7cQ8lksrzhKa0zOzfAZApMhutfyYHeTHAZJ6QOO7tfagk
 0YC3x3BJlVvVFeVlE+JWt42MnpB1g4Q=
X-Proofpoint-GUID: x0rhzKOko52LhZ50cIRxan268via-pfm
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e6388 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=_F2QckoEgLxi0stg3lMA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260094
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 12:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127793

From: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>

Add an initial recipe for vkmark to enable Vulkan performance testing.
This tool allows for benchmarking various Vulkan rendering scenes and
can be used to validate graphics drivers on target hardware.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>

vkmark: fix build parse errors by making XCB support conditional

The current default PACKAGECONFIG explicitly enforces 'xcb'.
This causes build failures on distributions (like Yoe) that
lack 'x11' in their DISTRO_FEATURES, as 'libxcb' and
'xcb-util-wm' are skipped during parsing.

Fix this by dynamically adding 'xcb' to PACKAGECONFIG only
when 'x11' is present in DISTRO_FEATURES.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit f58670ca9a9e85e7f7a37f3155f4ce96fd64a4d2)
---
 .../recipes-benchmark/vkmark/vkmark_git.bb    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/vkmark/vkmark_git.bb

diff --git a/meta-oe/recipes-benchmark/vkmark/vkmark_git.bb b/meta-oe/recipes-benchmark/vkmark/vkmark_git.bb
new file mode 100644
index 0000000000..906ba85216
--- /dev/null
+++ b/meta-oe/recipes-benchmark/vkmark/vkmark_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Vulkan benchmark"
+DESCRIPTION = "vkmark is an extensible Vulkan benchmarking suite with targeted, configurable scenes."
+HOMEPAGE = "https://github.com/vkmark/vkmark"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/vkmark/vkmark.git;protocol=https;branch=master"
+SRCREV = "83a128d65b1adddfacb4fa2e555a7e90817a7266"
+
+PV = "2025.01+git${SRCPV}"
+
+inherit meson pkgconfig
+
+DEPENDS = " \
+    assimp \
+    glm \
+    vulkan-loader \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb', '', d)} wayland kms"
+
+PACKAGECONFIG[xcb] = "-Dxcb=true,-Dxcb=false,libxcb xcb-util-wm"
+PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland wayland-native wayland-protocols"
+PACKAGECONFIG[kms] = "-Dkms=true,-Dkms=false,libdrm virtual/libgbm"
+
+FILES:${PN} += " \
+    ${libdir}/vkmark/*.so \
+    ${datadir}/vkmark \
+    ${mandir}/man1/vkmark.1* \
+"
-- 
2.43.0


