Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D91F6B446
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 19:10:28 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so574477yho.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=efGegW3IHiL/hWmXsjB6npZBstkL1Dq6XiXv+waBLt0=;
	b=o1fwMAcPph6Ai7NpEg878cNOY9TivE033JKmD7nyYBDqmYd+alitZNCML85xg0OCB8
	01mNSFQDwjkGLUn34ydrE2yNYQXgbHjiA4C6R4+VgoqP8teDYo6IsfmOGDir3wslrvxI
	s4MDtcdxH4Eu4LZ7h6Wer/K1eXbXuT4/8exTgHdSk3c4kTSp84rAMfWnzjto84dVTOG8
	qlQc6HbA87ahDFXnYLrlf9fwA24ZbsEqC+P1aqkGxyWmljeelwZj5V6Dg/k+wwQhjYm+
	d7WZpRs9vHeSfZeR/PY0G0yCTornOGdZvVWvRLBlfhTXLb2xfjbcauJtIpodjbz/KqVR
	wMvg==
X-Received: by 10.236.93.208 with SMTP id l56mr4111256yhf.112.1389640229175;
	Mon, 13 Jan 2014 11:10:29 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	k76sm29110763yho.18.2014.01.13.11.10.27 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 11:10:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 17:10:09 -0200
Message-Id: <1389640209-2487-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe] gdal: Use external TIFF support
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
X-List-Received-Date: Mon, 13 Jan 2014 19:10:29 -0000

The TIFF support cannot be disabled so prefer to depends on 'tiff' and
use external by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
index 4ce5d33..5b461bf 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gdal.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
 
-DEPENDS = "proj sqlite3"
+DEPENDS = "proj sqlite3 tiff"
 
 SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
 
@@ -82,6 +82,7 @@ EXTRA_OECONF = "--without-perl \
                 --with-geotiff=internal \
                 \
                 --with-sqlite3=${STAGING_LIBDIR} \
+                --with-libtiff=${STAGING_LIBDIR} \
 "
 
 EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
@@ -90,7 +91,6 @@ PACKAGECONFIG ?= "geos png jasper"
 PACKAGECONFIG[geos] = "--with-geos,--without-geos,geos"
 PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
 PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
-PACKAGECONFIG[tiff] = "--with-libtiff,--without-tiff,tiff"
 PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
 PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
 PACKAGECONFIG[z] = "--with-libz,--without-libz,zlib"
-- 
1.7.10.4


