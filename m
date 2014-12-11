Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EFC6460232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 09:36:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44867149"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Dec 2014 17:33:12 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBB9a7w5024817
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 17:36:07 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 11 Dec 2014 17:36:39 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Dec 2014 17:36:20 +0800
Message-ID: <1418290580-389-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-networking][PATCH] lldpad: Add new recipe
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
X-List-Received-Date: Thu, 11 Dec 2014 09:36:39 -0000
Content-Type: text/plain

LLDPAD contains the Linux user space daemon and configuration tool for
Intel LLDP Agent with Enhanced Ethernet support for the Data Center.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb

diff --git a/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
new file mode 100644
index 0000000..4dad80d
--- /dev/null
+++ b/meta-networking/recipes-daemons/lldpad/lldpad_0.9.46.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Intel LLDP Agent"
+DESCRIPTION = "\
+This package contains the Linux user space daemon and configuration tool for \
+Intel LLDP Agent with Enhanced Ethernet support for the Data Center."
+SECTION = "System Environment/Daemons"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
+DEPENDS = "libconfig libnl"
+SRCREV = "48a5f38778b18d6659a672ccb4640f25c6720827"
+
+SRC_URI = "git://github.com/jrfastab/lldpad.git;protocol=http"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig systemd
+
+do_install_append () {
+    install -m 0755 -d ${D}${systemd_unitdir}
+    mv ${D}${prefix}${systemd_unitdir}/* ${D}${systemd_unitdir}/
+    rmdir ${D}${prefix}${systemd_unitdir}
+}
+
+FILES_${PN} += "${systemd_unitdir}"
-- 
1.8.3.1


