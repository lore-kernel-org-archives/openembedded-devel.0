Return-Path: <denis@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id A63B66DF6D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 08:47:31 +0000 (UTC)
Received: from denis-N73SV.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id C88919402D9;
	Thu,  5 Dec 2013 09:47:26 +0100 (CET)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2013 09:47:24 +0100
Message-Id: <1386233244-4909-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] fbgrab 1.2: Add recipe.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 08:47:33 -0000

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb

diff --git a/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
new file mode 100644
index 0000000..5b55762
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "FBGrab is a framebuffer screenshot program."
+HOMEPAGE = "http://fbgrab.monells.se/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
+SECTION = "console/utils"
+DEPENDS = "libpng zlib"
+SRC_URI = "http://fbgrab.monells.se/${P}.tar.gz"
+
+inherit autotools
+
+S = "${WORKDIR}/${PN}"
+
+SRC_URI[md5sum] = "15b432735d6efd0373722bb96577b945"
+SRC_URI[sha256sum] = "61e0772ad6ea744ee597ae478398ddd0ba6fceee2cf343859bebde2c15bafb91"
-- 
1.7.9.5


