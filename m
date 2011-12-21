Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFXy-0003Gu-BN
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:21:02 +0100
Received: from mail110-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:39 +0000
Received: from mail110-ch1 (localhost [127.0.0.1])	by
	mail110-ch1-R.bigfish.com (Postfix) with ESMTP id 2CA1F4400F6	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:25 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(z98bRzzz1202hzz8275ch8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail110-ch1 (localhost.localdomain [127.0.0.1]) by mail110-ch1
	(MessageSwitch) id 132444716356397_5173;
	Wed, 21 Dec 2011 05:59:23 +0000 (UTC)
Received: from CH1EHSMHS015.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail110-ch1.bigfish.com (Postfix) with ESMTP id
	F28826E0234	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS015.bigfish.com
	(10.43.70.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:37 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:45 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWa015654;
	Tue, 20 Dec 2011 23:58:43 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:43 +0800
Message-ID: <1324447304-4874-6-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 meta-oe 6/7] ptpd: add version 1.0.0
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
X-List-Received-Date: Wed, 21 Dec 2011 06:21:02 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    Precision Time Protocol (PTP) as defined by the IEEE 1588 standard.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 ++++++++++++++++++++
 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   20 +++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
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
index 0000000..08e1b6b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
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
-- 
1.7.0.4




