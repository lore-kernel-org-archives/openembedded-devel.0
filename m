Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26B3B7E554
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:15:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5PDEOTK030285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 06:14:45 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 06:14:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Jun 2019 21:14:07 +0800
Message-ID: <1561468448-24834-4-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
References: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] upower: remove polkit dependency
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
X-List-Received-Date: Tue, 25 Jun 2019 13:15:05 -0000
Content-Type: text/plain

Follow upstream upower:
https://gitlab.freedesktop.org/upower/upower/commit/9a2b2633095fb901fc1931ab0c600392d68bb3b4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/upower/upower_0.99.7.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb b/meta-oe/recipes-support/upower/upower_0.99.7.bb
index 3fd91e9..ffa2c49 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
+DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib"
 
 SRC_URI = " \
     http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
@@ -13,8 +13,6 @@ SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc1
 
 inherit autotools pkgconfig gettext gobject-introspection systemd distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "polkit"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
 PACKAGECONFIG[systemd] = "--with-systemdutildir=${systemd_unitdir} --with-systemdsystemunitdir=${systemd_system_unitdir}, \
@@ -34,6 +32,5 @@ do_configure_prepend() {
 RDEPENDS_${PN} += "dbus"
 RRECOMMENDS_${PN} += "pm-utils"
 FILES_${PN} += "${datadir}/dbus-1/ \
-                ${datadir}/polkit-1/ \
                 ${base_libdir}/udev/* \
 "
-- 
2.7.4


