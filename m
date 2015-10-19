Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E473277055
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:44:37 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 0915423184
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:44:36 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 20:44:29 +0200
Message-Id: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-multimedia][PATCH 1/4] vo-aacenc: add new recipe
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
X-List-Received-Date: Mon, 19 Oct 2015 18:44:42 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb      | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
new file mode 100644
index 0000000..ce37362
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "VisualOn Advanced Audio Coding (AAC) encoder"
+HOMEPAGE = "http://sourceforge.net/projects/opencore-amr/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2c2486aca02190153cf399e508c7e7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
+SRC_URI[md5sum] = "b574da1d92d75fc40b0b75aa16f24ac4"
+SRC_URI[sha256sum] = "e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36"
+
+inherit autotools
-- 
1.9.1


