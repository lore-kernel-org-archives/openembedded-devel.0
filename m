Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4BDE707BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 05:55:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7R5t4au017970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Aug 2014 22:55:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 26 Aug 2014 22:55:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Aug 2014 13:49:43 +0800
Message-ID: <1409118583-30139-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH] mariadb: upgrade from 5.5.38 to 39
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
X-List-Received-Date: Wed, 27 Aug 2014 05:55:07 -0000
Content-Type: text/plain

Upgrade mariadb from 5.5.38 to 5.5.39. Previous upgrade made a lot of
work, so it is easy this time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mysql/{mariadb-native_5.5.38.bb => mariadb-native_5.5.39.bb}      | 0
 .../recipes-support/mysql/{mariadb_5.5.38.bb => mariadb_5.5.39.bb}    | 0
 .../recipes-support/mysql/{mariadb_5.5.38.inc => mariadb_5.5.39.inc}  | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.38.bb => mariadb-native_5.5.39.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.38.bb => mariadb_5.5.39.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.38.inc => mariadb_5.5.39.inc} (98%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.38.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.38.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.38.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
similarity index 98%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
rename to meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
index 8a73833..a9a050e 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
@@ -11,8 +11,8 @@ SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-$
            file://my.cnf \
           "
 
-SRC_URI[md5sum] = "fa9ba00b084b95a45fab70860c412f10"
-SRC_URI[sha256sum] = "efc839e6627064b3b5c6c39854198f0d34907f48937804758d4c09c7717be8d3"
+SRC_URI[md5sum] = "917a807d8cf2c8ef9deedd2a89b6decd"
+SRC_URI[sha256sum] = "cb850865ab55ce5f01c99a612cc75b76ead5d75adfa75a606f453d32f9089d14"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
-- 
1.9.1


