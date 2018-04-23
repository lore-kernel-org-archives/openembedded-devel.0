Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A79296093B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2018 09:15:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3N9FF5A024993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Apr 2018 02:15:15 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 23 Apr 2018 02:15:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>
Date: Mon, 23 Apr 2018 17:22:49 +0800
Message-ID: <1524475369-32433-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mariadb: 5.5.57 -> 5.5.59
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
X-List-Received-Date: Mon, 23 Apr 2018 09:15:16 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../mysql/{mariadb-native_5.5.57.bb => mariadb-native_5.5.59.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                                 | 4 ++--
 meta-oe/recipes-dbs/mysql/{mariadb_5.5.57.bb => mariadb_5.5.59.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.57.bb => mariadb-native_5.5.59.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.57.bb => mariadb_5.5.59.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.57.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.59.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.57.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.59.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index a29d441..99e7050 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://0001-disable-ucontext-on-musl.patch \
           "
 
-SRC_URI[md5sum] = "2d4104aae0b9e5efa8878918bd329cb4"
-SRC_URI[sha256sum] = "5dbde98d7e4a5a1721b6cbed7898b2549a88866247951cf586057975c6cea641"
+SRC_URI[md5sum] = "3cec4afc06b468687ef576c90148d10d"
+SRC_URI[sha256sum] = "c3269ce20b45b177239fd1e3d6d9428a94131711f12758ebf5f65222278bb110"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.57.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.59.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.57.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.59.bb
-- 
2.7.4


