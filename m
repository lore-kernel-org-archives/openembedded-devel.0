Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRO-0004cd-NY
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ea0-f170.google.com with SMTP id d11so2632624eaa.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=5RtyLHshML3pG4Q7K2kGU5ovGLn5aIi/dwmKU43IycI=;
	b=rX0IJ+zMT+A0yljXcdJqALAGwNL3kCQdVHfy3z9fpLGQXp3kHUQNFxC6CBNtD2OJ/5
	YuT46+30qVIMf796XmkiJkfzeQryQHIeMwVoUvkJQVeBULpzHc/RxQqXfu/vT3AfoPON
	GYuX8HwdhoGWRWGrLnc5WqOH4qHfNv8lRMWPqrDnIUghL9fsqf8iCxu0uKjPuVWDP8Uf
	momTY0Tqf5v9jjhOdevGMgpqfvodBbw7fm19PX1r8Btao8nfKXbFx0VAHjcVQWq9yHUF
	guZMsvg7ZZWo2Fc9dwWePuswU213HmbPwlM0HX4OxPV7cT28IctFnNB6xJEiHAha0LpL
	uMIg==
X-Received: by 10.14.202.3 with SMTP id c3mr48372968eeo.4.1356267798416;
	Sun, 23 Dec 2012 05:03:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:41 +0100
Message-Id: <1356267761-15152-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 12/12] gvfs: reenable gvfs-smb
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

samba was disabled in 12cf4fa8d23badbf55a018db0f821909294de34e because it
caused OOM condition. This could not be reproduced any more. Likely reason for
OOM wasmissing gdu-volume-monitor which is build by an own recipe nowadays.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    3 ++-
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |    5 ++---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb        |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index 1939f09..f2f354c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -7,7 +7,8 @@ DEPENDS = "gvfs gnome-disk-utility"
 PR = "${INC_PR}.3"
 
 # we need gdu files only: reduce files to delete in libexecdir
-EXTRA_OECONF += "--disable-gphoto2"
+EXTRA_OECONF += "--disable-samba \
+                 --disable-gphoto2"
 
 do_install_append() {
 	rm -rf ${D}${sysconfdir}
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs.inc b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
index e86c93f..c69851c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs.inc
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs.inc
@@ -4,14 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 inherit gnome
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 SRC_URI[archive.md5sum] = "402f94b187b197b403d25c85caeb9562"
 SRC_URI[archive.sha256sum] = "0895ac8f6d416e1b15433b6b6b68eb119c6e8b04fdb66db665d684355ef89345"
 SRC_URI += "file://0001-gvfsfusedaemon.c-fix-glib-build.patch"
 
-EXTRA_OECONF = "--disable-samba \
-                --with-samba-includes=${STAGING_INCDIR} \
+EXTRA_OECONF = "--with-samba-includes=${STAGING_INCDIR} \
                 --with-samba-libs=${STAGING_LIBDIR} \
                 --with-archive-includes=${STAGING_INCDIR} \
                 --with-archive-libs=${STAGING_LIBDIR} \
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
index 1ee6d6d..85ffd4a 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb
@@ -1,6 +1,6 @@
 require gvfs.inc
 
-DEPENDS = "libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
+DEPENDS = "samba libsoup-2.4 gnome-keyring glib-2.0 fuse avahi fuse gconf libgphoto2"
 # optional: obexftp libcdio libimobiledevice 
 
 PR = "${INC_PR}.0"
-- 
1.7.4.4



