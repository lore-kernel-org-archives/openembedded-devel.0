Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51F5877184
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 07:13:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u787DOQH016355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 00:13:24 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 00:13:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 03:13:13 -0400
Message-ID: <5fd45bb1b31af8425dab23d3354cf0831c5bf3ac.1470640304.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470640304.git.hongxu.jia@windriver.com>
References: <cover.1470640304.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ttf-lohit: add version 2 to support Indian languages
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
X-List-Received-Date: Mon, 08 Aug 2016 07:13:24 -0000
Content-Type: text/plain

The font family supports 21 Indian languages: Assamese, Bengali,
Devanagari (Hindi, Kashmiri, Konkani, Maithili, Marathi, Nepali,
Sindhi, Santali, Bodo, Dogri), Gujarati, Kannada, Malayalam,
Manipuri, Oriya, Punjabi, Tamil, and Telugu.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
new file mode 100644
index 0000000..f1e9455
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
@@ -0,0 +1,23 @@
+require ttf.inc
+
+SUMMARY = "The project goal is to improve existing offerings of the fonts \
+- making sure the Lohit fonts deliver the best available quality and functions \
+to the community."
+HOMEPAGE = "https://fedorahosted.org/lohit"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://OFL.txt;md5=7dfa0a236dc535ad2d2548e6170c4402"
+
+SRCREV = "d678f1b1807ea5602586279e90b5db6d62ed475e"
+SRC_URI = "git://github.com/pravins/lohit.git;branch=master"
+
+DEPENDS = "fontforge-native"
+S = "${WORKDIR}/git"
+FONT_PACKAGES = "${PN}"
+FILES_${PN} = "${datadir}"
+
+inherit pythonnative
+
+do_compile() {
+	cd ${S}; make ttf;
+}
+
-- 
2.8.1


