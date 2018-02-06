Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id BB5817843C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 13:17:19 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w16DHJHj014099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Feb 2018 14:17:20 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.115])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w16DHJDJ003078;
	Tue, 6 Feb 2018 14:17:19 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 98A88131855F;
	Tue,  6 Feb 2018 14:17:19 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Feb 2018 14:17:09 +0100
Message-Id: <20180206131709.11374-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] miniupnpd: update to 2.0.20180203 and add systemd service
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
X-List-Received-Date: Tue, 06 Feb 2018 13:17:20 -0000

license checksum changed due to increase in copyright year

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../miniupnpd/files/miniupnpd.service                    | 14 ++++++++++++++
 .../{miniupnpd_2.0.bb => miniupnpd_2.0.20180203.bb}      | 16 +++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/miniupnpd/files/miniupnpd.service
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.0.bb => miniupnpd_2.0.20180203.bb} (72%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/files/miniupnpd.service b/meta-networking/recipes-connectivity/miniupnpd/files/miniupnpd.service
new file mode 100644
index 000000000..e7bfad0a9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/miniupnpd/files/miniupnpd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Lightweight UPnP IGD daemon
+Documentation=man:miniupnpd(8)
+After=network.target
+
+[Service]
+Type=forking
+ExecStartPre=/etc/miniupnpd/iptables_init.sh
+ExecStart=/usr/sbin/miniupnpd -f /etc/miniupnpd/miniupnpd.conf
+ExecStopPost=/etc/miniupnpd/iptables_removeall.sh
+PIDFile=/run/miniupnpd.pid
+
+[Install]
+WantedBy=network.target
diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb
similarity index 72%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb
index c6f36e137..04b5cd589 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb
@@ -5,16 +5,17 @@ the network."
 
 SECTION = "networking"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aa71c78c373ccfe0ff207af0cd966d91"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91ac00c6b9f5c106e89291e196fe0234"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig systemd
 
 DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
-"
-SRC_URI[md5sum] = "1c07a215dd9b362e75a9efc05e2fb3b4"
-SRC_URI[sha256sum] = "d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
+           file://miniupnpd.service"
+
+SRC_URI[md5sum] = "b4c7c938915edeee6ca4c65dd021f212"
+SRC_URI[sha256sum] = "860c15f2f8340fd69546b01cffe4c7fcff3e63a7bdfe5a2af6b2346f0e074bb6"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
@@ -34,4 +35,9 @@ do_install() {
     install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
     install -d ${D}/${sysconfdir}/init.d
     install ${S}/linux/miniupnpd.init.d.script ${D}/${sysconfdir}/init.d/miniupnpd
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/miniupnpd.service ${D}${systemd_unitdir}/system/
 }
+
+SYSTEMD_SERVICE_${PN} = "miniupnpd.service"
-- 
2.11.0


