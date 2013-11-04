Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0186.outbound.messaging.microsoft.com [213.199.154.186])
	by mail.openembedded.org (Postfix) with ESMTP id 7671A6D3C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:43:43 +0000 (UTC)
Received: from mail90-db8-R.bigfish.com (10.174.8.225) by
	DB8EHSOBE028.bigfish.com (10.174.4.91) with Microsoft SMTP Server id
	14.1.225.22; Mon, 4 Nov 2013 02:43:44 +0000
Received: from mail90-db8 (localhost [127.0.0.1])	by mail90-db8-R.bigfish.com
	(Postfix) with ESMTP id 746BE480153	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:43:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail90-db8 (localhost.localdomain [127.0.0.1]) by mail90-db8
	(MessageSwitch) id 1383533021583254_12428;
	Mon,  4 Nov 2013 02:43:41 +0000 (UTC)
Received: from DB8EHSMHS017.bigfish.com (unknown [10.174.8.234])	by
	mail90-db8.bigfish.com (Postfix) with ESMTP id 814D91C0040	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:43:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS017.bigfish.com
	(10.174.4.27) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 4 Nov 2013 02:43:41 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 4 Nov 2013 02:43:40 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id rA42hb3v010480;	Sun, 3 Nov 2013 19:43:39 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2013 10:43:36 +0800
Message-ID: <1383533016-31244-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH v3 2/3] barnyard2: add recipe
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
X-List-Received-Date: Mon, 04 Nov 2013 02:43:44 -0000
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



