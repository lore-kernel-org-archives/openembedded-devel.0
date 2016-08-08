Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87B8777184
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:13:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u787DIjh002473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 8 Aug 2016 00:13:20 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 00:13:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 03:13:11 -0400
Message-ID: <d916acda575f6bf600c1a08597b6377769fc26bc.1470640304.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470640304.git.hongxu.jia@windriver.com>
References: <cover.1470640304.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Mon, 08 Aug 2016 07:13:21 -0000
Content-Type: text/plain

Add  Ethiopia and Eritrea font, which requried by Amharic language.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1.500.bb

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


