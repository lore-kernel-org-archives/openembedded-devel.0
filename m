Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id 290F365D92
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:18:51 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 23 Apr 2014 20:18:47 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Apr 2014 20:18:47 +0900
Message-Id: <1398251928-6841-2-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
Subject: [meta-oe][PATCH 2/3] gpsd: Add mirror site
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
X-List-Received-Date: Wed, 23 Apr 2014 11:18:53 -0000

* The SRC_URI is not accessible.
  So need to add mirror site referred by the original site.
* The problem is that
  http://download.savannah.nongnu.org/releases redirects to closest mirror
  and few mirrors (e.g. .jp) weren't working correctly while
  http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index 97f3354..c1b7525 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -22,6 +22,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
 SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
 SRC_URI[sha256sum] = "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
 
++MIRRORS += "http://download.savannah.gnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
+
 inherit scons update-rc.d python-dir pythonnative systemd
 
 INITSCRIPT_NAME = "gpsd"
-- 
1.7.9.5


