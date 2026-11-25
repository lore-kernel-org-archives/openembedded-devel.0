Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37931.1795594075757882529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o2hFd4tD;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386d1859e1cso270550eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594075; x=1796198875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ka6wPd3v+b819Gp/7nI78JD+sCdci9FTDTfe/CCfiD4=;
        b=o2hFd4tDdGTTnNTxZwYTYK2ITks4gK6rB8DLk/Pxrlri44DDbSUnvEbM4RBf/rMguR
         PXgNcoyK5xE1dvZmrC8kEeDM60Mzwq+EDZ4UVKpBH8PZKa9KdvqfScoS99gPXKV89yaF
         6eak+PzR5XqZmbHcLEuweFA3F+v6NevdTs0jtI0EJmtHIx8UKg9gBCvxFffqxeNz9liT
         MUrDb/di2O4sBb1TiLKdovBrzV2DWSGrYWMBHuUXNqVjzRRrgXtcbGAhkU4numC4Nkzn
         JktSYd+0vk42QPLniVUgKBjm7e3igpxEfFwFJ/2cYsenN4T7w2KyipAz0IR54puox06n
         VplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594075; x=1796198875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ka6wPd3v+b819Gp/7nI78JD+sCdci9FTDTfe/CCfiD4=;
        b=Ovgs2XS+N4kVImNr9+YMP/XkW38G6oDKM0qx1ki0gUI9e/eQJafEoxnq5+RsRMpRaA
         6wOnEc8MlthALGJ1TqP/WR1Cy4X80xu2olIzo/iEzDSpQsRkT0P614iS4tsG9q/DCh7/
         APn9+4aBS+zlWSC1vCWptpPYkg917zzZV4hg7/ZnGK1QS94PsJF0m8Vrs5CvIZdqwgn5
         Y3ekXNBjGowyyaHmSMM9i4vAXNuu0zJJR2CCQv2ToYWIySPN2A+NRi4w83RPSbPFOwz+
         viVXQ37Sa7g3PoPrYxWQ45cJQs8/DlQv9P1r/NhRXu3NytxQUFbe4EqYmB2SffcUgSOL
         uqmw==
X-Gm-Message-State: APuU4Z8uR7ShCgKnJG8w6nt/Z4GOFuHihD5ybAZfGumoI72QBDhgAP5x
	C5bnuaTQxRGLXyY/D31v3NzrDURVCgvrVsHQC11d0UB594eCbsySBFduLvgTWUyu
X-Gm-Gg: AZFdTZcrmqCtT7mvTL3M8HB0kIKBSthEYkXBB+DkFt2n8A/NNKx914QsOU++p3IL54x
	WOwN6vS41qI0k4QdG+OiSIGcNe/Ep+vsymD7pc2i2MTbDkH92yE8IhJJuTYBbiqxPDEr8E8SAI4
	x9hHMa2jbaIyASb91fAqmnPg/eZeX5+64b/9BZelhj0C4iAQRFI77NqNNGIgBchITgQVfWB3s8+
	uQ7N8SpU5P4RbwHD8uAwvZ2qvZjaliFpEQJg/IXK3S3iYLeeG8kLuUTyluxcmw+OG6doLFM0FZs
	lWDx2ETX2GdmQvj+9qL3nR6VyYbMCvCODJQk7+eevd1XHuXHNKhnZXi8NUhEZn0e3PGjAlpT3p9
	WNQnc0wlu8GjZkj6CRUqDjvSbyFU4OHnOOeciwoY5+dJgzwgECnH91i/W4BtVMrrZQdYdO0dQnl
	xlsPMg8Ir3swdrJEwwb3fAEifR2sTtWPJMH8CKAe4VWN+wLLmbHZA8xKgzNUHxibdA1wdxmMNKU
	VFHhLeiXQ+oTdAeYPiGudY3diy6vind6WBGpzkPTWJDonORmFMvXUdkEApzO0ecY5onRW+1xO/S
	F6tiBJJQNzEgnj+75m2U6kkcAm/MUcHgUTwGvFpN2TKgXpoW6Jpzb7aYfY4HB49y4iMncb62Oua
	OcPLw0xlv9Q/bin9/DfRSEVuWaqTlAqsfkn376ReQnpbAELI06gPQrw6Q4l7Q/3aDgXV66ig5/r
	r9QervSfTMjqYot+UMQmdMBEdmrQ+M7lnOPldjXkpYM6nma9q+kO6ypjtdTetLkC8OALxSMtjl1
	BmeGihTlm+RGvH4G3KTsECBoXhuTj3jwwXFBCpx1dhPlONIr6r8/65HbhnobXKUgV9rZlHqV6es
	oSif
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr17603779eec.11.1795594074939;
        Wed, 25 Nov 2026 00:07:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/55] glm: upgrade 0.9.9.8 -> 1.0.3
Date: Wed, 25 Nov 2026 00:06:25 -0800
Message-ID: <20261125080732.2419614-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133012
Content-Type: text/plain; charset="utf-8"

- 1.0.0 adds GLM_EXT_scalar/vector_reciprocal, GLM_EXT_matrix_integer,
  iround/uround and constexpr dot/cross, and fixes decompose, quaternion
  pow/euler conversion, adjugate and angle sign
- 1.0.1 adds C++17 [[nodiscard]] support and aligned vec3 SIMD, and
  fixes shear and smoothstep SIMD
- 1.0.2 adds packed/aligned quaternion types,
  GLM_GTX_structured_bindings, GLM_GTX_iteration and
  infinitePerspectiveRH/LH; unit tests are no longer built by default
  (GLM_BUILD_TESTS)
- 1.0.3 adds reflection matrices, reverts the quaternion rotate
  direction change and fixes vec4 to vec3 conversion and swizzles with
  GLM_FORCE_SIZE_T_LENGTH
- GLM 1.1 will require C++17

1.0.3 is tagged on the 1.0 branch. Drop both patches: the quaternion fix
is upstream and the rest only touched the test suite, which is not built
by default anymore. Add an upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Do-not-use-Werror-with-clang.patch   |  32 ----
 .../glm/glm/0001-Silence-clang-warnings.patch | 145 ------------------
 .../glm/{glm_0.9.9.8.bb => glm_1.0.3.bb}      |   9 +-
 3 files changed, 4 insertions(+), 182 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
 delete mode 100644 meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.9.8.bb => glm_1.0.3.bb} (85%)

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch b/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
deleted file mode 100644
index dee2749898..0000000000
--- a/meta-oe/recipes-graphics/glm/glm/0001-Do-not-use-Werror-with-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ee405855bca7d6399ff1a1aef952010056c84ff6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 1 Mar 2023 21:08:09 -0800
-Subject: [PATCH] Do not use -Werror with clang
-
-Too many warnings to handle for a distro build
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- test/CMakeLists.txt | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index e7f85f19..0b6fd980 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -197,10 +197,6 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
- 		message("GLM: Clang - ${CMAKE_CXX_COMPILER_ID} compiler")
- 	endif()
- 
--	add_compile_options(-Werror -Weverything)
--	add_compile_options(-Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-c++11-long-long -Wno-padded -Wno-gnu-anonymous-struct -Wno-nested-anon-types)
--	add_compile_options(-Wno-undefined-reinterpret-cast -Wno-sign-conversion -Wno-unused-variable -Wno-missing-prototypes -Wno-unreachable-code -Wno-missing-variable-declarations -Wno-sign-compare -Wno-global-constructors -Wno-unused-macros -Wno-format-nonliteral)
--
- elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
- 	if(NOT GLM_QUIET)
- 		message("GLM: GCC - ${CMAKE_CXX_COMPILER_ID} compiler")
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch b/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
deleted file mode 100644
index 10692dd423..0000000000
--- a/meta-oe/recipes-graphics/glm/glm/0001-Silence-clang-warnings.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From bd9b5060bc3b9581090d44f15b4e236566ea86a6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Jun 2021 12:57:57 -0700
-Subject: [PATCH] Silence clang warnings
-
-Fixes
-glm/gtc/random.inl:25:17: error: implicit conversion loses integer precision: 'int' to 'unsigned char' [-Werror,-Wimplicit-int-conversion]
-|                                 std::rand() % std::numeric_limits<uint8>::max());
-|                                 ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-glm/gtc/../ext/quaternion_common.inl:76:87: error: unused parameter 'k' [-Werror,-Wunused-parameter]
-    GLM_FUNC_QUALIFIER qua<T, Q> slerp(qua<T, Q> const& x, qua<T, Q> const& y, T a, S k)
-                                                                                      ^
-
-and
-
-test/gtx/gtx_fast_trigonometry.cpp:135:9: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
-|                 float result = 0.f;
-|                       ^
-
-Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/1055]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glm/ext/quaternion_common.inl      |  2 +-
- glm/gtc/random.inl                 |  2 +-
- test/gtx/gtx_fast_trigonometry.cpp | 30 ++++++++++++------------------
- 3 files changed, 14 insertions(+), 20 deletions(-)
-
---- a/glm/ext/quaternion_common.inl
-+++ b/glm/ext/quaternion_common.inl
-@@ -104,7 +104,7 @@ namespace glm
-         {
-             // Graphics Gems III, page 96
-             T angle = acos(cosTheta);
--            T phi = angle + k * glm::pi<T>();
-+            T phi = angle + static_cast<T>(k) * glm::pi<T>();
-             return (sin(angle - a * phi)* x + sin(a * phi) * z) / sin(angle);
-         }
-     }
---- a/test/gtx/gtx_fast_trigonometry.cpp
-+++ b/test/gtx/gtx_fast_trigonometry.cpp
-@@ -19,15 +19,14 @@ namespace fastCos
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastCos(i);
-+			glm::fastCos(i);
- 
- 		const std::clock_t timestamp2 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::cos(i);
-+			glm::cos(i);
- 
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
-@@ -53,15 +52,14 @@ namespace fastSin
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastSin(i);
-+			glm::fastSin(i);
- 
- 		const std::clock_t timestamp2 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::sin(i);
-+			glm::sin(i);
- 
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
-@@ -79,15 +77,14 @@ namespace fastTan
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastTan(i);
-+			glm::fastTan(i);
- 
- 		const std::clock_t timestamp2 = std::clock();
- 		for (float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::tan(i);
-+			glm::tan(i);
- 
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
-@@ -105,15 +102,14 @@ namespace fastAcos
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastAcos(i);
-+			glm::fastAcos(i);
- 
- 		const std::clock_t timestamp2 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::acos(i);
-+			glm::acos(i);
- 
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
-@@ -132,13 +128,12 @@ namespace fastAsin
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastAsin(i);
-+			glm::fastAsin(i);
- 		const std::clock_t timestamp2 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::asin(i);
-+			glm::asin(i);
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
- 		const std::clock_t time_default = timestamp3 - timestamp2;
-@@ -155,13 +150,12 @@ namespace fastAtan
- 	{
- 		const float begin = -glm::pi<float>();
- 		const float end = glm::pi<float>();
--		float result = 0.f;
- 		const std::clock_t timestamp1 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::fastAtan(i);
-+			glm::fastAtan(i);
- 		const std::clock_t timestamp2 = std::clock();
- 		for(float i = begin; i < end; i = NextFloat ? glm::nextFloat(i) : i += 0.1f)
--			result = glm::atan(i);
-+			glm::atan(i);
- 		const std::clock_t timestamp3 = std::clock();
- 		const std::clock_t time_fast = timestamp2 - timestamp1;
- 		const std::clock_t time_default = timestamp3 - timestamp2;
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_1.0.3.bb
similarity index 85%
rename from meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
rename to meta-oe/recipes-graphics/glm/glm_1.0.3.bb
index 7f29c1fab9..0c6d72ebd3 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_1.0.3.bb
@@ -9,16 +9,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://copying.txt;md5=462e4b97f73ef12f8171c3c546ce4e8d"
 
 SRC_URI = " \
-    git://github.com/g-truc/glm;branch=master;protocol=https \
-    file://0001-Silence-clang-warnings.patch \
-    file://0001-Do-not-use-Werror-with-clang.patch \
+    git://github.com/g-truc/glm;branch=1.0;protocol=https;tag=${PV} \
     file://glmConfig.cmake.in \
     file://glmConfigVersion.cmake.in \
     file://glm.pc.in \
     file://glmTargets.cmake \
 "
-SRCREV = "efec5db081e3aad807d0731e172ac597f6a39447"
-PV .= "+0.9.9.9+git"
+SRCREV = "8d1fd52e5ab5590e2c81768ace50c72bae28f2ed"
+
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 
 inherit cmake
