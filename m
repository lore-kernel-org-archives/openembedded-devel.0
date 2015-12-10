Return-Path: <rah@fern.h.settrans.net>
Received: from verain.settrans.net (verain.settrans.net [93.93.131.233])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE2660116
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:32:35 +0000 (UTC)
Received: from rah-1-pt.tunnel.tserv10.par1.ipv6.he.net
	([2001:470:1f12:e23::2] helo=myrtle.6gnip.net ident=Debian-exim)
	by verain.settrans.net with esmtps (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <rah@fern.h.settrans.net>)
	id 1a73Ct-0001lF-9r; Thu, 10 Dec 2015 15:32:35 +0000
Received: from fern.arb.net ([172.18.111.33] helo=fern.h.settrans.net)
	by myrtle.6gnip.net with esmtp (Exim 4.84)
	(envelope-from <rah@fern.h.settrans.net>)
	id 1a73Cs-0000mz-Jf; Thu, 10 Dec 2015 15:32:34 +0000
Received: by fern.h.settrans.net (Postfix, from userid 1000)
	id 90CF7B405B3; Thu, 10 Dec 2015 15:32:34 +0000 (GMT)
From: Bob Ham <bob.ham@collabora.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Dec 2015 15:32:34 +0000
Message-Id: <1449761554-21404-1-git-send-email-bob.ham@collabora.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH v3] poppler-data: install CMap resources for CJK glyph support
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
X-List-Received-Date: Thu, 10 Dec 2015 15:32:39 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

CID-keyed fonts, as commonly used to support pictographic East
Asian character sets require Character Maps which unidirectionally
map character codes (i.e. Unicode encoding) to CID (the glyphs in
the font face).

Without a CMap poppler isn't able to correctly PDF files in
Chinese, Japanese or Korean without embedded fonts.

This change installs a copy of the Identity files from Adobe's
CMap Resources[1] based on a similar change in Fedora's
poppler-data[2][3].

This is an updated version of the v2 patch originally created and sent
by my colleague, Joshua Lock.

1. https://github.com/adobe-type-tools/cmap-resources
2. http://pkgs.fedoraproject.org/cgit/poppler-data.git/tree/poppler-data.spec#n18
3. https://bugzilla.redhat.com/show_bug.cgi?id=842351

Co-Authored-By: Bob Ham <bob.ham@collabora.com>
Signed-off-by: Bob Ham <bob.ham@collabora.com>
---
 .../recipes-support/poppler/poppler-data_0.4.7.bb   | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.7.bb
index 4f55e9f..27c4110 100644
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
@@ -7,15 +9,28 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
 
 inherit allarch
 
-SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz"
+INHIBIT_DEFAULT_DEPS = "1"
+
+CMAP_RESOURCES_BASE = "https://github.com/adobe-type-tools/cmap-resources/raw/0561ebca035813ed04c3485bca636a0aa7abdc1d/cmapresources_identity-0/CMap"
+
+SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
+           ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
+           ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
+
 SRC_URI[md5sum] = "636a8f2b9f6df9e7ced8ec0946961eaf"
 SRC_URI[sha256sum] = "e752b0d88a7aba54574152143e7bf76436a7ef51977c55d6bd9a48dccde3a7de"
+SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
+SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
+SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
+SRC_URI[idv.sha256sum] = "89a85daf7031e93c883e76b9168a226dfd585bf5506e9e1956772163f15cb082"
 
 do_compile() {
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
+    install -d ${D}${datadir}/poppler/cMap
+    install -m644 ${WORKDIR}/Identity-* ${D}${datadir}/poppler/cMap/
 }
 
 FILES_${PN} += "${datadir}"
-- 
2.1.4


