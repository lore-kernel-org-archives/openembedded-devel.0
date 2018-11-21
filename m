Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5D26011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 08:18:41 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id E843A1C1AF3;
	Wed, 21 Nov 2018 09:11:07 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 09:10:12 +0100
Message-Id: <20181121081012.118414-3-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121081012.118414-1-martin@geanix.com>
References: <20181121081012.118414-1-martin@geanix.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] iwd: add version 0.12
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
X-List-Received-Date: Wed, 21 Nov 2018 08:18:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The iwd wireless daemon is an alternative to wpa_supplicant. It is
controlled using the iwctl command line client (or the dbus interface).

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
new file mode 100644
index 000000000..a4261547e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Wireless daemon for Linux"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+inherit autotools pkgconfig systemd
+
+DEPENDS = "ell readline dbus"
+
+SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
+SRCREV = "d7609915db4b57229f7dd4c04b4eabcce637872a"
+S = "${WORKDIR}/git"
+
+SYSTEMD_SERVICE_${PN} = "iwd.service"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
+
+EXTRA_OECONF += "--enable-external-ell"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
+
+FILES_${PN} += "${datadir}/dbus-1"
-- 
2.19.1


