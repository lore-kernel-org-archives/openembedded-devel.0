Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3A3078412
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8JwCpW026325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:12 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:11 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:04 -0800
Message-ID: <20171108195805.136677-5-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20171108195805.136677-1-jslater@windriver.com>
References: <20171108195805.136677-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/5] libldb: update to version 1.2.2
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
X-List-Received-Date: Wed, 08 Nov 2017 19:58:11 -0000
Content-Type: text/plain

Version needed to build samba 4.7.0.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/libldb/{libldb_1.1.29.bb => libldb_1.2.2.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.1.29.bb => libldb_1.2.2.bb} (92%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb b/meta-networking/recipes-support/libldb/libldb_1.2.2.bb
similarity index 92%
rename from meta-networking/recipes-support/libldb/libldb_1.1.29.bb
rename to meta-networking/recipes-support/libldb/libldb_1.2.2.bb
index a90919b..cb9ea92 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.2.2.bb
@@ -29,8 +29,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "9c90abfb94c1e2a693399392cf4cddb9"
-SRC_URI[sha256sum] = "59d84f9a5b799f519ba7b2685bb46f5a26f1bbf05b7a144b2f5e017d01d80f97"
+SRC_URI[md5sum] = "91284a12423def99a6592e393e3b7fbb"
+SRC_URI[sha256sum] = "0cedeadb75de401c9735127f654dbc1a391c4327a2b83be54078be286fed1113"
 
 inherit waf-samba
 
@@ -38,7 +38,7 @@ S = "${WORKDIR}/ldb-${PV}"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
-                 --bundled-libraries=NONE \
+                 --bundled-libraries=cmocka \
                  --builtin-libraries=replace \
                  --with-modulesdir=${libdir}/ldb/modules \
                  --with-privatelibdir=${libdir}/ldb \
-- 
2.7.4


