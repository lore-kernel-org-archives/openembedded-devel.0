Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rdyfa-0002Ee-2l
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 07:31:54 +0100
Received: from mail136-ch1-R.bigfish.com (10.43.68.251) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Dec 2011 06:24:34 +0000
Received: from mail136-ch1 (localhost [127.0.0.1])	by
	mail136-ch1-R.bigfish.com (Postfix) with ESMTP id C233A2202E9	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 06:25:13 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(z98bRz936eKzz1202hzz8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail136-ch1 (localhost.localdomain [127.0.0.1]) by mail136-ch1
	(MessageSwitch) id 1324621511653241_30339;
	Fri, 23 Dec 2011 06:25:11 +0000 (UTC)
Received: from CH1EHSMHS003.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail136-ch1.bigfish.com (Postfix) with ESMTP id
	9038D340042	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 06:25:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS003.bigfish.com
	(10.43.70.3) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Dec 2011 06:24:31 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 23 Dec 2011 00:24:42 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBN6Oe80013415;
	Fri, 23 Dec 2011 00:24:41 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Dec 2011 14:28:00 +0800
Message-ID: <1324621680-32025-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v4 meta-oe] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Fri, 23 Dec 2011 06:31:54 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    xfsprogs provides XFS filesystem utilities.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 ...-uid-gid-instead-of-actual-name-for-chown.patch |   32 ++++++++++++++
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   45 ++++++++++++++++++++
 2 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
new file mode 100644
index 0000000..0238d11
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/use-uid-gid-instead-of-actual-name-for-chown.patch
@@ -0,0 +1,32 @@
+diff -urN a/include/install-sh b/include/install-sh
+--- a/include/install-sh	2011-12-23 00:16:19.111481779 -0600
++++ b/include/install-sh	2011-12-23 00:11:20.368198711 -0600
+@@ -105,10 +105,10 @@
+    c)
+ 	;;
+    g)
+-	GROUP=$OPTARG
++	GROUP=`id -g $OPTARG`
+ 	;;
+    o)
+-	OWNER=$OPTARG
++	OWNER=`id -u $OPTARG`
+ 	;;
+    m)
+ 	DIRMODE=`expr $OPTARG`
+diff -urN a/install-sh b/install-sh
+--- a/install-sh	2011-12-23 00:15:34.733482017 -0600
++++ b/install-sh	2011-12-23 00:10:59.679500386 -0600
+@@ -105,10 +105,10 @@
+    c)
+ 	;;
+    g)
+-	GROUP=$OPTARG
++	GROUP=`id -g $OPTARG`
+ 	;;
+    o)
+-	OWNER=$OPTARG
++	OWNER=`id -u $OPTARG`
+ 	;;
+    m)
+ 	DIRMODE=`expr $OPTARG`
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
new file mode 100644
index 0000000..aa414a3
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "LGPL2.1"
+
+LIC_FILES_CHKSUM = "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"
+
+DEPENDS = "util-linux"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
+		file://use-uid-gid-instead-of-actual-name-for-chown.patch "
+SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4"
+SRC_URI[sha256sum] = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa"
+
+inherit autotools
+
+FILES_${PN}-dev += "${base_libdir}/libhandle.la \
+                    ${base_libdir}/libhandle.so"
+
+EXTRA_OECONF = "--enable-gettext=no"
+do_configure () {
+	export DEBUG="-DNDEBUG"
+	oe_runconf
+}
+
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+TARGET_CC_ARCH += "${LDFLAGS}"
+PARALLEL_MAKE = ""
+
+do_install () {
+	export DIST_ROOT=${D}
+	oe_runmake install
+	# needed for xfsdump
+	oe_runmake install-dev
+	# replace extra links to /usr/lib with relative links (otherwise autotools_prepackage_lamangler fails to read nonexistent link)
+	rm -f ${D}/${base_libdir}/libhandle.la
+	rm -f ${D}/${base_libdir}/libhandle.a
+	ln -s ../usr/lib/libhandle.la ${D}/${base_libdir}/libhandle.la
+	ln -s ../usr/lib/libhandle.a ${D}/${base_libdir}/libhandle.a
+
+	# and link from /usr/lib/libhandle.so to /lib/libhandle.so
+	rm -f ${D}/${libdir}/libhandle.so
+	ln -s ../../lib/libhandle.a ${D}/${libdir}/libhandle.so
+}
-- 
1.7.0.4




