Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88D7476714
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 06:52:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7E6qFN2006607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 23:52:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 13 Aug 2015 23:52:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Aug 2015 14:48:10 +0800
Message-ID: <1439534890-16193-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: 5.5.43 -> 5.5.45
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
X-List-Received-Date: Fri, 14 Aug 2015 06:52:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade mariadb from 5.5.43 to 5.5.45.

* update SRC_URI that the previous mirros is out of service
* drop backported patch fix-CVE-2015-2305.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mysql/{mariadb-native_5.5.43.bb => mariadb-native_5.5.45.bb}   | 0
 meta-oe/recipes-support/mysql/mariadb.inc                          | 7 +++----
 .../recipes-support/mysql/{mariadb_5.5.43.bb => mariadb_5.5.45.bb} | 0
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.43.bb => mariadb-native_5.5.45.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.43.bb => mariadb_5.5.45.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index d2418e7..c088461 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+SRC_URI = "http://lon1.mirrors.digitalocean.com/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
@@ -12,11 +12,10 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
-           file://fix-CVE-2015-2305.patch \
           "
 
-SRC_URI[md5sum] = "c8760d6b5890fc1de76c07af48092c88"
-SRC_URI[sha256sum] = "a0709997140549154edb87c9dfab564cd4755b238251acbf42369118f9bb4d01"
+SRC_URI[md5sum] = "6ec397f717f6e2e4e9154e76de9ec9fc"
+SRC_URI[sha256sum] = "4dc3aff6941ef1068412002915d795bcf67db0eaa38a5c6f3af57474c4226fb0"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.43.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.43.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
-- 
1.9.1


