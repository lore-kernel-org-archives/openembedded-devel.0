Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2C9C83F24
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 20:34:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.44000.1752352448227038331
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 13:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhUjWbaI;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so3496461b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752352447; x=1752957247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+0I+UkVaBlsDFTIxSMgQt356RvPQNOo+wKcig4NM04=;
        b=dhUjWbaIi1zU5a6P/8M/EoRNBh5KgInxJPQ4yFUIwbVhWzGJsuDt0SyMic3FnNJ67H
         FQwq7slr2ocuN6hvLf32EJWq8I/YQ6LP0Wd8+I4nzH14qMg7yrqJimkr5meFDGM7adda
         3XSePnnSH1jdxwF7XedDCNvrbP0rdeO1VTRwL5rZtvrd0nRYgQQP45sqLGlWTXNO0lsk
         Ck7nr0kRgBSj6Q+FFs/lJo1Kj//6LJWojaWhaihBAJRhDxxUkO9dy81/Xv+Ee4Emn2v9
         fjrf0ta5hRRQ+RAD6GxyIgPzxwUess0o8IxiM3kpXcbTlra4Ug/TJ9qNAwzzso1eq1KO
         yrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752352447; x=1752957247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+0I+UkVaBlsDFTIxSMgQt356RvPQNOo+wKcig4NM04=;
        b=iFS9SEBWw3imn3c/p9MaIN1Wngs3I48IyQrAQQ8kZvOkQCiboBd0WUS1ivSP1+jooF
         SqcTej3wS8EBrHR1D1fM94zZ90RUxF/584KQ440pUTvD+VCOstMgXoR2akKF/sjyF54H
         QXT7aXnjMsR9gkQKjJ12tp+8SQc/M7LJtqdTZHfXWHk+iW6NJ6bhGyUb+pfKzq3hLRMY
         eS8SKYRVhcsfam76wTpUP5654gQ4dPhAfNTmToV8MrzEjfmJFGjti1/1rD5bwdu0a4Eg
         pzDEHZH7uOlPGVkdRRaC5Iz0dhg5r4I8CIhME1LjrZP1j3DDU3alVXYRxIIXjvmL9nwQ
         DMmg==
X-Gm-Message-State: AOJu0Yw2cg4b/NCn+g0mcyvofKW3PVA7cyvWTfSb1IsHMFpFkZkZTBWA
	jM3yjfHKQQCzwSJUDQNXdExRyBQMV9dhcKzFty/hYUrmljx0EkqB1gxb55mKHh24
X-Gm-Gg: ASbGncvPh6gtfGTdT2+pJ3AF2r30dkwnl4rnIFNsWRdw1W8iBZlyIYsMEMrSA9SLm1B
	4vuVatORy7Fow60U5wZA8eJvMSOwcmWh1T1qnaDzRse+xFmK5nN/Jxp+5l0OFpjUddhwP4uBO5a
	nA2wBOMSw8I+croD8Tkj//dAEQ6qgUZq5UkFKnhL1mFz0VfEzEC8ytfUBch5tNerQo8l/4vozpX
	XurQomqRWigi5JN5LjEJmW1B6XHrkEtyDZIGCTs9islGwhLFOElHbZ5fmSAiY0saBlJi9tWMkVv
	pHxTUfnSZAUx3GiQJBK+kDdLSvLNIvUCcK51xtRnRSyrNWn+Lwnn+/LSdxWK8fkVj0bA4gIyoOJ
	sdGPU0dHrH4xDhw==
X-Google-Smtp-Source: AGHT+IH7JXhjzOpDQRUWZDWeopWXfYW9hUIORB8Xr8MK+lWhoHszz/vfyCWvZPq0kgYovsVIeZT7Tg==
X-Received: by 2002:a05:6a20:2d23:b0:228:6699:87ef with SMTP id adf61e73a8af0-231272c27c1mr11630935637.13.1752352447142;
        Sat, 12 Jul 2025 13:34:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe577e15sm7546218a12.19.2025.07.12.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 13:34:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] opencv: Upgrade to 4.12.0 release
Date: Sat, 12 Jul 2025 13:34:02 -0700
Message-ID: <20250712203402.145129-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712203402.145129-1-raj.khem@gmail.com>
References: <20250712203402.145129-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 20:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118490

Update submodules to match the working version with 4.12.0
Drop backports which are already present in 4.12.0
Upgrade fastcv to 4.x_20250606

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...MLIST-FastCV-latest-libs-hash-update.patch | 50 -----------
 ...o-static-instance-of-FastCV-on-Linux.patch | 87 -------------------
 .../opencv/0001-Make-ts-module-external.patch |  2 +-
 ...-fixed-VSX-intrinsics-implementation.patch | 61 -------------
 .../{opencv_4.11.0.bb => opencv_4.12.0.bb}    | 11 +--
 5 files changed, 5 insertions(+), 206 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch
 rename meta-oe/recipes-support/opencv/{opencv_4.11.0.bb => opencv_4.12.0.bb} (95%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch
deleted file mode 100644
index b35335c35e..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ba6eb8d95292f4631a3b8de09bfaa59e43c17226 Mon Sep 17 00:00:00 2001
-From: adsha-quic <quic_adsha@quicinc.com>
-Date: Wed, 16 Apr 2025 18:54:40 +0530
-Subject: [PATCH] FROMLIST: Merge pull request #27214 from CodeLinaro:fastcv_lib_hash_update
-
-Signed-off-by: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
-Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/27214]
-
----
- 3rdparty/fastcv/fastcv.cmake | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
-index 5c81c11300..6fee4ce4ce 100644
---- a/3rdparty/fastcv/fastcv.cmake
-+++ b/3rdparty/fastcv/fastcv.cmake
-@@ -1,23 +1,23 @@
- function(download_fastcv root_dir)
- 
-   # Commit SHA in the opencv_3rdparty repo
--  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
-+  set(FASTCV_COMMIT "8d86e68dad8b80b8575a8d3cf401d3ee96c24148")
- 
-   # Define actual FastCV versions
-   if(ANDROID)
-     if(AARCH64)
-       message(STATUS "Download FastCV for Android aarch64")
--      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2024_12_11.tgz")
--      set(FCV_PACKAGE_HASH  "9dac41e86597305f846212dae31a4a88")
-+      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2025_04_08.tgz")
-+      set(FCV_PACKAGE_HASH  "e028966a1d1b2f3f0bc5967d316e8b64")
-     else()
-       message(STATUS "Download FastCV for Android armv7")
--      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2024_12_11.tgz")
--      set(FCV_PACKAGE_HASH  "fe2d30334180b17e3031eee92aac43b6")
-+      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2025_04_08.tgz")
-+      set(FCV_PACKAGE_HASH  "6fc1e812a4b3ef392469d2283e037ffe")
-     endif()
-   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
-     if(AARCH64)
--      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
--      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
-+      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_04_08.tgz")
-+      set(FCV_PACKAGE_HASH  "062a26639cd2788beee2e0dd8743d680")
-     else()
-       message("FastCV: fastcv lib for 32-bit Linux is not supported for now!")
-     endif()
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch
deleted file mode 100644
index dd3c9a7a82..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From e517347450636012e5f7a65a504e4ac9e1224c50 Mon Sep 17 00:00:00 2001
-From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
-Date: Thu, 13 Feb 2025 09:17:08 +0300
-Subject: [PATCH] FROMLIST: Switch to static instance of FastCV on Linux.
-
-Signed-off-by: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
-Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/26917]
----
- 3rdparty/fastcv/fastcv.cmake   |  7 ++++---
- cmake/OpenCVFindLibsPerf.cmake | 21 +++++++++++++++------
- 2 files changed, 19 insertions(+), 9 deletions(-)
-
-diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
-index b8172705ca..5c81c11300 100644
---- a/3rdparty/fastcv/fastcv.cmake
-+++ b/3rdparty/fastcv/fastcv.cmake
-@@ -1,7 +1,7 @@
- function(download_fastcv root_dir)
- 
-   # Commit SHA in the opencv_3rdparty repo
--  set(FASTCV_COMMIT "dc5d58018f3af915a8d209386d2c58c0501c0f2c")
-+  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
- 
-   # Define actual FastCV versions
-   if(ANDROID)
-@@ -16,14 +16,15 @@ function(download_fastcv root_dir)
-     endif()
-   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
-     if(AARCH64)
--      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2024_12_11.tgz")
--      set(FCV_PACKAGE_HASH  "7b33ad833e6f15ab6d4ec64fa3c17acd")
-+      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
-+      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
-     else()
-       message("FastCV: fastcv lib for 32-bit Linux is not supported for now!")
-     endif()
-   endif(ANDROID)
- 
-   # Download Package
-+
-   set(OPENCV_FASTCV_URL "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${FASTCV_COMMIT}/fastcv/")
- 
-   ocv_download( FILENAME        ${FCV_PACKAGE_NAME}
-diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.cmake
-index c2380e6ce5..c5fb628c44 100644
---- a/cmake/OpenCVFindLibsPerf.cmake
-+++ b/cmake/OpenCVFindLibsPerf.cmake
-@@ -181,7 +181,14 @@ endif(WITH_KLEIDICV)
- if(WITH_FASTCV)
-   if((EXISTS ${FastCV_INCLUDE_PATH}) AND (EXISTS ${FastCV_LIB_PATH}))
-     message(STATUS "Use external FastCV ${FastCV_INCLUDE_PATH}, ${FastCV_LIB_PATH}")
--    set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
-+    find_library(FASTCV_LIBRARY NAMES "fastcv"
-+                 PATHS "${FastCV_LIB_PATH}" NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
-+    mark_as_advanced(FASTCV_LIBRARY)
-+    if (FASTCV_LIBRARY)
-+      set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
-+    else()
-+      set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
-+    endif()
-   else()
-     include("${OpenCV_SOURCE_DIR}/3rdparty/fastcv/fastcv.cmake")
-     set(FCV_ROOT_DIR "${OpenCV_BINARY_DIR}/3rdparty/fastcv")
-@@ -190,13 +197,15 @@ if(WITH_FASTCV)
-       set(FastCV_INCLUDE_PATH "${FCV_ROOT_DIR}/inc" CACHE PATH "FastCV includes directory")
-       set(FastCV_LIB_PATH "${FCV_ROOT_DIR}/libs" CACHE PATH "FastCV library directory")
-       ocv_install_3rdparty_licenses(FastCV "${OpenCV_BINARY_DIR}/3rdparty/fastcv/LICENSE")
--      install(FILES "${FastCV_LIB_PATH}/libfastcvopt.so"
--              DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
-+      if(ANDROID)
-+        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH "FastCV library")
-+        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
-+      else()
-+        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcv.a" CACHE PATH "FastCV library")
-+        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "dev")
-+      endif()
-     else()
-       set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
-     endif()
-   endif()
--  if(HAVE_FASTCV)
--    set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH "FastCV library")
--  endif()
- endif(WITH_FASTCV)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch b/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
index d56b8ae67e..9e72fe2f56 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
@@ -7,7 +7,7 @@ Make ts module external
 
 Reference: https://github.com/qbonnard/opencv/commit/6b229c5834cb9a0930425e762a6c7b03244d7abb
 
-Upstream-Status: Submitted [https://github.com/opencv/opencv/issues/8408]
+Upstream-Status: Denied [https://github.com/opencv/opencv/issues/8408]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch
deleted file mode 100644
index 9fc89e4244..0000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intrinsics-implementation.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 2001
-From: Maksim Shabunin <maksim.shabunin@gmail.com>
-Date: Fri, 10 Jan 2025 18:34:11 +0300
-Subject: [PATCH] core: fixed VSX intrinsics implementation
-
-Upstream-Status: Backport
-[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b89eb4383ce8528]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
-index 2157e1e870..0a0915a22f 100644
---- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
-+++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
-@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, double)
- inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp)0)); }             \
- inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats((_Tp)v));}          \
- template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix(); }               \
--template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(_Tp v); }       \
-+template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suffix(v); }       \
- template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix(const _Tpvec0 &a)  \
- { return _Tpvec((cast)a.val); }
- 
-@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_bdword2_c)
- #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
- inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
- { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
--inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
-+inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
- { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
- inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
- { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
--inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
-+inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
- { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
- inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
- { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
-@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_int32x4& a, const v_int32x4& b, cons
- inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b)
- { return v_dotprod(a, b); }
- inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x8& b, const v_int32x4& c)
--{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
-+{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); }
- // 32 >> 64
- inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4& b)
- { return v_dotprod(a, b); }
-@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x4& b, const v_
- inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_uint8x16& b)
- { return v_dotprod_expand(a, b); }
- inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const v_uint8x16& b, const v_uint32x4& c)
--{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
-+{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c); }
- 
- inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v_int8x16& b)
- {
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
similarity index 95%
rename from meta-oe/recipes-support/opencv/opencv_4.11.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index 208d65725e..d8295912fa 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -10,13 +10,13 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "31b0eeea0b44b370fd0712312df4214d4ae1b158"
-SRCREV_contrib = "0e5254ebf54d2aed6e7eaf6660bf3b797cf50a02"
+SRCREV_opencv = "49486f61fb25722cbcf586b7f4320921d46fb38e"
+SRCREV_contrib = "d943e1d61c8bc556a13783e1546ee7c1a9e0b1cf"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
-SRCREV_fastcv = "8d86e68dad8b80b8575a8d3cf401d3ee96c24148"
+SRCREV_fastcv = "2265e79b3b9a8512a9c615b8c4d0244e88f45a9d"
 
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv"
@@ -26,16 +26,13 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=wechat-qrcode;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250410;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https  \
+           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250606;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https  \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://0001-core-fixed-VSX-intrinsics-implementation.patch \
-           file://0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch \
-           file://0001-FROMLIST-FastCV-latest-libs-hash-update.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 

