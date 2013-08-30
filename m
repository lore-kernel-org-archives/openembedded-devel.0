Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by mail.openembedded.org (Postfix) with ESMTP id 816956BD79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 10:21:34 +0000 (UTC)
Received: from mail211-va3-R.bigfish.com (10.7.14.225) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Aug 2013 10:21:34 +0000
Received: from mail211-va3 (localhost [127.0.0.1])	by
	mail211-va3-R.bigfish.com (Postfix) with ESMTP id 2F229C00185	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 10:21:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah186068h1954cbh8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail211-va3 (localhost.localdomain [127.0.0.1]) by mail211-va3
	(MessageSwitch) id 137785809297264_18220;
	Fri, 30 Aug 2013 10:21:32 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.249])	by
	mail211-va3.bigfish.com (Postfix) with ESMTP id 0B3BE40040	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 10:21:32 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 30 Aug 2013 10:21:29 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Fri, 30 Aug 2013 10:21:28 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7UALPx6014645;	Fri, 30 Aug 2013 03:21:26 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Aug 2013 18:21:24 +0800
Message-ID: <1377858084-31009-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH V4 ] daq: add recipe
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
X-List-Received-Date: Fri, 30 Aug 2013 10:21:34 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *The dump DAQ test the various inline mode features
   *snort depends daq

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   16 +++++++++++
 ...le-run-test-program-while-cross-compiling.patch |   29 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
 create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
new file mode 100644
index 0000000..4c1be44
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "The dump DAQ test the various inline mode features "
+HOMEPAGE = "http://www.snort.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
+
+PARALLEL_MAKE = ""
+
+DEPENDS = "libpcap libpcre "
+
+SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
+            file://disable-run-test-program-while-cross-compiling.patch "
+
+SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
+SRC_URI[sha256sum] = "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
+
+inherit autotools
diff --git a/meta-oe/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch b/meta-oe/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
new file mode 100644
index 0000000..12a6cba
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/files/disable-run-test-program-while-cross-compiling.patch
@@ -0,0 +1,29 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/m4/sf.m4old	2013-08-30 04:08:18.768409680 -0500
++++ b/m4/sf.m4	2013-08-30 04:09:24.591367890 -0500
+@@ -135,19 +135,6 @@
+         exit 1
+     fi
+     AC_MSG_CHECKING([for libpcap version >= $1])
+-    AC_RUN_IFELSE(
+-    [AC_LANG_PROGRAM(
+-    [[
+-    #include <pcap.h>
+-    #include <string.h>
+-    extern char pcap_version[];
+-    ]],
+-    [[
+-        if (strcmp(pcap_version, $1) < 0)
+-            return 1;
+-    ]])],
+-    [libpcap_version_1x="yes"],
+-    [libpcap_version_1x="no"])
+     if test "x$libpcap_version_1x" = "xno"; then
+         AC_MSG_RESULT(no)
+         echo
-- 
1.7.5.4



