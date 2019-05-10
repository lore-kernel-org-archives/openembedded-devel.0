Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1196F7E096
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYf601Pz7P
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489318;
	bh=hf+i4+RzsfayasK07nI36jJfENo/RaTDYbuRxpJ4GNs=;
	h=From:To:Subject:Date:From;
	b=jdfl4VsFnpuZ99L5bgQQo6/ek+b5FK3frxT3u4KjrJ+FxUkFkiUXLLfc0zxIXUkkf
	PknD5DE1je2I7S7hTWlTdTlpAmLHnUJy5bYcicvrnzvujdeXz4QIrSIi8+uuSzikPC
	sD6IyUHyNJkAtc/FwhFkHE2nxIzDAcxl9SmTJOTT5lNQ3VPOY10ufXAGJf774mfUDM
	KxcIudPAsjl/Df70ONFI4fGoGLaSomfanyyU96Zulv7O+AQJrO9toQ8p5XWk7XKXbE
	7YIk+dLJx24PktmgKQdt6IgtlFExLrJkhyrr970T49UrMuQrxYhr51ugnIWfJmi2Eu
	G8WSvJymOLW71vak9lhjzLUccHQnD+nAbZp4NuRZy4a3Js04yWlCljcFJktZVYz4Cd
	D4f8Syxtezz+X8LgYXMgH7RJ97X26sp/dsX3KpbNKHy5FcQVPy6ghYcLF0bPBQ9GxS
	kQ39D+Fqc1Dd0loZMHa4YnU2UofhEqlemSS693ts/WECklqa3nQZfc+VJgCc8B6mEV
	oQQx3EqsjR9m1Z2rSrFUnf46tnplyCFfONTz33/fY+AyKKFHX5TB94BGifYoqvICV6
	WWm62hVPm0ME6bSZowF6dn8LetyRvwZNZ+Nyfn/b1OM/cB+jjdvkRwI5v0EWP4udhj
	pQR2JH2yv4iX5HnOlya4MhGk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:04 +0300
Message-Id: <20190510115515.19491-8-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] glm: Upgrade 0.9.9.3 -> 0.9.9.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2019 11:55:18 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-Remove-redundant-double-semi-colons.patch | 120 ------------------
 .../glm/{glm_0.9.9.3.bb => glm_0.9.9.5.bb}    |   5 +-
 2 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant-double-semi-colons.patch
 rename meta-oe/recipes-graphics/glm/{glm_0.9.9.3.bb => glm_0.9.9.5.bb} (82%)

diff --git a/meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant-double-semi-colons.patch b/meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant-double-semi-colons.patch
deleted file mode 100644
index 6e50f2cf2..000000000
--- a/meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant-double-semi-colons.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 3f6869e392b061f2932f3df155b6cc37e3e7d342 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Mar 2019 10:56:05 -0800
-Subject: [PATCH] glm: Remove redundant double semi-colons
-
-Make clang happy
-/glm/gtc/../ext/../detail/../simd/common.h:106:45: error: empty expression statement has no effect; remove unnecessary ';' to silence this warning [-Werror,-Wextra-semi-stmt]
-|         glm_vec4 const or0 = _mm_or_ps(and0, and1);;
-|                                                    ^
-| 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/874]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glm/gtx/associated_min_max.inl      | 8 ++++----
- glm/simd/common.h                   | 2 +-
- test/core/core_func_exponential.cpp | 6 +++---
- test/gtx/gtx_easing.cpp             | 4 ++--
- 4 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/glm/gtx/associated_min_max.inl b/glm/gtx/associated_min_max.inl
-index 1a459add..5186c471 100644
---- a/glm/gtx/associated_min_max.inl
-+++ b/glm/gtx/associated_min_max.inl
-@@ -86,7 +86,7 @@ GLM_FUNC_QUALIFIER U associatedMin
- )
- {
- 	T Test1 = min(x, y);
--	T Test2 = min(z, w);;
-+	T Test2 = min(z, w);
- 	U Result1 = x < y ? a : b;
- 	U Result2 = z < w ? c : d;
- 	U Result = Test1 < Test2 ? Result1 : Result2;
-@@ -152,7 +152,7 @@ GLM_FUNC_QUALIFIER vec<L, U, Q> associatedMin
- 	for(length_t i = 0, n = Result.length(); i < n; ++i)
- 	{
- 		T Test1 = min(x[i], y[i]);
--		T Test2 = min(z[i], w[i]);;
-+		T Test2 = min(z[i], w[i]);
- 		U Result1 = x[i] < y[i] ? a : b;
- 		U Result2 = z[i] < w[i] ? c : d;
- 		Result[i] = Test1 < Test2 ? Result1 : Result2;
-@@ -278,7 +278,7 @@ GLM_FUNC_QUALIFIER U associatedMax
- )
- {
- 	T Test1 = max(x, y);
--	T Test2 = max(z, w);;
-+	T Test2 = max(z, w);
- 	U Result1 = x > y ? a : b;
- 	U Result2 = z > w ? c : d;
- 	U Result = Test1 > Test2 ? Result1 : Result2;
-@@ -344,7 +344,7 @@ GLM_FUNC_QUALIFIER vec<L, U, Q> associatedMax
- 	for(length_t i = 0, n = Result.length(); i < n; ++i)
- 	{
- 		T Test1 = max(x[i], y[i]);
--		T Test2 = max(z[i], w[i]);;
-+		T Test2 = max(z[i], w[i]);
- 		U Result1 = x[i] > y[i] ? a : b;
- 		U Result2 = z[i] > w[i] ? c : d;
- 		Result[i] = Test1 > Test2 ? Result1 : Result2;
-diff --git a/glm/simd/common.h b/glm/simd/common.h
-index d07920a3..9b017cb4 100644
---- a/glm/simd/common.h
-+++ b/glm/simd/common.h
-@@ -103,7 +103,7 @@ GLM_FUNC_QUALIFIER glm_vec4 glm_vec4_sign(glm_vec4 x)
- 	glm_vec4 const cmp1 = _mm_cmpgt_ps(x, zro0);
- 	glm_vec4 const and0 = _mm_and_ps(cmp0, _mm_set1_ps(-1.0f));
- 	glm_vec4 const and1 = _mm_and_ps(cmp1, _mm_set1_ps(1.0f));
--	glm_vec4 const or0 = _mm_or_ps(and0, and1);;
-+	glm_vec4 const or0 = _mm_or_ps(and0, and1);
- 	return or0;
- }
- 
-diff --git a/test/core/core_func_exponential.cpp b/test/core/core_func_exponential.cpp
-index a414a4e9..380cdfb1 100644
---- a/test/core/core_func_exponential.cpp
-+++ b/test/core/core_func_exponential.cpp
-@@ -153,13 +153,13 @@ static int test_inversesqrt()
- 	float A = glm::inversesqrt(16.f) * glm::sqrt(16.f);
- 	Error += glm::equal(A, 1.f, 0.01f) ? 0 : 1;
- 
--	glm::vec1 B = glm::inversesqrt(glm::vec1(16.f)) * glm::sqrt(16.f);;
-+	glm::vec1 B = glm::inversesqrt(glm::vec1(16.f)) * glm::sqrt(16.f);
- 	Error += glm::all(glm::equal(B, glm::vec1(1.f), 0.01f)) ? 0 : 1;
- 
--	glm::vec2 C = glm::inversesqrt(glm::vec2(16.f)) * glm::sqrt(16.f);;
-+	glm::vec2 C = glm::inversesqrt(glm::vec2(16.f)) * glm::sqrt(16.f);
- 	Error += glm::all(glm::equal(C, glm::vec2(1.f), 0.01f)) ? 0 : 1;
- 
--	glm::vec3 D = glm::inversesqrt(glm::vec3(16.f)) * glm::sqrt(16.f);;
-+	glm::vec3 D = glm::inversesqrt(glm::vec3(16.f)) * glm::sqrt(16.f);
- 	Error += glm::all(glm::equal(D, glm::vec3(1.f), 0.01f)) ? 0 : 1;
- 
- 	glm::vec4 E = glm::inversesqrt(glm::vec4(16.f)) * glm::sqrt(16.f);
-diff --git a/test/gtx/gtx_easing.cpp b/test/gtx/gtx_easing.cpp
-index b3e13997..0e98cd53 100644
---- a/test/gtx/gtx_easing.cpp
-+++ b/test/gtx/gtx_easing.cpp
-@@ -34,7 +34,7 @@ namespace
- 		r = glm::circularEaseOut(a);
- 		r = glm::circularEaseInOut(a);
- 
--		r = glm::exponentialEaseIn(a);;
-+		r = glm::exponentialEaseIn(a);
- 		r = glm::exponentialEaseOut(a);
- 		r = glm::exponentialEaseInOut(a);
- 
-@@ -46,7 +46,7 @@ namespace
- 		r = glm::backEaseOut(a);
- 		r = glm::backEaseInOut(a);
- 
--		r = glm::bounceEaseIn(a);;
-+		r = glm::bounceEaseIn(a);
- 		r = glm::bounceEaseOut(a);
- 		r = glm::bounceEaseInOut(a);
- 	}
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.3.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
similarity index 82%
rename from meta-oe/recipes-graphics/glm/glm_0.9.9.3.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
index 2a26a5bc7..f367e4eae 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.3.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.5.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29
 
 SRC_URI = " \
     git://github.com/g-truc/glm;branch=master \
-    file://0001-glm-Remove-redundant-double-semi-colons.patch \
 "
-# v0.9.9.3
-SRCREV = "9749727c2db4742369219e1d452f43e918734b4e"
+# v0.9.9.5
+SRCREV = "d162eee1e6f7c317a09229fe6ceab8ec6ab9a4b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


