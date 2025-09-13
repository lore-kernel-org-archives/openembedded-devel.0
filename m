Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947B9CAC58E
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 17:22:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.2605.1757784149991453316
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 10:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUKnBnPp;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so3384069a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757784148; x=1758388948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZAb8YLWglXTfwKMgJBBjVAxIylTYQ6daMv3r/34/hw=;
        b=SUKnBnPpK4rrnTEOr8yg1XeKKhGTvPfd7/Lig/mWXr9XHN/Mb5S5EG6fMJdTvwDNiE
         sPjrFZ+S0CEvqLPa8Tji8/dN2MRZedDlksHxzvJpXvjCOBOaVIaQWKwBgo4Pl95jpWKI
         3E7ktlmhAgbStdCO+N43Xa5822TRNkjCizC4Au4a34PTTI37awfLsXVopKsoeDurjt1E
         cRLEwS6BAyMWM6Mh9jeSymUnZS4Kdz4fr16GNZPG+zH8JpFXfO6B7vy4E78BRIA4AsXB
         EvzTLL9EfcoLDidoDWs+I/wggK//5CckMbryxBkQP4iKR0DWRY9KqO5UbxhycEnkEIbx
         ICKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757784148; x=1758388948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZAb8YLWglXTfwKMgJBBjVAxIylTYQ6daMv3r/34/hw=;
        b=uez5Xehde3jgPWpuo0v+OVGsBpgEiq0LctVc1R6CBlpy4WOzrrsus7tLGlrMSWnwkU
         hh3WNCmesRGzKmdOG1b+swFymBVx3v00SPCpkvCs4xxE/fBeV7A+/IFarv+5P97DZeuC
         AI0IbKHOzwFnVr35JmfS8qwECEZAuUZ2zNhRZ+V5QYgYMxfbzzg0Zqf1zbTSIQgf+CBc
         1usDXTOu5/CE03uTVczSGqLY6318plU7SBNdF6TV2VwnZjNq2a8WODVnlpSXn9tAAO/b
         Xj0xTwDMp0yrRrSGUzyHb7YhX1n9M18I8iA9TJ8WCp+Pmr38wdx/aIHOkZUs2GFj3uk1
         JwzQ==
X-Gm-Message-State: AOJu0YxMeqhau0Pf7gywzCd+OkZ5Rq3qmGAnYTZEvnxisgo4PKp4ORdH
	CbxHCLUDzu9sOxi2BLp08lVhgkD8I6n/inoLNPMJ35JDt3pLrWVd9RDZ0v1Pfg==
X-Gm-Gg: ASbGncuD5kPUnFvyXh3liGhpmIzxGpKCEbTFe2Q0IWhMdJFOamra10d5l3zaj4uwPAk
	xxIIaMT9dTli0X5BwHSCXTSfab1rovWEzoeeTGJxgxp+pXMogPz3vvadqKE9wCyA7FfUp1Vy6Ku
	Zfjikt8+Ov4y0JTHjsvytIIvBORkD9/TDWAQrI2bVann/OwfReGMFK2cmdq+uLvr1i+w4fdbFsi
	8pjGkPisaJAomPzmoF7J79hMWnM5uAw5U1SZJ8SmLW178BCoSzQDziX5XRKj+aqB8pFgMvtESxq
	40+P7Tmnpu9lmhqg2isniq6SrnQgqeNtmxu0Rl11HhcX8FBvToXlAurRV3a3SoWstVDP+I3rBr4
	nBF/b5NDmczdGGyGT0ANRtQYokgNFPFw=
X-Google-Smtp-Source: AGHT+IGzSodpdTqya79gYTbUo7+nyhzVMuVEd8TJnw80ZdfoXZ9HZvtfj13SoK0HGwddU0fjWpCLTw==
X-Received: by 2002:a05:6402:218a:b0:61c:d457:e542 with SMTP id 4fb4d7f45d1cf-62ed8304606mr6011849a12.17.1757784147974;
        Sat, 13 Sep 2025 10:22:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec6b6cec5sm5422443a12.1.2025.09.13.10.22.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 10:22:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libcamera: upgrade 0.4.0 -> 0.5.2
Date: Sat, 13 Sep 2025 19:22:26 +0200
Message-ID: <20250913172226.3215251-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 17:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119388

Dropped 0001-media_device-Add-bool-return-type-to-unlock.patch, because
the issue has been solved by upstream.

Dropped 0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch,
because it is included in this release.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...evice-Add-bool-return-type-to-unlock.patch | 59 -------------------
 ...ssing-stdint.h-include-to-dma_buf_al.patch | 38 ------------
 ...{libcamera_0.4.0.bb => libcamera_0.5.2.bb} |  6 +-
 3 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-media_device-Add-bool-return-type-to-unlock.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.4.0.bb => libcamera_0.5.2.bb} (90%)

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
similarity index 90%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
index c7fe631a43..d1b4af2d90 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
@@ -9,12 +9,10 @@ LIC_FILES_CHKSUM = "\
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
 

