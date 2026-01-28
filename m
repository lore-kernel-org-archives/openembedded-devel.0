Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B8AD3F083
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 17:24:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1920.1769618562850950090
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 08:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GMSAkmLF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Itqss1cS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFZQRo811587
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 15:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gpUpPHneR33L2jg6XeAEcSP3erzt9tHFWXL
	wbVmYX08=; b=GMSAkmLFRcdexDgsPqTRHFiwU3y+0JqsV+mBmSOyVMOC381Ap54
	vwqxzdkDJi+r4SY2P1c7943KLKW8EEgcEKwKI6eNJd4bLynvSMMXlFKussHfeZcS
	S+7/o6Q4kP/Bie3T6oUtgrO9U0fnVJt/iFNlJA2TINHD4D+OOCJTlOUHhVShanFH
	gH2Z6rfO6m5OxGKUgcc1v+KiCfWWbWFcYwT1Qq8XeNIVQzdXn7Xok2yOaud/9eMl
	UXjZV8PkhC502j52FxeiYNmjNXftRptkGT83PkhoAdfjAxKbuNYuS/c6bAE3R1tf
	ExBdlYZfrHu9g+vkiFTxVyIJSyG+dFcKAkw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbk9fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 15:55:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso58455825ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769615699; x=1770220499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpUpPHneR33L2jg6XeAEcSP3erzt9tHFWXLwbVmYX08=;
        b=Itqss1cSDua+SgxhPmhoRYD1NjKxwL6Wlz+kGivILg21RvjU6ZH8yuJ5DyJoT4vBXK
         vUYGZzR4lro0ge2fOVicRTo/J7x3IkzXqh/FBLTZWCbsgPQPozyDYnFw02l+xVLIoQbg
         DLuqHKQ2T4hNK2jTN1lJN3V13W7iewD5CcnPU6U+t665VrQj/rOljYU30aP6DdA28JJd
         yQq4dv/ygIVpfQl7Da25GGFnh1/xqkBTRGenNCqBvsOl1Kvz6XY/dOUvLeHwn0fwnOfE
         XvchLDJgAlX+2O2rq6MxmiXy050iHpfdNthEjmX6OfvqNb7XvCloQ7MJFr5NMtXsekPq
         CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615699; x=1770220499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpUpPHneR33L2jg6XeAEcSP3erzt9tHFWXLwbVmYX08=;
        b=qcFYXlBsOo6nNwcFF9En9Ep6EwyOdNZp3KpBEg0eSbYIdozSJH0QrwMP44zcgNaq/A
         2VvWakJr/q+mBb5sqBUkebOb2LdzYkdYYHvMJdkEyK4s7xL9rvmBG3ahuR4YPuCR5q8a
         CyYzB3N1Lt/xPZ2F+yE3cOHyy8LYXSALRCobVKDEJNWJYaSO0Hym5m75jjsD4R1AVWPH
         57MEmNLvojUfoFImSPP9959xtVWDN1rc5BIduMmACRGIgqWHLn1WJzW/kHthovTAXfKQ
         XVh8ZzGF9e5HMrg8eOEKPrQe0G+3K/tZSHnsb/4B9cJxgGIq1BxEYGtAd4yEynnaoGKw
         RZPQ==
X-Gm-Message-State: AOJu0YxMl9kTKc1u3IbdKy46uJheCCmxjbHxebF9udsnfCvb5OHt/0Lg
	wbRMDgCp9iwCGITS+WVk/lkTIIJadtPcn0NC72CUijpjSU0SvUAWEXdF2c1OLBL4fhM9lgz0MCX
	EJ1qq/2dxis2acQpksXO98g4em7AmbrYzxY/w61ckEsfJKcrQIXbZmbvKGuDrqh5akJOqWDxfkH
	BpYOp6BsIfNMk6ctPq
X-Gm-Gg: AZuq6aI667JdOmVjQ7KS16GshQUdjlqcz4O2VvLlM7IhPyTxg1mNcvut+ANogjFc9Ec
	GAfnLEpSEO3mMmLaV/nB1Qyhy4e3hBm5VlaCWeI4+LZ78cdbzCUctOo+7yF8iHXWsydIIB9SEUz
	0XVSRtGuy5YPekYGqjJCgZnT5PSSyo4XHDKFAh3eo9pNPR7kPjGawbdlVLaUbo3Z75CoMDqHmvG
	tByywCMpKOdztfQ4lPaMta0U9XMzeWIOSSl8QjCUFz2jxVzAMaovxJk5Z3cbBdA+1yW74MXFFE+
	jNYcfeB8xjPwpH3IhPKz3NSZFzYcKvMwqGmz4lDj+58PsiGxkeZZiJ4cHDyQopFTveM3zdiVDY0
	gFtDRCwmI0yAmgTMkkIkQ++E6us5aofcTI6aFr70soYLP7Q==
X-Received: by 2002:a17:902:db09:b0:295:290d:4afa with SMTP id d9443c01a7336-2a870d6c56fmr58874695ad.23.1769615699130;
        Wed, 28 Jan 2026 07:54:59 -0800 (PST)
X-Received: by 2002:a17:902:db09:b0:295:290d:4afa with SMTP id d9443c01a7336-2a870d6c56fmr58874355ad.23.1769615698589;
        Wed, 28 Jan 2026 07:54:58 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d985asm26391995ad.73.2026.01.28.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:54:58 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [meta-multimedia][PATCH] tinycompress: install compress_ops.h as public header
Date: Wed, 28 Jan 2026 21:24:43 +0530
Message-Id: <20260128155443.700164-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: AIL8N4_hKXcy6E6C1wjXLClHH3yfmT9E
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a3154 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=92eLw-ppF1KFcGgh8SkA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: AIL8N4_hKXcy6E6C1wjXLClHH3yfmT9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMSBTYWx0ZWRfX2zi5KFyccD8m
 bsrI0ud12MZYEDyB9H/zC+o/16ZrCiuXrUjhgxHnBJ+1uGM2rEiRU3fxChagFxEs5eIZcZ+HcsH
 VUO40b6coxKLKAmkEHJ4wSbsI0GpKQBmXd1gomSaBW5v9p09cxM6Zo/gdcnpA6FMHnv7rjJ2cGe
 Yxppkkc5aKv9QkFmE1v9SA51RHdDDywvaa0uA26159NPSCmax20G5NssNRvNI6UlWUvuhqrEbkT
 S8fY4OmeWqCIPl9Dr8PFLRC3Rj8JPq6xys2r5F/27K2jiduCbyb9yJtx0CalvVYsO3aiVB7FWFE
 XOGXt6lSqy7kZC2Uv5vt7i7sIzAnDayIE456gFZnhKiW5YZ1fH1TCbLqRHRAYdfNvUd5eV3SLUF
 qn2HzXhqUY0QFldbq/Fj4X572OvrLT8afOkn11b86wHPRCgcYt6cOjnr90Wz1U2aEq58tQnvogn
 dGk1GY/q5qpoTBaI1kA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280131
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 17:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123974

From: Pratyush Meduri <mpratyus@qti.qualcomm.com>

Add a patch to install compress_ops.h as a public header for
tinycompress, and update the recipe to apply it.

This is required for users that need access to compress_ops from
external components.

Upstream-Status: submitted

Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 ...tall-compress_ops.h-as-public-header.patch | 32 +++++++++++++++++++
 .../tinycompress/tinycompress_1.2.13.bb       |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch

diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch
new file mode 100644
index 0000000000..0bd70fa4d5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch
@@ -0,0 +1,32 @@
+From 2db4ee4ed5e12a48b1d195dab0f57b7106ff37c4 Mon Sep 17 00:00:00 2001
+From: Pratyush Meduri <mpratyus@qti.qualcomm.com>
+Date: Tue, 20 Jan 2026 14:47:27 +0530
+Subject: [PATCH] include: install compress_ops.h as public header
+
+Move tinycompress/compress_ops.h from noinst_HEADERS to
+nobase_include_HEADERS so it gets installed for users.
+
+Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
+Upstream-Status: Submitted [https://github.com/alsa-project/tinycompress/pull/30]
+---
+ include/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index b12c2c5..15058a9 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -1,8 +1,8 @@
+-nobase_include_HEADERS = tinycompress/tinycompress.h
++nobase_include_HEADERS = tinycompress/tinycompress.h \
++                         tinycompress/compress_ops.h
+ 
+ noinst_HEADERS = sound/compress_offload.h \
+ 		 sound/compress_params.h \
+ 		 tinycompress/version.h \
+-		 tinycompress/compress_ops.h \
+ 		 tinycompress/tinymp3.h \
+ 		 tinycompress/tinywave.h
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
index 0dee6cba1f..ae34624ebf 100644
--- a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
+++ b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
@@ -6,6 +6,7 @@ LICENSE = "LGPL-2.1-only | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf9105c1a2d4405cbe04bbe3367373a0"
 
 SRCREV = "ea5c7245beb0b6aec1565cfae0454d6ba374dfdd"
-SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV} \
+           file://0001-include-install-compress_ops.h-as-public-header.patch"
 
 inherit autotools pkgconfig
-- 
2.34.1


