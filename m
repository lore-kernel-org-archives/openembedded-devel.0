Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=VA3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUbj-0001sL-6D
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:01:39 +0100
Received: from mail136-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 09:39:31 +0000
Received: from mail136-va3 (localhost [127.0.0.1])	by
	mail136-va3-R.bigfish.com (Postfix) with ESMTP id 426A02C0056	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:40 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bhz2dh2a8h668h839hb79i62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail136-va3 (localhost.localdomain [127.0.0.1]) by mail136-va3
	(MessageSwitch) id 132402838074922_30832;
	Fri, 16 Dec 2011 09:39:40 +0000 (UTC)
Received: from VA3EHSMHS029.bigfish.com (unknown [10.7.14.242])	by
	mail136-va3.bigfish.com (Postfix) with ESMTP id 0AF611003AD	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS029.bigfish.com
	(10.7.99.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 09:39:27 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 16 Dec 2011 03:39:27 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG9dDjm008853;
	Fri, 16 Dec 2011 03:39:25 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 17:42:00 +0800
Message-ID: <1324028520-16474-8-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324028520-16474-1-git-send-email-b19537@freescale.com>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe v2 8/8] xfsprogs: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:01:39 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    xfsprogs provides XFS filesystem utilities.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
new file mode 100644
index 0000000..d150d4f
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "XFS Filesystem Utilities"
+HOMEPAGE = "http://oss.sgi.com/projects/xfs"
+SECTION = "base"
+LICENSE = "LGPL2.1"
+LIC_FILES_CHKSUM = "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"
+
+SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz"
+SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4"
+SRC_URI[sha256sum] = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa"
+
+inherit autotools
+
+PARALLEL_MAKE = ""
+
+FILES_${PN}-dev += "${base_libdir}/libhandle.la \
+                    ${base_libdir}/libhandle.so"
+
+do_configure () {
+	export DEBUG="-DNDEBUG"
+	oe_runconf
+}
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
+EXTRA_OECONF = "--enable-gettext=no"
+LIBTOOL = "${HOST_SYS}-libtool"
+EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+DEPENDS = "util-linux"
-- 
1.7.0.4




