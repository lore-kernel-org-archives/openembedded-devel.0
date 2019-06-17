Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5161C7E8B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:41:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5H8fpCH012708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2019 01:41:51 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 17 Jun 2019 01:41:51 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jun 2019 01:41:51 -0700
Message-ID: <20190617084151.62468-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.3.16
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
X-List-Received-Date: Mon, 17 Jun 2019 08:41:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

License-Update:
The address of Free Software Foundation updated

Bug fixes:
 MDEV-19490: show tables fails when selecting the information_schema database
 MDEV-19541: InnoDB crashes when trying to recover a corrupted page

More details check:
 https://jira.mariadb.org/browse/MDEV-19490
 https://jira.mariadb.org/browse/MDEV-19541

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ariadb-native_10.3.15.bb => mariadb-native_10.3.16.bb} | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                     | 8 ++++----
 .../mysql/{mariadb_10.3.15.bb => mariadb_10.3.16.bb}      | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.15.bb => mariadb-native_10.3.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.15.bb => mariadb_10.3.16.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index eed23d28a..9a398b308 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -2,9 +2,9 @@ SUMMARY = "A robust, scalable, and reliable SQL server"
 HOMEPAGE = "http://mariadb.org"
 SECTION = "libs"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://downloads.mariadb.com/MariaDB/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "08edd8b5060a181e6dd3c6aac23218cd"
-SRC_URI[sha256sum] = "27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968"
+SRC_URI[md5sum] = "11220d0b94c5c24caa2e1e9eaba38e31"
+SRC_URI[sha256sum] = "39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
-- 
2.21.0


