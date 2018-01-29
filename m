Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0124765C8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:10:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.46,429,1511820000"; d="scan'208";a="79046842"
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jan 2018 11:10:50 +0200
Message-Id: <20180129091050.22919-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
X-OriginalArrivalTime: 29 Jan 2018 09:10:55.0222 (UTC)
	FILETIME=[117B1960:01D398E1]
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-qt5][PATCH] qtwebengine: Fix typo in patch filename
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
X-List-Received-Date: Mon, 29 Jan 2018 09:10:55 -0000

Fixes fetcher failure due to typo in patch filename introduced in
commit e8ec89bf1724836b054e8629e5ad90eb4fd97868

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index c36e345..9177b15 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -122,7 +122,7 @@ SRC_URI += " \
 # 49-based.meta-qt5.1
 SRC_URI += " \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch;patchdir=src/3rdparty \
-    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patchh;patchdir=src/3rdparty \
+    file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch;patchdir=src/3rdparty \
 "
 
 SRCREV_qtwebengine = "fad625e0ba39e855817bbf206ab9a846d07aeeec"
-- 
2.11.0


