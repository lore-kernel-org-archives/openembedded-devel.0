Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4E761F47
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:44:37 +0000 (UTC)
Received: from mail82-co9-R.bigfish.com (10.236.132.246) by
	CO9EHSOBE004.bigfish.com (10.236.130.67) with Microsoft SMTP Server id
	14.1.225.22; Mon, 26 Aug 2013 07:44:37 +0000
Received: from mail82-co9 (localhost [127.0.0.1])	by mail82-co9-R.bigfish.com
	(Postfix) with ESMTP id 1636E1A02DA	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:44:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah186068h1954cbh8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail82-co9 (localhost.localdomain [127.0.0.1]) by mail82-co9
	(MessageSwitch) id 1377503074916061_30456;
	Mon, 26 Aug 2013 07:44:34 +0000 (UTC)
Received: from CO9EHSMHS024.bigfish.com (unknown [10.236.132.233])	by
	mail82-co9.bigfish.com (Postfix) with ESMTP id D23B238005C	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:44:34 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS024.bigfish.com
	(10.236.130.34) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 26 Aug 2013 07:44:34 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Mon, 26 Aug 2013 07:44:33 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7Q7iPod015001;	Mon, 26 Aug 2013 00:44:27 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2013 15:44:19 +0800
Message-ID: <1377503059-30534-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH V2 ] daq: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2013 07:44:38 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *The dump DAQ test the various inline mode features
   *snort depends daq

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-connectivity/daq/daq_2.0.0.bb      |   17 +++++++++++++++++
 .../daq/files/disable-check-pcap-version.patch     |   19 +++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/daq/daq_2.0.0.bb
 create mode 100644 meta-oe/recipes-connectivity/daq/files/disable-check-pcap-version.patch

diff --git a/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb b/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb
new file mode 100644
index 0000000..0a71894
--- /dev/null
+++ b/meta-oe/recipes-connectivity/daq/daq_2.0.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "The dump DAQ test the various inline mode features "
+HOMEPAGE = "http://www.snort.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9ce51a65dd738dc1ae631d8b21c40e0"
+
+
+DEPENDS = "libpcap libpcre "
+
+SRC_URI[md5sum] = "a00855a153647df76d47f1ea454f74ae"
+SRC_URI[sha256sum] = "fbafc8e362a96fcadc69731f91203ef90845507aae0a4774d5c2825e9d2c1c38"
+
+SRC_URI = "http://fossies.org/linux/misc/daq-2.0.0.tar.gz\
+           file://disable-check-pcap-version.patch "
+
+
+inherit autotools
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



