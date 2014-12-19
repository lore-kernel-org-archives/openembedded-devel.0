Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 39954728AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 03:35:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45482699"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Dec 2014 11:31:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBJ3YnQV014265
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:34:49 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Dec 2014 11:35:15 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Dec 2014 11:35:06 +0800
Message-ID: <1418960106-9080-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] ctapi-common: Add new recipe
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
X-List-Received-Date: Fri, 19 Dec 2014 03:35:15 -0000
Content-Type: text/plain

ctapi-common provides common files and packaging infrastructure
for CT-API modules.
Port from fedora 20.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../ctapi-common/ctapi-common_1.1-11.bb            | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb
new file mode 100644
index 0000000..a3b67f7
--- /dev/null
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Common files and packaging infrastructure for CT-API modules"
+HOMEPAGE = "http://fedoraproject.org/"
+SECTION = "System Environment/Libraries"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
+
+SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/20/Fedora/source/SRPMS/c/${BPN}-${PV}.fc20.src.rpm;extract=ctapi-common.LICENSE \
+           http://ftp.riken.jp/Linux/fedora/releases/20/Fedora/source/SRPMS/c/${BPN}-${PV}.fc20.src.rpm;extract=ctapi-common.README"
+SRC_URI[md5sum] = "f02e67487c48319376800563a2659502"
+SRC_URI[sha256sum] = "32399819b0a1cac1abb2b8f0f180c572c93809faad36c46825dd536e4844c7cf"
+
+do_compile() {
+    install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
+    install -pm 644 ${WORKDIR}/ctapi-common.README README
+    echo ${libdir}/ctapi > ctapi.conf
+}
+
+do_install() {
+    install -Dpm 644 ctapi.conf ${D}${sysconfdir}/ld.so.conf.d/ctapi-${TARGET_ARCH}.conf
+    install -dm 755 ${D}${libdir}/ctapi
+}
+
+FILES_${PN} += "${libdir}/ctapi"
-- 
1.8.3.1


