Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 228A67282F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 08:03:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56320910"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2015 15:59:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0K82XK3008471
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:02:33 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 20 Jan 2015 16:03:15 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Jan 2015 16:02:18 +0800
Message-ID: <1421740939-2630-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421740939-2630-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <20141218115025.GA2462@jama>
	<1421740939-2630-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH 1/2] system-config-keyboard: add new recipe
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
X-List-Received-Date: Tue, 20 Jan 2015 08:03:11 -0000
Content-Type: text/plain

a graphical user interface that allows the user to
change the default keyboard of the system.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../system-config-keyboard_1.4.0.bb                | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb

diff --git a/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
new file mode 100644
index 0000000..eaca96d
--- /dev/null
+++ b/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "a graphical user interface that allows the user to \
+change the default keyboard of the system"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRC_URI = "https://fedorahosted.org/releases/s/y/${BPN}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "c267db0ee7a2131ba418399dc17f9e72"
+SRC_URI[sha256sum] = "218c883e4e2bfcc82bfe07e785707b5c2ece28df772f2155fd044b9bb1614284"
+inherit python-dir
+DEPENDS = "intltool"
+
+EXTRA_OEMAKE = " \
+    PYTHON='${STAGING_BINDIR_NATIVE}'/python-native/python \
+    PYTHON_SITELIB=${PYTHON_SITEPACKAGES_DIR} \
+"
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+do_install_append_class-native() {
+    rm -rf ${D}/usr
+}
+
+FILES_${PN} += " \
+   ${libdir}/python${PYTHON_BASEVERSION}/* \
+   ${datadir}/* \
+"
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


