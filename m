Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id C05F86AD3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:45 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so3391379eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9vFUBBTH2GZQpXO30FPusPR7KA5sRORW9eSZfBMWlI0=;
	b=tHL0jQDnDEO6YJ3YhvJzurlC8RLDUXNHSnaMt+MRE9qFensuuvcGofm1c4xnkdnZ9L
	D3GLJNbdANrFekc/v6G0jEHkrCiMenbEYaWMlF28+oCvWRjNwEwLyadACnoxLEx241TO
	f6PmS5pvjmIHZmNiImvwHimJmsBsDUERoVzLgdviOUz1rJjiq3ACcecG1Fiy3sETGBaP
	j5fJJnDZu4lpzoBh0j4xgjnyRAsVG/R3QPiI9pUpvH0R4heBF/uucgtVdSU76+08nIMB
	rMgs5v+2vaux2o8waeadV4NDtM6Oin6bLJ0eIptQCIBExF0Eb+kS0nb88rohcjgUmJpR
	8KeQ==
X-Received: by 10.14.110.194 with SMTP id u42mr3575706eeg.128.1371662986524;
	Wed, 19 Jun 2013 10:29:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:11 +0200
Message-Id: <1371662967-31734-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 04/20] poppler: update to 0.22.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 17:29:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 --------------------
 .../{poppler_0.22.3.bb => poppler_0.22.4.bb}       |    7 +--
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
 rename meta-oe/recipes-support/poppler/{poppler_0.22.3.bb => poppler_0.22.4.bb} (80%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch b/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
deleted file mode 100644
index 291c7ee..0000000
--- a/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8bd7428c28750f682fe3cc1a35291e5696c17638 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 12 May 2013 18:00:06 +0200
-Subject: [PATCH] splash/Splash.cc: add cast to fix build for
- --enable-fixedpoint
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| Splash.cc:1497:30: error: conversion from 'SplashCoord {aka FixedPoint}' to 'Guchar {aka unsigned char}' is ambiguous
-| Splash.cc:1497:30: note: candidates are:
-| In file included from SplashMath.h:27:0,
-|                  from Splash.cc:44:
-| ../goo/FixedPoint.h:45:3: note: FixedPoint::operator int()
-| ../goo/FixedPoint.h:43:3: note: FixedPoint::operator double()
-| ../goo/FixedPoint.h:41:3: note: FixedPoint::operator float()
-
-Upstream-Status: Submitted [1]
-
-[1] http://lists.freedesktop.org/archives/poppler/2013-May/010247.html
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- splash/Splash.cc |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/splash/Splash.cc b/splash/Splash.cc
-index cd0ec72..6630370 100644
---- a/splash/Splash.cc
-+++ b/splash/Splash.cc
-@@ -1494,7 +1494,7 @@ inline void Splash::drawAALine(SplashPipe *pipe, int x0, int x1, int y) {
- #endif
- 
-     if (t != 0) {
--      pipe->shape = aaGamma[t];
-+      pipe->shape = (int)aaGamma[t];
-       (this->*pipe->run)(pipe);
-       updateModX(x);
-       updateModY(y);
--- 
-1.7.4.4
-
diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
similarity index 80%
rename from meta-oe/recipes-support/poppler/poppler_0.22.3.bb
rename to meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index c8ff8a4..f1f4561 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -2,14 +2,11 @@ DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code bas
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r2"
-
 SRC_URI = " \
     http://poppler.freedesktop.org/${PN}-${PV}.tar.gz \
-    file://0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch \
 "
-SRC_URI[md5sum] = "be915388eaad6865cee5a156c8119ec1"
-SRC_URI[sha256sum] = "916a931cbef951366014f13d5f4a574657ccc064ac41051df96dd58e22934431"
+SRC_URI[md5sum] = "49d55921ce795778c7231fe9f2fe923b"
+SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1dce13b"
 
 DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff lcms"
 
-- 
1.7.4.4


