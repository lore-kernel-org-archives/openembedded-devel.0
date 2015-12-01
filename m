Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 17B7B6011F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 20:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id A597A264C34
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 20:56:52 +0000
Message-Id: <1449003412-21666-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
Subject: [meta-oe][PATCH v2] poppler-data: install CMap resources for CJK glyph support
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
X-List-Received-Date: Tue, 01 Dec 2015 20:56:59 -0000

CID-keyed fonts, as commonly used to support pictographic East
Asian character sets require Character Maps which unidirectionally
map character codes (i.e. Unicode encoding) to CID (the glyphs in
the font face).

Without a CMap poppler isn't able to correctly PDF files in
Chinese, Japanese or Korean without embedded fonts.

This change installs a copy of the Identity files from Adobe's
CMap Resources[1] based on a similar change in Fedora's
poppler-data[2][3].

1. https://github.com/adobe-type-tools/cmap-resources
2. http://pkgs.fedoraproject.org/cgit/poppler-data.git/tree/poppler-data.spec#n18
3. https://bugzilla.redhat.com/show_bug.cgi?id=842351

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
index 4f55e9f..fb8f43d 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
@@ -1,5 +1,7 @@
-SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
-LICENSE = "Adobe"
+SUMMARY = "Encoding files for Poppler"
+DESCRIPTION = "Encoding files for use with poppler that enable poppler to \
+               correctly render CJK and Cyrrilic."
+LICENSE = "BSD & GPLv2 & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.adobe;md5=63c6a8a9df204c00461fa5f163d8a663 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
@@ -7,15 +9,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
 
 inherit allarch
 
-SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
+           https://github.com/adobe-type-tools/cmap-resources/raw/master/cmapresources_identity-0.zip;name=cmap"
 SRC_URI[md5sum] = "636a8f2b9f6df9e7ced8ec0946961eaf"
 SRC_URI[sha256sum] = "e752b0d88a7aba54574152143e7bf76436a7ef51977c55d6bd9a48dccde3a7de"
+SRC_URI[cmap.md5sum] = "32aab2e25655e475dd58a50479270f91"
+SRC_URI[cmap.sha256sum] = "3a3b591b7153588a77d1304bcefc1781750a36811cebae03680c85882765f515"
 
 do_compile() {
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
+    install -d ${D}${datadir}/poppler/cMap
+    install -m644 ${WORKDIR}/cmapresources_identity-0/CMap/Identity-* ${D}${datadir}/poppler/cMap/
 }
 
 FILES_${PN} += "${datadir}"
-- 
2.4.3


