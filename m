Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 48C107DE74
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 12:28:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,456,1549900800"; d="scan'208";a="62508960"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2019 20:28:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E91544CD80EB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 May 2019 20:28:43 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 11 May 2019 20:28:47 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 May 2019 05:28:54 +0800
Message-ID: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: E91544CD80EB.A9794
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][patch v3] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Sat, 11 May 2019 12:28:46 -0000
Content-Type: text/plain

This dnf plugin aims to supply a tui interface for user to manage
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




