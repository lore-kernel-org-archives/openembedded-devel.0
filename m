Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDF7D65C9D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:22:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97731672"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 13:26:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P5KS2n004488
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 13:20:29 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 13:22:05 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 13:12:56 +0800
Message-ID: <1435209176-19663-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH] zabbix: add new recipe
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
X-List-Received-Date: Thu, 25 Jun 2015 05:22:10 -0000
Content-Type: text/plain

zabbix is an open-source monitoring solution for your IT infrastructure.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../zabbix/zabbix/0001-Fix-configure.ac.patch      | 23 +++++++
 .../zabbix/zabbix/zabbix-agent.service             | 12 ++++
 .../recipes-connectivity/zabbix/zabbix_2.4.5.bb    | 70 ++++++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
new file mode 100644
index 0000000..af14a1a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
@@ -0,0 +1,23 @@
+uname can not get version of kernel correctly while cross compile
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 523899b..4e6ae0d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -924,7 +924,7 @@ AC_MSG_RESULT([$ARCH ($host_os)])
+ if test "x$ARCH" = "xlinux"; then
+ 	AC_MSG_CHECKING([for the linux kernel version])
+ 
+-	kernel=`uname -r`
++	kernel="${KERNEL_VERSION}"
+ 
+ 	case "${kernel}" in
+ 		2.6.*)
+-- 
+1.8.3.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service b/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
new file mode 100644
index 0000000..b18a96f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/zabbix-agent.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Zabbix Monitor Agent
+After=syslog.target network.target
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/zabbix_agentd
+RemainAfterExit=yes
+User=zabbix
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
new file mode 100644
index 0000000..35c7d64
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.5.bb
@@ -0,0 +1,70 @@
+SUMMARY = "Open-source monitoring solution for your IT infrastructure"
+DESCRIPTION = "\
+ZABBIX is software that monitors numerous parameters of a network and the \
+health and integrity of servers. ZABBIX uses a flexible notification \
+mechanism that allows users to configure e-mail based alerts for virtually \
+any event. This allows a fast reaction to server problems. ZABBIX offers \
+excellent reporting and data visualisation features based on the stored \
+data. This makes ZABBIX ideal for capacity planning. \
+\
+ZABBIX supports both polling and trapping. All ZABBIX reports and \
+statistics, as well as configuration parameters are accessed through a \
+web-based front end. A web-based front end ensures that the status of \
+your network and the health of your servers can be assessed from any \
+location. Properly configured, ZABBIX can play an important role in \
+monitoring IT infrastructure. This is equally true for small \
+organisations with a few servers and for large companies with a \
+multitude of servers."
+HOMEPAGE = "http://www.zabbix.com/"
+SECTION = "Applications/Internet"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
+DEPENDS  = "openldap virtual/libiconv"
+
+SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-Fix-configure.ac.patch \
+           file://zabbix-agent.service"
+
+SRC_URI[md5sum] = "a82eb0d55d3ca947e10a4a55238f4388"
+SRC_URI[sha256sum] = "4e2cf1e4893a45d83379a05e2debabddf16beab324c93e84adc0bb57716fb957"
+
+inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "zabbix-agent.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r zabbix"
+USERADD_PARAM_${PN} = "-r -g zabbix -d /var/lib/zabbix \
+                       -s /sbin/nologin -c \"Zabbix Monitoring System\" zabbix"
+
+KERNEL_VERSION = "${@get_kernelversion_headers('${STAGING_KERNEL_DIR}')}"
+
+EXTRA_OECONF = '--enable-dependency-tracking \
+	        --enable-agent \
+	        --enable-ipv6 \
+	        --with-net-snmp \
+	        --with-ldap=${STAGING_EXECPREFIXDIR} \
+	        --with-jabber \
+	        --with-unixodbc \
+	        --with-ssh2 \
+	        --with-sqlite3 \
+	        '
+CFLAGS_append += "-lldap -llber"
+
+do_configure_prepend() {
+    export KERNEL_VERSION="${KERNEL_VERSION}"
+}
+
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/zabbix-agent.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/zabbix-agent.service
+    fi
+}
+
+FILES_${PN} += "${libdir}"
+
+RDEPENDS_${PN} = "logrotate"
-- 
1.8.4.2


