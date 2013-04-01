Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UMbPs-0007Pz-IQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 11:52:40 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id A45AFEA040
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2013 11:45:12 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id A5A37A405BF; Mon,  1 Apr 2013 11:35:50 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 11:35:47 +0200
Message-Id: <25eb3d05e3b85bf4b3fb92029bc62d5aa23931dc.1364807977.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364807977.git.apelete@seketeli.net>
References: <cover.1364807977.git.apelete@seketeli.net>
In-Reply-To: <cover.1364807977.git.apelete@seketeli.net>
References: <cover.1364807977.git.apelete@seketeli.net>
Subject: [meta-oe][PATCH 1/1] ttf-fonts: import ttf-inconsolata recipe from oe-classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 09:52:40 -0000

Import ttf-inconsolata recipe from "oe-classic". This is intended to
satisfy dependency chain of muffinman-image recipe for the JLime
distribution.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../ttf-fonts/ttf-inconsolata/OFL.txt              |   97 ++++++++++++++++++++
 .../ttf-fonts/ttf-inconsolata_20100526.bb          |   26 ++++++
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
new file mode 100644
index 0000000..1456c18
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata/OFL.txt
@@ -0,0 +1,97 @@
+Copyright (c) <dates>, <Copyright Holder> (<URL|email>),
+with Reserved Font Name <Reserved Font Name>.
+Copyright (c) <dates>, <additional Copyright Holder> (<URL|email>),
+with Reserved Font Name <additional Reserved Font Name>.
+Copyright (c) <dates>, <additional Copyright Holder> (<URL|email>).
+
+This Font Software is licensed under the SIL Open Font License, Version 1.1.
+This license is copied below, and is also available with a FAQ at:
+http://scripts.sil.org/OFL
+
+
+-----------------------------------------------------------
+SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
+-----------------------------------------------------------
+
+PREAMBLE
+The goals of the Open Font License (OFL) are to stimulate worldwide
+development of collaborative font projects, to support the font creation
+efforts of academic and linguistic communities, and to provide a free and
+open framework in which fonts may be shared and improved in partnership
+with others.
+
+The OFL allows the licensed fonts to be used, studied, modified and
+redistributed freely as long as they are not sold by themselves. The
+fonts, including any derivative works, can be bundled, embedded, 
+redistributed and/or sold with any software provided that any reserved
+names are not used by derivative works. The fonts and derivatives,
+however, cannot be released under any other type of license. The
+requirement for fonts to remain under this license does not apply
+to any document created using the fonts or their derivatives.
+
+DEFINITIONS
+"Font Software" refers to the set of files released by the Copyright
+Holder(s) under this license and clearly marked as such. This may
+include source files, build scripts and documentation.
+
+"Reserved Font Name" refers to any names specified as such after the
+copyright statement(s).
+
+"Original Version" refers to the collection of Font Software components as
+distributed by the Copyright Holder(s).
+
+"Modified Version" refers to any derivative made by adding to, deleting,
+or substituting -- in part or in whole -- any of the components of the
+Original Version, by changing formats or by porting the Font Software to a
+new environment.
+
+"Author" refers to any designer, engineer, programmer, technical
+writer or other person who contributed to the Font Software.
+
+PERMISSION & CONDITIONS
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of the Font Software, to use, study, copy, merge, embed, modify,
+redistribute, and sell modified and unmodified copies of the Font
+Software, subject to the following conditions:
+
+1) Neither the Font Software nor any of its individual components,
+in Original or Modified Versions, may be sold by itself.
+
+2) Original or Modified Versions of the Font Software may be bundled,
+redistributed and/or sold with any software, provided that each copy
+contains the above copyright notice and this license. These can be
+included either as stand-alone text files, human-readable headers or
+in the appropriate machine-readable metadata fields within text or
+binary files as long as those fields can be easily viewed by the user.
+
+3) No Modified Version of the Font Software may use the Reserved Font
+Name(s) unless explicit written permission is granted by the corresponding
+Copyright Holder. This restriction only applies to the primary font name as
+presented to the users.
+
+4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
+Software shall not be used to promote, endorse or advertise any
+Modified Version, except to acknowledge the contribution(s) of the
+Copyright Holder(s) and the Author(s) or with their explicit written
+permission.
+
+5) The Font Software, modified or unmodified, in part or in whole,
+must be distributed entirely under this license, and must not be
+distributed under any other license. The requirement for fonts to
+remain under this license does not apply to any document created
+using the Font Software.
+
+TERMINATION
+This license becomes null and void if any of the above conditions are
+not met.
+
+DISCLAIMER
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
+OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
+COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
+DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
+OTHER DEALINGS IN THE FONT SOFTWARE.
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
new file mode 100644
index 0000000..37c4120
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -0,0 +1,26 @@
+require ttf.inc
+
+DESCRIPTION = "Inconsolata font - TTF Version"
+HOMEPAGE = "http://www.levien.com/type/myfonts/inconsolata.html"
+LICENSE = "SIL Open Font License"
+PR = "r0"
+
+SRC_URI = "http://levien.com/type/myfonts/Inconsolata.otf \
+	   file://OFL.txt"
+
+S = "${WORKDIR}/ttf-inconsolata-${PV}"
+
+FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
+	       ${datadir}/doc/ttf-inconsolata/*"
+
+do_configure() {
+	mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
+}
+
+do_install_append() {
+	install -d ${D}${datadir}/doc/ttf-inconsolata/
+	install -m 0644 ${WORKDIR}/OFL.txt ${D}${datadir}/doc/ttf-inconsolata/
+}
+
+SRC_URI[md5sum] = "0fbe014c1f0fb5e3c71140ff0dc63edf"
+SRC_URI[sha256sum] = "1561e616c414a1b82d6e6dfbd18e5726fd65028913ade191e5fa38b6ec375a1a"
-- 
1.7.10.4



