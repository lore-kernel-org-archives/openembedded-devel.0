Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe006.messaging.microsoft.com [216.32.180.16])
	by mail.openembedded.org (Postfix) with ESMTP id 7496961957
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:41:07 +0000 (UTC)
Received: from mail199-va3-R.bigfish.com (10.7.14.227) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Nov 2013 08:41:09 +0000
Received: from mail199-va3 (localhost [127.0.0.1])	by
	mail199-va3-R.bigfish.com (Postfix) with ESMTP id CCD5D2E0197	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:41:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail199-va3 (localhost.localdomain [127.0.0.1]) by mail199-va3
	(MessageSwitch) id 1383295267370071_20548;
	Fri,  1 Nov 2013 08:41:07 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.239])	by
	mail199-va3.bigfish.com (Postfix) with ESMTP id 4B9B72C0047	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 08:41:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 1 Nov 2013 08:41:07 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 1 Nov 2013 08:41:06 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rA18f3ES005034;	Fri, 1 Nov 2013 01:41:04 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2013 16:41:02 +0800
Message-ID: <1383295262-16391-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH v3 2/3 ] barnyard2: add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 08:41:08 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

	*Barnyard2 is a output system for Snort

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../barnyard2-1.8/barnyard2-cross-fix.patch        |   21 ++++++++++++++++++++
 .../barnyard2/barnyard2_1.8.bb                     |   18 +++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
 create mode 100644 meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb

diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
new file mode 100644
index 0000000..0e94598
--- /dev/null
+++ b/meta-networking/recipes-connectivity/barnyard2/barnyard2-1.8/barnyard2-cross-fix.patch
@@ -0,0 +1,21 @@
+Index: barnyard2-1.8/configure.in
+===================================================================
+--- barnyard2-1.8.orig/configure.in	2010-08-03 15:12:06.000000000 +0400
++++ barnyard2-1.8/configure.in	2010-08-03 15:13:46.000000000 +0400
+@@ -73,7 +73,6 @@
+     # libpcap doesn't even LOOK at the timeout you give it under Linux
+     AC_DEFINE([PCAP_TIMEOUT_IGNORED],[1],[Define if pcap timeout is ignored])
+     AC_SUBST(extra_incl)
+-    extra_incl="-I/usr/include/pcap"
+     ;;
+   *-hpux10*|*-hpux11*)
+     AC_DEFINE([HPUX],[1],[Define if HP-UX 10 or 11])
+@@ -230,7 +229,7 @@
+ # In case INADDR_NONE is not defined (like on Solaris)
+ have_inaddr_none="no"
+ AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
++AC_COMPILE_IFELSE(
+ [AC_LANG_PROGRAM(
+ [[
+ #include <sys/types.h>
diff --git a/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
new file mode 100644
index 0000000..14acdac
--- /dev/null
+++ b/meta-networking/recipes-connectivity/barnyard2/barnyard2_1.8.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Barnyard2 is a fork of the original barnyard project, designed specifically for Snort's new unified2 file format"
+HOMEPAGE = "http://www.securixlive.com/barnyard2/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "libpcap"
+
+SRC_URI = " \
+	http://www.securixlive.com/download/barnyard2/${BP}.tar.gz \
+	file://barnyard2-cross-fix.patch \
+	"
+SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
+SRC_URI[sha256sum] = "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-prelude --enable-gre --without-mysql"
+
+CONFFILES_${PN} = "${sysconfdir}/barnyard2.conf"
-- 
1.7.5.4



