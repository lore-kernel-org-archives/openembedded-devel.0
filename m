Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 86FAE65D8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:18:49 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 23 Apr 2014 20:18:45 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 20:18:46 +0900
Message-Id: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/3] fim: Add mirror site
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
X-List-Received-Date: Wed, 23 Apr 2014 11:18:52 -0000

* The SRC_URI is not accessible.
  So need to add mirror site referred by the original site.
* The problem is that
  http://download.savannah.nongnu.org/releases redirects to closest mirror
  and few mirrors (e.g. .jp) weren't working correctly while
  http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 6e5000b..c6537ac 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -16,6 +16,8 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/fbi-improved/${BPN}-${PV
 SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
 SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
 
+MIRRORS += "http://download.savannah.nongnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
+
 PARALLEL_MAKE = ""
 
 inherit autotools
-- 
1.7.9.5


