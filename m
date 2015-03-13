Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFE560034
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 03:07:34 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so77922725iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 20:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qYNmefJSqJuOI/K25X1EEX5tDIvXdDDerfFw4KgOYJY=;
	b=dnlnNHZ++/sXNNLFnAxDHShw/Tzv4QB3oy9yD7Midc4GtR6qL5JLyDG/Q/aebcJQQ0
	wNeXtL+8oUs12BhsriVrBAYZxX61jcquMK4R2wu66wqChQp1xMy3KU1rcaSWsV6HYsA1
	Rtfm41bQhBaDlF8uz035b74YY9FoomREwtIIvd0eox7CJVNuzAQZzwdIth0G2IhThsw+
	Tc6UpgbUqopvWBlTH1N9MayX/VX75qZBrlznuRefWMsKAD5LzXej4omBrHzbdmj+Lw5G
	MgMIVKbx5+Ug+biyhzS5nMSJK4Oc1fvOsxZZ6SrI8ihyTy8Y1rFhb/HigEJ+RQAPSRWs
	t14w==
X-Received: by 10.50.62.110 with SMTP id x14mr107452756igr.2.1426216053722;
	Thu, 12 Mar 2015 20:07:33 -0700 (PDT)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id v15sm553281igd.15.2015.03.12.20.07.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Mar 2015 20:07:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2015 03:07:14 +0000
Message-Id: <1426216034-16739-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V4] soci: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 03:07:38 -0000

Define PACKAGECONFIG to enable a given backend of choice
by default its 'empty'

Change-Id: Ie1123af658ca94d2fe22a3ca1a32dfb47d58979e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/soci/soci/soci_libdir.patch    | 28 +++++++++++++
 meta-oe/recipes-support/soci/soci_3.2.2.bb         | 48 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/soci/soci/soci_libdir.patch
 create mode 100644 meta-oe/recipes-support/soci/soci_3.2.2.bb

diff --git a/meta-oe/recipes-support/soci/soci/soci_libdir.patch b/meta-oe/recipes-support/soci/soci/soci_libdir.patch
new file mode 100644
index 0000000..00a1a5c
--- /dev/null
+++ b/meta-oe/recipes-support/soci/soci/soci_libdir.patch
@@ -0,0 +1,28 @@
+Define SOCI_LIBDIR only if its not passed via environemnt. In OE we
+want to set it per our choice since we use 'lib' for 64bit unless we
+are using multilib
+
+-Khem
+
+Index: soci-3.2.2/CMakeLists.txt
+===================================================================
+--- soci-3.2.2.orig/CMakeLists.txt
++++ soci-3.2.2/CMakeLists.txt
+@@ -69,11 +69,12 @@ include(SociDependencies)
+ ###############################################################################
+ # Installation
+ ###############################################################################
+-
+-if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
+-  set(SOCI_LIBDIR "lib")
+-else()
+-  set(SOCI_LIBDIR "lib64")
++if(NOT DEFINED SOCI_LIBDIR)
++  if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
++    set(SOCI_LIBDIR "lib")
++  else()
++    set(SOCI_LIBDIR "lib")
++  endif()
+ endif()
+ 
+ set(BINDIR "bin" CACHE PATH "The directory to install binaries into.")
diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb b/meta-oe/recipes-support/soci/soci_3.2.2.bb
new file mode 100644
index 0000000..887f5a2
--- /dev/null
+++ b/meta-oe/recipes-support/soci/soci_3.2.2.bb
@@ -0,0 +1,48 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The C++ Database Access Library"
+HOMEPAGE = "http://soci.sourceforge.net"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+SECTION = "libs"
+DEPENDS = "boost"
+
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${P}/${P}.tar.gz \
+           file://soci_libdir.patch \
+          "
+SRC_URI[md5sum] = "bc3c35f6cd3f80a1be19fe30b3c111bf"
+SRC_URI[sha256sum] = "30ea2f4d26639ef5b5cdc24fb300b3896746243dbb77b743582de2ff443ccb1c"
+
+TESTCONFIG = '-DSOCI_TEST_EMPTY_CONNSTR="dummy" -DSOCI_TEST_SQLITE3_CONNSTR="test.db" \
+              -DSOCI_TEST_POSTGRESQL_CONNSTR:STRING="dbname=soci_test" \
+              -DSOCI_TEST_MYSQL_CONNSTR:STRING="db=soci_test user=oe password=oe"'
+
+OBASEDIR ?= "/opt/oracle"
+OINCDIR = "rdbms/public"
+OLIBDIR = "lib"
+
+PACKAGECONFIG[sqlite3] = "-DSOCI_SQLITE3=ON,-DSOCI_SQLITE3=OFF,sqlite3,"
+PACKAGECONFIG[mysql] = "-DSOCI_MYSQL=ON,-DSOCI_MYSQL=OFF,mariadb,"
+PACKAGECONFIG[postgresql] = "-DSOCI_POSTGRESQL=ON,-DSOCI_POSTGRESQL=OFF,postgresql,"
+PACKAGECONFIG[odbc] = "-DSOCI_ODBC=ON,-DSOCI_ODBC=OFF,,"
+PACKAGECONFIG[empty] = "-DSOCI_EMPTY=ON,-DSOCI_EMPTY=OFF,,"
+PACKAGECONFIG[oracle] = "-DWITH_ORACLE=ON --with-oracle-include=${OINCDIR} --with-oracle-lib=${OLIBDIR},-DWITH_ORACLE=OFF,,"
+PACKAGECONFIG[ptest] = "${TESTCONFIG},,,"
+
+# enable your backend by default we enable 'empty'
+PACKAGECONFIG ??= "empty"
+
+# Take the flags added by PACKAGECONFIG and pass them to cmake.
+EXTRA_OECMAKE = "${EXTRA_OECONF} -DSOCI_LIBDIR=${libdir}"
+
+inherit cmake
+
+PACKAGES += "${PN}-sqlite3 ${PN}-mysql ${PN}-postgresql ${PN}-odbc ${PN}-oracle"
+
+FILES_${PN}-sqlite3 = "${libdir}/lib${BPN}_sqlite3.so.*"
+FILES_${PN}-mysql = "${libdir}/lib${BPN}_mysql.so.*"
+FILES_${PN}-postgresql = "${libdir}/lib${BPN}_postgresql.so.*"
+FILES_${PN}-odbc = "${libdir}/lib${BPN}_odbc.so.*"
+FILES_${PN}-oracle = "${libdir}/lib${BPN}_oracle.so.*"
-- 
2.1.4


