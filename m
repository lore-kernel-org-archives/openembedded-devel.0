Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5D40A79C9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 13:35:21 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9UDZMY5008989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:35:22 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.154])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9UDZMjZ013096;
	Tue, 30 Oct 2018 14:35:22 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 4042F10D47AD;
	Tue, 30 Oct 2018 14:35:22 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2018 14:35:11 +0100
Message-Id: <20181030133511.2954-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181030133511.2954-1-pascal.bach@siemens.com>
References: <20181030133511.2954-1-pascal.bach@siemens.com>
Subject: [meta-networking][PATCH 2/2] civetweb: disable tests
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
X-List-Received-Date: Tue, 30 Oct 2018 13:35:22 -0000

Tests try to download third party code and bypass the bitbake fetcher to
do that. This will not work in environments with no internet access.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
index 004cf960a..d681f7f30 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
@@ -23,6 +23,7 @@ EXTRA_OECMAKE = " \
     -DCIVETWEB_ENABLE_DUKTAPE=OFF \
     -DCIVETWEB_ENABLE_LUA=OFF \
     -DCIVETWEB_ENABLE_ASAN=OFF \
+    -DCIVETWEB_BUILD_TESTING=OFF \
 "
 
 # Building with ninja fails on missing third_party/lib/libcheck.a (which
-- 
2.11.0


