Return-Path: <robert.joslyn@redrectangle.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 25CB060707
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 21:47:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 46B383A8D47
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 21:21:54 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5C64F1BF203;
	Fri, 31 Jan 2020 21:21:52 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2020 13:20:57 -0800
Message-Id: <20200131212057.1856967-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131212057.1856967-1-robert.joslyn@redrectangle.org>
References: <20200131212057.1856967-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] iwd: Update formatting
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
X-List-Received-Date: Fri, 31 Jan 2020 21:47:02 -0000
Content-Transfer-Encoding: 8bit

Try to conform better to the style guide.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.4.bb | 35 +++++++++++++--------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
index a023c0d28..b32656595 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
@@ -1,17 +1,19 @@
-DESCRIPTION = "Wireless daemon for Linux"
+SUMMARY = "Wireless daemon for Linux"
+HOMEPAGE = "https://iwd.wiki.kernel.org/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-inherit autotools pkgconfig systemd python3native
-
 DEPENDS = "ell"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
-           file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
-          "
+SRC_URI = " \
+    git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+    file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
+"
 SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
 S = "${WORKDIR}/git"
 
+inherit autotools pkgconfig systemd python3native
+
 PACKAGECONFIG ??= " \
     client \
     monitor \
@@ -25,22 +27,29 @@ PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
 PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
 
-EXTRA_OECONF += "--enable-external-ell"
+EXTRA_OECONF = "--enable-external-ell"
 
-do_configure_prepend () {
-    mkdir -p ${S}/build-aux
+SYSTEMD_SERVICE_${PN} = " \
+    iwd.service \
+    ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)} \
+"
+
+do_configure_prepend() {
+    install -d ${S}/build-aux
 }
 
 do_install_append() {
-    mkdir --parents ${D}${docdir}/${BPN}
+    install -d ${D}${docdir}/${BPN}
     install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
     # If client and monitor are disabled, bindir is empty, causing a QA error
     rmdir --ignore-fail-on-non-empty ${D}/${bindir}
 }
 
-FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d ${systemd_unitdir}/network/"
-
-SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${nonarch_libdir}/modules-load.d \
+    ${systemd_unitdir}/network \
+"
 
 RDEPENDS_${PN} = "dbus"
 
-- 
2.24.1


