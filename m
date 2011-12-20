Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0NE-00044O-KY
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:08:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4++5Rf0g5gZvhATBjbTJ8bAi1mUKfjmpjMtaNg+EXHA=;
	b=DiHAdHqEXIyGiFvhHjgSoqjuB5DptNg0QpU9VFeyEdrHJbGGqU5q46cR8fbu5EAA99
	1hnHrIAGmInlp2kmMfYt0YUCKgf9GKuEcxLY8xp/Q1OZGM/5BGRaitHo0QZBw/YR/7BC
	QXFG9GQY4As0CRWrVHZXVvTMQ/polWqlQAbXA=
Received: by 10.14.149.13 with SMTP id w13mr1029750eej.61.1324389714501;
	Tue, 20 Dec 2011 06:01:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm7160496eeh.5.2011.12.20.06.01.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:01:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:14 +0100
Message-Id: <c343bd205be77f1d014a5b21698caf23a9b6620d.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
References: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 5/7] gpsd: upgrade from 2.95 to 2.96, drop 2 patches applied upstream
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
X-List-Received-Date: Tue, 20 Dec 2011 14:08:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/gpsd-2.95/fix-build-with-python2.7.patch  |   15 ---------------
 .../gpsd/gpsd-2.95/libtool.patch                   |   16 ----------------
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/60-gpsd.rules    |    0
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd             |    0
 .../gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd-default     |    0
 .../gpsd/{gpsd_2.95.bb => gpsd_2.96.bb}            |   10 +++-------
 6 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/60-gpsd.rules (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.95 => gpsd-2.96}/gpsd-default (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_2.95.bb => gpsd_2.96.bb} (90%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
deleted file mode 100644
index 6bba2b8..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Without this patch python2.6 from host could be preferred over python from native sysroot.
-
-Upstream-Status: Pending
-diff -uNr gpsd-2.95.orig/configure.ac gpsd-2.95/configure.ac
---- gpsd-2.95.orig/configure.ac	2011-10-31 18:26:08.860719033 +0100
-+++ gpsd-2.95/configure.ac	2011-10-31 18:27:47.718716963 +0100
-@@ -31,7 +31,7 @@
- dnl AM_PATH_PYTHON provided with automake can be too old.  Look
- dnl for newer python first, and include 2.6 on the list.
- m4_define([_AM_PYTHON_INTERPRETER_LIST],
--	    [python2.6 python2.5 python2.4 python])
-+	    [python2.7 python2.6 python2.5 python2.4 python])
- AM_PATH_PYTHON([2.4])
- ac_python=yes
- if test "x$PYTHON" = "x"; then
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
deleted file mode 100644
index 7b78a72..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/libtool.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: gpsd-2.95/Makefile.am
-===================================================================
---- gpsd-2.95.orig/Makefile.am	2010-08-26 15:31:38.804330723 +0200
-+++ gpsd-2.95/Makefile.am	2010-08-26 15:31:57.170020341 +0200
-@@ -253,9 +253,9 @@
- # Warning: This overrides autoconf's normal link-line generation process
- if LIBGPSMM_ENABLE
- libgps_la_SOURCES += libgpsmm.cpp
--libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
-+libgps_la_LINK = $(LIBTOOL) --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
- else
--libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
-+libgps_la_LINK = $(LIBTOOL) --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
- endif
- 
- nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/60-gpsd.rules
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.95/60-gpsd.rules
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.96/60-gpsd.rules
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd-default b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd-default
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.95/gpsd-default
rename to meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd-default
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
similarity index 90%
rename from meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index cdcb77c..0dc06a1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -5,22 +5,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
-
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
                 --enable-dbus \
                 --disable-libQgpsmm \
 "
 
-SRC_URI = "http://download.berlios.de/${PN}/${P}.tar.gz;name=gpsd \
-           file://libtool.patch \
-           file://fix-build-with-python2.7.patch \
+SRC_URI = "http://download.berlios.de/${PN}/${P}bis.tar.gz;name=gpsd \
            file://gpsd-default \
            file://gpsd \
            file://60-gpsd.rules"
-SRC_URI[gpsd.md5sum] = "12535a9ed9fecf9ea2c5bdc9840da5ae"
-SRC_URI[gpsd.sha256sum] = "832343a53921a8371efa540ba57c91dadedda445e571c1beb97c06539ef450ae"
+SRC_URI[gpsd.md5sum] = "52b00cab0fb34bbf1923ae35c7ced6c4"
+SRC_URI[gpsd.sha256sum] = "c6d72565bc06b802c749e69808eb7c6ee165962dc17383971c9001b5e1763690"
 
 inherit autotools update-rc.d python-dir
 
-- 
1.7.8



