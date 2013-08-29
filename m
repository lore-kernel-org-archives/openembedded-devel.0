Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4F56BD5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:45:22 +0000 (UTC)
Received: from mail91-tx2-R.bigfish.com (10.9.14.228) by
	TX2EHSOBE013.bigfish.com (10.9.40.33) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Aug 2013 06:45:21 +0000
Received: from mail91-tx2 (localhost [127.0.0.1])	by mail91-tx2-R.bigfish.com
	(Postfix) with ESMTP id 92280420086	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:45:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah186068h1954cbh8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail91-tx2 (localhost.localdomain [127.0.0.1]) by mail91-tx2
	(MessageSwitch) id 1377758719333130_27048;
	Thu, 29 Aug 2013 06:45:19 +0000 (UTC)
Received: from TX2EHSMHS024.bigfish.com (unknown [10.9.14.252])	by
	mail91-tx2.bigfish.com (Postfix) with ESMTP id 43E5B80041	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:45:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS024.bigfish.com
	(10.9.99.124) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 29 Aug 2013 06:45:18 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Thu, 29 Aug 2013 06:45:18 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7T6jFWR013633;	Wed, 28 Aug 2013 23:45:16 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Aug 2013 14:45:12 +0800
Message-ID: <1377758712-4916-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH V3 ] daq: add recipe
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
X-List-Received-Date: Thu, 29 Aug 2013 06:45:23 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *The dump DAQ test the various inline mode features
  *snort depends daq

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb      |   18 ++++++++++++++++++
 .../daq/files/disable-check-pcap-version.patch     |   19 +++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
 create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.patch

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
new file mode 100644
index 0000000..e3ddf09
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "The dump DAQ test the various inline mode features "
+HOMEPAGE = "http://www.snort.org"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
+
+
+DEPENDS = "libpcap libpcre "
+
+SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
+SRC_URI[sha256sum] = "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
+
+SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz\
+           file://disable-check-pcap-version.patch "
+
+inherit autotools
+
+
diff --git a/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.patch b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.patch
new file mode 100644
index 0000000..05f4031
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.patch
@@ -0,0 +1,19 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for libpcap version >= "1.0.0"... configure
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/configure.ac	2013-08-22 02:37:02.453253534 -0500
++++ b/configure.ac	2013-08-22 02:37:53.008254362 -0500
+@@ -179,7 +179,7 @@
+               [enable_pcap_module="$enableval"], [enable_pcap_module="$DEFAULT_ENABLE"])
+ if test "$enable_pcap_module" = yes; then
+     AC_CHECK_HEADER([pcap.h], [], [enable_pcap_module=no])
+-    AC_CHECK_PCAP_VER("1.0.0")
++    #AC_CHECK_PCAP_VER("1.0.0")
+     if test "$enable_pcap_module" = yes; then
+         STATIC_LIBS="${STATIC_LIBS} -lpcap"
+     fi
-- 
1.7.5.4



