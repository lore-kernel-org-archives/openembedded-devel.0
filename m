Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D434978430
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA8JwBuV018787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:11 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:10 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:03 -0800
Message-ID: <20171108195805.136677-4-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20171108195805.136677-1-jslater@windriver.com>
References: <20171108195805.136677-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/5] libtdb: update to version 1.3.15
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
X-List-Received-Date: Wed, 08 Nov 2017 19:58:10 -0000
Content-Type: text/plain

Version needed to build samba 4.7.0.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/libtdb/{libtdb_1.3.14.bb => libtdb_1.3.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.14.bb => libtdb_1.3.15.bb} (91%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
similarity index 91%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
index 3122b93..302a306 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.14.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
 "
 
-SRC_URI[md5sum] = "dd23f2ba8ca2bfdcb833bc79d5b5ac6f"
-SRC_URI[sha256sum] = "3a7d4bb79229460df530c7e1c7067ba9fb9d370aa61fff537fdc2bdf918acbe9"
+SRC_URI[md5sum] = "60ece3996acc8d85b6f713199da971a6"
+SRC_URI[sha256sum] = "b4a1bf3833601bd9f10aff363cb750860aef9ce5b4617989239923192f946728"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.7.4


