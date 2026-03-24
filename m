Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB56DFEC0F3
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:41:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4549.1774377666475020050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 11:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=C1uXjVdX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202603241841038f6fbf69910002070f-wq8m1s@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603241841038f6fbf69910002070f
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Mar 2026 19:41:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IqLd6M+4pS28jNyZ6DyZK4pCtnkSalMwM4W/RWoGJqI=;
 b=C1uXjVdXm6vIc/dRlVlRDQMx5zfzaJBlf9XyL69F+jAwmhGo1EGIbUY3TLXTLJZHq3pf4S
 ABqyLXkXT3x36SHkDFG0bIMyp15my6KmsJeM+xLqMTx/iHY8ydtHJ6atpl1rFlXbOIZYYOom
 ip0y9lgGK3F7SRHOXqg9jLfzQ363eyL6md5eDeksviPlt8Wui4vJrFEll0niP7ZO9tyaYW2N
 ppQW1/5J6QdlM7HGv6sz6Jnw1THNSSA5vGU2KrNg9eqZOYM/xvtQZpJhR54ep28aNwEzGH1D
 JcyCtewCwqTlXAoU7POWQJoA6C1LjTK/4ZThCDqLYFiFCQDYLXp/OaaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] poco: upgrade 1.5.0 -> 1.5.1
Date: Tue, 24 Mar 2026 19:40:46 +0100
Message-Id: <20260324184046.8890-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 18:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125584

From: Peter Marko <peter.marko@siemens.com>

* refresh patches
* remove workaround for cppunit-dev needed only in 1.15.0

Release Notes [1]:

This is a bugfix and maintenance release that also introduces a few new
features.

Security Fixes:
  * CVE-2026-32776 (NULL function pointer dereference)
  * CVE-2026-32777 (infinite loop)
  * CVE-2026-32778 (NULL dereference on OOM retry)

[1] https://github.com/pocoproject/poco/releases/tag/poco-1.15.1-release

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...pignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch |  6 +++---
 .../0002-DataTest-disable-testSQLChannel-test.patch    |  2 +-
 .../poco/{poco_1.15.0.bb => poco_1.15.1.bb}            | 10 +++-------
 3 files changed, 7 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.15.0.bb => poco_1.15.1.bb} (94%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
index 8575797e89..f8eadb3ee6 100644
--- a/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch
@@ -17,14 +17,14 @@ Updated comment and content after fixing some tests.
 Left only MongoDBTest.testArray on ignore list, untested.
 
 ---
- cppignore.lnx | 9 +++++++++
- 1 file changed, 9 insertions(+)
+ cppignore.lnx | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/cppignore.lnx b/cppignore.lnx
 index b3288d474..9aad48ca5 100644
 --- a/cppignore.lnx
 +++ b/cppignore.lnx
-@@ -30,3 +30,4 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
+@@ -35,3 +35,4 @@ CppUnit::TestCaller<HTTPSClientSessionTest>.testProxy
  CppUnit::TestCaller<HTTPSStreamFactoryTest>.testProxy
  CppUnit::TestCaller<DNSTest>.testHostByAddress
  CppUnit::TestCaller<DNSTest>.testHostByName
diff --git a/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
index 7628a8625a..38028c1cf8 100644
--- a/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
+++ b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
@@ -15,7 +15,7 @@ diff --git a/Data/testsuite/src/DataTest.cpp b/Data/testsuite/src/DataTest.cpp
 index e18b87edc..60fd266c3 100644
 --- a/Data/testsuite/src/DataTest.cpp
 +++ b/Data/testsuite/src/DataTest.cpp
-@@ -1648,7 +1648,7 @@ CppUnit::Test* DataTest::suite()
+@@ -1659,7 +1659,7 @@ CppUnit::Test* DataTest::suite()
  	CppUnit_addTest(pSuite, DataTest, testExternalBindingAndExtraction);
  	CppUnit_addTest(pSuite, DataTest, testTranscode);
  	CppUnit_addTest(pSuite, DataTest, testSQLParse);
diff --git a/meta-oe/recipes-support/poco/poco_1.15.0.bb b/meta-oe/recipes-support/poco/poco_1.15.1.bb
similarity index 94%
rename from meta-oe/recipes-support/poco/poco_1.15.0.bb
rename to meta-oe/recipes-support/poco/poco_1.15.1.bb
index a22694031a..7dd87606ef 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://run-ptest \
            "
-SRCREV = "52c558fbcda0578467e4f59c96961eb629ed3c77"
+SRCREV = "a1aacbba1bda4301db01bb1a2c2ab80677756b90"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
@@ -126,12 +126,8 @@ PACKAGES_DYNAMIC = "poco-.*"
 ALLOW_EMPTY:${PN} = "1"
 
 # cppunit and datatest is only built if tests are enabled
-# Upstream only ships libCppUnit.so.1 + symlink libCppUnit.so (no patch version),
-# so split: runtime in poco-cppunit, dev symlink in poco-cppunit-dev
-PACKAGES =+ "${PN}-cppunit-dev ${PN}-cppunit ${PN}-datatest"
-FILES:${PN}-cppunit-dev += "${libdir}/libCppUnit.so"
-RDEPENDS:${PN}-cppunit-dev += "${PN}-cppunit"
-FILES:${PN}-cppunit += "${libdir}/libCppUnit.so.1"
+PACKAGES =+ "${PN}-cppunit ${PN}-datatest"
+FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 FILES:${PN}-datatest += "${libdir}/libPocoDataTest.so*"
 ALLOW_EMPTY:${PN}-datatest = "1"

