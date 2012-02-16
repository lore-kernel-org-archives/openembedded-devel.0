Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Rxqzz-0000b3-SG
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:23:07 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:06:55 +0100
Message-Id: <1329358015-31996-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] busybox: create /etc/default on do_install
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
X-List-Received-Date: Thu, 16 Feb 2012 02:23:08 -0000

* Currently, it's blindly assumed that /etc/default
  exists, when busybox-syslog gets copied into it.
  This only works by chance and only if CONFIG_HWCLOCK=y
  is set.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
index 7e72a43..98b959f 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -13,6 +13,7 @@ SYSTEMD_PACKAGES = "${PN}-syslog-systemd"
 SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
 
 do_install_append() {
+	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 
 	install -d ${D}${base_libdir}/systemd/system
-- 
1.7.5.4



