Return-Path: <adrian.ratiu@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id DF7686D728
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 10:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aratiu) with ESMTPSA id BE3A328FD07
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri,  4 Oct 2019 13:08:35 +0300
Message-Id: <20191004100835.1700461-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] renderdoc: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 04 Oct 2019 10:08:37 -0000
Content-Transfer-Encoding: 8bit

This recipe depends on having x11 enabled so we add it to fix:

ERROR: Nothing PROVIDES 'libxcb' (but
meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
DEPENDS on or otherwise requires it)
libxcb was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
index b6e0c92f6..dd5e4058c 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
@@ -10,6 +10,8 @@ SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
 "
 S = "${WORKDIR}/git"
 
+REQUIRED_DISTRO_FEATURES = "x11"
+
 DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"
 
 RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
-- 
2.23.0


