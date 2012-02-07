Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr1-0001KV-MF
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:12 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955924eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NyT1s7XvY0Rc/gaKD5NprOFibFQVvX0ME7Chw3523n4=;
	b=ApaVSHDla41ePmt/Q87XPN4jSMcPAljf33vdMXv7VhN0AlKCbGAMpXOIcxM5KcbwZ6
	M1DgjxpI2hdCgkkLRYJj2LdlXYuQRhtW7zeWJaoJeXdNeGbpIcmy6MGIHAciSbxtPAGY
	fIDOcBgLYJbjkSj18Y+TWthC8723UvwzTXuqA=
Received: by 10.213.25.146 with SMTP id z18mr3720549ebb.65.1328627591544;
	Tue, 07 Feb 2012 07:13:11 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:43 +0100
Message-Id: <1328627573-5217-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 17/27] udisks: conditional DEPENDS systemd / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 55b115e..cddd7ca 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 ${@base_conditional('INIT_MANAGER', 'systemd', 'systemd', '', d)}"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools systemd
 
@@ -21,11 +21,6 @@ SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
 
 EXTRA_OECONF = "--disable-man-pages"
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd/system/"
-RDEPENDS_${PN}-systemd = "${PN}"
-
 FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
                 ${datadir}/dbus-1/ \
                 ${datadir}/polkit-1 \
@@ -33,5 +28,3 @@ FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
 "
 
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-
-
-- 
1.7.6.4



