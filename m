Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7F03A6C010
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 11:51:46 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r86Bpiek016623; 
	Fri, 6 Sep 2013 06:51:46 -0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2013 16:52:58 +0500
Message-Id: <1378468378-16789-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] tracker: Do not use hardcoded paths in systemd service files
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
X-List-Received-Date: Fri, 06 Sep 2013 11:51:47 -0000

- 'sed' base_bindir and libexecdir in service files to align these
with a particular distro
- Fix whitespaces

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../tracker/files/tracker-dbus.service             |    2 +-
 .../tracker/files/tracker-miner-fs.service         |    2 +-
 .../tracker/files/tracker-store.service            |    2 +-
 meta-oe/recipes-support/tracker/tracker_0.14.2.bb  |   19 +++++++++++--------
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-support/tracker/files/tracker-dbus.service b/meta-oe/recipes-support/tracker/files/tracker-dbus.service
index 9d4fb74..c97f49a 100644
--- a/meta-oe/recipes-support/tracker/files/tracker-dbus.service
+++ b/meta-oe/recipes-support/tracker/files/tracker-dbus.service
@@ -8,7 +8,7 @@ BindTo=tracker-store.service
 [Service]
 Type=forking
 EnvironmentFile=-/tmp/tracker.env
-ExecStartPre=/bin/rm -rf /tmp/tracker.env
+ExecStartPre=@BASE_BINDIR@/rm -rf /tmp/tracker.env
 ExecStart=/bin/sh -c 'echo "DBUS_SESSION_BUS_ADDRESS=`dbus-daemon --fork --session --print-address`" > /tmp/tracker.env'
 
 [Install]
diff --git a/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service b/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
index f143924..34d9a1e 100644
--- a/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
+++ b/meta-oe/recipes-support/tracker/files/tracker-miner-fs.service
@@ -6,7 +6,7 @@ Requires=tracker-store.service
 [Service]
 Environment=HOME=/home/root
 EnvironmentFile=-/tmp/tracker.env
-ExecStart=/usr/libexec/tracker-miner-fs
+ExecStart=@LIBEXECDIR@/tracker-miner-fs
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/tracker/files/tracker-store.service b/meta-oe/recipes-support/tracker/files/tracker-store.service
index 7ca9ff0..c5037f3 100644
--- a/meta-oe/recipes-support/tracker/files/tracker-store.service
+++ b/meta-oe/recipes-support/tracker/files/tracker-store.service
@@ -6,7 +6,7 @@ BindTo=tracker-dbus.service
 
 [Service]
 EnvironmentFile=-/tmp/tracker.env
-ExecStart=/usr/libexec/tracker-store
+ExecStart=@LIBEXECDIR@/tracker-store
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
index 5838c2d..d6febbf 100644
--- a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
@@ -13,7 +13,7 @@ VER_DIR = "${@gnome_verdir("${PV}")}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
            file://0005-Fix-missing-gobject-introspection-checks.patch \
            file://enable-sqlite-crosscompile.patch \
-	   file://fix-removable-media-detection.patch \
+           file://fix-removable-media-detection.patch \
            file://90tracker \
            file://tracker-store.service \
            file://tracker-miner-fs.service \
@@ -32,14 +32,17 @@ EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
 LEAD_SONAME = "libtrackerclient.so.0"
 
 do_install_append() {
-   cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
-#  install -d ${D}/${sysconfdir}/X11/Xsession.d/
-#  install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
+	cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
+	#  install -d ${D}/${sysconfdir}/X11/Xsession.d/
+	#  install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
+		-e 's,@BASE_BINDIR@,${base_bindir},g' \
+		${D}${systemd_unitdir}/system/*.service
 }
 
 PACKAGES =+ "${PN}-tests ${PN}-vala ${PN}-nautilus-extension"
-- 
1.7.9.5


