Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7428CA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:13:31 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.7367.1757024001548939494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gWcRer1R;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025090422131936f438213600020756-jbcity@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025090422131936f438213600020756
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:13:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JRWVDjcSC7UdnAanqlF5rvLu/YBZA6Eag3H2qrTER2k=;
 b=gWcRer1RYPl1lwt3vq+gcddwMtQ8uHUe0gi9lnNSqwfgX7IER/54OyHsuW6/LPnWR2SfVy
 UhPWR4/4VYNpbPZKBRGwZzRg2aDcF3s6afXopH+8KYtq0CRHwWECBVurbN6p3PZdfJgcK9y0
 c+yDM6QRZhk5IeMeb+Jx7wAgSfX/N+Iw2NhjC2jcFXY+vSV1Y+VLx1pevHQBlgXBnDlGdzNb
 cOx/WG91ZaXMQ0yKKT7i45PqUqKD7vZJPk8DcQClz7urvAFfmLMqsvDkhzz9b4zjTrS8Ewja
 i7nUlMrfKtcbVRzUyqB67LRiCKJpUTBWJFfsxr3YuHkWgZyVDzwRmfdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 08/10] poco: enable postgresql support
Date: Fri,  5 Sep 2025 00:11:37 +0200
Message-Id: <20250904221139.3131569-8-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119305

From: Peter Marko <peter.marko@siemens.com>

This was added in recent poco versions and this recipe seems to have
configs for all features.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 21 +++++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.13.3.bb | 16 +++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index 95fd988e48..5721ca39e4 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -7,6 +7,25 @@ if ! nslookup secure.appinf.com >/dev/null 2>&1; then
   echo 'nameserver 8.8.8.8' > /etc/resolv.conf
 fi
 
+setup_test() {
+  case "$1" in
+    "DataPostgreSQL-testrunner")
+      if [ "$2" = "start" ]; then
+        # init database
+        postgresql-setup initdb
+        # do not require authentication for tests
+        mv /var/lib/postgresql/data/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf.backup
+        sed s:ident$:trust: /var/lib/postgresql/data/pg_hba.conf.backup > /var/lib/postgresql/data/pg_hba.conf
+        # start as in combination of posgresql.service and posgresql.init
+        su -l postgres -c 'pg_ctl start -D /var/lib/postgresql/data -s -o "-p 5432" -w -t 300'
+      else
+        su -l postgres -c 'pg_ctl stop -D /var/lib/postgresql/data -s -m fast'
+        mv /var/lib/postgresql/data/pg_hba.conf.backup /var/lib/postgresql/data/pg_hba.conf
+      fi
+      ;;
+  esac
+}
+
 export POCO_BASE=/usr/lib/poco/ptest
 export LD_LIBRARY_PATH=${POCO_BASE}/bin:${LD_LIBRARY_PATH}
 i=0
@@ -14,7 +33,9 @@ while read runner; do
   oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
+  setup_test $runner start
   ./$runner -ignore $oldpath/cppignore.lnx -all
+  setup_test $runner stop
   export res$((i++))=$?
   cd $oldpath >/dev/null
 done < testrunners
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index 6d93ca4b08..c57c207f82 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -24,7 +24,7 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Prometheus"
+PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite Zip Encodings Prometheus"
 # MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
 # and mongodb needs meta-python enabled as well
 PACKAGECONFIG:remove:riscv32 = "MongoDB"
@@ -32,7 +32,7 @@ PACKAGECONFIG:remove:riscv64 = "MongoDB"
 PACKAGECONFIG:remove:mipsarch = "MongoDB"
 PACKAGECONFIG:remove:powerpc = "MongoDB"
 # Following options have dependencies on recipes which don't have native variant
-PACKAGECONFIG:remove:class-native = "MongoDB DataODBC"
+PACKAGECONFIG:remove:class-native = "MongoDB DataODBC DataPostgreSQL"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
@@ -43,6 +43,7 @@ PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
 PACKAGECONFIG[Crypto] = "-DENABLE_CRYPTO=ON,-DENABLE_CRYPTO=OFF,openssl"
 PACKAGECONFIG[JWT] = "-DENABLE_JWT=ON,-DENABLE_JWT=OFF,openssl"
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
+PACKAGECONFIG[DataPostgreSQL] = "-DENABLE_DATA_POSTGRESQL=ON,-DENABLE_DATA_POSTGRESQL=OFF,postgresql,postgresql"
 PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
@@ -94,6 +95,9 @@ python populate_packages:prepend () {
 do_install_ptest () {
        cp -rf ${B}/bin/ ${D}${PTEST_PATH}
        cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}
+       if ${@bb.utils.contains('PACKAGECONFIG', 'DataPostgreSQL', 'true', 'false', d)}; then
+            cp -f ${B}/lib/libPocoDataTest.so* ${D}${libdir}
+       fi
        cp -rf ${B}/*/testsuite/data ${D}${PTEST_PATH}/bin/
        find "${D}${PTEST_PATH}" -executable -exec chrpath -d {} \;
        rm -f ${D}${PTEST_PATH}/testrunners
@@ -108,12 +112,14 @@ PACKAGES_DYNAMIC = "poco-.*"
 # "poco" is a metapackage which pulls in all Poco components
 ALLOW_EMPTY:${PN} = "1"
 
-# cppunit is only built if tests are enabled
-PACKAGES =+ "${PN}-cppunit"
+# cppunit and datatest is only built if tests are enabled
+PACKAGES =+ "${PN}-cppunit ${PN}-datatest"
 FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
+FILES:${PN}-datatest += "${libdir}/libPocoDataTest.so*"
+ALLOW_EMPTY:${PN}-datatest = "1"
 
-RDEPENDS:${PN}-ptest += "${PN}-cppunit"
+RDEPENDS:${PN}-ptest += "${PN}-cppunit ${PN}-datatest"
 RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'MongoDB', 'mongodb', '', d)}"
 RDEPENDS:${PN}-ptest += "${@bb.utils.contains('PACKAGECONFIG', 'Redis', 'redis', '', d)}"
 

