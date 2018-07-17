Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id EEDC17894B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 08:15:02 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id E10F61557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 10:15:02 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2018 10:14:53 +0200
Message-Id: <20180717081453.10000-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] tinyalsa: Add -fPIC to compile flags
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
X-List-Received-Date: Tue, 17 Jul 2018 08:15:03 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
index 72094b6fa..157e4c91f 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
@@ -14,5 +14,11 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+# tinyalsa is built as a static library. Enable PIC to avoid relocation
+# errors like these:
+#
+#    unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `stderr@@GLIBC_2.17'
+CFLAGS += " -fPIC -DPIC "
+
 PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*"
-- 
2.17.1


