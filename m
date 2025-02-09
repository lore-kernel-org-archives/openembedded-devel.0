Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F93C021A1
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:45:33 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.39946.1739144726027459247
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 15:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hSNE/BmX;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so4504341e87.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 15:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739144724; x=1739749524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xysSmV4ozj8dlmKtXlXt3PTnGI0dEjcHWJCG7bK0CE=;
        b=hSNE/BmX2NleCFrFLISFdxgsWowha5kXX6UgS4qV3ErSc1oZLJ1R8ZFhcsir5+uBmA
         EOfNUrgaI/ZxpQcED8xL/fwPmyE42ybl5kFaYUPTa2exqajaHtYoDkW4wf0mXd+R/8np
         mkWMZb2hvOVrrWmrZFvCkuHM6ZhUT6jRtPa7b0rvnPKNMPe+WIRaDemtA0OF2ZUnwWnt
         sVbRxC0kWkm74eLLMqK+9AqgP13cCMQh+nM9Fm5EO969r5s83tLEQ9sLdEU+v4f33GAO
         HWJJIL8bVt1Kfyk+/xyCI03QJgmPDquOqYrPQ94oG609jKx5nlA6WJmq+1ic7KFhfegk
         HCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739144724; x=1739749524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xysSmV4ozj8dlmKtXlXt3PTnGI0dEjcHWJCG7bK0CE=;
        b=G8wqbiXLrgAdJOTgwRWHvT32Ze4M+V4fRvrKLzvE/OY2vl3vQ0LStu0yIqNblbTxrZ
         yL75Ig5JtwHsLVoMj19E+xBUrJKLJxgWGOSzSCkTcMxVLswsyh4O3d6ybDW/e4F9Ruk+
         a3fFB7gc+814CVcFWHJKcUty8VsGS7nrJohMTyZh1Gn9c3SkZn+ma43CLA8JLY+sCgFP
         Js6xCBiSdF5g68o7YRKgUXPUiL9m9nll4IZunQqh32FToSjxH93ASdGScrO8zXdYYxbq
         Cde84lh3yqQxaGeY/NQZMJr61efkpPlpdY6BY0860H4hl+66S1gPeAxMNJaMedqP2o/K
         Ec0Q==
X-Gm-Message-State: AOJu0YwVHchLIVq3+m+trmmD7f5eBCvTqzJVWx7qgZgVkWlzkJMK+/WE
	9Lrfpn4Juc39BAByqgrL3gMWKeWJVjq4y7K2Gwwu1i13PktVkomegOSKqjhabXr0s3oxchJx5r2
	hmqE=
X-Gm-Gg: ASbGncs89f6HCgKYqbKqfUvaKcIEyxack974kj4Km/XcT6X3aQDZaUDF5kjDkpF8nRP
	PDXrMa1zwrHfmNc/tpuIC67+Db518RgCigs6wmZbyrHOU8I8EWPV11BXk4cDr4tmHj4Al59+gGy
	Aw1yTqFD+cfiJHfeMt3QPAfgW5etlyBXvEmQZCtlawG3SeGHjulkJBlmDJBySFIFZpyuJU/YNaG
	NjFxzPtdIajkKoCUMmOSHA2axSXeiRc1AcgQzVSwtuxN00AOrXTffMrZ0nGcK9j8a9NhaWzLTH1
	Uj6eyQyLfn+oeo2fPD4pTHHmgp3KFlI=
X-Google-Smtp-Source: AGHT+IFcGakW2+GA023teqjJtWS0D980t/fO+4IB/kMUQ+PdgvBt1fLik4h/9wsqt4HV/vTNO2wz9Q==
X-Received: by 2002:a05:6512:61:b0:545:158:1344 with SMTP id 2adb3069b0e04-54501581440mr2301789e87.49.1739144723895;
        Sun, 09 Feb 2025 15:45:23 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54509ce9e42sm284632e87.4.2025.02.09.15.45.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:45:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] android-tools: fix compilation because of include path poisoning
Date: Mon, 10 Feb 2025 01:45:18 +0200
Message-Id: <20250209234518.1549197-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209234518.1549197-1-dmitry.baryshkov@linaro.org>
References: <20250209234518.1549197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 23:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115322

The android-tools's build in several places adds system locations (like
/usr/include/android) to the include path. Extend the OE-specific build
patch to fix those errors.

This fixes errors like:

error: include location "/usr/include/android" is unsafe for cross-compilation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...difications-to-make-it-build-in-yoct.patch | 66 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
index fd2a092bd0f7..5ce375134c54 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
@@ -14,12 +14,17 @@ Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
 - fix warning: library search path "/usr/lib/p7zip" is unsafe for cross-compilation
 
+- fix error: include location "/usr/include/android" is unsafe for cross-compilation
+
 Upstream-Status: Pending
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ debian/development/etc1tool.mk                 |  1 -
  debian/external/boringssl/libcrypto.mk         |  1 +
+ debian/libnativehelper/libnativehelper.mk      |  1 -
+ debian/system/core/adb.mk                      |  1 -
  debian/system/core/append2simg.mk              |  2 +-
- debian/system/core/fastboot.mk                 |  2 +-
+ debian/system/core/fastboot.mk                 |  3 +--
  debian/system/core/img2simg.mk                 |  2 +-
  debian/system/core/libbacktrace.mk             | 10 ++++------
  debian/system/core/libbase.mk                  |  5 +++--
@@ -30,11 +35,24 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  debian/system/core/libziparchive.mk            |  5 +++--
  debian/system/core/simg2img.mk                 |  2 +-
  debian/system/core/simg2simg.mk                |  2 +-
+ debian/system/extras/libext4_utils.mk          |  1 -
  frameworks/native/libs/adbd_auth/adbd_auth.cpp |  2 ++
  system/core/adb/adb_listeners.cpp              | 12 ++++++------
  system/core/adb/transport_local.cpp            |  2 +-
- 16 files changed, 35 insertions(+), 29 deletions(-)
+ 20 files changed, 35 insertions(+), 34 deletions(-)
 
+diff --git a/debian/development/etc1tool.mk b/debian/development/etc1tool.mk
+index 2d787e98bb86..e03ac5f0048c 100644
+--- a/debian/development/etc1tool.mk
++++ b/debian/development/etc1tool.mk
+@@ -4,7 +4,6 @@ SOURCES = development/tools/etc1tool/etc1tool.cpp
+ 
+ CXXFLAGS += -std=gnu++2a
+ CPPFLAGS += \
+-  -I/usr/include/android \
+   -Idevelopment/include \
+   -Iframeworks/native/opengl/include \
+ 
 diff --git a/debian/external/boringssl/libcrypto.mk b/debian/external/boringssl/libcrypto.mk
 index c0ea54f4..b3a77bfd 100644
 --- a/debian/external/boringssl/libcrypto.mk
@@ -47,6 +65,30 @@ index c0ea54f4..b3a77bfd 100644
    -Iexternal/boringssl/src/crypto \
    -Iexternal/boringssl/src/include \
  
+diff --git a/debian/libnativehelper/libnativehelper.mk b/debian/libnativehelper/libnativehelper.mk
+index 7a0c94a6b7b5..880b2fdf9154 100644
+--- a/debian/libnativehelper/libnativehelper.mk
++++ b/debian/libnativehelper/libnativehelper.mk
+@@ -11,7 +11,6 @@ OBJECTS = $(SOURCES:.cpp=.o)
+ 
+ CXXFLAGS += -std=gnu++2a
+ CPPFLAGS += \
+-  -I/usr/include/android \
+   -Ilibnativehelper/header_only_include \
+   -Ilibnativehelper/include \
+   -Ilibnativehelper/include_jni \
+diff --git a/debian/system/core/adb.mk b/debian/system/core/adb.mk
+index 9769b68ab793..58c9a63bd225 100644
+--- a/debian/system/core/adb.mk
++++ b/debian/system/core/adb.mk
+@@ -19,7 +19,6 @@ CPPFLAGS += \
+   -D_GNU_SOURCE \
+   -DADB_HOST=1 \
+   -DADB_VERSION='"$(DEB_VERSION)"' \
+-  -I/usr/include/android \
+   -Iexternal/boringssl/include \
+   -Isystem/core/adb \
+   -Isystem/core/base/include \
 diff --git a/debian/system/core/append2simg.mk b/debian/system/core/append2simg.mk
 index 1599bdb8..598c751d 100644
 --- a/debian/system/core/append2simg.mk
@@ -64,6 +106,14 @@ diff --git a/debian/system/core/fastboot.mk b/debian/system/core/fastboot.mk
 index d5c9a285..a59ba1a4 100644
 --- a/debian/system/core/fastboot.mk
 +++ b/debian/system/core/fastboot.mk
+@@ -30,7 +30,6 @@ CXXFLAGS += -std=gnu++2a -fpermissive
+ CPPFLAGS += \
+    -D_FILE_OFFSET_BITS=64 \
+    -DPLATFORM_TOOLS_VERSION='"$(PLATFORM_TOOLS_VERSION)"' \
+-   -I/usr/include/android \
+    -Iexternal/boringssl/include \
+    -Iexternal/avb \
+    -Isystem/core/adb \
 @@ -49,7 +49,7 @@ CPPFLAGS += \
  
  LDFLAGS += \
@@ -291,6 +341,18 @@ index ed53b04c..646ab030 100644
    -lbase \
    -llog \
    -lpthread \
+diff --git a/debian/system/extras/libext4_utils.mk b/debian/system/extras/libext4_utils.mk
+index 264bb95ad36a..99125097c8e3 100644
+--- a/debian/system/extras/libext4_utils.mk
++++ b/debian/system/extras/libext4_utils.mk
+@@ -25,7 +25,6 @@ CPPFLAGS += \
+   -D_LARGEFILE64_SOURCE \
+   -DFEC_NO_KLOG \
+   -DSQUASHFS_NO_KLOG \
+-  -I/usr/include/android \
+   -Isystem/core/base/include \
+   -Isystem/core/libcutils/include \
+   -Isystem/core/libsparse/include \
 diff --git a/frameworks/native/libs/adbd_auth/adbd_auth.cpp b/frameworks/native/libs/adbd_auth/adbd_auth.cpp
 index a9c23110..6ca334ba 100644
 --- a/frameworks/native/libs/adbd_auth/adbd_auth.cpp
-- 
2.39.5


