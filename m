Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 02464782D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 15:23:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6PFNN9K017473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:23:23 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 08:23:22 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jul 2017 08:23:22 -0700
Message-ID: <20170725152322.56763-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gvfs: Fix build regression from uprev
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
X-List-Received-Date: Tue, 25 Jul 2017 15:23:23 -0000
Content-Type: text/plain

The commit 187798c3bd3dad2de3d159faf456aa6e71fbdf46 (gvfs: update
1.28.3 -> 1.32.1) caused a regression where images that use rpm4 can
no longer assemble correctly because it includes polkit rules.

At image creation time rpm4 will detect a mismatch of the ownership
with the polkit rules.d directory as follows:

    file /usr/share/polkit-1/rules.d conflicts between attempted installs of gvfs-1.32.1-r0.1.core2_64 and polkit-0.113-r0.8.core2_64
    file /usr/share/polkit-1/rules.d conflicts between attempted installs of libvirt-1.3.5-r0.9.core2_64 and gvfs-1.32.1-r0.1.core2_64

The libvirt which also appears in the error message has already been
fixed in the meta-virtualization layer in a similar maner. (http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=67c86c4962170354ad8a2ec4cdbb9bc0056cfd66)

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
index 94d89542e..d38068836 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.32.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 inherit gnome bash-completion gettext
 
-DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2"
+DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
@@ -58,3 +58,9 @@ PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
 
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "--enable-cdda, --disable-cdda, libcdio-paranoia"
+
+# Fix up permissions on polkit rules.d to work with rpm4 constraints
+do_install_append() {
+	chmod 700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+}
-- 
2.11.0


