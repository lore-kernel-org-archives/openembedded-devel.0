Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPY-0001j1-6s
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:15:56 +0200
Received: by wgbdr1 with SMTP id dr1so4416002wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=e/frHP0A8DlFHj3/hdoBPHmJ/3e7Y6bi/M1dTaTu79Y=;
	b=f5dRFJNTshtM/sZDWQYEWf5CTymWCCk/XoKp7+JEiZXEfKfXFo4gRyKv+gYQQGQqVT
	UNSCdpfJfZuw9EC4bvVt0qRpIPSmbHTO1WDGCGz18GeR13JMqXC5uSzjhkxhay6X6f/x
	EqMDk9KRnmXMlEnO+GcR5fDFIss6ZFAlm9sQvdfeiUc90b9c0e9yqEqPJvDFSdXbrK7f
	HQgFUOw6iywx0W2gJSL+2cC3NC2vC4KC7PM3baaD422HyZ98mNpQUkO5jlb6K551FJRj
	DyRjDq/1id3oeFEYMAVLEl8gvm1yXuba47N/EJTj/jsiqAFWLrVylrJNKbY4E9nKTlRh
	cFgw==
Received: by 10.216.143.200 with SMTP id l50mr8720218wej.58.1336417565393;
	Mon, 07 May 2012 12:06:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm23600404wib.6.2012.05.07.12.06.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:06:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:43 +0200
Message-Id: <d822bb304a6a8c06f67b1e917d6268a290f868fc.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 1/5] libsoup-2.4, gobject-introspection: upgraded in oe-core
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
X-List-Received-Date: Mon, 07 May 2012 19:15:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/libsoup/libsoup-2.4_2.37.2.bb  |   25 --------------
 .../use-usr-bin-env-for-python.patch               |   20 -----------
 .../gobject-introspection_0.9.10.bb                |   32 ------------------
 .../gobject-introspection_git.bb                   |   34 --------------------
 4 files changed, 0 insertions(+), 111 deletions(-)
 delete mode 100644 meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb
 delete mode 100644 meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb

diff --git a/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb b/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
deleted file mode 100644
index 4810b3a..0000000
--- a/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "An HTTP library implementation in C"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-PR = "r1"
-
-# unstable version
-DEFAULT_PREFERENCE = "-1"
-
-SECTION = "x11/gnome/libs"
-
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
-
-SRC_URI = "${GNOME_MIRROR}/libsoup/2.37/libsoup-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "7737dd5238efd593452ba3c365e63e8c"
-SRC_URI[sha256sum] = "df82c51b67f67c3128979d1f3bf20a8ceeea369b6e43aceb16d576d8fc4e8423"
-
-S = "${WORKDIR}/libsoup-${PV}"
-
-inherit autotools pkgconfig
-
diff --git a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch b/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
deleted file mode 100644
index 67b8547..0000000
--- a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection/use-usr-bin-env-for-python.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
-===================================================================
---- gobject-introspection-0.9.10.orig/tools/g-ir-annotation-tool.in
-+++ gobject-introspection-0.9.10/tools/g-ir-annotation-tool.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@
-+#!/usr/bin/env python
- # -*- Mode: Python -*-
- # GObject-Introspection - a framework for introspecting GObject libraries
- # Copyright (C) 2008  Johan Dahlin
-Index: gobject-introspection-0.9.10/tools/g-ir-scanner.in
-===================================================================
---- gobject-introspection-0.9.10.orig/tools/g-ir-scanner.in
-+++ gobject-introspection-0.9.10/tools/g-ir-scanner.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@
-+#!/usr/bin/env python
- # -*- Mode: Python -*-
- # GObject-Introspection - a framework for introspecting GObject libraries
- # Copyright (C) 2008  Johan Dahlin
diff --git a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb b/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb
deleted file mode 100644
index f1a46a1..0000000
--- a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_0.9.10.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-# NOTE: WIP! This recipe does not cross-compile atm., only -native
-SECTION = "libs"
-DEPENDS = "glib-2.0 libffi bison-native"
-BBCLASSEXTEND = "native"
-PR = "r1"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
-                    file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI[md5sum] = "e5cd63d6bcc5c105e898e7c33cf42175"
-SRC_URI[sha256sum] = "4bf244db75df04499dea704e7734376c0fc5a3a17fb59be2123c8d76111e6fb8"
-
-SRC_URI = "\
-  ${GNOME_MIRROR}/gobject-introspection/0.9/${BPN}-${PV}.tar.bz2 \
-  file://use-usr-bin-env-for-python.patch \
-"
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools
-
-do_configure_prepend() {
-	touch -f gtk-doc.make
-}
-
-EXTRA_OECONF = "\
-  --disable-gtk-doc \
-  --disable-gtk-doc-html \
-  --disable-gtk-doc-pdf \
-  --disable-tests \
-"
diff --git a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb b/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
deleted file mode 100644
index f7e8907..0000000
--- a/meta-gnome/recipes-gnome/gobject-introspection/gobject-introspection_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-# NOTE: WIP! This recipe does not cross-compile atm., only -native
-DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
-DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
-BBCLASSEXTEND = "native"
-
-SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
-  file://use-usr-bin-env-for-python.patch \
-"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
-		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
-PV = "1.29.0+gitr${SRCPV}"
-PR = "r1"
-DEFAULT_PREFERENCE = "-1"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
-
-do_configure_prepend () {
-        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
-}
-
-EXTRA_OECONF = "\
-  --disable-gtk-doc \
-  --disable-gtk-doc-html \
-  --disable-gtk-doc-pdf \
-  --disable-tests \
-"
-- 
1.7.8.6



