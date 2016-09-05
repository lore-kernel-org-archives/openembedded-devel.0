Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 922B7772FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Sep 2016 21:32:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a6so4173269wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Sep 2016 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2s8xfBWHJ6kgoW12rR5grcJkB7IshXFKmom5dBMfqk=;
	b=OOB3rs10iekO41/tErbze14ARJhdJC8mYjLGxjIoae/hysOruizNHkPLMFC2dpNR8z
	oZuiwho2PLhsr5RbK3VBjoQXNXK2PmQ1p7fv855gyublFpj3/HOXd9Ttn3MGW0qcgcTB
	Jnjdz8NjoftViI9egQtIRmDLUF37Jh6Ijaq9IFB/MbUwEw7A2PrAjd7SE5RNncD4Oklt
	r2qDBeyVUOcmodd0/vKyXvd7mRrFfYo7BlilxkApc1X1XG532hWT95OsjyE78vWCgX1Q
	dIzB5CxHvJ+vveOf7BcB2FNhFUyMt36FkHK2Y6cMOoM3sxbzunAHBmygaBClLPkL+5cs
	zupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2s8xfBWHJ6kgoW12rR5grcJkB7IshXFKmom5dBMfqk=;
	b=I0qPlz2wa8LS0pYzaxuJczOpvWgxo/3i53C/Ve7fglaGEdBrY8dR9ppnlTM9Zls/Wr
	iuo8AXiLHCDEItY6TA1tJ77LTz3+MAmyItNQvr3YacEQbM7LH8jeJQIeamUwpvsMr6BK
	9KETR89ppsJYbsJyQnv3/OXWYYprwH3sEqYwdFO3yOfutAzQTjwoQ8D1kl8HNvb0wL3f
	3lYyf1FsT/b2ZzmIXeG3sU9ACGxS/4Eev6ZtzPxU1s4kQtaz/VYR/f4LquxuPlwBseAW
	nylYGtMud679XmBWyFW5ORrinX7gTBVWR3VNgMg4rECsFK/7bqk8Hers/RoroIZ9qVR0
	yifg==
X-Gm-Message-State: AE9vXwOi1Rs1bRcOlXB1NHUQeDKY/xzGwoq2htUf0nqAi9u0TjAiz3iF32aaNhlsPp4rdg==
X-Received: by 10.194.201.230 with SMTP id kd6mr8813953wjc.167.1473111134252; 
	Mon, 05 Sep 2016 14:32:14 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0242.dip0.t-ipconnect.de.
	[79.223.2.66]) by smtp.googlemail.com with ESMTPSA id
	wr2sm29726517wjb.12.2016.09.05.14.32.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 14:32:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Sep 2016 23:32:03 +0200
Message-Id: <1473111123-26447-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] glade3: unbreak, unblacklist and other fixes
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
X-List-Received-Date: Mon, 05 Sep 2016 21:32:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fix build with gcc-6
* add intltool-native to DEPENDS
* add gtk-icon-cache to inherit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-devtools/glade/glade3_%.bbappend       |  1 -
 .../glade/files/0002-fix-gcc-6-build.patch         | 39 ++++++++++++++++++++++
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb     | 13 ++++----
 3 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch

diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
index b712471..3abacfb 100644
--- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
+++ b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
@@ -1,2 +1 @@
 PACKAGECONFIG ??= "gnome"
-PNBLACKLIST[glade3] ?= "Depends on broken libgnomeui"
diff --git a/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch b/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
new file mode 100644
index 0000000..5880ea5
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/files/0002-fix-gcc-6-build.patch
@@ -0,0 +1,39 @@
+From 5aa3d2abb905fa8594f6c6572a87809da54c9342 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 5 Sep 2016 11:25:27 +0200
+Subject: [PATCH] fix gcc-6 build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status; Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ gladeui/glade-editor-property.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gladeui/glade-editor-property.c b/gladeui/glade-editor-property.c
+index a0c1039..5e9ac38 100644
+--- a/gladeui/glade-editor-property.c
++++ b/gladeui/glade-editor-property.c
+@@ -2703,6 +2703,8 @@ glade_eprop_object_view (gboolean             radio)
+ }
+ 
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ static gchar *
+ glade_eprop_object_dialog_title (GladeEditorProperty *eprop)
+ {
+@@ -2731,6 +2733,7 @@ glade_eprop_object_dialog_title (GladeEditorProperty *eprop)
+ 	return g_strdup_printf (format, g_type_name 
+ 				(eprop->klass->pspec->value_type));
+ }
++#pragma GCC diagnostic pop
+ 
+ 
+ gboolean
+-- 
+2.5.5
+
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index dcc0cbe..fd65536 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -4,12 +4,15 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2"
+DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig pythonnative gtk-icon-cache
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
-           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch"
+SRC_URI = " \
+    http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
+    file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
+    file://0002-fix-gcc-6-build.patch \
+"
 SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
 SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
 
@@ -19,5 +22,3 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
 
 FILES_${PN} += "${datadir}/icons"
-FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
-FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
-- 
2.5.5


