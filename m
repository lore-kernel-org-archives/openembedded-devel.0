Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95C3B7E558
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 02:31:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,394,1557158400"; d="scan'208";a="68121271"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jun 2019 10:31:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 65D884CDDB0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:31:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Jun 2019 10:31:37 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Jun 2019 08:42:24 +0800
Message-ID: <1559868144-38423-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 65D884CDDB0E.AC186
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][patch v4] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 20 Jun 2019 02:31:30 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

This dnf plugin aim to supply a tui interface for user to manage
packages. It has features as following:
  1. Add new command dnf tui --init to make dnf to work on host.
  2. Text-based user interface for dnf.
  3. Manage SPDX files.
  4. Manage SRPM files.
  5. Add installation samples for dnf.

More details please refer to https://github.com/ubinux/dnf-plugin-tui.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dnf-plugin-tui/dnf-plugin-tui_git.bb           | 38 ++++++++++++++++++++++
 .../dnf-plugin-tui/files/oe-remote.repo.sample     |  5 +++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
 create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.sample

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
new file mode 100644
index 0000000..e891868
--- /dev/null
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "A text-based user interface plugin of dnf for user to manage packages. "
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master "
+SRCREV = "31d6866d5eda02be9a6bfb1fca9e9095b12eecd1"
+PV = "1.0"
+
+SRC_URI_append_class-target = "file://oe-remote.repo.sample"
+
+inherit distutils3-base
+
+S = "${WORKDIR}/git"
+
+do_install_append() {
+        install -d ${D}${datadir}/dnf
+        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
+        install -m 0755 ${S}/dnf-plugins/mkimg/* ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
+        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
+            install -m 0755 ${S}/dnf-plugins/$file ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
+        done
+}
+
+do_install_append_class-target() {
+        install -d ${D}${sysconfdir}/yum.repos.d
+        install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconfdir}/yum.repos.d
+}
+
+FILES_${PN} += "${datadir}/dnf"
+
+RDEPENDS_${PN} += " \
+  dnf \
+  libnewt-python \
+  "
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.sample b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.sample
new file mode 100644
index 0000000..6c4502e
--- /dev/null
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.sample
@@ -0,0 +1,5 @@
+[base]
+name=myrepo
+baseurl=http://127.0.0.1/oe_repo/
+enabled=1
+gpgcheck=0
-- 
2.7.4




