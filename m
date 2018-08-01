Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5552378DC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:17:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w718HPdJ006855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 01:17:25 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:17:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 16:27:41 +0800
Message-ID: <63f1ce8a00d85054197a3dcc70e27bb637ba0433.1533111522.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111522.git.hongxu.jia@windriver.com>
References: <cover.1533111522.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/16 V2] dconf 0.18.0 -> 0.28.0
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
X-List-Received-Date: Wed, 01 Aug 2018 08:17:26 -0000
Content-Type: text/plain

- Remove dconf-editor

- Use meson to replace autotools

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dconf/{dconf_0.18.0.bb => dconf_0.28.0.bb}     | 27 +++++-----------------
 1 file changed, 6 insertions(+), 21 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.18.0.bb => dconf_0.28.0.bb} (29%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
similarity index 29%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
index e24bde4..edda1cc 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.28.0.bb
@@ -4,33 +4,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/gnome"
 
-inherit gnomebase gsettings
-SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
-SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gsettings bash-completion
+SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
+SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "dbus glib-2.0 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 intltool-native"
 
-inherit vala gtk-doc distro_features_check
-
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "editor", "", d)}"
-
-#note: editor will be removed in version 0.23.1
-PACKAGECONFIG[editor] = "--enable-editor,--disable-editor,gtk+3"
-
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains("PACKAGECONFIG", "editor", "x11", "", d)}"
-
-EXTRA_OECONF += "--disable-man"
-
-PACKAGES =+ "${@bb.utils.contains("DISTRO_FEATURES", "x11", "dconf-editor", "", d)}"
+inherit vala
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
-    ${datadir}/bash-completion \
-"
-FILES_dconf-editor = " \
-    ${bindir}/dconf-editor \
-    ${datadir}/icons \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-- 
2.7.4


