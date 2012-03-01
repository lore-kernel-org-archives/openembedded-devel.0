Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S358P-0004zW-QS
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 13:29:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2012 13:20:40 +0100
Message-Id: <1330604440-8121-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330604440-8121-1-git-send-email-obi@opendreambox.org>
References: <1330604440-8121-1-git-send-email-obi@opendreambox.org>
Subject: [meta-oe][PATCH 2/2][resend] udev: consolekit package requires x11
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
X-List-Received-Date: Thu, 01 Mar 2012 12:29:25 -0000

* consolekit fails to build without x11, so disable
  creation of udev-consolekit, if x11 is unavailable.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 meta-oe/recipes-core/udev/udev_175.bb |    2 +-
 meta-oe/recipes-core/udev/udev_181.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index e4e634a..cbbe910 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -59,7 +59,7 @@ do_configure_prepend() {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
index b6484d9..6560b5d 100644
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ b/meta-oe/recipes-core/udev/udev_175.bb
@@ -55,7 +55,7 @@ do_configure_prepend() {
 	cp ${WORKDIR}/gtk-doc.make ${S}
 }
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
+PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
diff --git a/meta-oe/recipes-core/udev/udev_181.bb b/meta-oe/recipes-core/udev/udev_181.bb
index 1e0a02a..99b66b1 100644
--- a/meta-oe/recipes-core/udev/udev_181.bb
+++ b/meta-oe/recipes-core/udev/udev_181.bb
@@ -54,7 +54,7 @@ do_configure_prepend() {
 	cp ${WORKDIR}/gtk-doc.make ${S}
 }
 
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
+PACKAGES =+ "${PN}-systemd libudev libgudev ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)} udev-utils"
 
 FILES_${PN}-systemd = "${base_libdir}/systemd"
 RDEPENDS_${PN}-systemd += "udev"
-- 
1.7.5.4



