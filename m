Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9742378735
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 14:49:28 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w0HEfN2C006777
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:41:23 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.55.96])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w0HEfNIv007213;
	Wed, 17 Jan 2018 15:41:23 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 334E910003F8;
	Wed, 17 Jan 2018 15:41:23 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:40:31 +0100
Message-Id: <20180117144031.26851-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCHv2] luajit: create developer symlinks
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
X-List-Received-Date: Wed, 17 Jan 2018 14:49:29 -0000

LuaJIT tries to call ldconfig during installation which doesn't work.
This causes the .so and .so.2 symlinks to no be created.

By setting "LDCONFIG= :" the call will be skipped the same as on Darwin

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 73c38111e..2e9187564 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -53,6 +53,7 @@ EXTRA_OEMAKE = "\
     \
     'PREFIX=${prefix}' \
     'MULTILIB=${baselib}' \
+    'LDCONFIG=:' \
 "
 
 do_compile () {
-- 
2.11.0


