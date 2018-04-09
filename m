Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 39D3174896
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y55so11035082wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ik9SGaUFhMomrxChMs+mI9ICjd2tz0fhcPoF/lVicc0=;
	b=oF+2GshVToJDTOeJxmsn7HJUwQ7ypx+Rh0hh7k544AfxCJX2q+aUgFkfvD/6zMSKwr
	qBQ9o1A2Qm0HllFv5z3n8ZyNXBLZvQOMjoDPaBvyEbGyoCPPZLBlFY5nM/XQoZfviHfL
	r0+az/xFY/hiwotrh5uuZ9WM7RfTgDw5/CzlWC3cQCsUupnXJH62p4TF264qTtMF3ZPS
	ZO/ZP9RAJBs3xjw4EcZUpf1OhFhb16p2Ps+wZt7uXg4Ihj7fy97tNPOFrLZ9Ep9Rrh24
	vTuPEY+c+HOsewVCSmuAHWdIKrCmV6Zb3DAG+zw2HZ1erWncAdh1eFIEmsk6EFn8ZS9V
	tRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ik9SGaUFhMomrxChMs+mI9ICjd2tz0fhcPoF/lVicc0=;
	b=iY/sVAhMFmQEJofMsRqkSBhk9zMSM716Pk0PlMWyNhq2OUeBG2UChLCVpIinURc/H8
	mij9z97yTZz/ErYkH0gDcOzg0kMz/KesUYo/P2zP0xnO/jbIsw8zagSBAR2+eEaypPjS
	vvySfiKFXCvBir3dFRl46S44AN/eymRHKkv3mFnWiEp2cxnR3syIjkElYqzuRHd6BTGG
	PYMA+RJ2t6/BMw5z2p1TgQkKWVpy/c2yYEb3T6WHOSZYaaLxjPZdlMIASpuaxs9NMsiy
	0xJ7K5vLO1HpbTygxaqWlppKhUxJU9vpgBkQ7K7CrbmZJvIvgbFitQWM5qg6oXK/UFWY
	RIyg==
X-Gm-Message-State: ALQs6tD8Oo0rZB+fTll0OeYVVtuzd9uRHj69q2qPRh5WjLzG247sySA1
	8lTFkqYF+YL3wMXRxuoUYWg6LQ==
X-Google-Smtp-Source: AIpwx48OdX9Nb3JFEyl5qlN9jCQTdTL6owxTFwPM1ocCh3J4i4ngGmCzgTz8v2h8y6znSruoDngK1w==
X-Received: by 10.223.187.199 with SMTP id z7mr2068054wrg.260.1523311397131;
	Mon, 09 Apr 2018 15:03:17 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:44 +0200
Message-Id: <20180409220249.11796-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] poppler: fix build for TARGET_FPU = "soft"
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Detected for qemuarm on autobuilder

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...Dev.cc-fix-build-error-when-using-fixedpo.patch | 100 +++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.63.0.bb  |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch b/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
new file mode 100644
index 000000000..3c231fe93
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch
@@ -0,0 +1,100 @@
+From 6287663e7db04df7e6dec58a1fc5bb5d510e8bde Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 9 Apr 2018 19:11:20 +0200
+Subject: [PATCH] CairoOutputDev.cc: fix build error when using fixedpoint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashRound(SplashCoord)':
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1604:28: error: call of overloaded 'floor(FixedPoint)' is ambiguous
+|    return (int)floor(x + 0.5);
+|                             ^
+| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:165:1: note: candidate: double floor(double)
+|  __MATHCALLX (floor,, (_Mdouble_ __x), (__const__));
+|  ^
+| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/math.h:36:0,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:46:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:260:3: note: candidate: constexpr float std::floor(float)
+|    floor(float __x)
+|    ^~~~~
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:264:3: note: candidate: constexpr long double std::floor(long double)
+|    floor(long double __x)
+|    ^~~~~
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashCeil(SplashCoord)':
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1608:21: error: call of overloaded 'ceil(SplashCoord&)' is ambiguous
+|    return (int)ceil(x);
+|                      ^
+| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:159:1: note: candidate: double ceil(double)
+|  __MATHCALLX (ceil,, (_Mdouble_ __x), (__const__));
+|  ^
+| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/math.h:36:0,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:46:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:165:3: note: candidate: constexpr float std::ceil(float)
+|    ceil(float __x)
+|    ^~~~
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cmath:169:3: note: candidate: constexpr long double std::ceil(long double)
+|    ceil(long double __x)
+|    ^~~~
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc: In function 'int splashFloor(SplashCoord)':
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:1612:22: error: call of overloaded 'floor(SplashCoord&)' is ambiguous
+|    return (int)floor(x);
+|                       ^
+| In file included from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/features.h:428:0,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/os_defines.h:39,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/arm-oe-linux-gnueabi/bits/c++config.h:533,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdint:38,
+|                  from <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/poppler-0.63.0/poppler/CairoOutputDev.cc:44:
+| <tmpdir>/oe-core-glibc/work/armv5te-oe-linux-gnueabi/poppler/0.63.0-r0/recipe-sysroot/usr/include/bits/mathcalls.h:165:1: note: candidate: double floor(double)
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ poppler/CairoOutputDev.cc | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/poppler/CairoOutputDev.cc b/poppler/CairoOutputDev.cc
+index 18124b8f..4c85ad65 100644
+--- a/poppler/CairoOutputDev.cc
++++ b/poppler/CairoOutputDev.cc
+@@ -1602,15 +1602,27 @@ void CairoOutputDev::endActualText(GfxState *state)
+ }
+ 
+ static inline int splashRound(SplashCoord x) {
++#if defined(USE_FIXEDPOINT)
++  return FixedPoint::floor(x + 0.5);
++#else
+   return (int)floor(x + 0.5);
++#endif
+ }
+ 
+ static inline int splashCeil(SplashCoord x) {
++#if defined(USE_FIXEDPOINT)
++  return FixedPoint::ceil(x);
++#else
+   return (int)ceil(x);
++#endif
+ }
+ 
+ static inline int splashFloor(SplashCoord x) {
++#if defined(USE_FIXEDPOINT)
++  return FixedPoint::floor(x);
++#else
+   return (int)floor(x);
++#endif
+ }
+ 
+ static
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
index 143df3f73..8acb35628 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.63.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-Do-not-overwrite-all-our-build-flags.patch \
+    file://0002-CairoOutputDev.cc-fix-build-error-when-using-fixedpo.patch \
 "
 SRC_URI[md5sum] = "66a54da4896b1408611699feda5c1821"
 SRC_URI[sha256sum] = "27cc8addafc791e1a26ce6acc2b490926ea73a4f89196dd8a7742cff7cf8a111"
-- 
2.14.3


