Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF23CD3436
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16092.1778066229952856591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O5GIwc/h;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso34496745e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066228; x=1778671028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuWeTgwZXT7xRrtRLcqfiCPoDsE6c7uFi0iXTurQp4c=;
        b=O5GIwc/htvXApc3mOJNomnvyWhLTZNakIGEOI2TBxd/yTIg6+gvdObnq5xNJm45jnB
         L9TeIoZOQ8g4gcH7pJ+JZXVJLqZML4MbCPHrz1XZkeq6/oSlz9MADISPStelTxHbkbnU
         w/eUfkbzuEGkxbPdZ8E0w3C2q9Lj/deNNUJWkPEdWD0fbdI9kZDgTdSHDix55fxGcRY3
         epfB7HzQ+dhUqRXnUurKvzyZZxFqJCzWohE0m1GlSrm+019Lvn4wR1XdcXjfYY4FmBRd
         t87T9I8NZVmlpIsyvmzpxSC2ViFiF0O0hqAN7guMTNvGH4o5CSgOiap97CuyVM2q9/LC
         2lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066228; x=1778671028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FuWeTgwZXT7xRrtRLcqfiCPoDsE6c7uFi0iXTurQp4c=;
        b=L6U8qDiH94+UYaf0jUse/9cL/EICuAdmXRgqwxAxmL1pB7WWGovEwZyj+wkxugGncW
         Y4nCxPlPiupk6al/BdX1WvzRsxQ7jlu5Uh+VFTdmRW+6hzdftNAFAuGDS1AzA9f61HnO
         6CibmnKYFzyfwfyEzsbMxpGTUfIerP5rWF2xLvZnAeWh1hlGUoXDG5Hg4ACfLNPw9BOv
         qQfoOu88rPauhpT43Qzik75GVx8Fo1GnEMo92Mm3hdqRtN0Y+kVKmpHZ7armijIjbQCL
         fczS+r+WNskq4dVrhm2+exquL6XD52M1aZ2UhqV2mO03IPnIRCMUp3Jh6I8aVFF/eRVN
         KcHw==
X-Gm-Message-State: AOJu0YwIGO/ZDgZxobRCn/JXwGy0RUCnO9uG+BByW47tc0Mxm05uXZtu
	h6vRV8Yk8Yw6Xa5QWgLMhvzoIWPkBqAoaJuj5t+h/Y7JaqAqGZ00Z9aWKCVy2A==
X-Gm-Gg: AeBDievI3RtRvcP4r+dixfngFrOb5i3AImnwQf1ZG+zFZX0UKujGBOorpwCLRX5fLeV
	dIHLBiCpfYfBLTlZ1iKVauLsGNA4H3zELar/PCVm8Z2489T2f9fp7Km21KsRtAFYNIm0iW/UzcQ
	u2wyIybITUufDpjfAlHEcWKm3dcGxY57dESq76H2/9g2bSlHapJtuYid7jelXZ4TBx3lx9/kkSP
	KUJe+PQbXOEigDTDVGAokAL161ZOJhadoO7dWE7wIe9tCYQ5+4UhKTaE8p04AJDxykBT86jHPhQ
	zTPOmyKPDuGYV3KYH1hZIkgWQ9qiNS9UNlrPxF76KlpRO3fdCmeH69DpwS5ZtWmXx+5IKB71uVH
	nk4Sdm9zuo/7yjTB4UoFcisHyIFcWAnbUHBLm/+bVLJ08S2FU+RurBh9x0mZtosQuRlDdrC5nrn
	FtNrwndAOzymVexBJ8yd+DgabvKpBqE0pwBQtABlg6Mutp/EmPUTtbv5JkKrh6Ys5bWn8Jo+jBR
	tB9reldQLYAxZL8uUI34A7lFY+doDwkTev6yspLWg==
X-Received: by 2002:a05:600c:8908:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-48e51dd879emr37761735e9.0.1778066227932;
        Wed, 06 May 2026 04:17:07 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:05 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 6/6] libcamera: 0.7.0 -> 0.7.1
Date: Wed,  6 May 2026 12:15:52 +0100
Message-ID: <20260506111552.2782-6-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506111552.2782-1-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126803

- Added PACKAGECONFIG for all available options, most of them introduced
in this version. This will make the package's outcome more deterministic.

This release brings 142 commits with the largest developments in the core of
libcamera components. Perhaps the most obvious is that we now use C++20 for the
project. The Configuration file handling has had a substantial rework with
updates to the yaml_parser.

The RKISP1 IPA has now added a new Hue control which brought with it a rework
of how we manage fixed point arithmetic with the Quantized class. I hope this
makes it easier to convey types with hardware operations.

The SoftISP has the ability to perform CPU debaying with multiple threads which
helps throughput on platforms such as the Arduino Uno Q.

The Mali-C55 pipeline handler now has full support for the RZG2LCRU and inline
handling which enables camera support on the Renesas RZ/V2H and RZ/V2NP
platforms.

And of interest in the apps components, the gstreamer plugin now has the
ability to select and configure the sensor mode configuration properties.
Finally a new script "libcamera-bug-report" is available to be packaged which
will help users identify issues when reporting bugs.

More on https://github.com/libcamera-org/libcamera/releases/tag/v0.7.1

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../{libcamera_0.7.0.bb => libcamera_0.7.1.bb}       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.7.0.bb => libcamera_0.7.1.bb} (83%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
similarity index 83%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
index f83372df43..74cb910417 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "b7854fd07d42168f099b5ce30d1702e0e0875bf5"
+SRCREV = "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
 
 PE = "1"
 
@@ -25,12 +25,18 @@ PACKAGES =+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
-PACKAGECONFIG[dng] = ",,tiff"
+
+PACKAGECONFIG[dng] = "-Dapps-output-dng=enabled,-Dapps-output-dng=disabled,tiff"
+PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils,libdw"
 PACKAGECONFIG[compliance] = "-Dlc-compliance=enabled,-Dlc-compliance=disabled,gtest"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[opengl] = ",,virtual/libgl virtual/egl"
+PACKAGECONFIG[jpeg] = "-Dcam-jpeg=enabled,-Dcam-jpeg=disabled,libjpeg-turbo"
+PACKAGECONFIG[kms] = "-Dcam-output-kms=enabled,-Dcam-output-kms=disabled,libdrm"
+PACKAGECONFIG[opengl] = "-Dsoftisp-gpu=enabled,-Dsoftisp-gpu=disabled,virtual/libgl virtual/egl"
 PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled,python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
+PACKAGECONFIG[sdl] = "-Dcam-output-sdl2=enabled,-Dcam-output-sdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[vimc] = ",,"
 PACKAGECONFIG[virtual] = ",,libyuv libjpeg-turbo"
 
-- 
2.54.0


