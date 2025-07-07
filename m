Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A16C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:29 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.5692.1751928867959122720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LP5wZp9y;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so4201182e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928866; x=1752533666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xF2u7ktLPFtKNNDLKIPOA09vAAFRE1ylBcTzPCraAI=;
        b=LP5wZp9yJLgfQT06Vh5X1PN6UNqAywjCgx0C1J21UbzTv699fJpUPR08dkltVoENRY
         gEeYGOKNQKM2B/vu9rhy6j/4bN2GMulFDtrxGYIGtfY4bNxY5vrnS1c+5iCSkmKUID4r
         TlZo+59DswqfjqgaRZJWr/mg8Uoajty9XLCgakhtpffXIjdkcrgncOce5EVJj01jl4j9
         uBvvVT3R2WeznQJ+AWm+OzMrVaVOJhp53+mV+Ta+EsKWV1AliZmmL1QEa8tvz+ZCvsV/
         QAJy/IAndFO86rwPwu/QeNshKBoaIo9ZNAicB2vbCuOJobF5His5WCzThsz2bODOr5L1
         RbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928866; x=1752533666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xF2u7ktLPFtKNNDLKIPOA09vAAFRE1ylBcTzPCraAI=;
        b=Qgih+Q/c9GxEFROyUZGnx9qYC1tn+1bGM7y7+OHPiMqLofy8C0DMj8ORtesJNSGalE
         WDNON/pvBqUSly1VrS+2hpiw8beDO6hRcPW96X6+lyroWrMf2y1s2CZ4W5rROI8Dn/Wx
         nHADFDqFF907hijOR35i+oH3RTCRfxAbgQ4UAaLZF/74YMoohl+vfPafgryYWYB9iVGq
         n2gMTvoV8iLxOr7VUAa75LVmuXiHMGaNaydaJiZAR916CMvEnn3nnkQgkjvfIaw5qMgJ
         VKQYRAyfRcNjx0Km8FqTv6YS+H2mJbFZKm1Dd49Z7d9/6fJ3CPZXvmedFTVG8ka8rFyX
         PBZQ==
X-Gm-Message-State: AOJu0YztbUjYa0AymhKR/GYlp/r6er/4zJp7Lj29QK8rYdr3v7mF1k9O
	M7Mz74FzKIpGnyysW27H7rk6xZCuIn4dWTw6lIeIYRfjPzI4AkTFi9T4QMjH5g==
X-Gm-Gg: ASbGncsl1KcV8zs5ErwGpnh4O6JQ5vAkUVIUnWOv48uTFc1ZF+/ohzDVGOxaezHN6IC
	zfanUyOEwMc/zLQZhyGmXAw/oOLJ1g0pjqTUxgFMqSee09pob6GPDLu6xBQY7YVc+wI50f9KGXF
	yQl9BNOvHBdenebALGM2xBPge5llDTDJSV0SRC5nKl5eVhgOH1Fm+c87jl+T3SOzBEc6RjsTAIp
	YweGiXKyN4+Mt99DOEw/K92zVs0spEfQKC+G2S9wmPCT8DVJMl9ymzoX5BaOvXP3gK7wsmVy61U
	VbHvtoSug5J5KkVKlNzMEa0ntK5VwPucj6iPlNmJ8XFgaIAnvR+CGDLgatmUKNxATlimhsAsPd2
	T83A=
X-Google-Smtp-Source: AGHT+IGoXVGc8/A5dfOwfx/OlzfswfQlw3uAJf/8IOZgz+Mykqb7mHutdhkMW9C8ombQ9nZ+vn9DvA==
X-Received: by 2002:a05:6512:104f:b0:553:d9ba:a171 with SMTP id 2adb3069b0e04-557f8378d41mr180802e87.43.1751928865535;
        Mon, 07 Jul 2025 15:54:25 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:24 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 7/9] apitrace: Upgrade 11.1 -> 13.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:05 +0300
Message-ID: <20250707225407.1558421-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118295

- Drop 0001-Explicit-header-stdint.patch because already fixed in newer version.

Changelog:

https://github.com/apitrace/apitrace/releases/tag/13.0
https://github.com/apitrace/apitrace/releases/tag/12.0

Fix:

| CMake Error at thirdparty/libbacktrace.cmake:32 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
| Call Stack (most recent call first):
|   thirdparty/CMakeLists.txt:13 (include)
|   thirdparty/CMakeLists.txt:55 (include_with_scope)

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-Explicit-header-stdint.patch         | 42 -------------------
 .../{apitrace_11.1.bb => apitrace_13.0.bb}    |  8 +---
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch
 rename meta-oe/recipes-devtools/apitrace/{apitrace_11.1.bb => apitrace_13.0.bb} (85%)

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch
deleted file mode 100644
index 9ce6693061..0000000000
--- a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Explicit-header-stdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 952bad1469ea747012bdc48c48993bd5f13eec04 Mon Sep 17 00:00:00 2001
-From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Date: Fri, 21 Mar 2025 05:02:23 +0000
-Subject: [PATCH] Explicit header: stdint
-
-Fix building with GCC-15. It no longer includes it by default.
-
-Upstream-Status: Backport [https://github.com/apitrace/apitrace/commit/952bad1469ea747012bdc48c48993bd5f13eec04]
-
-Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
----
- frametrim/ft_dependecyobject.hpp | 1 +
- retrace/metric_writer.cpp        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
-index 2cd0b768..0f17b601 100644
---- a/frametrim/ft_dependecyobject.hpp
-+++ b/frametrim/ft_dependecyobject.hpp
-@@ -28,6 +28,7 @@
- #pragma once
- 
- #include "ft_tracecall.hpp"
-+#include <stdint.h>
- 
- namespace frametrim {
- 
-diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
-index e923ed1d..4e4ce748 100644
---- a/retrace/metric_writer.cpp
-+++ b/retrace/metric_writer.cpp
-@@ -24,6 +24,7 @@
-  **************************************************************************/
- 
- #include <iostream>
-+#include <stdint.h>
- 
- #include "metric_writer.hpp"
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
similarity index 85%
rename from meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
rename to meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
index 244d9a3c6f..1e41548c9b 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_11.1.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_13.0.bb
@@ -5,12 +5,8 @@ LICENSE = "MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
                     file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
-SRCREV = "9352fc02bba106fbbeef9e8452ef34643c0d0764"
-PV .= "+11.1+git"
-SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
-           file://0001-Explicit-header-stdint.patch \
-          "
-
+SRCREV = "ed44bd4c6cce224e2d64533d197bea6ca4fee266"
+SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
 
 DEPENDS += "zlib libpng python3-native"
 
-- 
2.43.0


