Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03324706B9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fl030280; Fri, 18 Jul 2014 09:43:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hx7xl0obgFwf; Fri, 18 Jul 2014 09:43:08 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxU7030258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kk-0006jk-CI; Fri, 18 Jul 2014 09:42:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:39 +0100
Message-Id: <1405672966-25729-20-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 20/27] subsurface: Fix libxml and libm build failures
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:21 -0000

Use pkg-config to find libxml2 and also link against libm to avoid
build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subsurface/subsurface/libm.patch               | 17 +++++++++++++++++
 .../subsurface/subsurface/pkgconfig.patch          | 22 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/subsurface/subsurface/libm.patch
 create mode 100644 meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch

diff --git a/meta-oe/recipes-extended/subsurface/subsurface/libm.patch b/meta-oe/recipes-extended/subsurface/subsurface/libm.patch
new file mode 100644
index 0000000..7995608
--- /dev/null
+++ b/meta-oe/recipes-extended/subsurface/subsurface/libm.patch
@@ -0,0 +1,17 @@
+| /media/build1/poky/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.9.0/ld: divelist.o: undefined reference to symbol 'pow@@GLIBC_2.0'
+| /media/build1/poky/build1/tmp/sysroots/qemux86/lib/libm.so.6: error adding symbols: DSO missing from command line
+| collect2: error: ld returned 1 exit status
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2014-07-17 20:59:03.152489041 +0000
++++ git/Makefile	2014-07-17 20:59:19.020489473 +0000
+@@ -50,7 +50,7 @@
+ LIBDIVECOMPUTERCFLAGS = -I$(LIBDIVECOMPUTERINCLUDES)
+ LIBDIVECOMPUTER = $(LIBDIVECOMPUTERARCHIVE) $(LIBUSB)
+ 
+-LIBS = $(LIBXML2) $(LIBGTK) $(LIBDIVECOMPUTER) -lpthread
++LIBS = $(LIBXML2) $(LIBGTK) $(LIBDIVECOMPUTER) -lpthread -lm
+ 
+ OBJS =	main.o dive.o profile.o info.o equipment.o divelist.o \
+ 	parse-xml.o save-xml.o libdivecomputer.o print.o uemis.o \
diff --git a/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch b/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch
new file mode 100644
index 0000000..1f294fc
--- /dev/null
+++ b/meta-oe/recipes-extended/subsurface/subsurface/pkgconfig.patch
@@ -0,0 +1,22 @@
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2014-07-17 20:53:23.620479788 +0000
++++ git/Makefile	2014-07-17 20:56:07.992484267 +0000
+@@ -45,7 +45,7 @@
+ # about it if it doesn't.
+ LIBUSB = $(shell pkg-config --libs libusb-1.0 2> /dev/null)
+ 
+-LIBXML2 = $(shell xml2-config --libs)
++LIBXML2 = $(shell pkg-config --libs libxml-2.0)
+ LIBGTK = $(shell pkg-config --libs gtk+-2.0 glib-2.0 gconf-2.0)
+ LIBDIVECOMPUTERCFLAGS = -I$(LIBDIVECOMPUTERINCLUDES)
+ LIBDIVECOMPUTER = $(LIBDIVECOMPUTERARCHIVE) $(LIBUSB)
+@@ -71,7 +71,7 @@
+ 	$(INSTALL) $(MANFILES) $(MANDIR)
+ 
+ parse-xml.o: parse-xml.c dive.h
+-	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c `xml2-config --cflags`  parse-xml.c
++	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c `pkg-config --cflags libxml-2.0`  parse-xml.c
+ 
+ save-xml.o: save-xml.c dive.h
+ 	$(CC) $(CFLAGS) `pkg-config --cflags glib-2.0` -c save-xml.c
-- 
2.0.2


