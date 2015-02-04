Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B3E83601DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 18:40:27 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rd18so4218018iec.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=TJSiv0bZDiXc9bDDjMzgWA/sOxfCbATXXIMvIOz0G5Y=;
	b=YNTTSr2bsf0BooAxsHMJIb54nX5WE5iqwWwRXTXW3TQ34i7v2lKx7VXKPZQBBp0aMG
	/IDM0oBXSEIeFO60SvNG5S60jppYsovA5mFyTTUq6U8goGRTivfSZXWHnu9VqYuvrBZz
	+GxryN53s9wOh6XtNyaevILrH+M8OUfSDxINxMiAzdabDstjV8+lT/MwpEb6o5mSUaJE
	Jd8r0JuXxyjZRGrW4so0sP4jshA8mGnhcwJNmRVLwUvfi931jG1BEIhfX3BMZ7UAYWkr
	Cy5XUn3Tu99/mIEg8ZO7j1YJCsjbc43R5XEwgRyPAPh/AoIwKuuy/+tD12HzarZzq3pb
	qPCw==
X-Received: by 10.50.254.4 with SMTP id ae4mr3847780igd.10.1423075228791;
	Wed, 04 Feb 2015 10:40:28 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id aw9sm1484008igc.18.2015.02.04.10.40.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 10:40:28 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 12:40:27 -0600
Message-Id: <1423075227-24769-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-gnome][PATCH 4/5] gdm: Only start in runlevel 5
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
X-List-Received-Date: Wed, 04 Feb 2015 18:40:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Runlevel 5 is traditionally graphical. If it starts in runlevel 2
or 3 systemd gets confused and adds it as a dependency of the
multi-user target, not just the graphical target.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-gnome/recipes-gnome/gdm/gdm/gdm       | 4 ++--
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
index 43eae95..bb5b418 100755
--- a/meta-gnome/recipes-gnome/gdm/gdm/gdm
+++ b/meta-gnome/recipes-gnome/gdm/gdm/gdm
@@ -4,8 +4,8 @@
 # Should-Start:      console-screen acpid dbus hal network-manager
 # Required-Start:    $local_fs $remote_fs
 # Required-Stop:     $local_fs $remote_fs
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
+# Default-Start:     5
+# Default-Stop:      0 1 2 3 6
 # Short-Description: GNOME Display Manager
 # Description:       Debian init script for the GNOME Display Manager
 ### END INIT INFO
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index b2ae9ac..fcd51ff 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -88,7 +88,7 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "gdm.service"
 
 INITSCRIPT_NAME = "gdm"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 99 5 . stop 20 0 1 2 3 6 ."
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
-- 
2.1.0


From 4dbe8a0bc32d09ea82726d78cfd1292a3a6b3719 Mon Sep 17 00:00:00 2001
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 3 Feb 2015 18:46:42 -0600
Subject: [meta-initramfs][PATCH 5/5] dracut: recipe cleanup
To: openembedded-devel@lists.openembedded.org

From: Dan McGregor <dan.mcgregor@usask.ca>

Split out bash-completion data
Update RDEPENDS: getopt is util-linux-getopt now
Use distro_features_check to require systemd
Recommend busybox

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../recipes-devtools/dracut/dracut_git.bb          | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index ea55a4d..8ef0749 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the t
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PACKAGES =+ "${PN}-bash-completion"
+
 PE = "1"
 PV = "038"
 
@@ -13,8 +15,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
 
-do_configure() {
-    ./configure --prefix=${prefix} \
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECONF = "--prefix=${prefix} \
                 --libdir=${libdir} \
                 --datadir=${datadir} \
                 --sysconfdir=${sysconfdir} \
@@ -23,20 +27,29 @@ do_configure() {
                 --bindir=${bindir} \
                 --includedir=${includedir} \
                 --localstatedir=${localstatedir} \
+                --systemdsystemunitdir=${systemd_unitdir}/system"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${datadir}/bash-completion \ 
-                ${libdir}/kernel \
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
+
+FILES_${PN} += " ${libdir}/kernel \
+                ${systemd_unitdir} \
                "
+CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
+
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}-bash-completion = "bash-completion"
 
-# 'getopt' is in the util-linux main package
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux bash ldd"
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
+                     busybox \
                      coreutils \ 
                     "
-- 
2.1.0


