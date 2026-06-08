Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AD8CD8C9F
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 11:12:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52010.1780917127655670172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 04:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RoPabHyY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jOIxDhiU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BAOPr3035949
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2026 11:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t7iOAdtrb/sJBJRVPWeLWcoUHtY0h5vmBuv
	e0CMF3Qo=; b=RoPabHyYmUqxRzEybo4Vm+Mf9FeSLMKvmVf5kvWcv/RuSWnMDHX
	zp8qAuCPombC8YUfhiUeQxoaJG1WiL9EZoq3wDh78QppFtwwAoUnfPo+pTQKZ8BE
	fLqJZLrKWBDxizWebb5dMQtTjUU6QGL0/0Y3BDmPxt3Bq+cvRPRXxLsy5YCzsMII
	Xe2hQGa+RlqUIKJn6U1amMqUWMzcqnmNSWodh3K9GTkVnFAaWk7Pgq3XdVifc8EX
	jM5SAihwTMamlDAEuSICS2dg6/M52TowDPL5mZBR7MtEZwagVlK0YkOBf27bhOKF
	zht6lDo11eq6Ca558f825sqPGdRiPxFTOQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1fe19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 11:12:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c4335eef08so4348774137.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780917126; x=1781521926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7iOAdtrb/sJBJRVPWeLWcoUHtY0h5vmBuve0CMF3Qo=;
        b=jOIxDhiUwoJdQgn890HlW3CuP97gbru1PyAqJudF9PDXskuv029dZ3mvS5eAi++GBJ
         /3s3PLiDjT8fdybtCiMfVNE/6ODeB0ui2hZmYL1gUMcIwbL3UakE4QDcUeZAK1P8Iz6/
         i70u70JYTHaEL0Srvl5PbKbC2ReBXfZnQla5Es1mJbjwk1HCuVER1Q7r8QMkK4UKzPeI
         K7hgnqZpPSoRkUKQJrrkxSuVaQph/jszHQaFGeQ3ubnFFjTEouLOuOzH39Gk4NKgmkf2
         koN1IQvSVba1qEQWvpnO5ZsFOgW7Dof/O5xo0fMxTQwXB4hWSXGTR7rTpjw9fnMnfU88
         d78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917126; x=1781521926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7iOAdtrb/sJBJRVPWeLWcoUHtY0h5vmBuve0CMF3Qo=;
        b=NgUGIiTkgs4WCa1Da+n5O+ScrqNVXwrFJ/4wQjcrhS/GkJKZ+vedOUBcgFxj/N/DQ2
         oJT+9EsZz0YPn85nVoETOIH5HQR7hD5glQS4iZIhEn7SdPmD69Mn8yPa7Lld75qj+DqT
         T623L9tTAO9gs0Ss6HCGkQdG+XpNNivp+L/UrZuJIVpMIezAB0yJIH3VZUm6bTVJND+b
         dieggmaTsw/JltuDGxjRW6kOFTQsIfMVJ/h4o4yA7nhqi8S70QDQ7jOaQoLrqaJj487Z
         uKrzj4riEOz9exMyW7trBJPo+lP66ofkeaZlvVA5N2jX03QG9BRekSsd+UNbwPnUvkoS
         3hkw==
X-Gm-Message-State: AOJu0Yw5cZtZpLRCfnmSHRlOFEzUFi4igvJO1MO4GDTKJHxtmSmXMHez
	1fs0iz42DUwxBr8RQPyid5oj3LhNZWhqInqXIK4ggnmMGSt07b0uVG9K56Lgpzy+XoyXFaDKjQ2
	s4hq14yQhOBGGLro9c8/KEhlNTIVLTPtplDcULhEj1Tmtl908i6PnL4y+Z2aolRJpi8xNtoorON
	1nVWKJb8bWr81YZ3oO
X-Gm-Gg: Acq92OFpp932mjKdXq2wFaFURqEOD13Ow0vyTKHIWx4A5Er3AoveQb6jyJnpK6rLkv2
	HS6daIPD9EyYkStrGS2MQ/YNnSqLlL72JWDOrxqD8IcMfikzTkC1n6R5ZwepWAeKdCSRXzlShON
	KzSwz+6emqurVUG6XJGPCEFP/YevElZb9ORvte9rcOHFM7jseZY8Ghyy8bQojPeU5PCeVu9EvmE
	1IGprSMH4be5paKCTUCZ0yNgRBjJVVquM/NEGMDOSeKT9dbr7QEspMgSSgzQYMSRCwfCwVIYUNm
	4cnvVjNq5JYiRhMTewMTTQ05FrN2o0D4N1/voEzF4dA64u2LiQlFRgv0er36W4tSp9gBKdQ96TZ
	xiSZjmXobLFukROgGZKlHwmiIvHFO9vBIu8GL8xH9uOHmsJef/WvLQ87/uWHlFo2Jd4h/O0srEk
	X+2EI0+GRRGhfgNOrOLTo0xTQNiXs/snOs3+N+88nNOUEbTA==
X-Received: by 2002:a05:6102:1620:b0:631:4cda:3ebb with SMTP id ada2fe7eead31-6ff0bb78e7dmr6386001137.24.1780917125770;
        Mon, 08 Jun 2026 04:12:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:631:4cda:3ebb with SMTP id ada2fe7eead31-6ff0bb78e7dmr6385992137.24.1780917125206;
        Mon, 08 Jun 2026 04:12:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99cc7esm3732490e87.82.2026.06.08.04.12.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:12:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] freeglut: split normal and gles packages
Date: Mon,  8 Jun 2026 14:12:01 +0300
Message-ID: <20260608111202.3259660-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwNSBTYWx0ZWRfX6RMUMIwp/PmX
 zxx7Im8hdh1ptzd9k6Oca0RajbNqrdEEna5e6WKcYSuahGz+S1ZPt/GmW3wdR/e7R3K702nb54a
 DH01vnYcEv5V5qfLHVs6lWRLNKMc+TWH8Q5wQ57ebx/NkGTcuC/KTxzEY6YsAmEUmD5s+f5W/ZR
 1LlPoLH/YG+ViQyYz6ZZpWmYOllB3PjzAQtmkwicoSEBOH7PqM+VAI1tLDQ9qtEmFR1m6CbVYxv
 cDakK7yjv7OzAwyXxIfHrZQ1qRzZ1m0C+XYK3oIHgxehjuEF3JtpdABePNjQYsEh18d4/8wzTDr
 d+srijiLgYYK9s4xx4xXB/ToOEPRvDrbL/t8T9C2DB7QAlpAiSHCBpyaUsTNIywO+W+9dz7oXgv
 yugGq6IUiiDuGqTN/odtfMAT5ycaZuTPUjMdxt7nnaOadn1mti/tLGnTxkxGYYV+KDY/M0Hr68t
 x+vhh9gh8Lj8ZD/PSzA==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26a386 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=9dTsyPOsAAAA:20 a=EUspDBNiAAAA:8
 a=DdJ47NaBNudW_1KEoGEA:9 a=gYDTvv6II1OnSo0itH1n:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: dzhLs8FXY6k1TSvendFqiunG--4nlrs7
X-Proofpoint-GUID: dzhLs8FXY6k1TSvendFqiunG--4nlrs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 11:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127422

The freeglut and freeglut-gles libraries are not really compatible, they
have different SOnames, different ABI, etc. Some tools (e.g. OpenCL CTS)
expect the classical FreeGLUT rather than a GL ES version.

Restore original freeglut recipe and add freeglut-gles for the software
that needs it.

Fixes: 0b0cbd4c3ce1 ("freeglut: version 3.4.0 -> 3.8.0")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../0001-Add-support-for-legacy-OpenGL.patch                 | 0
 meta-oe/recipes-graphics/freeglut/freeglut-gles_3.8.0.bb     | 5 +++++
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb          | 5 ++---
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/freeglut/{freeglut => files}/0001-Add-support-for-legacy-OpenGL.patch (100%)
 create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut-gles_3.8.0.bb

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch b/meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch
similarity index 100%
rename from meta-oe/recipes-graphics/freeglut/freeglut/0001-Add-support-for-legacy-OpenGL.patch
rename to meta-oe/recipes-graphics/freeglut/files/0001-Add-support-for-legacy-OpenGL.patch
diff --git a/meta-oe/recipes-graphics/freeglut/freeglut-gles_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut-gles_3.8.0.bb
new file mode 100644
index 000000000000..3101bfe63bfa
--- /dev/null
+++ b/meta-oe/recipes-graphics/freeglut/freeglut-gles_3.8.0.bb
@@ -0,0 +1,5 @@
+require freeglut_${PV}.bb
+
+PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles', '', d)}"
+
+S = "${UNPACKDIR}/freeglut-${PV}"
diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index 5c6ab1a1d788..a00519f0d75a 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
 SRC_URI = "\
-    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+    https://github.com/freeglut/freeglut/releases/download/v${PV}/freeglut-${PV}.tar.gz \
     file://0001-Add-support-for-legacy-OpenGL.patch \
     "
 SRC_URI[sha256sum] = "674dcaff25010e09e450aec458b8870d9e98c46f99538db457ab659b321d9989"
@@ -15,8 +15,7 @@ inherit cmake features_check pkgconfig
 # depends on virtual/libgl and libxi
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 glvnd', d)} \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 glvnd', d)}"
 PACKAGECONFIG[glvnd] = "-DOpenGL_GL_PREFERENCE=GLVND,-DOpenGL_GL_PREFERENCE=LEGACY, libglvnd"
 PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
 PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,libxkbcommon"
-- 
2.47.3


