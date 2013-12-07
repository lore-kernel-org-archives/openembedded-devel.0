Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id B713A6162C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 09:14:46 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so2435596pbb.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2013 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WMU3thfQi7gi4sKTnpppsY/IBYRMxhSz0pBWQgaMl8M=;
	b=K6IfobDap3gRZ8KzuqRlYva3dhLx4L0ue1kYE6J3/FknzWUb4jxmbvIW4tP0LJaFHY
	9tajp6gJHkL/RZCCmOgFQ507Kf8mTGwkActC8WIrDB7EroM+uEojUR+uzYnEUgr0cpUu
	puxDb2Jt+PsWcrCfr1O/6ZcVYxn1/REzGtjpHfhPglF8zxRkF43oQeOAZELWZIicueKX
	x9IPfRKxexioob680njGtp+shxDrjtinpYWGFK0CQWSEsq+cvfcYFkYHl3N1mQXANbvJ
	9QGL36/BeXwlglzFq4N+wVvH2QLaFYZeo0wWxoFlo3wml5opoHapyrK6S00NaagPa9Py
	OXoQ==
X-Received: by 10.67.3.34 with SMTP id bt2mr8992864pad.3.1386407686089;
	Sat, 07 Dec 2013 01:14:46 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id by1sm2602825pbd.25.2013.12.07.01.14.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 01:14:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2013 01:14:58 -0800
Message-Id: <1386407698-24915-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] gimp: Upgrade 2.8.2 -> 2.8.10
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
X-List-Received-Date: Sat, 07 Dec 2013 09:14:46 -0000

Also fix build with freetype 2.5.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp/freetype.patch  |   30 ++++++++++++++++++++
 .../gimp/{gimp_2.8.2.bb => gimp_2.8.10.bb}         |    9 ++++--
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/freetype.patch
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.2.bb => gimp_2.8.10.bb} (68%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp/freetype.patch b/meta-oe/recipes-graphics/gimp/gimp/freetype.patch
new file mode 100644
index 0000000..ed6c097
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp/freetype.patch
@@ -0,0 +1,30 @@
+Include the freetype headers via macros ( recommended way)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+From 6c73f28b6d87a2afd11974552a075bffec52347f Mon Sep 17 00:00:00 2001
+From: Michael Natterer <mitch@gimp.org>
+Date: Fri, 29 Nov 2013 20:57:46 +0000
+Subject: Bug 719560 - Build failure with freetype 2.5.1
+
+Apply patch from su-v that fixes the freetype include to
+the madness devised and recommended by freetype.
+---
+diff --git a/app/text/gimpfont.c b/app/text/gimpfont.c
+index 4045ca9..66c6e52 100644
+--- a/app/text/gimpfont.c
++++ b/app/text/gimpfont.c
+@@ -28,7 +28,9 @@
+ 
+ #define PANGO_ENABLE_ENGINE  1   /* Argh */
+ #include <pango/pango-ot.h>
+-#include <freetype/tttables.h>
++
++#include <ft2build.h>
++#include FT_TRUETYPE_TABLES_H
+ 
+ #include "text-types.h"
+ 
+--
+cgit v0.9.2
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
similarity index 68%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
index e9bbdcf..c747168 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.2.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
@@ -8,9 +8,11 @@ DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff webk
 
 inherit gnome
 
-SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b542138820ca3a41cbd63fc331907955"
-SRC_URI[sha256sum] = "0cd1a7e67e132ead810e16e31ff929394c83fcf841e4a295c45d6f3829601ad9"
+SRC_URI = "ftp://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
+           file://freetype.patch \
+          "
+SRC_URI[md5sum] = "84c964aab7044489af69f7319bb59b47"
+SRC_URI[sha256sum] = "e7fd8b19f989138d826003c75f56bd5b6f136eef597e86e3978ede0bba470ae6"
 
 EXTRA_OECONF = "--disable-python \
                 --without-wmf"
@@ -21,3 +23,4 @@ do_configure_append() {
 }
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
+FILES_${PN}  += "${datadir}/appdata"
-- 
1.7.10.4


