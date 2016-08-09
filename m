Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C13D771E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:42:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u791go1d029130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 8 Aug 2016 18:42:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:42:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 21:42:41 -0400
Message-ID: <e2fd6ebf3f0aba8f0b02c2b6202ee9f228845e05.1470706569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470706568.git.hongxu.jia@windriver.com>
References: <cover.1470706568.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Tue, 09 Aug 2016 01:42:50 -0000
Content-Type: text/plain

The font family supports 21 Indian languages: Assamese, Bengali,
Devanagari (Hindi, Kashmiri, Konkani, Maithili, Marathi, Nepali,
Sindhi, Santali, Bodo, Dogri), Gujarati, Kannada, Malayalam,
Manipuri, Oriya, Punjabi, Tamil, and Telugu.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                           |  1 +
 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 71ee2fb..edcafdf 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -59,6 +59,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-inconsolata->fontconfig \
   ttf-liberation->fontconfig \
   ttf-liberation-sans-narrow->fontconfig \
+  ttf-lohit->fontconfig \
   ttf-pt-sans->fontconfig \
   ttf-mplus->fontconfig \
   ttf-sazanami->fontconfig \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lohit_2.bb
new file mode 100644
index 0000000..f9679d6
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
+    cd ${S}; make ttf;
+}
+
-- 
2.8.1


