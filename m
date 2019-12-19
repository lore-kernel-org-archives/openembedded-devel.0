Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC7537FD18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:02:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBJA2LV1016263
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 19 Dec 2019 02:02:21 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 19 Dec 2019 02:02:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 19 Dec 2019 18:02:19 +0800
Message-ID: <1576749739-23235-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs: add user polkitd and missing depends
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
X-List-Received-Date: Thu, 19 Dec 2019 10:02:21 -0000
Content-Type: text/plain

1. Since commit [664e550 gvfs: Fix build regression from uprev]
   applied, it chmod polkitd but missed to useradd polkitd at do_rootfs

2. Add dbus to DEPENDS
...
| Run-time dependency dbus-1 found: NO (tried pkgconfig)
|
| meson.build:254:0: ERROR: Dependency "dbus-1" not found, tried pkgconfig
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
index 6888eff..e5d23b0 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.42.1.bb
@@ -3,9 +3,10 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check
+inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check useradd
 
-DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native gsettings-desktop-schemas"
+DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
+            gsettings-desktop-schemas dbus"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 SRC_URI[archive.md5sum] = "93592535508322548d44fa036b635a0a"
@@ -66,6 +67,9 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'true', 'false', d)}; then
         # Fix up permissions on polkit rules.d to work with rpm4 constraints
-- 
2.7.4


