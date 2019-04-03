Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 52C847CFE9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:07:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,303,1549900800"; d="scan'208";a="58357990"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Apr 2019 13:07:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 298EF4CD7914
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:07:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 3 Apr 2019 13:07:52 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Apr 2019 22:07:39 +0800
Message-ID: <1554300459-3158-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 298EF4CD7914.A7883
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][patch] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Wed, 03 Apr 2019 05:07:46 -0000
Content-Type: text/plain

A new recipe for dnf-plugin called tui.
This plugin can work in nativesdk environment, and provide some additional functions:
 1. Add new command dnf tui --init to make dnf to work on host
 2. Text-based user interface for dnf.
 3. Manage SPDX files
 4. Manage SRPM files
 5. Add installation samples for dnf

More details, please reference to https://github.com/ubinux/dnf-plugin-tui/tree/master.

In addition, modify some nativesdk recipes to include dnf-plugin-tui in meta-toolchain.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-core/meta/meta-environment.bbappend    |  3 +++
 .../nativesdk-packagegroup-sdk-host.bbappend       |  2 ++
 .../recipes-devtools/dnf-plugin-tui/dnf_%.bbappend | 29 ++++++++++++++++++++++
 .../dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb     | 29 ++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-core/meta/meta-environment.bbappend
 create mode 100644 meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
 create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
 create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb

diff --git a/meta-oe/recipes-core/meta/meta-environment.bbappend b/meta-oe/recipes-core/meta/meta-environment.bbappend
new file mode 100644
index 0000000..2ac268f
--- /dev/null
+++ b/meta-oe/recipes-core/meta/meta-environment.bbappend
@@ -0,0 +1,3 @@
+create_sdk_files_append() {
+    echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
+}
diff --git a/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
new file mode 100644
index 0000000..9f85825
--- /dev/null
+++ b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bbappend
@@ -0,0 +1,2 @@
+RDEPENDS_${PN}_append = " nativesdk-dnf-plugin-tui \ 
+                          nativesdk-createrepo-c"
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
new file mode 100644
index 0000000..ce683e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
@@ -0,0 +1,29 @@
+RDEPENDS_${PN}_class-nativesdk += " \
+  python3-core \
+  python3-codecs \
+  python3-netclient \
+  python3-email \
+  python3-threading \
+  python3-distutils \
+  python3-logging \
+  python3-fcntl \
+  librepo \
+  python3-shell \
+  libcomps \
+  libdnf \
+  python3-sqlite3 \
+  python3-compression \
+  python3-rpm \
+  python3-iniparse \
+  python3-json \
+  python3-curses \
+  python3-misc \
+  python3-gpg \
+  libnewt-python \
+  "
+
+do_install_append_class-nativesdk() {
+        create_wrapper ${D}/${bindir}/dnf \
+                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+                RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
new file mode 100644
index 0000000..4fbbac8
--- /dev/null
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
@@ -0,0 +1,29 @@
+SUMMARY = "A text-based user interface plugin for dnf, used in toolchian environment"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master "
+
+SRCREV = "a743116fa78a20f9828533c1de79ad8e4ab2d16c"
+
+inherit nativesdk distutils3-base
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += " \
+  nativesdk-dnf \
+  nativesdk-libnewt-python \
+  "
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
+FILES_${PN} += "${datadir}/dnf"
-- 
2.7.4




