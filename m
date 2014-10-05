Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 65D666AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 07:00:23 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so4297410wgh.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4bbuOFtB/MuTyy0cMUHNxmvZd0uL8x68jtmY2G7WsXY=;
	b=YWi+sTa60H6ccI6Sr6nfaLVFM/n2uHTnE7w849SA/zaJStE0w3A+W6qnOIHyAa+5eg
	QW+Ow8szFTsL97EsdnbzNLDO/MXlMSOlpbL6qyHseFr4cUmELtWS+queGIE6hZB2YGbr
	kHOhIphquXaSiN6xTgv5iR6b9dmIviZ0Eim8p47Js81E/8bFf9+lLLTlvJZLWr8vy0Zc
	p+hfR8kp0HKzpAgJynPBKF1vZqmu5MrkgjwDZVISTrs//pdMOmPldEX50Jm0ZupPm0c4
	uzSybikj/b9EM5QiU4RZpWSFP+TXMWkQ1xvIuikwMH0ZmMOjaUFfF78BJyfqEsUcrl2b
	ACqQ==
X-Received: by 10.180.10.162 with SMTP id j2mr10696036wib.72.1412492423559;
	Sun, 05 Oct 2014 00:00:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ul1sm13033110wjc.9.2014.10.05.00.00.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 00:00:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Oct 2014 09:01:20 +0200
Message-Id: <1412492480-6862-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-oe][PATCH] gdal: upgrade to 1.11.1
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
X-List-Received-Date: Sun, 05 Oct 2014 07:00:26 -0000

* add json-c dependency and fix with-* params
* LICENSE.txt change only added SUN copyright for
  gdal/alg/thinplatespline.cpp file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gdal/{gdal_1.10.1.bb => gdal_1.11.1.bb}                | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-navigation/gdal/{gdal_1.10.1.bb => gdal_1.11.1.bb} (87%)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
similarity index 87%
rename from meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
rename to meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
index 14f1a57..b181b3e 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
@@ -1,14 +1,14 @@
 SUMMARY = "GDAL is a translator library for raster geospatial data formats"
 HOMEPAGE = "http://www.gdal.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0952e17969fab12227096b5228f23149"
 
-DEPENDS = "proj sqlite3 tiff"
+DEPENDS = "proj sqlite3 tiff json-c"
 
 SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
-SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
+SRC_URI[md5sum] = "2e126d7c6605691d38f3e71b945f5c73"
+SRC_URI[sha256sum] = "20e1042cff15a71038459a299732fb342428aea9912f32df30c85790fcab6302"
 
 inherit autotools-brokensep lib_package binconfig
 
@@ -79,8 +79,10 @@ EXTRA_OECONF = "--without-perl \
                 --with-pcraster=internal \
                 --with-geotiff=internal \
                 \
-                --with-sqlite3=${STAGING_LIBDIR} \
-                --with-libtiff=${STAGING_LIBDIR} \
+                --with-sqlite3=${STAGING_EXECPREFIXDIR} \
+                --with-libtiff=${STAGING_EXECPREFIXDIR} \
+                --with-libjson-c=${STAGING_EXECPREFIXDIR} \
+                --with-expat=${STAGING_EXECPREFIXDIR} \
 "
 
 EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
-- 
2.1.1


