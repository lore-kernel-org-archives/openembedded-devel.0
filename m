Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdv-0004lM-V8
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:09 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.47.4 as permitted sender) client-ip=10.14.47.4;
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.47.4 as permitted
	sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.47.4])
	by 10.14.47.4 with SMTP id s4mr731654eeb.21.1329999069004 (num_hops =
	1); Thu, 23 Feb 2012 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/nAgSoit9aYqUU0dVCPoBlPGAjE3IdZS/smDlpj4zNY=;
	b=JS/7A5Wnvs4kj7bbSsG/0mT0+sDXwy6txy+K8P6N8Q0teE6PVXOkO0+PjnmPMRtqr8
	QyArmATlUAk9JjXuieCYtx4N56P+zXxfSAzh9bBMK/g48o8KWh1/ECcFTZTzFfrFmu04
	kfOas447g/I9WgbYGQyiBSl4pMPa3eCgCxYN0=
Received: by 10.14.47.4 with SMTP id s4mr579595eeb.21.1329999068914;
	Thu, 23 Feb 2012 04:11:08 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:52 +0100
Message-Id: <1329999054-23112-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 21/23] gpsd: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
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



