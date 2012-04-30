Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkL5-0004jm-Tn
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:03 +0200
Received: by wgbdr1 with SMTP id dr1so2078332wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TQ/S1uZ5lum1jLBjXDVcM6TAP/R7teil+AHWUA0xDXY=;
	b=gSC4ULyWLOujQ71sk73vKvRU8s14rICsLvp6I+u5wnxdoy2S4otVrsVDrHIOcrpuaW
	97O+leXxvJFdec98W97F7Q5e83Aj0WbzaZRjucr+asnpZr3a/NT8RLidoefcSrtKgsR7
	saawkYw1uUWICe6XynpJAsbKlZAQrapWXTa+eMbLPSHqCwMHy97QbsxmyHGs53M5hSGN
	A4htIoFehKD0Hwvcnu9XBOnpYADp+valemRnNNPpDhDuDdONFQkDC3piSwR5iFEnV3v/
	pxkRKnrysyur1AI9tRZl/l2oIVoBjB4ivoUr7NalXgt2VjjtjDrDTvlUmvAEJZn8SdpW
	p9jw==
Received: by 10.180.83.38 with SMTP id n6mr7244913wiy.1.1335767662631;
	Sun, 29 Apr 2012 23:34:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm41892619wib.6.2012.04.29.23.34.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:05 +0200
Message-Id: <c09342fd6cc4644eb8114bdd2f004856c8546d50.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/16] gpsd: use gpsd.service and gpsd.socket from source tree, drop local files
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service |    9 ---------
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket  |    9 ---------
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb       |    7 +++++--
 3 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
deleted file mode 100644
index 8deaf75..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=GPS (Global Positioning System) Daemon
-Requires=gpsd.socket
-
-[Service]
-ExecStart=/usr/sbin/gpsd -N
-
-[Install]
-Also=gpsd.socket
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket
deleted file mode 100644
index 13c17f2..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.socket
+++ /dev/null
@@ -1,9 +0,0 @@
-[Unit]
-Description=GPS (Global Positioning System) Daemon Sockets
-
-[Socket]
-ListenStream=/var/run/gpsd.sock
-ListenStream=127.0.0.1:2947
-
-[Install]
-WantedBy=sockets.target
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 37fb79d..d139091 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -11,8 +11,6 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
   file://gpsd-default \
   file://gpsd \
-  file://gpsd.socket \
-  file://gpsd.service \
   file://60-gpsd.rules \
 "
 SRC_URI[md5sum] = "c01353459faa68834309109d4e868460"
@@ -72,6 +70,11 @@ do_install_append() {
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
-- 
1.7.8.6



