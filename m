Return-Path: <changhyeok.bae@lge.com>
Received: from lgemrelse6q.lge.com (LGEMRELSE6Q.lge.com [156.147.1.121])
	by mail.openembedded.org (Postfix) with ESMTP id F2A4B65E1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 01:09:22 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.121 with ESMTP; 29 Sep 2014 10:09:21 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 10:09:21 +0900
Message-Id: <1411952961-5092-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] gdal: update to version 1.11.0
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
X-List-Received-Date: Mon, 29 Sep 2014 01:09:30 -0000

---
 .../gdal/{gdal_1.10.1.bb => gdal_1.11.0.bb}        |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/gdal/{gdal_1.10.1.bb => gdal_1.11.0.bb} (94%)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
similarity index 94%
rename from meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
rename to meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
index 14f1a57..8526cee 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "GDAL is a translator library for raster geospatial data formats"
 HOMEPAGE = "http://www.gdal.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0952e17969fab12227096b5228f23149"
 
 DEPENDS = "proj sqlite3 tiff"
 
 SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
-SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
+SRC_URI[md5sum] = "31f2c4a7230b40e5fdc3cf12a100f96b"
+SRC_URI[sha256sum] = "b5186b5817e94743de1bceef66aeee1461687e14f73bf81034fcf0377eacbcc3"
 
 inherit autotools-brokensep lib_package binconfig
 
-- 
1.7.9.5


