Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0018F771DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:42:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u791gq8J029398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Aug 2016 18:42:52 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 18:42:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 21:42:42 -0400
Message-ID: <fcedfe11ab428ce82b38e0c7472278a66e696618.1470706569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470706568.git.hongxu.jia@windriver.com>
References: <cover.1470706568.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] ttf-lklug: add version 0.6-14.20090803cvs.fc24 to support Sinhala language
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
X-List-Received-Date: Tue, 09 Aug 2016 01:42:52 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                            |  1 +
 .../ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb | 24 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index edcafdf..eba8ccd 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -59,6 +59,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-inconsolata->fontconfig \
   ttf-liberation->fontconfig \
   ttf-liberation-sans-narrow->fontconfig \
+  ttf-lklug->fontconfig \
   ttf-lohit->fontconfig \
   ttf-pt-sans->fontconfig \
   ttf-mplus->fontconfig \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
new file mode 100644
index 0000000..fd235bd
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-lklug_0.6-14.20090803cvs.fc24.bb
@@ -0,0 +1,24 @@
+require ttf.inc
+
+SUMMARY = "Fonts for Sinhala language - TTF Edition"
+HOMEPAGE = "http://rpms.famillecollet.com/rpmphp/zoom.php?rpm=lklug-fonts"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "http://dl.fedoraproject.org/pub/fedora/linux/development/25/Everything/source/tree/Packages/l/lklug-fonts-0.6-14.20090803cvs.fc24.src.rpm;extract=lklug-20090803.tar.gz"
+SRC_URI[md5sum] = "3341dfb997043d234ab3f6e5a965e759"
+SRC_URI[sha256sum] = "f54c1f3b4df08995982657fed290b562556191fee2a0386afd9e8bf228f72b1a"
+
+DEPENDS = "fontforge-native"
+
+S = "${WORKDIR}"
+FONT_PACKAGES = "${PN}"
+FILES_${PN} = "${datadir}"
+
+do_compile() {
+    fontforge ${S}/convert.ff lklug
+}
+
+do_install() {
+    make install DESTDIR=${D}
+}
-- 
2.8.1


