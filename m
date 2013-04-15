Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URfmp-00031D-7i
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 11:33:21 +0200
Received: from mail135-ch1-R.bigfish.com (10.43.68.254) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 09:00:44 +0000
Received: from mail135-ch1 (localhost [127.0.0.1])	by
	mail135-ch1-R.bigfish.com (Postfix) with ESMTP id DC95040495	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:00:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail135-ch1 (localhost.localdomain [127.0.0.1]) by mail135-ch1
	(MessageSwitch) id 1366016442684138_3917;
	Mon, 15 Apr 2013 09:00:42 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.237])	by mail135-ch1.bigfish.com (Postfix) with ESMTP id
	8CD454C00C5	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:00:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 09:00:41 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 15 Apr 2013 09:00:40 +0000
Received: from sbuilder137.localdomain.localdomain (mars.ap.freescale.net
	[10.192.208.137])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3F90aYU014083;	Mon, 15 Apr 2013 02:00:38 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Apr 2013 17:00:35 +0800
Message-ID: <1366016435-10751-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH v4] tclap: initial add 1.2.1
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
X-List-Received-Date: Mon, 15 Apr 2013 09:33:23 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

TCLAP (Templatized C++ Command Line Parser Library ) is a small, flexible
library that provides a simple interface for defining and accessing command
line arguments.

Use the commit of tag tclap-1-2-1-release-final.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../tclap/files/Makefile.am-disable-docs.patch     |   31 ++++++++++++++++++++
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb      |   14 +++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
new file mode 100644
index 0000000..358cbef
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
@@ -0,0 +1,31 @@
+From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Mon, 15 Apr 2013 16:28:37 +0800
+Subject: [PATCH] Makefile.am: disable docs
+
+Upstream-Status: Inappropriate [OE specific]
+
+docs need some generating tool (for example, doxygen) from host which may
+be not available. Disable it to avoid build issue.
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0a6ebc9..6b42f41 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ 
+ ACLOCAL_AMFLAGS = -I config
+ 
+-SUBDIRS = include examples docs tests msc config
++SUBDIRS = include examples tests msc config
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = $(PACKAGE).pc
+-- 
+1.7.5
+
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
new file mode 100644
index 0000000..c9fab52
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Templatized C++ Command Line Parser" 
+HOMEPAGE = "http://tclap.sourceforge.net/" 
+LICENSE = "MIT" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
+
+SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
+SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
+          file://Makefile.am-disable-docs.patch \
+" 
+
+S = "${WORKDIR}/git"
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5




