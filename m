Return-Path: <Lauren.Post@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe001.messaging.microsoft.com [216.32.181.181])
	by mail.openembedded.org (Postfix) with ESMTP id 04A4C6F62C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:57 +0000 (UTC)
Received: from mail23-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 21:37:58 +0000
Received: from mail23-ch1 (localhost [127.0.0.1])	by mail23-ch1-R.bigfish.com
	(Postfix) with ESMTP id 322103E03B1	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail23-ch1 (localhost.localdomain [127.0.0.1]) by mail23-ch1
	(MessageSwitch) id 1394228275879119_27409;
	Fri,  7 Mar 2014 21:37:55 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail23-ch1.bigfish.com (Postfix) with ESMTP id
	C6D8120009B;	Fri,  7 Mar 2014 21:37:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 21:37:55 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 21:37:54 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27LbrwH002056;
	Fri, 7 Mar 2014 14:37:54 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:26:12 -0600
Message-ID: <1394227575-27897-4-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 4/7] glcompbench: Create 2012.08 version
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
X-List-Received-Date: Fri, 07 Mar 2014 21:37:58 -0000
Content-Type: text/plain

glcompbench is a benchmark tool for GL(ES)2 based
compositing operations

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../glcompbench/glbench-compile-fix.patch          |   35 ++++++++++++++++++++
 .../glcompbench/glcompbench_2012.08.bb             |   14 ++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
 create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
new file mode 100644
index 0000000..374a6cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
@@ -0,0 +1,35 @@
+From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
+From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
+Date: Tue, 5 Nov 2013 11:03:04 -0600
+Subject: [PATCH] to make compilable
+
+Upstream Status: Inappropriate [workaround]
+
+Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
+---
+ src/composite-test-simple-blur.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/composite-test-simple-blur.cc b/src/composite-test-simple-blur.cc
+index 170ad64..d7f77cf 100644
+--- a/src/composite-test-simple-blur.cc
++++ b/src/composite-test-simple-blur.cc
+@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
+ 
+ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
+ {
++#if 0
+     for (BlurWindowMapType::iterator winIt = priv_->windowMap.begin();
+          winIt != priv_->windowMap.end();
+          winIt++)
+@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
+         RenderWindowBlur* ro = winIt->second;
+         delete ro;
+     }
++#endif
+     delete priv_;
+ }
+ 
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
new file mode 100644
index 0000000..1adcc02
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -0,0 +1,14 @@
+SUMMARY = "GL Compositing Benchmark"
+DESCRIPTION = "A benchmark for GL(ES)2 based compositing operations"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+DEPENDS += "virtual/egl virtual/libgl virtual/libgal-x11 virtual/egl virtual/libgles1 virtual/libgles2 "
+
+inherit pkgconfig waf
+
+SRC_URI = "https://launchpad.net/glcompbench/trunk/2012.08/+download/glcompbench-2012.08.tar.gz \
+           file://glbench-compile-fix.patch"
+
+SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
+SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
-- 
1.7.9.5



