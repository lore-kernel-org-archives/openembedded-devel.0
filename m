Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7C760797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 23:04:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so381091wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n//JQwQuYXj0UahmCQ64+mda6yKIQ0IUxVhsJJrZcws=;
	b=kI8hfxqXajb+K7iCYDWiqE8gkE14r2yGgBNCO3eHBAC8TU36bVvomnyosbrlepIqV8
	sU52pOHQ+n01+hgUMAxq2o/HJhba67JFgTV7R0vi7p8QFWf/Svaw4n0xMjEOCkx4FOXZ
	xdv9bgeUmVv2YQomTgRtX2XQRxYJsmB0TIYkUXxgXFpm0z8DODY8o5/Ey88HNfvLcq6O
	XHceJPCOqevry+rj4sWmHoZqzID4cxb1LoeQJL9TDOThzH2Xovk22qCcH3M3+7FzxySc
	82k/EQLKeXuuciZ20T8E4hNyHfnxBL9Cdr2k8tZpVGbjit28st0rEbQaCnRiR4lhbrW1
	K62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n//JQwQuYXj0UahmCQ64+mda6yKIQ0IUxVhsJJrZcws=;
	b=aMHq+/Gq+bhExkjWn4PpG5Tkl5c2wxN0jikn+r252xQuRkfUtz7fsB/oPVNcG1YhZF
	WozwezmNpG2QafWYbkkHdosYXhWrKvHk4dJaHFNvn62AyMIip6LuDSaIwICTQ+IUjjn4
	FsdcpP8JIOwxTMlcceqYZThAXMfVDlQ/JGmzHCVluzprdKzMgM2foXVVMJGhtF1JDNeI
	+rQaMnCDcGzr9Anoc2hSRP0krTZKk6mziCsa+MiXg1KdJ2H/Kn3ZsQUiuVCCdb6KALqZ
	0LEiERGJru2xKXs1TVOVqPa/A1LZjZ0oStTNpfsN6EIzz9aquBW3C0baI7+Zt/B60beX
	aVSQ==
X-Gm-Message-State: AOPr4FXKNkDXFM5L7QiJxRbyjZjtj/pOTXUubIGX3AQijqHTLUcewa1LuIi8yDAp9OrE9Q==
X-Received: by 10.28.62.15 with SMTP id l15mr20189224wma.30.1463439899967;
	Mon, 16 May 2016 16:04:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3536.dip0.t-ipconnect.de.
	[91.10.53.54]) by smtp.googlemail.com with ESMTPSA id
	he10sm36100458wjc.21.2016.05.16.16.04.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 16:04:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 01:04:40 +0200
Message-Id: <1463439882-26273-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/3] poppler: update to 0.43.0
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
X-List-Received-Date: Mon, 16 May 2016 23:05:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patch was applied upstream
* a PACKAGECONFIG for nss was added - enabled by default

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...h-C-11-compilers-that-don-t-define-isinfi.patch | 39 ----------------------
 .../{poppler_0.41.0.bb => poppler_0.43.0.bb}       |  8 ++---
 2 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.41.0.bb => poppler_0.43.0.bb} (85%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch b/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch
deleted file mode 100644
index d5c34a6..0000000
--- a/meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a8e3399487258e53df0fd4a79c570c8d71188bed Mon Sep 17 00:00:00 2001
-From: Takahiro Hashimoto <kenya888.en@gmail.com>
-Date: Wed, 27 Apr 2016 00:16:52 +0200
-Subject: [PATCH] Compile with C++11 compilers that don't define isinfinite
-
-Bug #94761
----
- poppler/SplashOutputDev.cc | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/poppler/SplashOutputDev.cc b/poppler/SplashOutputDev.cc
-index 13d090c..0e50702 100644
---- a/poppler/SplashOutputDev.cc
-+++ b/poppler/SplashOutputDev.cc
-@@ -36,6 +36,7 @@
- // Copyright (C) 2014 Richard PALO <richard@netbsd.org>
- // Copyright (C) 2015 Tamas Szekeres <szekerest@gmail.com>
- // Copyright (C) 2015 Kenji Uno <ku@digitaldolphins.jp>
-+// Copyright (C) 2016 Takahiro Hashimoto <kenya888.en@gmail.com>
- //
- // To see a description of the changes please see the Changelog file that
- // came with your tarball or type make ChangeLog if you are building from git
-@@ -94,6 +95,13 @@ extern "C" int unlink(char *filename);
- #endif
- #endif
- 
-+#if __cplusplus > 199711L
-+#include <cmath>
-+#ifndef isfinite
-+#define isfinite(x) std::isfinite(x)
-+#endif
-+#endif
-+
- static inline void convertGfxColor(SplashColorPtr dest,
-                                    SplashColorMode colorMode,
-                                    GfxColorSpace *colorSpace,
--- 
-2.8.2
-
diff --git a/meta-oe/recipes-support/poppler/poppler_0.41.0.bb b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
similarity index 85%
rename from meta-oe/recipes-support/poppler/poppler_0.41.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.43.0.bb
index f7cc076..95cd5e5 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.41.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
@@ -5,16 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
-    file://0001-Compile-with-C-11-compilers-that-don-t-define-isinfi.patch \
 "
-SRC_URI[md5sum] = "849a8bd6af5794efb961b70418414e5a"
-SRC_URI[sha256sum] = "420abaab63caed9e1ee28964a0ba216d1979506726164bc99ad5ade289192a1b"
+SRC_URI[md5sum] = "1d2b001663119855cdfbc0713dbfb9c6"
+SRC_URI[sha256sum] = "c720e26a26ee10b7ebc9e256d2ee7adcdb536cf85f9f1c4777a38f7f81fb2456"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
-PACKAGECONFIG ??= "jpeg openjpeg png tiff ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
+PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
 PACKAGECONFIG[jpeg] = "--enable-libjpeg,--disable-libjpeg,jpeg"
 PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
@@ -22,6 +21,7 @@ PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
 PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
 PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase"
 PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
+PACKAGECONFIG[nss] = "--enable-libnss,--disable-libnss,nss"
 
 # Needed for qt5
 CXXFLAGS += "--std=c++11"
-- 
2.5.5


