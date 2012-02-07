Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr1-0001JN-MM
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:12 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181069eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ctOGOxLqO3vI4ljIdDaOYy6MWyDnV5tsFpCmhJKBE0U=;
	b=bnlqP9o6DI9MXbAuDZTuoVF3dqcQBOTpi8oLpib7YNwFd3lizHMR/CPq/jQTORi5Qc
	4deONV0E4L+tghPYLrlqlyCAftbs0M0XkSVKzq/athIu2KGEyMhMtUtkjZuEbNAaeqfn
	LHnwH2DgJAsKl60T2Jlvw28rDPMAeqVfBQdCA=
Received: by 10.213.15.17 with SMTP id i17mr3723523eba.103.1328627589743;
	Tue, 07 Feb 2012 07:13:09 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:42 +0100
Message-Id: <1328627573-5217-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 16/27] slim: inherit systemd / remove unneeded systemd code
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
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
index 90f9939..eaec13a 100644
--- a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
+++ b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE="http://slim.berlios.de"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -26,6 +26,9 @@ SRC_URI = " \
 SRC_URI[md5sum] = "ca1ae6120e6f4b4969f2d6cf94f47b42"
 SRC_URI[sha256sum] = "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72dbd482b8"
 
+inherit systemd
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "slim.service"
 
 EXTRA_OEMAKE += " \
   USE_PAM=${@base_contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
@@ -58,14 +61,11 @@ do_install() {
 
 
 RDEPENDS_${PN} = "perl xauth freetype sessreg "
-FILES_${PN} += "${base_libdir}/systemd/system/"
 
 pkg_postinst_${PN} () {
 if test "x$D" != "x"; then
 	exit 1
 fi
-systemctl enable slim.service
-
 # Register SLiM as default DM
 mkdir -p ${sysconfdir}/X11/
 echo "${bindir}/slim" > ${sysconfdir}/X11/default-display-manager
@@ -75,7 +75,6 @@ pkg_postrm_${PN} () {
 if test "x$D" != "x"; then
 	exit 1
 fi
-systemctl disable slim.service
 sed -i /slim/d $D${sysconfdir}/X11/default-display-manager || true
 }
 
-- 
1.7.6.4



