Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E46870101
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:30:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I2Uchs017607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 19:30:41 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 19:30:36 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 10:28:12 +0800
Message-ID: <1468808893-5752-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
References: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] liberation-sans-narrow: add a ttf font
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
X-List-Received-Date: Mon, 18 Jul 2016 02:30:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add an extra ttf font liberation-sans-narrow for X.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../30-0-liberation-sans-narrow.conf               | 18 ++++++++++++
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 32 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
new file mode 100644
index 0000000..a4f4da7
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow/30-0-liberation-sans-narrow.conf
@@ -0,0 +1,18 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
+<fontconfig>
+         <!-- Microsoft -->
+        <alias binding="same">
+          <family>Arial Narrow</family>
+            <accept>
+              <family>Liberation Sans Narrow</family>
+            </accept>
+        </alias>
+        <alias binding="same">
+          <family>Liberation Sans Narrow</family>
+            <default>
+              <family>Arial Narrow</family>
+            </default>
+        </alias>
+</fontconfig>
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
new file mode 100644
index 0000000..f36cf4b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -0,0 +1,32 @@
+require ttf.inc
+
+SUMMARY = "Liberation(tm) Fonts"
+DESCRIPTION = "The Liberation(tm) Fonts is a font family originally \
+created by Ascender(c) which aims at metric compatibility with \
+Arial, Times New Roman, Courier New."
+
+HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+           file://30-0-liberation-sans-narrow.conf \
+"
+
+SRC_URI[md5sum] = "134d8262145fc793c6af494dcace3e71"
+SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
+
+S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
+
+do_install_append () {
+    install -d ${D}${datadir}/fonts/TTF/
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 LiberationSansNarrow*.ttf ${D}${datadir}/fonts/TTF/
+    install -D -m 0644 ${WORKDIR}/30-0-liberation-sans-narrow.conf ${D}${sysconfdir}/conf.avail/30-${PN}-sans.conf
+    install -D -m 0644 ${S}/License.txt ${D}${datadir}/licenses/${PN}/LICENSE
+}
+
+PACKAGES = "${PN}"
+FONT_PACKAGES = "${PN}"
+
+FILES_${PN} = "${datadir}/fonts ${sysconfdir} ${datadir}/licenses"
-- 
2.6.1


