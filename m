Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A47C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 21:54:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.995.1750802073559975068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jun 2025 14:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=f5VTDRfx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OJIx7p030059
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 21:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7nq3k9tZYmzuGEFqwxCziCQiXRAgnDK+9A/
	khOoYCk0=; b=f5VTDRfxS19L6lGbDuYGNcUEaT106u/zyJF+QyjwUdU5qv3Pc3C
	li5/Z5hbH1R7eUO1bxWFKDk7xsyeCeeq/u2natTMMJTVMCRGAxiNSy0SZioqLfxd
	XbdBzeNDQZQMPFW1yRDcIMP8ZOd/qIWcOFAFGyeLCnQQU8VYjcCNQ4BQQdvWp0f2
	eJMr0Fvz8Rp2cqJ1k8ATA1ssjIsG6U6nDmWtRJju7hfYLuRqwC9r00pC9AMakGyn
	DJ+IAB8cXeSlpIAmpI9UZKi/FPQWXQ3ewuiQAAnzSiy3XGD4ILfsloGpNPW9Vg3c
	ySN6qdjkVz2MqGj4KLGGPm+rwZ3d6/qm6dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g22q8aba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 21:54:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3dcac892bso52840385a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 14:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750802071; x=1751406871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nq3k9tZYmzuGEFqwxCziCQiXRAgnDK+9A/khOoYCk0=;
        b=J9uBTghQXofGe5zBO8Ip6eT9gs66BOiFRTU6KBC2M2OC4RjVygUe8B1h/TrHUVObgz
         ZNVrFItCsi315hTKbivsqQ71FIBcFNIVJYfKToEjkGL3vodY1M0D2EhBABvbmxAvA1kq
         5sNdS+aAhgPaW/10kV1f0RIkMWauTM19zNHT3FL8xk57vsD4ANvH5haUSM2JsJdNh/eY
         XIn3GoQfoK7xFXwYo8EQyW4KFAkqBhVNuP6emcQOauS8ua9EOXI2SmShMlgY0uLwMW4m
         TrjKW48IBqrra8SB3Ak28DH6ksmDC0WVbTMCiiJ5+AzIwD0gw4X0kkV8cypckDgZwzVW
         hdPg==
X-Gm-Message-State: AOJu0Yzzj47QnUr6U/dne9BnPb7nkX+ifHDOdfS7dpFCh8VL3MKpMKb3
	A2OzYidK+HeFhSB699F6oz11HwxidvfVNCSuE5ljYis9JCQ8SYfftHfRvFo8uisKnpbUFBgRJju
	ozYgvVN+4hiHHGNmxrHqU+pSq7QiyonL/E3ULDBRXGTVsVkFX1UF9V7qCGm9/O+UHxYUyGfr7KW
	9eQsqOHWN4jU3hfnOCNDQ=
X-Gm-Gg: ASbGnctoOMZvXQ88jyE+z9ufUuYa2wl+FufhcYLgpQt6HplKCnYFAC20pwYquxKKP1u
	wszTUqzLFOc4NwLe0ruY79iqCstYj2u+PEOO2lK9apFjCQY9caeUNJuOKlAKskYXvplo2jGK2rD
	hG5Sn1jFpzlWrx1tyA1Ce6Ba5vgfGcrdr6y1W+13QLKcyL+5jmB4XOcIDsxwQFbX9LCF5kdI/OC
	wvUXb1fLimysA0U/mBw7E6+TTfLs2nN/4MqgUERCQIld3Hkvgs9QKcay2mAsHWFV3fk+AObGLjy
	WsZQhBVnpd56vUj2fhiJ3E17Q1f57e7gaHe5rI3/E0kS2UMPaEpyV79/zXIMrZfC2A60E1UtRWL
	VClok7G1QuglXKYhSra9rHs0BZXZJaPYUsE0=
X-Received: by 2002:a05:620a:3950:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7d41ec6de2emr680622385a.27.1750802071165;
        Tue, 24 Jun 2025 14:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ9fHkoV/UNBrYbzCE8KOXhxcoKaZPfC0YZXcuTxfotxJS8JMcPyOuiuju0adLpnbJWmTz4Q==
X-Received: by 2002:a05:620a:3950:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7d41ec6de2emr680617885a.27.1750802070535;
        Tue, 24 Jun 2025 14:54:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d6eb3sm1967318e87.244.2025.06.24.14.54.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 14:54:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libglvnd: drop recipe
Date: Wed, 25 Jun 2025 00:54:29 +0300
Message-Id: <20250624215429.3666511-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cuqbk04i c=1 sm=1 tr=0 ts=685b1e99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=DzVgi9rmcOW1Hsj9J5MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: hz521jwbmSUvKNf0nP1Nyyq4u-FxsQKs
X-Proofpoint-ORIG-GUID: hz521jwbmSUvKNf0nP1Nyyq4u-FxsQKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3MyBTYWx0ZWRfX2Lnp2hkjbQ9a
 C6HZIS1W0mX67fZ3pWuJzYODiGFtsPWg2CqkMgfUYBqN6CiQejOIWZjNL+1tWIFROoOY6C3VYAA
 97Tre5pGsDN4z5REdptTuA4nWpxTJ2p3QDmMeOUC1XZEeqI2iyauBejnPaVQHXmXVKf6BeQFFid
 +DOpl1AG6BlDew13uy9yAH9CzkAEcGQQCajlF5NAnDxEaCXRWcX5eDiZVoQOLDefZ2f/XJNSdBv
 E9f7z/9TAKs95QeKeKyATNtI7HJu9Y0miWjjz7IfUBNmd8kbFC3hFE8xQY0At9fPh6S62kD3dTl
 Od+9mzdeUmWSMm2c0Bf6jlKjsuDRyQobe53y5E6kiZkHDs2YKxAX4Bw7FHpYscFo0zbUy1eaBb7
 Jz5SInVGScF1wrjMKanEBGyiSmQHG4N0Gqr275pq0HusFTTJs0dXjy/6CjEOH0LI8WMz+dzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240173
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 21:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118102

The libglvnd recipe has been picked up into OE-Core. Drop corresponding
recipe from from meta-oe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../libglvnd/libglvnd_1.7.0.bb                | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
deleted file mode 100644
index a737a735b7ea..000000000000
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
-OpenGL API calls between multiple vendors."
-HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
-LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
-LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
-
-SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
-
-# v1.5.0 tag
-SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
-
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-inherit meson pkgconfig features_check
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ?= "\
-  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
-  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
-  "
-
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
-PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,libglx-icd"
-PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,,libegl-icd"
-PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
-PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
-
-BBCLASSEXTEND = "native nativesdk"
-
-PROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
-"
-
-RPROVIDES:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libegl', '', d)}"
-- 
2.39.5


