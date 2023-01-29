Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D5C61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 17:25:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.20591.1675013139864222506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 09:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lim3mteb;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id g68so6146298pgc.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 09:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=daNWS86IPwGq2jCY/dfdXEky5FXq8NVLxrf4n1s4Oqg=;
        b=lim3mteb6ma8m0xo4u1VGWmMxuAydzvFRQzS1CxxzyRppbcQ/Hj72YR2lNGQDaf15k
         cvkmwVrPl3B64A5Upp3t0puagp2tUw+0u/EtG6G7oGnsO9/sQV2CLi0TU48NiJ3nPiD9
         PmmTCtdIkocImeskWmr+ricZ/N6YB2tzrXM7rCkNHoCFTT8IxfWNONHSGlzcVZDSc0c0
         aeRwqY94JynaeIeJhJyGyLm2nMVYk+1dAsdMJw8u2MA6rSmXt45mTtiRSTjrrfVoheOd
         zqrKNnzXtCz/LWTwuaGXjgqfvZp0GpNkmA/BjJrYwVHxXwbwF8oNupffz7C9t9kdAvQv
         j7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daNWS86IPwGq2jCY/dfdXEky5FXq8NVLxrf4n1s4Oqg=;
        b=HJ+J6dd/7xL85fFvbGj7S90EiyoXMZkYHYeotM+tYnktnS2r0d1g5wndvSDVNex4kx
         8OLsinE6tMI9/Cd37IMmhHTV+SypV6BMzLl8KATWZjI/ciEdfXIyM03jXAOkgg86Oad4
         9LQQZbN3cURh1ghOnXpUV2rHPFdPN4g7y5sZt2qZZY3Sv/mHw5E7+aRbWNauNIMlJeYM
         loCvSNjQglFdmS+1+tOtp5wcV2kE1AltZP3vYHlv/ndNh+WfEs3TX9eo7EV5htds50sy
         v8Z3xLppUdWP+/iePks2H5sI44Im+vYulxtHvcxSnGTV/oJHMy7QSsr48l0c4fz73DFH
         1L/A==
X-Gm-Message-State: AO0yUKUJ9VhtGFzBTVLLGcPHKn/WnT/3VABIKAc8Wme0fCnx2R8EAgUo
	hMM7qMvGk7jWgSAkGTSr65UGsUvRefXa6A==
X-Google-Smtp-Source: AK7set+BgWv3pmXFFl5gVHEJFddXoB26B6DyPti27niri2K4m9lpa/AypvOuzXhf0xKv7HMXyIVPvw==
X-Received: by 2002:a05:6a00:23ca:b0:593:baec:27cc with SMTP id g10-20020a056a0023ca00b00593baec27ccmr1840801pfc.3.1675013138839;
        Sun, 29 Jan 2023 09:25:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id o3-20020a62cd03000000b0058a3d8eab6asm4972781pfg.134.2023.01.29.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:25:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] upm: Fix build with gcc13
Date: Sun, 29 Jan 2023 09:25:34 -0800
Message-Id: <20230129172535.1185410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 17:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100832

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../upm/0001-include-missing-cstdint.patch    | 43 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-include-missing-cstdint.patch b/meta-oe/recipes-extended/upm/upm/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..59f81bf3a2
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-include-missing-cstdint.patch
@@ -0,0 +1,43 @@
+From 64f75806c04c2ee819cf2f92cb564ad316354823 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Jan 2023 00:27:47 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/eclipse/upm/pull/704]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mcp9808/mcp9808.hpp | 1 +
+ src/micsv89/micsv89.hpp | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/mcp9808/mcp9808.hpp b/src/mcp9808/mcp9808.hpp
+index b9e138d7..2509cd30 100644
+--- a/src/mcp9808/mcp9808.hpp
++++ b/src/mcp9808/mcp9808.hpp
+@@ -13,6 +13,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <iostream>
+ #include <string>
+ #include <interfaces/iTemperature.hpp>
+diff --git a/src/micsv89/micsv89.hpp b/src/micsv89/micsv89.hpp
+index 2f97dbce..c6e22ad8 100644
+--- a/src/micsv89/micsv89.hpp
++++ b/src/micsv89/micsv89.hpp
+@@ -11,6 +11,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <iostream>
+ #include <string>
+ 
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 61e2e38b05..0ae7760bd2 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http;branch=master;proto
            file://0001-initialize-local-variables-before-use.patch \
            file://0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch \
            file://0001-cmake-Disable-using-Wno-maybe-uninitialized.patch \
+           file://0001-include-missing-cstdint.patch \
            "
 
 SRC_URI:append:toolchain-clang:x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
-- 
2.39.1


