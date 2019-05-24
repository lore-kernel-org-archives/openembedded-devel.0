Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F11E27E45D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 01:41:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4O1fJVN024362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 18:41:20 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 23 May 2019 18:41:19 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 May 2019 18:41:19 -0700
Message-ID: <20190524014119.123821-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.3.15
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
X-List-Received-Date: Fri, 24 May 2019 01:41:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes for the following security vulnerabilities:
 CVE-2019-2614
 CVE-2019-2627
 CVE-2019-2628

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../{mariadb-native_10.3.13.bb => mariadb-native_10.3.15.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_10.3.13.bb => mariadb_10.3.15.bb}          | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.13.bb => mariadb-native_10.3.15.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.13.bb => mariadb_10.3.15.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.15.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index fca74d448..eed23d28a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "603ce42e35b9a688f2cca05275acb5cb"
-SRC_URI[sha256sum] = "b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a"
+SRC_URI[md5sum] = "08edd8b5060a181e6dd3c6aac23218cd"
+SRC_URI[sha256sum] = "27f391a54d544f93850d4edfb3ef1b4cf24f8e27e61e51727b0e7d31bb4d6968"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.15.bb
-- 
2.21.0


