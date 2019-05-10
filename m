Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CCE197E099
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYh6q8rzFr
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489321;
	bh=E7uKvFP8SbWONL5ToZu94khRQD2YUWQ/ocxEG6YjUmY=;
	h=From:To:Subject:Date:From;
	b=n34k1StbFm49C1iRMrFvvDcb6ag95JU4Q4RmaN5RNbQ9lfI+gKf03eWw94rIlycx6
	fhD/srgkPipDbUHuJujN6BXquMr9vnTE52m5AZEO57h1FbNQAXQiw2Vp8p6l7ERWFP
	VXjSZlGqW0gB3iywbseU33VDt0ohlIX2bcHf5p7TbJmNmWBri/1eewf5/FNpWWRyKX
	xFzug2At/04Nua+ElXi0BGXQ9WkEuCis8myWGe4w2ni6Om1c8w4PNLZ7OhpV8dDkgk
	LyxYZ4J7VS0gkvp5MKbV8uV+7QIm7SdAUBuuEK3RXGTRckYZMHp0/C1QD8Bzc+TzeB
	wAsYLKLK5bFMGuJ6BKwEm5KeOe8m9GI58fmd5yt112Fesfx3rPpgRFBoPedGpRJkyk
	lMv9TOlFZZNKHke8ylsYNIvfvwibR8936a6Io+nJxsZCEIvcOvowYvQRGoqo2RPJU6
	0xrJksT9RIAPhT4JNV/AiWi78Jc5ZL5FnIHPyk8R5mK6gIWv7GZR+IxmEPJ1S2PAM0
	hJwpDLEzTPz2I2ZTRk0bmbxOMfHoYU+6UYZ6By3Ar0eqLi2sUWOkhgb3VcTdiq4x2w
	wAPQVieGH/vC2FrCg0WFWwVga1xG4DmNJ2TtRyu4kTVdDCCFFx+PaNlB8BAYluqJyF
	kWWVv69EsLY7KLBslFC+ebqM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:11 +0300
Message-Id: <20190510115515.19491-15-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] liboop: Upgrade 1.0 -> 1.0.1
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
X-List-Received-Date: Fri, 10 May 2019 11:55:20 -0000

Remove patches applied upstream.
Update to the current homepage.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../liboop/liboop/explicit_linking.patch      | 20 ----------
 .../liboop/liboop/new-readline-typedef.patch  | 11 -----
 .../liboop/liboop/read_bugfixes.patch         | 40 -------------------
 .../liboop/liboop/tcl_dev.patch               | 11 -----
 .../liboop/{liboop_1.0.bb => liboop_1.0.1.bb} |  9 ++---
 5 files changed, 3 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
 delete mode 100644 meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
 delete mode 100644 meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
 rename meta-oe/recipes-support/liboop/{liboop_1.0.bb => liboop_1.0.1.bb} (66%)

diff --git a/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch b/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
deleted file mode 100644
index 05d3bf6f4..000000000
--- a/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -51,7 +51,7 @@ noinst_PROGRAMS = test-oop
- 
- test_oop_SOURCES = test-oop.c
- test_oop_CFLAGS = $(GLIB2_CFLAGS) $(GLIB_INCLUDES) $(TCL_INCLUDES) $(WWW_INCLUDES)
--test_oop_LDADD = $(lib_LTLIBRARIES)
-+test_oop_LDADD = $(lib_LTLIBRARIES) $(GLIB2_LIBS) $(ADNS_LIBS) $(TCL_LIBS) $(READLINE_LIBS)
- 
- release: dist
- 	gzip -dc $(PACKAGE)-$(VERSION).tar.gz | bzip2 -9 \
---- a/liboop-glib2.pc.in
-+++ b/liboop-glib2.pc.in
-@@ -7,5 +7,5 @@ Name: liboop-glib2
- Description: Event loop management library (GLIB2 support)
- Version: @VERSION@
- Requires: liboop = @VERSION@ glib-2.0
--Libs: -L${libdir} -loop-glib2
-+Libs: -L${libdir} -loop-glib2 @GLIB2_LIBS@
- Cflags: -D_REENTRANT -I${includedir}
diff --git a/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch b/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
deleted file mode 100644
index 0a0242032..000000000
--- a/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/test-oop.c
-+++ b/test-oop.c
-@@ -180,7 +180,7 @@ static void *stop_readline(oop_source *s
- static void add_readline(oop_source *src) {
- 	rl_callback_handler_install(
- 		(char *) "> ", /* readline isn't const-correct */
--		(VFunction *) on_readline);
-+		(rl_vcpfunc_t *) on_readline);
- 	oop_readline_register(src);
- 	src->on_signal(src,SIGQUIT,stop_readline,NULL);
- }
diff --git a/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch b/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
deleted file mode 100644
index 1880a241a..000000000
--- a/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: Ian Jackson <ijackson@chiark.greenend.org.uk>
-Applied-Upstream: no
-Bug-Debian: http://bugs.debian.org/579604
-Subject: oop-read.h bugfixes
-
-Some years ago I contributed a feature for reading lines and records
-to liboop: oop-read.h and read.c.  Since it took a while for that
-feature to make it into distributed versions, for a long time I've
-been using my own copy of the source file.  It seems that I fixed a
-couple of bugs in my copy which are still in the Debian package.  I
-can't find any record of me having told anyone about them and now I
-find that 1.0-6 still has the bugs.
-
-There are two fixes:
- * Initialise "rd->discard" properly
- * Avoid rd->neednotcheck becoming negative
-
---- a/read.c
-+++ b/read.c
-@@ -114,6 +114,7 @@ oop_read *oop_rd_new(oop_source *oop, oo
-   rd->allocbuf= 0;
-   rd->used= 0;
-   rd->alloc= buf ? bufsz : 0;
-+  rd->discard= 0;
-   rd->neednotcheck= 0;
-   rd->displacedchar= -1;
-   rd->style= *OOP_RD_STYLE_IMMED;
-@@ -235,7 +236,11 @@ static void *on_process(oop_source *oop,
-   
-   if (rd->discard) {
-     rd->used -= rd->discard;
--    rd->neednotcheck -= rd->discard;
-+    if (rd->neednotcheck > rd->discard) {
-+      rd->neednotcheck -= rd->discard;
-+    } else {
-+      rd->neednotcheck= 0;
-+    }
-     memmove(buf, buf + rd->discard, rd->used);
-     rd->discard= 0;
-   }
diff --git a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
index e738be54c..e00cf8014 100644
--- a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
+++ b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
@@ -1,14 +1,3 @@
---- a/configure
-+++ b/configure
-@@ -19935,7 +19935,7 @@
- fi
- 
- if test xno != x$with_tcl; then
--  for version in 8.4 8.3 8.2 8.1 8.0 ; do
-+  for version in "" 8.4 8.3 8.2 8.1 8.0 ; do
-     CPPFLAGS="$save_cppflags -I/usr/include/tcl$version"
-     as_ac_Lib=`echo "ac_cv_lib_tcl$version''_Tcl_Main" | $as_tr_sh`
- echo "$as_me:$LINENO: checking for Tcl_Main in -ltcl$version" >&5
 --- a/configure.ac
 +++ b/configure.ac
 @@ -71,7 +71,7 @@
diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
similarity index 66%
rename from meta-oe/recipes-support/liboop/liboop_1.0.bb
rename to meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 82818c242..8ba3f72b7 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -1,17 +1,14 @@
 DESCRIPTION = "Liboop is a low-level event loop management library for POSIX-based operating systems"
-HOMEPAGE = "http://liboop.org/"
+HOMEPAGE = "http://www.lysator.liu.se/liboop/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
 SRC_URI = "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_${PV}.orig.tar.gz \
-           file://read_bugfixes.patch \
-           file://explicit_linking.patch \
            file://tcl_dev.patch \
-           file://new-readline-typedef.patch \
 "
 
-SRC_URI[md5sum] = "36cb971047d3af02369446f5e0b315a2"
-SRC_URI[sha256sum] = "34d83c6e0f09ee15cb2bc3131e219747c3b612bb57cf7d25318ab90da9a2d97c"
+SRC_URI[md5sum] = "f2b3dff17355fd9a6e2229caca8993f0"
+SRC_URI[sha256sum] = "56af16ad65e7397dadc8268e37ff6f67431db390c60c75e21a33e12b0e0d17e0"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
2.17.1


