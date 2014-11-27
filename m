Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 227D77233E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 07:59:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44068337"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2014 15:55:45 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAR7wgQD032515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 15:58:42 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 27 Nov 2014 15:58:59 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Nov 2014 15:58:07 +0800
Message-ID: <1417075087-2023-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20141121135246.GB2163@jama>
References: <20141121135246.GB2163@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [meta-oe][PATCH v2] takao-fonts : add new recipe
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
X-List-Received-Date: Thu, 27 Nov 2014 07:59:10 -0000
Content-Type: text/plain

Takao Fonts are a community developed derivatives of IPA Fonts.
IPA Fonts are high quality Japanese outline fonts developed by
Information-technology Promotion Agency,Japan(called IPA for short).
Homepage: https://launchpad.net/takao-fonts

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../takao-fonts/takao-fonts_003.02.01.bb            | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb

diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
new file mode 100644
index 0000000..0a0f6d1
--- /dev/null
+++ b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
+DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
+
+HOMEPAGE = "https://launchpad.net/takao-fonts"
+SECTION = "User Interface/X"
+
+LICENSE = "IPA"
+LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
+
+SRC_URI = "http://launchpad.net/takao-fonts/003.02/${PV}/+download/takao-fonts-ttf-${PV}.zip"
+SRC_URI[md5sum] = "ca480e5edb9f26d871bf6df6cb910306"
+SRC_URI[sha256sum] = "2f526a16c7931958f560697d494d8304949b3ce0aef246fb0c727fbbcc39089e"
+
+S = "${WORKDIR}/${PN}-ttf-${PV}"
+
+do_install() {
+    install -m 0755 -d ${D}/${datadir}/fonts
+    install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
+}
+
+FILES_${PN} += "${datadir}/fonts/*.ttf"
-- 
1.8.4.2


