Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UBN6j-0002cZ-Mj
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 11:22:30 +0100
Received: from mail65-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Mar 2013 09:50:59 +0000
Received: from mail65-ch1 (localhost [127.0.0.1])	by mail65-ch1-R.bigfish.com
	(Postfix) with ESMTP id 06C9714015E	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2013 09:50:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1155h)
Received: from mail65-ch1 (localhost.localdomain [127.0.0.1]) by mail65-ch1
	(MessageSwitch) id 1362131456760472_6422;
	Fri,  1 Mar 2013 09:50:56 +0000 (UTC)
Received: from CH1EHSMHS043.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.251])	by mail65-ch1.bigfish.com (Postfix) with ESMTP id
	B3A2F240421 for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2013 09:50:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS043.bigfish.com
	(10.43.69.252) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Mar 2013 09:50:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 1 Mar 2013 09:52:18 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r219ok81005582;	Fri, 1 Mar 2013 02:50:47 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Mar 2013 17:50:42 +0800
Message-ID: <1362131442-26879-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, Chunrong Guo <B40290@freescale.com>,
	B19537@freescale.com
Subject: [OE-core][PATCH] lmbench: update config script
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
X-List-Received-Date: Fri, 01 Mar 2013 10:22:30 -0000
Content-Type: text/plain

From: Chunrong Guo <b40290@freescale.com>

      *fix bug that can not find  CONFIG file
      |error: run ./results|./results: line 15: .: CONFIG.p2041rdb: file not found
      * update CONFIG file path

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../lmbench-3.0-a9/update-config-script.patch      |   12 ++++++++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
new file mode 100644
index 0000000..b46e09a
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-config-script.patch
@@ -0,0 +1,12 @@
+Upstream-Status: Pending
+Index: lmbench-3.0-a9/scripts/config
+===================================================================
+--- lmbench-3.0-a9/scripts/config	2000-01-31 18:29:31.000000000 -0600
++++ lmbench-3.0-a9/scripts/config	2013-03-01 00:19:41.032984315 -0600
+@@ -3,5 +3,5 @@
+ UNAME=`uname -n 2>/dev/null`
+ if [ X$UNAME = X ]
+ then	echo CONFIG
+-else	echo CONFIG.$UNAME
++else	echo ../scripts/CONFIG.$UNAME
+ fi
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 611013e..026b067 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -7,14 +7,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
 
 inherit autotools
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
 	   file://lmbench-run \
 	   file://rename-line-binary.patch \
 	   file://update-results-script.patch \
 	   file://obey-ranlib.patch \
-	   "
+	   file://update-config-script.patch \ 
+	  "
 SRC_URI[md5sum] = "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 
-- 
1.7.5.4




