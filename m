Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NrzoK-0006Ys-ON
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 21:25:57 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id F1491491282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 21:22:46 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 17 Mar 2010 21:22:53 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id E36B672076; Wed, 17 Mar 2010 21:22:45 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Mar 2010 21:22:34 +0100
Message-Id: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
X-OriginalArrivalTime: 17 Mar 2010 20:22:53.0158 (UTC)
	FILETIME=[9F38A860:01CAC60F]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Wed, 17 Mar 2010 20:26:01 -0000

a portable and efficient C programming interface (API) to determine the
call-chain of a program

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/libunwind/libunwind.inc     |   13 +++++++++++++
 recipes/libunwind/libunwind_0.99.bb |    5 +++++
 2 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libunwind/libunwind.inc
 create mode 100644 recipes/libunwind/libunwind_0.99.bb

diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/libunwind.inc
new file mode 100644
index 0000000..8513dc2
--- /dev/null
+++ b/recipes/libunwind/libunwind.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
+DEPENDS = ""
+HOMEPAGE = "http://www.nongnu.org/libunwind"
+LICENSE = "MIT"
+INC_PR = "r1"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/${PN}-${PV}.tar.gz;name=archive"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
diff --git a/recipes/libunwind/libunwind_0.99.bb b/recipes/libunwind/libunwind_0.99.bb
new file mode 100644
index 0000000..b7d0612
--- /dev/null
+++ b/recipes/libunwind/libunwind_0.99.bb
@@ -0,0 +1,5 @@
+require libunwind.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3e9ca08118e22165a7f07d01d61a2d0d"
+SRC_URI[archive.sha256sum] = "56083aae17eab3ccb7a36b95f0430f5a5f258755bf193bb5ca4fd4b918356164"
-- 
1.6.4.2



