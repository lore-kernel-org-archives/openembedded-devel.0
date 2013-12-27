Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 661656B40A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2013 05:15:34 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id b6so1910664yha.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2013 21:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=WoHT3HI1l7ic8J6WYBH2Z929lEOKl23lIImwjwcbef0=;
	b=ecAy0S2QyOntM9BTF8cExmKULFE35sLqxqvzzfgEvBr2qLA3w+olrgmKeZ8SWkhBeC
	JEph4tcIqihqSfBS1LPuc6XI5z65JLl4aXthPYAPe9DGKQkwcINF9Y16OH1Otvsq2FRF
	inNxZICefaOnVXUw1uEwhXGJW742jc0JhiwkGTPTZQehK3LbASDYXvKSpeFs5mtpNAeb
	cY0N5z0D9yqy/UdrBHBKvgjHBINps9LPNskidtD3k3dyC3BuTjajjvF8RYgatZugv2kx
	wCFDmEyBgvplKV2/zLbFkviTjffoOAjOjATrvJLkuPMH2tlg7twlfUpWl7UUztu7hAg1
	Yiiw==
X-Received: by 10.236.91.101 with SMTP id g65mr31611506yhf.35.1388121335377;
	Thu, 26 Dec 2013 21:15:35 -0800 (PST)
Received: from nano.lab.ossystems.com.br (72.17.156.179.nw.nuvox.net.
	[72.17.156.179])
	by mx.google.com with ESMTPSA id 48sm44882858yhq.11.2013.12.26.21.15.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Dec 2013 21:15:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id F195D1764748F; Fri, 27 Dec 2013 03:15:14 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2013 03:15:13 -0200
Message-Id: <1388121314-6630-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
References: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-dora 2/3] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Fri, 27 Dec 2013 05:15:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb | 105 +++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb

diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
new file mode 100644
index 0000000..4632944
--- /dev/null
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
@@ -0,0 +1,105 @@
+DESCRIPTION = "GDAL is a translator library for raster geospatial data formats"
+HOMEPAGE = "http://www.gdal.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=b9bd75ae5af7ff87ab259be0121c4106"
+
+DEPENDS = "proj sqlite3"
+
+SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
+
+SRC_URI[md5sum] = "f354c614aea76e5630e4edbf06e5c292"
+SRC_URI[sha256sum] = "e6c9c6c4480228c943af29120d87435ddfe9ca460458bc60b91639fb8d443791"
+
+inherit autotools lib_package binconfig
+
+EXTRA_OECONF = "--without-perl \
+                --without-php \
+                --without-ruby \
+                --without-python \
+                \
+                --without-grass \
+                --without-libgrass \
+                --without-cfitsio \
+                --without-dds \
+                --without-gta \
+                --without-pcidsk \
+                --without-ogdi \
+                --without-fme \
+                --without-hdf4 \
+                --without-hdf5 \
+                --without-pg \
+                --without-jpeg12 \
+                --without-ogdi \
+                --without-netcdf \
+                --without-openjpeg \
+                --without-fgdb \
+                --without-ecw \
+                --without-kakadu \
+                --without-mrsid \
+                --without-jp2mrsid \
+                --without-mrsid_lidar \
+                --without-msg \
+                --without-bsb \
+                --without-grib \
+                --without-mysql \
+                --without-ingres \
+                --without-odbc \
+                --without-dods_root \
+                --without-xml2 \
+                --without-spatialite \
+                --without-pcre \
+                --without-dwgdirect \
+                --without-dwgdirect \
+                --without-idb \
+                --without-sde \
+                --without-sde-version \
+                --without-epsilon \
+                --without-webp \
+                --without-opencl \
+                --without-opencl-include \
+                --without-opencl-lib \
+                --without-freexl \
+                --without-pam \
+                --without-poppler \
+                --without-podofo \
+                --without-podofo-lib \
+                --without-podofo-extra-lib-for-test \
+                --without-static_proj4 \
+                --without-perl \
+                --without-php \
+                --without-ruby \
+                --without-python \
+                --without-java \
+                --without-mdb \
+                --without-jvm-lib \
+                --without-jvm-lib-add-rpath \
+                --without-rasdaman \
+                --without-armadillo \
+                \
+                --with-pcraster=internal \
+                --with-geotiff=internal \
+"
+
+EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
+
+PACKAGECONFIG ?= "geos png jasper"
+PACKAGECONFIG[geos] = "--with-geos,--without-geos,geos"
+PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
+PACKAGECONFIG[tiff] = "--with-libtiff,--without-tiff,tiff"
+PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[z] = "--with-libz,--without-libz,zlib"
+PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
+PACKAGECONFIG[curl] = "--with-curl,--without-curl,curl"
+
+do_configure_prepend () {
+    # The configure script has many hardcoded paths to search
+    # for the library headers when using external libraries,
+    # workaround it.
+    sed -e 's,/usr/include,NON_EXISTENT_DIR,g' \
+        -e 's,/usr/lib,NON_EXISTENT_DIR,g' \
+        -i ${S}/configure.in
+}
+
+FILES_${PN} += "${libdir}/gdalplugins"
-- 
1.8.4.3


