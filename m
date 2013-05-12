Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbdTg-0008PI-64
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 23:06:50 +0200
Received: by mail-ee0-f42.google.com with SMTP id c50so176985eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=KqRDY2CpMpo0RmREKyPLDX5UI4+e9E/2ziZQ6LHzrME=;
	b=oQTvBh8P/4VGXAtJMi9FDReXKgGmC4NRfKAxGc42q3AlOzl/0cyloopiJ2bmRZym+T
	3a37cM9rSPifOgPDh4cfjoHa/MPp4WCXrOn304AyATZs6eJgy2XZi7EgQ6ofkHKejL6j
	jm8I6cX/nBM7tP7MtgobwpG+41+PN4btATOMoeemcTB+wFbSdyMkFh+FqQ+/QbYBIJbG
	4GAMdtjj4IkrYp+Lp+V3wVOutlYrLPevX7Oj6LL8fTtV0gGxePwgcyMXqd/IF6iHJf9+
	rKYaPGv91OcY4WbKwaysb1U963SqQD4/3Un1DucDmnd+ZdhDRFfOH1DSHX0IQ2jkvh5q
	1tQA==
X-Received: by 10.15.94.131 with SMTP id bb3mr19568923eeb.20.1368391715489;
	Sun, 12 May 2013 13:48:35 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06B8.dip0.t-ipconnect.de.
	[79.223.6.184]) by mx.google.com with ESMTPSA id
	w52sm18480626eev.12.2013.05.12.13.48.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 13:48:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2013 22:48:18 +0200
Message-Id: <1368391699-1402-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-network/meta-gnome 3/4] poppler: fix build for soft FPU machines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 21:07:22 -0000
X-List-Received-Date: Sun, 12 May 2013 21:07:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...sh.cc-add-cast-to-fix-build-for-enable-fi.patch |   42 ++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.22.3.bb  |    7 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch b/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
new file mode 100644
index 0000000..291c7ee
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch
@@ -0,0 +1,42 @@
+From 8bd7428c28750f682fe3cc1a35291e5696c17638 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 12 May 2013 18:00:06 +0200
+Subject: [PATCH] splash/Splash.cc: add cast to fix build for
+ --enable-fixedpoint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| Splash.cc:1497:30: error: conversion from 'SplashCoord {aka FixedPoint}' to 'Guchar {aka unsigned char}' is ambiguous
+| Splash.cc:1497:30: note: candidates are:
+| In file included from SplashMath.h:27:0,
+|                  from Splash.cc:44:
+| ../goo/FixedPoint.h:45:3: note: FixedPoint::operator int()
+| ../goo/FixedPoint.h:43:3: note: FixedPoint::operator double()
+| ../goo/FixedPoint.h:41:3: note: FixedPoint::operator float()
+
+Upstream-Status: Submitted [1]
+
+[1] http://lists.freedesktop.org/archives/poppler/2013-May/010247.html
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ splash/Splash.cc |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/splash/Splash.cc b/splash/Splash.cc
+index cd0ec72..6630370 100644
+--- a/splash/Splash.cc
++++ b/splash/Splash.cc
+@@ -1494,7 +1494,7 @@ inline void Splash::drawAALine(SplashPipe *pipe, int x0, int x1, int y) {
+ #endif
+ 
+     if (t != 0) {
+-      pipe->shape = aaGamma[t];
++      pipe->shape = (int)aaGamma[t];
+       (this->*pipe->run)(pipe);
+       updateModX(x);
+       updateModY(y);
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
index d3d5ce8..c8ff8a4 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.3.bb
@@ -2,9 +2,12 @@ DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code bas
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
+SRC_URI = " \
+    http://poppler.freedesktop.org/${PN}-${PV}.tar.gz \
+    file://0001-splash-Splash.cc-add-cast-to-fix-build-for-enable-fi.patch \
+"
 SRC_URI[md5sum] = "be915388eaad6865cee5a156c8119ec1"
 SRC_URI[sha256sum] = "916a931cbef951366014f13d5f4a574657ccc064ac41051df96dd58e22934431"
 
-- 
1.7.4.4



