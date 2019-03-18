Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD31D79CC0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:09:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2I28sSa031662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Mar 2019 19:09:10 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 17 Mar 2019 19:09:04 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Sun, 17 Mar 2019 22:08:28 -0400
Message-ID: <20190318020829.35542-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190318020829.35542-1-kai.kang@windriver.com>
References: <20190318020829.35542-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v3 1/2] libgtop: 2.38.0 -> 2.40.0
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
X-List-Received-Date: Mon, 18 Mar 2019 02:09:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update libgtop from 2.38.0 to 2.40.0

* reset LIBGTOP_LIBS to avoid compile errors which caused by host
  contamination

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.40.0.bb} (62%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
similarity index 62%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index 6c0297650..b594198a4 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -8,7 +8,9 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 inherit distro_features_check
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


