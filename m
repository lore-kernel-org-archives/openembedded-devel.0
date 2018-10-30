Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8BA79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:42:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9U8fr5j006938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:42:24 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 01:41:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 15:59:25 +0800
Message-ID: <20181030075927.23175-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030075927.23175-1-kai.kang@windriver.com>
References: <20181030075927.23175-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/4] gvfs: 1.36.2 -> 1.39.1
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
X-List-Received-Date: Tue, 30 Oct 2018 08:42:33 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gvfs from 1.36.2 to 1.39.1.
* autotools has been removed, use meson instead
* add packageconfigs dnssd and logind
* disable options bluray, goa, google and nfs

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb}   | 44 ++++++++++---------
 1 file changed, 23 insertions(+), 21 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb} (53%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb
similarity index 53%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb
index 1e8f8d180..ca1eb6aa7 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.36.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.1.bb
@@ -2,24 +2,25 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnome bash-completion gettext
 
 DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "10b84073fe5f3d540abd9d36ed342b37"
-SRC_URI[archive.sha256sum] = "c4e279a33dd9cd208135e8bfc4788ceaf264c61a24a85255f6696a934a0101f7"
+SRC_URI[archive.md5sum] = "4c68899cfd80d57a153771534193bb9a"
+SRC_URI[archive.sha256sum] = "6e7213570389b17b67433695f515f3b17705ba976168a4c8828fc177cce50223"
 
-do_configure_prepend() {
-    # make automake happy..
-    touch ${S}/ABOUT-NLS
-}
 
-EXTRA_OECONF = " \
-    --disable-gdu \
-    --enable-udisks2 \
-    --disable-documentation \
+EXTRA_OEMESON = " \
+    -Dbluray=false \
+    -Dgdu=false \
+    -Dgoa=false \
+    -Dgoogle=false \
+    -Dnfs=false \
+    -Dudisks2=true \
+    -Ddocumentation=false \
 "
 
 PACKAGES =+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
@@ -45,21 +46,22 @@ RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
 PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-PACKAGECONFIG[afc] = "--enable-afc, --disable-afc, libimobiledevice libplist"
-PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
-PACKAGECONFIG[avahi] = "--enable-avahi, --disable-avahi, avahi"
-PACKAGECONFIG[gcr] = "--enable-gcr, --disable-gcr, gcr"
-PACKAGECONFIG[http] = "--enable-http, --disable-http, libsoup-2.4"
-PACKAGECONFIG[libmtp] = "--enable-libmtp, --disable-libmtp, libmtp"
-PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
-PACKAGECONFIG[samba] = "--enable-samba, --disable-samba, samba"
-PACKAGECONFIG[systemd] = "--with-systemduserunitdir=${systemd_user_unitdir},--without-systemduserunitdir,systemd"
+PACKAGECONFIG[afc] = "-Dafc=true, -Dafc=false, libimobiledevice libplist"
+PACKAGECONFIG[archive] = "-Darchive=true, -Darchive=false, libarchive"
+PACKAGECONFIG[dnssd] = "-Ddnssd=true, -Ddnssd=false, avahi"
+PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
+PACKAGECONFIG[http] = "-Dhttp=true, -Dhttp=false, libsoup-2.4"
+PACKAGECONFIG[libmtp] = "-Dmtp=true, -Dmtp=false, libmtp"
+PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
+PACKAGECONFIG[libgphoto2] = "-Dgphoto2=true, -Dgphoto2=false, libgphoto2"
+PACKAGECONFIG[samba] = "-Dsmb=true, -Dsmb=false, samba"
+PACKAGECONFIG[systemd] = "-Dsystemduserunitdir=${systemd_user_unitdir} -Dtmpfilesdir=${libdir}/tmpfiles.d, -Dsystemduserunitdir=no -Dtmpfilesdir=no, systemd"
 
 # needs meta-filesystems
-PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
+PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
 
 # libcdio-paranoia recipe doesn't exist yet
-PACKAGECONFIG[cdda] = "--enable-cdda, --disable-cdda, libcdio-paranoia"
+PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
 # Fix up permissions on polkit rules.d to work with rpm4 constraints
 do_install_append() {
-- 
2.18.0


