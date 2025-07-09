Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9E1C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:02:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.6548.1752091350440057789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e/RgC/sG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso194077e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752091348; x=1752696148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRmmaX4FZn1YEmOp1I9f7XEa0mKmQUe8T2VoMdjpq24=;
        b=e/RgC/sGf5LZDQiuDrcFhm4Fn06cQ/iEHzrFgwtz5Fl9HUfw1Egrrc13BxafxAzhc+
         jtDb6AOyN8m7kTHh4Nbplvi4VeBt7SwJwemiGBhKh+3kKRquJjcyHRtJ182HL89rKbpn
         9AF83jZosGSiqxhYqDiypTYpx+v/A4TwDoSGDekMjk3GypYcH8jQKOKYN7r2slEKUU04
         B0jow9Eq+vgKcym6jAJ8pa6igWy3ulzfX6Nepx+JLI1fnAhsvoq81aGrNFv1W6Y2DqVf
         si9Zto1ZCkRKzDzBUPTV/gofD1NoTiVd/YatBTASdMbBFp4Wba0TNtbmppMCyynw/PVb
         tQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752091348; x=1752696148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRmmaX4FZn1YEmOp1I9f7XEa0mKmQUe8T2VoMdjpq24=;
        b=U0sfjMv/jGEsSIl7kOKvmEfJEQALuKwmAKtlO3NVv39o3LP8ZOuZRF7cJqDUxJP0K6
         yqfZerF+OLF2ftAWGFYGh/uRHSCiJM427cizRWkvS5uIF0jaMPoOrvsk2GPwfrYoR2Rn
         dAbyCQFGrODxbQFX+OeJi758eqLBvBdJSWFbUP39+ZW8rhGfxJbH9NqWments5aak1aA
         E9cpyOEUfIqZgdDkd48QxwNAFWWuaePdjYgdy9rLEPSmaEZ1KT5JgvFf3mJ51x18EJIk
         XGM7gV/jsIEQa6IEgaxXS/MiZ8AiTcNp8cKUptRbs+eQ0536DEx0vesZE1wG6HVdb/qf
         jGCw==
X-Gm-Message-State: AOJu0YxYNi7/FLS31tkkHju4ZKUH2NqLS0IIu8Ys2m4l3aX3rN5WiMjI
	SmMUW4CAbYxICQ9BsVKk+lGX6sAY/IuLXE86lb+Y/ZBICTf7adgLhivOjnEk3A==
X-Gm-Gg: ASbGncvYkVv/yLObAPc1sglxr/U6WFT3CYb8Tm+b7QnkkC/o3zKYKGSc25l2c3Fy8Y+
	tXsoF+EpiOLI9fhWE3MzA0zCr3CWXpGu2zGfMKVYFFwbEtv8nHGb31/LVAqnXoJoTXuAETZBukY
	xrqYPyY2yGbCbgk8addxowXYUGgtp2BXS4wbSQf6WOlacQQW9jfs/fguOmUkN3tcT+BGWqJkyF/
	R71hBicOyXU+kl/91rmFDvOAYsKHzMBHM9iyzVOvtatI5daKurXG6e1MM4dMZHum3OzyhyfVu1G
	X9MHlxD+D6F0360alLjdzjCcc7SD8nce4OrAAobfIVqJO5Ny8Z7c03tlhrDRx1iFi/9k7C8z9sf
	x5x4=
X-Google-Smtp-Source: AGHT+IG54EmGOexaafiqPjignpILYSXa2ljd5lMSClLlaEFHWpz6ULQXCMFtsG2ewqY2dGumfLXsRg==
X-Received: by 2002:a05:6512:23a0:b0:553:2869:3a5 with SMTP id 2adb3069b0e04-558fa912bbfmr1354687e87.48.1752091347735;
        Wed, 09 Jul 2025 13:02:27 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7e9236sm394e87.60.2025.07.09.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:02:26 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCHv2] cannelloni: Upgrade 1.1.0 -> 2.0.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 23:02:15 +0300
Message-ID: <20250709200215.642311-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118380

- Appends -Wno-error=vla-cxx-extension to CXXFLAGS as a temporary workaround for the following Clang error:

   sctpthread.cpp:95:18: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
      95 |   uint8_t buffer[m_linkMtuSize];
         |                  ^~~~~~~~~~~~~

An upstream fix has been proposed: https://github.com/mguentner/cannelloni/pull/82

Please remove this workaround once the upstream patch is merged or fixed in some other way. Make sure it is fixed in the new version.

- Drop 0001-include-bits-stdc-.h-only-when-using-libstdc.patch because already fixed in newer version.

Changelog:

https://github.com/mguentner/cannelloni/compare/v1.1.0...v2.0.0

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...bits-stdc-.h-only-when-using-libstdc.patch | 37 -------------------
 .../cannelloni/cannelloni_1.1.0.bb            | 16 --------
 .../cannelloni/cannelloni_2.0.0.bb            | 21 +++++++++++
 3 files changed, 21 insertions(+), 53 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
 delete mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
 create mode 100644 meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch b/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
deleted file mode 100644
index 71f447c94b..0000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni/0001-include-bits-stdc-.h-only-when-using-libstdc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7aed36765ae44b41ede7e139da0a11b3696f2e06 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Nov 2023 00:07:23 -0800
-Subject: [PATCH] include bits/stdc++.h only when using libstdc++
-
-We have other c++ runtime implementations e.g. llvm's libc++ which does
-not provide this header bits/stdc++.h, therefore make sure that this
-header is only included when using libstdc++
-
-Fixes
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/cannelloni/1.1.0/git/tcpthread.cpp:27:10: fatal error: 'bits/stdc++.h' file not found
-|    27 | #include <bits/stdc++.h>
-|       |          ^~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/mguentner/cannelloni/pull/56]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tcpthread.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tcpthread.cpp b/tcpthread.cpp
-index a1b3047..bb5a7b2 100644
---- a/tcpthread.cpp
-+++ b/tcpthread.cpp
-@@ -24,7 +24,9 @@
- #include <cstdint>
- #include <cstdio>
- 
-+#ifdef __GLIBCXX__
- #include <bits/stdc++.h>
-+#endif
- 
- #include <linux/can.h>
- #include <string.h>
--- 
-2.42.1
-
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
deleted file mode 100644
index 835f33055a..0000000000
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "a SocketCAN over Ethernet tunnel"
-HOMEPAGE = "https://github.com/mguentner/cannelloni"
-LICENSE = "GPL-2.0-only"
-
-SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master \
-           file://0001-include-bits-stdc-.h-only-when-using-libstdc.patch \
-          "
-SRCREV = "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
-
-LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-inherit cmake
-
-
-PACKAGECONFIG ??= "lksctp-tools"
-PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
new file mode 100644
index 0000000000..6129c9bd0c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_2.0.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "a SocketCAN over Ethernet tunnel"
+HOMEPAGE = "https://github.com/mguentner/cannelloni"
+LICENSE = "GPL-2.0-only"
+
+SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
+SRCREV = "9f649ef21710999c6f674bc3d914ab2e88363bac"
+
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake
+
+PACKAGECONFIG ??= "lksctp-tools"
+PACKAGECONFIG[lksctp-tools] = "-DSCTP_SUPPORT=true, -DSCTP_SUPPORT=false, lksctp-tools"
+
+# Workaround for Clang error:
+# sctpthread.cpp:95:18: error: variable length arrays in C++ are a Clang extension [-Werror,-Wvla-cxx-extension]
+#   95 |   uint8_t buffer[m_linkMtuSize];
+#      |                  ^~~~~~~~~~~~~
+# Upstream fix proposed: https://github.com/mguentner/cannelloni/pull/82
+# When upgrading the recipe, remove this flag once the upstream patch is merged and included to new version.
+CXXFLAGS:append:toolchain-clang = " -Wno-error=vla-cxx-extension"
-- 
2.43.0


