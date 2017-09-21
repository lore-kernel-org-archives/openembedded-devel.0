Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 83E9C7827A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 12:01:25 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v8LC1QvN023891
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:01:26 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.79.28])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v8LC1PDW029299;
	Thu, 21 Sep 2017 14:01:25 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 14:01:23 +0200
Message-Id: <1505995283-14453-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] luajit: create developer symlinks
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
X-List-Received-Date: Thu, 21 Sep 2017 12:01:26 -0000

LuaJIT tries to call ldconfig during installation which doesn't work.
This causes the .so and .so.2 symlinks to no be created.

By setting "LDCONFIG= :" the call will be skipped the same as on Darwin

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index d7477ed..1e06e34 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -52,6 +52,7 @@ EXTRA_OEMAKE = "\
     \
     'PREFIX=${prefix}' \
     'MULTILIB=${baselib}' \
+    'LDCONFIG= :' \
 "
 
 do_compile () {
-- 
2.1.4


