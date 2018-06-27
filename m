Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68D4D74793
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:56:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5R9tj5O021514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:56:12 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:55:58 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:55:58 -0700
Message-ID: <20180627095558.38794-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/13] glade: Upgrade to 3.22.1
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
X-List-Received-Date: Wed, 27 Jun 2018 09:56:21 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../glade/{glade_3.20.2.bb => glade_3.22.1.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/glade/{glade_3.20.2.bb => glade_3.22.1.bb} (81%)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
similarity index 81%
rename from meta-oe/recipes-devtools/glade/glade_3.20.2.bb
rename to meta-oe/recipes-devtools/glade/glade_3.22.1.bb
index 95e1737c5..bd4b586f1 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.20.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
@@ -13,11 +13,11 @@ inherit distro_features_check autotools pkgconfig gnomebase gobject-introspectio
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
-SRC_URI[md5sum] = "d3dd9ba33c7d7c854ab207e1ba844dda"
-SRC_URI[sha256sum] = "07d1545570951aeded20e9fdc6d3d8a56aeefe2538734568c5335be336c6abed"
+SRC_URI[md5sum] = "226802cf3b06861240524805aa6fe6ff"
+SRC_URI[sha256sum] = "dff89a2ef2eaf000ff2a46979978d03cb9202cb04668e01d0ea5c5bb5547e39a"
 
 EXTRA_OECONF += "--disable-man-pages"
 
-- 
2.17.1


