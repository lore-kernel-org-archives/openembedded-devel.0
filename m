Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 70AF978242
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 14:19:45 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id p8so62924718wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8pI+khln22tdA7yXJnPnqfw+lG/yKndDvYdkbON+qcY=;
	b=UiuIjiZP2uoHx6/1b4tknrTnC1U39OwyVG9xhxC5A9csf/pmPezP/p7cSPRINQg3c/
	tncgz6N1dmfvrZotJM3QfYbImBfW8b2vyBD8BbC1J9zcy7X/FF/XWLewoKPOUe6Wg3tz
	tSg+ywlf2VdpPJMcfzQkpMXCYYMbIQzoMj/ekChY3n9d9zzCOQrapYTlrqshvTdKNKxY
	AtJiyOb5wY4RRdPXw7xrob15MgvOiNXkfYxJOIqbg/WrFz1FBu3UaTfIf7cLCV/FaW1f
	Cj7NHfpIMgjoqhtdoQaZCDdsuAfnxNgZ92PRdBU1U7dUT2n/+uTrHhtxthRlBZ+ougxl
	tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8pI+khln22tdA7yXJnPnqfw+lG/yKndDvYdkbON+qcY=;
	b=HyvdK7dpI5gLRgnar1oKmyV8R9Yr7kQ29jTwKp1io8VBbpK2y0X0ObzENYdEchwjTX
	atDx/O6p9GrJJ1iEv79ZNETasrJU0Y27cV/cWftfUU3hOdg0bFZtnPQp03H60am9bxMD
	WRY7qT0P/BgLmBJHJSD/CYh/wkMfKHMbvQ4NZxbDLW4ePY8Z4DD+pKUMNtCwEdcR0NPD
	/RTIVKMqn+a+EVRygaPGg81iwwM9RMkBfFWKQTEBLnD9VoDQmj/atzPLN5oBdHyqQBiL
	xA64Ulfytjw0UJr+uSNiiSoyWs8K5RSFyMokABSGvIHM5ul+h+C10F4NK+OUbFVNYXzS
	2VNg==
X-Gm-Message-State: AHYfb5hyb+lY01IDzw/Mr3mUqAuExltgoXQbTADPyGCbtWAUpOwyidRb
	E4j408RwXGfqD8Yl
X-Received: by 10.223.128.204 with SMTP id 70mr606606wrl.207.1503411585584;
	Tue, 22 Aug 2017 07:19:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w61sm12911009wrb.49.2017.08.22.07.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 07:19:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Aug 2017 16:21:28 +0200
Message-Id: <20170822142128.9733-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-gpe][PATCH] meta-gpe: remove this now pretty empty layer
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
X-List-Received-Date: Tue, 22 Aug 2017 14:19:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gpe/README                                    | 17 ---------
 meta-gpe/conf/layer.conf                           | 15 --------
 ...ering-of-LDADD-options-to-fix-a-compilati.patch | 28 ---------------
 .../gpe-scap/gpe-scap/use.libsoup-2.4.patch        | 42 ----------------------
 .../libgpewidget/libgpewidget/glib-2.32.patch      | 11 ------
 .../libgpewidget/libgpewidget/pkgconfig.patch      | 11 ------
 .../minilite/minilite/makefile-fix.patch           | 11 ------
 .../fbreader/fbreader-0.12.10/Makefile.patch       | 22 ------------
 .../fbreader-0.12.10/fix-cflags-fribidi.patch      | 11 ------
 .../fbreader-0.12.10/fix-return-code-gcc6.patch    | 11 ------
 .../fbreader/fbreader-0.12.10/gcc45.patch          | 20 -----------
 ...ation-of-the-icons-when-RESOLUTION-is-set.patch | 40 ---------------------
 12 files changed, 239 deletions(-)
 delete mode 100644 meta-gpe/README
 delete mode 100644 meta-gpe/conf/layer.conf
 delete mode 100644 meta-gpe/recipes-graphics/gpe-scap/gpe-scap/0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch
 delete mode 100644 meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
 delete mode 100644 meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
 delete mode 100644 meta-gpe/recipes-graphics/libgpewidget/libgpewidget/pkgconfig.patch
 delete mode 100644 meta-gpe/recipes-graphics/minilite/minilite/makefile-fix.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch

diff --git a/meta-gpe/README b/meta-gpe/README
deleted file mode 100644
index 7d019f63a..000000000
--- a/meta-gpe/README
+++ /dev/null
@@ -1,17 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-URI: git://github.com/openembedded/meta-oe.git
-branch: master
-revision: HEAD
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gpe]' in the subject'
-
-When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gpe][PATCH'
-
-Interim layer maintainers: Koen Kooi <koen@dominion.thruhere.net>
-                           Martin Jansa <martin.jansa@gmail.com>
diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
deleted file mode 100644
index 00f3929f8..000000000
--- a/meta-gpe/conf/layer.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "gpe-layer"
-BBFILE_PATTERN_gpe-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_gpe-layer = "7"
-
-# This should only be incremented on significant changes that will
-# cause compatibility issues with other layers
-LAYERVERSION_gpe-layer = "1"
-
-LAYERDEPENDS_gpe-layer = "core openembedded-layer"
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch
deleted file mode 100644
index c976ff470..000000000
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c551dece6768f67b74b508e9c0133320205ef2df Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 23 May 2011 15:03:29 +0200
-Subject: [PATCH] Fix the ordering of LDADD options to fix a compilation failure.
-
-"invalid DSO for symbol `XUngrabServer' definition "
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- src/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 2fddc98..45bd850 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -6,7 +6,7 @@ INCLUDES = -DPKGDATADIR=\"$(pkgdatadir)\" \
- 	   $(GLADE_CFLAGS) \
-        -D_GNU_SOURCE
- 
--LIBS = $(GTK_LIBS) $(GLADE_LIBS) $(XSHAPE_LIBS)
-+LIBS = -lX11 $(XSHAPE_LIBS) $(GLADE_LIBS) $(GTK_LIBS) 
- 
- bin_PROGRAMS = gpe-scap
- gpe_scap_SOURCES = scr-i18n.h \
--- 
-1.6.6.1
-
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
deleted file mode 100644
index 3cfe5d724..000000000
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-diff -uNr gpe-scap-1.4.orig/configure.ac gpe-scap-1.4/configure.ac
---- gpe-scap-1.4.orig/configure.ac	2009-03-05 18:53:53.000000000 +0100
-+++ gpe-scap-1.4/configure.ac	2012-05-06 10:18:29.348308322 +0200
-@@ -24,7 +24,7 @@
- AC_SUBST(LDFLAGS)
- 
- dnl libraries
--GTK_MODULES="gtk+-2.0 >= 2.6.0 gthread-2.0 libsoup-2.2"
-+GTK_MODULES="gtk+-2.0 >= 2.6.0 gthread-2.0 libsoup-2.4"
- PKG_CHECK_MODULES(GTK, $GTK_MODULES)
- AC_SUBST(GTK_CFLAGS)
- AC_SUBST(GTK_LIBS)
-diff -uNr gpe-scap-1.4.orig/src/scr-shot-common.c gpe-scap-1.4/src/scr-shot-common.c
---- gpe-scap-1.4.orig/src/scr-shot-common.c	2009-03-05 12:13:20.000000000 +0100
-+++ gpe-scap-1.4/src/scr-shot-common.c	2012-05-06 10:30:52.299371576 +0200
-@@ -182,12 +182,12 @@
-   /* create session and message */
-   session = soup_session_sync_new ();
-   message = soup_message_new ("POST", url);
--  soup_message_add_header (message->request_headers, "User-Agent", "gpe-scap/" VERSION);
--  soup_message_add_header (message->request_headers, "Accept",
-+  soup_message_headers_append (message->request_headers, "User-Agent", "gpe-scap/" VERSION);
-+  soup_message_headers_append (message->request_headers, "Accept",
- 			   "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
--/*  soup_message_add_header (message->request_headers, "Accept-Charset", "Accept-Charset=ISO-8859-1,utf-8;q=0.7,*;q=0.7");
--  soup_message_add_header (message->request_headers, "Keep-Alive", "100");
--  soup_message_add_header (message->request_headers, "Connection", "keep-alive");
-+/*  soup_message_headers_append (message->request_headers, "Accept-Charset", "Accept-Charset=ISO-8859-1,utf-8;q=0.7,*;q=0.7");
-+  soup_message_headers_append (message->request_headers, "Keep-Alive", "100");
-+  soup_message_headers_append (message->request_headers, "Connection", "keep-alive");
-   soup_message_wire	add_header (message->request_headers, "Accept-Encoding", "gzip,deflate");
- */
-   /* build message body */
-@@ -207,7 +207,7 @@
-   memcpy (body + strlen (cmd) + len, tail, strlen (tail));
- 
-   soup_message_set_request (message, "multipart/form-data; boundary="SEP,
--                            SOUP_BUFFER_SYSTEM_OWNED, body, content_len);
-+                            SOUP_MEMORY_TAKE, body, content_len);
- 
-   soup_session_send_message (session, message);
- 
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
deleted file mode 100644
index f590caa46..000000000
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/glib-2.32.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -uNr libgpewidget-0.117.orig/gpehelp.c libgpewidget-0.117/gpehelp.c
---- libgpewidget-0.117.orig/gpehelp.c	2006-10-12 12:20:33.000000000 +0200
-+++ libgpewidget-0.117/gpehelp.c	2012-04-30 07:45:57.813293792 +0200
-@@ -33,7 +33,6 @@
- #include <gdk-pixbuf/gdk-pixbuf.h>
- #include <gdk/gdk.h>
- #include <glib.h>
--#include <glib/gkeyfile.h>
- 
- 
- /* helper function definitions*/
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/pkgconfig.patch b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/pkgconfig.patch
deleted file mode 100644
index 317e01a9b..000000000
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget/pkgconfig.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- configure.ac.orig	2006-02-04 17:37:55.000000000 +0100
-+++ configure.ac	2006-02-06 00:56:28.000000000 +0100
-@@ -36,7 +36,7 @@
- 	ENABLE_CAIRO=$enableval
- ],
- [
--       	PKG_CHECK_EXISTS(cairo, [ENABLE_CAIRO=yes], [ENABLE_CAIRO=no])
-+       	PKG_CHECK_MODULES(cairo, [ENABLE_CAIRO=yes], [ENABLE_CAIRO=no])
- ])
- 
- ENABLE_HILDON=false
diff --git a/meta-gpe/recipes-graphics/minilite/minilite/makefile-fix.patch b/meta-gpe/recipes-graphics/minilite/minilite/makefile-fix.patch
deleted file mode 100644
index 1be6ceaa8..000000000
--- a/meta-gpe/recipes-graphics/minilite/minilite/makefile-fix.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/Makefile.old	2006-01-16 22:51:34.000000000 +0100
-+++ minilite-050/Makefile	2009-05-01 16:36:32.000000000 +0200
-@@ -45,7 +45,7 @@
- 
- install-program: all
- 	mkdir -p $(DESTDIR)$(PREFIX)/bin
--	$(INSTALL) -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	$(INSTALL) $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
- 	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
- 	$(INSTALL) -m 644 $(PACKAGE).desktop $(DESTDIR)$(PREFIX)/share/applications/$(PACKAGE).desktop
- 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps/
diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
deleted file mode 100644
index 0e498c712..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff -uri fbreader-0.12.1.orig/fbreader/Makefile fbreader-0.12.1/fbreader/Makefile
---- fbreader-0.12.1.orig/fbreader/Makefile	2009-12-13 09:03:11.000000000 +0100
-+++ fbreader-0.12.1/fbreader/Makefile	2009-12-14 17:18:47.548638783 +0100
-@@ -37,7 +37,6 @@
- 	@install $(TARGET) $(DESTDIR)$(BINDIR)/FBReader
- 	@install -d $(FBSHAREDIR)
- 	@install -d $(FBSHAREDIR)/help
--	@./scripts/install_help.sh $(VARIANT) $(FBSHAREDIR)/help
- 	@install -d $(FBSHAREDIR)/network
- 	@install -m 0644 $(wildcard data/network/*.xml) $(FBSHAREDIR)/network
- 	@install -d $(FBSHAREDIR)/network/certificates
-@@ -58,8 +57,8 @@
- 	@install -d $(FBSHAREDIR)/resources
- 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resources
- 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@make -C $(TARGET_ARCH) RESOLUTION=$(RESOLUTION) install
- 
diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
deleted file mode 100644
index e72fa8cf2..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- fbreader-0.12.10/makefiles/config.mk.orig	2016-05-03 11:11:07.259734561 -0400
-+++ fbreader-0.12.10/makefiles/config.mk	2016-05-03 11:11:37.447735786 -0400
-@@ -38,7 +38,7 @@
- 	LDFLAGS += -pg
- endif
- 
--ZINCLUDE = -I $(ROOTDIR)/zlibrary/core/include -I $(ROOTDIR)/zlibrary/text/include
-+ZINCLUDE = $(shell pkg-config --cflags fribidi) -I $(ROOTDIR)/zlibrary/core/include -I $(ROOTDIR)/zlibrary/text/include
- 
- ZLSHARED ?= yes
- 
diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
deleted file mode 100644
index 97ab4d315..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- fbreader-0.12.10/fbreader/src/database/booksdb/BooksDB.cpp.orig	2016-06-08 14:54:04.206196501 -0400
-+++ fbreader-0.12.10/fbreader/src/database/booksdb/BooksDB.cpp	2016-06-08 14:54:17.686196322 -0400
-@@ -145,7 +145,7 @@
- 
- 	myFindFileId->setFileName(fileName);
- 	if (!myFindFileId->run()) {
--		return false;
-+		return 0;
- 	}
- 	((DBIntValue&)*myLoadBook->parameter("@file_id").value()) = myFindFileId->fileId();
- 	shared_ptr<DBDataReader> reader = myLoadBook->executeReader();
diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
deleted file mode 100644
index 00cba1023..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-  Fix compilation with gcc 4.5
-
-  [FBreader Ticket #340] -- http://old.fbreader.org/mantis/view.php?id=340
-
-  Without that patch we have:
-    Compiling Library.o ...Library.cpp:42:1: error: 'Library::Library' names the constructor, not the type
-
-  Upstream-Status: Accepted [Fixed in Version 0.14.0]
-
---- fbreader-0.12.10-orig/fbreader/src/library/Library.cpp	2010-04-01 15:14:24.000000000 +0200
-+++ fbreader-0.12.10/fbreader/src/library/Library.cpp	2010-04-13 13:34:06.000000000 +0200
-@@ -39,7 +39,7 @@
- shared_ptr<Library> Library::ourInstance;
- const size_t Library::MaxRecentListSize = 10;
- 
--Library::Library &Library::Instance() {
-+Library &Library::Instance() {
- 	if (ourInstance.isNull()) {
- 		ourInstance = new Library();
- 	}
diff --git a/meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch b/meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
deleted file mode 100644
index f6e12023b..000000000
--- a/meta-gpe/recipes-support/fbreader/files/0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From da4170b61bb41eff0af170d1d77bfd90f9ebe5dd Mon Sep 17 00:00:00 2001
-From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
-Date: Fri, 20 Jan 2012 11:34:42 +0100
-Subject: [PATCH] Fix installation of the icons when RESOLUTION is set
-
-When resolution is set, the following code(in fbreader/Makefile) is executed:
-  VARIANT = $(TARGET_ARCH)
-  ifneq "$(RESOLUTION)" ""
-    VARIANT = $(TARGET_ARCH)_$(RESOLUTION)
-  endif
-
-This fix is based on a patch from the openembedded project,
-  which can be found here:
-    http://cgit.openembedded.org/openembedded/tree/recipes/fbreader/fbreader-0.12.1/Makefile.patch
-
-Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
----
- Submitted trough github to git://github.com/geometer/FBReader.git as a pull request
-
- fbreader/Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/fbreader/Makefile b/fbreader/Makefile
-index bfa9242..03e6cc3 100644
---- a/fbreader/Makefile
-+++ b/fbreader/Makefile
-@@ -60,8 +60,8 @@ do_install:
- 	@install -d $(FBSHAREDIR)/resources
- 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resources
- 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@make -C $(TARGET_ARCH) RESOLUTION=$(RESOLUTION) install
- 
--- 
-1.7.4.1
-
-- 
2.14.1


