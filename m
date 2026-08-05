Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C475C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 12:50:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37813.1785927367711451490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y95xzXsf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JwAwCMSy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: daiane.angolini@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dT9l2663446
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Aug 2026 10:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k0DKOyP6gs1kyrh/NzVTXQRLamEy/DZJ12z
	pqOpuIjg=; b=Y95xzXsfwldbk/aMfpWtaCBokIePcJmiQKPn/K3W3EwmrWjbCZR
	KsDUrI5iXhleLwTsv6cu+J6+OuKc9VBqX9nXtD3Svk6xl/+Qm72UVMe4o0Bl3Dcz
	LYACBRWImqaoopYh93IFbLXuyyoHGiDW2OlJ5fNjyqNKAd0vTjSwGCLiyYAmIrMS
	wusCyyofi2hLAoGn82r5Gh3DQcmRpnC2+q7tJqCYrsgDNGcXsUgQ29KyX8nCrgBY
	GpOqOo1SDtoorsO1beaHUM9MJvQxTm42ur+eyCZw7BFKUiH8CnEfh6Lu/902Oovf
	BIdqJhOeSc9Fizp98VhRCNTA14kXbam6weQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w8ug6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:06 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ad778bacbeso991456b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785927366; x=1786532166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0DKOyP6gs1kyrh/NzVTXQRLamEy/DZJ12zpqOpuIjg=;
        b=JwAwCMSyWTHYX6wMu2c0CWrJcjfLA3MuxS538s4r6XZi73VNGK2NgohYJuJRMMp15G
         X9ca6uh9iviXHBKMnJ1HLC9RDJvauI+HX5lya0KQQJ3JvBYyXBaQYI84nDKuxbR4o4qd
         ktlS6aAUWyQ0UNPYvFmgiBj2RODnBUbS+mc/YDDJsvKlEX7+WoiIHnlVhL4rB6OgrbkV
         RhfPHV+FEkF6B57Umy0GJdRnMYu04ogPh7LudaDC2INWHuXoiuOG86Qyr2Ik/kJ3AD3D
         fiG4FHAw4GkyjCNSwjZY/g5HQkMQ5VoQwrFE9l2VKv3dJ0DYpPzzzT4/QCDZmyBQd5uc
         IKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927366; x=1786532166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0DKOyP6gs1kyrh/NzVTXQRLamEy/DZJ12zpqOpuIjg=;
        b=e5t2Kg0OCv40gxqEfy7B9ksjv2InQXmxHwScyxL2V1j0NZ1uEPloadpNO8YEpTByJ0
         4MKbBpY3/ROyE4ptXSAJjb4r3g1YzOMVU08vX3DnTroxP9Bxl+GdYJrGfp4kmOBO2kie
         BxzfSFs8hA8/+j9pz7oeHlAkI12vbDx2coUC3JuPzasSp0/uZj0Kqs88+SZGu14NJxLr
         kYNv5UP/7kBVSMbrV4lC5QZ/V3D+8ZV4u2sXKBArJSylSBb0Y5nnYU/LnyAksPPXYsvO
         GN4tcWeyjC93fR/x7Cbn+xHp/brGHXfQtcmNs2viQQLnX/sqFRRitCM/j/OdUaNXkm38
         wdlA==
X-Gm-Message-State: AOJu0Yz/srq4EEoQQpmGaXxz6s+YheqaPHPltiXOKtBOwx0qHcirhk+A
	NVPcjLZMxynapROHOIaEiBzR+6InI/nQyieFVdgIf8ZxZBzeecnfBPV/0+vMmYdjRtJF7Wx79lu
	WvH6FifbqZz9KtVDRP1JviVSyVucYYowsJz99hGi1wDI7R8akqd40fLCkla04P5dBPJzpJIK3Ie
	/xrKPsYHudrD6gSRFi
X-Gm-Gg: AR+sD11TZmKbmOf4iJY7k4atLX7PsqsAUZoNk5RU9hJtKlTpO4Kc1FExDa6ZkeYDuv1
	npEKldtfbBQot+8ae/U4dcVg5YbYsCJ2HFtGeyDMsEeSpzEvmaRHlTm5CPAIg9l9rLoimizcgVL
	CknYr7paw3Sp0jyuMzm6iw0wZTisnJhpO+Hc/pzI3IgyIRrWqeQMn79AYatJpKBo1yh/FnDvlD2
	fZ9zVpbNo+xdgl9h68irw0tMpbntC1VSyaRfxUbjp6isyY57vVfV1yA2vtadWFYUqkDFlbziIbj
	NcLHNuyyByW19jLm5de74M5ENj6yavWE5FM8doSA+V9O6pl/JlGh9Ffv2RpKLwJb969nl9GAXKu
	Uosg/HgOIhhOi6g==
X-Received: by 2002:a4a:ec4c:0:b0:6aa:f920:6b1a with SMTP id 006d021491bc7-6ae96d026demr2949704eaf.16.1785927365594;
        Wed, 05 Aug 2026 03:56:05 -0700 (PDT)
X-Received: by 2002:a4a:ec4c:0:b0:6aa:f920:6b1a with SMTP id 006d021491bc7-6ae96d026demr2949688eaf.16.1785927365137;
        Wed, 05 Aug 2026 03:56:05 -0700 (PDT)
Received: from nina.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae93cbf80asm2328553eaf.1.2026.08.05.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:04 -0700 (PDT)
From: daiane.angolini@oss.qualcomm.com
To: openembedded-devel@lists.openembedded.org
Cc: ankur.tyagi85@gmail.com, Daiane Angolini <daiane.angolini@foundries.io>,
        Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH] libp11: backport fix for missing p11_ver.h in installed headers
Date: Wed,  5 Aug 2026 07:55:54 -0300
Message-ID: <20260805105554.2211765-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX0DkpQZirLNz5
 adeMHeH2Cv3Be6R5fYUEB+EWl9HrZpzDa6srksmf/cTvQvYI8ddPcpEifO5LRRAffnOAUiUxPAF
 ZDoyKQNTgoQCaqLf4iLUIUDKupgrG0I=
X-Proofpoint-ORIG-GUID: q00SHlAYdA0u0j6tIs2xn78hA_t7hoxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfXyU+kiNVIKQ91
 k8uGHi0h7OpSmtoByqdsZLhiTGtXmFijBVgr4H/W3IDXRGhPORvJ/Qt38GZuGO2fMi/RfDo5rga
 A5BHgIMQrKA+4H9KJ4d9sv4S8WrLRljavNmo55opaLg8jUX0hUQR5YetrYW1wMGdXU+LU9sujEZ
 DgqE5CPfZY/9zvfhvgTi/g1bvi+RKB14yNyObsZjST1GY27hWmjJf7cfpqQ8x5VpT82GUsEvBTs
 M5CGdtkuhXJzEig/szfk5FZUNGxYSpOHKHtlZYZX4PArtc/ufRkfxr+UY5KFVLRKtRkD2DZBIcC
 SfBCXo/oX/u6HMZHUThU9VlK9KfjBU7NiPaPdTXXeiyKRNCPBgyiprGnIkSO/LD9H5gtzyMtfdw
 ozECvFNlP5hEesXvYBujqztjM86N91TvT0PBTzrowsv9gMreiVrVBqta4HiMIkVjcfcul9drBXD
 l3VKuZtMF0DdO6tqx5Q==
X-Proofpoint-GUID: q00SHlAYdA0u0j6tIs2xn78hA_t7hoxY
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a7316c6 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=YgCaCOmYaX3w2HhRi5oA:9
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050086
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 12:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128818

From: Daiane Angolini <daiane.angolini@foundries.io>

The installed public header libp11.h includes "p11_ver.h", but that
header is generated by configure (from p11_ver.h.in, via AC_CONFIG_FILES)
and was never listed in include_HEADERS, so it never gets installed.

Any consumer including <libp11.h> therefore fails to build. For example
rng-tools with PACKAGECONFIG "libp11" enabled:

| In file included from rngd_pkcs11.c:28:
| recipe-sysroot/usr/include/libp11.h:28:10: fatal error: p11_ver.h: No such file or directory
|    28 | #include "p11_ver.h"
|       |          ^~~~~~~~~~~
| compilation terminated.

Backport the upstream fix, which adds p11_ver.h to include_HEADERS. It
landed after the libp11-0.4.19 tag and is not part of any release yet,
so it cannot be picked up by a version upgrade.

Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 ...-p11_ver.h-file-to-installed-headers.patch | 32 +++++++++++++++++++
 .../recipes-support/libp11/libp11_0.4.19.bb   |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch

diff --git a/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch b/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch
new file mode 100644
index 0000000000..a8276179a1
--- /dev/null
+++ b/meta-oe/recipes-support/libp11/libp11/0001-Add-missing-p11_ver.h-file-to-installed-headers.patch
@@ -0,0 +1,32 @@
+From 007043d355a9f7f1cd3cb6e80d16cad609fdf2a1 Mon Sep 17 00:00:00 2001
+From: botantony <antonsm21@gmail.com>
+Date: Wed, 22 Jul 2026 02:50:28 +0200
+Subject: [PATCH] Add missing `p11_ver.h` file to installed headers
+
+Running `make install` does not install `p11_ver.h` header which is used
+by `p11_err.h`. This PR fixes it
+
+Found in https://github.com/Homebrew/homebrew-core/pull/294427
+
+Signed-off-by: botantony <antonsm21@gmail.com>
+
+Upstream-Status: Backport [https://github.com/OpenSC/libp11/commit/007043d355a9f7f1cd3cb6e80d16cad609fdf2a1]
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 92d3fdb..549ac67 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -9,7 +9,7 @@ EXTRA_DIST = Makefile.mak libp11.rc.in pkcs11.rc.in
+
+ # Headers
+ noinst_HEADERS= libp11-int.h pkcs11.h p11_pthread.h provider_helpers.h util.h
+-include_HEADERS= libp11.h p11_err.h
++include_HEADERS= libp11.h p11_err.h p11_ver.h
+
+ lib_LTLIBRARIES = libp11.la
+ enginesexec_LTLIBRARIES =
+--
+2.43.0
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.19.bb b/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
index 237256e551..ea40e6d4b4 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.19.bb
@@ -9,7 +9,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
+SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV} \
+           file://0001-Add-missing-p11_ver.h-file-to-installed-headers.patch \
+           "
 
 SRCREV = "ae5756ccf5cb7929bb8edc986a9e6a65584406bd"
 
-- 
2.43.0


