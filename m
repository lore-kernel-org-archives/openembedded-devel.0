Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC3A6AC2B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2015 10:59:43 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so32066245iec.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2015 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ehfcYlCZNDPTRc/wdtlX0ZK7lGVEiZY32LK8STvYuvo=;
	b=Td20OdnNhVODSr9ZRtF5cV0JoYpdmjdiY7FE4RGf6CIGeGFnBCNJ0if3I4VaqxELDB
	+omyB5gcKNEzp6u4ws5sj7upc9hUHVRWVg3pEeFbpilOPmOoKgzENoQIyfsK9+mlLzBk
	aJYwSia4/8v5m7343/ta+Bq4hbBY8LyffE1urZ5PCZPPCAYQFWUJQDRJjgxEneRWqvY/
	RHalFh0FV6EuDcDmtWPWfBjpu5fxjbjjVUr1bsuK2Kx8A2PX8CQNglROWI01LMp5QV5b
	l9r5QpKkRWSfH3dxJhL2nvTqiX3IJv+eR5+3vtDxdH3k/RqTBruOLXxPbG6FgRVIE8cM
	WYDw==
X-Received: by 10.50.50.142 with SMTP id c14mr39186597igo.42.1425812385064;
	Sun, 08 Mar 2015 03:59:45 -0700 (PDT)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	k191sm10353663ioe.21.2015.03.08.03.59.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Mar 2015 03:59:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2015 10:59:30 +0000
Message-Id: <1425812371-1564-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv3 1/2] soci: Add recipe
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
X-List-Received-Date: Sun, 08 Mar 2015 10:59:44 -0000

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
index 0000000..8da57ce
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
+-  set(SOCI_LIBDIR "lib")
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


