Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 24F08745AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 13:35:19 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9UDZJt9027914
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:35:19 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.154])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9UDZJYO011773;
	Tue, 30 Oct 2018 14:35:19 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 12D0310D47AD;
	Tue, 30 Oct 2018 14:35:19 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2018 14:35:10 +0100
Message-Id: <20181030133511.2954-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH 1/2] civetweb: remove redundant EXTRA_OECMAKE_class-native
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
X-List-Received-Date: Tue, 30 Oct 2018 13:35:20 -0000

They are the same as the default version.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_git.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index 9a7844ad0..004cf960a 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -24,12 +24,6 @@ EXTRA_OECMAKE = " \
     -DCIVETWEB_ENABLE_LUA=OFF \
     -DCIVETWEB_ENABLE_ASAN=OFF \
 "
-EXTRA_OECMAKE_class-native = " \
-    -DBUILD_SHARED_LIBS=ON \
-    -DCIVETWEB_ENABLE_DUKTAPE=OFF \
-    -DCIVETWEB_ENABLE_LUA=OFF \
-    -DCIVETWEB_ENABLE_ASAN=OFF \
-"
 
 # Building with ninja fails on missing third_party/lib/libcheck.a (which
 # should come from external CMake project)
-- 
2.11.0


