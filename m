Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOKI-0006Lc-Qo
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:39 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so778718wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2A9roXD9OwGw1TdRGuSj5vznKpVUSO6f8z20ldqYuFg=;
	b=tqWEVZCD+MqpwMHzeSLkWcnhsahOJgB0MlSQ9UNlk07jYFZ08t87DDdW6/KelnmbqP
	s62ulal1XMHqCGdECnWtVATpIWc9c4yOfia857FqL0XvNKrwUhG0tb/R0qbrm8hXFj0i
	mh4ZjOHHomipoWThd61dQMhB/W+gcGHYZSSNapbTtnutslNCPIhMLl0+sL5Tfi1R//Kd
	4ZXhfNXoSuLiEOQ8WVVn6wRkXRQeDkJK0jgImCSK13zGWv0m/FNfYkxbrx/4tUvlYxg+
	Dw5ln1UYb4MxBRqHcO5R+DnuuEDK4XHmquSEM5z9uchYM2S7ypdAnfCHTLfzdvl1HtuG
	Z5fw==
Received: by 10.180.101.230 with SMTP id fj6mr14963464wib.13.1335444723267;
	Thu, 26 Apr 2012 05:52:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm10803740wix.4.2012.04.26.05.52.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:52:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:18 +0200
Message-Id: <37400df21c7b870bbf0b915451b426c5ee993578.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 13/15] librsvg, cairo, pixman, tiff, libgpg-error: remove native support, was moved to oe-core
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:40 -0000

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
index 17350b4..0000000
--- a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND += "native"
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
index 4798eec..579d508 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.25.2.bbappend
@@ -1,9 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
-DEPENDS += "perl-native"
-BBCLASSEXTEND += "native"
-
-PRINC := "${@int(PRINC) + 8}"
+PRINC := "${@int(PRINC) + 9}"
 
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



