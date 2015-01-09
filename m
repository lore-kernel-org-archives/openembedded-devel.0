Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3540A728CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 06:08:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55798099"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2015 14:04:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0967ksi020998
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jan 2015 14:07:46 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 9 Jan 2015 14:08:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jan 2015 14:07:32 +0800
Message-ID: <1420783653-18498-3-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420783653-18498-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1420783653-18498-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][V3 PATCH 2/3] corosync_2.3.4: add new recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 06:08:19 -0000
Content-Type: text/plain

The Corosync Cluster Engine and Application Programming Interfaces.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../recipes-extended/corosync/corosync_2.3.4.bb    | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-extended/corosync/corosync_2.3.4.bb

diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb b/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
new file mode 100644
index 0000000..b84257f
--- /dev/null
+++ b/meta-oe/recipes-extended/corosync/corosync_2.3.4.bb
@@ -0,0 +1,61 @@
+SUMMARY = "The Corosync Cluster Engine and Application Programming Interfaces"
+DESCRIPTION = "This package contains the Corosync Cluster Engine Executive, several default \
+APIs and libraries, default configuration files, and an init script."
+HOMEPAGE = "http://corosync.github.io/corosync/"
+
+SECTION = "base"
+
+inherit autotools pkgconfig systemd
+
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
+	   "
+
+SRC_URI[md5sum] = "4b0f36a1dc014527e5b192265dbd7e70"
+SRC_URI[sha256sum] = "3dae93fb1cf5c560295253b0560cbc25421ed053ee373852864f3a60c03247d4"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
+
+DEPENDS = "groff-native nss libqb"
+
+SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_NAME = "corosync-daemon"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_unitdir}/system/,--with-systemddir="
+
+EXTRA_OECONF = "--disable-nss \
+                --with-upstartdir=%{_sysconfdir}/init \
+"
+EXTRA_OECONF += " --enable-nss "
+
+do_configure_prepend() {
+    ( cd ${S}
+    ${S}/autogen.sh )
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/sysconfig/
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
+    install -m 0644 ${S}/init/corosync-notifyd.conf.in ${D}${sysconfdir}/sysconfig/corosync-notifyd.conf
+    install -m 0644 ${S}/init/corosync.conf.in ${D}${sysconfdir}/sysconfig/corosync.conf
+    install -m 0644 ${S}/init/corosync.in ${D}${sysconfdir}/init.d/corosync
+    install -m 0644 ${S}/init/corosync-notifyd.in ${D}${sysconfdir}/init.d/corosync-notifyd
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${S}/init/corosync.service.in ${D}${systemd_unitdir}/system/corosync.service
+        install -m 0644 ${S}/init/corosync-notifyd.service.in ${D}${systemd_unitdir}/system/corosync-notifyd.service
+        sed -i -e 's,@INITWRAPPERSDIR@,${sysconfdir}/init.d,g' ${D}${systemd_unitdir}/system/corosync.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
+        sed -i -e 's,@SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
+    fi	
+}
+
+RDEPENDS_${PN} += "bash"
+
+FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
-- 
1.8.4.2


