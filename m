Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnk-000755-NS
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so912479eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1OFk+8XqFkZpIvYuKjk9pjCvGqGew3wtusku0RJoh3U=;
	b=Qnu+RFyyXd0m2PO9LmeHE+KFDWiNchMpyGDxKsM17uke35VtEPMQyFp2toN7PswyC6
	MYqF/sLB94rUfnJzw1bxNX9dhXW8wlrl1ypJw9QCJ7c9nesehGAsRr3FBcENkjJJ0l9l
	vMKTfRjPGfiNTMtmLLQFP5WdjtbDe61C5PH2g=
Received: by 10.14.10.40 with SMTP id 40mr2602912eeu.67.1327308915083;
	Mon, 23 Jan 2012 00:55:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r2sm51268518eef.7.2012.01.23.00.55.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:55:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:23 +0100
Message-Id: <fe09898ffa201f214fe5ae26c23ac206d54277ae.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 7/8] gpsd: add systemd support
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.service |    9 ++++++++
 .../recipes-navigation/gpsd/gpsd-2.96/gpsd.socket  |    9 ++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   22 +++++++++++++++++--
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
new file mode 100644
index 0000000..8deaf75
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=GPS (Global Positioning System) Daemon
+Requires=gpsd.socket
+
+[Service]
+ExecStart=/usr/sbin/gpsd -N
+
+[Install]
+Also=gpsd.socket
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket
new file mode 100644
index 0000000..13c17f2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket
@@ -0,0 +1,9 @@
+[Unit]
+Description=GPS (Global Positioning System) Daemon Sockets
+
+[Socket]
+ListenStream=/var/run/gpsd.sock
+ListenStream=127.0.0.1:2947
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index 69b26b3..ce2ab02 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
+PR = "r1"
+
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
                 --enable-dbus \
@@ -14,15 +16,21 @@ EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
 SRC_URI = "http://download.berlios.de/${PN}/${P}bis.tar.gz;name=gpsd \
            file://gpsd-default \
            file://gpsd \
+           file://gpsd.socket \
+           file://gpsd.service \
            file://60-gpsd.rules"
 SRC_URI[gpsd.md5sum] = "52b00cab0fb34bbf1923ae35c7ced6c4"
 SRC_URI[gpsd.sha256sum] = "c6d72565bc06b802c749e69808eb7c6ee165962dc17383971c9001b5e1763690"
 
-inherit autotools update-rc.d python-dir
+inherit autotools update-rc.d python-dir systemd
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+
+
 LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -60,6 +68,11 @@ do_install_append() {
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+
+    #support for systemd
+    install -d ${D}${base_libdir}/systemd/system
+    install -m 644 ${WORKDIR}/${PN}.socket ${D}${base_libdir}/systemd/system
+    install -m 644 ${WORKDIR}/${PN}.service ${D}${base_libdir}/systemd/system
 }
 
 pkg_postinst_${PN}-conf() {
@@ -70,7 +83,7 @@ pkg_postrm_${PN}-conf() {
 	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
 }
 
-PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils ${PN}-systemd"
 
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
@@ -78,7 +91,7 @@ RDEPENDS_${PN} = "gpsd-gpsctl"
 RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
 
 DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
-FILES_gpsd-udev = "${base_libdir}/* ${sysconfdir}/udev/*"
+FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
 RDEPENDS_gpsd-udev += "udev gpsd-conf"
 
 DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
@@ -100,3 +113,6 @@ RDEPENDS_gps-utils = "python-pygps"
 DESCRIPTION_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
+
+FILES_${PN}-systemd += "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.8.4



