Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6497CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17702.1763014795651547127
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPW5hMJ0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-295548467c7so4766585ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014795; x=1763619595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9FsVu7FJLp4CtVSXMJsFuPA9RiPIIW+BY3oN9DMJGw=;
        b=OPW5hMJ0hz1PhxSqSkDJVLS/HyHjN5EDU6LrDAxmk0eA//6VQQqWNB1T6e0Rk1os52
         d4e98GPIlSqAiu54iFlcdNCvJITeIIiqbVL3kfTu7VuRI4kpWaNodMmigs9xo2uENEfZ
         pNNWDzMFthWdeF/ZTnTrNUyHPFpIwq+czCOqkWBL7bEoQ+/7H0/Fl/Y/cjwy1yWyErzo
         bogHu6Wzlb/Ci7VI4AigYDOBSBTBeRl5fu3UpnQWRmBGEJochuxnIN1CDDfiFXVDxRNw
         v3l5TdRgoCV1e8dDyVvp0PXbIwa+LKL+UeXXTomp6Hn0sElEGuh7u4GPpzTbjx6vdG5l
         nuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014795; x=1763619595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9FsVu7FJLp4CtVSXMJsFuPA9RiPIIW+BY3oN9DMJGw=;
        b=chJUinxv57k9fxYzvag03tbNtKrVY5PHb93N/Hh5XHFaH3gHFHacVANnwsX84ebxmE
         Kt82y+ro/jKG8A2zecfbfJFrePx950GIkQTDSTDLsIwFfM9tiKtAIPYb87w1Jgi5sdc/
         7tQ70zu8BF3Zl7D7GMDmR58urYVtNHvalEl1E/DisAfft58XhBO2g0c74yRsTtTp8/kq
         6yr0mUvsvOqdc8gWLEdBVXZWDjrza4tS5yZkRrck3ZXLXgv9ScYMOP0TF5lThqkHcTbl
         +fkaDNNCc1TuyXPC6hJ2QRKVw07d8uy+eu5jfrP3yGBmy64bMTv2ym97ZyUASBTDHwHx
         4Uiw==
X-Gm-Message-State: AOJu0Ywh5/EpCXb7HIwj/gm9fbIF3BHq6faOFPMj/wiCzNAkmQ3JRW+i
	0ykf8FAEgKuvbqBuCcJEUQ722l+fNtHLQKm8rSiNS9Kn6GE99Maxh/XJHS7UIQ==
X-Gm-Gg: ASbGnct3lseMoDbueDaJFnSpTEHWdPDBYt0Rm5DEk3MNZrConKnWYydA2N/crEeO+yF
	ZERNUiWqBi/jTP81dBOZIQcsl1WXMkQHc8xS6GWVcZ26AXzUbXignI31zoNZKFTwK2ehRx9JBnD
	ZntZ0YUlqH5uPxQtHRxk90HQtpx5PQpdpZwvbxYypb6/spVr9yJECd4Tt4Fk1JWNrtJpimci6aN
	KX3XvbqXIdo5BynR7xm7XG82sLVlfsU+tI0EMMgXD/7XH/YIyw/IdIClHXMz3QE1fV+BJPTJe5t
	PNy6b0dzd29+IFb3fzPFzRUEN4zXIsjuYWAkVdiy7nkQAt/ufu60N8Uj+thWd5shQnRdgt+AalV
	+wNHaSDrjEIsGM4tKCe4mRDWNpV1bIyJCIIGg/rUmTgTbv/Ljx7MhHteJ6f+/mAmIogQGCtf0YZ
	MzLrs8lZb2wbqEOA==
X-Google-Smtp-Source: AGHT+IFXT3iVNMrNnKVyVz36zr8mTv+A2ykSbds1KflUFypQMDq7DuChTzbSOcSD+IcDTmVOofzuXw==
X-Received: by 2002:a17:903:1a0f:b0:297:cf96:45bd with SMTP id d9443c01a7336-2984ed359d4mr66564735ad.19.1763014794668;
        Wed, 12 Nov 2025 22:19:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 08/38] tbb: upgrade 2021.11.0 -> 2021.12.0
Date: Thu, 13 Nov 2025 19:18:43 +1300
Message-ID: <20251113061914.3756301-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121606

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Drop patches that are now merged in the upstream
- Upstream defaults to disabling searching for hwloc when cross-compiling.

Release Notes:
https://github.com/uxlfoundation/oneTBB/releases/tag/v2021.12.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...suppress-new-GCC-12-13-warnings-1192.patch | 57 -------------------
 ....cmake-remove-cross-compiation-check.patch | 33 -----------
 .../{tbb_2021.11.0.bb => tbb_2021.12.0.bb}    |  8 +--
 3 files changed, 3 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.11.0.bb => tbb_2021.12.0.bb} (92%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch b/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
deleted file mode 100644
index 489f011b84..0000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From e131071769ee3df51b56b053ba6bfa06ae9eff25 Mon Sep 17 00:00:00 2001
-From: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
-Date: Mon, 11 Sep 2023 10:35:07 -0500
-Subject: [PATCH] Fix/suppress new GCC 12/13 warnings (#1192)
-
-Upstream-Status: Backport [https://github.com/oneapi-src/oneTBB/commit/e131071769ee3df51b56b053ba6bfa06ae9eff25]
-Signed-off-by: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
----
- .../oneapi/tbb/detail/_concurrent_unordered_base.h   |  2 +-
- src/tbb/concurrent_monitor.h                         | 12 +++++++++++-
- 2 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/include/oneapi/tbb/detail/_concurrent_unordered_base.h b/include/oneapi/tbb/detail/_concurrent_unordered_base.h
-index ade91c33..40829208 100644
---- a/include/oneapi/tbb/detail/_concurrent_unordered_base.h
-+++ b/include/oneapi/tbb/detail/_concurrent_unordered_base.h
-@@ -921,7 +921,7 @@ private:
-             node_allocator_traits::deallocate(dummy_node_allocator, node, 1);
-         } else {
-             // GCC 11.1 issues a warning here that incorrect destructor might be called for dummy_nodes
--            #if (__TBB_GCC_VERSION >= 110100 && __TBB_GCC_VERSION < 130000 ) && !__clang__ && !__INTEL_COMPILER
-+            #if (__TBB_GCC_VERSION >= 110100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
-             volatile
-             #endif
-             value_node_ptr val_node = static_cast<value_node_ptr>(node);
-diff --git a/src/tbb/concurrent_monitor.h b/src/tbb/concurrent_monitor.h
-index 3d20ef5b..3e5c4beb 100644
---- a/src/tbb/concurrent_monitor.h
-+++ b/src/tbb/concurrent_monitor.h
-@@ -1,5 +1,5 @@
- /*
--    Copyright (c) 2005-2021 Intel Corporation
-+    Copyright (c) 2005-2023 Intel Corporation
- 
-     Licensed under the Apache License, Version 2.0 (the "License");
-     you may not use this file except in compliance with the License.
-@@ -290,7 +290,17 @@ public:
-             n = my_waitset.front();
-             if (n != end) {
-                 my_waitset.remove(*n);
-+
-+// GCC 12.x-13.x issues a warning here that to_wait_node(n)->my_is_in_list might have size 0, since n is
-+// a base_node pointer. (This cannot happen, because only wait_node pointers are added to my_waitset.)
-+#if (__TBB_GCC_VERSION >= 120100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wstringop-overflow"
-+#endif
-                 to_wait_node(n)->my_is_in_list.store(false, std::memory_order_relaxed);
-+#if (__TBB_GCC_VERSION >= 120100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
-+#pragma GCC diagnostic pop
-+#endif
-             }
-         }
- 
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch b/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
deleted file mode 100644
index 640b131703..0000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7ffc1eba8596544d6e3af0fd5f4004fff6d56f84 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 29 Nov 2023 15:48:57 +0800
-Subject: [PATCH] hwloc_detection.cmake: remove cross-compiation check
-
-This check is preventing pkgconfig to
-search for hwloc under cross-compilation.
-
-pkgconfig able to find hwloc pkg from sysroot.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- cmake/hwloc_detection.cmake | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/cmake/hwloc_detection.cmake b/cmake/hwloc_detection.cmake
-index 47233b17..5a7e84c3 100644
---- a/cmake/hwloc_detection.cmake
-+++ b/cmake/hwloc_detection.cmake
-@@ -46,8 +46,6 @@ endforeach()
- unset(HWLOC_TARGET_NAME)
- 
- if (NOT HWLOC_TARGET_EXPLICITLY_DEFINED AND
--    # No hwloc auto detection for cross compilation
--    NOT CMAKE_CROSSCOMPILING AND
-     NOT TBB_DISABLE_HWLOC_AUTOMATIC_SEARCH
- )
-     find_package(PkgConfig QUIET)
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.12.0.bb
similarity index 92%
rename from meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.12.0.bb
index 318cd87643..ed5dc04866 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.12.0.bb
@@ -13,11 +13,8 @@ DEPENDS:append:class-target = " hwloc"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "8b829acc65569019edb896c5150d427f288e8aba"
-SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-            file://0001-hwloc_detection.cmake-remove-cross-compiation-check.patch \
-            file://0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch \
-"
+SRCREV = "9afd759b72c0c233cd5ea3c3c06b0894c9da9c54"
+SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
@@ -26,6 +23,7 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE += " \
                     -DTBB_TEST=OFF \
                     -DCMAKE_BUILD_TYPE=Release \
+                    -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
                 "
 
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)

