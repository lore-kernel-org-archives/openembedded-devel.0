Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rv76I-0007lS-Hl
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:58:18 +0100
Received: by werc1 with SMTP id c1so338098wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:50:15 -0800 (PST)
Received: by 10.180.89.67 with SMTP id bm3mr40891709wib.13.1328705415399;
	Wed, 08 Feb 2012 04:50:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q2sm39520873wiy.7.2012.02.08.04.50.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:50:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2012 13:50:04 +0100
Message-Id: <1328705404-24406-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] systemd: split out libraries from ${PN}
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
X-List-Received-Date: Wed, 08 Feb 2012 12:58:18 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index c1a0117..4c458bd 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r15"
+PR = "r16"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -59,6 +59,11 @@ do_install() {
 	ln -s ${base_bindir}/systemd ${D}/init
 }
 
+python populate_packages_prepend (){
+	systemdlibdir = d.getVar("base_libdir", True)
+	do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
 
 USERADD_PACKAGES = "${PN}"
@@ -79,7 +84,7 @@ FILES_${PN}-vconsole-setup = "${base_libdir}/systemd/systemd-vconsole-setup \
 
 RRECOMMENDS_$PN}-vconsole-setup = "kbd kbd-consolefonts"
 
-FILES_${PN} += " ${base_bindir}/* \
+FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
                 ${datadir}/polkit-1 \
@@ -93,6 +98,11 @@ FILES_${PN} += " ${base_bindir}/* \
                 ${bindir}/systemd* \
                 ${libdir}/tmpfiles.d/*.conf \
                 ${libdir}/systemd \
+                ${libdir}/binfmt.d \
+                ${libdir}/modules-load.d \
+                ${libdir}/sysctl.d \
+                ${localstatedir} \
+                ${libexecdir} \
                "
 
 FILES_${PN}-dbg += "${base_libdir}/systemd/.debug ${base_libdir}/systemd/*/.debug ${base_libdir}/security/.debug/"
-- 
1.7.2.5



