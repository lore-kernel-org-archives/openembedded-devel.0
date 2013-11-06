Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A9C916D6DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 16:39:57 +0000 (UTC)
Received: from soylentgreen.sue.net
	(83-64-248-68.inzersdorf.xdsl-line.inode.at [83.64.248.68])
	by ptmx.org (Postfix) with ESMTPSA id 05EEF2A6F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 17:39:53 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Nov 2013 17:39:37 +0100
Message-Id: <1383755978-16245-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH 1/2] htop: upgrade to version 1.0.2
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
X-List-Received-Date: Wed, 06 Nov 2013 16:39:59 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-oe/recipes-support/htop/{htop_0.9.bb => htop_1.0.2.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_0.9.bb => htop_1.0.2.bb} (55%)

diff --git a/meta-oe/recipes-support/htop/htop_0.9.bb b/meta-oe/recipes-support/htop/htop_1.0.2.bb
similarity index 55%
rename from meta-oe/recipes-support/htop/htop_0.9.bb
rename to meta-oe/recipes-support/htop/htop_1.0.2.bb
index 6d12d72..3982f66 100644
--- a/meta-oe/recipes-support/htop/htop_0.9.bb
+++ b/meta-oe/recipes-support/htop/htop_1.0.2.bb
@@ -8,15 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz \
-           file://remove-proc-test.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz"
 
 LDFLAGS_append_libc-uclibc = " -lubacktrace"
 
 inherit autotools
 
-SRC_URI[md5sum] = "7c5507f35f363f3f40183a2ba3c561f8"
-SRC_URI[sha256sum] = "4de65c38e1886bccd30ed692b30eb9bf195240680781bfe1eaf5faf84ee6fbfd"
+SRC_URI[md5sum] = "0d01cca8df3349c74569cefebbd9919e"
+SRC_URI[sha256sum] = "ee60657b044ece0df096c053060df7abf3cce3a568ab34d260049e6a37ccd8a1"
 
-- 
1.8.3.2


