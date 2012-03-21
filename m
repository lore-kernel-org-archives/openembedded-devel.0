Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATXj-0003G6-NT
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:58:07 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1348298wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GbDrn8UFsgdyPE/mOLv1vWiDiaitI2BXTnu06jFrXZA=;
	b=EQrv9faQbMYg5deMozLvTLrRIvuoClBC0zezFswyfTAaFbrTiOF5b0cIX/sBkoSN04
	BjyYxsoM1t/qlUO+2uUz78Nl7LpR7cHgf19QX75ppurF+rDYzcSTD6IX5KjjyNKYvsyN
	2sFisqbFCx4bo7JrbeJznbj3q1MSQJBzAN94W5a/sXlySpcht7O8qCRgOYwDhLk7tdem
	O2lHpMoNNvigqmvCGL6ybbHBDDQRGtrC9JE9KqpiscoLsqA4i2kzvMRUAUJr/03Q2d70
	LtM7u+eHwrcfRSpffN5o6s3flwHAZDq9pXSMZchdm2NAkLv0PprivguqvEl7Q0riD/xk
	1xEg==
Received: by 10.180.85.35 with SMTP id e3mr41450147wiz.6.1332366555923;
	Wed, 21 Mar 2012 14:49:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gp8sm7761284wib.5.2012.03.21.14.49.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:49:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:49:00 +0100
Message-Id: <e6e16d02cd4306b435c3afa846947e8e5d33a6c3.1332366214.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
References: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332366214.git.Martin.Jansa@gmail.com>
References: <cover.1332366214.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] librsvg, cairo, pixman, tiff, libgpg-error: remove native support, was moved to oe-core
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
X-List-Received-Date: Wed, 21 Mar 2012 21:58:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/librsvg/librsvg_2.32.1.bbappend  |    2 --
 .../recipes-graphics/cairo/cairo_1.10.2.bbappend   |    2 --
 .../xorg-lib/pixman_0.25.2.bbappend                |    5 +----
 .../recipes-multimedia/libtiff/tiff_4.0.1.bbappend |    1 -
 .../libgpg-error/libgpg-error_1.10.bbappend        |    2 --
 5 files changed, 1 insertions(+), 11 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
 delete mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend

diff --git a/meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend b/meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
deleted file mode 100644
index daea68c..0000000
--- a/meta-gnome/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
deleted file mode 100644
index f02e129..0000000
--- a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
index ea28422..7ad5db4 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
@@ -1,9 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-DEPENDS += "perl-native"
-BBCLASSEXTEND = "native"
-
-PRINC = "7"
+PRINC := "${@int(PRINC) + 8}"
 
 SRC_URI += " file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
 
diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
deleted file mode 100644
index d3267ac..0000000
--- a/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
deleted file mode 100644
index d9172b4..0000000
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-
-- 
1.7.8.5



