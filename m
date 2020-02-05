Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by mail.openembedded.org (Postfix) with ESMTP id 46C4660F62
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 04:24:00 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 14AB81C0004;
	Wed,  5 Feb 2020 04:24:00 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 20:23:07 -0800
Message-Id: <20200205042309.3555549-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205042309.3555549-1-robert.joslyn@redrectangle.org>
References: <20200205042309.3555549-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/4] iwd: Add PACKAGECONFIG options
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
X-List-Received-Date: Wed, 05 Feb 2020 04:24:01 -0000
Content-Transfer-Encoding: 8bit

Make it easier to disable optional client, monitor, and man page
components and their dependencies. A user may want to disable the client
to avoid the use of GPLv3 readline.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.4.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
index ed8f21ac1..cfced50a0 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 inherit autotools pkgconfig systemd python3native
 
-DEPENDS = "ell readline python3-docutils-native"
+DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
            file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
@@ -13,7 +13,15 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
 SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= " \
+    client \
+    monitor \
+    manual-pages \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
+PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor"
+PACKAGECONFIG[manual-pages] = "--enable-manual-pages,--disable-manual-pages,python3-docutils-native"
 PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
 PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
@@ -27,6 +35,8 @@ do_configure_prepend () {
 do_install_append() {
     mkdir --parents ${D}${docdir}/${BPN}
     install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
+    # If client and monitor are disabled, bindir is empty, causing a QA error
+    rmdir --ignore-fail-on-non-empty ${D}/${bindir}
 }
 
 FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d ${systemd_unitdir}/network/"
-- 
2.24.1


