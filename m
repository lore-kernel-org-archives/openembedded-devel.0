Return-Path: <lixin.fnst@cn.fujitsu.com>
X-Greylist: delayed 364 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Nov 2014 01:37:00 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B7B7565CC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 01:37:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43106261"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Nov 2014 09:30:36 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAA1XZgU020262
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 09:33:35 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 10 Nov 2014 09:33:51 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Nov 2014 09:33:12 +0800
Message-ID: <1415583192-2041-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] takao-fonts : new recipe
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
X-List-Received-Date: Mon, 10 Nov 2014 01:37:07 -0000
Content-Type: text/plain

Takao Fonts are a community developed derivatives of IPA Fonts.
IPA Fonts are high quality Japanese outline fonts developed by
Information-technology Promotion Agency,Japan(called IPA for short).
Homepage:https://launchpad.net/takao-fonts

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../takao-fonts/takao-fonts_003.02.01.bb           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb

diff --git a/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb b/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb
new file mode 100644
index 0000000..afa1a4e
--- /dev/null
+++ b/meta-oe/recipes-support/takao-fonts/takao-fonts_003.02.01.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
+
+HOMEPAGE = "https://launchpad.net/takao-fonts"
+SECTION = "User Interface/X"
+
+LICENSE = "IPA"
+LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
+
+SRC_URI = "http://launchpad.net/takao-fonts/003.02/003.02.01/+download/takao-fonts-ttf-003.02.01.zip"
+SRC_URI[md5sum] = "ca480e5edb9f26d871bf6df6cb910306"
+SRC_URI[sha256sum] = "2f526a16c7931958f560697d494d8304949b3ce0aef246fb0c727fbbcc39089e"
+
+RPROVIDES_${PN} = "virtual-japanese-font"
+
+S = "${WORKDIR}/${PN}-ttf-${PV}"
+
+do_install() {
+	install -m 0755 -d ${D}/${datadir}/fonts
+	install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
+}
+
+FILES_${PN} += "${datadir}/fonts/*.ttf"
+
-- 
1.8.4.2


