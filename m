Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E55DE77060
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:44:37 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id AF41223187
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:44:37 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 20:44:31 +0200
Message-Id: <1445280272-23937-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
References: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 3/4] libdvdnav: add new recipe
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
 .../recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb

diff --git a/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb
new file mode 100644
index 0000000..c2dd96f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdvdnav/libdvdnav_5.0.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "library for DVD navigation features"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "libdvdread"
+
+SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "e9ea4de3bd8f204e61301d407d09f033"
+SRC_URI[sha256sum] = "5097023e3d2b36944c763f1df707ee06b19dc639b2b68fb30113a5f2cbf60b6d"
+
+inherit autotools lib_package binconfig pkgconfig
+
+CONFIGUREOPTS_remove = "--disable-silent-rules"
+
-- 
1.9.1


