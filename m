Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id 188666BD57
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:36:06 +0000 (UTC)
Received: from mail224-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE011.bigfish.com (10.7.40.61) with Microsoft SMTP Server id
	14.1.225.22; Wed, 4 Sep 2013 08:36:06 +0000
Received: from mail224-va3 (localhost [127.0.0.1])	by
	mail224-va3-R.bigfish.com (Postfix) with ESMTP id 5A63A700094	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:36:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bh8275dhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail224-va3 (localhost.localdomain [127.0.0.1]) by mail224-va3
	(MessageSwitch) id 1378283764102159_6502;
	Wed,  4 Sep 2013 08:36:04 +0000 (UTC)
Received: from VA3EHSMHS001.bigfish.com (unknown [10.7.14.245])	by
	mail224-va3.bigfish.com (Postfix) with ESMTP id 0A8BE740040	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:36:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS001.bigfish.com
	(10.7.99.11) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 4 Sep 2013 08:36:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 4 Sep 2013 08:36:02 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r848a2FA028163; Wed, 4 Sep 2013 01:36:02 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Sep 2013 03:36:02 -0500
Message-ID: <1378283762-22627-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] netperf: add large files support
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
X-List-Received-Date: Wed, 04 Sep 2013 08:36:06 -0000
Content-Type: text/plain

From: Zhenhua Luo <zhenhua.luo@freescale.com>

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../0001-netperf2.6-large-files-support.patch      |   31 ++++++++++++++++++++
 .../recipes-support/netperf/netperf_2.6.0.bb       |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-netperf2.6-large-files-support.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-netperf2.6-large-files-support.patch b/meta-networking/recipes-support/netperf/files/0001-netperf2.6-large-files-support.patch
new file mode 100644
index 0000000..b3132d7
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-netperf2.6-large-files-support.patch
@@ -0,0 +1,31 @@
+From 63f3adaa8f8ff6f4310b8b470f8ded8788cbae21 Mon Sep 17 00:00:00 2001
+From: Jianhua Xie <jianhua.xie@freescale.com>
+Date: Wed, 28 Aug 2013 15:47:49 +0800
+Subject: [PATCH] netperf2.6: large files support
+
+add netperf large files support, without this patch, netperf2.6 can only
+support smaller than 2GB files with TCP_SENDFILE item.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jianhua Xie <jianhua.xie@freescale.com>
+---
+ config.h.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/config.h.in b/config.h.in
+index b9f3dcf..70ed534 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -399,7 +399,7 @@
+ #undef WANT_XTI
+ 
+ /* Number of bits in a file offset, on hosts where this is settable. */
+-#undef _FILE_OFFSET_BITS
++#define _FILE_OFFSET_BITS 64
+ 
+ /* Define for large files, on AIX-style hosts. */
+ #undef _LARGE_FILES
+-- 
+1.7.0.4
+
diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index eda7859..f9ca9c9 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -10,6 +10,7 @@ PR = "r0"
 SRC_URI="ftp://ftp.netperf.org/netperf/netperf-${PV}.tar.bz2 \
          file://cpu_set.patch \
          file://vfork.patch \
+         file://0001-netperf2.6-large-files-support.patch \
          file://init"
 SRC_URI[md5sum] = "9654ffdfd4c4f2c93ce3733cd9ed9236"
 SRC_URI[sha256sum] = "cd8dac710d4273d29f70e8dbd09353a6362ac58a11926e0822233c0cb230323a"
-- 
1.7.9.7



