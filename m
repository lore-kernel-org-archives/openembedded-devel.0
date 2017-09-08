Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id AC11171BEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 08:26:43 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v888QhsF006339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 Sep 2017 10:26:43 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.177])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v888QhWu021058;
	Fri, 8 Sep 2017 10:26:43 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 10:26:22 +0200
Message-Id: <1504859182-22312-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] thrift: build lib for native and nativesdk
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
X-List-Received-Date: Fri, 08 Sep 2017 08:26:44 -0000

The libraries can also be build for native and nativesdk.
This is useful for running tests on the build machine.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
index 9baeed1..aa93283 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb
@@ -41,11 +41,6 @@ EXTRA_OECMAKE = " \
     -DWITH_QT5=OFF \
 "
 
-EXTRA_OECMAKE_append_class-native = "\
-             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_CPP=OFF"
-EXTRA_OECMAKE_append_class-nativesdk = "\
-             -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DWITH_PYTHON=OFF"
-
 PACKAGECONFIG ??= "libevent glib python"
 PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent,"
 PACKAGECONFIG[python] = "-DWITH_PYTHON=ON,-DWITH_PYTHON=OFF,python,"
-- 
2.1.4


