Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 120EB733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:39 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so12921475wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bh2/RyUV9/UVheY+aWazm/txZA1SMaeQnQdG0vm9xNs=;
	b=syGyNd738m5bzmzbTnISoUA2VAOWYjsNYzxp4T3JyqtvUOCXJOvDjJVHek0O/L2oxD
	v6xFNnxbac+4q7o7E8+7KS5NrEQWKhq1e/ooeFwmj+JevTUlmG7E6RMwjESqIUSi17Kw
	z9tgw1lISQB3gV2IO9o0OhEdZlBtVr7GveejBB9z0tH4yrhkkilzwAHMvt7Vo0EHmW9d
	558hTJ0lNd9ocgOEey3K7DT2L6+OlRpmb0CVRZ3y0h0xanqLQQVPeXdvQpnbkCcD0QE0
	IFsIjjJvHL8qz4V86cqjo01otsVApOKf1c3egQotN9PzTl+/3sn2q3Oy8NqNd3CACaD6
	H8ZQ==
X-Received: by 10.180.187.200 with SMTP id fu8mr10300353wic.28.1423776160464; 
	Thu, 12 Feb 2015 13:22:40 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:59 +0100
Message-Id: <1423776119-14981-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 19/19] gimp: update to 2.8.14 / fix build by not configuring with freetype-config
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...igure-ac-do-not-check-for-freetype-config.patch | 38 ++++++++++++++++++++++
 meta-oe/recipes-graphics/gimp/gimp/freetype.patch  | 30 -----------------
 .../gimp/{gimp_2.8.10.bb => gimp_2.8.14.bb}        | 13 ++++----
 3 files changed, 45 insertions(+), 36 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/freetype.patch
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.10.bb => gimp_2.8.14.bb} (73%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch b/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
new file mode 100644
index 0000000..fecd012
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
@@ -0,0 +1,38 @@
+From 72ad76841d87e857428693d812a961935284ac62 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 12 Feb 2015 15:57:47 +0100
+Subject: [PATCH] configure-ac: do not check for freetype-config
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+freetype-config is not allowed in our environment - see also binconfig-disabled
+
+Upstream-Status: inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 26812b6..abec714 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -647,13 +647,6 @@ if test "x$fontconfig_ok" = xno; then
+ fi
+ 
+ 
+-AC_PATH_PROG(FREETYPE_CONFIG, freetype-config, no)
+-if test "x$FREETYPE_CONFIG" != "xno" ; then
+-  AC_MSG_CHECKING([for freetype libraries])
+-  FREETYPE_LIBS=`$FREETYPE_CONFIG --libs`
+-  AC_MSG_RESULT($FREETYPE_LIBS)
+-fi
+-AC_SUBST(FREETYPE_LIBS)
+ 
+ 
+ ##########################################
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-graphics/gimp/gimp/freetype.patch b/meta-oe/recipes-graphics/gimp/gimp/freetype.patch
deleted file mode 100644
index ed6c097..0000000
--- a/meta-oe/recipes-graphics/gimp/gimp/freetype.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Include the freetype headers via macros ( recommended way)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
-From 6c73f28b6d87a2afd11974552a075bffec52347f Mon Sep 17 00:00:00 2001
-From: Michael Natterer <mitch@gimp.org>
-Date: Fri, 29 Nov 2013 20:57:46 +0000
-Subject: Bug 719560 - Build failure with freetype 2.5.1
-
-Apply patch from su-v that fixes the freetype include to
-the madness devised and recommended by freetype.
----
-diff --git a/app/text/gimpfont.c b/app/text/gimpfont.c
-index 4045ca9..66c6e52 100644
---- a/app/text/gimpfont.c
-+++ b/app/text/gimpfont.c
-@@ -28,7 +28,9 @@
- 
- #define PANGO_ENABLE_ENGINE  1   /* Argh */
- #include <pango/pango-ot.h>
--#include <freetype/tttables.h>
-+
-+#include <ft2build.h>
-+#include FT_TRUETYPE_TABLES_H
- 
- #include "text-types.h"
- 
---
-cgit v0.9.2
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
similarity index 73%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index a893dc2..7d52cf1 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -7,16 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "babl gdk-pixbuf-native libart-lgpl gtk+ jpeg libpng libexif tiff lcms gegl poppler jasper bzip2"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
-inherit gnome
+inherit gnome gtk-doc
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[helpbrowser] = "--with-webkit, --without-webkit, webkit-gtk"
 
-SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
-           file://freetype.patch \
-          "
-SRC_URI[md5sum] = "84c964aab7044489af69f7319bb59b47"
-SRC_URI[sha256sum] = "e7fd8b19f989138d826003c75f56bd5b6f136eef597e86e3978ede0bba470ae6"
+SRC_URI = " \
+    http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
+    file://0001-configure-ac-do-not-check-for-freetype-config.patch \
+"
+SRC_URI[md5sum] = "233c948203383fa078434cc3f8f925cb"
+SRC_URI[sha256sum] = "d82a958641c9c752d68e35f65840925c08e314cea90222ad845892a40e05b22d"
 
 EXTRA_OECONF = "--disable-python \
                 --without-wmf"
-- 
1.9.3


