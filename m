Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 19DF97D3A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 20:11:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ChlT71djz4V
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 22:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566331910;
	bh=8hfvNHUhh0mLsNDDpXMsK0sL/ROj3n8SX0A8Xu61yTU=;
	h=From:To:Subject:Date:From;
	b=k+hHC+j5njSDhamHkIv76MKhT4IEBVr4ypZOHuBcw5162KqotBNhiymsWl3LVrNoQ
	X2gpcZXaGzFuNzv/TlNh83+PWyOqG9Yj+xek/I8ZbtJ3L5LuISuagjcO0JWzhFsuZD
	0N3Rr4nxXVUY3STRfc/lLIJNu+UXd+PBdCW3laFvYK/ZKrvgm3+gOMGBHzFD3fbugi
	WEQAjL0iBdipoLTI4skah+TPXYNtC8+jkTZfNUoncCch7Q7dDeycD8QvzvEq1JR1Yt
	2sfOboSX1y3XLU+/nkNLsrdMlqpAIwfA8dsdw/ELLg6VNRyej6/frAHl4Ndpy2GOxd
	e333Vs3GJ9woKwizZMT1zDSH98vTaBT92BIisz8sSiDpYSyDPxQPjOtWk/ibNvobGt
	RV064EJXNzCMgUOMS9IfBuKDE416yMeRWYKppwfBFJ1AQRXMN597qRR/T1bQ+FhlNo
	xxvFvN2Jvg8puJjy6RrCF+o2IxC5wBAoHj5mw7rZw+Km8o78zGPJ4UUtkQ/HsrbQsz
	Lf0qOTq1EVOA7teYZjwdKJnsDQ6mXHBL4uf7KNwveiIp3NOAyyTy6vjvZCM7AEV+rz
	c7xAc5o/CnTkFvt1vdU186ZmlWNAcMuVWlQq+iZGru9yK3cMw4NvqkTXkIiLgLFGKq
	0SUvEkwMH4xw3Vdbvau94VT4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Aug 2019 23:11:48 +0300
Message-Id: <20190820201148.27698-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] poppler: Stop using USE_FIXEDPOINT
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
X-List-Received-Date: Tue, 20 Aug 2019 20:11:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It was no longer building and will be removed in the next
upstream version.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...c-fix-build-error-when-using-fixedpo.patch | 100 ------------------
 .../recipes-support/poppler/poppler_0.79.0.bb |   9 --
 2 files changed, 109 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch b/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
deleted file mode 100644
index 3c231fe93..000000000
--- a/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 6287663e7db04df7e6dec58a1fc5bb5d510e8bde Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 9 Apr 2018 19:11:20 +0200
-Subject: [PATCH] CairoOutputDev.cc: fix build error when using fixedpoint
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashRound(SplashCoord)':
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1604:28: error: call of overloaded 'floor(FixedPoint)' is ambiguous
-|    return (int)floor(x + 0.5);
-|                             ^
-| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:165:1: note: candidate: double floor(double)
-|  __MATHCALLX (floor,, (_Mdouble_ __x), (__const__));
-|  ^
-| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/math.h:36:0,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:46:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:260:3: note: candidate: constexpr float std::floor(float)
-|    floor(float __x)
-|    ^~~~~
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:264:3: note: candidate: constexpr long double std::floor(long double)
-|    floor(long double __x)
-|    ^~~~~
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashCeil(SplashCoord)':
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1608:21: error: call of overloaded 'ceil(SplashCoord&)' is ambiguous
-|    return (int)ceil(x);
-|                      ^
-| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:159:1: note: candidate: double ceil(double)
-|  __MATHCALLX (ceil,, (_Mdouble_ __x), (__const__));
-|  ^
-| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/math.h:36:0,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:46:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:165:3: note: candidate: constexpr float std::ceil(float)
-|    ceil(float __x)
-|    ^~~~
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:169:3: note: candidate: constexpr long double std::ceil(long double)
-|    ceil(long double __x)
-|    ^~~~
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashFloor(SplashCoord)':
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1612:22: error: call of overloaded 'floor(SplashCoord&)' is ambiguous
-|    return (int)floor(x);
-|                       ^
-| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
-|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
-| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:165:1: note: candidate: double floor(double)
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- poppler/CairoOutputDev.cc | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/poppler/CairoOutputDev.cc b/poppler/CairoOutputDev.cc
-index 18124b8f..4c85ad65 100644
---- a/poppler/CairoOutputDev.cc
-+++ b/poppler/CairoOutputDev.cc
-@@ -1602,15 +1602,27 @@ void CairoOutputDev::endActualText(GfxState *state)
- }
- 
- static inline int splashRound(SplashCoord x) {
-+#if defined(USE_FIXEDPOINT)
-+  return FixedPoint::floor(x + 0.5);
-+#else
-   return (int)floor(x + 0.5);
-+#endif
- }
- 
- static inline int splashCeil(SplashCoord x) {
-+#if defined(USE_FIXEDPOINT)
-+  return FixedPoint::ceil(x);
-+#else
-   return (int)ceil(x);
-+#endif
- }
- 
- static inline int splashFloor(SplashCoord x) {
-+#if defined(USE_FIXEDPOINT)
-+  return FixedPoint::floor(x);
-+#else
-   return (int)floor(x);
-+#endif
- }
- 
- static
--- 
-2.14.3
-
diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
index b285eecd2..903817f18 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
-           file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
            file://basename-include.patch \
            "
 SRC_URI[md5sum] = "0aac1fcb6466f8b7bdf51871264c7e83"
@@ -44,14 +43,6 @@ do_configure_append() {
     sed -i 's: ${bindir}/g-ir: ${STAGING_BINDIR}/g-ir:' ${B}/build.ninja
 }
 
-# check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-def get_poppler_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "-DUSE_FIXEDPOINT=ON"
-    return ""
-
-EXTRA_OECMAKE += "${@get_poppler_fpu_setting(bb, d)}"
-
 PACKAGES =+ "libpoppler libpoppler-glib"
 FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
-- 
2.17.1


