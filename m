Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B36CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 17:03:36 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.1003.1758042206905280667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 10:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RteQeFtT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f6b1fd718so1012284a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758042205; x=1758647005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyNWeGAcislAvb6ZXac/VpOH8F/96+LqWJtf9Gfm8mg=;
        b=RteQeFtTCsUljIOhnE82VygT3zGwg2XhSNxjRMCGY3CXP1VZ8sGQuREdUpeX1LXAZa
         ku5ITIrP9U/lhKLChNPlj8lpdWHlAMUoUeoUqoicEFIYf1gFevg5ScnsqIzFmA61ptiv
         txf9EdQZZVu4Zrr7p6IfsI3CoBXBD32ImuJ+0XbWtzXLs8T9obGlbI0mliTrPuY/i+yi
         D4Wxt1X69xh1v1p7uunrCbMsDM2+A4SpeCf3IUGd3g70h39NtIvdFGtdtFVQB/GSH0rA
         dGiM4Vsudi5Giytk7bBFUI6lUISjXiR+qB3mxNgU89EOHBJ63VoVXh2v7QzGzBgzQeQM
         bbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042205; x=1758647005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyNWeGAcislAvb6ZXac/VpOH8F/96+LqWJtf9Gfm8mg=;
        b=UZg67Ezl02mH6f8ezJ6WdtIddl75E133VsYfjTRTAL0LkYW0sEkdgXvrI8HYqb7Zrv
         hnrStWef83a9WGk8v1AI5I5S1L+GO4gdCy4w3byTXlREERm7G/5VXAMpgfoBavZYLuZ7
         OhmHnBnNSMUbSMnfSr3Rr3hfF8jKtfmCWG3frWzg918b8wHflbkC7hGnyJeZzjSiYrfb
         TwfLTliTYSq5jJEo9OiV7B1AQ7YCsYDgZ662MkO/RsXlUmexwjDqbSw7OqD0fB2eGC5G
         Muxe04Yjt0fahu85rdUuHRLV8++B1F+NMkhsQAAqWoR9KpRI87nArPnK95AGK4c18bR0
         ay/g==
X-Gm-Message-State: AOJu0YzoQg6N7yLoIwbMAPewVGCExqWgzVdSFQjjktTwU2hHhVnuqN0n
	yHQPs3F07ede8SZPdcONmHYN2bQAQW+cLdNxreb/Y4CsK8EjyDRI19A2JYvBxLW4
X-Gm-Gg: ASbGncvQ1tAWQ4lvbH+WZNvHjY4WikTWl4W2tAiApZq2Ux5hwH5aSgbNWlkCySz4iJD
	5CRf0GhANbFiQhQOLqnxRxfR26ulvPIHtA8IzT5J998ZX8IgFY2QONJCnfLLM3DE5Qw0aOf/TNR
	p9PliUtSSpaQiFyMTRhEL+5sD13zU80hnpYmZbhOQxpSu8pcy9uP0zg6evBvOlzz/uzB5Qps+j8
	2ZpsSoiwPPdvl/C0oUjw0blcOF2mX8hFucNbMCNEpMvtT0LXUTs3r4pZ8YvP8GWcGKHzLgvI2Lz
	r4W62jbktW5J42azUOFll4VHs2GdFxof4bz1Pi9i5NyPPiQyKTgyC3uhq/PpqQx+OXQ453s07KW
	LL6Bm9Y8mj+cimEgCY4l9
X-Google-Smtp-Source: AGHT+IFmC+KNm1N6yrGJnTauIwwvnes97g8uqlukhoqaH99eAe8lpMS0NIVe/DLkkCWZqV6xHDn7nw==
X-Received: by 2002:a05:6402:27c6:b0:62f:4357:53a0 with SMTP id 4fb4d7f45d1cf-62f4357573fmr6309257a12.9.1758042204722;
        Tue, 16 Sep 2025 10:03:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f2f5ec0ffsm5248312a12.46.2025.09.16.10.03.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:03:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-multimedia v2] libcamera: upgrade 0.4.0 -> 0.5.2
Date: Tue, 16 Sep 2025 19:03:23 +0200
Message-ID: <20250916170323.2644886-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 17:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119470

Dropped 0001-media_device-Add-bool-return-type-to-unlock.patch, because
the issue has been solved by upstream.

Dropped 0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch,
because it is included in this release.

Added a new PACKAGECONFIG called "raspberrypi" - this is taken from
the meta-raspberrypi layer, however using it still requires that layer,
as using it requires a dependency that is provided by that layer.

The recipe until now built support for all platforms that matched the selected
architecture (e.g. mali, rpi imx8 when the archi is arm). However rpi-specific
options now require a an extra dependency that's not in meta-oe, so only build
rpi-support when raspberrypi PACKAGECONFIG is enabled.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Add rpi specific PACKAGECONFIG - rpi has a dependency not in meta-oe,
    so only build it when it is enabled (usually when meta-rpi layer is also used)

 ...evice-Add-bool-return-type-to-unlock.patch | 59 -------------------
 ...ssing-stdint.h-include-to-dma_buf_al.patch | 38 ------------
 ...{libcamera_0.4.0.bb => libcamera_0.5.2.bb} | 16 +++--
 3 files changed, 11 insertions(+), 102 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.4.0.bb => libcamera_0.5.2.bb} (80%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
deleted file mode 100644
index 12f034effd..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 6914c4fd3d53c0c6ea304123bf57429bb64ec16f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 31 Jan 2024 21:01:27 -0800
-Subject: [PATCH 1/2] media_device: Add bool return type to unlock()
-
-unlock uses lockf which is marked with __attribute__
-((warn_unused_result)) and compilers warn about it and some treat
--Wunused-result as error with -Werror turned on, It would be good to
-check if lockf failed or succeeded, however, that piece is not changed
-with this, this fixes build with clang++ 18
-
-    ../git/src/libcamera/media_device.cpp:167:2: error: ignoring return value of function declared with 'warn_unused_result' attribute [-Werror,-Wunused-result]
-      167 |         lockf(fd_.get(), F_ULOCK, 0);
-          |         ^~~~~ ~~~~~~~~~~~~~~~~~~~~~
-    1 error generated.
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2024-February/040380.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/libcamera/internal/media_device.h | 2 +-
- src/libcamera/media_device.cpp            | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/libcamera/internal/media_device.h b/include/libcamera/internal/media_device.h
-index eb8cfde4..b09dfd16 100644
---- a/include/libcamera/internal/media_device.h
-+++ b/include/libcamera/internal/media_device.h
-@@ -33,7 +33,7 @@ public:
- 	bool busy() const { return acquired_; }
- 
- 	bool lock();
--	void unlock();
-+	bool unlock();
- 
- 	int populate();
- 	bool isValid() const { return valid_; }
-diff --git a/src/libcamera/media_device.cpp b/src/libcamera/media_device.cpp
-index 2949816b..eaa2fdb0 100644
---- a/src/libcamera/media_device.cpp
-+++ b/src/libcamera/media_device.cpp
-@@ -159,12 +159,12 @@ bool MediaDevice::lock()
-  *
-  * \sa lock()
-  */
--void MediaDevice::unlock()
-+bool MediaDevice::unlock()
- {
- 	if (!fd_.isValid())
--		return;
-+		return false;
- 
--	lockf(fd_.get(), F_ULOCK, 0);
-+	return lockf(fd_.get(), F_ULOCK, 0) == 0;
- }
- 
- /**
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
deleted file mode 100644
index 18ba353de2..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 91de550243121056984e5b9b693b486860655d31 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Sat, 28 Dec 2024 19:11:19 +0000
-Subject: [PATCH] libcamera: Add missing <stdint.h> include to
- dma_buf_allocator.h
-
-Without the change the build fails on upcoming `gcc-15` as:
-
-    In file included from ../src/libcamera/dma_buf_allocator.cpp:9:
-    ../include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
-       66 |         void sync(uint64_t step);
-          |                   ^~~~~~~~
-
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
-Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-
-Upstream-Status: Backport [https://git.libcamera.org/libcamera/libcamera.git/commit/?id=91de550243121056984e5b9b693b486860655d31]
----
- include/libcamera/internal/dma_buf_allocator.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/libcamera/internal/dma_buf_allocator.h b/include/libcamera/internal/dma_buf_allocator.h
-index d26f8a74..13600915 100644
---- a/include/libcamera/internal/dma_buf_allocator.h
-+++ b/include/libcamera/internal/dma_buf_allocator.h
-@@ -8,6 +8,7 @@
- #pragma once
- 
- #include <memory>
-+#include <stdint.h>
- #include <string>
- #include <vector>
- 
--- 
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
similarity index 80%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
index c7fe631a43..88fe9cf39c 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
@@ -9,16 +9,13 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = " \
-        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
-        file://0001-media_device-Add-bool-return-type-to-unlock.patch \
-        file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch \
+        git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
+SRCREV = "096c50ca881f72d858aca19757a5e73b4775a7cc"
 
 PE = "1"
 
-
 DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
@@ -28,8 +25,17 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[dng] = ",,tiff"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
+PACKAGECONFIG[raspberrypi] = ",,libpisp"
+
+# Raspberry Pi requires the meta-raspberrypi layer
+# These values are coming from the project's meson.build file,
+# which lists the supported values by arch.
+ARM_PIPELINES = "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi', 'rpi/pisp,rpi/vc4,', '', d)}"
+ARM_PIPELINES .= "imx8-isi,mali-c55,simple,uvcvideo"
 
 LIBCAMERA_PIPELINES ??= "auto"
+LIBCAMERA_PIPELINES:arm ??= "${ARM_PIPELINES}"
+LIBCAMERA_PIPELINES:aarch64 ??= "${ARM_PIPELINES}"
 
 EXTRA_OEMESON = " \
     -Dpipelines=${LIBCAMERA_PIPELINES} \

