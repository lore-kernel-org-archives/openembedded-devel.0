Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1USJEG-0000S5-OC
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 05:40:17 +0200
Received: from mail185-ch1-R.bigfish.com (10.43.68.231) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Wed, 17 Apr 2013 02:52:37 +0000
Received: from mail185-ch1 (localhost [127.0.0.1])	by
	mail185-ch1-R.bigfish.com (Postfix) with ESMTP id 631ED24049C	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:52:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail185-ch1 (localhost.localdomain [127.0.0.1]) by mail185-ch1
	(MessageSwitch) id 1366167155587035_10396;
	Wed, 17 Apr 2013 02:52:35 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail185-ch1.bigfish.com (Postfix) with ESMTP id
	82BE52201EA	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 02:52:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 17 Apr 2013 02:52:35 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 17 Apr 2013 02:52:34 +0000
Received: from sbuilder137.localdomain.localdomain (mars.ap.freescale.net
	[10.192.208.137])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3H2qW8b030198;	Tue, 16 Apr 2013 19:52:33 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2013 10:52:31 +0800
Message-ID: <1366167151-12043-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH v5] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 17 Apr 2013 03:40:19 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

TCLAP (Templatized C++ Command Line Parser Library ) is a small, flexible
library that provides a simple interface for defining and accessing command
line arguments.

Use the commit of tag tclap-1-2-1-release-final.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../tclap/tclap/Makefile.am-disable-docs.patch     |   31 ++++++++++++++++++++
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb      |   14 +++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
new file mode 100644
index 0000000..358cbef
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
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
index 0000000..7075664
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
+    file://Makefile.am-disable-docs.patch \
+" 
+
+S = "${WORKDIR}/git"
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5




