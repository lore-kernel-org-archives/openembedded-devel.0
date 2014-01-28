Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id D8B7A6E831
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 15:00:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0SF04cE024495;
	Tue, 28 Jan 2014 09:00:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0SF03rl007441;
	Tue, 28 Jan 2014 09:00:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 28 Jan 2014 09:00:01 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0SExwVf014067;	Tue, 28 Jan 2014 09:00:00 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <joshua.vanderpool@raymondcorp.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jan 2014 08:59:55 -0600
Message-ID: <1390921195-18862-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] php: update SRC_URI for new download location
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
X-List-Received-Date: Tue, 28 Jan 2014 15:00:05 -0000
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

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 meta-oe/recipes-devtools/php/php.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 5345f2a..75c3704 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,9 +7,13 @@ DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native \
            libc-client openssl"
 DEPENDS_virtclass-native = "zlib-native libxml2-native"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
-SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2"
+# The new PHP downloads server groups PHP releases by major version so find
+# the major version of the PHP recipe.
+PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
+
+SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
 
 S = "${WORKDIR}/php-${PV}"
 
-- 
1.7.9.5


