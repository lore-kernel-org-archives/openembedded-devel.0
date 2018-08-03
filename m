Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5917978E10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 01:30:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w731URUg020699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2018 18:30:27 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 2 Aug 2018 18:30:27 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 18:30:27 -0700
Message-ID: <20180803013027.108804-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Upgrade to 5.5.61
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
X-List-Received-Date: Fri, 03 Aug 2018 01:30:26 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_5.5.60.bb => mariadb-native_5.5.61.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_5.5.60.bb => mariadb_5.5.61.bb}            | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.60.bb => mariadb-native_5.5.61.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.60.bb => mariadb_5.5.61.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.60.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.61.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.60.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.61.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 3afd392af..8ac0dbb51 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,8 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-SRC_URI[md5sum] = "afbadcf2980ad5aa205084dd401f1b7f"
-SRC_URI[sha256sum] = "4d3d444555416028ce39d3fb4cdc9cf6a658fcd4b0d2d0c45a73f9bf01d07929"
+SRC_URI[md5sum] = "cb343f855a35ed24ea25984144963f9f"
+SRC_URI[sha256sum] = "57afd089e3b458cda26beeda63c0bfe125baa6fead2120478788f1945e551013"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.60.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.61.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.60.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.61.bb
-- 
2.17.1


