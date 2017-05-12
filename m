Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E40766FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 07:09:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4C795f7012933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 May 2017 00:09:06 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 12 May 2017 00:09:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 May 2017 15:09:00 +0800
Message-ID: <776efa049cb76fca4b826bb5b6a066fd361f61cc.1494572274.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494572274.git.jackie.huang@windriver.com>
References: <cover.1494572274.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] keepalived: add new recipe
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
X-List-Received-Date: Fri, 12 May 2017 07:09:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

keepalived is a High Availability monitor built
upon LVS, VRRP and service pollers.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-daemons/keepalived/keepalived_1.3.5.bb | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb b/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
new file mode 100644
index 000000000..5e7e6e49f
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb
@@ -0,0 +1,49 @@
+SUMMARY = "High Availability monitor built upon LVS, VRRP and service pollers"
+DESCRIPTION = "Keepalived is a routing software written in C. The main goal \
+of this project is to provide simple and robust facilities for loadbalancing \
+and high-availability to Linux system and Linux based infrastructures. \
+Loadbalancing framework relies on well-known and widely used Linux Virtual \
+Server (IPVS) kernel module providing Layer4 loadbalancing \
+"
+HOMEPAGE = "http://www.keepalived.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "9964d295ec9d34ed3408b57d28847b68"
+SRC_URI[sha256sum] = "c0114d86ea4c896557beb0d9367819a423ffba772bc5d7c548dc455e6b3bd048"
+
+DEPENDS = "libnfnetlink openssl"
+
+inherit autotools pkgconfig systemd update-rc.d
+
+PACKAGECONFIG ??= "libnl snmp \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+PACKAGECONFIG[libnl] = "--enable-libnl,--disable-libnl,libnl"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
+PACKAGECONFIG[systemd] = "--with-init=systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--with-init=SYSV,systemd"
+
+EXTRA_OECONF = "--disable-libiptc"
+EXTRA_OEMAKE = "initdir=${sysconfdir}/init.d"
+
+do_install_append() {
+    if [ -f ${D}${sysconfdir}/init.d/${BPN} ]; then
+        chmod 0755 ${D}${sysconfdir}/init.d/${BPN}
+        sed -i 's#rc.d/##' ${D}${sysconfdir}/init.d/${BPN}
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0644 ${B}/${BPN}/${BPN}.service ${D}${systemd_system_unitdir}/${BPN}.service
+    fi
+}
+
+FILES_${PN} += "${datadir}/snmp/mibs/KEEPALIVED-MIB.txt"
+
+INITSCRIPT_NAME = "keepalived"
+INITSCRIPT_PARAMS = "remove"
+
+SYSTEMD_SERVICE_${PN} = "keepalived.service"
+SYSTEMD_AUTO_ENABLE ?= "disable"
-- 
2.11.0


