Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B931A65C9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2015 01:12:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96690679"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jun 2015 09:16:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t591Aag2022628
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Jun 2015 09:10:36 +0800
Received: from localhost.localdomain (10.167.226.47) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 9 Jun 2015 09:12:11 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Jun 2015 09:12:00 +0800
Message-ID: <1433812320-1835-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.47]
Subject: [meta-oe][PATCH] lvm2: add systemd support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2015 01:12:12 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index e116629..34fec99 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -36,13 +36,21 @@ PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '',
 
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${B}/scripts/lvm2_monitoring_systemd_red_hat.service ${D}${systemd_unitdir}/system/lvm2-monitor.service
+    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.socket ${D}${systemd_unitdir}/system/dm-event.socket
+    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.service ${D}${systemd_unitdir}/system/dm-event.service
 }
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
-- 
1.8.4.2


