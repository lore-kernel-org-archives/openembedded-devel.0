Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B92A71637
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 19:15:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0BJFLpV013088
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2015 11:15:22 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 11 Jan 2015 11:15:21 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 11 Jan 2015 11:15:21 -0800
Message-ID: <1421003721-12422-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] geoip-perl: add recipe for version 1.45
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
X-List-Received-Date: Sun, 11 Jan 2015 19:15:31 -0000
Content-Type: text/plain

The package includes a few data files.  Despite the names,
these are very small databases only useful for running the
perl test scripts.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-support/geoip/geoip-perl/run-ptest     |   15 ++++++++
 .../recipes-support/geoip/geoip-perl_1.45.bb       |   37 ++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-support/geoip/geoip-perl/run-ptest
 create mode 100644 meta-networking/recipes-support/geoip/geoip-perl_1.45.bb

diff --git a/meta-networking/recipes-support/geoip/geoip-perl/run-ptest b/meta-networking/recipes-support/geoip/geoip-perl/run-ptest
new file mode 100644
index 0000000..5404c24
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoip-perl/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+# The tests contain hard-coded relative paths and must be
+# executed from $pdir.
+#
+pdir=`dirname $0`
+cd ${pdir}
+for i in t/*.t ; do
+	perl ${i} 1>/dev/null 2>&1;
+	if [ $? == 0 ]; then
+		echo PASS: $i;
+	else
+		echo FAIL: $i;
+	fi;
+done
diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
new file mode 100644
index 0000000..9188351
--- /dev/null
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.45.bb
@@ -0,0 +1,37 @@
+#
+# Copyright (C) 2014, 2015 Wind River Systems, Inc.
+#
+SUMMARY = "GeoIP perl API library to access location database"
+DESCRIPTION = "perl library for country/city/organization to IP address or hostname mapping"
+HOMEPAGE = "http://www.maxmind.com/app/ip-location"
+SECTION = "network"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=b0fa745303912bd2d64430f7ae69487d"
+
+SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz \
+           file://run-ptest \
+          "
+
+SRC_URI[md5sum] = "0ce57140890bf81958e0cea4fe1885b2"
+SRC_URI[sha256sum] = "c56437b1cc8887736cb1e435d0320c1c1ff3754830249516317b99137005fb23"
+
+S = "${WORKDIR}/geoip-api-perl-${PV}"
+
+DEPENDS += "geoip"
+
+inherit cpan ptest
+
+EXTRA_CPANFLAGS = "LIBS='-L${STAGING_LIBDIR}' INC='-I${STAGING_INCDIR}'"
+
+
+# perl scripts and some special small data files
+#
+do_install_ptest () {
+	install -d -m 0755 ${D}${PTEST_PATH}/t/data
+
+	install ${S}/t/*.t* ${D}${PTEST_PATH}/t
+	install ${S}/t/data/* ${D}${PTEST_PATH}/t/data
+}
+
+FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Geo/IP/.debug"
+
-- 
1.7.9.5


