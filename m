Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Song.Li@windriver.com>) id 1TC5wk-000058-Jg
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 11:42:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8D9UKR9002108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 02:30:20 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 13 Sep 2012 02:30:19 -0700
From: <Song.Li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Sep 2012 17:29:26 +0800
Message-ID: <1347528566-20039-1-git-send-email-Song.Li@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] python-pygtk:add gtk-types.defs into gdk.c dependence
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
X-List-Received-Date: Thu, 13 Sep 2012 09:42:55 -0000
Content-Type: text/plain

From: "Song.Li" <Song.Li@windriver.com>

gdk.c depends on gtk-types.defs but
gdk/Makefile.am miss this.This will cause
build error sometimes when built
with multi-jobbing,so add gtk-types.defs into
gdk.c dependence.

[YOCTO #3103]

Signed-off-by: Song.Li <Song.Li@windriver.com>
---
 .../add-gtk-types.defs-into-gdk.c-dependence.patch |   34 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    6 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch

diff --git a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
new file mode 100644
index 0000000..9c42ef5
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
@@ -0,0 +1,34 @@
+From 5892e2f02a00a21aa905809741f66647d1ed659e Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Tue, 11 Sep 2012 16:15:46 +0800
+Subject: [PATCH] add gtk-types.defs into gdk.c dependence
+
+gdk.c depends on gtk-types.defs but
+gdk/Makefile.am miss this.This will cause
+build error sometimes when built
+with multi-jobbing,so add gtk-types.defs into
+gdk.c dependence.
+
+Upstream-Status:Pending
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+---
+ gtk/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/Makefile.am b/gtk/Makefile.am
+index c02a0e2..28332f7 100644
+--- a/gtk/Makefile.am
++++ b/gtk/Makefile.am
+@@ -177,7 +177,7 @@ gtkunixprint.defs: $(GTKUNIXPRINT_DEFS) Makefile
+ gtkunixprint-types.defs: $(GTKUNIXPRINT_TYPES_DEFS) Makefile
+ 	$(CREATEDEFS) $@ $(GTKUNIXPRINT_TYPES_DEFS)
+ 
+-gdk.c: gdk-types.defs gdk.defs $(GDK_OVERRIDES)
++gdk.c: gdk-types.defs gtk-types.defs gdk.defs $(GDK_OVERRIDES)
+ gtk.c: gdk-types.defs gtk-types.defs gtk.defs gdk-types.defs $(GTK_OVERRIDES)
+ _gtk_la_CFLAGS = $(PYCAIRO_CFLAGS) $(GTK_CFLAGS)
+ _gtk_la_LDFLAGS = $(common_ldflags) -export-symbols-regex init_gtk
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 20d54a3..f7e52bc 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -8,11 +8,15 @@ SRCNAME = "pygtk"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2 \
            file://fix-gtkunixprint.patch \
            file://prevent_to_get_display_during_import.patch \
            file://nodocs.patch \
-           file://acinclude.m4"
+           file://acinclude.m4 \
+           file://add-gtk-types.defs-into-gdk.c-dependence.patch \
+           "
 
 SRC_URI[md5sum] = "a1051d5794fd7696d3c1af6422d17a49"
 SRC_URI[sha256sum] = "cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e0f82c896e649f206912"
-- 
1.7.9.5



