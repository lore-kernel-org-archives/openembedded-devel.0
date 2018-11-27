Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32A856D07F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR8FQsl018530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:16:02 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:16:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:35 +0800
Message-ID: <561477ef916008029169643c1fc3d54eaeb8860d.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1543307294.git.hongxu.jia@windriver.com>
References: <cover.1543307294.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/12] dconf: 0.28.0 -> 0.30.1
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:22 -0000
Content-Type: text/plain

- Do not compile docs to workaround build failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-meson.build-do-not-compile-docs.patch     | 27 ++++++++++++++++++++++
 .../dconf/{dconf_0.28.0.bb => dconf_0.30.1.bb}     |  7 ++++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.28.0.bb => dconf_0.30.1.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch b/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
new file mode 100644
index 0000000..2f42835
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
@@ -0,0 +1,27 @@
+From 50a9133e0b13798640da0b7cd11b5a85e35b2038 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 23 Nov 2018 16:27:32 +0800
+Subject: [PATCH] meson.build: do not compile docs
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 04b6d47..46fdbc8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -81,7 +81,6 @@ subdir('gdbus')
+ subdir('gsettings')
+ subdir('client')
+ subdir('bin')
+-subdir('docs')
+ subdir('tests')
+ 
+ meson.add_install_script('meson_post_install.py', gio_module_dir)
+-- 
+2.7.4
+
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
index 99292a8..38d3ec9 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
-SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
+SRC_URI[archive.md5sum] = "a959eef51c917b3c57cfbef1448a375e"
+SRC_URI[archive.sha256sum] = "549a3a7cc3881318107dc48a7b02ee8f88c9127acaf2d47f7724f78a8f6d02b7"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
@@ -12,6 +12,9 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings bash-completion vala
 
+SRC_URI += "file://0001-meson.build-do-not-compile-docs.patch \
+           "
+
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
-- 
2.7.4


