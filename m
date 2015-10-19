Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E363B77041
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:44:37 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 579B423186
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:44:37 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 20:44:30 +0200
Message-Id: <1445280272-23937-2-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
References: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 2/4] vo-amrwbenc: add new recipe
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
 .../recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
new file mode 100644
index 0000000..cc049ed
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "VisualOn Adaptive Multi Rate Wideband (AMR-WB) encoder"
+HOMEPAGE = "http://sourceforge.net/projects/opencore-amr/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2c2486aca02190153cf399e508c7e7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
+SRC_URI[md5sum] = "f63bb92bde0b1583cb3cb344c12922e0"
+SRC_URI[sha256sum] = "5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e"
+
+inherit autotools
-- 
1.9.1


