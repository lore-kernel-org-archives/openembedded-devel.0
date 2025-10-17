Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69568CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 09:21:59 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.11450.1760692909749514437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nPiIKFUD;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47103b6058fso12457345e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760692908; x=1761297708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LCe0oujtKi1L8jxac+HkpYQrAltThMgLrxeITwJJgi8=;
        b=nPiIKFUDuXVNDwVvpvX5YezAUIkRrKBUqCPi2JPcFXbjD7wbrghWmNth1h8I2nY1Kw
         M8g79H+EZahPA5UFdLbS3pb7dy83ZycVfPgbCwBQ6MHHNu3K2SxKSV600p7b4hfge2aV
         tPzzUnVwbq5U8LDRE0liJOD/FKEUO1n+wGu/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692908; x=1761297708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCe0oujtKi1L8jxac+HkpYQrAltThMgLrxeITwJJgi8=;
        b=ThsW+szeigM9knFvLXa7VTL4fPxJa3rg7UZ39M2dRo2+itiAg78HfgfIRAcSImkEbl
         xsWUFMKhpAGBm6LmCbO2IZX+c53UFVOey/2RTDLkhPtiA0uzqlzNkVQ6BUckE4VP1IzF
         6q/ZLK8IllQia4w5A6i0UK7h0KpCfMrmJH6G6hun2lZbUTngWLb5vGjDopeVFGTT1bDb
         dDqDITRrN8jK1MFm89LUfPv5gWBdBO8kMNaNz4TGwFo6ot8M89+1sRrextdmQi+m0ppV
         DfACcYumpu8kMtxs62f47G4cP/YznHVYr/ka6t7U3Gu/4FOXaI0OJnsQSvj1kkLQBPYP
         0rYg==
X-Gm-Message-State: AOJu0YwdaMCNDkcK9o4zWwq35KSODNzSu6BBWy/UESuSHsU4gZfHwF2B
	BHMNTDuGr9+OpCnFxEDCycwWhYYIWStUJ4lgiXV2JnWkVT4aHQqAOVsFs/s99n6LTPCN2HcQcGV
	G9O1W36LwfiNk
X-Gm-Gg: ASbGncsD5I2CNFjFTnsOsjVkuu+F4oksWKc7uHmgCpfyGhspkPN6WiXlCcFmXSBsz3i
	HT9lJ5lWhdP5Thg99A5qLZZoBZGKeHjhkEbp7Ee0xYy8AE/vqNhqYal54VnDSiLJePCc8nSxPjv
	OB6lFAd7Mt9oznTnHKTOSr6PvljvWCc3qpZMchUOy7sxTAdZysxComH+cYlHtXtPOUme5M41n4w
	fMnFkCMoxfgEZYmsVkco6wwthIqZ0e4UwyNRKsRkjAR2fgfAwk0n41GXlA9GOuyxADe/rhZRqGt
	saNkeJ+kkgoHkEcz2Tsxxyc//qXCQwhXV8x4KbS5FnJhnEQFuBKtXZXR9uLKsFR1DY12Jk91ZfK
	catfqKp6kauLRSB2zbkuSpQOwog57EEUjOUAhAYV8wwPpvzMRxxnq95zQklXduUVfxLTVEArIzX
	7MVtY6lw==
X-Google-Smtp-Source: AGHT+IG/aEj/d0H6NXnJ7FOgt3Y+1NyIaY431N2GmC07O1xxoNqUb9oeulu1Ly9HJBA6minxPKQl8w==
X-Received: by 2002:a05:600c:470b:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-47117315a43mr24158835e9.15.1760692907975;
        Fri, 17 Oct 2025 02:21:47 -0700 (PDT)
Received: from heaven.. ([2a01:e0a:25d:d2b0:d59a:9e09:f40:c107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144238easm72973365e9.4.2025.10.17.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:21:47 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: pkj@axis.com,
	Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v2] opencv: limit features in native
Date: Fri, 17 Oct 2025 11:19:33 +0200
Message-ID: <20251017091933.1094941-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 09:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120746

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
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 27499caa92..aa11d3da43 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -86,8 +86,9 @@ LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 EXTRA_OECMAKE:append:x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb gphoto2 \
-    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)} \
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l samples tbb \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
+PACKAGECONFIG:append:class-target = " gapi gstreamer gphoto2 \
     ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
 
 # TBB does not build for powerpc so disable that package config
-- 
2.49.0


