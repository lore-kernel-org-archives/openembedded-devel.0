Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 199027705C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 02:20:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10856879"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2016 10:20:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4748541B60FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:20:55 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 12 Sep 2016 10:20:58 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Sep 2016 22:20:55 -0400
Message-ID: <1473646855-2216-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 4748541B60FB.A6FAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ttf-dejavu: 2.35 -> 2.37
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
X-List-Received-Date: Mon, 12 Sep 2016 02:20:57 -0000
Content-Type: text/plain

1) Upgrade ttf-dejavu from 2.35 to 2.37. 
2) Modify LIC_FILES_CHKSUM, since the date in it has been changed, But the LICENSE has not been changed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../ttf-fonts/{ttf-dejavu_2.35.bb => ttf-dejavu_2.37.bb}      | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-dejavu_2.35.bb => ttf-dejavu_2.37.bb} (80%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
similarity index 80%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 3ce791b..1d24f2f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.35.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "DejaVu font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "BitstreamVera"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;md5=9f867da7a73fad2715291348e80d0763"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;md5=449b2c30bfe5fa897fe87b8b70b16cfa""
 
 # all subpackages except ${PN}-common itself rdepends on ${PN}-common
 RDEPENDS_${PN}-sans = "${PN}-common"
@@ -11,6 +11,7 @@ RDEPENDS_${PN}-sans-mono = "${PN}-common"
 RDEPENDS_${PN}-sans-condensed = "${PN}-common"
 RDEPENDS_${PN}-serif = "${PN}-common"
 RDEPENDS_${PN}-serif-condensed = "${PN}-common"
+RDEPENDS_${PN}-mathtexgyre = "${PN}-common"
 RDEPENDS_${PN}-common = ""
 PR = "r7"
 
@@ -30,15 +31,17 @@ PACKAGES = "\
             ${PN}-sans-condensed \
             ${PN}-serif \
             ${PN}-serif-condensed \
+            ${PN}-mathtexgyre \
             ${PN}-common"
-FONT_PACKAGES = "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}-serif ${PN}-serif-condensed"
+FONT_PACKAGES = "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}-serif ${PN}-serif-condensed ${PN}-mathtexgyre"
 
 FILES_${PN}-sans            = "${datadir}/fonts/truetype/DejaVuSans.ttf ${datadir}/fonts/truetype/DejaVuSans-*.ttf"
 FILES_${PN}-sans-mono       = "${datadir}/fonts/truetype/DejaVuSansMono*.ttf"
 FILES_${PN}-sans-condensed  = "${datadir}/fonts/truetype/DejaVuSansCondensed*.ttf"
 FILES_${PN}-serif           = "${datadir}/fonts/truetype/DejaVuSerif.ttf ${datadir}/fonts/truetype/DejaVuSerif-*.ttf"
 FILES_${PN}-serif-condensed = "${datadir}/fonts/truetype/DejaVuSerifCondensed*.ttf"
+FILES_${PN}-mathtexgyre     = "${datadir}/fonts/truetype/DejaVuMathTeXGyre.ttf"
 FILES_${PN}-common          = "${sysconfdir}"
 
-SRC_URI[md5sum] = "59eaca5acf5c7c8212e92778e3e01f32"
-SRC_URI[sha256sum] = "f6d7965586101ff3a8a5c3ec503e082bb6a9604ff53413e10702e5917c194d88"
+SRC_URI[md5sum] = "d0efec10b9f110a32e9b8f796e21782c"
+SRC_URI[sha256sum] = "fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7"
-- 
2.7.4




