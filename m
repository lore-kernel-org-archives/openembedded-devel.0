Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 08A736DF56
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 21:44:22 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id b20so10491658yha.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 13:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=0IwpMIGMw44IixdBcLN8FotbZ0r5hPlCmF+MQV7nr0k=;
	b=ReIgRqfVKvhRO8aDp2cFU2V4iozyh67VBv9n+COSNZZJSSsYxfIp8OjqKh3dWysLsS
	sn5CR1nqKSRpfUwLUReFvYqLj8klHJm/0o7XjyRVPuoIyz4K/p5EgIJCkxUQfaUopC9U
	NcfG11g74Uzqc8VVfLwqD65y92GP2S6fBMfwFJ/RAEyC4GfLQtGXrZtFk2wiJog8X3x0
	W0V3ImZxbAW45Hn8Ujm78sg+lqn6As0ux/EsnEH3VX3U4mjA7U8NwwHT8LfNz308boA5
	W6eRfHWTIH9qfE/spX8C7YnXGUbcbDZjkfAiwSm7qhO3dJa+r9MZn/V/TiJokiZLbNtg
	fWMw==
X-Received: by 10.236.134.139 with SMTP id s11mr3365599yhi.133.1386107061904; 
	Tue, 03 Dec 2013 13:44:21 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id q9sm1834649yhk.16.2013.12.03.13.44.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 13:44:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1A977175EF897; Tue,  3 Dec 2013 19:44:16 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  3 Dec 2013 19:44:06 -0200
Message-Id: <1386107047-27409-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe 4/5] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Tue, 03 Dec 2013 21:44:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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


