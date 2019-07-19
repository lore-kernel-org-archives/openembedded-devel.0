Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5BD77F102
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 10:07:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6JA7oR3029366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 03:07:50 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 19 Jul 2019 03:07:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 18:07:46 +0800
Message-ID: <1563530867-20806-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 1.5.4 -> 1.5.5
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
X-List-Received-Date: Fri, 19 Jul 2019 10:07:49 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/libldb/{libldb_1.5.4.bb => libldb_1.5.5.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.4.bb => libldb_1.5.5.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.4.bb b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.4.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.5.bb
index 65a6431..b19c964 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.4.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "24d9f18b085ba27f96d4dec643abea39"
-SRC_URI[sha256sum] = "db5beea64e305ef002a28fc6b6ca8e42b5fbee268bd713ff41e76c56a0a071d3"
+SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
+SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
 
 inherit waf-samba distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.7.4


