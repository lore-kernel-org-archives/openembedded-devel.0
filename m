Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D25DD746FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:40:23 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w3CFeNBc018624
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 17:40:23 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.65])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w3CFeNfr005911;
	Thu, 12 Apr 2018 17:40:23 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7EEC210BE3A3;
	Thu, 12 Apr 2018 17:40:23 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Apr 2018 17:40:18 +0200
Message-Id: <20180412154018.6247-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] rocksdb: update to 5.12.2
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
X-List-Received-Date: Thu, 12 Apr 2018 15:40:24 -0000

Also remove the +gitSRCPV suffix from the version.
This is an official release and the version should be enough,
it adds only clutter.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 9b19c1a5f..1e6cbae38 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "266ac245affd69555643b735d19d3715c4eff91a"
-PV = "5.8+git${SRCPV}"
+SRCREV = "8969445642039566214d650cc6614849e7dd5e17"
+SRCBRANCH = "5.12.fb"
+PV = "5.12.2"
 
-SRC_URI = "git://github.com/facebook/${BPN}.git"
+SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


