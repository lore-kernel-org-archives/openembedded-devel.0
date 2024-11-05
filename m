Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2395DD2C120
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.19646.1730817436112131449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1VLEu8J;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2e2baf1087so5145152276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817435; x=1731422235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLtXCPUvc9sxmY98CbilAJCYDw7dnXOdu2tQ51k/kUM=;
        b=a1VLEu8Jsi2Xwor2ez2e7grCa+Lv5syeTgwNSjVZLg9jKwUQymgp4RumzHyeZL0vAF
         J59TLmfuA6NK466h1Bh/gcZ2dkfxLt2rQHJzfPl6xUGCz4gsBR1umucF4BcwNTbwAI35
         iXnhhBUOpBdGwIMynqOFHJWVboyIeFw4JjEgW4zYvEtdQ8/osNmUCATFWkpnsXzcT4Sz
         4LopwRiwGJ10kPLn2QG3WgnvXSeie8fictRxex+Y/LBkZGvHYzqwLc1XgWXS7lgfpudl
         o7FPXXiQ1LypHt+bH8LwbWcyTPh8SpmWHVcoDXLnIB3ESSsdRgsszKfFWn6cFl7y/ffX
         SUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817435; x=1731422235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLtXCPUvc9sxmY98CbilAJCYDw7dnXOdu2tQ51k/kUM=;
        b=qdBF5G0HIoOEyIkB4cu5CEfYgqdl/G8M/Umc5flKphb21s4j6IvZcTO2Uey1U32GAy
         P3vPd9JczCh7Z0tWzSpk7znk/n+z6rs9Av+dMDo+VOfU5f/71ZZKIIMP5tx/+0Xig/Bk
         MNmn9WaZipIsTQWl9Wu6LiDB2CTxldjq0ajH5gjHofnCAQf9eG6IJBm/z1fqgIO0pT8E
         zCwydX+W+bPhTwkirYgftzMLCRyB7ciH1KNUdA28ydcebYA9yovGWX5p8pu7ohWYk+RI
         RV3XTE0LCZ7RGr0UozLu0LsBOiWAIz32t3KV2ttr3HUXoYRCUfLFmTKyasSzuvWJKy+J
         ZMPA==
X-Gm-Message-State: AOJu0Yyx4wilArYQmY6S7B75TExNp87uSfaf986M6GKLLCE0TKSYBGA2
	8OPt9//LXZ9ayUnEYKpA/cRjNk6GQYkmvpDIPcAOo0mvBodlEqDhMiKZgQ==
X-Google-Smtp-Source: AGHT+IFXGXgXciw4HhZ4MCx0fBh/HTZlmZlTEnt5ROrO6Nv6fIDomE4cxXEyt1ENbPZdGxkOS9LT8Q==
X-Received: by 2002:a81:b108:0:b0:6ea:7b00:4aa4 with SMTP id 00721157ae682-6ea7b004e30mr101940647b3.0.1730817435179;
        Tue, 05 Nov 2024 06:37:15 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 77/90] jansson: add JSON_INTEGER_IS_LONG_LONG for cmake
Date: Tue,  5 Nov 2024 09:35:42 -0500
Message-ID: <20241105143638.2301245-78-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113495

From: Chen Qi <Qi.Chen@windriver.com>

This macro is documented, so it should be consistent across
different build systems. It's defined in autotools, but not
cmake. Add it for cmake.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a3854f6893afb53d896394ddcc26568b25d04d91)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch | 51 +++++++++++++++++++
 .../recipes-extended/jansson/jansson_2.14.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch b/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
new file mode 100644
index 0000000000..5298cfbefc
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch
@@ -0,0 +1,51 @@
+From 521d37abc0ed1178a39298d06d80d8d0e2a43e28 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 10 Sep 2024 00:48:00 -0700
+Subject: [PATCH] add back JSON_INTEGER_IS_LONG_LONG for cmake
+
+For autotools, JSON_INTEGER_IS_LONG_LONG is defined, but for
+cmake, it's not. This means such macro, which is also documented,
+is not consistent across different build systems. This is not
+good, so add it for cmake.
+
+This patch refers 8b975abca1055d40637c90b1dc4585af1d7df76c and is
+part of it. So the upstream-status is marked as 'oe specific'.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ CMakeLists.txt               | 1 +
+ cmake/jansson_config.h.cmake | 4 +---
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 39b9ad3..0e95a94 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -193,6 +193,7 @@ endif ()
+ # detect what to use for the 64 bit type.
+ # Note: I will prefer long long if I can get it, as that is what the automake system aimed for.
+ if (NOT DEFINED JSON_INT_T)
++   set (JSON_INTEGER_IS_LONG_LONG 1)
+    if (HAVE_LONG_LONG_INT AND (LONG_LONG_INT EQUAL 8))
+       set (JSON_INT_T "long long")
+    elseif (HAVE_INT64_T)
+diff --git a/cmake/jansson_config.h.cmake b/cmake/jansson_config.h.cmake
+index 2f248cb..bec64da 100644
+--- a/cmake/jansson_config.h.cmake
++++ b/cmake/jansson_config.h.cmake
+@@ -21,9 +21,7 @@
+ #define JANSSON_USING_CMAKE
+ #endif
+ 
+-/* Note: when using cmake, JSON_INTEGER_IS_LONG_LONG is not defined nor used,
+- * as we will also check for __int64 etc types.
+- * (the definition was used in the automake system) */
++#cmakedefine JSON_INTEGER_IS_LONG_LONG 1
+ 
+ /* Bring in the cmake-detected defines */
+ #cmakedefine HAVE_STDINT_H 1
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index fb42509f36..9f5cdcf4c0 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
            file://0001-Fix-overwriting-linker-flags.patch \
            file://0001-Honour-multilib-paths.patch \
+           file://0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch \
            "
 SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
 
-- 
2.43.0


