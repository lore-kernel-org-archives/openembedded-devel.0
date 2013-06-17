Return-Path: <noor_ahsan@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id AED1760667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 08:20:50 +0000 (UTC)
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r5H8KmDQ006623; 
	Mon, 17 Jun 2013 03:20:50 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 13:20:30 +0500
Message-Id: <1371457230-6773-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] gvfs: Handle samba dependency based on GPLv3 license.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 08:20:50 -0000

From: Noor <noor_ahsan@mentor.com>

* Samba is GPLv3. In GPLv3 free environment one was not able to
  build gvfs. Add PACKAGECONFIG for samba and enable is when GPLv3
  is not present in INCOMPATIBLE_LICENSE.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs.inc      |    4 +---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    7 ++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index 0e1c69c..ba52fe7 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -10,9 +10,7 @@ SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
 SRC_URI += "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
 
-EXTRA_OECONF = "--with-samba-includes=${STAGING_INCDIR} \
-                --with-samba-libs=${STAGING_LIBDIR} \
-                --with-archive-includes=${STAGING_INCDIR} \
+EXTRA_OECONF = "--with-archive-includes=${STAGING_INCDIR} \
                 --with-archive-libs=${STAGING_LIBDIR} \
 "
 
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 7f86151..5274280 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "samba libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
+DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
 
 PR = "${INC_PR}.1"
@@ -21,3 +21,8 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 
 RDEPENDS_${PN} = "gvfs-gdu-volume-monitor"
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
+
+PACKAGECONFIG = "${@base_contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'samba', d)}"
+
+PACKAGECONFIG[samba] = "--enable-samba --with-samba-includes=${STAGING_INCDIR} \
+                        --with-samba-libs=${STAGING_LIBDIR}, --disable-samba, samba"
-- 
1.7.9.5


