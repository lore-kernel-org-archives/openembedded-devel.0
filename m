Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 82FD97D2E9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:09:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 121023A5163
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 16:17:52 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 18BFC20002;
	Sun, 14 Apr 2019 16:17:50 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Apr 2019 09:17:25 -0700
Message-Id: <20190414161725.21617-5-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] gpm: Recipe cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2019 18:09:46 -0000
Content-Transfer-Encoding: 8bit

* Add SUMMARY and HOMEPAGE
* Remove unnecessary FILES line, as the specified directory does not
  exist
* Remove unnecessary conditional placement of init script and systemd
  unit file. The update-rc.d and systemd classes handle packaging of
  these files.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index b64f05c57..7034d3385 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -1,6 +1,8 @@
+SUMMARY = "Console mouse driver"
 DESCRIPTION = "GPM (General Purpose Mouse) is a mouse server \
 for the console and xterm, with sample clients included \
 (emacs, etc)."
+HOMEPAGE = "https://www.nico.schottelius.org/software/gpm"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
@@ -29,17 +31,10 @@ do_configure_prepend() {
 }
 
 do_install_append () {
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        sed 's:@bindir@:${sbindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
-    fi
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-        install -D -m 0755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/gpm
-    fi
-    install -D -m 0644 ${S}/src/headers/gpm.h ${D}${includedir}/gpm.h
+    install -d ${D}${systemd_system_unitdir}
+    sed 's:@bindir@:${sbindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
+    install -D -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/gpm
     ln -s libgpm.so.2 ${D}${libdir}/libgpm.so
 }
 
 SYSTEMD_SERVICE_${PN} = "gpm.service"
-
-FILES_${PN} += "${datadir}/emacs"
-- 
2.21.0


