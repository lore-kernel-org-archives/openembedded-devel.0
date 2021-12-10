Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384C4C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 17:28:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.10416.1639157329891193606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BAHSlsP024736
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:28:48 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BAHSl1X024140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 09:28:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Dec 2021 09:28:47 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 10 Dec 2021 09:28:47 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH] io-compress-lzma-perl: add recipe for version
 2.096
Date: Fri, 10 Dec 2021 12:28:46 -0500
Message-ID: <20211210172846.19510-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 17:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94274

Add recipe for io-compress-lzma-perl and all the dependencies.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../libio/compress-raw-bzip2-perl_2.096.bb    | 32 +++++++++++++++++++
 .../libio/compress-raw-lzma-perl_2.096.bb     | 32 +++++++++++++++++++
 .../libio/compress-raw-zlib-perl_2.096.bb     | 31 ++++++++++++++++++
 .../libio/io-compress-lzma-perl_2.096.bb      | 24 ++++++++++++++
 .../libio/io-compress-perl_2.096.bb           | 24 ++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb

diff --git a/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
new file mode 100644
index 000000000..272f7c5f3
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-bzip2-perl_2.096.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = ""Compress::Raw::Bzip2" provides an interface to the in-memory \
+compression/uncompression functions from the bzip2 compression library."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Bzip2"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-2.096.tar.gz"
+
+SRC_URI[md5sum] = "4fdb7ea5071e4b774c52c37331386355"
+SRC_URI[sha256sum] = "a564e7634eca7740c5487d01effe1461e9e51b8909e69b3d8f5be98997958cbe"
+
+DEPENDS += "bzip2"
+
+S = "${WORKDIR}/Compress-Raw-Bzip2-${PV}"
+
+inherit cpan
+
+export BUILD_BZIP2="0"
+export BZIP2_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
new file mode 100644
index 000000000..38655892a
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
+compression/uncompression functions from the lzma compression library."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Lzma"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz"
+
+SRC_URI[md5sum] = "b5079bb43712fcd1e74b80777fa376ed"
+SRC_URI[sha256sum] = "f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217"
+
+DEPENDS += "xz"
+
+S = "${WORKDIR}/Compress-Raw-Lzma-${PV}"
+
+inherit cpan
+
+export LIBLZMA_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
+export LIBLZMA_LIB="-I${STAGING_DIR_HOST}${libdir}"
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
new file mode 100644
index 000000000..8b2ab1459
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-zlib-perl_2.096.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "The *Compress::Raw::Zlib* module provides a Perl interface to the *zlib* \
+compression library (see "AUTHOR" for details about where to get *zlib*)."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/Compress-Raw-Zlib"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.096.tar.gz"
+
+SRC_URI[md5sum] = "4144ecdd901231553447998cf8035e4a"
+SRC_URI[sha256sum] = "cd4cba20c159a7748b8bc91278524a7da70573d9531fde62298609a5f1c65912"
+
+DEPENDS += "zlib"
+
+S = "${WORKDIR}/Compress-Raw-Zlib-${PV}"
+
+inherit cpan
+
+export BUILD_ZLIB="0"
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
new file mode 100644
index 000000000..a5c773551
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "This module provides a Perl interface that allows writing lzma compressed \
+data to files or buffer."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/IO-Compress-Lzma"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz"
+
+SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
+SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
+RDEPENDS:${PN} += "compress-raw-lzma-perl"
+RDEPENDS:${PN} += "io-compress-perl"
+
+S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
new file mode 100644
index 000000000..01580db03
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "This module is not intended for direct use in application code. Its sole \
+purpose is to be sub-classed by IO::Compress modules."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+
+MAINTAINER=	"Poky <poky@yoctoproject.org>"
+HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
+
+SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
+SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
+RDEPENDS:${PN} += "compress-raw-bzip2-perl"
+RDEPENDS:${PN} += "compress-raw-zlib-perl"
+
+S = "${WORKDIR}/IO-Compress-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
-- 
2.33.0


