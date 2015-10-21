Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D89CE75D22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:31:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L8VKV9001822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 01:31:21 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 21 Oct 2015 01:31:20 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Oct 2015 04:31:19 -0400
Message-ID: <1445416279-119028-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-gnome] libgtop/metacity: add x11 to required DISTRO_FEATURES [ LIN8-343 ]
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
X-List-Received-Date: Wed, 21 Oct 2015 08:31:23 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The recipes depend on virtual/libx11 indirectly, they only can be
built with x11 in DISTRO_FEATURES.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb    | 5 ++++-
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
index 51c51d4..8568274 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
@@ -2,7 +2,10 @@ SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
-inherit gnomebase lib_package gtk-doc
+inherit gnomebase lib_package gtk-doc distro_features_check
+# depends on libxau
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[archive.md5sum] = "ee29a9ef60659ebf4b075ac281f71cb2"
 SRC_URI[archive.sha256sum] = "463bcbe5737b1b93f3345ee34abf601e8eb864f507c49ff1921c2737abafc1e5"
 
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 9c48238..662c90d 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils libgtop intltool-native"
 PR = "r1"
 
-inherit gnomebase update-alternatives
+inherit gnomebase update-alternatives distro_features_check
+# depends on startup-notification which depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.9.1


