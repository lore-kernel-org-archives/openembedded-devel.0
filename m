Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1THRLT-0006hO-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 05:34:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8S3Lb4e003848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:21:37 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 27 Sep 2012 20:21:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Sep 2012 11:21:34 +0800
Message-ID: <1348802495-13651-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [meta-networking][PATCH v2 1/2] ptpd: migrate from meta-oe into meta-networking
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
X-List-Received-Date: Fri, 28 Sep 2012 03:34:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 ++++++++++++++++++++
 meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb |   20 +++++++++++++++
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 --------------------
 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   20 ---------------
 4 files changed, 46 insertions(+), 46 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
 delete mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch
new file mode 100644
index 0000000..8ed3f2f
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd-1.0.0/add-limit-h.patch
@@ -0,0 +1,26 @@
+ptpd: fix ftbfs by including limits.h so MAX_INT defined
+
+The current recipe for ptpd fails to build with:
+
+| arith.c: In function 'fromInternalTime':
+| arith.c:46: error: 'INT_MAX' undeclared (first use in this function)
+| arith.c:46: error: (Each undeclared identifier is reported only once
+| arith.c:46: error: for each function it appears in.)
+| arith.c: In function 'toInternalTime':
+| arith.c:64: error: 'INT_MAX' undeclared (first use in this function)
+| make: *** [arith.o] Error 1
+| make: *** Waiting for unfinished jobs....
+| FATAL: oe_runmake failed
+
+diff --git a/src/arith.c b/src/arith.c
+--- a/src/arith.c
++++ b/src/arith.c
+@@ -1,6 +1,7 @@
+ /* arith.c */
+ 
+ #include "ptpd.h"
++#include <limits.h>
+ 
+ /* from annex C of the spec */
+ UInteger32 crc_algorithm(Octet *buf, Integer16 length)
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb b/meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb
new file mode 100644
index 0000000..08e1b6b
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_1.0.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+SECTION = "network"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=888bd1b2c9c013b93394b8bfb453c417"
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
+           file://add-limit-h.patch;striplevel=2"
+
+SRC_URI[md5sum] = "b112b2bedc7f6e6e11a838608b9e0357"
+SRC_URI[sha256sum] = "8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc"
+
+S = "${WORKDIR}/ptpd-${PV}/src"
+
+do_install() {
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 4555 ptpd ${D}${bindir}
+        install -m 644 ptpd.8 ${D}${mandir}/man8
+}
diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
deleted file mode 100644
index 8ed3f2f..0000000
--- a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-ptpd: fix ftbfs by including limits.h so MAX_INT defined
-
-The current recipe for ptpd fails to build with:
-
-| arith.c: In function 'fromInternalTime':
-| arith.c:46: error: 'INT_MAX' undeclared (first use in this function)
-| arith.c:46: error: (Each undeclared identifier is reported only once
-| arith.c:46: error: for each function it appears in.)
-| arith.c: In function 'toInternalTime':
-| arith.c:64: error: 'INT_MAX' undeclared (first use in this function)
-| make: *** [arith.o] Error 1
-| make: *** Waiting for unfinished jobs....
-| FATAL: oe_runmake failed
-
-diff --git a/src/arith.c b/src/arith.c
---- a/src/arith.c
-+++ b/src/arith.c
-@@ -1,6 +1,7 @@
- /* arith.c */
- 
- #include "ptpd.h"
-+#include <limits.h>
- 
- /* from annex C of the spec */
- UInteger32 crc_algorithm(Octet *buf, Integer16 length)
-
diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
deleted file mode 100644
index 08e1b6b..0000000
--- a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
-HOMEPAGE = "http://sourceforge.net/projects/ptpd"
-SECTION = "network"
-LICENSE = "BSD"
-
-LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=888bd1b2c9c013b93394b8bfb453c417"
-
-SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
-           file://add-limit-h.patch;striplevel=2"
-
-SRC_URI[md5sum] = "b112b2bedc7f6e6e11a838608b9e0357"
-SRC_URI[sha256sum] = "8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc"
-
-S = "${WORKDIR}/ptpd-${PV}/src"
-
-do_install() {
-        install -d ${D}${bindir} ${D}${mandir}/man8
-        install -m 4555 ptpd ${D}${bindir}
-        install -m 644 ptpd.8 ${D}${mandir}/man8
-}
-- 
1.7.4



