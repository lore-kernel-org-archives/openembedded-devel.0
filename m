Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 11F6976FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 67CE83879B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:56:04 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 15:56:07 +0200
Message-Id: <1443016567-15788-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 5/5] opencore-amr: add new recipe
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
 .../recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
new file mode 100644
index 0000000..ab5813e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "OpenCORE Adaptive Multi Rate (AMR) speech codec library implementation"
+HOMEPAGE = "http://sourceforge.net/projects/opencore-amr/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2c2486aca02190153cf399e508c7e7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
+SRC_URI[md5sum] = "09d2c5dfb43a9f6e9fec8b1ae678e725"
+SRC_URI[sha256sum] = "106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385"
+
+inherit autotools
-- 
1.9.1


