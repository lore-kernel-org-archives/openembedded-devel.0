Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAE17FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 03:24:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA83OqY0028022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Nov 2019 19:24:52 -0800
Received: from localhost (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 7 Nov 2019 19:24:51 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 11:24:48 +0800
Message-ID: <20191108032449.9342-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.241]
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 1.5.5 -> 1.5.6
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
X-List-Received-Date: Fri, 08 Nov 2019 03:24:51 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.5.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.6.bb
index b19c964d8..99eb6f9ce 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
-SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
+SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
+SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
 
 inherit waf-samba distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.17.1


