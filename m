Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Shcly-0000L5-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:29:50 +0200
Received: by bkcjm2 with SMTP id jm2so249893bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W+MuMC/XAcnDepRzvHOoF7nJkSxdHF8WoMfXPC5u10M=;
	b=TYexE1ZoPlTSVF4qYYk2g194d42crpspW+ut2Vdne56sy7mkHOZsjJZxARaKQRi8XB
	OuXA9oAzJCoaVi9VJ8cQUFhSliT6/QxdTsoqaIgnWpmugsr+VOSti32u66XoaRavGSL+
	fNbNEqrLEmgNBKrMnhu6uyxVNBS7YAbJnniQejhb46kzkZYXgbokpDywfGzwQ6QsO189
	fUuxMfcEXddD3q3Hg5tR7wnEVJtHWBzgGVAKPiR2P1lAQb78OVNA7CjChwDgTWXQ417i
	bnKT/43O/QlOkPyuc7/fWZzV8WAI3/eTHrKWv8NyRxWa+rl6HF7qjFzUb351OzHtscFY
	k+UA==
Received: by 10.205.133.7 with SMTP id hw7mr11503147bkc.123.1340266744706;
	Thu, 21 Jun 2012 01:19:04 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	fw10sm30870991bkc.11.2012.06.21.01.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:19:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:45 +0200
Message-Id: <41447e05fd0f4a1ffcba42b036928fd759116092.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/5] gpsd: override gpsd.service to use GPS_DEVICES from /etc/default/gpsd
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
X-List-Received-Date: Thu, 21 Jun 2012 08:29:50 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Without that fix gpsd starts without using the machine specific
  gps serial port.

On some devices like the GTA04, not only that makes GPS not work,
  but that also prevent suspend because GPS has to be off in order
  for suspend to succeed(and the program powering off the GPS
  has to know if the GPS is on or off by using gpsd).

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service |   10 ++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb       |    5 +++--
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb       |    5 +++--
 3 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
new file mode 100644
index 0000000..7131a58
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=GPS (Global Positioning System) Daemon
+Requires=gpsd.socket
+
+[Service]
+EnvironmentFile=/etc/default/gpsd
+ExecStart=/usr/sbin/gpsd -N $GPS_DEVICES
+
+[Install]
+Also=gpsd.socket
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 4f00cf4..ebc4af6 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
@@ -15,6 +15,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
+  file://gpsd.service \
   file://gpsd \
   file://60-gpsd.rules \
 "
@@ -83,7 +84,7 @@ do_install_append() {
 
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
     install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 60b30df..083163b 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
@@ -16,6 +16,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
+  file://gpsd.service \
   file://gpsd \
   file://60-gpsd.rules \
 "
@@ -84,7 +85,7 @@ do_install_append() {
 
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
     install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
-- 
1.7.8.6



