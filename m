Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkXgi-0000pb-Fz
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 10:08:12 +0100
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.213.0; Tue, 10 Jan 2012
	10:00:43 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jan 2012 10:00:38 +0100
Message-ID: <3af96574c31be2c6ebe88463315712febfd621ef.1326185831.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326185831.git.anders@chargestorm.se>
References: <cover.1326185831.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/3] cairo: conditionally enable x11 dependencies
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
X-List-Received-Date: Tue, 10 Jan 2012 09:08:12 -0000
Content-Type: text/plain

Take the same approach to conditionally enable x11 and x11-dependencies as used in oe-core.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-graphics/cairo/cairo.inc         |    7 ++++++-
 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb   |    2 ++
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb |    2 ++
 3 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairo.inc b/meta-oe/recipes-graphics/cairo/cairo.inc
index 6157004..bd38233 100644
--- a/meta-oe/recipes-graphics/cairo/cairo.inc
+++ b/meta-oe/recipes-graphics/cairo/cairo.inc
@@ -1,7 +1,12 @@
 SECTION = "libs"
-DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
+X11DEPENDS = "virtual/libx11 libsm libxrender"
+DEPENDS = "pixman libpng fontconfig glib-2.0"
 DESCRIPTION = "Cairo graphics library"
 LICENSE = "MPL LGPL"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'directfb', '', d)}"
+PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[gtk-directfb] = "--enable-directfb=yes,,directfb"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
diff --git a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
index 9de75ed..e7b65af 100644
--- a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,6 +2,8 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
+PR = "r1"
+
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=cairo \
 "
 SRC_URI[cairo.md5sum] = "f101a9e88b783337b20b2e26dfd26d5f"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index e4fec3c..496a605 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -5,6 +5,8 @@ DESCRIPTION = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
+PR = "r1"
+
 DEPENDS = "cairo libsigc++-2.0"
 
 SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
-- 
1.7.8.3



