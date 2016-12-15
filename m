Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E200377250
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 02:09:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so1872324pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4pZrioSJ14W9aa73Du9rTQYZNAjpp1kqAROBNOvfelY=;
	b=WkbPbmQCBbie4QoH5UeKbNjr6k68Cgl1TQnmANaQDWkV8fNMxp8ShVaIDe7YR6/eeB
	UlwdbQkCedBlHIEyBHBxIfqvmSPejrZVyv1nlf+q1XXQU5poLOqRcj69SEb2KsUXYZPo
	iDuWbdi2M8pQk6pqF4VfQdGOtnukspTtM4FbpBwnVKcZBvtLtVGmODnm58TMOJf1eTGB
	C8ld+l6F9HmxcXiN6E5DpVZqb0frDOuZVLL9PGxaLz1Sb8pnXrRksTb8IA32SRTD4WeO
	tHkKzlxL74IP4oIfLdHvs+y0x8HTTQqYfyay9g4P8E9fQSLdedpL7U4MabPhZzia9RnV
	KueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4pZrioSJ14W9aa73Du9rTQYZNAjpp1kqAROBNOvfelY=;
	b=f3Kow6lZWJ6mMeXzcWuFAzU+hyc1VQ9XlRJgrDVWJEVDIGyYPJGfTdiltOkiyH3p7N
	axsbCZxSsgVk6uEVWmzkn6/YNSN2y/F3+jloXq/vseYYiGAXYE8/2ZmDdHb9VSJz6K34
	LLqbwAWzr+ugsaqQe9ypN2AtGaBak1tuROM2QDrPekIjCGSO640uDRbFYoJnN/JCw2JC
	cFCz2zxbck++LYM2v6Q/su5pWaAkQThAzxqgc3oyVgypKHY6MZuLr52NdChWAwpNlydf
	pfUCYCtKc3ekAp4ByURUAW8pqY/bzlAa4/7KL8KI8rpRt0OFtonEd+tQf6Mnpe81uENJ
	Fyww==
X-Gm-Message-State: AKaTC02Ju1vKml5Lw9ESfaIG+3jSUOwB9OIUhneXqJ2i8FpGr7uZq5vjQqTnCWWFNoi52g==
X-Received: by 10.84.176.131 with SMTP id v3mr213977598plb.51.1481767792623;
	Wed, 14 Dec 2016 18:09:52 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c142sm90098329pfb.23.2016.12.14.18.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 18:09:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 18:09:39 -0800
Message-Id: <20161215020940.10105-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161215020940.10105-1-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 5/6] liboop: Add recipe
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
X-List-Received-Date: Thu, 15 Dec 2016 02:09:51 -0000

liboop is needed by ruli

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../liboop/liboop/explicit_linking.patch           | 20 +++++++++++
 .../liboop/liboop/new-readline-typedef.patch       | 11 ++++++
 .../liboop/liboop/read_bugfixes.patch              | 40 ++++++++++++++++++++++
 .../recipes-support/liboop/liboop/tcl_dev.patch    | 22 ++++++++++++
 meta-oe/recipes-support/liboop/liboop_1.0.bb       | 23 +++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
 create mode 100644 meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
 create mode 100644 meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
 create mode 100644 meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
 create mode 100644 meta-oe/recipes-support/liboop/liboop_1.0.bb

diff --git a/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch b/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
new file mode 100644
index 0000000..05d3bf6
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop/explicit_linking.patch
@@ -0,0 +1,20 @@
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -51,7 +51,7 @@ noinst_PROGRAMS = test-oop
+ 
+ test_oop_SOURCES = test-oop.c
+ test_oop_CFLAGS = $(GLIB2_CFLAGS) $(GLIB_INCLUDES) $(TCL_INCLUDES) $(WWW_INCLUDES)
+-test_oop_LDADD = $(lib_LTLIBRARIES)
++test_oop_LDADD = $(lib_LTLIBRARIES) $(GLIB2_LIBS) $(ADNS_LIBS) $(TCL_LIBS) $(READLINE_LIBS)
+ 
+ release: dist
+ 	gzip -dc $(PACKAGE)-$(VERSION).tar.gz | bzip2 -9 \
+--- a/liboop-glib2.pc.in
++++ b/liboop-glib2.pc.in
+@@ -7,5 +7,5 @@ Name: liboop-glib2
+ Description: Event loop management library (GLIB2 support)
+ Version: @VERSION@
+ Requires: liboop = @VERSION@ glib-2.0
+-Libs: -L${libdir} -loop-glib2
++Libs: -L${libdir} -loop-glib2 @GLIB2_LIBS@
+ Cflags: -D_REENTRANT -I${includedir}
diff --git a/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch b/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
new file mode 100644
index 0000000..0a02420
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop/new-readline-typedef.patch
@@ -0,0 +1,11 @@
+--- a/test-oop.c
++++ b/test-oop.c
+@@ -180,7 +180,7 @@ static void *stop_readline(oop_source *s
+ static void add_readline(oop_source *src) {
+ 	rl_callback_handler_install(
+ 		(char *) "> ", /* readline isn't const-correct */
+-		(VFunction *) on_readline);
++		(rl_vcpfunc_t *) on_readline);
+ 	oop_readline_register(src);
+ 	src->on_signal(src,SIGQUIT,stop_readline,NULL);
+ }
diff --git a/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch b/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
new file mode 100644
index 0000000..1880a24
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop/read_bugfixes.patch
@@ -0,0 +1,40 @@
+From: Ian Jackson <ijackson@chiark.greenend.org.uk>
+Applied-Upstream: no
+Bug-Debian: http://bugs.debian.org/579604
+Subject: oop-read.h bugfixes
+
+Some years ago I contributed a feature for reading lines and records
+to liboop: oop-read.h and read.c.  Since it took a while for that
+feature to make it into distributed versions, for a long time I've
+been using my own copy of the source file.  It seems that I fixed a
+couple of bugs in my copy which are still in the Debian package.  I
+can't find any record of me having told anyone about them and now I
+find that 1.0-6 still has the bugs.
+
+There are two fixes:
+ * Initialise "rd->discard" properly
+ * Avoid rd->neednotcheck becoming negative
+
+--- a/read.c
++++ b/read.c
+@@ -114,6 +114,7 @@ oop_read *oop_rd_new(oop_source *oop, oo
+   rd->allocbuf= 0;
+   rd->used= 0;
+   rd->alloc= buf ? bufsz : 0;
++  rd->discard= 0;
+   rd->neednotcheck= 0;
+   rd->displacedchar= -1;
+   rd->style= *OOP_RD_STYLE_IMMED;
+@@ -235,7 +236,11 @@ static void *on_process(oop_source *oop,
+   
+   if (rd->discard) {
+     rd->used -= rd->discard;
+-    rd->neednotcheck -= rd->discard;
++    if (rd->neednotcheck > rd->discard) {
++      rd->neednotcheck -= rd->discard;
++    } else {
++      rd->neednotcheck= 0;
++    }
+     memmove(buf, buf + rd->discard, rd->used);
+     rd->discard= 0;
+   }
diff --git a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
new file mode 100644
index 0000000..e738be5
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
@@ -0,0 +1,22 @@
+--- a/configure
++++ b/configure
+@@ -19935,7 +19935,7 @@
+ fi
+ 
+ if test xno != x$with_tcl; then
+-  for version in 8.4 8.3 8.2 8.1 8.0 ; do
++  for version in "" 8.4 8.3 8.2 8.1 8.0 ; do
+     CPPFLAGS="$save_cppflags -I/usr/include/tcl$version"
+     as_ac_Lib=`echo "ac_cv_lib_tcl$version''_Tcl_Main" | $as_tr_sh`
+ echo "$as_me:$LINENO: checking for Tcl_Main in -ltcl$version" >&5
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,7 +71,7 @@
+ fi
+ 
+ if test xno != x$with_tcl; then
+-  for version in 8.4 8.3 8.2 8.1 8.0 ; do
++  for version in "" 8.4 8.3 8.2 8.1 8.0 ; do
+     CPPFLAGS="$save_cppflags -I/usr/include/tcl$version"
+     AC_CHECK_LIB(tcl$version,Tcl_Main,[
+     AC_CHECK_HEADER(tcl.h,[
diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.bb b/meta-oe/recipes-support/liboop/liboop_1.0.bb
new file mode 100644
index 0000000..82818c2
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Liboop is a low-level event loop management library for POSIX-based operating systems"
+HOMEPAGE = "http://liboop.org/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
+
+SRC_URI = "http://ftp.debian.org/debian/pool/main/libo/liboop/liboop_${PV}.orig.tar.gz \
+           file://read_bugfixes.patch \
+           file://explicit_linking.patch \
+           file://tcl_dev.patch \
+           file://new-readline-typedef.patch \
+"
+
+SRC_URI[md5sum] = "36cb971047d3af02369446f5e0b315a2"
+SRC_URI[sha256sum] = "34d83c6e0f09ee15cb2bc3131e219747c3b612bb57cf7d25318ab90da9a2d97c"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0 libpcre"
+PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl"
+
+EXTRA_OECONF += "--without-adns -without-libwww"
+
+inherit autotools pkgconfig
-- 
2.10.2


