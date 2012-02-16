Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm6-00063w-Pe
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:46 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so504564eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=brBJIM1xuMP6voPADVjOPt21PyvNb8dFUUtCUsRyV2k=;
	b=LaPcsGYu1cFzklEO+lxPuT45dL0KUfqE4/gYcRO3PuqMXynyjuHyFfXqrv0EHbRnzv
	VSAtso/1Vhc6zr+DmK9mzpr2moO+iEAlwYPRqWBsOBE6cvtVG1rquPcx3vFQzgluZ3p9
	y44AfsL7kCBxdYo3lZsk25LmD/F1/B6njo0ss=
Received: by 10.14.183.136 with SMTP id q8mr344038eem.60.1329357636649;
	Wed, 15 Feb 2012 18:00:36 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:13 +0100
Message-Id: <1329357796-27398-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 19/22] gpsd: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:46 -0000
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
1.7.4.4



