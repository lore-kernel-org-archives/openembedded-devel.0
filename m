Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A880F7C7D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 08:00:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F7x5vN002682
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 00:59:41 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 00:59:29 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 15 Mar 2019 03:58:54 -0400
Message-ID: <20190315075855.49193-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190315075855.49193-1-kai.kang@windriver.com>
References: <20190315075855.49193-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][Patch v2 1/2] libgtop: 2.38.0 -> 2.40.0
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
X-List-Received-Date: Fri, 15 Mar 2019 08:00:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update libgtop from 2.38.0 to 2.40.0

* reset LIBGTOP_LIBS to avoid compile errors which caused by host
  contamination
* inherit upstream-version-is-even to ensures that the upstream
  version check only accepts even minor(stable) versions.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb} (38%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
similarity index 38%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 494934fe7..b594198a4 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -2,12 +2,15 @@ SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspection gettext
+inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
 
 # depends on libxau
+inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
-SRC_URI[archive.sha256sum] = "4f6c0e62bb438abfd16b4559cd2eca0251de19e291c888cdc4dc88e5ffebb612"
+SRC_URI[archive.md5sum] = "c6d67325cd97b2208b41e07e6cc7b947"
+SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
 DEPENDS = "glib-2.0 libxau"
+
+EXTRA_OEMAKE += "LIBGTOP_LIBS="
-- 
2.20.0


