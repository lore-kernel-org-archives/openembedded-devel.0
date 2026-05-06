Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2C9CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16082.1778066224287409997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N3cYbJn0;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so50881235e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066222; x=1778671022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0RqyX/oSx964XGHclIa0gpzwAv6Hq8XFCPQ4FQEUdY=;
        b=N3cYbJn0brAajK+A6CV+M4dcvVanVClL5uPXxbCjrpxtIzcG0Jhmdi6DAIdb/F0zSO
         ydmmH+giJA19XQGqy+eLC6Ml3u+umcp4yGogwfi2jmGAtRa5uzfDX18wUexTZwxsv8gM
         VmBYW96e68WJiySqCxhmDgFoF0cqggOvXMCvLVXIzC5+N43N+cbdf91TL2qkROyi0m6/
         IP08aQwuOWGODNYWVgy/YP6QCAU6Qj+3mt6cJyUOkKATyvVMJ6Lg/aQ34IHsWehcWn2K
         egc6r3zbLyp/f6pA2xSzMC9EgX6CyrB0Wa8Q4AyIwoEhV/9mDApliLncwy0xR75JT8tB
         Kj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066222; x=1778671022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0RqyX/oSx964XGHclIa0gpzwAv6Hq8XFCPQ4FQEUdY=;
        b=n/37m31i3fWb0YVnVeKdq2pkuHgLR4p9eDFAcFy0I+JW4jLC7m1R5MGSDDNyO8zMnc
         t40iiFYDkuA2lI+rjy9NYCIGCAM3gGq0ytgA5jJ2bxBIExKz5v4IPkqMwEQc9kq883rU
         Be7htrNyKMSvfElmKJ1I1PR+9Pu4c436YJPygzMyj4U2CB8r67LaD3DgSUVp81lYJINa
         7pLvcOrl8dgRCr9BnYUuFGx9RLZH7ORPrWW5TCkYgVr4XjxmCt1brbxbuQCCzQpWivip
         MgjZ3bLyKFoaFXJOIrVMzHvoxEl3jn2SrLDr59Ca+WH7a/FX8wSzj3HvaB4NSGZUKkUs
         vwEQ==
X-Gm-Message-State: AOJu0YyrFrICYG7odSEcSZV9aaBRReE8fQLOC0wk9yg3Ffi92vwZGWk/
	lth9EkDYO+2s5N8DO+ZhPTnmmwe+roI7I7jmgGpIyoYR6m+EgFxJy4HPHfwryA==
X-Gm-Gg: AeBDiev7IPeqpmbj0ktlxzwmQrAGTG6ZqRbz90XKZQDK1f75HYrFKWU8gnRbJAhSnnS
	VDQzNdbfhB6KKKfAljtpfNTNoB9yQPdKbQXYqZBLhRiEc9OgyyICX8Ae9oQMfw7cs05sJOscMPB
	ZeRExxpFnq8vQuYT60Lxb8a+Z/UgAH5JSlAE1PV/ncDFpr6BWIvScqyr5dhxN79HBa+O9bgzegT
	IoJqdzfmBROi/hfkujeuJmMyu7TF8gglD2W7rtPmtSqz+eDP/mk9DKwuagLeY4nI+/COPhuPv0v
	xjQPKDSyiJZFKn/5kUrKH0yxHpWoayscfiRk88aym5rTdNCHqNblSmI3XGZbb7qmY4Uy8d7HqcN
	lKNJD94JBJaaOCXhk1+HpcEXIhFV2scdY5f7vXM3QSpAEfFQ9oTV9z2STziIMMHc+gHCDhK6jVm
	6q8K1aa3q6Lf5kQNGfLXSIDfL2R3Xe3IN2o68tCUr7ocG76E6qmvQIJO6dgCS/Kax5kq1uxNnEx
	JoTmSKneZM0jkBjZOdwHeb0LMjtibU=
X-Received: by 2002:a05:600c:3548:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-48e51e0a60fmr52010785e9.2.1778066222148;
        Wed, 06 May 2026 04:17:02 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:01 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 2/6] libcamera: add configs pipelines for testing
Date: Wed,  6 May 2026 12:15:48 +0100
Message-ID: <20260506111552.2782-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506111552.2782-1-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126799

vimc:
Is a driver that emulates complex video hardware, and is
useful for testing libcamera without needing access to a physical
camera. We would like to add support to the libcamera vimc
pipeline handler for multiple simultaneous streams, to ease
testing of such mechanism. This also requires adding multistream
support to the vimc driver in the Linux kernel.

virtual:
Is a specialized handler designed to create software-based,
virtual camera devices. It allows for testing, debugging, and
simulating camera pipelines without needing physical hardware,
often producing test patterns (e.g., all green frames) via qcam.
This enables developers to emulate camera sensors and
Image Signal Processors (ISPs) within the libcamera

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-multimedia/libcamera/libcamera_0.6.0.bb       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
index 4dce26a5d0..1f9e21e45b 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
@@ -28,12 +28,16 @@ PACKAGECONFIG[dng] = ",,tiff"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
+PACKAGECONFIG[vimc] = ",,"
+PACKAGECONFIG[virtual] = ",,libyuv libjpeg-turbo"
 
+ARM_PIPELINES = "imx8-isi,mali-c55,simple,uvcvideo"
 # Raspberry Pi requires the meta-raspberrypi layer
 # These values are coming from the project's meson.build file,
 # which lists the supported values by arch.
-ARM_PIPELINES = "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi', 'rpi/pisp,rpi/vc4,', '', d)}"
-ARM_PIPELINES .= "imx8-isi,mali-c55,simple,uvcvideo"
+ARM_PIPELINES .= "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi', ',rpi/pisp,rpi/vc4', '', d)}"
+ARM_PIPELINES .= "${@bb.utils.contains('PACKAGECONFIG', 'vimc', ',vimc', '', d)}"
+ARM_PIPELINES .= "${@bb.utils.contains('PACKAGECONFIG', 'virtual', ',virtual', '', d)}"
 
 LIBCAMERA_PIPELINES ??= "auto"
 LIBCAMERA_PIPELINES:arm ??= "${ARM_PIPELINES}"
-- 
2.54.0


