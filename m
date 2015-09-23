Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1234E7701A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id A1D6038798
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:56:03 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 15:56:04 +0200
Message-Id: <1443016567-15788-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 2/5] aalib: add new recipe
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
X-List-Received-Date: Wed, 23 Sep 2015 14:02:08 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb

diff --git a/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
new file mode 100644
index 0000000..06c4e5e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/aalib/aalib_1.4rc4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "AAlib is an portable library for rendering graphics as ASCII art."
+HOMEPAGE = "http://aa-project.sourceforge.net/aalib/"
+SECTION = "libs"
+
+DEPENDS = "ncurses"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+S = "${WORKDIR}/aalib-1.4.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/aa-project/aalib-${PV}.tar.gz"
+SRC_URI[md5sum] = "d5aa8e9eae07b7441298b5c30490f6a6"
+SRC_URI[sha256sum] = "0b214b98850f559e0a9ef7282de2ff336b094e1aacedefff3ffa50f07711db58"
+
+inherit autotools
-- 
1.9.1


