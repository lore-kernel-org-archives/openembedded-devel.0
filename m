Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF3D735BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:44:01 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id h15so861617igd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Q7RAb8jmzaeAs5Y4SGqtZrjOVRNniysGa3XKoDuFGtI=;
	b=rdkyRxv5ONwngozwQ+J1V24+HTbzr+/F7lZYQ3LmRmlI/qb3uxldmFNKvwtumHHGi2
	i1Tkle8YITkoaRtDc72maIVlkUzChDvbNPnxGDPY5jIBtFbzR1wVGlTOLVXny2Ahi0N7
	a7EsE6JYLSnapMIJiIvC9YJ8UyFoafj+mnMFh8C6p76y2i+n3Zg+KSgSqBtYejaBRfK/
	OG2bCCTBM4APaej3ZH20iJoCvOnYry1oaUlLG2+r00gGLvi5bYqDwzKCpJmz7hqJfxDu
	+oQk7fb1prFagNZ7wkaOOanLJ/IZaRSfVd6n1KS8pIujelESyZxbJu1THer+EgaxmOPC
	HGBQ==
X-Received: by 10.50.222.70 with SMTP id qk6mr2079353igc.47.1424411042227;
	Thu, 19 Feb 2015 21:44:02 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	p138sm16404022ioe.9.2015.02.19.21.44.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 21:44:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2015 05:43:36 +0000
Message-Id: <1424411017-31055-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH 1/2] soci: Add recipe
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
X-List-Received-Date: Fri, 20 Feb 2015 05:44:04 -0000

Define PACKAGECONFIG to enable a given backend of choice
by default its 'empty'

Change-Id: Ie1123af658ca94d2fe22a3ca1a32dfb47d58979e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/soci/soci_3.2.2.bb | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/soci/soci_3.2.2.bb

diff --git a/meta-oe/recipes-support/soci/soci_3.2.2.bb b/meta-oe/recipes-support/soci/soci_3.2.2.bb
new file mode 100644
index 0000000..1c333cb
--- /dev/null
+++ b/meta-oe/recipes-support/soci/soci_3.2.2.bb
@@ -0,0 +1,46 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The C++ Database Access Library"
+HOMEPAGE = "http://soci.sourceforge.net"
+LICENSE = "BSL-1.0"
+SECTION = "libs"
+DEPENDS = "boost"
+
+LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${P}/${P}.tar.gz"
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
+EXTRA_OECMAKE = "${EXTRA_OECONF}"
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


