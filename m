Return-Path: <peter.griffin@linaro.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 397366BDD2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 23:38:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 81so254105wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=QQMwpnWUMwf6guJQK7tXegDe6l/PI3G7l8xegU1dPk0=;
	b=OUW6/KPFbkAghyL2C41qZqjwb6yId8NFqldvcRr7s4HYhMB7a2HrI3Kb5V600/Pi6k
	FeKbgjE8vFKl6VjX0VqVSV8w2ty24vzMVaI+vmpiagjxLNvE2x0CzgnYdURVEsPBETgH
	Pevjgl4PCF5GfI/zNpO/JIMhEeBLvGeKZmYnfcc5dNna5v1O9kgxgTudn3kAQa88Bl/7
	X+bXJRvZgd3v/Gdh2Zy+BvaErJghL2hyVYro6MO9l5LnoONg+gvvglOcQ/1KbtAUP4uI
	jmwT90zg3NmjjcpeeeWXvjJiuFoAvsVc+wcRtORswkqmRJa2YU5qfp5yj7WaxubdxjQN
	c7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QQMwpnWUMwf6guJQK7tXegDe6l/PI3G7l8xegU1dPk0=;
	b=k3mPgddmFxoYNz+oqgbTdwjp220TNNC28iWbIcTCuNZCJZ3KaxigDIhRdSXEgQ9IiW
	jutqWHS5eB32nOG0LREEiezUk9prGT+2qbxj4gWJDiaSPUYk+IHJkDQYm97LgNGlFf9l
	KvcVmkficE2/zvrlVIKzEUYGLfnNu3kFpkgvH+DEzDuCIjNxFIwuvNaNChERKJOQsLGA
	+UIkSxRlUDffcldvNzpU9GDKdkjcDKGjSDbUf3JRNo39tPWJWd8G+vI4XN79R770qswF
	yZzFvFv3PnmWzj67URkbizHEtpaQhHSd8J2MzUpxen67KhBLJoiuz/DKP/zG3S0hwdE7
	iv7g==
X-Gm-Message-State: APjAAAUyhLnyKQbt9Pi0nFemdDWuG/L78LN1xGygumy3f4bNGNNWWCkI
	c079NqWHRBHFLhe0Te2vxEDW2Q==
X-Google-Smtp-Source: APXvYqwyvmq7vSRu8C4v+Zg7LCdZwCkmR/ZDbRIR1L+uWMeSVFxuf7SnsCv3xp6mMrw/wg+6qdiYjg==
X-Received: by 2002:a1c:f202:: with SMTP id s2mr3617787wmc.15.1552693115885;
	Fri, 15 Mar 2019 16:38:35 -0700 (PDT)
Received: from localhost.localdomain
	(cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net.
	[86.31.179.135])
	by smtp.gmail.com with ESMTPSA id 93sm7130847wrh.15.2019.03.15.16.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 16:38:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: eric@eukrea.com, denis@eukrea.com, otavio@ossystems.com.br,
	openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 23:36:32 +0000
Message-Id: <1552692992-23605-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: stanimir.varbanov@linaro.org
Subject: [meta-browser][PATCH] chromium: add 2 fixes for v4l2 VDA support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 23:38:35 -0000

The first patch allows GpuVideoDecoder to actually get created.
Without it chrome://gpu report hardware video acceleration is
enabled, but actually ffmpegVideoDecoder is used for the decode.

The second adds NV12 & YVU420 formats for all ARM platforms,
otherwise V4L2 VDA on dragonboard will error with NV12 buffers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 ...2_device-allow-NV12-YVU420-on-all-ARM-pla.patch | 26 +++++++++++
 ...lt_decoder_factory-create-GpuVideoDecoder.patch | 51 ++++++++++++++++++++++
 .../chromium-ozone-wayland_72.0.3626.121.bb        |  2 +
 3 files changed, 79 insertions(+)
 create mode 100644 recipes-browser/chromium/chromium-ozone-wayland/0001-generic_v4l2_device-allow-NV12-YVU420-on-all-ARM-pla.patch
 create mode 100644 recipes-browser/chromium/chromium-ozone-wayland/0001-media-default_decoder_factory-create-GpuVideoDecoder.patch

diff --git a/recipes-browser/chromium/chromium-ozone-wayland/0001-generic_v4l2_device-allow-NV12-YVU420-on-all-ARM-pla.patch b/recipes-browser/chromium/chromium-ozone-wayland/0001-generic_v4l2_device-allow-NV12-YVU420-on-all-ARM-pla.patch
new file mode 100644
index 0000000..20c2ae4
--- /dev/null
+++ b/recipes-browser/chromium/chromium-ozone-wayland/0001-generic_v4l2_device-allow-NV12-YVU420-on-all-ARM-pla.patch
@@ -0,0 +1,26 @@
+From 676525a5cc0e5cc38ef59306413365811ee051ce Mon Sep 17 00:00:00 2001
+From: Peter Griffin <peter.griffin@linaro.org>
+Date: Fri, 15 Mar 2019 22:49:11 +0100
+Subject: [PATCH] generic_v4l2_device: allow NV12 & YVU420 on all ARM platforms
+
+Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
+---
+ media/gpu/v4l2/generic_v4l2_device.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/media/gpu/v4l2/generic_v4l2_device.cc b/media/gpu/v4l2/generic_v4l2_device.cc
+index a1294ae0b..2b587ca 100644
+--- a/media/gpu/v4l2/generic_v4l2_device.cc
++++ b/media/gpu/v4l2/generic_v4l2_device.cc
+@@ -200,7 +200,7 @@ std::vector<base::ScopedFD> GenericV4L2Device::GetDmabufsForV4L2Buffer(
+ bool GenericV4L2Device::CanCreateEGLImageFrom(uint32_t v4l2_pixfmt) {
+   static uint32_t kEGLImageDrmFmtsSupported[] = {
+     DRM_FORMAT_ARGB8888,
+-#if defined(ARCH_CPU_ARMEL)
++#if defined(ARCH_CPU_ARM_FAMILY)
+     DRM_FORMAT_NV12,
+     DRM_FORMAT_YVU420,
+ #endif
+-- 
+2.7.4
+
diff --git a/recipes-browser/chromium/chromium-ozone-wayland/0001-media-default_decoder_factory-create-GpuVideoDecoder.patch b/recipes-browser/chromium/chromium-ozone-wayland/0001-media-default_decoder_factory-create-GpuVideoDecoder.patch
new file mode 100644
index 0000000..d66abae
--- /dev/null
+++ b/recipes-browser/chromium/chromium-ozone-wayland/0001-media-default_decoder_factory-create-GpuVideoDecoder.patch
@@ -0,0 +1,51 @@
+From 527edf2f2240f33df3c5a946185a1db771430eed Mon Sep 17 00:00:00 2001
+From: Peter Griffin <peter.griffin@linaro.org>
+Date: Fri, 15 Mar 2019 15:44:06 +0100
+Subject: [PATCH 1/2] media: default_decoder_factory: create GpuVideoDecoder if
+ mojo disabled
+
+Despite chrome://gpu showing video acceleration is enabled, the
+GpuVideoDecoder never actually gets created without this change
+applied.
+
+With this patch applied, VDA is created and used when playing back
+video.
+
+Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
+---
+ media/renderers/default_decoder_factory.cc | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/media/renderers/default_decoder_factory.cc b/media/renderers/default_decoder_factory.cc
+index 1229941..a71efb7 100644
+--- a/media/renderers/default_decoder_factory.cc
++++ b/media/renderers/default_decoder_factory.cc
+@@ -86,7 +86,6 @@ void DefaultDecoderFactory::CreateVideoDecoders(
+   video_decoders->push_back(
+       std::make_unique<DecryptingVideoDecoder>(task_runner, media_log));
+ #endif
+-
+   // Perfer an external decoder since one will only exist if it is hardware
+   // accelerated.
+   // Remember that |gpu_factories| will be null if HW video decode is turned
+@@ -97,14 +96,12 @@ void DefaultDecoderFactory::CreateVideoDecoders(
+     // factories, require that their message loops are identical.
+     DCHECK_EQ(gpu_factories->GetTaskRunner(), task_runner);
+ 
+-    if (external_decoder_factory_) {
++    // MojoVideoDecoder replaces any VDA for this platform when it's enabled.
++    if (external_decoder_factory_ && base::FeatureList::IsEnabled(media::kMojoVideoDecoder)) {
+       external_decoder_factory_->CreateVideoDecoders(
+           task_runner, gpu_factories, media_log, request_overlay_info_cb,
+           target_color_space, video_decoders);
+-    }
+-
+-    // MojoVideoDecoder replaces any VDA for this platform when it's enabled.
+-    if (!base::FeatureList::IsEnabled(media::kMojoVideoDecoder)) {
++    } else {
+       video_decoders->push_back(std::make_unique<GpuVideoDecoder>(
+           gpu_factories, request_overlay_info_cb, target_color_space,
+           media_log));
+-- 
+2.7.4
+
diff --git a/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb b/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb
index 6765e7e..6208809 100644
--- a/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb
+++ b/recipes-browser/chromium/chromium-ozone-wayland_72.0.3626.121.bb
@@ -38,6 +38,8 @@ SRC_URI += " \
         file://0033-ozone-wayland-Fix-software-rendering.patch \
         file://0034-ozone-wayland-Return-primary-display-on-null-window.patch \
         file://0035-ozone-Implement-single-window-tab-dragging.patch \
+        file://0001-generic_v4l2_device-allow-NV12-YVU420-on-all-ARM-pla.patch \
+        file://0001-media-default_decoder_factory-create-GpuVideoDecoder.patch \
 "
 
 # Chromium can use v4l2 device for hardware accelerated video decoding. Make sure that
-- 
2.7.4


