Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 362DC72B51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 06:08:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55798101"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2015 14:04:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0967mkP021004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jan 2015 14:07:48 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 9 Jan 2015 14:08:26 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jan 2015 14:07:33 +0800
Message-ID: <1420783653-18498-4-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1420783653-18498-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1420783653-18498-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][V3 PATCH 3/3] dlm: add a new recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 06:08:21 -0000
Content-Type: text/plain

The kernel dlm requires a user daemon to control membership.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlm/dlm_4.0.2.bb

diff --git a/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
new file mode 100644
index 0000000..0de707e
--- /dev/null
+++ b/meta-oe/recipes-extended/dlm/dlm_4.0.2.bb
@@ -0,0 +1,49 @@
+DESCRIPTION = "dlm control daemon and tool"
+
+SECTION = "utils"
+HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SRC_URI = "https://git.fedorahosted.org/cgit/dlm.git/snapshot/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "efc2ee6093aa6aa0a88aaad83e998a3f"
+SRC_URI[sha256sum] = "b89bc557aaffbab0ac005398025f247718a5589cff6574d902eaffe2b20e683e"
+
+LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
+
+DEPENDS = "corosync systemd"
+
+inherit pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "dlm.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+export EXTRA_OEMAKE = ""
+
+do_compile_prepend() {
+    sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
+}
+
+do_compile () {
+    oe_runmake 'CC=${CC}'
+}
+
+do_install_append (){
+    install -d ${D}${sysconfdir}/sysconfig/
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0644 ${S}/init/dlm.sysconfig ${D}${sysconfdir}/sysconfig/dlm
+    install -m 0644 ${S}/init/dlm.init ${D}${sysconfdir}/init.d/dlm
+
+    # install systemd unit files
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${S}/init/dlm.service ${D}${systemd_unitdir}/system
+    fi
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D} LIBDIR=${libdir}
+}
+
-- 
1.8.4.2


