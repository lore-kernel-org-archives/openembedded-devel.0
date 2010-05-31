Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1OJ7IA-00019p-T4
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 17:52:44 +0200
Received: by vws4 with SMTP id 4so705428vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 08:48:29 -0700 (PDT)
Received: by 10.220.63.4 with SMTP id z4mr3514432vch.99.1275320909113;
	Mon, 31 May 2010 08:48:29 -0700 (PDT)
Received: from localhost.localdomain (mail.nanometrics.ca [206.191.47.130])
	by mx.google.com with ESMTPS id x6sm25574441vco.23.2010.05.31.08.48.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 May 2010 08:48:27 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 May 2010 11:48:24 -0400
Message-Id: <1275320904-28185-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] latencytop: add version 0.5
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
X-List-Received-Date: Mon, 31 May 2010 15:52:44 -0000

Add a new recipe to for latencytop.
* patch the makefile to disable GTK support, use the LDFLAGS and use ncurses
  instead of the 'w' variant.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 recipes/latencytop/latencytop/cc-var.patch   |   15 ++++++++++++++
 recipes/latencytop/latencytop/ldflags.patch  |   11 ++++++++++
 recipes/latencytop/latencytop/ncursesw.patch |   27 ++++++++++++++++++++++++++
 recipes/latencytop/latencytop/no-gtk.patch   |    9 ++++++++
 recipes/latencytop/latencytop_0.5.bb         |   13 ++++++++++++
 5 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 recipes/latencytop/latencytop/cc-var.patch
 create mode 100644 recipes/latencytop/latencytop/ldflags.patch
 create mode 100644 recipes/latencytop/latencytop/ncursesw.patch
 create mode 100644 recipes/latencytop/latencytop/no-gtk.patch
 create mode 100644 recipes/latencytop/latencytop_0.5.bb

diff --git a/recipes/latencytop/latencytop/cc-var.patch b/recipes/latencytop/latencytop/cc-var.patch
new file mode 100644
index 0000000..70b9ebb
--- /dev/null
+++ b/recipes/latencytop/latencytop/cc-var.patch
@@ -0,0 +1,15 @@
+--- latencytop-0.5/Makefile.orig	2010-05-27 16:45:23.051146454 -0400
++++ latencytop-0.5/Makefile	2010-05-27 16:49:14.660573483 -0400
+@@ -23,10 +23,10 @@ endif
+ 
+ # We write explicity this "implicit rule"
+ %.o : %.c
+-	gcc -c $(CFLAGS) $(XCFLAGS) $< -o $@
++	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
+ 
+ latencytop:  $(OBJS) latencytop.h Makefile
+-	gcc $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
++	$(CC) $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
+ 
+ clean:
+ 	rm -f *~ latencytop DEADJOE *.o
diff --git a/recipes/latencytop/latencytop/ldflags.patch b/recipes/latencytop/latencytop/ldflags.patch
new file mode 100644
index 0000000..526c9c7
--- /dev/null
+++ b/recipes/latencytop/latencytop/ldflags.patch
@@ -0,0 +1,11 @@
+--- latencytop-0.5/Makefile.orig	2010-05-31 11:05:50.750592910 -0400
++++ latencytop-0.5/Makefile	2010-05-31 11:06:03.030795137 -0400
+@@ -26,7 +26,7 @@ endif
+ 	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
+ 
+ latencytop:  $(OBJS) latencytop.h Makefile
+-	$(CC) $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
++	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LDF) -o latencytop 
+ 
+ clean:
+ 	rm -f *~ latencytop DEADJOE *.o
diff --git a/recipes/latencytop/latencytop/ncursesw.patch b/recipes/latencytop/latencytop/ncursesw.patch
new file mode 100644
index 0000000..2aa3944
--- /dev/null
+++ b/recipes/latencytop/latencytop/ncursesw.patch
@@ -0,0 +1,27 @@
+--- latencytop-0.5/Makefile.orig	2010-05-31 11:11:51.632940308 -0400
++++ latencytop-0.5/Makefile	2010-05-31 11:12:48.201571738 -0400
+@@ -1,7 +1,7 @@
+ DESTDIR =
+ SBINDIR = /usr/sbin
+ XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
+-LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw 
++LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses
+ 
+ OBJS= latencytop.o text_display.o translate.o fsync.o
+ 
+@@ -12,14 +12,7 @@ ifdef HAS_GTK_GUI
+ endif
+ 
+ 
+-#
+-# The w in -lncursesw is not a typo; it is the wide-character version
+-# of the ncurses library, needed for multi-byte character languages
+-# such as Japanese and Chinese etc.
+-#
+-# On Debian/Ubuntu distros, this can be found in the
+-# libncursesw5-dev package. 
+-#
++# we use ncurses instead of ncursesw in embedded environments -- similar to powertop
+ 
+ # We write explicity this "implicit rule"
+ %.o : %.c
diff --git a/recipes/latencytop/latencytop/no-gtk.patch b/recipes/latencytop/latencytop/no-gtk.patch
new file mode 100644
index 0000000..b3500b4
--- /dev/null
+++ b/recipes/latencytop/latencytop/no-gtk.patch
@@ -0,0 +1,9 @@
+--- latencytop-0.5/Makefile.orig	2010-05-27 16:36:41.510515029 -0400
++++ latencytop-0.5/Makefile	2010-05-27 16:37:03.442467568 -0400
+@@ -1,6 +1,3 @@
+-# FIXME: Use autoconf ?
+-HAS_GTK_GUI = 1
+-
+ DESTDIR =
+ SBINDIR = /usr/sbin
+ XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
diff --git a/recipes/latencytop/latencytop_0.5.bb b/recipes/latencytop/latencytop_0.5.bb
new file mode 100644
index 0000000..032c3f3
--- /dev/null
+++ b/recipes/latencytop/latencytop_0.5.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "measuring and fixing Linux latency"
+HOMEPAGE = "http://www.latencytop.org/index.php"
+LICENSE = "GPL"
+
+DEPENDS = "glib-2.0 ncurses"
+
+SRC_URI = "\
+  http://www.latencytop.org/download/latencytop-${PV}.tar.gz\
+  file://no-gtk.patch;patch=1\
+  file://cc-var.patch;patch=1\
+  file://ldflags.patch;patch=1\
+  file://ncursesw.patch;patch=1\
+"
-- 
1.7.0.4



