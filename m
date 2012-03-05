Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S4gdu-00083h-68
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 23:44:34 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2012 23:35:57 +0100
Message-Id: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH v2] udev: consolekit package requires x11
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
X-List-Received-Date: Mon, 05 Mar 2012 22:44:34 -0000

* consolekit fails to build without x11, so drop the
  runtime dependency on consolekit if x11 is unavailable.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v1->v2: Instead of removing the package, drop the runtime
        dependency on consolekit.

 meta-oe/recipes-core/udev/udev_173.bb |    2 +-
 meta-oe/recipes-core/udev/udev_175.bb |    2 +-
 meta-oe/recipes-core/udev/udev_181.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
index e4e634a..a111f11 100644
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ b/meta-oe/recipes-core/udev/udev_173.bb
@@ -81,7 +81,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
  
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 do_install () {
 	install -d ${D}${usrsbindir} \
diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
index b6484d9..114dbe9 100644
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ b/meta-oe/recipes-core/udev/udev_175.bb
@@ -77,7 +77,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
  
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 do_install () {
 	install -d ${D}${usrsbindir} \
diff --git a/meta-oe/recipes-core/udev/udev_181.bb b/meta-oe/recipes-core/udev/udev_181.bb
index 1e0a02a..5e27706 100644
--- a/meta-oe/recipes-core/udev/udev_181.bb
+++ b/meta-oe/recipes-core/udev/udev_181.bb
@@ -73,7 +73,7 @@ FILES_${PN} += "/lib/udev*"
 FILES_${PN}-dbg += "/lib/udev/.debug"
 
 FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "consolekit"
+RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-- 
1.7.5.4



