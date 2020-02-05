Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by mail.openembedded.org (Postfix) with ESMTP id E2BA660F62
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 04:24:04 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B91A31C0004;
	Wed,  5 Feb 2020 04:24:04 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Feb 2020 20:23:08 -0800
Message-Id: <20200205042309.3555549-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205042309.3555549-1-robert.joslyn@redrectangle.org>
References: <20200205042309.3555549-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/4] iwd: Use manpages class to control documentation
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
X-List-Received-Date: Wed, 05 Feb 2020 04:24:05 -0000
Content-Transfer-Encoding: 8bit

This class allows the api-documentation distro feature to control man
page generation. Remove copying all .txt files from ${S}/doc since these
are developer documents and wouldn't be of any use to users on the
target device.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.4.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
index cfced50a0..9d63e5b73 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Wireless daemon for Linux"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-inherit autotools pkgconfig systemd python3native
+inherit autotools manpages pkgconfig systemd python3native
 
 DEPENDS = "ell"
 
@@ -16,12 +16,11 @@ S = "${WORKDIR}/git"
 PACKAGECONFIG ??= " \
     client \
     monitor \
-    manual-pages \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor"
-PACKAGECONFIG[manual-pages] = "--enable-manual-pages,--disable-manual-pages,python3-docutils-native"
+PACKAGECONFIG[manpages] = "--enable-manual-pages,--disable-manual-pages,python3-docutils-native"
 PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
 PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
@@ -33,8 +32,6 @@ do_configure_prepend () {
 }
 
 do_install_append() {
-    mkdir --parents ${D}${docdir}/${BPN}
-    install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
     # If client and monitor are disabled, bindir is empty, causing a QA error
     rmdir --ignore-fail-on-non-empty ${D}/${bindir}
 }
-- 
2.24.1


