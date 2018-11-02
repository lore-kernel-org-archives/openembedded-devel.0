Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3421779DC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 03:42:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA23fpx7023366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Nov 2018 20:42:17 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 1 Nov 2018 20:42:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 20:41:59 -0700
Message-ID: <20181102034159.121267-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Upgrade to 5.5.62
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
X-List-Received-Date: Fri, 02 Nov 2018 03:42:42 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

MariaDB 5.5.62 is a maintenance release.

It includes bugfixes and updates, including from
MySQL 5.5.62.
. XtraDB updated to 5.5.61-38.13
. Fixes for the following security vulnerabilities:
  CVE-2018-3282
  CVE-2018-3174

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_5.5.61.bb => mariadb-native_5.5.62.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_5.5.61.bb => mariadb_5.5.62.bb}            | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.61.bb => mariadb-native_5.5.62.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.61.bb => mariadb_5.5.62.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.61.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.61.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index b9fa98b5a..8ca5b2ba4 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,8 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-SRC_URI[md5sum] = "cb343f855a35ed24ea25984144963f9f"
-SRC_URI[sha256sum] = "57afd089e3b458cda26beeda63c0bfe125baa6fead2120478788f1945e551013"
+SRC_URI[md5sum] = "6375d577e9539b839f44d857e70f82b9"
+SRC_URI[sha256sum] = "56a365af71b8a9ec8bfee0801e2dec95011da8ee7507986ca329be11296411db"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.61.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.61.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
-- 
2.17.1


