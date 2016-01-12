Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A830F6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 22:56:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0CMu5Lc021754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 14:56:05 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jan 2016 14:56:04 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Tue, 12 Jan 2016 14:56:04 -0800
Message-ID: <1452639364-228585-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] geoip: add ptest functionality
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
X-List-Received-Date: Tue, 12 Jan 2016 22:56:08 -0000
Content-Type: text/plain

Also make geoip package rdepend on geoip-database and
add symbolic link to GeoIPCity.dat.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/geoip/files/run-ptest          |   11 ++++++
 .../recipes-support/geoip/geoip_1.6.6.bb           |   38 ++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-support/geoip/files/run-ptest

diff --git a/meta-networking/recipes-support/geoip/files/run-ptest b/meta-networking/recipes-support/geoip/files/run-ptest
new file mode 100644
index 0000000..14e9619
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/files/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+pdir=`dirname $0`
+cd ${pdir}/tests
+for i in ./benchmark ./test-geoip-city ; do
+	${i} 1>/dev/null 2>&1;
+	if [ $? == 0 ]; then
+		echo PASS: $i;
+	else
+		echo FAIL: $i;
+	fi;
+done
diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.6.bb b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
index 5037ae3..0605154 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
            http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
            http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
+           file://run-ptest \
 "
 SRCREV = "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
 
@@ -47,9 +48,46 @@ do_install() {
     install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
     install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
     install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
+    ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
 }
 
 PACKAGES =+ "${PN}-database"
 FILES_${PN}-database = ""
 FILES_${PN}-database += "${datadir}/GeoIP/*"
 
+# We cannot do much looking up without databases.
+#
+RDEPENDS_${PN} += "${PN}-database"
+
+inherit ptest
+
+do_configure_ptest() {
+	sed -i -e "s/noinst_PROGRAMS = /test_PROGRAMS = /g" \
+	    -e 's:SRCDIR=\\"$(top_srcdir)\\":SRCDIR=\\"$(testdir)\\":' \
+	  ${S}/test/Makefile.am
+
+	if ! grep "^testdir = " ${S}/test/Makefile.am ; then
+	  sed -e '/EXTRA_PROGRAMS = /itestdir = ${PTEST_PATH}/tests' \
+	    -i ${S}/test/Makefile.am
+	fi
+
+	sed -i -e "s:/usr/local/share:/usr/share:g" \
+	  ${S}/test/benchmark.c
+
+	sed -i -e 's:"../data/:"/usr/share/GeoIP/:g' \
+	  ${S}/test/test-geoip-city.c \
+	  ${S}/test/test-geoip-isp.c \
+	  ${S}/test/test-geoip-asnum.c \
+	  ${S}/test/test-geoip-netspeed.c \
+	  ${S}/test/test-geoip-org.c \
+	  ${S}/test/test-geoip-region.c
+}
+
+
+do_install_ptest() {
+	oe_runmake -C test DESTDIR=${D}  install-testPROGRAMS
+	install ${S}/test/*.txt ${D}${PTEST_PATH}/tests
+}
+
+
+
-- 
1.7.9.5


