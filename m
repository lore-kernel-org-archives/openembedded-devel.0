Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E51747714D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:42:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u791gkiJ029395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 18:42:46 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:42:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 21:42:39 -0400
Message-ID: <5ad123b43bca6faf71ab503c9d8e527371ea53c7.1470706569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470706568.git.hongxu.jia@windriver.com>
References: <cover.1470706568.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] ttf-abyssinica: add version 1.500 to support Amharic language
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
X-List-Received-Date: Tue, 09 Aug 2016 01:42:47 -0000
Content-Type: text/plain

Add  Ethiopia and Eritrea font, which requried by Amharic language.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                                 |  1 +
 .../recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index c5e74c2..71ee2fb 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -50,6 +50,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 # ttf.inc inherits fontcache which adds fontconfig-utils to RDEPENDS
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   terminus-font->fontconfig \
+  ttf-abyssinica->fontconfig \
   ttf-arphic-uming->fontconfig \
   ttf-dejavu->fontconfig \
   ttf-droid->fontconfig \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
new file mode 100644
index 0000000..d0c3ae5
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb
@@ -0,0 +1,17 @@
+require ttf.inc
+
+SUMMARY = "Ethiopia and Eritrea (Amharic) font - TTF Edition"
+HOMEPAGE = "http://software.sil.org/abyssinica/"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=1694c7fc245cdc85c9971db707928159"
+
+SRCNAME = "AbyssinicaSIL"
+SRC_URI = "http://software.sil.org/downloads/abyssinica/${SRCNAME}-${PV}.zip"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "a3d943d18e303197c8d3d92d2de54d1e"
+SRC_URI[sha256sum] = "e48a77d5ab8ee0b06464a5b29be70f292aa25dc1e73eb39ec933bd7fa47bbd86"
+
+FONT_PACKAGES = "${PN}"
+FILES_${PN} = "${datadir}"
+
-- 
2.8.1


