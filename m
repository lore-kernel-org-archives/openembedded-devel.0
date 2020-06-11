Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web10.5458.1591875695308207572
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 04:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 05BBfWZT024329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:41:33 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.53])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 05BBfW3t012803;
	Thu, 11 Jun 2020 13:41:32 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CAC367FCDE8;
	Thu, 11 Jun 2020 13:41:31 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-oe][PATCH] thrift: drop unsupported features
Date: Thu, 11 Jun 2020 13:40:30 +0200
Message-Id: <20200611114030.589-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

- QT4 support was dropped
- Feature for switching between boost and std pointer was dropped
 - only std pointers are supported since version 0.13.0

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
index 92bcb21bf..e3880b357 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.13.0.bb
@@ -24,7 +24,6 @@ export BUILD_SYS
 export HOST_SYS
 
 EXTRA_OECMAKE = " \
-    -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DBUILD_LIBRARIES=ON \
     -DBUILD_COMPILER=ON \
     -DBUILD_TESTING=OFF \
@@ -36,15 +35,12 @@ EXTRA_OECMAKE = " \
     -DWITH_STATIC_LIB=ON \
     -DWITH_SHARED_LIB=ON \
     -DWITH_OPENSSL=ON \
-    -DWITH_QT4=OFF \
     -DWITH_QT5=OFF \
-    -DWITH_BOOST_FUNCTIONAL=OFF \
 "
 
-PACKAGECONFIG ??= "libevent glib boost-smart-ptr"
+PACKAGECONFIG ??= "libevent glib"
 PACKAGECONFIG[libevent] = "-DWITH_LIBEVENT=ON,-DWITH_LIBEVENT=OFF,libevent"
 PACKAGECONFIG[glib] = "-DWITH_C_GLIB=ON,-DWITH_C_GLIB=OFF,glib-2.0"
-PACKAGECONFIG[boost-smart-ptr] = "-DWITH_BOOST_SMART_PTR=ON,-DWITH_BOOST_SMART_PTR=OFF,boost"
 
 do_install_append () {
     ln -sf thrift ${D}/${bindir}/thrift-compiler
-- 
2.11.0

