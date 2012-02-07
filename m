Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqw-0001JM-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:06 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=lq7LCUcSgMqm8HEAxaqJ3ysOVb6FSJSvlAi05WQbkOc=;
	b=VAl34xyEgMAlhB0KQww/TCDXx+L38eMuUCHzOQTo+omVPOSOijblnhd3U/ct6ljTzU
	P1guZRc41kAV+WE9l5rnOQTm/0EWLpz9/FbNJ7uoHgcS5r5AcwVwPWCBIY9jge3UiOnz
	32i1+E0YVwBSCD3LU34HkykQVMNiKNlBM0Fag=
Received: by 10.213.22.2 with SMTP id l2mr2144883ebb.97.1328627585998;
	Tue, 07 Feb 2012 07:13:05 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:39 +0100
Message-Id: <1328627573-5217-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 13/27] gdm: inherit systemd / remove unneeded systemd code
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
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb |   32 ++++-----------------------
 1 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 9be65b3..fd6eee3 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r5"
+PR = "r6"
 
-inherit gnome update-rc.d
+inherit gnome update-rc.d systemd
 
 SRC_URI += " \
             file://cross-xdetection.diff \
@@ -45,31 +45,6 @@ do_install_append() {
 
 	install -d ${D}/${sysconfdir}/gdm/Init
 	install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/gdm.service ${D}${base_libdir}/systemd/system/ 
-}
-
-PACKAGES =+ "gdm-systemd"
-FILES_gdm-systemd = "${base_libdir}/systemd"
-RDEPENDS_gdm-systemd = "gdm"
-
-pkg_postinst_gdm-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	
-	systemctl enable gdm.service
-}
-
-pkg_postrm_gdm-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	systemctl disable gdm.service
 }
 
 FILES_${PN} += "${datadir}/icon* \
@@ -84,6 +59,9 @@ RRECOMMENDS_${PN} += "openssh-misc desktop-file-utils glib-2.0-utils metacity gn
 INITSCRIPT_NAME = "gdm"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "gdm.service"
+
 pkg_postinst_${PN} () {
     # can't do this offline
     if [ "x$D" != "x" ]; then
-- 
1.7.6.4



