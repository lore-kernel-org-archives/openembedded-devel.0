Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2691B7EB41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 15:12:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8BFBQix021182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:12:07 -0700
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 11 Sep 2019 08:11:57 -0700
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Sep 2019 11:11:56 -0400
Message-ID: <1568214716-24268-1-git-send-email-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gvfs: upgrade 1.40.2 -> 1.41.2 for CVE fixes
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
X-List-Received-Date: Wed, 11 Sep 2019 15:12:16 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The following CVEs are fixed as of gvfs 1.41.2:

CVE-2019-12447
CVE-2019-12448
CVE-2019-12449

See merge request: https://gitlab.gnome.org/GNOME/gvfs/merge_requests/48

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.2.bb => gvfs_1.41.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.40.2.bb => gvfs_1.41.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
index 4fca107..27e3f92 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.41.2.bb
@@ -9,8 +9,8 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
-SRC_URI[archive.md5sum] = "47db9bec616e089513b7f1386e5c7d5f"
-SRC_URI[archive.sha256sum] = "bdefe8fec6a1097f0c126fa2a4533667c98a86e237ac640518000e16b363971e"
+SRC_URI[archive.md5sum] = "9a9a97a63bb9e87258d48086a6bdacaa"
+SRC_URI[archive.sha256sum] = "f311b7c5f855ebe259960c00c7d03c812e040928ecb0ec093b50a4f16b3bcf26"
 
 
 EXTRA_OEMESON = " \
-- 
2.7.4


