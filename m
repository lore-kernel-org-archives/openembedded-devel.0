Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0675F70100
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jul 2016 02:04:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6524qDO029650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jul 2016 19:04:52 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 4 Jul 2016 19:04:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jul 2016 10:04:44 +0800
Message-ID: <c47aeafe2f753e3d66cce3e42d336a7a7b7cd017.1467683887.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1467683887.git.yi.zhao@windriver.com>
References: <cover.1467683887.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-gnome][PATCH 1/2] gtksourceview2: fix build with gcc6
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
X-List-Received-Date: Tue, 05 Jul 2016 02:04:52 -0000
Content-Type: text/plain

Fix build error:
../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c:
In function 'strdup_strftime':
../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c:1951:3:
error: format not a string literal, format string not checked [-Werror=format-nonliteral]
   tmplen = strftime (tmpbuf, tmpbufsize, locale_format, tm);
   ^~~~~~

A wrapper for strftime() would compile failed with -Werror=format-nonliteral
in newer GCC. See GCC bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=39438

Since most of the strdup_strftime function code is taken from GLib's
g_date_strftime() in gdate.c which already had a fix:
https://bugzilla.gnome.org/show_bug.cgi?id=761550

So this patch refers the glib fixes:
https://git.gnome.org/browse/glib/commit/?id=0817af40e8c74c721c30f6ef482b1f53d12044c7
https://git.gnome.org/browse/glib/commit/?id=8cdbc7fb2c8c876902e457abe46ee18a0b134486

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../suppress-string-format-literal-warning.patch   | 33 ++++++++++++++++++++++
 .../gtksourceview/gtksourceview2_2.10.5.bb         |  3 +-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch
new file mode 100644
index 0000000..f9ae077
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch
@@ -0,0 +1,33 @@
+Fix build error with gcc6:
+../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c: In function 'strdup_strftime':
+../../gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c:1951:3: error: format not a string literal, format string not checked [-Werror=format-nonliteral]
+   tmplen = strftime (tmpbuf, tmpbufsize, locale_format, tm);
+   ^~~~~~
+
+Patch Reference:
+https://git.gnome.org/browse/glib/commit/?id=0817af40e8c74c721c30f6ef482b1f53d12044c7
+https://git.gnome.org/browse/glib/commit/?id=8cdbc7fb2c8c876902e457abe46ee18a0b134486
+
+Upstream-Status: Pending
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff -Nurp gtksourceview-2.10.5.orig/gtksourceview/gtksourceprintcompositor.c gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c
+--- gtksourceview-2.10.5.orig/gtksourceview/gtksourceprintcompositor.c	2016-07-01 13:11:43.631173762 +0800
++++ gtksourceview-2.10.5/gtksourceview/gtksourceprintcompositor.c	2016-07-04 13:54:18.223726343 +0800
+@@ -1913,6 +1913,8 @@ setup_pango_layouts (GtkSourcePrintCompo
+  * GLIB - Library of useful routines for C programming
+  * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald */
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ static gchar *
+ strdup_strftime (const gchar *format, const struct tm *tm)
+ {
+@@ -1982,6 +1984,7 @@ strdup_strftime (const gchar *format, co
+ 
+ 	return convbuf;
+ }
++#pragma GCC diagnostic pop
+ 
+ static gchar *
+ evaluate_format_string (GtkSourcePrintCompositor *compositor,
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index 1820ba8..8d935b8 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -15,6 +15,7 @@ inherit gnomebase lib_package gettext
 # overrule SRC_URI from gnome.conf
 SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2;name=archive \
            file://gtk-doc.make \
+           file://suppress-string-format-literal-warning.patch \
 "
 SRC_URI[archive.md5sum] = "1219ad1694df136f126507466aeb41aa"
 SRC_URI[archive.sha256sum] = "c585773743b1df8a04b1be7f7d90eecdf22681490d6810be54c81a7ae152191e"
@@ -27,5 +28,3 @@ do_configure_prepend() {
 
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
 
-# http://errors.yoctoproject.org/Errors/Details/68609/
-PNBLACKLIST[gtksourceview2] ?= "BROKEN: fails to build with gcc-6"
-- 
2.7.4


