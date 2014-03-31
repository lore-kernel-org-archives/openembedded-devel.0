Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.226])
	by mail.openembedded.org (Postfix) with ESMTP id 1A18E60EFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:43:40 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:34908]
	helo=lt-1044-ubuntu-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 40/B4-15578-CF269335; Mon, 31 Mar 2014 12:43:40 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 08:42:50 -0400
Message-Id: <1396269770-12357-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 1.7.9.5
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][dylan][PATCH] php: update SRC_URI for new download location
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
X-List-Received-Date: Mon, 31 Mar 2014 12:43:44 -0000

From: chase maupin <chase.maupin@ti.com>

* The old downloads location of http://www.php.net/distributions
  now points to a listing of all distributions and the mirrors or
  download locations where the sources can be downloaded.
* The new download location is http://museum.php.net/..... where
  the rest of the URL is based on the major version on PHP being
  downloaded.  This is a change from the previous download server
  which had a flattened directory structure so that all versions
  were available in a single location.
* To account for this change in the directory structure a variable
  called PHP_MAJVER is used based off of the PV to point the
  SRC_URI to the proper subdirectory.
* This issue wsa first noted by Joshua Vanderpool at
  Joshua.Vanderpool@raymondcorp.com and there was discussion at
  http://lists.openembedded.org/pipermail/openembedded-devel/2014-January/093757.html
* This patch has been commited to that master branch

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 225c3d7..6175a10 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -9,7 +9,11 @@ DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
 INC_PR = "r4"
 
-SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
+# The new PHP downloads server groups PHP releases by major version so find
+# the major version of the PHP recipe.
+PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
+
+SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.7.9.5


