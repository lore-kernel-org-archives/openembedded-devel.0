Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8791B6A9CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:20 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so6115099eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1w+qIR6LtJlgMHJRsZlqvU5ie+Ja6r4Tl3AHElMj25I=;
	b=ysLhWsY05/952+JEgHAi3O8XRglG3HuGhyfgOhABwEx3ECuTaNICncEo2J178j8g45
	HIpAksFLfF2o3yIKi/vVY1LhEG108BGHy3Uw2y1L9UKbttd5HXtldinZ/8sO1S86+/yO
	8iXldB+AWIPAO3fz3Uwn3pnb4MlMc/beynsoaEcz0aUsFxKf/8kqLiOJ8GB4Pqd82z+Z
	TeVYXbbjEBT139pUUQqgoVoFFAYmd6OtyYGn3ibq0Qel0a05H8SSWcQiCbgl7ISnvgwU
	Pfjmd57JCRyqc96gzzSENCfW/JPYP3YqxrlXFqmUxlxY/wut2k4G8yuq0YA7S+dIYPRL
	QfWA==
X-Received: by 10.15.51.78 with SMTP id m54mr14707582eew.1.1370929041236;
	Mon, 10 Jun 2013 22:37:21 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:25 +0200
Message-Id: <1370928876-14423-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 04/15] poppler: update to 0.22.4
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:20 -0000
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
1.7.6.5


