Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbO0r-0004Fx-8S
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 03:59:09 +0100
Received: from mail14-tx2-R.bigfish.com (10.9.14.244) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 02:37:05 +0000
Received: from mail14-tx2 (localhost [127.0.0.1])	by mail14-tx2-R.bigfish.com
	(Postfix) with ESMTP id A048A20051D	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:09 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275ch8275bhz2dh2a8h668h839hb79i61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail14-tx2 (localhost.localdomain [127.0.0.1]) by mail14-tx2
	(MessageSwitch) id 1324003026186201_24840;
	Fri, 16 Dec 2011 02:37:06 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.244])	by
	mail14-tx2.bigfish.com (Postfix) with ESMTP id 036B2580049	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS023.bigfish.com
	(10.9.99.123) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 02:36:58 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 15 Dec 2011 20:36:58 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG2alj2009971;
	Thu, 15 Dec 2011 20:36:56 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 10:39:30 +0800
Message-ID: <1324003173-13994-6-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324003173-13994-1-git-send-email-b19537@freescale.com>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe 6/9] ptpd: add
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
X-List-Received-Date: Fri, 16 Dec 2011 02:59:09 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    Precision Time Protocol (PTP) as defined by the IEEE 1588 standard.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 ++++++++++++++++++++
 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   21 ++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
 create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb

diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
new file mode 100644
index 0000000..8ed3f2f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
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
diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
new file mode 100644
index 0000000..a9c0351
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
+HOMEPAGE = "http://sourceforge.net/projects/ptpd"
+LICENSE = "BSD"
+SECTION = "network"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://../COPYRIGHT;md5=888bd1b2c9c013b93394b8bfb453c417"
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz \
+           file://add-limit-h.patch;striplevel=2"
+
+S = "${WORKDIR}/ptpd-${PV}/src"
+
+do_install() {
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 4555 ptpd ${D}${bindir}
+        install -m 644 ptpd.8 ${D}${mandir}/man8
+}
+
+SRC_URI[md5sum] = "b112b2bedc7f6e6e11a838608b9e0357"
+SRC_URI[sha256sum] = "8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc"
-- 
1.7.0.4




