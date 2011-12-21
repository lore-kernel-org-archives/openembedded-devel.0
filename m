Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFXt-0003G8-8q
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:20:57 +0100
Received: from mail101-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:39 +0000
Received: from mail101-ch1 (localhost [127.0.0.1])	by
	mail101-ch1-R.bigfish.com (Postfix) with ESMTP id 41AC86029C	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:09 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(z98bRzzz1202hzz8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail101-ch1 (localhost.localdomain [127.0.0.1]) by mail101-ch1
	(MessageSwitch) id 1324447149149967_26233;
	Wed, 21 Dec 2011 05:59:09 +0000 (UTC)
Received: from CH1EHSMHS017.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail101-ch1.bigfish.com (Postfix) with ESMTP id
	1F40740047 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS017.bigfish.com
	(10.43.70.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:39 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:46 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWb015654;
	Tue, 20 Dec 2011 23:58:45 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:44 +0800
Message-ID: <1324447304-4874-7-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 meta-oe 7/7] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Wed, 21 Dec 2011 06:20:57 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    xfsprogs provides XFS filesystem utilities.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   44 ++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
new file mode 100644
index 0000000..5b6a6f8
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "LGPL2.1"
+
+LIC_FILES_CHKSUM = "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"
+
+DEPENDS = "util-linux"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz"
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




