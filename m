Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 887567F34B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 02:53:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x952rsXZ006154
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Oct 2019 19:53:54 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 4 Oct 2019 19:53:54 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Oct 2019 22:53:53 -0400
Message-ID: <20191005025353.6028-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] gnome-desktop3: upgrade from 3.32.0 to 3.34.0
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
X-List-Received-Date: Sat, 05 Oct 2019 02:53:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Update to fix CVE-2019-11460 as well as add various bugfixes
from upstream.

CVE: CVE-2019-11460

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{gnome-desktop3_3.32.0.bb => gnome-desktop3_3.34.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.32.0.bb => gnome-desktop3_3.34.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb
index 85ee5e6cf..77aa3fb61 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.0.bb
@@ -14,8 +14,8 @@ inherit gnomebase pkgconfig upstream-version-is-even gobject-introspection distr
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "e423ed6d648c6c4f9798fa9cd9ea8d99"
-SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27797a08f3d07b54"
+SRC_URI[archive.md5sum] = "3149bbd12eaf6f4420b1a999131ec470"
+SRC_URI[archive.sha256sum] = "8d331ee655c1d56b2b97562a07c7a7598ff6706a11ff1cdce97423ebc6b62426"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.21.0


