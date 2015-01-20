Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1FF427229E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 10:11:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56327943"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2015 18:07:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0KAAiah018712
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 18:10:45 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 20 Jan 2015 18:11:26 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jan 2015 18:10:42 +0800
Message-ID: <1421748642-2917-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CA+chaQd=UiZb+MLMDUsd20+Zw1Pz6SkKLBFFS77mcrC6g+OaGw@mail.gmail.com>
References: <CA+chaQd=UiZb+MLMDUsd20+Zw1Pz6SkKLBFFS77mcrC6g+OaGw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH v3] system-setup-keyboard: add new recipe
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
X-List-Received-Date: Tue, 20 Jan 2015 10:11:33 -0000
Content-Type: text/plain

system-setup-keyboard is a daemon to monitor the keyboard layout
configured in /etc/sysconfig/keyboard and transfer this into the
matching xorg.conf.d snippet.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../system-setup-keyboard_0.8.8.bb                 | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb

diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
new file mode 100644
index 0000000..8a80e11
--- /dev/null
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -0,0 +1,29 @@
+SUMMARY = "xorg.conf keyboard layout callout"
+DESCRIPTION = "system-setup-keyboard is a daemon to monitor the keyboard layout configured in \
+/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d snippet."
+
+HOMEPAGE = "https://git.fedorahosted.org/git/system-setup-keyboard.git"
+SECTION = "Applications/System"
+
+SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz"
+SRC_URI[md5sum] = "399003968ccc739cddd9cc370af377a0"
+SRC_URI[sha256sum] = "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2d6fc1b645abcb860"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bf57969a59612c5aca007b340c49d3a2"
+
+inherit pythonnative
+
+DEPENDS = "glib-2.0 system-config-keyboard-native"
+
+do_compile_prepend() {
+    ${PYTHON} -v get_layouts.py > keyboards.h
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+    install -d ${D}/etc/X11/xorg.conf.d
+    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
+}
+
+FILES_${PN} += "${systemd_unitdir}/system/${PN}.service"
-- 
1.8.4.2


