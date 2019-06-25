Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA3F7E49C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:14:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5PDElFq001472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 06:14:47 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 06:14:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Jun 2019 21:14:08 +0800
Message-ID: <1561468448-24834-5-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
References: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] gvfs: add meson option admin and udisks2 to PACKAGECONFIG
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
X-List-Received-Date: Tue, 25 Jun 2019 13:14:46 -0000
Content-Type: text/plain

Both of admin and udisks2 depend on polkit, conditional support them

See upstream commit:
https://gitlab.gnome.org/GNOME/gvfs/commit/cdc33bf54f501a8b4574f86945628ab6c2036d64

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 7caee27..3a4714a 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnome bash-completion gettext upstream-version-is-even
 
-DEPENDS += "libsecret glib-2.0 gconf libgudev udisks2 polkit shadow-native"
+DEPENDS += "libsecret glib-2.0 gconf libgudev shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
@@ -18,7 +18,6 @@ EXTRA_OEMESON = " \
     -Dgoa=false \
     -Dgoogle=false \
     -Dnfs=false \
-    -Dudisks2=true \
 "
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
@@ -31,7 +30,6 @@ FILES_${PN} += " \
     ${libdir}/tmpfiles.d \
     ${systemd_user_unitdir} \
 "
-RDEPENDS_${PN} = "udisks2"
 
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/*"
 FILES_${PN}-dev += "${libdir}/gio/modules/*.la"
@@ -42,8 +40,14 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ?= "libgphoto2 \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES','polkit','udisks2','',d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES','polkit','admin','',d)} \
+                 "
 
+PACKAGECONFIG[udisks2] = "-Dudisks2=true, -Dudisks2=false, udisks2, udisks2"
+PACKAGECONFIG[admin] = "-Dadmin=true, -Dadmin=false, libcap polkit"
 PACKAGECONFIG[afc] = "-Dafc=true, -Dafc=false, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "-Darchive=true, -Darchive=false, libarchive"
 PACKAGECONFIG[dnssd] = "-Ddnssd=true, -Ddnssd=false, avahi"
@@ -62,9 +66,11 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
 do_install_append() {
-    # Fix up permissions on polkit rules.d to work with rpm4 constraints
-    chmod 700 ${D}/${datadir}/polkit-1/rules.d
-    chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'true', 'false', d)}; then
+        # Fix up permissions on polkit rules.d to work with rpm4 constraints
+        chmod 700 ${D}/${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+    fi
 
     # After rebuilds (not from scracth) it can happen that the executables in
     # libexec ar missing executable permission flag. Not sure but it came up
-- 
2.7.4


