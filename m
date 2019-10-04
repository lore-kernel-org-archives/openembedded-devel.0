Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 82DA37CD73
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 11:40:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id B56AA29044E
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri,  4 Oct 2019 14:40:26 +0300
Message-Id: <20191004114026.1705340-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe] [PATCH v2] renderdoc: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 04 Oct 2019 11:40:22 -0000
Content-Transfer-Encoding: 8bit

This recipe depends on having x11 enabled so we add it to fix:

ERROR: Nothing PROVIDES 'libxcb' (but
meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
DEPENDS on or otherwise requires it)
libxcb was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---

Changes since v1:
    - Added inherit distro_features_check otherwise the
    REQUIRED_DISTRO_FEATURES var no-ops (oops!)

 meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
index b6e0c92f6..c7e872409 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
@@ -14,7 +14,9 @@ DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"
 
 RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
 
-inherit cmake python3native
+inherit cmake python3native distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 python __anonymous () {
     # only works on glibc systems
-- 
2.23.0


