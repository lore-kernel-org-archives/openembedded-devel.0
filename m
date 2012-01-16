Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rmopm-0000tK-Iz
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 16:50:58 +0100
Received: by eekd17 with SMTP id d17so1570004eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pcbAJ4GrWN6AD/o00CjiQjnQYx1UAbb+g6rpNf55juk=;
	b=cNaJ/n/FRDzR134gzMoAj5fVjbp6d3i5oEzf6RaNKbsfh1FD2kBOcAthd7IX3g+hcb
	0yP3KQOvyCDfplhSwIQCMOw/EzsN7bemLjKg621ALAKf4bDAG0zOyLoLWNpYDm00qOjW
	OjiiTug68NxMwSLwrfuYXQBKSadGPOV1vvqYQ=
Received: by 10.213.105.76 with SMTP id s12mr3796100ebo.33.1326728602633;
	Mon, 16 Jan 2012 07:43:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm73602281eeb.4.2012.01.16.07.43.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jan 2012 07:43:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jan 2012 16:43:12 +0100
Message-Id: <1326728592-13903-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [meta-oe][PATCH] cairo: replace cairo_1.10.2.bb and .inc files with .bbappend, change cairomm to use .inc from oe-core
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
X-List-Received-Date: Mon, 16 Jan 2012 15:50:58 -0000

* cairo-native is needed for pango-native
  and PRINC is for slight packaging changes in oe-core version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/cairo/cairo-fpu.inc       |    6 ------
 meta-oe/recipes-graphics/cairo/cairo.inc           |   19 -------------------
 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb     |   10 ----------
 .../recipes-graphics/cairo/cairo_1.10.2.bbappend   |    2 ++
 meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb   |    2 +-
 5 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo-fpu.inc
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo.inc
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
 create mode 100644 meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend

diff --git a/meta-oe/recipes-graphics/cairo/cairo-fpu.inc b/meta-oe/recipes-graphics/cairo/cairo-fpu.inc
deleted file mode 100644
index bdaf789..0000000
--- a/meta-oe/recipes-graphics/cairo/cairo-fpu.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-
-def get_cairo_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--disable-some-floating-point"
-	return ""
-
diff --git a/meta-oe/recipes-graphics/cairo/cairo.inc b/meta-oe/recipes-graphics/cairo/cairo.inc
deleted file mode 100644
index 6157004..0000000
--- a/meta-oe/recipes-graphics/cairo/cairo.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-SECTION = "libs"
-DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
-DESCRIPTION = "Cairo graphics library"
-LICENSE = "MPL LGPL"
-
-#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
-require cairo-fpu.inc
-EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
-
-inherit autotools pkgconfig 
-
-BBCLASSEXTEND = "native"
-
-PACKAGES =+ "cairo-trace cairo-trace-dev libcairo-script-interpreter libcairo-gobject"
-FILES_libcairo-gobject = "${libdir}/libcairo-gobject.so.*"
-FILES_libcairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_cairo-trace = "${bindir}/*trace ${libdir}/cairo/libcairo-trace.so.*"
-FILES_cairo-trace-dev = "${libdir}/cairo/*"
-
diff --git a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
deleted file mode 100644
index 9de75ed..0000000
--- a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require cairo.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
-
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=cairo \
-"
-SRC_URI[cairo.md5sum] = "f101a9e88b783337b20b2e26dfd26d5f"
-SRC_URI[cairo.sha256sum] = "32018c7998358eebc2ad578ff8d8559d34fc80252095f110a572ed23d989fc41"
-
-
diff --git a/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
new file mode 100644
index 0000000..f02e129
--- /dev/null
+++ b/meta-oe/recipes-graphics/cairo/cairo_1.10.2.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
index e4fec3c..dbde458 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.10.0.bb
@@ -1,4 +1,4 @@
-require cairo.inc
+require recipes-graphics/cairo/cairo.inc
 
 DESCRIPTION = "C++ bindings for Cairo graphics library"
 
-- 
1.7.8.3



