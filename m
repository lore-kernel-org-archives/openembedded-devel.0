Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2539FCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 17:12:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.1297.1758042727366320473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 10:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrxbsFOy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0418f6fc27so976437766b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758042726; x=1758647526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyNWeGAcislAvb6ZXac/VpOH8F/96+LqWJtf9Gfm8mg=;
        b=IrxbsFOySTnmBD11CPfLWoX1m8FtRZJG3EGT2YFOrD1k/vbSNPKXTPbgoZ2/Ssrn8I
         M9w3NyAp425vmb7O1xJkB2rMuMFm1M1cSc20GtZJeT9PioVOIqRigeU0TT3ycXkbzA+L
         lhwZsCNY2U2nS/w7mIWWzGDfvby3C8KKpYzwx6Y1WudrerzR8GWaQZ1SMhRvYpLne1cE
         KQa8+4qSxZPJJPwZpStqV0lDooyIfJHvSJ6iba3chSi4zGz/IrfEVywX6yBo/aEIQq5N
         jqt8ZZ/brMNRhbjw6HpHS0xIVJwsOEle3Kpja3lZIiOO6BH7o/gJ89scGME78+KMi0iB
         TasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042726; x=1758647526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyNWeGAcislAvb6ZXac/VpOH8F/96+LqWJtf9Gfm8mg=;
        b=deG31ok9XxduELEmBhEuasXyPwSveOIa6d5vMmevIxtcywYchabbInByYczgWaEq4l
         0CI9/NDyij4w1CScti2x5CG/UvBFtewEu1M2oJVC1rpxE1moF5u/egcZNo2o/KlE0NL+
         QqfC831brDrHRVIO7RaDFtWhMg0t57t/nrAf5IZbMkmoJPnz7D7vhw745nsLhyixmDpd
         etamP/rPZLRX4Msoi5UlbranCjukNUCVAvCytUlDFOYvdGGjzzfgE9wvdC9g3v8B8v+M
         sW+F/uCAWItGIqK+g7i1GdmxrS3YmE2ZXUx1utvutx8tLTRVaEeeADWr2eeAcFLlVKrf
         7J9g==
X-Gm-Message-State: AOJu0YzQnsgahy6BVVT3/d5VOjyc4Jir9ySEzQ09MeZhdgjimdieXLqa
	a1zFEi0H0W4P/+IBDSanIfefenGo2yaxqW3AwUQn51Ty91cNRcM5rzUJcerkXstk
X-Gm-Gg: ASbGncvbrciMLpi1Cn7W34vB3iVsiQbe5NEPX0c37SygL1OE9iVB7imD1Qkykkv7DQu
	z4EUplcvFOtkSSDJmsF0M81k+Mp4iLsgHsfBd374pqApH2eVB8dPjMTs9/qdwAQ0wwQf05yvZBx
	GGOxrGqliKHuDIt7htunJnVIm+ZB7knDHsTflMMZ2fNvWY8B6RKkwsC09rzoBKt5E80wpwumtZf
	2F98FwAZ8zWzDtz/4zbCVJF5xa+tzV/KJGPifVkUK5GWItAPWfi+spAszE3Vsa80leLgFco57uA
	GvQ3Kyn3MHSGUA9kyjNUpGdW2mZXEUx5XzWxqvPDCvB+CPEY4EiUnWshGBw7I8jcyEl0RDnB1Y2
	BX+oVi4ho5DMbURrAFFhG
X-Google-Smtp-Source: AGHT+IEmGF39UUAvQIF5tJefRo3ABRbW3IrA3MVhDUztL4856am83czz+gCW1KvknQcpLbN2vNXAtw==
X-Received: by 2002:a17:907:9801:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b07c37b8165mr1698994366b.61.1758042725365;
        Tue, 16 Sep 2025 10:12:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5bfsm1173702466b.63.2025.09.16.10.12.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:12:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH v2] libcamera: upgrade 0.4.0 -> 0.5.2
Date: Tue, 16 Sep 2025 19:12:03 +0200
Message-ID: <20250916171203.2645698-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 17:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119471

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

