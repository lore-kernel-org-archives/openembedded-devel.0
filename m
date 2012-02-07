Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqu-0001JN-VX
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:05 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181069eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=vy2XE3jqGz0XF0nmkM4neIgm69vQJ2R3qJqIOyweVwA=;
	b=Xx43///A1LZP77qzQp390SO5HBJKlkx2w/QP7Yq91Y+xDxEB0rlOJbBvfTRSxtnesV
	E06zDvjHhU0yoVX166XUKNkiwaWZNQZ9cLK7yzv/Q2gMcHx4U0Nde4MHxSJidwzS5/6o
	Lo7TeNnjV6z0aQvpCWgfEguEXuGvoOw8Ntids=
Received: by 10.14.149.20 with SMTP id w20mr6372861eej.64.1328627584962;
	Tue, 07 Feb 2012 07:13:04 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:38 +0100
Message-Id: <1328627573-5217-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 12/27] gpsd: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index ce2ab02..927107a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
@@ -68,11 +68,6 @@ do_install_append() {
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
-
-    #support for systemd
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/${PN}.socket ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/${PN}.service ${D}${base_libdir}/systemd/system
 }
 
 pkg_postinst_${PN}-conf() {
@@ -83,7 +78,7 @@ pkg_postrm_${PN}-conf() {
 	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
 }
 
-PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils ${PN}-systemd"
+PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
@@ -113,6 +108,3 @@ RDEPENDS_gps-utils = "python-pygps"
 DESCRIPTION_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.6.4



