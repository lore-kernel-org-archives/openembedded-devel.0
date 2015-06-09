Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id C86E8758BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2015 21:39:07 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so21644027igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2015 14:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OFvQMN1cDOjXGFHY+1lZmyo6oNzFu5hsNI0CvFFd0SQ=;
	b=KmP4W7+uPyT+YQxwUAgytI99eZFNSxXwIfqpPzMjVo6UxlZL8BkGSUGb0hNMyfjDHC
	8kP8ioW9WqjbO9rPbarX55tQDg56QmLsAkk0WmuWxEzYM92hWPPq2dpj+IfLwqVTZMW3
	WXzOgRTKLaAUy+IExRe4FG2NqP0+mOG0xcDTTbCbUYWsC58RD1yc2ULYx1p1R0/PzfCo
	85aQW3J3VMUkvPzpGAtPe27/UOYoIVyM+mjeQAeVznBpMkGS3ok5LxC5W+XK9zTAV0xE
	MBQrZR6NOoy6coAMVnQlCnFlhjWrvne1G7EnaDZJFk3meBTDc0lo8cny9DjMhdMeAq1d
	hNEA==
X-Received: by 10.50.64.243 with SMTP id r19mr1295525igs.5.1433885948485;
	Tue, 09 Jun 2015 14:39:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qt1sm1989425igb.5.2015.06.09.14.39.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 14:39:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jun 2015 14:39:01 -0700
Message-Id: <1433885941-13650-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-multimedia][PATCH] libupnp: add initial recipe, libupnp v1.6.19
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
X-List-Received-Date: Tue, 09 Jun 2015 21:39:07 -0000

  http://pupnp.sourceforge.net/

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-redefining-strnlen-and-strndup.patch     | 47 +++++++++++++++++
 .../libupnp/libupnp/sepbuildfix.patch              | 60 ++++++++++++++++++++++
 .../recipes-connectivity/libupnp/libupnp_1.6.19.bb | 19 +++++++
 3 files changed, 126 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
new file mode 100644
index 0000000..3c3f230
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/avoid-redefining-strnlen-and-strndup.patch
@@ -0,0 +1,47 @@
+From 22fba4f2765f92cd592a58e1fe5c450b187e30e1 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 3 Jun 2015 21:39:03 -0700
+Subject: [PATCH] avoid redefining strnlen() and strndup()
+
+Rely on string.h definitions instead. Workaround for compiler errors such as:
+
+  | i686-rdk-linux-libtool: compile:  i686-rdk-linux-gcc -m32 -march=atom -mtune=atom -fschedule-insns -fsched-pressure -msse3 -mfpmath=sse --sysroot=/home/andre/build/tmp/sysroots/7401 -DHAVE_CONFIG_H -I. -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp -I.. -I../upnp/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/threadutil/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/ixml/inc -I/home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/inc -pthread -O2 -pipe -g -feliminate-unused-debug-types -Os -Wall -c /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/gena/gena_callback2.c -o src/gena/libupnp_la-gena_callback2.o >/dev/null 2>&1
+  | In file included from /home/andre/build/tmp/sysroots/7401/usr/include/string.h:634:0,
+  |                  from /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/api/UpnpString.c:23:
+  | /home/andre/build/tmp/work/core2-32-rdk-linux/libupnp/1.6.19-r0/libupnp-1.6.19/upnp/src/api/UpnpString.c:47:15: error: expected identifier or '(' before '__extension__'
+  |   extern char *strndup(__const char *__string, size_t __n);
+  |                ^
+  | make[3]: *** [src/api/libupnp_la-UpnpString.lo] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ upnp/src/api/UpnpString.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/upnp/src/api/UpnpString.c b/upnp/src/api/UpnpString.c
+index 41c9898..2fa09d7 100644
+--- a/upnp/src/api/UpnpString.c
++++ b/upnp/src/api/UpnpString.c
+@@ -32,7 +32,7 @@
+ 	/* VC has strnlen which is already included but with (potentially) different linkage */
+ 	/* strnlen() is a GNU extension. */
+ 	#if HAVE_STRNLEN
+-		extern size_t strnlen(const char *s, size_t maxlen);
++//		extern size_t strnlen(const char *s, size_t maxlen);
+ 	#else /* HAVE_STRNLEN */
+ 		static size_t strnlen(const char *s, size_t n)
+ 		{
+@@ -44,7 +44,7 @@
+ 
+ /* strndup() is a GNU extension. */
+ #if HAVE_STRNDUP && !defined(WIN32)
+-	extern char *strndup(__const char *__string, size_t __n);
++//	extern char *strndup(__const char *__string, size_t __n);
+ #else /* HAVE_STRNDUP && !defined(WIN32) */
+ 	static char *strndup(const char *__string, size_t __n)
+ 	{
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
new file mode 100644
index 0000000..cd9768d
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/sepbuildfix.patch
@@ -0,0 +1,60 @@
+From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 9 Jun 2015 12:20:45 -0700
+Subject: [PATCH] Fix builds when using separate source and build directories.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac           | 8 ++++----
+ ixml/Makefile.am       | 2 +-
+ threadutil/Makefile.am | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e2c3f47..11d5e22 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -714,8 +714,8 @@ AC_OUTPUT
+ #
+ # Files copied for windows compilation.
+ #
+-echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
+-cp autoconfig.h build/inc/autoconfig.h
+-echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
+-cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
++echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
++cp autoconfig.h $srcdir/build/inc/autoconfig.h
++echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""
++cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
+ 
+diff --git a/ixml/Makefile.am b/ixml/Makefile.am
+index 49da766..0e9ab2c 100644
+--- a/ixml/Makefile.am
++++ b/ixml/Makefile.am
+@@ -7,7 +7,7 @@
+ 
+ SUBDIRS 		= doc
+ 
+-AM_CPPFLAGS		= -I$(srcdir)/inc -I$(srcdir)/src/inc
++AM_CPPFLAGS		= -I$(top_srcdir)/upnp/inc -I$(srcdir)/inc -I$(srcdir)/src/inc
+ AM_CFLAGS		= 
+ 
+ LDADD			= libixml.la
+diff --git a/threadutil/Makefile.am b/threadutil/Makefile.am
+index a4ed325..42d0726 100644
+--- a/threadutil/Makefile.am
++++ b/threadutil/Makefile.am
+@@ -4,7 +4,7 @@
+ # (C) Copyright 2005 Remi Turboult <r3mi@users.sourceforge.net>
+ #
+ 
+-AM_CPPFLAGS		= -I$(srcdir)/inc -I$(srcdir)/src/inc
++AM_CPPFLAGS		= -I$(top_srcdir)/upnp/inc -I$(srcdir)/inc -I$(srcdir)/src/inc
+ 
+ if ENABLE_DEBUG
+     AM_CPPFLAGS		+= -DDEBUG -DSTATS
+-- 
+1.9.1
+
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
new file mode 100644
index 0000000..133a8eb
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Portable SDK for UPnP* Devices"
+DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for development of \
+UPnP device and control point applications. It consists of the core UPnP \
+protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
+supporting the Document Object Model (DOM) Level 2 API and an optional, \
+integrated mini web server for serving UPnP related documents."
+HOMEPAGE = "http://pupnp.sourceforge.net/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
+           file://avoid-redefining-strnlen-and-strndup.patch \
+           file://sepbuildfix.patch \
+"
+
+SRC_URI[md5sum] = "ee16e5d33a3ea7506f38d71facc057dd"
+SRC_URI[sha256sum] = "b3142b39601243b50532eec90f4a27dba85eb86f58d4b849ac94edeb29d9b22a"
+
+inherit autotools
-- 
1.9.1


