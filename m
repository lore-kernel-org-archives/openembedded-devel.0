Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2EB0770AF
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Nov 2015 02:52:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA12qJmv007689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2015 19:52:19 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 31 Oct 2015 19:52:19 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 31 Oct 2015 22:52:12 -0400
Message-ID: <1446346332-19991-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: update to 5.5.46
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
X-List-Received-Date: Sun, 01 Nov 2015 02:52:20 -0000
Content-Type: text/plain

This is the latest release in the 5.5.x stable series.
It fixes 11 CVEs as listed:
   https://mariadb.com/kb/en/mariadb/mariadb-5546-release-notes/
and fixes 10s of internal MariaDB tracked defects.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../mysql/{mariadb-native_5.5.45.bb => mariadb-native_5.5.46.bb}      | 0
 meta-oe/recipes-support/mysql/mariadb.inc                             | 4 ++--
 .../recipes-support/mysql/{mariadb_5.5.45.bb => mariadb_5.5.46.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.45.bb => mariadb-native_5.5.46.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.45.bb => mariadb_5.5.46.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 47a16a1..42a4eda 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -14,8 +14,8 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://fix-a-building-failure.patch \
           "
 
-SRC_URI[md5sum] = "6ec397f717f6e2e4e9154e76de9ec9fc"
-SRC_URI[sha256sum] = "4dc3aff6941ef1068412002915d795bcf67db0eaa38a5c6f3af57474c4226fb0"
+SRC_URI[md5sum] = "92f682b00eb137af01e59ea93f7e31f7"
+SRC_URI[sha256sum] = "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.45.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
-- 
1.9.1


