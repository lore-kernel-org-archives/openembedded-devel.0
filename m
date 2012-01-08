Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rjy6t-0008Cp-3J
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jan 2012 20:08:51 +0100
Received: (qmail invoked by alias); 08 Jan 2012 19:01:23 -0000
Received: from p4FDF1573.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.115]
	by mail.gmx.net (mp063) with SMTP; 08 Jan 2012 20:01:23 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/ekKET/mXemGlVx0ODIj0QOtIydyOx3+sbBRn/u4
	eUrBy11p/W4l1v
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Jan 2012 20:02:23 +0100
Message-Id: <1326049343-22183-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-gnome] gvfs: rework and add recipe for gvfs-gdu-volume-monitor
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
X-List-Received-Date: Sun, 08 Jan 2012 19:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To make gvfs work with removable devices/volumes, gvfs-gdu-volume-monitor
( gdu = gnome-disk-utility ) is required. During a build from scratch
gvfs-configure disables gdu because it can not find gnome-disk-utility.
It can not be added to gvfs DEPENDS because this causes circular dependencies:

nautilus DEPENDS gvfs
gvfs DEPENDS gnome-disk-utility
gnome-disk-utility DEPENDS nautilus

The solution is a new recipe for gvfs-gdu-volume-monitor. To reduce maintenance
efforts and to ensure that gvfs-gdu-volume-monitor is build under same
conditions as gvfs, as much settings as possible were moved to gvfs.inc. INC_PR
is started at 6 to ensure rebuilding.

run-tested for incremental build and build from scratch.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |   22 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   19 +++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb        |   22 +++++--------------
 3 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gvfs/gvfs.inc

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
new file mode 100644
index 0000000..c87b63e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -0,0 +1,22 @@
+require gvfs.inc
+
+BPN = "gvfs"
+
+DEPENDS = "gvfs gnome-disk-utility"
+
+PR = "${INC_PR}.0"
+
+# we need gdu files only: reduce files to delete in libexecdir
+EXTRA_OECONF += "--disable-gphoto2"
+
+do_install_append() {
+	rm -rf ${D}${sysconfdir}
+	rm -rf ${D}${bindir}
+	rm -rf ${D}${includedir}
+	rm -rf ${D}${libdir}
+	rm -rf ${D}${datadir}/gvfs/mounts
+	rm -f ${D}${datadir}/dbus-1/services/gvfs-*
+	rm -f ${D}${libexecdir}/gvfsd*
+	rm -f ${D}${libexecdir}/gvfs-fuse-daemon
+	rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
+}
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
new file mode 100644
index 0000000..b6a0526
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "gvfs is a userspace virtual filesystem"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+inherit gnome
+
+INC_PR = "r6"
+
+SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
+SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
+
+EXTRA_OECONF = "--disable-samba \
+                --with-samba-includes=${STAGING_INCDIR} \
+                --with-samba-libs=${STAGING_LIBDIR} \
+                --with-archive-includes=${STAGING_INCDIR} \
+               "
+
+FILES_${PN} += "${datadir}/dbus-1/services/*"
+
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 5a230eb..297d681 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -1,27 +1,16 @@
-DESCRIPTION = "gvfs is a userspace virtual filesystem"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+require gvfs.inc
 
 DEPENDS = "gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
-# building against gnome-disk-utility is also possible, but brings dependency loops :(
 
-PR = "r6"
+PR = "${INC_PR}.0"
 
-inherit gnome
-
-SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
-SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
-
-EXTRA_OECONF = "--disable-samba \
-                --with-samba-includes=${STAGING_INCDIR} \
-                --with-samba-libs=${STAGING_LIBDIR} \
-                --with-archive-includes=${STAGING_INCDIR} \
-               "
+# in case of gnome-disk-utility was alresdy built: avoid double files
+EXTRA_OECONF += "--disable-gdu"
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
 
-FILES_${PN} += "${datadir}/dbus-1/services/* ${datadir}/GConf ${datadir}/glib-2.0 ${libdir}/gio/modules/*.so"
+FILES_${PN} += "${datadir}/glib-2.0 ${datadir}/GConf ${libdir}/gio/modules/*.so"
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/*"
 FILES_${PN}-dev += "${libdir}/gio/modules/*.la"
 
@@ -29,4 +18,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${datadir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${datadir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.mount"
 
+RDEPENDS_${PN} = "gvfs-gdu-volume-monitor"
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
-- 
1.7.4.4



