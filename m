Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10699.1794762008056360288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dLNoqvHQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso3326073c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762007; x=1795366807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySGPH97+NcA9PV7mOuto1D9/4hEf3Or8QTFbHycArLU=;
        b=dLNoqvHQBqRvATY2QADUR5gE5z7tYdTabW7TxVChm9zJhWG6JiALCeYhkkQyZBnH6O
         SKf6oiEFXX1NlvP34J95H+CSGU5cGpKF82BRa9qZdDR6tozD0LeaCwZTaV2Zl2XBd62u
         D2s9TSvUhVJrB00fSwQLk7qOGkMsZ4kKizXuy32mrMZtLyHSIxNILDAZT4zDjUSLNGGk
         KQsOA5FJBOGlQ7TbRQbjpTReCOHNo/BJCr30rqhWuFRkErT9d3C94PCxYb2wc+iVzPIq
         hTqcyjhKguYtYRg5vX9+UupohAXw1zPg6oJ3Kl2z6i4FovHxzFrIuhxDzg0nCFHJY0gd
         9zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762007; x=1795366807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySGPH97+NcA9PV7mOuto1D9/4hEf3Or8QTFbHycArLU=;
        b=dt5U+xRB+PJES9RiUh+CAF2nzEzbvUnuBYWuJrbc8NGoxNG1KTW1HhklVSqOAZ66dJ
         ilGCGdfOTa0pWt1ACaYdSD+ncDFrCdPsSJj5XYdhFO8hqlHnJ2cA7QkIcDPiEwzTTkPX
         n/PYqsIO3nUBgv0VKrNGfJcCSvjVxKPDSubefzKoT03mE31zgvGSd+etwWkUrKrmvxlX
         tHk3CwKlZjUwJp8kWfAzOUUYO7ASvegbxWjgDMa1rQDb8dw5HHj/L/0JNiapd0YVSd+3
         NMiLtcbc2hqn4wG48od+dxcvUnDiF87JPYuBzXkn9Lf+tM5X+GqObe7BVF9u5ssp+aXw
         YlUg==
X-Gm-Message-State: APuU4Z9Ihf553xuOh4NDPQTjJmy5mc/Rz2zy8T92O+ICaBUCYkeDqDY1
	aORPblylnNSKl05guIsl2Mmm1xaCF+1FgKNrw9NJx+wJM5Fd8xPrH5Yj2Hbfe4Rg
X-Gm-Gg: AYBFou1izeIXGAnPFNQibqvrfLH+7L8yYho3u3hHfrj1+lkyumMkv6DpdQU/fzaoQU3
	8vthWhmUC3lEy86lVRdOxetG/VO3/88XAsjWwQM/eV+EyjxLeGo5VwQQA855ApASvfg7gjVcoDn
	04DW7yBjffKMI7135Jzs2MF0Rm/aogFzfE/ZAlPGjqfOj2UiIi2TruGWFzowxeX8w5lAhqwXlKr
	vAeoWplDsR0yI1kVezCq9XDoDgAaMgCc8QDyarsjutPsULmc+lOiFhk93Fw6IefNl2Ov/FJ6q0r
	tbW/Fboj82HR72HKBL8IuldmMuU2ND2KVTZBrXHYR7M4kEXcB0hXms/x6Ao7psIhwgdDYSLh00T
	ggIrWOZwD91Xt1TAOnC0j+NDtInAT95/3Dw0EuWpEg+68cgyoEg42bSpgWPXhuI4IpLm0xV1Eop
	R8vb53yWidzVQ/aZQChtO8+JDEUwSmJ79QuW/4sMsruI8w7l6MzQfu/jYZlwikJx/xLfhELmsg1
	uT/vh6ZTbeuK0joWHD6CiHFqI9lkIYRvhjWn0mzk6BJEgtpmTytTcXYVc4H3mGabFHoTB7ehJ+x
	kNjoIKyMCnrGWYQwa9s9xcO8/sbJx0jTqvWr/ac+RCpR892ZwnbjC8FvU6aHvhllT5ZIi2BHil3
	Di003B9dQDGVPdSsfxzdH96+wt9rMnCWzv76YhA++2JbaQaJCrwtz1QVLsV1B03u/xwbbwn2mPM
	/7mrTRR+Rs1ag044esdOguadswJ3ozqZ0KekMr791xx+fkaqPqhMWYfabNz0DhvI6a8kiVsYCp+
	nEk1j7hO0uV8eBwWZKieCywGMaS0ygTEoQhG7n1L2PnZYPNV6IaEaqDcjyx6UeeUP87ZCX8laQY
	H4y2
X-Received: by 2002:a05:701b:290a:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b502fe3e09mr8334476c88.0.1794762007160;
        Sun, 15 Nov 2026 09:00:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 06/15] pipewire: Fix build with libcamera 0.8
Date: Sun, 15 Nov 2026 08:59:45 -0800
Message-ID: <20261115165955.3485789-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132372
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix for the libcamera 0.8 location property
renames, it keeps compatibility with older libcamera.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...a-libcamera-device-0.8-compatibility.patch | 50 +++++++++++++++++++
 .../pipewire/pipewire_1.6.11.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch
new file mode 100644
index 0000000000..1030d6aaaf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch
@@ -0,0 +1,50 @@
+From 15c4a92ceae560a4e8c6c14b8c338db075860a57 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
+Date: Tue, 27 Oct 2026 21:28:56 +0100
+Subject: [PATCH] spa: libcamera: device: 0.8 compatibility
+
+Version 0.8 of libcamera has incompatible changes, so adjust the code,
+while keeping compatibility with older versions as well.
+
+(cherry picked from commit 54f2f51f5233026e608f8235f5377b9b473918e3)
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/15c4a92ceae560a4e8c6c14b8c338db075860a57]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ spa/plugins/libcamera/libcamera-device.cpp | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/spa/plugins/libcamera/libcamera-device.cpp b/spa/plugins/libcamera/libcamera-device.cpp
+index 0aeaed855..c6b6106bc 100644
+--- a/spa/plugins/libcamera/libcamera-device.cpp
++++ b/spa/plugins/libcamera/libcamera-device.cpp
+@@ -28,6 +28,7 @@
+
+ #include <libcamera/camera.h>
+ #include <libcamera/property_ids.h>
++#include <libcamera/version.h>
+
+ using namespace libcamera;
+
+@@ -69,12 +70,21 @@ const char *cameraLoc(const Camera& camera)
+ {
+ 	if (auto location = camera.properties().get(properties::Location)) {
+ 		switch (location.value()) {
++#if LIBCAMERA_VERSION_MAJOR > 0 || (LIBCAMERA_VERSION_MAJOR == 0 && LIBCAMERA_VERSION_MINOR >= 8)
++		case properties::LocationFront:
++			return "front";
++		case properties::LocationBack:
++			return "back";
++		case properties::LocationExternal:
++			return "external";
++#else
+ 		case properties::CameraLocationFront:
+ 			return "front";
+ 		case properties::CameraLocationBack:
+ 			return "back";
+ 		case properties::CameraLocationExternal:
+ 			return "external";
++#endif
+ 		}
+ 	}
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
index ec55d6034b..e63fe1ed1b 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.11.bb
@@ -17,6 +17,7 @@ BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0001-pipewire-compress-offload.patch"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"
+SRC_URI += "file://0003-spa-libcamera-device-0.8-compatibility.patch"

 inherit meson pkgconfig systemd gettext useradd

