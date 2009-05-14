Received: from [88.149.128.34] (helo=smtpi4.ngi.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M4WCT-0005af-LO
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:22:02 +0200
Received: from localhost.localdomain (81-174-25-145.dynamic.ngi.it
	[81.174.25.145]) by smtpi4.ngi.it (Postfix) with ESMTP id 753224205E;
	Thu, 14 May 2009 10:15:08 +0200 (CEST)
From: Elena Grandi <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2009 10:14:55 +0200
Message-Id: <1242288896-6347-3-git-send-email-elena.valhalla@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1242288896-6347-2-git-send-email-elena.valhalla@gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
	<1242288896-6347-2-git-send-email-elena.valhalla@gmail.com>
Subject: [PATCH] gtksourceview: renamed the 1.x tree to gtksourceview1
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
X-List-Received-Date: Thu, 14 May 2009 08:22:10 -0000

GtkSourceView 1.x is an older stable version that is still required
by some packages and is currently used in 2 recipes.

Signed-off-by: Elena Grandi <elena.valhalla@gmail.com>
---
 conf/distro/include/preferred-om-2008-versions.inc |    2 +-
 recipes/gobby/gobby_0.4.1.bb                       |    3 ++-
 recipes/gobby/gtksourceview_1.7.2.bb               |    9 ---------
 recipes/gtksourceview/gtksourceview1_1.7.2.bb      |   16 ++++++++++++++++
 recipes/tea/tea_17.3.5.bb                          |    4 ++--
 5 files changed, 21 insertions(+), 13 deletions(-)
 delete mode 100644 recipes/gobby/gtksourceview_1.7.2.bb
 create mode 100644 recipes/gtksourceview/gtksourceview1_1.7.2.bb

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index 8c5c4f7..d226cff 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -635,7 +635,7 @@ PREFERRED_VERSION_gtkmm ?= "2.10.10"
 PREFERRED_VERSION_gtk-sato-engine ?= "0.1"
 PREFERRED_VERSION_gtk-sharp ?= "2.10.2"
 PREFERRED_VERSION_gtk-smooth-engine ?= "0.5.8"
-PREFERRED_VERSION_gtksourceview ?= "1.7.2"
+PREFERRED_VERSION_gtksourceview1 ?= "1.7.2"
 PREFERRED_VERSION_gtkterm2 ?= "0.2.3"
 PREFERRED_VERSION_gtk-xfce-engine ?= "2.4.1"
 PREFERRED_VERSION_gtracer ?= "0.0.10"
diff --git a/recipes/gobby/gobby_0.4.1.bb b/recipes/gobby/gobby_0.4.1.bb
index f9474c8..87f0fb9 100644
--- a/recipes/gobby/gobby_0.4.1.bb
+++ b/recipes/gobby/gobby_0.4.1.bb
@@ -1,7 +1,8 @@
 LICENSE = "LGPL"
 HOMEPAGE = "http://darcs.0x539.de/trac/obby/cgi-bin/trac.cgi/wiki/"
+PR = "r1"
 
-DEPENDS = "net6 gtkmm obby gtksourceview libxml++"
+DEPENDS = "net6 gtkmm obby gtksourceview1 libxml++"
 inherit autotools pkgconfig
 
 SRC_URI = "http://releases.0x539.de/gobby/gobby-${PV}.tar.gz"
diff --git a/recipes/gobby/gtksourceview_1.7.2.bb b/recipes/gobby/gtksourceview_1.7.2.bb
deleted file mode 100644
index 6b4c8e6..0000000
--- a/recipes/gobby/gtksourceview_1.7.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-LICENSE = "GPL"
-
-DEPENDS = "gtk+ libgnomeprint"
-
-inherit gnome pkgconfig
-
-do_stage() {
-autotools_stage_all
-}
diff --git a/recipes/gtksourceview/gtksourceview1_1.7.2.bb b/recipes/gtksourceview/gtksourceview1_1.7.2.bb
new file mode 100644
index 0000000..44d88fb
--- /dev/null
+++ b/recipes/gtksourceview/gtksourceview1_1.7.2.bb
@@ -0,0 +1,16 @@
+LICENSE = "GPL"
+
+PNAME = "gtksourceview"
+
+DEPENDS = "gtk+ libgnomeprint"
+
+S = "${WORKDIR}/${PNAME}-${PV}"
+
+inherit gnome pkgconfig
+
+# overrule SRC_URI from gnome.conf
+SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2"
+
+do_stage() {
+autotools_stage_all
+}
diff --git a/recipes/tea/tea_17.3.5.bb b/recipes/tea/tea_17.3.5.bb
index c8dac8c..6412db0 100644
--- a/recipes/tea/tea_17.3.5.bb
+++ b/recipes/tea/tea_17.3.5.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Tea - a GTK based text editor with highlighting and a lot of processing features"
 SECTION = "gpe"
 LICENSE = "GPL"
-DEPENDS = "gtk+ gtksourceview"
-PR = "r1"
+DEPENDS = "gtk+ gtksourceview1"
+PR = "r2"
 
 inherit autotools
 
-- 
1.6.0.6



