Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44B9C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 17:28:51 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.14804.1638552529645892163
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 09:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B3HSmbA003774
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 3 Dec 2021 09:28:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1B3HSmot014717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 3 Dec 2021 09:28:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 3 Dec 2021 09:28:48 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 3 Dec 2021 09:28:47 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH] io-compress-lzma-perl: add recipe for version
 2.096
Date: Fri, 3 Dec 2021 12:28:47 -0500
Message-ID: <20211203172847.26115-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 17:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94202

Add recipe for io-compress-lzma-perl and its dependencies.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../libio/compress-raw-lzma-perl_2.096.bb     | 33 +++++++++++++++++++
 .../libio/io-compress-lzma-perl_2.096.bb      | 25 ++++++++++++++
 .../libio/io-compress-perl_2.096.bb           | 25 ++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
 create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb

diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
new file mode 100644
index 000000000..431a18f0c
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
+compression/uncompression functions from the lzma compression library."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
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
diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
new file mode 100644
index 000000000..27dfe01c2
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This module provides a Perl interface that allows writing lzma compressed \
+data to files or buffer."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
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
+RDEPENDS_${PN} += "compress-raw-lzma-perl"
+RDEPENDS_${PN} += "io-compress-perl"
+
+S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
new file mode 100644
index 000000000..a7c669ff4
--- /dev/null
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This module is not intended for direct use in application code. Its sole \
+purpose is to be sub-classed by IO::Compress modules."
+
+SECTION = "libs"
+LICENSE = "Artisticv1 | GPLv1+"
+PR = "r0"
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
+RDEPENDS_${PN} += "compress-raw-bzip2-perl"
+RDEPENDS_${PN} += "compress-raw-zlib-perl"
+
+S = "${WORKDIR}/IO-Compress-${PV}"
+
+inherit cpan allarch
+
+BBCLASSEXTEND = "native"
-- 
2.33.0


