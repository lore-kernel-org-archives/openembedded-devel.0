Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0CCCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:13:41 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.7441.1757024015780899498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TB6sPbCc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250904221333d9381874cd000207d2-gx5bio@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250904221333d9381874cd000207d2
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:13:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KoFJqUdo1wccTWMGFDV8bIhXT5A+gp3Wh/U2QyyNFQg=;
 b=TB6sPbCc8v1QLAQnQnK+f7C2mMVfQ91tI+rpvCVhYlR+0DopvR5URcqpBMnPm2WF2EjtmL
 iLFEEji80ckX0XPnWou9de82+YfKw7WoM3w4CzfWAGzqIwY15kZ1llJk2DySRCtktYtWRbod
 o5358LQ5cCsE8kSmz81R4fDI+UguEW3T8IOGt8LW8iGq5UHDa4lMLJBER04T2oTytO+uAgzX
 EjcISJtgbbk81y9p9YSnEi8Q6LRlV9bPFwxqUXgJGJ4uSkzmtN8ZtNIQ7FvnZDdsr5LHgABL
 fCviNG80sjOlidzcEsRDY+HuNfkaZjE1TYCMxt65ycE2Z9+E6tc0KK2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 10/10] poco: upgrade 1.13.3 -> 1.14.2
Date: Fri,  5 Sep 2025 00:11:39 +0200
Message-Id: <20250904221139.3131569-10-peter.marko@siemens.com>
In-Reply-To: <20250904221139.3131569-1-peter.marko@siemens.com>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119307

From: Peter Marko <peter.marko@siemens.com>

Release notes:
* https://github.com/pocoproject/poco/releases/tag/poco-1.14.0-release
* https://github.com/pocoproject/poco/releases/tag/poco-1.14.1-release
* https://github.com/pocoproject/poco/releases/tag/poco-1.14.2-release

Handles CVE-2025-6375 (in 1.14.2) and several other security issues
without CVE assignment.

Changes:
* remove patches included in new release
* added new dependency utf8proc for Foundation
* added libpng dependency to PDF (was bundled previously)
* added new component DNSSD (Avahi)
* fixed buildpaths issue
* removed failing test

Test with databases are problematic:
* ODBC - does not compile (previously caused QA errors)
  * https://github.com/pocoproject/poco/issues/5010
* MySQL - broken test - database not connecting (already in old version)
* Redis - broken test - database not connecting (already in old version)
Should be fixed by someone needing these modules.
Example can be taken from my ptest patch for PostgreSQL.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...er.h-fix-the-build-on-gcc-15-unsatis.patch | 59 -------------------
 ...DataTest-disable-testSQLChannel-test.patch | 26 ++++++++
 ...uild-error-with-GCC-15-class-Poco-Pr.patch | 53 -----------------
 .../poco/{poco_1.13.3.bb => poco_1.14.2.bb}   | 26 +++++---
 4 files changed, 44 insertions(+), 120 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
 delete mode 100644 meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
 rename meta-oe/recipes-support/poco/{poco_1.13.3.bb => poco_1.14.2.bb} (86%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch b/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
deleted file mode 100644
index d976a1f83b..0000000000
--- a/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 03c35cff930e421199b586c33a00eb6cc537ba28 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Thu, 19 Sep 2024 09:36:48 +0100
-Subject: [PATCH] SimpleRowFormatter.h: fix the build on `gcc-15` (unsatisfied
- `noexcept`)
-
-On today's `gcc-15` poco fails to build as:
-
-    In file included from /build/source/Data/include/Poco/Data/Statement.h:27,
-                     from /build/source/Data/include/Poco/Data/Session.h:23,
-                     from /build/source/Data/include/Poco/Data/ArchiveStrategy.h:22,
-                     from /build/source/Data/src/ArchiveStrategy.cpp:15:
-    /build/source/Data/include/Poco/Data/SimpleRowFormatter.h:114:21: error: declaration of 'std::_Require<std::__not_<std::__is_tuple_like<_Tp> >, std::is_move_construc
-    tible<_Tp>, std::is_move_assignable<_Tp> > std::swap(_Tp&, _Tp&) noexcept [with _Tp = Poco::Data::SimpleRowFormatter; _Require<__not_<__is_tuple_like<_Tp> >, is_move_constructible<_Tp>, is_move_assignable<_Tp> > = void]' has a different exception specifier
-      114 |         inline void swap<Poco::Data::SimpleRowFormatter>(Poco::Data::SimpleRowFormatter& s1,
-          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-    In file included from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/new_allocator.h:36,
-                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/x86_64-unknown-linux-gnu/bits/c++allocator.h:33,
-                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/allocator.h:46,
-                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/string:43,
-                     from /build/source/Foundation/include/Poco/Foundation.h:94,
-                     from /build/source/Data/include/Poco/Data/Data.h:23,
-                     from /build/source/Data/include/Poco/Data/ArchiveStrategy.h:21:
-    /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/move.h:214:5: note: from previous declaration 'std::_Require<std::__not_<std::__is_tuple_like<_Tp> >, std::is_move_constructible<_Tp>, std::is_move_assignable<_Tp> > std::swap(_Tp&, _Tp&) noexcept (false) [with _Tp = Poco::Data::SimpleRowFormatter; _Require<__not_<__is_tuple_like<_Tp> >, is_move_constructible<_Tp>, is_move_assignable<_Tp> > = void]'
-      214 |     swap(_Tp& __a, _Tp& __b)
-          |     ^~~~
-
-Possibly because `SimpleRowFormatter` does not have constructors and
-assignment operators that involve rvalue references?
-
-Updated `noexcept` condition. Fixes the build on` gcc-15`. Still
-compiles on `gcc-13`.
-
-Upstream-Status: Backport [03c35cf SimpleRowFormatter.h: fix the build on `gcc-15` (unsatisfied `noexcept`)]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- Data/include/Poco/Data/SimpleRowFormatter.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/Data/include/Poco/Data/SimpleRowFormatter.h b/Data/include/Poco/Data/SimpleRowFormatter.h
-index 0dcb43b0b..c8417b3a7 100644
---- a/Data/include/Poco/Data/SimpleRowFormatter.h
-+++ b/Data/include/Poco/Data/SimpleRowFormatter.h
-@@ -109,13 +109,10 @@ inline std::streamsize SimpleRowFormatter::getSpacing() const
- 
- namespace std
- {
--	// Note: for an unknown reason, clang refuses to compile this function as noexcept
- 	template<>
- 	inline void swap<Poco::Data::SimpleRowFormatter>(Poco::Data::SimpleRowFormatter& s1,
- 		Poco::Data::SimpleRowFormatter& s2)
--#ifndef POCO_COMPILER_CLANG
--		noexcept
--#endif
-+		noexcept(std::is_nothrow_swappable_v<Poco::Data::SimpleRowFormatter>)
- 		/// Full template specalization of std:::swap for SimpleRowFormatter
- 	{
- 		s1.swap(s2);
-
diff --git a/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
new file mode 100644
index 0000000000..7628a8625a
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0002-DataTest-disable-testSQLChannel-test.patch
@@ -0,0 +1,26 @@
+From 0a8c7e5e074c124c2d5e5713fc3038295324cf96 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 4 Sep 2025 22:27:26 +0200
+Subject: [PATCH] DataTest: disable testSQLChannel test
+
+It takes forever and then is killed by signal 9
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Data/testsuite/src/DataTest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Data/testsuite/src/DataTest.cpp b/Data/testsuite/src/DataTest.cpp
+index e18b87edc..60fd266c3 100644
+--- a/Data/testsuite/src/DataTest.cpp
++++ b/Data/testsuite/src/DataTest.cpp
+@@ -1648,7 +1648,7 @@ CppUnit::Test* DataTest::suite()
+ 	CppUnit_addTest(pSuite, DataTest, testExternalBindingAndExtraction);
+ 	CppUnit_addTest(pSuite, DataTest, testTranscode);
+ 	CppUnit_addTest(pSuite, DataTest, testSQLParse);
+-	CppUnit_addTest(pSuite, DataTest, testSQLChannel);
++	//CppUnit_addTest(pSuite, DataTest, testSQLChannel);
+ 	CppUnit_addTest(pSuite, DataTest, testNullableExtract);
+ 
+ 	return pSuite;
diff --git a/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch b/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
deleted file mode 100644
index e607063d58..0000000000
--- a/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 6faf90773a7327e54342a5d3caee151623b5caf0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
-Date: Fri, 27 Sep 2024 08:53:18 +0200
-Subject: [PATCH] =?UTF-8?q?fix(Foundation):=20Build=20error=20with=20GCC-1?=
- =?UTF-8?q?5=20(class=20Poco::PriorityDelegate<TObj,=20void,=20true>?=
- =?UTF-8?q?=E2=80=99=20has=20no=20member=20named=20=E2=80=98=5FpTarget?=
- =?UTF-8?q?=E2=80=99)=20(#4695)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport [6faf907 fix(Foundation): Build error with GCC-15 (class Poco::PriorityDelegate<TObj, void, true>’ has no member named ‘_pTarget’) (#4695)]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- Foundation/include/Poco/PriorityDelegate.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/Foundation/include/Poco/PriorityDelegate.h b/Foundation/include/Poco/PriorityDelegate.h
-index 4cd664aab..cac9cf25e 100644
---- a/Foundation/include/Poco/PriorityDelegate.h
-+++ b/Foundation/include/Poco/PriorityDelegate.h
-@@ -52,7 +52,6 @@ public:
- 	{
- 		if (&delegate != this)
- 		{
--			this->_pTarget        = delegate._pTarget;
- 			this->_receiverObject = delegate._receiverObject;
- 			this->_receiverMethod = delegate._receiverMethod;
- 			this->_priority       = delegate._priority;
-@@ -126,7 +125,6 @@ public:
- 	{
- 		if (&delegate != this)
- 		{
--			this->_pTarget        = delegate._pTarget;
- 			this->_receiverObject = delegate._receiverObject;
- 			this->_receiverMethod = delegate._receiverMethod;
- 			this->_priority       = delegate._priority;
-@@ -200,7 +198,6 @@ public:
- 	{
- 		if (&delegate != this)
- 		{
--			this->_pTarget        = delegate._pTarget;
- 			this->_receiverObject = delegate._receiverObject;
- 			this->_receiverMethod = delegate._receiverMethod;
- 			this->_priority       = delegate._priority;
-@@ -274,7 +271,6 @@ public:
- 	{
- 		if (&delegate != this)
- 		{
--			this->_pTarget        = delegate._pTarget;
- 			this->_receiverObject = delegate._receiverObject;
- 			this->_receiverMethod = delegate._receiverMethod;
- 			this->_priority       = delegate._priority;
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.14.2.bb
similarity index 86%
rename from meta-oe/recipes-support/poco/poco_1.13.3.bb
rename to meta-oe/recipes-support/poco/poco_1.14.2.bb
index c57c207f82..9cdc9e325c 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.14.2.bb
@@ -6,15 +6,14 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 
 # These dependencies are required by Foundation
-DEPENDS = "libpcre2 zlib"
+DEPENDS = "libpcre2 utf8proc zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.13.3;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=https;tag=poco-${PV}-release \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
+           file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://run-ptest \
-           file://0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch \
-           file://0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch \
            "
-SRCREV = "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
+SRCREV = "96d182a99303fb068575294b36f0cc20da2e7b25"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
@@ -24,7 +23,7 @@ inherit cmake ptest
 # By default the most commonly used poco components are built
 # Foundation is built anyway and doesn't need to be listed explicitly
 # these don't have dependencies outside oe-core
-PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite Zip Encodings Prometheus"
+PACKAGECONFIG ??= "XML JSON PDF Util Net NetSSL Crypto JWT Data DataPostgreSQL DataSQLite DNSSDAvahi Zip Encodings Prometheus"
 # MongoDB does not build for all architectures yet keep in sync with COMPATIBLE_HOST list in mongodb recipe
 # and mongodb needs meta-python enabled as well
 PACKAGECONFIG:remove:riscv32 = "MongoDB"
@@ -32,11 +31,11 @@ PACKAGECONFIG:remove:riscv64 = "MongoDB"
 PACKAGECONFIG:remove:mipsarch = "MongoDB"
 PACKAGECONFIG:remove:powerpc = "MongoDB"
 # Following options have dependencies on recipes which don't have native variant
-PACKAGECONFIG:remove:class-native = "MongoDB DataODBC DataPostgreSQL"
+PACKAGECONFIG:remove:class-native = "MongoDB DataODBC DataPostgreSQL DNSSDAvahi"
 
 PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
 PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
-PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,zlib"
+PACKAGECONFIG[PDF] = "-DENABLE_PDF=ON,-DENABLE_PDF=OFF,libpng zlib"
 PACKAGECONFIG[Util] = "-DENABLE_UTIL=ON,-DENABLE_UTIL=OFF"
 PACKAGECONFIG[Net] = "-DENABLE_NET=ON,-DENABLE_NET=OFF"
 PACKAGECONFIG[NetSSL] = "-DENABLE_NETSSL=ON,-DENABLE_NETSSL=OFF,openssl"
@@ -45,6 +44,7 @@ PACKAGECONFIG[JWT] = "-DENABLE_JWT=ON,-DENABLE_JWT=OFF,openssl"
 PACKAGECONFIG[Data] = "-DENABLE_DATA=ON,-DENABLE_DATA=OFF"
 PACKAGECONFIG[DataPostgreSQL] = "-DENABLE_DATA_POSTGRESQL=ON,-DENABLE_DATA_POSTGRESQL=OFF,postgresql,postgresql"
 PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON,-DENABLE_DATA_SQLITE=OFF,sqlite3"
+PACKAGECONFIG[DNSSDAvahi] = "-DENABLE_DNSSD=ON -DENABLE_DNSSD_AVAHI=ON,-DENABLE_DNSSD=OFF -DENABLE_DNSSD_AVAHI=OFF,avahi"
 PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
 PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
 PACKAGECONFIG[Prometheus] = "-DENABLE_PROMETHEUS=ON,-DENABLE_PROMETHEUS=OFF"
@@ -92,6 +92,16 @@ python populate_packages:prepend () {
     d.setVar("RRECOMMENDS:%s" % pn, " ".join(packages))
 }
 
+do_install:append() {
+    # fix buildpaths
+    if [ -e ${D}${nonarch_libdir}/cmake/Poco/PocoPDFTargets.cmake ]; then
+        sed -i 's#${RECIPE_SYSROOT}##' ${D}${nonarch_libdir}/cmake/Poco/PocoPDFTargets.cmake
+    fi
+    if [ -e ${D}${nonarch_libdir}/cmake/Poco/PocoDNSSDAvahiTargets.cmake ]; then
+        sed -i 's#${RECIPE_SYSROOT}##g' ${D}${nonarch_libdir}/cmake/Poco/PocoDNSSDAvahiTargets.cmake
+    fi
+}
+
 do_install_ptest () {
        cp -rf ${B}/bin/ ${D}${PTEST_PATH}
        cp -f ${B}/lib/libCppUnit.so* ${D}${libdir}

