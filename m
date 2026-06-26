Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFB7C43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 12:57:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33685.1782476019059205795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 05:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cL7RpfEP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=J7MyaD4T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ashwin.prabhakar@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcTvb857907
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bb6tysUSu8fJzo8b/lRv7na6AgBIQ0lRqLo
	9HQBFQqQ=; b=cL7RpfEPFrObYL5XRSr01pGMpcxbFVc8FAGw9YurfWB6WTDcS+a
	6sCx10hw+rGIVbtDC3IYmPMkvjUL9k3J2AqMxBOerlZKNdLd4AmD9S7ff7abdN8Y
	0FvuK6YnPbt/pgmwQ+UslmqGD0VwaWx2eW0LhU29ZUr3KUsdAJ4u2EIps/DJBsIx
	l7SmtApQIZHZOJY7NVn56+KDoxyHKu2wb5g3nQ+z3950D2s/TvyXClPvBo7Xxnsg
	SEddA/KY+sizv4XgmE9wi/rflHUm2LC9GQLkzR6Vzp5CkYNRqEwLwON2UzVa/JhV
	vcfb5j0gmY5A1RBpuohztA0/8Lv+L7GRjGw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2trjpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:33:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so344078e0c.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473605; x=1783078405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6tysUSu8fJzo8b/lRv7na6AgBIQ0lRqLo9HQBFQqQ=;
        b=J7MyaD4Tg9P16duf18OV9wnQ/1s2bbVsgp/1xPmRumwxJf4CycxQrbwlJTw+S6FH7I
         3nEwS0m3DoaGyibpnbqE08slKat5doruE+KBj9cZg+hTdirivLZl/XgCW/bOd4RZc7br
         3AoSvDkbfZzOLrjhKT7TPBzFvFeeyW+RNEUAsbaCPlYSyQzI0NcZ3jImv3Rgmy8Wwr0c
         PRUpYlEcc0IQD/PkSE845g31d9Jx+diDYnbs9M+dfq3o8TwpUe13yC7KHown/xh+Uj/x
         9tVBZ+3BWCtU/oIM2eOCG2yreTJiWYEiFPs2wybXT1IbaQOwRLAMJS0c6Y8aErBUXLDI
         g3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473605; x=1783078405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb6tysUSu8fJzo8b/lRv7na6AgBIQ0lRqLo9HQBFQqQ=;
        b=Xam8CROA7+W9DezCMaHs09eTZE/2DWSMMURcNYfZN89w1lsN+qT207DBV8TTvliAWb
         Kaxi3lNraNr/iPgvyj0xtTObNthltsHXpwVkKLUpf3kOHRod3kvsrJihFPtvfwcJzdtX
         Jj/Q+XJuZ9H7TmwLAbASY6gRZSQLSERc0ecuRspHUC/0QKhyzsqYBQTlbu0N+muYvGeT
         2DQBjmtk6/1gcnjbLeZV/VM9lVDSeeNnMJ8Lgc+/sVsmgOGqxwR5x9Jke3rpj2iBVDS1
         nhs2kkhfTdrrj+n1DSXXvzP4seJvbvoHeMzCUBpTTrMsjRiSXHIU4raY93pL6cnWMaIj
         Gw5A==
X-Gm-Message-State: AOJu0Yysm9b1e/KgmJxeOuBspljGqQf2wL4Ex9GDJRNFZdxugYkFQpFZ
	szTpi/a7EEsPRKXplW5Dl0fvnmAKGCmTm0kHvmPx8Yxyi+AW4hPiUXTg1x6vioNNGj6XU/qdN1k
	N+k9t64WAw8tijM2se3bDHnxER+6TIReiL+6Wkv28uqT9hik1TQ2QrSqzvd8RWLPabtGiNRA07h
	DSbVP1EkEU0TDHb1JE
X-Gm-Gg: AfdE7cm+VoLcX/+XyB+UgcxXczgly5qdr8otwCOa2IsBf9AJQucABOkj5p6chO3KrW+
	W4kZhkNUeskG7p7dSikOGRDLEkZ6rbfsSRfe6GF/3CaX8zk1UELySMyH4vPCGNBivJNyKVBpfWe
	euPo26BQizoLXP50QaRumz7PkzxwhOTmzk3/wXwhBwavFbTZSBcKQtuAEV17MLz7ugHF4Y7FNG8
	2svQzd0FbuT+wj49saIXmzNBHhSSG2y87ihnyRVsExIr+kRiAGViqGU9AvmUdNMM+5sFOh0nXAC
	lNHkh55QBv/uEOzPAnrC5jAbSyv1UY2b+fXhDTO0CWml9mvwHt/H3XOTlMZiI3v7rAzd8rJIbK1
	HNr1OrtYDqMVPPf0TIgPI8vQSG2RsvGoOtka2/ew6WxjhXQyHafOG7paUrqQNeylScGIPbIQgpw
	==
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr2809138e0c.4.1782473605035;
        Fri, 26 Jun 2026 04:33:25 -0700 (PDT)
X-Received: by 2002:a05:6122:3123:b0:5a4:6680:64f0 with SMTP id 71dfb90a1353d-5bd69cc1bf6mr2809135e0c.4.1782473604569;
        Fri, 26 Jun 2026 04:33:24 -0700 (PDT)
Received: from qualcomm-ThinkPad-T14s-Gen-2a.wlan.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd38b4sm2649379a12.28.2026.06.26.04.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:33:23 -0700 (PDT)
From: Ashwin Prabhakar <ashwin.prabhakar@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com, ashwin.prabhakar@oss.qualcomm.com
Subject: [meta-oe][PATCH 1/2] assimp: Add new recipe for Open Asset Import Library (Assimp)
Date: Fri, 26 Jun 2026 13:33:21 +0200
Message-ID: <20260626113322.232336-1-ashwin.prabhakar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfX5M/Bck1gfnRY
 kiFaMLIJ9GgzPh7SYzrZycGejoHT7cBhAI6ijGWa9Bd/qG2vip/b1zVQWzgJ3+zhwYOCf0cwOzn
 2BhMYG2POR6uokkRjlNIVbVGt13KUxQ=
X-Proofpoint-GUID: S5EjWcRyKBcXR7XyRLU3ukWBcH8m1OQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfX4In5BTcn65KW
 UVBqpYytN94kOfJ74H7iCGm2KSCYxDzRPm5QVWGD4Y0D9vgoa+d7e9L3Yx+0Ofm54GzIEZ043z3
 gQu2JV/jbr+9zVIcAQVMhdb6wQY1rp0IpTZ5DXGEx3J48pFe57ilCtAGmfZBXJDEm+48diBQp1a
 f9fXc36s8va4FQK3ibT7wMmT7a1LEg/cEACAejpAOarSD9Um6rgQMvHWJzjoZU1LdHFSwyeTXUc
 5LIhj3XMP0Hq4w8uzblrC2rkGU7TshMsMkoHh0j8hPJ6G5CPHSR5+pYxnfVYX5P2Pjqq1TTeeY2
 VtluufQBRbn+6ZI5wTe7xDzZAVMojyFq06IVWXelkYrWs0dRgSn3daspJEzvz9iyl5CcvBhmnWp
 ByJ38b+Q8oepYd2cNHwRvTv7Hs5mBm5/0S4wkWxuDMQj5f3btM09DjOeuqNMpHaW25NtU90ZKE9
 dducwNk2oQ1uia5h64g==
X-Proofpoint-ORIG-GUID: S5EjWcRyKBcXR7XyRLU3ukWBcH8m1OQ3
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e6385 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=AxJGEpGEuFdFLOn3-psA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260093
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 12:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127792

From: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>

Add a new recipe for the Open Asset Import Library (Assimp) using
the latest upstream git source. This library provides a unified
interface to import various 3D model formats.

Signed-off-by: Ashwin Prabhakar <ashwin.prabhakar@qti.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ca1512c46f66fd5b555ca463c61ef08155fcdb57)
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp_git.bb

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
new file mode 100644
index 0000000000..13d1002946
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Open Asset Import Library"
+DESCRIPTION = "The Open Asset Import Library (assimp) is a portable Open Source \
+library to import various well-known 3D model formats in a uniform manner."
+HOMEPAGE = "https://github.com/assimp/assimp"
+SECTION = "devel"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2d38c9e0d63058b051065fb7b1102a8"
+
+DEPENDS = "zlib"
+
+SRC_URI = "git://github.com/assimp/assimp.git;protocol=https;branch=master"
+
+SRCREV = "1962da5ac484434524e7a25d566046edd932f901"
+
+PV = "5.x+git${SRCPV}"
+
+inherit cmake
+
+EXTRA_OECMAKE = "\
+    -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
+    -DASSIMP_BUILD_TESTS=OFF \
+    -DASSIMP_LIB_INSTALL_DIR=${baselib} \
+    -DCMAKE_INSTALL_PREFIX=${prefix} \
+    -DCMAKE_INSTALL_LIBDIR=${baselib} \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF \
+"
+
+do_install:append() {
+
+    sed -i \
+        -e "s:${WORKDIR}.*:${prefix}:g" \
+        -e "s:${TMPDIR}.*:${prefix}:g" \
+        ${D}${libdir}/pkgconfig/assimp.pc
+
+    find ${D} -name "*assimp*cmake*" -delete
+    find ${D} -name "*.la" -delete
+}
-- 
2.43.0


