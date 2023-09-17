Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87950CD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 10:54:48 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.27711.1694948084696005411
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 03:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WyfAFU9P;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-530c9980556so1122979a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694948083; x=1695552883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYDg2C5fKbyfeb93y9rpi7W0hZG+jFC2DPzPy4a5nkM=;
        b=WyfAFU9PZy0+CFXjga+33Me9963A6wk9me5bsu+Twrnae49zlz4Ir5p2GjVYRGBi3M
         cYaJfGcf4gYvctqJ9pT1gWcpzHGMsCxeU5wjGgd5Tg+I13709TVuY/XVo5TKdaFx4YxI
         4ggQPyNk/zLYr5YKZBlLjsqKh08CcncQ3sSzIdIBOc6IWLHt/y8+evEEpE/sExj5PIUM
         uP+hOqPaUE/SP6W+agwR8KaoBlBENGLS2p6CUCsXlP69j2stbZgHTlvHzPzbm9kKtzMs
         WwR8PxCPj75Xsg3ZmgrxrABED5/qLRoZa/u0eNIy0M7EaZLh5t5muDRJdyT+DRdgZK3s
         6ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694948083; x=1695552883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYDg2C5fKbyfeb93y9rpi7W0hZG+jFC2DPzPy4a5nkM=;
        b=rbeRqTZuq8u1up3Kd4Lzyg4QxDi3C09dtHfZBxDkwVCqsSV/q5mnvrR5XTf7C21Ltd
         UN823t6eYP1kDClQ1AGJbDiDESf0mkAjxkKOvxp3hnwo/vrOF4hlsKT78DOav0It2Ttg
         3d1CWLhcLBi5LUtcI2ed1WyPqRdgoCjNFGh7RgGS0y5fvNGZ4FYB8p17E2h9f77tcmvl
         e5TnjMxIyNTZxOqLw/6BAk8jE+7g/VsGWAFdsQW7SXLdaXSzvWul4IcJWgora4Li7CCM
         knEZNXkggvPAc4/8hmqui1oWQelVm2zy1RYTZ8ABg0/tEhL8nhVr9HCCM90rAWw1c9Wz
         xcaA==
X-Gm-Message-State: AOJu0YxA/hJUpXnqk+Ed8MDAqMxyua9UksiZ3C3Azs9nDg2IgGoCEnaf
	pFDej2IF3xIfm9zF/eP9wCXVpzuOGNE=
X-Google-Smtp-Source: AGHT+IEPxzAUUvO2aCaHek8+ltrG7A5m0PAf5F64gU+SxFpFyoFtyPHNBIx9gmiAmjfqqPGolNxxhw==
X-Received: by 2002:a50:fe8e:0:b0:522:c1b1:8cb0 with SMTP id d14-20020a50fe8e000000b00522c1b18cb0mr4834647edt.33.1694948082881;
        Sun, 17 Sep 2023 03:54:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n13-20020aa7db4d000000b005232ea6a330sm4579703edt.2.2023.09.17.03.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 03:54:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-multimedia][PATCH] webrtc-audio-processing: Fix build with -Werror=return-type
Date: Sun, 17 Sep 2023 12:54:34 +0200
Message-ID: <20230917105434.677860-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 10:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104909

* apply the work around from:
  https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/28
  which is still needed for 1.3 version:

  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc: In function 'float webrtc::{anonymous}::GetLevel(const webrtc::VadLevelAnalyzer::Result&, LevelEstimatorType)':
  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc:45:1: error: control reaches end of non-void function [-Werror=return-type]
     45 | }
        | ^
  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc: In function 'webrtc::GainControl::Mode webrtc::{anonymous}::Agc1ConfigModeToInterfaceMode(webrtc::AudioProcessing::Config::GainController1::Mode)':
  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc:117:1: error: control reaches end of non-void function [-Werror=return-type]
    117 | }
        | ^
  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc: In lambda function:
  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc:1853:13: error: control reaches end of non-void function  -Werror=return-type]
   1853 |             default:
        |             ^~~~~~~

* this can now be dropped from meta-webosose, where it was since:
  https://github.com/webosose/meta-webosose/commit/c2a24372e9f792bc900939a6642e64c459073b36#diff-c367f86896c48beb338dac912d3bf03e07d92c8345fa08dc3dcd93093a949c16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-Fix-return-type-errors.patch         | 95 +++++++++++++++++++
 .../webrtc-audio-processing-1_1.3.bb          |  5 +-
 2 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-Fix-return-type-errors.patch

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-Fix-return-type-errors.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-Fix-return-type-errors.patch
new file mode 100644
index 0000000000..37b4db6894
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1/0001-Fix-return-type-errors.patch
@@ -0,0 +1,95 @@
+From b6ad4b7086a6487b36d626248322f4c9d5bf420a Mon Sep 17 00:00:00 2001
+From: "thomas.georgec" <thomas.georgec@lge.com>
+Date: Sun, 12 Mar 2023 14:28:50 +0530
+Subject: [PATCH] Fix return-type errors
+
+Fix "control reaches end of non-void function" in code when -Werror=return-type
+is used.
+
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc: In function 'float webrtc::{anonymous}::GetLevel(const webrtc::VadLevelAnalyzer::Result&, LevelEstimatorType)':
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc:45:1: error: control reaches end of non-void function [-Werror=return-type]
+     45 | }
+        | ^
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc: In function 'webrtc::GainControl::Mode webrtc::{anonymous}::Agc1ConfigModeToInterfaceMode(webrtc::AudioProcessing::Config::GainController1::Mode)':
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc:117:1: error: control reaches end of non-void function [-Werror=return-type]
+    117 | }
+        | ^
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc: In lambda function:
+  webrtc-audio-processing-1.3/webrtc/modules/audio_processing/audio_processing_impl.cc:1853:13: error: control reaches end of non-void function  -Werror=return-type]
+   1853 |             default:
+        |             ^~~~~~~
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/-/merge_requests/28]
+
+ .../audio_processing/agc2/adaptive_mode_level_estimator.cc  | 2 ++
+ webrtc/modules/audio_processing/audio_processing_impl.cc    | 3 +++
+ webrtc/modules/audio_processing/include/audio_processing.cc | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc b/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc
+index f09f63b..9cdf6ca 100644
+--- a/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc
++++ b/webrtc/modules/audio_processing/agc2/adaptive_mode_level_estimator.cc
+@@ -42,6 +42,8 @@ float GetLevel(const VadLevelAnalyzer::Result& vad_level,
+       return vad_level.peak_dbfs;
+       break;
+   }
++  RTC_NOTREACHED();
++  __builtin_unreachable ();
+ }
+ 
+ }  // namespace
+diff --git a/webrtc/modules/audio_processing/audio_processing_impl.cc b/webrtc/modules/audio_processing/audio_processing_impl.cc
+index 67208df..3b8262a 100644
+--- a/webrtc/modules/audio_processing/audio_processing_impl.cc
++++ b/webrtc/modules/audio_processing/audio_processing_impl.cc
+@@ -114,6 +114,8 @@ GainControl::Mode Agc1ConfigModeToInterfaceMode(
+     case Agc1Config::kFixedDigital:
+       return GainControl::kFixedDigital;
+   }
++  RTC_NOTREACHED();
++  __builtin_unreachable ();
+ }
+ 
+ // Maximum lengths that frame of samples being passed from the render side to
+@@ -1852,6 +1854,7 @@ void AudioProcessingImpl::InitializeNoiseSuppressor() {
+               return NsConfig::SuppressionLevel::k21dB;
+             default:
+               RTC_NOTREACHED();
++              __builtin_unreachable ();
+           }
+         };
+ 
+diff --git a/webrtc/modules/audio_processing/include/audio_processing.cc b/webrtc/modules/audio_processing/include/audio_processing.cc
+index 8854415..cc8752b 100644
+--- a/webrtc/modules/audio_processing/include/audio_processing.cc
++++ b/webrtc/modules/audio_processing/include/audio_processing.cc
+@@ -28,6 +28,8 @@ std::string NoiseSuppressionLevelToString(
+     case AudioProcessing::Config::NoiseSuppression::Level::kVeryHigh:
+       return "VeryHigh";
+   }
++  RTC_NOTREACHED();
++  __builtin_unreachable ();
+ }
+ 
+ std::string GainController1ModeToString(
+@@ -40,6 +42,8 @@ std::string GainController1ModeToString(
+     case AudioProcessing::Config::GainController1::Mode::kFixedDigital:
+       return "FixedDigital";
+   }
++  RTC_NOTREACHED();
++  __builtin_unreachable ();
+ }
+ 
+ std::string GainController2LevelEstimatorToString(
+@@ -50,6 +54,8 @@ std::string GainController2LevelEstimatorToString(
+     case AudioProcessing::Config::GainController2::LevelEstimator::kPeak:
+       return "Peak";
+   }
++  RTC_NOTREACHED();
++  __builtin_unreachable ();
+ }
+ 
+ int GetDefaultMaxInternalRate() {
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
index 8d281dad5b..c56ca53f89 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
@@ -9,8 +9,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2"
 
 SRC_URI = " \
-	http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/webrtc-audio-processing-${PV}.tar.xz \
-	file://0001-add-missing-header-for-musl.patch \
+    http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/webrtc-audio-processing-${PV}.tar.xz \
+    file://0001-add-missing-header-for-musl.patch \
+    file://0001-Fix-return-type-errors.patch \
 "
 SRC_URI[sha256sum] = "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0838ad6ec2e86f1b9"
 S = "${WORKDIR}/webrtc-audio-processing-${PV}"
-- 
2.42.0


