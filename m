Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7176ECA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 14:58:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9550.1791796735136810667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 02:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RdbUJan5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dWwWvXIU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: igor.opaniuk@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kgbg741650
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 09:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jZfrZc7FCBxm5V54GlUGu+hZmRQglhkwsRK
	7Vf5H/o4=; b=RdbUJan5r7fChoJ8z1SvjLqfLqMt2uLeLg+m4/LXRPTKm4hjbqk
	ut0eqwrVCgdOCN49+YGwAxhrmHqtqqwrffcRgvR1PFDYIJtDwOdm7zguS1KzEQ/v
	pwFSQy+j1otRZaVX1lFcd2WbyR4kYRYSMwUC0nBLBX7UBhamcjlcUcOa3KkiOVp7
	GlVT1E9pbjSLgWtjN4Y559TNVqx8kjRfyUm8h/PL/TFnTeh8jUdDLDG+rzyrXYDX
	2vCLbmi4sJeYcxr8YaWa3swJnsmFyU5yRgTYVRf5kO/uzdZeOMmpnL2eeFPtqyV6
	dhMDlkLEuWy/I1YeJr/Ufpf5/tOIFCKW9EA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dj1jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 09:18:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so353055785a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796733; x=1792401533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZfrZc7FCBxm5V54GlUGu+hZmRQglhkwsRK7Vf5H/o4=;
        b=dWwWvXIUAt8QGfzU/PVLiilvbMjHIcyHhKCvXSgchJivvWPYTPFrVmVqBQ7Fzj6t98
         uAsCGTreGMhebEeTQPpIeWTIYUU95meMG1ECLn69ko/+zCIR47pmZam1TyVh+ChW4vX0
         T0vXnJ0tYniqxvOmIqy2ufFSdH43kWU+zbBq8oM2BPbbVYbZv5v6xfT2x7Tt//+VpJNq
         C7Tky5HJIddqRTo5hLPIVb2ptjskvF9ej1jY3gQVspEYLHWNXfzsvTKvBeSTO7THW5P9
         f2GaQZtl3GwtQPOjGKWeDTM/F1Y98QFcg7ov0uCtgUphMFn7bidt9YoG9uUOEedkBmwg
         PIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796733; x=1792401533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZfrZc7FCBxm5V54GlUGu+hZmRQglhkwsRK7Vf5H/o4=;
        b=aZb8aNLifjKDE/jnWqmui3entQgTxklBlpu1WAvA81QOhXacyLd9hiDuOUAk7DhuBh
         wiqY09ZNeGqlYc2/PoqNGkl0yH8iGYium2FjtcGeOfnMILWQ+lZ97/OhclrriZchEEOx
         7kKGRSzFjcnHdPmwFtscdjUlvZ1Vco3VK2AY8jBvqwn07iKJRLviNBICRTPdtwJa7WXe
         +p5i/V/A8DvDi8j6vOZAMhpMKmB5dWTwnKTaQHGzm53e9UkanAKdRfYI9LDKS2k+AmZz
         riCel8wCzlifDru3FJjNLV3+k9venwyR1cNUDYFe1pUb5MR9v4TLqJyznHPmJDv41kCh
         98HA==
X-Gm-Message-State: AFq9FYISPllXkdvqMBPiRgQES8CYwwEL8Ed7b1WwWQwP6BEzF9sVVCh8
	XgZwY3stduOVzU/aMdG8aWtWdEcDzWdrB+bHjmHrLDWdixIsZ42EumOQ2v2Y0838OwdklO7fiSv
	+eDEVTE5uBzkxdO/yKnpPWXFTkq2Rbj5XZgy89Vq9PfQAfcBbrdVB/qKJKz+iEjTZ/F7Sjuk4o9
	k7A708R/2EkvkTbbDQWtk=
X-Gm-Gg: AYBFou3EpzYoAo5CdLkt+DaZs6aGf/I1WmVYhdinJJkXkO/ZckOl39G7gP63D9ReeSN
	WOo0kNRZaKpN9NI4rxtTzY6EO9rvpnWN9EDti1mg2Wig0qvtieZcNilhEoFbG4Mm1QE1lI4QTVG
	vZro8LNqN2ZkhmOqsKK2nDblDbuPb6L0N4AGNWgcP7usrSo2ynB1iPnHgHgCEnWieMk/t5Lsm+7
	Fb09rAIhvL49kI3skBEulMhb2UnwVG63aKuM4/xZwGsCuqJ/K6QKYz9rgtJZZT2Br4aBEbqq4x3
	INcY3LT4Q98XrPcq0fElnrCxmuj/uL2HLC0xkH+3DIdhuS8VS99JibMF9pztNhUixeO38NWMg4Z
	DSLXO9DFwvQGkOVebog1bw4icBW2x2dLWG6zu3cw=
X-Received: by 2002:a05:620a:261a:b0:93e:3824:4123 with SMTP id af79cd13be357-93ebd279c8dmr1470191785a.65.1791796733055;
        Mon, 12 Oct 2026 02:18:53 -0700 (PDT)
X-Received: by 2002:a05:620a:261a:b0:93e:3824:4123 with SMTP id af79cd13be357-93ebd279c8dmr1470183285a.65.1791796730920;
        Mon, 12 Oct 2026 02:18:50 -0700 (PDT)
Received: from t14s-g6 (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e03428sm4564374a12.37.2026.10.12.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:18:49 -0700 (PDT)
From: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libzip: drop recipe
Date: Mon, 12 Oct 2026 11:17:53 +0200
Message-ID: <20261012091753.17556-1-igor.opaniuk@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwOyoE2nRFmyT
 +gWK3ojL21d5FPr6LdKbeh3/c8PMTrI1dH8G5YrrHhCxP/KZVOQYAYKZHhzGaRYoyiIAkoO2ZwT
 UQtWtsYFbkL/v2SWC+m12IIhxLwMR1v1NRveJqEJuk2mQ3LrG2QnSBOjqfUGvspoMUyZiPQgAzV
 GOtYC/dcWhV8VN065UeycEtZoyKUTWhkpV/Q/IhKO9f5jUbEurDzTAgSaNOGpcZJ8E1rTN9/JXI
 +hcgXG354+1G28+pKkl70E44+xetw2ySDE7liRwzKYxzYTN4BLvzYKLY5MBczxpJT8EAVaGokJb
 HH+xyU1aBoC1/7o/86iaG/QGgJ8bqSt/AjmpdcBpT19XYgGfq54AeeLydm6KACpUFvSurhR5ctf
 Vs3E7FqzFfrHyv5mdxMVU0FViezK8HFQIfb52YnKQNvA4/Eqn91A4vWaJaH99AdTIpwqHDz8669
 mu/EbIbMXQYNIj652Ow==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acca5fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=MlrH0q0GAAAA:8
 a=EUspDBNiAAAA:8 a=YSW2gxsQL5njr4PPC-EA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=rsQC-oSfGZFnTtIp--5P:22
X-Proofpoint-GUID: raONRrPSApRJw6BhderGlr6FSY4SALFl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX9dgf7EdLOVz9
 1Ceho1FMERJzglMCW5pc2gA2iPcC7lS6BhIrKiLCB/Wj6DmENObjjsuPXziNy46TtBMa0GZFDA6
 f2M03FhF1S3BXQAjwqwIpy9aFxCfpoY=
X-Proofpoint-ORIG-GUID: raONRrPSApRJw6BhderGlr6FSY4SALFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130764

The recipe has been moved to oe-core in commit f17e8750c3 ("libzip:
import recipe from meta-oe").

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../recipes-extended/libzip/libzip_1.11.4.bb  | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libzip/libzip_1.11.4.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cc3f7cf064..ebd66425de 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -380,7 +380,6 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     libusbmuxd \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
     libyang \
-    libzip \
     linuxconsole \
     lockfile-progs \
     logwatch \
diff --git a/meta-oe/recipes-extended/libzip/libzip_1.11.4.bb b/meta-oe/recipes-extended/libzip/libzip_1.11.4.bb
deleted file mode 100644
index 039973fdbf..0000000000
--- a/meta-oe/recipes-extended/libzip/libzip_1.11.4.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip archives."
-HOMEPAGE = "https://libzip.org/"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a9d2078f35e61cf1122ccd440687cf"
-
-DEPENDS = "zlib bzip2"
-
-PACKAGECONFIG[ssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
-PACKAGECONFIG[lzma] = "-DENABLE_LZMA=ON,-DENABLE_LZMA=OFF,xz"
-PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON,-DENABLE_GNUTLS=OFF,gnutls nettle"
-PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF,zstd"
-PACKAGECONFIG[mbedtls] = "-DENABLE_MBEDTLS=ON,-DENABLE_MBEDTLS=OFF,mbedtls"
-PACKAGECONFIG[examples] = "-DENABLE_EXAMPLES=ON,-DENABLE_EXAMPLES=OFF,"
-PACKAGECONFIG[tools] = "-DENABLE_TOOLS=ON,-DENABLE_TOOLS=OFF,"
-PACKAGECONFIG[tests] = "-DBUILD_REGRESS=ON,-DBUILD_REGRESS=OFF,"
-
-PACKAGECONFIG ?= "ssl lzma tools examples"
-
-inherit cmake
-
-SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
-
-SRC_URI[sha256sum] = "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b"
-
-BBCLASSEXTEND += "native"
-- 
2.53.0


