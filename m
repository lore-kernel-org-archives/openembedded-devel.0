Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1278F7CF0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 01:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x281XS8r027058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Mar 2019 17:33:28 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 17:33:27 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Mar 2019 20:32:37 -0500
Message-ID: <20190308013237.194105-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308013237.194105-1-kai.kang@windriver.com>
References: <20190308013237.194105-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 5/5] libgtop: 2.38.0 -> 2.39.91
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
X-List-Received-Date: Fri, 08 Mar 2019 01:33:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update libgtop from 2.38.0 to 2.39.91.

* reset LIBGTOP_LIBS to avoid compile-host-path qa issue

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.38.0.bb => libgtop_2.39.91.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
index 494934fe7..fa5a1d394 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.39.91.bb
@@ -7,7 +7,9 @@ inherit gnomebase lib_package gtk-doc distro_features_check gobject-introspectio
 # depends on libxau
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "bb0ce7de6b28694b40405eedac8a31b5"
-SRC_URI[archive.sha256sum] = "4f6c0e62bb438abfd16b4559cd2eca0251de19e291c888cdc4dc88e5ffebb612"
+SRC_URI[archive.md5sum] = "b50a24e8c70af532c5616f42f4ec71b7"
+SRC_URI[archive.sha256sum] = "3428e3901c80a572d7f7bdf29cc0ecb733cc314038ba3d45093a84f314271f0f"
 
 DEPENDS = "glib-2.0 libxau"
+
+EXTRA_OEMAKE += "LIBGTOP_LIBS="
-- 
2.20.0


