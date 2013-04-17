Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UST2l-00078a-7L
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:09:12 +0200
Received: by mail-ea0-f177.google.com with SMTP id q14so731876eaj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=8vvY3Gb/fLaWUIB4RZ2SbQQ6VY5GFNMfOdZQv6x1bRo=;
	b=Uirp67Rxetsa0sLkE6Hae96Pf8k17Ssrut80uBm63+l/a+w2JFyLKHl5vy0insIqY5
	U9SLbE6mOjkBaomHv74OHD5uYlmT/OIZc9rwGVNeKQvlvHGa0J6TPDOtRujEMvQ509tf
	N+YDjqtdGbl/JX3Uq83/j1xDBt5OL756MM0hYSmmkS/B7z8koPX16dgHVXBcWfRyW8dU
	MdS+iA1zuJA6BBF/Bp8H5HNQe9rGzWvMJ3Sd4kvxAqtYt8ZSeXtXxreFY37jTwofLqxm
	XdPXkkdJLH1Cyj0zWK+xuOYbi82LYDBolnQWfNjdYQVbknm0/RYWugCZoOxjaP/+RxAj
	j/Cg==
X-Received: by 10.14.177.197 with SMTP id d45mr18679016eem.9.1366206691646;
	Wed, 17 Apr 2013 06:51:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPS id 8sm9148961eeg.15.2013.04.17.06.51.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:51:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 15:49:12 +0200
Message-Id: <1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
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
X-List-Received-Date: Wed, 17 Apr 2013 14:09:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

removing tests drops dependencies on gtk

Tested by:

* building nautilus3 (the only recipe found depending on libnotify3)
* running xfce-based image and checked notififations

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libnotify/libnotify/0001-disable-tests.patch   |   54 ++++++++++++++++++++
 .../recipes-gnome/libnotify/libnotify3_0.7.3.bb    |   13 -----
 .../recipes-gnome/libnotify/libnotify_0.6.0.bb     |   17 ------
 .../recipes-gnome/libnotify/libnotify_0.7.5.bb     |   17 ++++++
 4 files changed, 71 insertions(+), 30 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify/0001-disable-tests.patch
 delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
 delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify_0.7.5.bb

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify/0001-disable-tests.patch b/meta-gnome/recipes-gnome/libnotify/libnotify/0001-disable-tests.patch
new file mode 100644
index 0000000..372e6fd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify/0001-disable-tests.patch
@@ -0,0 +1,54 @@
+From ff403cb57c307850cadddec2b6b1c0c5ee609249 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 17 Apr 2013 14:00:32 +0200
+Subject: [PATCH] disable tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+tests depend on gtk3 but many of us are still using gtk+.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am  |    2 +-
+ configure.ac |    4 ----
+ 2 files changed, 1 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9e12a02..609fae0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
+-SUBDIRS = libnotify docs tools tests
++SUBDIRS = libnotify docs tools
+ 
+ pcdata_DATA = libnotify.pc
+ pcdatadir = $(libdir)/pkgconfig
+diff --git a/configure.ac b/configure.ac
+index ae2d2d7..e13adcf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -86,16 +86,12 @@ AC_EXEEXT
+ LT_PREREQ([2.2])
+ LT_INIT
+ 
+-REQ_GTK_VERSION=2.90
+ REQ_GLIB_VERSION=2.26.0
+ 
+ pkg_modules="gdk-pixbuf-2.0 glib-2.0 >= $REQ_GLIB_VERSION gio-2.0 >= $REQ_GLIB_VERSION"
+ AC_SUBST([pkg_modules])
+ PKG_CHECK_MODULES(PACKAGE, [$pkg_modules])
+ 
+-tests_modules="gtk+-3.0 >= $REQ_GTK_VERSION"
+-PKG_CHECK_MODULES(TESTS, [$tests_modules])
+-
+ GLIB_GENMARSHAL=`pkg-config --variable=glib_genmarshal glib-2.0`
+ AC_SUBST(GLIB_GENMARSHAL)
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
deleted file mode 100644
index 4c46ec4..0000000
--- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Send desktop notifications to a notification daemon"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS = "dbus gtk+3"
-
-BPN = "libnotify"
-
-inherit gnome lib_package
-
-SRC_URI[archive.md5sum] = "d20676bde7bd2d276508d019dc7276f1"
-SRC_URI[archive.sha256sum] = "322541fdf276eb803686df81763a5186af041b2ee3e9cc5fa1dc86c550388c88"
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
deleted file mode 100644
index 0a590e3..0000000
--- a/meta-gnome/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Send desktop notifications to a notification daemon"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-PR = "r1"
-
-DEPENDS = "dbus gtk+"
-
-inherit gnome
-SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
-SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
-
-do_configure_prepend() {
-    sed -i /GTK3/d configure.ac
-    sed -i -e /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' tests/Makefile.am
-}
diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify_0.7.5.bb b/meta-gnome/recipes-gnome/libnotify/libnotify_0.7.5.bb
new file mode 100644
index 0000000..718d504
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libnotify/libnotify_0.7.5.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Send desktop notifications to a notification daemon"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+DEPENDS = "dbus glib-2.0"
+
+inherit gnome
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI += "file://0001-disable-tests.patch"
+SRC_URI[archive.md5sum] = "8e9f8bd26517bc197ab1df748df289a9"
+SRC_URI[archive.sha256sum] = "4378cb47874ba4d5f759b7890d8d28d086e81d3f0bd4f6e84e5ab66d82ffb652"
+
+PROVIDES += "libnotify3"
+RPROVIDES_${PN} += "libnotify3"
+RREPLACES_${PN} += "libnotify3"
-- 
1.7.6.5



