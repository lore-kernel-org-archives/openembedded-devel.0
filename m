Return-Path: <Lauren.Post@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mail.openembedded.org (Postfix) with ESMTP id 23AB36FA4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:47:10 +0000 (UTC)
Received: from mail138-co9-R.bigfish.com (10.236.132.231) by
	CO9EHSOBE032.bigfish.com (10.236.130.95) with Microsoft SMTP Server id
	14.1.225.22; Fri, 21 Mar 2014 16:47:10 +0000
Received: from mail138-co9 (localhost [127.0.0.1])	by
	mail138-co9-R.bigfish.com (Postfix) with ESMTP id 8D7986011A;
	Fri, 21 Mar 2014 16:47:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail138-co9 (localhost.localdomain [127.0.0.1]) by mail138-co9
	(MessageSwitch) id 1395420428843225_26460;
	Fri, 21 Mar 2014 16:47:08 +0000 (UTC)
Received: from CO9EHSMHS012.bigfish.com (unknown [10.236.132.246])	by
	mail138-co9.bigfish.com (Postfix) with ESMTP id B9E91380051;
	Fri, 21 Mar 2014 16:47:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS012.bigfish.com
	(10.236.130.22) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 21 Mar 2014 16:47:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 21 Mar 2014 16:47:07 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s2LGl5s6013424;
	Fri, 21 Mar 2014 09:47:07 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Mar 2014 11:35:17 -0500
Message-ID: <1395419717-32210-2-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1395419717-32210-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395419717-32210-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] glcompbench: Create 2012.08 version
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
X-List-Received-Date: Fri, 21 Mar 2014 16:47:11 -0000
Content-Type: text/plain

glcompbench is a benchmark tool for GL(ES)2 based
compositing operations

Signed-off-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

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
index 0000000..fe12f03
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -0,0 +1,14 @@
+SUMMARY = "GL Compositing Benchmark"
+DESCRIPTION = "A benchmark for GL(ES)2 based compositing operations"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+DEPENDS += "virtual/egl virtual/libgl virtual/egl virtual/libgles1 virtual/libgles2 virtual/libx11 "
+
+inherit pkgconfig waf
+
+SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
+           file://glbench-compile-fix.patch"
+
+SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
+SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
-- 
1.7.9.5



