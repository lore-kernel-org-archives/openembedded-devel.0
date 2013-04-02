Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UN9WR-0004vJ-MN
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 00:17:43 +0200
Received: by mail-ee0-f44.google.com with SMTP id l10so462457eei.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 15:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ZPDVwsZxgRJi1sy41YZaUcSQvYZUkRoGpIw/m+51uA4=;
	b=KsIw8IsrPSTDRzS1Gk3JeUVhDgcnT0FPWZwulR7Hg3w9JTLnayQZiNnYBuct0x3ePt
	FyME5otPU/pXs8FIQAopsUhTU2NxNPd62hA6a+LPNBLU5B9kxDBTB7ZvUcrCoGJteCxO
	9OemU9yy48nBOZAt5ZqoueaqrzKi/cnmdGPZeusZnB6w1QxddcpMROz34Wgmu9fcE8oY
	1z1TsxwNZJD9BycwT8vkhrXGtOu15uckrZIMyeex8Cjy0/Gq8DBBYX6iV2X3DypBDbHh
	2GEavIEkUwiVWkrxfp+wIeJKYs2WJ93CUckrtu9OH6Kxx4XdnJpNDDLRMzG2sbgo6oFH
	OJBA==
X-Received: by 10.14.207.200 with SMTP id n48mr53781264eeo.4.1364940033529;
	Tue, 02 Apr 2013 15:00:33 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3CF4.dip.t-dialin.net.
	[91.10.60.244])
	by mx.google.com with ESMTPS id d47sm5204412eem.9.2013.04.02.15.00.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 15:00:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2013 00:00:16 +0200
Message-Id: <1364940019-23226-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce,V3 2/5] exo: add native build
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
X-List-Received-Date: Tue, 02 Apr 2013 22:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The native build creates exo-csource only. exo-csource converts glade-files
into c-header files. When building xfce projects from git repo, exo-csource is
required (tarballs have the glade-headers included).

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../exo/exo/reduce-build-to-exo-csource-only.patch |   80 ++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb           |    9 ++-
 2 files changed, 88 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
new file mode 100644
index 0000000..84b2370
--- /dev/null
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -0,0 +1,80 @@
+From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001
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
+ configure.ac |   20 --------------------
+ 2 files changed, 1 insertions(+), 29 deletions(-)
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
+index efcd62e..aac2495 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,15 +110,6 @@ AC_PROG_CC()
+ AM_PROG_CC_C_O()
+ AC_PROG_INSTALL()
+ AC_PROG_INTLTOOL([0.31], [no-xml])
+-AC_CHECK_PROGS([PERL], [perl5 perl])
+-
+-dnl ***************************************
+-dnl *** Check for required Perl modules ***
+-dnl ***************************************
+-AC_PROG_PERL_MODULES([URI::Escape URI::file URI::URL], [],
+-[
+-  AC_MSG_ERROR([Atleast one of the required Perl modules (URI::Escape, URI::file and URI::URL) was not found on your system])
+-])
+ 
+ dnl ***************************************
+ dnl *** Check for standard header files ***
+@@ -165,17 +156,6 @@ dnl ***********************************
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
index 6aa1056..f16d544 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -3,7 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
-PR = "r1"
+DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
+PR = "r2"
 
 inherit xfce pythonnative perlnative
 
@@ -14,6 +15,10 @@ SRC_URI += " \
     file://gnome-mount \
 "
 
+SRC_URI_append_class-native = " \
+    file://reduce-build-to-exo-csource-only.patch \
+"
+
 SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
 SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
 
@@ -31,3 +36,5 @@ FILES_${PN} += "${datadir}/xfce4/ \
 
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug \
                    "
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.4



