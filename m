Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B379FCCD195
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:24:23 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.10132.1760624660947533951
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ySENRXGG;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47114a40161so6550135e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760624659; x=1761229459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMvyaCJ2VeOiQ9oHEJ943GuPtR53qZEcZwzo+lVx3G4=;
        b=ySENRXGGFkLvGXHV38twT68R/3t8vsCwKuRMagFB6/FcYBZsCr7pUZUHx7c56QII9b
         mkkHvnZueIv7FRmPDkW+Kh0A4ouQb/f6nxryPiFY8p/gATkqt+44MxDhgOzTdJ05PfVL
         DnR/i4sYGgviZ8BpBgx3T3KbBa+ZW5ICsyFbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760624659; x=1761229459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMvyaCJ2VeOiQ9oHEJ943GuPtR53qZEcZwzo+lVx3G4=;
        b=omqoyrsAJAwXbRXkellN8Xyq680rdynZWp9OlQNpqp2wYYIz5hjhgFZYATnCg2teIR
         ohapcx4KOJSMugtoOUAPv0VowOYWYF+L67CVNai1HNYncd1IRQcB/QDgiT7k5rxPwJJk
         hibVzUUTQVpAtx6fnCTY8TtfEPu7Ozq9iy5Ssxt7t1TF4Daq1dCHDY7JyusNMT+ZWlcZ
         1GG862vsyUofEGaD7RJWQ4wyU915JVrifkTzXHvet1/lwX/oYTdQsugmYHY629AkOyl9
         txAUnm5bCPaDkRr3k4jMRom1+p0XtTJV/21V1XiM0lDbOaCyQvrHoQtWVwquE0ZPBQJ/
         mChA==
X-Gm-Message-State: AOJu0Yy0HEM/TSSOk6md2Int18bxz7wtacIuPI0t8khNfVgYo+ZOODmI
	XFYBlBz2MuKTMkPF5Y1OZ/lc4LtT9et/DfY75689Xc5tm5o2tVgPCOmzMsAWDmnOthpK6SifTC1
	tdOcuWCfLCs5e
X-Gm-Gg: ASbGncuv7ppWrqFBl1eGSqA7rZdqruvzt9OsLfFc25Y3AtbBXTsDKCiCCt7nte/2cgx
	G2WYVpJJL9Mm/hfNQewjNVWGdMGsT4yJwJ2al0bmfgeYL4M/gskNfZQ5MeeZ4hkr8we4dHZumgU
	dqTPISsPFKgwuYGoAF7M7OqxBrYmL/RfB763QnDVICwADvTF8zj6t9VvaGHHSzjscf19hvG9YnS
	G2vQxgsBKHjf4smqfn5qFieeZ0XtYMEU3boruqbm40ruNdndmqmPk8cFictwQOt5X0GxXHw91gi
	UbFmqABaxGC2tdHdEpTyCFwadbh/JD6A//y4qazdmmKYSQ1kQT7ttoGqIJc1LovhRcd/bVVn79U
	ZbfoVnw/eK1o9Ct18Odx038n2Oid19Pn9l0M6jwLC+7n0k/77wkpwdikBb0tzlALGFQOKhDXW8Y
	vr9X6mzdMqeYg=
X-Google-Smtp-Source: AGHT+IEi8AuAe9OcSUwKMQAX0YZVeXs66BRmsEb+zAMlcqW6dFZfcmVHqTuVMR73icFxdtaLwvHqtQ==
X-Received: by 2002:a05:600c:821a:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4711791dc89mr916555e9.41.1760624659242;
        Thu, 16 Oct 2025 07:24:19 -0700 (PDT)
Received: from heaven.lan ([2001:861:3080:b0f0:6448:db2c:bea7:b817])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8141sm34634013f8f.48.2025.10.16.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:24:18 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: pkj@axis.com,
	Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [meta-oe][PATCH] opencv: limit features in native
Date: Thu, 16 Oct 2025 16:23:49 +0200
Message-ID: <20251016142349.1055072-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 14:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120739

Since commit 91e428d4cd5a ("opencv: Support building for native"),
opencv can be built on a native target. However, not all of their
PACKAGECONFIG dependencies (ade, libgphoto2, ffmpeg, gstreamer1.0 and
gstreamer1.0-plugins-base) can be built in this context due to the
missing native BBCLASSEXTEND.

These recipes would need to be extended for native build, but specific
work is required to ensure they work properly. To make opencv-native work
for now, remove the above features by splitting PACKAGECONFIG in 3: common,
native and target.

Effectively, PACKAGECONFIG for native is target minus gapi, gstreamer,
gphoto2 and libav.

Fixes this warning from AB[0]:
WARNING: Nothing PROVIDES 'gstreamer1.0-plugins-base-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'ffmpeg-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'libgphoto2-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'gstreamer1.0-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'ade-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing RPROVIDES 'opencv-dev-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'opencv-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.12.0.bb RDEPENDS on or otherwise requires it)
[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/469/steps/13/logs/warnings

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 27499caa92..54b19edcff 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -86,9 +86,12 @@ LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
-    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
+PACKAGECONFIG_COMMON = "python3 eigen jpeg png tiff v4l libv4l samples tbb \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+
+PACKAGECONFIG:class-target ??= "${PACKAGECONFIG_COMMON} gapi gstreamer gphoto2 \
     ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
+PACKAGECONFIG:class-native ??= "${PACKAGECONFIG_COMMON}"
 
 # TBB does not build for powerpc so disable that package config
 PACKAGECONFIG:remove:powerpc = "tbb"
-- 
2.49.0


