Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15152C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.46952.1745344669827302020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNodejO+;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so57506825e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344668; x=1745949468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ka856dO38rNjntWX5WKn3WJundEIt0yxOT7q2scRCpc=;
        b=TNodejO+IM5k80LObiquR3UsHRLhjCJ5Ez7QLAOqqk7T4W3Zm6HvXvwKRQEij25Z0H
         +Es6VsZ5Wp8+MP5xUlXh06+CFLqZUDWLKG6RSvi62ix7kHgKIZbcXHfhImCHmCsL78tY
         jyrFDzQG9rXzJ9UhMopZ6Zluee9mMiGWiQPS7cnYjtsEaSL0Aq5lJT9w+kc3V3hok0Mc
         Tq6h+dVHDCTM7RVHsgkyfldlDcL6UU4M2QZr0r1XN/VpW0QZLqKaK4COZQxIdKYCJrZ0
         N0ExmSNX8tLFlDNQu3UMXafmoQeTwWkY1Uv2JBH272Z7B+dKsemGwdwxG+7Og1cU9re+
         5s/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344668; x=1745949468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ka856dO38rNjntWX5WKn3WJundEIt0yxOT7q2scRCpc=;
        b=X4IxajfpdZLWhgOtXZAsYcBne8SHk6Pyatm9V5MspfRexBtjqVVlMyp7WfIM+Fk2Sf
         POcq0XeI0sFxbusp41ffIJUmGNbHMrVj971300SSRGm+QtaPik0QJaxG+ugiV9dHX+do
         XsLwsUkx4R8MhhPApxIBpu8sm6FXRVd6h2L5VzKcFknPwATi0LEFxb86R2THiqg5S+7H
         7w1dGiv71W+XKFOXx0c5ELo4TjreW4ONVZSKa0Plh9dgLT4c3KyVu0eElR+WXu3aIeoA
         +Y/skWClbp+9aSDsCg8uMx9E2b6ssjG97irqLnrbOmfs1UNHU1lBCd6c6nMEZdJDMJvh
         Epxw==
X-Gm-Message-State: AOJu0YwN3YH0Ypv/UEr6chAJNtao3Kttgv5R8NYv6qf5Zrjieq+P6cTx
	5nz4nSJ1WG6hXI10/DsDY2iM9x01rHPtwyD2eqx0aue5CaFK4QJK9q58eE4o
X-Gm-Gg: ASbGncucuT+YYnl98uLuOahfF/w4fldMqgAF5+DLLP4zUzOOBRvP4wTXhl3cOMxXQ5a
	3+j812xagvNTUeKNEu2u7s2XPBAsnSUeKUJKr7L5StdDePsM51CLtPSLsOK/3ViN/IMNSyIdqwi
	0JA78Y7bcy3jQhENcz49tKA6rCIkdxH/60sMpS+Cni+g6hO3qdiq6JhkogIf/Jd8LeCw3KgF9Tk
	4lzFoKucz3NBcYJiYXu2hnj1DleJAxfNj+OslEIj5KNwTMS9QO3HUxNshEw3rqd6AqST8l4/vZY
	B2ik0CkUVw3qZze1zLiLOdksb8SG0FdPdbTfzj/dZMtgqvoKQWwTRNS1j4lPuJ9Qov6Uh2gs9g=
	=
X-Google-Smtp-Source: AGHT+IFqPtTLcWO+7uIA5PaT3+6DnER2fcieZSycXdMpCB4h0wrvpomm2ZDuh3AxDS0+SylTZhZt9g==
X-Received: by 2002:a05:600c:cc4:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-4406ac176ecmr139164375e9.29.1745344668039;
        Tue, 22 Apr 2025 10:57:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d6e05d6sm188189355e9.40.2025.04.22.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:47 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/6] vulkan-cts-sources: fix build with gcc-15
Date: Tue, 22 Apr 2025 19:57:37 +0200
Message-ID: <20250422175742.786560-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117061

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
http://errors.yoctoproject.org/Errors/Details/852849/

In file included from TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.cc:15:
TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.h:56:39: error: 'uint32_t' has not been declared
   56 |   static bool IsInt8(FormatMode mode, uint32_t num_bits) {
      |                                       ^~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...clude-cstdint-causing-build-failures.patch | 47 +++++++++++++++++++
 .../vk-gl-cts/vulkan-cts-sources.inc          |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch
new file mode 100644
index 0000000000..44632bc74f
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Fix-missing-include-cstdint-causing-build-failures.patch
@@ -0,0 +1,47 @@
+From 1d80b54aefd1f5f361990b1223c6fe308a8d3085 Mon Sep 17 00:00:00 2001
+From: Ricardo Garcia <rgarcia@igalia.com>
+Date: Mon, 21 Apr 2025 12:30:05 +0200
+Subject: [PATCH] Fix missing #include <cstdint> causing build failures
+
+Tested on Fedora 42 with clang.
+
+Upstream-Status: Submitted [https://github.com/google/amber/pull/1092]
+
+Fixes:
+http://errors.yoctoproject.org/Errors/Details/852849/
+
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.cc:15:
+TOPDIR/tmp/work/core2-64-oe-linux/vulkan-cts/1.4.1.0/git/external/amber/src/src/type.h:56:39: error: 'uint32_t' has not been declared
+   56 |   static bool IsInt8(FormatMode mode, uint32_t num_bits) {
+      |                                       ^~~~~~~~
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/tokenizer.h | 1 +
+ src/type.h      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/tokenizer.h b/src/tokenizer.h
+index 53efec60..ea4f19df 100644
+--- a/src/tokenizer.h
++++ b/src/tokenizer.h
+@@ -16,6 +16,7 @@
+ #define SRC_TOKENIZER_H_
+ 
+ #include <cstdlib>
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+diff --git a/src/type.h b/src/type.h
+index c63779ba..97720f29 100644
+--- a/src/type.h
++++ b/src/type.h
+@@ -16,6 +16,7 @@
+ #define SRC_TYPE_H_
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 9c95aa4af7..8c2a495dc8 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -22,4 +22,5 @@ SRC_URI += " \
     git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=git/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
     git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=git/external/vulkan-video-samples/src;rev=0e87744edbb84c9c56c3fc8de9ea5150af5ee4ea \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=git/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
+    file://0001-Fix-missing-include-cstdint-causing-build-failures.patch;patchdir=external/amber/src \
 "

