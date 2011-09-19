Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R5mNm-0000cP-Dh
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 00:32:10 +0200
Received: (qmail invoked by alias); 19 Sep 2011 22:26:53 -0000
Received: from p5B0A3FB5.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.63.181]
	by mail.gmx.net (mp062) with SMTP; 20 Sep 2011 00:26:53 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19k2etsMCNkJblbavjJcrIXsZtI4WaIwbQFizfZks
	xGG4k+W6AWVPb4
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2011 00:30:28 +0200
Message-Id: <1316471428-12587-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] gvfs: Fix paths in subpacks gvfsd-ftp / gvfsd-sftp / gvfsd-trash
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
X-List-Received-Date: Mon, 19 Sep 2011 22:32:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 6785419..11d8400 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -6,7 +6,7 @@ DEPENDS = "samba gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
 # building against gnome-disk-utility is also possible, but brings dependency loops :(
 
-PR = "r3"
+PR = "r4"
 
 inherit gnome
 
@@ -25,8 +25,8 @@ FILES_${PN} += "${datadir}/dbus-1/services/* ${datadir}/GConf ${datadir}/glib-2.
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/*"
 FILES_${PN}-dev += "${libdir}/gio/modules/*.la"
 
-FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
-FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
-FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
+FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${datadir}/gvfs/mounts/ftp.mount"
+FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${datadir}/gvfs/mounts/sftp.mount"
+FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.mount"
 
 RRECOMMENDS_gvfs-sftp += "openssh-sftp openssh-ssh"
-- 
1.7.4.4



