Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 36F3565D34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 06:32:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45158901"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2014 14:29:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBF6Vxc9010389
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 14:32:00 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Dec 2014 14:32:24 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Dec 2014 14:29:00 +0800
Message-ID: <1418624940-54397-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] openvpn: upgrade to 2.3.6.
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
X-List-Received-Date: Mon, 15 Dec 2014 06:32:32 -0000
Content-Type: text/plain

The purpose of this patch as below.

 1. upgrade openvpn to 2.3.6 in order to fix CVE-2014-8104

 2. enable systemd

 3. provide new packages named ${PN}-sample to help user create config file
    easily and check whether is openvpn work.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../openvpn/openvpn/openvpn@.service               | 12 +++++
 .../recipes-support/openvpn/openvpn_2.3.4.bb       | 33 ------------
 .../recipes-support/openvpn/openvpn_2.3.6.bb       | 63 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 33 deletions(-)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service b/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
new file mode 100644
index 0000000..358dcb7
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn@.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=OpenVPN Robust And Highly Flexible Tunneling Application On %I
+After=syslog.target network.target
+
+[Service]
+PrivateTmp=true
+Type=forking
+PIDFile=/var/run/openvpn/%i.pid
+ExecStart=/usr/sbin/openvpn --daemon --writepid /var/run/openvpn/%i.pid --cd /etc/openvpn/ --config %i.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
deleted file mode 100644
index 1fb722a..0000000
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.4.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "A full-featured SSL VPN solution via tun device."
-HOMEPAGE = "http://openvpn.sourceforge.net"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
-DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-inherit autotools
-
-SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
-           file://openvpn"
-
-SRC_URI[md5sum] = "04d47237907faabe9d046970ffe44b2e"
-SRC_URI[sha256sum] = "af506d5f48568fa8d2f2435cb3fad35f9a9a8f263999ea6df3ba296960cec85a"
-
-CFLAGS += "-fno-inline"
-
-# I want openvpn to be able to read password from file (hrw)
-EXTRA_OECONF += "--enable-password-save --enable-iproute2"
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
-
-# Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
-EXTRA_OECONF += "IPROUTE=/sbin/ip"
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -d ${D}/${sysconfdir}/openvpn
-    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
-}
-
-RRECOMMENDS_${PN} = "kernel-module-tun"
-
-FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
new file mode 100644
index 0000000..58ddcc8
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.3.6.bb
@@ -0,0 +1,63 @@
+SUMMARY = "A full-featured SSL VPN solution via tun device."
+HOMEPAGE = "http://openvpn.sourceforge.net"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
+DEPENDS = "lzo openssl iproute2 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+inherit autotools systemd
+
+SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
+           file://openvpn \
+           file://openvpn@.service "
+
+SRC_URI[md5sum] = "6ca03fe0fd093e0d01601abee808835c"
+SRC_URI[sha256sum] = "7baed2ff39c12e1a1a289ec0b46fcc49ff094ca58b8d8d5f29b36ac649ee5b26"
+
+SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+CFLAGS += "-fno-inline"
+
+# I want openvpn to be able to read password from file (hrw)
+EXTRA_OECONF += "--enable-password-save --enable-iproute2"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
+
+# Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
+EXTRA_OECONF += "IPROUTE=/sbin/ip"
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/openvpn ${D}/${sysconfdir}/init.d
+
+    install -d ${D}/${sysconfdir}/openvpn
+    install -d ${D}/${sysconfdir}/openvpn/sample
+    install -m 755 ${S}/sample/sample-config-files/loopback-server  ${D}${sysconfdir}/openvpn/sample/loopback-server.conf
+    install -m 755 ${S}/sample/sample-config-files/loopback-client  ${D}${sysconfdir}/openvpn/sample/loopback-client.conf
+    install -dm 755 ${D}${sysconfdir}/openvpn/sample/sample-keys
+    install -m 644 ${S}/sample/sample-keys/* ${D}${sysconfdir}/openvpn/sample/sample-keys
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system/openvpn@loopback-server.service
+        install -m 644 ${WORKDIR}/openvpn@.service ${D}/${systemd_unitdir}/system/openvpn@loopback-client.service
+
+        install -d ${D}/${localstatedir}
+        install -d ${D}/${localstatedir}/lib
+        install -d -m 710 ${D}/${localstatedir}/lib/openvpn
+        install -d -m 755 ${D}/${localstatedir}/run/
+        install -d -m 755 ${D}/${localstatedir}/run/openvpn
+    fi
+}
+
+PACKAGES =+ " ${PN}-sample "
+
+RRECOMMENDS_${PN} = "kernel-module-tun"
+
+FILES_${PN}-dbg += "${libdir}/openvpn/plugins/.debug"
+FILES_${PN} += "${systemd_unitdir}/system/openvpn@.service \
+                /run"
+FILES_${PN}-sample += "${systemd_unitdir}/system/openvpn@loopback-server.service \
+                       ${systemd_unitdir}/system/openvpn@loopback-client.service \
+                       ${sysconfdir}/openvpn/sample/"
-- 
1.9.1


