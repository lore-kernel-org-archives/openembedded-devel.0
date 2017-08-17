Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D473B7846B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:39:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H9dFgg008037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:39:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 17 Aug 2017 02:39:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Aug 2017 17:28:28 +0800
Message-ID: <20170817092828.3629-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] mariadb: 5.5.55 -> 5.5.57
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
X-List-Received-Date: Thu, 17 Aug 2017 09:39:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade mariadb from 5.5.55 to 5.5.57.

* update SRC_URI that mariadb.com doesn't provides source tarball of 5.5.57
* remove gcc7.patch which is not needed any more

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{mariadb-native_5.5.55.bb => mariadb-native_5.5.57.bb}  |  0
 meta-oe/recipes-support/mysql/mariadb.inc                   |  8 ++++----
 meta-oe/recipes-support/mysql/mariadb/gcc7.patch            | 13 -------------
 .../mysql/{mariadb_5.5.55.bb => mariadb_5.5.57.bb}          |  0
 4 files changed, 4 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.55.bb => mariadb-native_5.5.57.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/gcc7.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.55.bb => mariadb_5.5.57.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index fd9dcbd..32e3eaa 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
@@ -17,10 +17,10 @@ SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
            file://fix-a-building-failure.patch \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
-           file://gcc7.patch \
           "
-SRC_URI[md5sum] = "54a0bbbc9b67308e7c076622d02f0fcd"
-SRC_URI[sha256sum] = "cb94e315d0fc90c62db5a6c7829c9966f674285d99b3ba3ffa575fb4a26edc86"
+
+SRC_URI[md5sum] = "2d4104aae0b9e5efa8878918bd329cb4"
+SRC_URI[sha256sum] = "5dbde98d7e4a5a1721b6cbed7898b2549a88866247951cf586057975c6cea641"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
deleted file mode 100644
index 3e75b26..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: mariadb-5.5.55/client/mysql.cc
-===================================================================
---- mariadb-5.5.55.orig/client/mysql.cc
-+++ mariadb-5.5.55/client/mysql.cc
-@@ -2850,7 +2850,7 @@ You can turn off this feature to get a q
-         mysql_free_result(fields);
-         break;
-       }
--      field_names[i][num_fields*2]= '\0';
-+      field_names[i][num_fields*2][0]= '\0';
-       j=0;
-       while ((sql_field=mysql_fetch_field(fields)))
-       {
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
-- 
2.10.1


