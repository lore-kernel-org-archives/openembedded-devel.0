Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F90D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:26:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q9QC9p001383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:26:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 02:26:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jul 2016 17:23:12 +0800
Message-ID: <20160726092312.16134-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: upgrade to 5.5.50
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2016 09:26:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade mariadb from 5.5.46 to 5.5.50.

* update runtime dependency of mariadb-setupdb which requires command install

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mysql/{mariadb-native_5.5.46.bb => mariadb-native_5.5.50.bb}     | 0
 meta-oe/recipes-support/mysql/mariadb.inc                            | 5 +++--
 .../recipes-support/mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb}   | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.46.bb => mariadb-native_5.5.50.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 4801ffe..9c3d234 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -17,8 +17,8 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://fix-a-building-failure.patch \
           "
 
-SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
-SRC_URI[sha256sum] = "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
+SRC_URI[md5sum] = "5cfb169934170a429589e05f0f5aba9c"
+SRC_URI[sha256sum] = "030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
@@ -176,6 +176,7 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-modu
     perl-module-file-spec perl-module-file-find perl-module-file-basename perl-module-file-path \
     perl-module-constant perl-module-lib perl-module-file-temp perl-module-file-spec-functions \
     perl-module-io-socket-inet perl-module-io-select"
+RDEPENDS_${PN}-setupdb = "coreutils"
 
 # Allow old code to link to the backward compatible library
 RDEPENDS_libmysqlclient-dev = "libmysqlclient-r-dev"
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
-- 
2.9.2.368.g08bb350


