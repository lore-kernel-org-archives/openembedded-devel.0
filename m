Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id B26736E9BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 12:49:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UCnW4Q022707
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 06:49:32 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UCnWOE032216
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 06:49:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 06:49:32 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UCnTeO027049;	Thu, 30 Jan 2014 06:49:31 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jan 2014 06:49:27 -0600
Message-ID: <1391086167-31517-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2][for-dora] php: update SRC_URI for new download location
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
X-List-Received-Date: Thu, 30 Jan 2014 12:49:33 -0000
Content-Type: text/plain

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
---
* Updated in version 2
    * Remove the bump of INC_PR as per suggestion of
      Koen Kooi [koen@dominion.thruhere.net]
---
 meta-oe/recipes-devtools/php/php.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 5345f2a..d5e53c0 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -9,7 +9,11 @@ DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
 INC_PR = "r5"
 
-SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
+# The new PHP downloads server groups PHP releases by major version so find
+# the major version of the PHP recipe.
+PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
+
+SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.7.9.5


