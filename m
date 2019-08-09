Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 185716D561
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 19:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x79JElJd024511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Aug 2019 12:14:47 -0700 (PDT)
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 9 Aug 2019 12:14:46 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2019 15:14:46 -0400
Message-ID: <1565378086-1445-1-git-send-email-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gvfs: upgrade from 1.40.0 to 1.40.2
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
X-List-Received-Date: Fri, 09 Aug 2019 19:14:46 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.0.bb => gvfs_1.40.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.0.bb => gvfs_1.40.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb
index 893379b..4fca107 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "96ef53ed613e4d223e0db3a7acea44f0"
-SRC_URI[archive.sha256sum] = "3739d64b79c95a9f0f9faf2c5f9e5298b4b2ebdd6431435ce656ecd19b31e2f2"
+SRC_URI[archive.md5sum] = "47db9bec616e089513b7f1386e5c7d5f"
+SRC_URI[archive.sha256sum] = "bdefe8fec6a1097f0c126fa2a4533667c98a86e237ac640518000e16b363971e"
 
 
 EXTRA_OEMESON = " \
-- 
2.7.4


