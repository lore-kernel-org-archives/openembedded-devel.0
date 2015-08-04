Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CCAC2757A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2015 07:51:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99237541"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Aug 2015 15:54:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t747nWDd017691
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Aug 2015 15:49:32 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 4 Aug 2015 15:51:25 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Aug 2015 15:51:17 +0800
Message-ID: <1438674677-4589-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] takao-fonts: upgrade 003.02.01 -> 003.03.01
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
X-List-Received-Date: Tue, 04 Aug 2015 07:51:32 -0000
Content-Type: text/plain

The SRC_URI has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../{takao-fonts_003.02.01.bb => takao-fonts_003.03.01.bb}     | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/takao-fonts/{takao-fonts_003.02.01.bb => takao-fonts_003.03.01.bb} (65%)

diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
similarity index 65%
rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
rename to meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
index ed875fa..d99ff14 100644
--- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.02.01.bb
+++ b/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
@@ -6,13 +6,11 @@ SECTION = "User Interface/X"
 
 LICENSE = "IPA"
 LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
+SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
+SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
+SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
 
-SRC_URI = "http://launchpad.net/takao-fonts/003.02/${PV}/+download/takao-fonts-ttf-${PV}.zip"
-SRC_URI[md5sum] = "ca480e5edb9f26d871bf6df6cb910306"
-SRC_URI[sha256sum] = "2f526a16c7931958f560697d494d8304949b3ce0aef246fb0c727fbbcc39089e"
-
-S = "${WORKDIR}/${BPN}-ttf-${PV}"
-
+S = "${WORKDIR}/TakaoFonts_00303.01"
 do_install() {
     install -m 0755 -d ${D}/${datadir}/fonts
     install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
-- 
1.8.4.2


