Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1RIBmL-00075f-EC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 06:04:49 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9O3upDO019835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 22:56:51 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9O3uo6l020691
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 22:56:50 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9O3uoNs009594
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2011 22:56:50 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 23 Oct 2011 22:56:50 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9O3unse011208;	Sun, 23 Oct 2011 22:56:50 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 23 Oct 2011 22:40:51 -0500
Message-ID: <1319427652-9401-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH meta-oe] memtester: Import from OE classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Oct 2011 04:04:49 -0000
Content-Type: text/plain

Added LIC_FILES_CHKSUM

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
This package is required by the beaglebone-tester

 .../memtester/files/Makefile.patch                 |   15 +++++++++++
 .../recipes-benchmark/memtester/memtester_4.1.3.bb |   27 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/memtester/files/Makefile.patch
 create mode 100644 meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb

diff --git a/meta-oe/recipes-benchmark/memtester/files/Makefile.patch b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
new file mode 100644
index 0000000..57a0464
--- /dev/null
+++ b/meta-oe/recipes-benchmark/memtester/files/Makefile.patch
@@ -0,0 +1,15 @@
+Index: memtester-4.0.5/Makefile
+===================================================================
+--- memtester-4.0.5.orig/Makefile	2005-03-14 06:02:30.000000000 -0800
++++ memtester-4.0.5/Makefile	2006-07-08 23:53:42.000000000 -0700
+@@ -24,8 +24,8 @@
+ auto-ccld.sh: \
+ conf-cc conf-ld warn-auto.sh
+ 	( cat warn-auto.sh; \
+-	echo CC=\'`head -1 conf-cc`\'; \
+-	echo LD=\'`head -1 conf-ld`\' \
++	echo CC=\'`head -n 1 conf-cc`\'; \
++	echo LD=\'`head -n 1 conf-ld`\' \
+ 	) > auto-ccld.sh
+ 
+ compile: \
diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
new file mode 100644
index 0000000..9f4e53e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.1.3.bb
@@ -0,0 +1,27 @@
+SECTION = "console/utils"
+DESCRIPTION = "Utility to test for faulty memory subsystem"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://pyropus.ca/software/memtester/old-versions/memtester-${PV}.tar.gz"
+SRC_URI += "file://Makefile.patch"
+
+SRC_URI[md5sum] = "e562451620cf5343016950462bc0dc38"
+SRC_URI[sha256sum] = "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115a1906c535106acf6"
+
+S = "${WORKDIR}/memtester-${PV}"
+
+do_compile () {
+	echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
+	echo '${CC} ${LDFLAGS}' > conf-ld
+	oe_runmake
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -d ${D}${mandir}/man8
+	install -m 0755 memtester ${D}${bindir}/
+	install -m 0755 memtester.8 ${D}${mandir}/man8/
+}
+
-- 
1.7.0.4



