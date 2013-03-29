Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULexQ-0007a3-Mn
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 20:27:24 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so344460eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=w6YAdGQo2ltnDKD2LUTXWJdkje2+2UmDXBhoj/m1nH8=;
	b=rOIithXa0lmRlmDgrIAyXX2qFRAFhRrVfdvFSzIPTOKYEvfKDn9QvYvoyBQJQG5DiH
	FOL9244tS/edaAb45nlGEqCU0c6XiDCpEYI/KQCCco+0lrPOMF1ecReHIg4WbT2Dy4ru
	d+BZAbDkPECZYQLLlqORqXkc1G/8tdbEgBDW59wEQ9g2+SV3Tp0pg7pQRjBtKb8fRhKb
	6IYPagSTg6kv8qW/dBkHwvVJtE/WO0kHkuRSNKlNfiQ0DuqegAPRMqiVFwGijBzweTWN
	CttzKUTV8tUMj4AlJG+dqMezA+YpUQzb9WKBB6qgmq4WFjYPGqkeThlf/LDfE+v8yvgq
	esOQ==
X-Received: by 10.14.183.67 with SMTP id p43mr10676030eem.10.1364584220568;
	Fri, 29 Mar 2013 12:10:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id r4sm5769042eeo.12.2013.03.29.12.10.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 12:10:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 20:10:04 +0100
Message-Id: <1364584207-3047-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 1/4] exo: add native build
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
X-List-Received-Date: Fri, 29 Mar 2013 19:27:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The native build only creates exo-csource. exo-csource converts glade-files
into c-header files. When building xfce projects from git repo, exo-csource is
required (tarballs have the glade-headers included).

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../exo/exo/reduce-build-to-exo-csource-only.patch |   64 ++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb           |    7 ++
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
new file mode 100644
index 0000000..45dab0c
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -0,0 +1,64 @@
+From 7249ba76c9e6d573a72b3a84a2b3a3b2e75d18c2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 28 Mar 2013 23:41:03 +0100
+Subject: [PATCH] reduce build to exo-csource only
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+exo-csource creates c-header files from glade resource output files. When
+building xfce-packages from git instead of tarball this exo-csource-native is
+required.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am  |   10 +---------
+ configure.ac |   11 -----------
+ 2 files changed, 1 insertions(+), 20 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c2e3fff..79b0931 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,13 +1,5 @@
+ SUBDIRS =								\
+-	exo								\
+-	exo-csource							\
+-	exo-desktop-item-edit						\
+-	exo-helper							\
+-	exo-open							\
+-	docs								\
+-	icons								\
+-	pixmaps								\
+-	po
++	exo-csource
+ 
+ AUTOMAKE_OPTIONS =							\
+ 	1.9								\
+diff --git a/configure.ac b/configure.ac
+index efcd62e..23938b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,17 +165,6 @@ dnl ***********************************
+ dnl *** Check for required packages ***
+ dnl ***********************************
+ XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.30.0])
+-XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.30.0])
+-XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.24.0])
+-XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.30.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.10.0])
+-XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.30.0], [gio-unix], [GIO-Unix features])
+-
+-dnl *********************
+-dnl *** Check for X11 ***
+-dnl *********************
+-XDT_CHECK_LIBX11_REQUIRE()
+ 
+ dnl *************************
+ dnl *** Check for gtk-doc ***
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index 4fdfd48..e859cfa 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -3,6 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 perl-native cairo"
+DEPENDS_virtclass-native = "glib-2.0-native xfce4-dev-tools-native"
+PR = "r1"
 
 inherit xfce pythonnative
 
@@ -12,6 +14,9 @@ SRC_URI += " \
     file://configure.patch \
     file://gnome-mount \
 "
+SRC_URI_append_virtclass-native = " \
+    file://reduce-build-to-exo-csource-only.patch \
+"
 
 SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
 SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
@@ -30,3 +35,5 @@ FILES_${PN} += "${datadir}/xfce4/ \
 
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.4



