Return-Path: <fahad.usman@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A89B9619E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 08:29:22 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ey16so3140364wid.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 01:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=OjKunwKUr4cUCRke+4XC80NjB+6XIYRqAbPfFywz1Qo=;
	b=0+bl+GP/eLlOo6B/g1MgG4lqUaShQUhHpjOPOrzb5LkUfzlTRWvhWg/ahFg+hWpH84
	u/UWvtTrJ9jUuU+VNi6U23SQCmnmBWmKHo/kgnwHn16eHd7VJDAO+qZFMyrDTSs11xMK
	Idfu/evE1KH7ZtsDkL4mF25yLQKPG2/lcU2xG4MFAjrclmySCwM45Um6b8bGj3ye7Wi9
	a997MlFXI6UY1b/TKNObQGNO6GMRMwaGLtWQc+FO+Ei42cu6H6GxDY+ue5OVIOYyy0kx
	dQIXb0kBmzQC21CQ0OhK4saZ8nVHPBRSsYwKwe0zu2C+w7KgA3x3r/KkoCAg7wfRrmOf
	wscQ==
X-Received: by 10.180.86.38 with SMTP id m6mr6946108wiz.25.1371544163433;
	Tue, 18 Jun 2013 01:29:23 -0700 (PDT)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id x13sm389205wib.3.2013.06.18.01.29.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 01:29:22 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 13:29:07 +0500
Message-Id: <1371544147-10662-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH] tracker: add new recipe
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
X-List-Received-Date: Tue, 18 Jun 2013 08:29:23 -0000

- copy tracker recipe from meta-guacamayo layer to meta-oe
- package files that were not being shipped
- add systemd suppert for tracker

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta-oe/recipes-support/tracker/files/90tracker    |  4 ++
 .../tracker/files/tracker-dbus.service             | 15 +++++
 .../tracker/files/tracker-miner-fs.service         | 12 ++++
 .../tracker/files/tracker-store.service            | 12 ++++
 ...-Fix-missing-gobject-introspection-checks.patch | 17 ++++++
 .../enable-sqlite-crosscompile.patch               | 13 ++++
 .../fix-removable-media-detection.patch            | 30 ++++++++++
 meta-oe/recipes-support/tracker/tracker_0.14.2.bb  | 70 ++++++++++++++++++++++
 8 files changed, 173 insertions(+)
 create mode 100644 meta-oe/recipes-support/tracker/files/90tracker
 create mode 100644 meta-oe/recipes-support/tracker/files/tracker-dbus.service
 create mode 100644 meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
 create mode 100644 meta-oe/recipes-support/tracker/files/tracker-store.service
 create mode 100644 meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
 create mode 100644 meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
 create mode 100644 meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
 create mode 100644 meta-oe/recipes-support/tracker/tracker_0.14.2.bb

diff --git a/meta-oe/recipes-support/tracker/files/90tracker b/meta-oe/recipes-support/tracker/files/90tracker
new file mode 100644
index 0000000..9594b91
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/files/90tracker
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+/usr/bin/trackerd -m &
+
diff --git a/meta-oe/recipes-support/tracker/files/tracker-dbus.service b/meta-oe/recipes-support/tracker/files/tracker-dbus.service
new file mode 100644
index 0000000..9d4fb74
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/files/tracker-dbus.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=tracker DBus session bus handler
+Before=tracker-store.service
+After=dbus.service
+Requires=dbus.service
+BindTo=tracker-store.service
+
+[Service]
+Type=forking
+EnvironmentFile=-/tmp/tracker.env
+ExecStartPre=/bin/rm -rf /tmp/tracker.env
+ExecStart=/bin/sh -c 'echo "DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --fork --session --print-address`" > /tmp/tracker.env'
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service b/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
new file mode 100644
index 0000000..f143924
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=tracker-miner-fs
+After=syslog.target local-fs.target udev.service dbus.service tracker-store.service
+Requires=tracker-store.service
+
+[Service]
+Environment=HOME=/home/root
+EnvironmentFile=-/tmp/tracker.env
+ExecStart=/usr/libexec/tracker-miner-fs
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/tracker/files/tracker-store.service b/meta-oe/recipes-support/tracker/files/tracker-store.service
new file mode 100644
index 0000000..7ca9ff0
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/files/tracker-store.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=tracker-store
+After=syslog.target local-fs.target dbus.service
+Requires=dbus.service tracker-dbus.service
+BindTo=tracker-dbus.service
+
+[Service]
+EnvironmentFile=-/tmp/tracker.env
+ExecStart=/usr/libexec/tracker-store
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch b/meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
new file mode 100644
index 0000000..8701f58
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/tracker-0.14.2/0005-Fix-missing-gobject-introspection-checks.patch
@@ -0,0 +1,17 @@
+diff -Naur ../tracker-0.10.8/configure.ac tracker-0.10.8//configure.ac
+--- ../tracker-0.10.8/configure.ac	2011-04-08 15:03:30.000000000 +0300
++++ tracker-0.10.8//configure.ac	2011-04-11 13:47:16.625914002 +0300
+@@ -218,7 +218,12 @@
+ 
+ # Needed to generate .gir files,
+ # see http://live.gnome.org/GnomeGoals/AddGObjectIntrospectionSupport
+-GOBJECT_INTROSPECTION_CHECK([0.9.5])
++#GOBJECT_INTROSPECTION_CHECK([0.9.5])
++# Satisfy missing introspection foo
++AM_CONDITIONAL(HAVE_INTROSPECTION, test "0" == "1")
++
++INTROSPECTION_CFLAGS=""
++AC_SUBST(INTROSPECTION_CFLAGS)
+ 
+ # NOTE: dbus and dbus-glib-1 are only used now for libtracker-client
+ # which is deprecated and tracker-writeback which will be refactored
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch b/meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
new file mode 100644
index 0000000..5dadda2
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/tracker-0.14.2/enable-sqlite-crosscompile.patch
@@ -0,0 +1,13 @@
+Index: tracker-0.10.17/m4/sqlite-threadsafe.m4
+===================================================================
+--- tracker-0.10.17.orig/m4/sqlite-threadsafe.m4
++++ tracker-0.10.17/m4/sqlite-threadsafe.m4
+@@ -45,7 +45,7 @@ int main ()
+   ]])],
+        [ax_cv_sqlite_threadsafe=yes],
+        [ax_cv_sqlite_threadsafe=no],
+-       [ax_cv_sqlite_threadsafe=no])])
++       [ax_cv_sqlite_threadsafe=yes])])
+ 
+   LIBS="$save_LIBS"
+ ])
diff --git a/meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch b/meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
new file mode 100644
index 0000000..6c3d9de
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/tracker-0.14.2/fix-removable-media-detection.patch
@@ -0,0 +1,30 @@
+Index: tracker-0.14.2/src/libtracker-miner/tracker-storage.c
+===================================================================
+--- tracker-0.14.2.orig/src/libtracker-miner/tracker-storage.c	2011-08-03 13:53:16.000000000 +0100
++++ tracker-0.14.2/src/libtracker-miner/tracker-storage.c	2012-09-10 08:25:18.322215126 +0100
+@@ -20,6 +20,7 @@
+ #include "config.h"
+ 
+ #include <string.h>
++#include <sys/stat.h>
+ 
+ #include <gio/gio.h>
+ #include <gio/gunixmounts.h>
+@@ -646,6 +647,17 @@
+ 				gchar *content_type;
+ 				gboolean is_multimedia;
+ 				gboolean is_blank;
++                                struct stat st;
++
++                                /*
++                                 * Consider all files under /media to be
++                                 * removable unless the file .this-is-root is
++                                 * present.
++                                 */
++                                if (!strncmp (mount_path, "/media/",
++                                              strlen ("/media/")) &&
++                                    stat ("/media/.this-is-root", &st))
++                                  is_removable = TRUE;
+ 
+ 				content_type = mount_guess_content_type (mount, &is_optical, &is_multimedia, &is_blank);
+ 
diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
new file mode 100644
index 0000000..5838c2d
--- /dev/null
+++ b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
@@ -0,0 +1,70 @@
+DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
+DEPENDS = "file gstreamer gamin dbus libexif gettext sqlite3 icu"
+RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
+HOMEPAGE = "http://projects.gnome.org/tracker/"
+
+PR = "r7"
+
+inherit autotools pkgconfig gnome gettext gsettings systemd
+
+VER_DIR = "${@gnome_verdir("${PV}")}"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
+           file://0005-Fix-missing-gobject-introspection-checks.patch \
+           file://enable-sqlite-crosscompile.patch \
+	   file://fix-removable-media-detection.patch \
+           file://90tracker \
+           file://tracker-store.service \
+           file://tracker-miner-fs.service \
+           file://tracker-dbus.service \
+           "
+
+SYSTEMD_SERVICE_${PN} = " tracker-store.service tracker-miner-fs.service tracker-dbus.service "
+SYSTEMD_AUTO_ENABLE = "disable"
+
+EXTRA_OECONF += " tracker_cv_have_ioprio=yes --disable-introspection"
+
+# Disable the desktop-centric miners
+EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
+                 --disable-miner-evolution --disable-miner-flickr"
+
+LEAD_SONAME = "libtrackerclient.so.0"
+
+do_install_append() {
+   cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
+#  install -d ${D}/${sysconfdir}/X11/Xsession.d/
+#  install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
+}
+
+PACKAGES =+ "${PN}-tests ${PN}-vala ${PN}-nautilus-extension"
+
+FILES_${PN} += "${datadir}/dbus-1/ \
+                ${libdir}/tracker-${VER_DIR}/*.so.* \
+                ${libdir}/tracker-${VER_DIR}/extract-modules/*.so \
+                ${datadir}/icons/hicolor/*/apps/tracker.* \
+                ${libdir}/nautilus/extensions-2.0/*.la \
+                ${datadir}/glib-2.0/schemas/* \
+                ${systemd_unitdir}/system/tracker-store.service \
+                ${systemd_unitdir}/system/tracker-miner-fs.service \
+                ${systemd_unitdir}/system/tracker-dbus.service \
+"
+
+FILES_${PN}-dev += "${libdir}/tracker-${VER_DIR}/*.la \
+                    ${libdir}/tracker-${VER_DIR}/*.so \
+                    ${libdir}/tracker-${VER_DIR}/extract-modules/*.la"
+
+FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
+FILES_${PN}-dbg += "${libdir}/*/*/.debug \
+                    ${libdir}/*/.debug"
+FILES_${PN}-tests = "${datadir}/tracker-tests/"
+FILES_${PN}-vala = "${datadir}/vala/"
+FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
+
+SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
+SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
-- 
1.8.2.3


