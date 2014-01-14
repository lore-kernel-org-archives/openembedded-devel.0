Return-Path: <ting.liu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe003.messaging.microsoft.com [216.32.181.183])
	by mail.openembedded.org (Postfix) with ESMTP id 6B8486AE73
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:10:19 +0000 (UTC)
Received: from mail24-ch1-R.bigfish.com (10.43.68.243) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:10:19 +0000
Received: from mail24-ch1 (localhost [127.0.0.1])	by mail24-ch1-R.bigfish.com
	(Postfix) with ESMTP id 652603E0247	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:10:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail24-ch1 (localhost.localdomain [127.0.0.1]) by mail24-ch1
	(MessageSwitch) id 1389690617194432_25627;
	Tue, 14 Jan 2014 09:10:17 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail24-ch1.bigfish.com (Postfix) with ESMTP id
	20403440046;	Tue, 14 Jan 2014 09:10:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:10:14 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:10:14 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9AB0u003871;	Tue, 14 Jan 2014 02:10:12 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:10:09 +0800
Message-ID: <1389690610-4230-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 1/2] lmbench: use base_libdir instead of hardcoded /lib
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
X-List-Received-Date: Tue, 14 Jan 2014 09:10:20 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix the below QA warning when building 64bit target:
| WARNING: QA Issue: lmbench: Files/directories were installed but not
| shipped
| /usr/lib
| /usr/lib/libmbench.a

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../use-base_libdir-instead-of-hardcoded-lib.patch |   32 ++++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
new file mode 100644
index 0000000..3351ce8
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/use-base_libdir-instead-of-hardcoded-lib.patch
@@ -0,0 +1,32 @@
+From 0d09e31970616e09beb7f238c2b59bfc541148fb Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Fri, 22 Nov 2013 15:20:08 +0800
+Subject: [PATCH] use base_libdir instead of hardcoded /lib
+
+Upsteam Status: Inappropriate [configuration]
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ src/Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index c7a8c79..c7e4e3c 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -143,10 +143,10 @@ install-target:
+ 	if [ ! -d $(BASE) ]; then mkdir $(BASE); fi
+ 	if [ ! -d $(BASE)/bin ]; then mkdir $(BASE)/bin; fi
+ 	if [ ! -d $(BASE)/include ]; then mkdir $(BASE)/include; fi
+-	if [ ! -d $(BASE)/lib ]; then mkdir $(BASE)/lib; fi
++	if [ ! -d $(BASE)$(base_libdir) ]; then mkdir $(BASE)$(base_libdir); fi
+ 	cp $(EXES) $(BASE)/bin
+ 	cp $(INCS) $(BASE)/include
+-	cp $O/lmbench.a $(BASE)/lib/libmbench.a
++	cp $O/lmbench.a $(BASE)$(base_libdir)
+ 	cd ../doc; env MAKEFLAGS="$(MAKEFLAGS)" make CC="${CC}" OS="${OS}" BASE="$(BASE)" install
+ 
+ 
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index b4020d7..eb38f07 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://update-results-script.patch \
            file://obey-ranlib.patch \
            file://update-config-script.patch \ 
+           file://use-base_libdir-instead-of-hardcoded-lib.patch \ 
 "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
-- 
1.7.3.4



