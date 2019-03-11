Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67C6F7CD7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2019 06:58:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2B6wPxL016214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Mar 2019 23:58:25 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 10 Mar 2019 23:58:24 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 11 Mar 2019 02:58:21 -0400
Message-ID: <20190311065821.52824-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gvfs/libgtop: inherit upstream-version-is-even
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
X-List-Received-Date: Mon, 11 Mar 2019 06:58:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Inherit upstream-version-is-even.bbclass to ensures that the upstream
version check only accepts even minor(stable) versions.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb      | 2 +-
 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
index fef5d68e3..c7cdd5557 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.39.92.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnome bash-completion gettext
+inherit gnome bash-completion gettext upstream-version-is-even
 
 DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2 polkit shadow-native"
 
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
index 494934fe7..6c0297650 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
@@ -2,9 +2,10 @@ SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspection gettext
+inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
 
 # depends on libxau
+inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
-- 
2.20.0


