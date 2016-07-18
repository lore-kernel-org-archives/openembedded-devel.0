Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D91660797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:30:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6I2Uh7I005813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 19:30:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 17 Jul 2016 19:30:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jul 2016 10:28:13 +0800
Message-ID: <1468808893-5752-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
References: <1468808893-5752-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ttf-vlgothic: add a ttf font
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
X-List-Received-Date: Mon, 18 Jul 2016 02:30:45 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add an extra ttf font vlgothic.

The font is derived from from M+ FONTS which is created by M+ FONTS
PROJECT and under the Free license. So it has to obey the mplus licence.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../ttf-fonts/ttf-vlgothic_20141206.bb             | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
new file mode 100644
index 0000000..62f2bb2
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20141206.bb
@@ -0,0 +1,28 @@
+require ttf.inc
+
+SUMMARY = "Japanese TrueType fonts from Vine Linux"
+AUTHOR = "Contributor: noonov <noonov@gmail.com>"
+HOMEPAGE = "http://vlgothic.dicey.org/"
+
+LICENSE = "mplus & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.en;md5=66ecd0fd7e4da6246fa30317c7b66755 \
+                    file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
+"
+
+SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "bb7fadb2dff09a4fb6a11dc9dfdc0c36"
+SRC_URI[sha256sum] = "982040db2f9cb73d7c6ab7d9d163f2ed46d1180f330c9ba2fae303649bf8102d"
+
+S = "${WORKDIR}/VLGothic"
+
+do_install_append () {
+    install -D -m644 ${S}/LICENSE_E.mplus ${D}${datadir}/licenses/${PN}/COPYING_MPLUS.txt
+    install -D -m644 ${S}/README.sazanami ${D}${datadir}/licenses/${PN}/COPYING_SAZANAMI.txt
+    install -D -m644 ${S}/LICENSE.en ${D}${datadir}/licenses/${PN}/COPYING_VLGOTHIC.txt
+}
+
+PACKAGES = "${PN}"
+FONT_PACKAGES = "${PN}"
+
+FILES_${PN} = "${datadir}/fonts/truetype ${datadir}/licenses"
-- 
2.6.1


