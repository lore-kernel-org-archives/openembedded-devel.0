Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S4thn-0006EH-R0
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 13:41:27 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 13:32:44 +0100
Message-Id: <1331037164-11657-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH v3] udev: consolekit package requires x11
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
X-List-Received-Date: Tue, 06 Mar 2012 12:41:27 -0000

* consolekit fails to build without x11, so drop the
  runtime dependency on consolekit if x11 is unavailable.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v1->v2: Instead of removing the package, drop the runtime
        dependency on consolekit.
v2->v3: Bump PRs.

 meta-oe/recipes-core/udev/udev_173.bb |    4 ++--
 meta-oe/recipes-core/udev/udev_175.bb |    4 +++-
 meta-oe/recipes-core/udev/udev_181.bb |    4 +++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index e4e634a..5c5ce26 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
-PR = "r2"
+PR = "r3"
 
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
@@ -81,7 +81,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
  
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 do_install () {
 	install -d ${D}${usrsbindir} \
diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
index b6484d9..e14dde2 100644
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ b/meta-oe/recipes-core/udev/udev_175.bb
@@ -18,6 +18,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 # Needed for udev-extras
 DEPENDS = "gperf-native usbutils acl glib-2.0"
 
+PR = "r1"
+
 # 6f410b81aa6d588b03ae795c9b76468591ef7efa -> 175 tag
 SRCREV = "6f410b81aa6d588b03ae795c9b76468591ef7efa"
 
@@ -77,7 +79,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
  
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 do_install () {
 	install -d ${D}${usrsbindir} \
diff --git a/meta-oe/recipes-core/udev/udev_181.bb b/meta-oe/recipes-core/udev/udev_181.bb
index 1e0a02a..9ca91bf 100644
--- a/meta-oe/recipes-core/udev/udev_181.bb
+++ b/meta-oe/recipes-core/udev/udev_181.bb
@@ -19,6 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 # kmod: needed for libkmod
 DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
 
+PR = "r1"
+
 # version specific SRC_URI
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
            file://gtk-doc.make"
@@ -73,7 +75,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-- 
1.7.5.4



