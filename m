Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3DC6164F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:45:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83686049"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:35:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7909750A9976
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:26:14 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:35:54 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:35:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 16:37:36 +0800
Message-ID: <20200221083737.17042-5-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
References: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7909750A9976.A749D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] ttf-hunkyfonts: upgrade 0.3.0 -> 0.3.1
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
X-List-Received-Date: Fri, 21 Feb 2020 08:45:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the new version does not have the file LICENSE, change the
LIC_FILES_CHKSUM to COPYRIGHT.TXT.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{ttf-hunkyfonts_0.3.0.bb => ttf-hunkyfonts_0.3.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-hunkyfonts_0.3.0.bb => ttf-hunkyfonts_0.3.1.bb} (68%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
similarity index 68%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index bd552c08a..4df0c3afb 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -3,7 +3,7 @@ require ttf.inc
 SUMMARY = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
+LIC_FILES_CHKSUM = "file://../COPYRIGHT.TXT;md5=70d34478e38b1ad9995079f9921f9ef7"
 PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
@@ -16,5 +16,5 @@ FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
 FILES_ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES_ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"
 
-SRC_URI[md5sum] = "36444795a356fb8a56c63b2840729bab"
-SRC_URI[sha256sum] = "e0b1849c545b6af276407d93025c73094dd74fc259b07c1d91594fdbb9a0b829"
+SRC_URI[md5sum] = "b933312967842e5737b5415fa22d682a"
+SRC_URI[sha256sum] = "3fc528737ccd12ec3c09c4a91447d241d3c5bceeeb4d24b7f2c29b15c9735328"
-- 
2.20.1




