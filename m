Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0250.outbound.messaging.microsoft.com [213.199.154.250])
	by mail.openembedded.org (Postfix) with ESMTP id A016460FED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:07:56 +0000 (UTC)
Received: from mail93-db9-R.bigfish.com (10.174.16.252) by
	DB9EHSOBE019.bigfish.com (10.174.14.82) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 04:07:57 +0000
Received: from mail93-db9 (localhost [127.0.0.1])	by mail93-db9-R.bigfish.com
	(Postfix) with ESMTP id 2D8F41C0056	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:07:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah1de097h186068h8275bh8275dhz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail93-db9 (localhost.localdomain [127.0.0.1]) by mail93-db9
	(MessageSwitch) id 1378786075138293_24323;
	Tue, 10 Sep 2013 04:07:55 +0000 (UTC)
Received: from DB9EHSMHS018.bigfish.com (unknown [10.174.16.233])	by
	mail93-db9.bigfish.com (Postfix) with ESMTP id 1433C3E0060	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:07:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS018.bigfish.com
	(10.174.14.28) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 04:07:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 10 Sep 2013 04:07:49 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8A47kLQ022509;	Mon, 9 Sep 2013 21:07:47 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2013 12:07:43 +0800
Message-ID: <1378786063-12132-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] tclap: update SRC_URI
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
X-List-Received-Date: Tue, 10 Sep 2013 04:07:57 -0000
Content-Type: text/plain

    *fix unfetchable SRC_URI

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../tclap/tclap/Makefile.am-disable-docs.patch     |   31 --------------------
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb      |    8 ++--
 2 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch

diff --git a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch b/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
deleted file mode 100644
index 358cbef..0000000
--- a/meta-oe/recipes-devtools/tclap/tclap/Makefile.am-disable-docs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Mon, 15 Apr 2013 16:28:37 +0800
-Subject: [PATCH] Makefile.am: disable docs
-
-Upstream-Status: Inappropriate [OE specific]
-
-docs need some generating tool (for example, doxygen) from host which may
-be not available. Disable it to avoid build issue.
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
----
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0a6ebc9..6b42f41 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- 
- ACLOCAL_AMFLAGS = -I config
- 
--SUBDIRS = include examples docs tests msc config
-+SUBDIRS = include examples tests msc config
- 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = $(PACKAGE).pc
--- 
-1.7.5
-
diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
index 7075664..c3385ab 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://tclap.sourceforge.net/"
 LICENSE = "MIT" 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
 
-SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
-SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
-    file://Makefile.am-disable-docs.patch \
+SRC_URI = "http://distfiles.exherbo.org/distfiles/tclap-${PV}.tar.gz \
 " 
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "eb0521d029bf3b1cc0dcaa7e42abf82a"
+SRC_URI[sha256sum] = "9f9f0fe3719e8a89d79b6ca30cf2d16620fba3db5b9610f9b51dd2cd033deebb"
+
 inherit autotools
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



